Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3E69EF42
	for <lists+dm-devel@lfdr.de>; Wed, 22 Feb 2023 08:24:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677050649;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5m9djaL+DZghW6NHF35W3mAWLW2T9t454pxjDIHQUyQ=;
	b=iXngmAku4DkJ9FIgrXjPwb7KoXJUzqULa/pke0PTMN44GSoC0HV7NZddL/cYeZ7dFapPkS
	cMmtcScb2EF4WyiJXMOyZvP7aWnn4TFgnPMky2UIMYSCCrNZi3Ou6ZVF/sSCAhuLQPTDmw
	4bL0k1ne6gjkwkn4ARgPd0N0Wn5l7nI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-IAU9l8XLOAuZpZezTUwKxg-1; Wed, 22 Feb 2023 02:24:08 -0500
X-MC-Unique: IAU9l8XLOAuZpZezTUwKxg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9FD0B3804061;
	Wed, 22 Feb 2023 07:24:05 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 96979C15BA0;
	Wed, 22 Feb 2023 07:24:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D902519465BA;
	Wed, 22 Feb 2023 07:23:59 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id DA6271946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 22 Feb 2023 07:23:58 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id BAC98404CD85; Wed, 22 Feb 2023 07:23:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B30AF404CD84
 for <dm-devel@redhat.com>; Wed, 22 Feb 2023 07:23:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 38BD81C0419C
 for <dm-devel@redhat.com>; Wed, 22 Feb 2023 07:23:58 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com
 [45.249.212.188]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-6cYPIoYHOcidXYUgGGy8Mw-1; Wed, 22 Feb 2023 02:23:56 -0500
X-MC-Unique: 6cYPIoYHOcidXYUgGGy8Mw-1
Received: from kwepemi500022.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4PM6YB18YLzRsRf;
 Wed, 22 Feb 2023 15:02:38 +0800 (CST)
Received: from localhost.localdomain (10.175.127.227) by
 kwepemi500022.china.huawei.com (7.221.188.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.17; Wed, 22 Feb 2023 15:05:21 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@kernel.org>, <agk@redhat.com>, <jefflexu@linux.alibaba.com>,
 <dm-devel@redhat.com>
Date: Wed, 22 Feb 2023 15:28:48 +0800
Message-ID: <20230222072848.3942767-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemi500022.china.huawei.com (7.221.188.64)
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH] dm-crypt: reexport sysfs of kcryptd workqueue
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
Cc: yukuai3@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

'a2b8b2d97567 ("dm crypt: export sysfs of kcryptd workqueue")' give us
idea to set specific CPU or limit max_active crypt work. However sysfs
will report a warnning and fail 'cryptsetup refresh test' since the
reload will alloc workqueue with same sysfs name, and we temporarily
revert this feature to fix the problem.

What we actually should do is give a unique name once we try reload
table, we can use ida now.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/md/dm-crypt.c | 28 +++++++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 755a01d72cdb..f0b8cb4364a1 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -46,6 +46,8 @@
 
 #define DM_MSG_PREFIX "crypt"
 
+static DEFINE_IDA(crypt_queue_ida);
+
 /*
  * context holding the current state of a multi-part conversion
  */
@@ -179,6 +181,7 @@ struct crypt_config {
 		struct crypto_aead **tfms_aead;
 	} cipher_tfm;
 	unsigned tfms_count;
+	int crypt_queue_id;
 	unsigned long cipher_flags;
 
 	/*
@@ -2708,6 +2711,9 @@ static void crypt_dtr(struct dm_target *ti)
 	if (cc->crypt_queue)
 		destroy_workqueue(cc->crypt_queue);
 
+	if (cc->crypt_queue_id)
+		ida_free(&crypt_queue_ida, cc->crypt_queue_id);
+
 	crypt_free_tfms(cc);
 
 	bioset_exit(&cc->bs);
@@ -3344,12 +3350,24 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	if (test_bit(DM_CRYPT_SAME_CPU, &cc->flags))
-		cc->crypt_queue = alloc_workqueue("kcryptd/%s", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
+		cc->crypt_queue = alloc_workqueue("kcryptd-%s", WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM,
 						  1, devname);
-	else
-		cc->crypt_queue = alloc_workqueue("kcryptd/%s",
-						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM | WQ_UNBOUND,
-						  num_online_cpus(), devname);
+	else {
+		int id = ida_alloc_min(&crypt_queue_ida, 1, GFP_KERNEL);
+
+		if (id < 0) {
+			ti->error = "Couldn't get kcryptd queue id";
+			ret = id;
+			goto bad;
+		}
+
+		cc->crypt_queue_id = id;
+		cc->crypt_queue = alloc_workqueue("kcryptd-%s-%d",
+						  WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM |
+						  WQ_UNBOUND | WQ_SYSFS,
+						  num_online_cpus(), devname, id);
+	}
+
 	if (!cc->crypt_queue) {
 		ti->error = "Couldn't create kcryptd queue";
 		goto bad;
-- 
2.31.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

