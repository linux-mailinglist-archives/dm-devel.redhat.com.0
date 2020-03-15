Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 65AA9185FEA
	for <lists+dm-devel@lfdr.de>; Sun, 15 Mar 2020 22:06:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584306383;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CclvPbvMaS5Wc/WveVLDmhIJlGD/NdzAGbKxdqibvxg=;
	b=YGQnq8NQ3OwFPZLDcSEQXt+mkU/qMo8VRrPISzReNoi1HInSVEjlIxcv1LedTcyNygoMLc
	rNIBLpvseVOipUXETRv4FCXPVuk7nrMj0FIn/t2e4bUuVriQK3qzIhvi1NokHRJQ0ZNRd2
	c7u/Cy3vYKnHrYCEAu+kTrEym5IzgRI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-6ZrVdKxCOjq8kCnZyVpq2Q-1; Sun, 15 Mar 2020 17:06:20 -0400
X-MC-Unique: 6ZrVdKxCOjq8kCnZyVpq2Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B2731005510;
	Sun, 15 Mar 2020 21:06:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EEF475DA76;
	Sun, 15 Mar 2020 21:06:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3497886A3E;
	Sun, 15 Mar 2020 21:06:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02FL5vCo008179 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Mar 2020 17:05:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 829BC2166B2D; Sun, 15 Mar 2020 21:05:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7F1382166B2E
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B30B185A78F
	for <dm-devel@redhat.com>; Sun, 15 Mar 2020 21:05:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-129-8vaYCsu2Ny-HcrLDKVtuXA-1;
	Sun, 15 Mar 2020 17:05:50 -0400
X-MC-Unique: 8vaYCsu2Ny-HcrLDKVtuXA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 1B343AC51;
	Sun, 15 Mar 2020 21:05:49 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sun, 15 Mar 2020 22:05:17 +0100
Message-Id: <20200315210521.12109-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02FL5vCo008179
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 0/4] [PATCH 0/4] libmpathpersist allocation
	size fixes
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe,

We recently found a problem with mpathpersist using an allocation length
of > 8192 bytes for PERSISTENT RESERVE IN/OUT commands. This patch set
tries to fix it. The last patch would change the ABI for external programs,
it's optional.

(Christophe, to avoid misunderstanding:	This set is not meant to be included
in the upcoming merge).

Reviews and comments welcome.

Changes in v2:
 - 02/04: fix overflow calculation (Ben)
 - 04/04: improve commit description wrt ABI breakage

Martin Wilck (4):
  libmpathpersist: limit PRIN allocation length to 8192 bytes
  libmpathpersist: format_transportids(): avoid PROUT overflow
  libmpathpersist: mpath_format_readfullstatus(): use real buffer size
  libmpathpersist: ABI change: limit data-in/out size to 8192 bytes

 libmpathpersist/mpath_persist.h  | 15 ++++++++---
 libmpathpersist/mpath_pr_ioctl.c | 45 +++++++++++++++++++++++++++-----
 2 files changed, 50 insertions(+), 10 deletions(-)

--

2.25.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

