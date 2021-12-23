Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B5E47DD64
	for <lists+dm-devel@lfdr.de>; Thu, 23 Dec 2021 02:33:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1640223205;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G7O+Xez3r2I8owp6Znq+thjRs4dAp8EG4st8WURarDw=;
	b=Xes+PuLeMfwQZr0bUCe28o7oT72LErRPXk5YEkcopTDAoE967IMzGe8anInt6yxOm/ngbm
	g+9V2HjOwM3nleNEy87bK1GXMav8WXanHHNTJMTTG1wyBitk570dNDhMzXSrgagCHpItSs
	ngB3a38S5hFJHwWNxbKb0ujTGEc8T8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-MttJYJN0MoeTuXgZFkkvAQ-1; Wed, 22 Dec 2021 20:33:22 -0500
X-MC-Unique: MttJYJN0MoeTuXgZFkkvAQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 005DD92500;
	Thu, 23 Dec 2021 01:33:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3568F7FB9E;
	Thu, 23 Dec 2021 01:33:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E10914BB7C;
	Thu, 23 Dec 2021 01:32:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1BN1WitU009265 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 22 Dec 2021 20:32:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2025F104253B; Thu, 23 Dec 2021 01:32:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3936C10911B4;
	Thu, 23 Dec 2021 01:32:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1BN1Walp001718; 
	Wed, 22 Dec 2021 19:32:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1BN1WZcl001717;
	Wed, 22 Dec 2021 19:32:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 22 Dec 2021 19:32:32 -0600
Message-Id: <1640223155-1678-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 0/3] Don't enter recovery move over pending paths
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After commit 2e61b8fb, I started seeing multipath devices switching into
recovery mode briefly on startup.  They come back out shortly, so unless
no_path_retry is set very low, this won't be an issue, but multipathd
shouldn't enter recovery mode at all over pending paths.

Benjamin Marzinski (3):
  libmultipath: fix DI_NOIO pathinfo PATH_PENDING handling
  libmultipath: simplify out __set_no_path_retry()
  libmultipath: don't enter recovery mode with pending paths

 libmultipath/discovery.c          |  5 ++++-
 libmultipath/libmultipath.version |  2 +-
 libmultipath/structs_vec.c        | 13 ++++++-------
 libmultipath/structs_vec.h        |  3 +--
 4 files changed, 12 insertions(+), 11 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

