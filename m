Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 9A79221163B
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 00:44:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593643445;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qdjcuBNpHRB8+5v1LoeeB6NsLfOqK4Ad5eOn+GHX5pc=;
	b=Y8V9f+MTr2qSu4qelrLIvJ6hHESKyssicezzyXDXpA7pOJQKpdW2i5BzCEJy4l5F+Halyv
	55j1bxLUdv4h7IGQSQNAjEQTATKbmw+icMC8sHgg1j2+OvRTyMcb2tjMBHuD37Xffrp6Us
	3zKJ21cbl5XfbeXX/Ug7kzpmYwYhdZ0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-rO5pAX2_MleHP2-Hj_IYag-1; Wed, 01 Jul 2020 18:42:56 -0400
X-MC-Unique: rO5pAX2_MleHP2-Hj_IYag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B07F27BAE;
	Wed,  1 Jul 2020 22:42:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 909F779226;
	Wed,  1 Jul 2020 22:42:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C75E6C9C6;
	Wed,  1 Jul 2020 22:42:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061Mdgg4020010 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 18:39:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57EA579226; Wed,  1 Jul 2020 22:39:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C3B179222;
	Wed,  1 Jul 2020 22:39:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 061Mdbvn006248; 
	Wed, 1 Jul 2020 17:39:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 061MdbEU006247;
	Wed, 1 Jul 2020 17:39:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Jul 2020 17:39:33 -0500
Message-Id: <1593643176-6206-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] libmultipath: fix sysfs dev_loss_tmo parsing
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dev_loss_tmo is a u32 value. However the kernel sysfs code prints it as
a signed integer. This means that if dev_loss_tmo is above INT_MAX, the
sysfs value will be a negative number. Parsing this was causing
sysfs_set_rport_tmo() to fail.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index ffec5162..6a45979a 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -583,7 +583,8 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 	struct udev_device *rport_dev = NULL;
 	char value[16], *eptr;
 	char rport_id[32];
-	unsigned long long tmo = 0;
+	long long ll_tmo;
+	unsigned int tmo = 0;
 	int ret;
 
 	sprintf(rport_id, "rport-%d:%d-%d",
@@ -607,13 +608,13 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 			"error %d", rport_id, -ret);
 		goto out;
 	}
-	tmo = strtoull(value, &eptr, 0);
-	if (value == eptr || tmo == ULLONG_MAX) {
+	ll_tmo = strtoll(value, &eptr, 0);
+	if (value == eptr || ll_tmo > UINT_MAX || ll_tmo < INT_MIN) {
 		condlog(0, "%s: Cannot parse dev_loss_tmo "
 			"attribute '%s'", rport_id, value);
 		goto out;
 	}
-
+	tmo = (unsigned int)ll_tmo;
 	/*
 	 * This is tricky.
 	 * dev_loss_tmo will be limited to 600 if fast_io_fail
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

