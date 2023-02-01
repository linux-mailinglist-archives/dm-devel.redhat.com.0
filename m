Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 750C7686AFC
	for <lists+dm-devel@lfdr.de>; Wed,  1 Feb 2023 16:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675267083;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jyUhr6EpnL23sJkEYgHup+mSlSAqPLwApZqq0o5Go/o=;
	b=QCRyRvWrk0qHpAia/OIjXAbQMgK4wVCNMPah4MUp4wT6D1SAGKKYBRa/HdS/Cd7iXO/24u
	s17MzMvIE1mbNJ+sAII9CAPL08MBxBpmL9k7o4+MJC3ITP56kk7dufo22M33d9TNSoxIIk
	pIZJ6Ut7dKE1zeTM8iqQL0wTZj0spKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-SDe79_LUNQ-zDcJWtwM8Dg-1; Wed, 01 Feb 2023 10:57:09 -0500
X-MC-Unique: SDe79_LUNQ-zDcJWtwM8Dg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34E27100DEA4;
	Wed,  1 Feb 2023 15:56:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 033792166B35;
	Wed,  1 Feb 2023 15:56:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C517919465B1;
	Wed,  1 Feb 2023 15:56:49 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 31A6019465B1
 for <dm-devel@listman.corp.redhat.com>; Wed,  1 Feb 2023 15:56:32 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 1E10B2166B34; Wed,  1 Feb 2023 15:56:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 003BF2166B33;
 Wed,  1 Feb 2023 15:56:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 311FuUnu008319;
 Wed, 1 Feb 2023 09:56:30 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 311FuUk7008318;
 Wed, 1 Feb 2023 09:56:30 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Feb 2023 09:56:25 -0600
Message-Id: <1675266989-8281-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Subject: [dm-devel] [PATCH v2 0/4] multipath: fix multipathd renaming issue
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a multipath device needs to be renamed and reloaded when multipathd
starts, it will only get reloaded. This can happen if the multipath
configuration is different between the initramfs and regular filesystem.
The only thing that can happen along with a rename is a force reload.

This patchset makes libmultipath also do all the other actions that are
compatible with a rename.

changes in v2 (as suggested by Martin Wilck)
0004: If the rename is impossible, multipath now checks for other
      actions, instead of always returning ACT_IMPOSSIBLE

Benjamin Marzinski (4):
  libmultipath: use select_reload_action in select_action
  libmultipath: select resize action even if reload is forced
  libmultipath: cleanup ACT_CREATE code in select_action
  libmultipath: keep renames from stopping other multipath actions

 libmultipath/configure.c | 107 +++++++++++++++++----------------------
 libmultipath/configure.h |   4 +-
 2 files changed, 49 insertions(+), 62 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

