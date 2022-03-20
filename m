Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E23074E1DE6
	for <lists+dm-devel@lfdr.de>; Sun, 20 Mar 2022 22:13:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647810786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lq88HPUDkV3cWhpmFNAk3n49tbsjkCPB8xkLBLi6EfY=;
	b=bz8yW8E5HnIH53Sf8FJqG38ahkobjNRLZ+Wt4JUGAcDNfRaErcoa53TdQI4a0JEwSc7Rlw
	jBE7/NW+1hyyMJyHhKmdiNwGpGCR4M9h8jPNSyHBwMU7Gvv61Z8kXgGMnK2iIIWA4Z9jp5
	OkDqLTnsy2PJQuIGHJPWOPRnLu5g69w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-FUOrfgAYOvypmRtQmLgrAg-1; Sun, 20 Mar 2022 17:13:02 -0400
X-MC-Unique: FUOrfgAYOvypmRtQmLgrAg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E741C801585;
	Sun, 20 Mar 2022 21:12:59 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 951FB142B94E;
	Sun, 20 Mar 2022 21:12:50 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4DDF5195355F;
	Sun, 20 Mar 2022 21:12:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B8E5E19451F3
 for <dm-devel@listman.corp.redhat.com>; Sun, 20 Mar 2022 21:12:46 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 966C241D415; Sun, 20 Mar 2022 21:12:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DCB341D40F;
 Sun, 20 Mar 2022 21:12:46 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 22KLCkY5018443; Sun, 20 Mar 2022 17:12:46 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 22KLCk9T018439; Sun, 20 Mar 2022 17:12:46 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Sun, 20 Mar 2022 17:12:46 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2203201711500.18240@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH] dm-ioctl: log an error if the ioctl structure is
 corrupted
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Log an error if the ioctl structure is corrupted. This will help us triage
bugs when when userspace is passing invalid ioctl structure to the kernel.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-ioctl.c |   14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

Index: linux-dm/drivers/md/dm-ioctl.c
===================================================================
--- linux-dm.orig/drivers/md/dm-ioctl.c	2022-03-17 19:19:31.000000000 +0100
+++ linux-dm/drivers/md/dm-ioctl.c	2022-03-20 20:37:34.000000000 +0100
@@ -891,15 +891,21 @@ static struct hash_cell *__find_device_h
 	struct hash_cell *hc = NULL;
 
 	if (*param->uuid) {
-		if (*param->name || param->dev)
+		if (*param->name || param->dev) {
+			DMWARN("Invalid ioctl structure: uuid %s, name %s, dev %llx",
+				param->uuid, param->name, (unsigned long long)param->dev);
 			return NULL;
+		}
 
 		hc = __get_uuid_cell(param->uuid);
 		if (!hc)
 			return NULL;
 	} else if (*param->name) {
-		if (param->dev)
+		if (param->dev) {
+			DMWARN("Invalid ioctl structure: name %s, dev %llx",
+				param->name, (unsigned long long)param->dev);
 			return NULL;
+		}
 
 		hc = __get_name_cell(param->name);
 		if (!hc)
@@ -1851,8 +1857,10 @@ static int copy_params(struct dm_ioctl _
 	if (copy_from_user(param_kernel, user, minimum_data_size))
 		return -EFAULT;
 
-	if (param_kernel->data_size < minimum_data_size)
+	if (param_kernel->data_size < minimum_data_size) {
+		DMWARN("Invalid data size in the ioctl structure: %u", param_kernel->data_size);
 		return -EINVAL;
+	}
 
 	secure_data = param_kernel->flags & DM_SECURE_DATA_FLAG;
 
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

