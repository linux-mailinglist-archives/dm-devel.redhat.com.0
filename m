Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 608A27B1386
	for <lists+dm-devel@lfdr.de>; Thu, 28 Sep 2023 09:05:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695884743;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jOGvS+Fv4WTGrDUh2e5zwoW2mdyJHU0mXUTL4vZrKzM=;
	b=TD0sFTrjIWBYeqh85CPBgbr6uL0HFsnVbpw4lWjoGwKT0hI1NMdBlDyHWozoUpIOPC22aQ
	38No/MiQN+hG7AaXM93Zlrj2WZ1zPTKEhf+UUWQ2xiwST1SRBfOosxXTGA0p4Z8iuLx6V7
	QwZ3K4qnEWq3nzRzJlvQhoYUJbA07Dk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-363-ueYsN2zJNDOK0amnGfRJpA-1; Thu, 28 Sep 2023 03:05:39 -0400
X-MC-Unique: ueYsN2zJNDOK0amnGfRJpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 515361875044;
	Thu, 28 Sep 2023 07:05:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 92A76C185F0;
	Thu, 28 Sep 2023 07:05:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 05A161946A4E;
	Thu, 28 Sep 2023 07:05:34 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C2F941946588
 for <dm-devel@listman.corp.redhat.com>; Thu, 28 Sep 2023 06:22:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id B66AB1005B96; Thu, 28 Sep 2023 06:22:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF18910EE402
 for <dm-devel@redhat.com>; Thu, 28 Sep 2023 06:22:15 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-delivery-1.mimecast.com [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2E1C63C100B1
 for <dm-devel@redhat.com>; Thu, 28 Sep 2023 06:22:15 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-160-3TaZQVraMAWroUQ2iHCmxg-1; Thu, 28 Sep 2023 02:22:12 -0400
X-MC-Unique: 3TaZQVraMAWroUQ2iHCmxg-1
Received: from mail02.huawei.com (unknown [172.30.67.143])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Rx3Kn03VYz4f3mJ1;
 Thu, 28 Sep 2023 14:22:05 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgAnvdyCGxVl3v1WBg--.22861S28;
 Thu, 28 Sep 2023 14:22:07 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: xni@redhat.com, agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com,
 song@kernel.org
Date: Thu, 28 Sep 2023 14:15:42 +0800
Message-Id: <20230928061543.1845742-25-yukuai1@huaweicloud.com>
In-Reply-To: <20230928061543.1845742-1-yukuai1@huaweicloud.com>
References: <20230928061543.1845742-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgAnvdyCGxVl3v1WBg--.22861S28
X-Coremail-Antispam: 1UD129KBjvJXoWxtr1kKrWfXF1rWFWxXw43Jrb_yoW7Gw4fp3
 yIqFZakr4UJFZ0qr4UJa4DWa45Xw1jkFWqyrW3Wa4fC3Wakw45Gr1rXryrXryvka9Yvr4D
 Jw1Fva1UZF18WFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUP214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
 xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
 M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
 v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
 F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
 IY04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAF
 wI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc4
 0Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AK
 xVW8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JV
 WxJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbmZ
 X7UUUUU==
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH -next v3 24/25] md: remove old apis to suspend
 the array
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
Cc: yi.zhang@huawei.com, yangerkun@huawei.com, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, yukuai1@huaweicloud.com, yukuai3@huawei.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huaweicloud.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yu Kuai <yukuai3@huawei.com>

Now that mddev_suspend() and mddev_resume() is not used anywhere, remove
them, and remove 'MD_ALLOW_SB_UPDATE' and 'MD_UPDATING_SB' as well.

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/md/md.c | 82 ++-----------------------------------------------
 drivers/md/md.h |  8 -----
 2 files changed, 3 insertions(+), 87 deletions(-)

diff --git a/drivers/md/md.c b/drivers/md/md.c
index a3b62c6c5332..271d3f336026 100644
--- a/drivers/md/md.c
+++ b/drivers/md/md.c
@@ -418,74 +418,10 @@ static void md_submit_bio(struct bio *bio)
 	md_handle_request(mddev, bio);
 }
 
-/* mddev_suspend makes sure no new requests are submitted
- * to the device, and that any requests that have been submitted
- * are completely handled.
- * Once mddev_detach() is called and completes, the module will be
- * completely unused.
+/*
+ * Make sure no new requests are submitted to the device, and any requests that
+ * have been submitted are completely handled.
  */
-void mddev_suspend(struct mddev *mddev)
-{
-	struct md_thread *thread = rcu_dereference_protected(mddev->thread,
-			lockdep_is_held(&mddev->reconfig_mutex));
-
-	WARN_ON_ONCE(thread && current == thread->tsk);
-
-	/* can't concurrent with __mddev_suspend() and __mddev_resume() */
-	mutex_lock(&mddev->suspend_mutex);
-	if (mddev->suspended++) {
-		mutex_unlock(&mddev->suspend_mutex);
-		return;
-	}
-
-	wake_up(&mddev->sb_wait);
-	set_bit(MD_ALLOW_SB_UPDATE, &mddev->flags);
-	percpu_ref_kill(&mddev->active_io);
-
-	/*
-	 * TODO: cleanup 'pers->prepare_suspend after all callers are replaced
-	 * by __mddev_suspend().
-	 */
-	if (mddev->pers && mddev->pers->prepare_suspend)
-		mddev->pers->prepare_suspend(mddev);
-
-	wait_event(mddev->sb_wait, percpu_ref_is_zero(&mddev->active_io));
-	clear_bit_unlock(MD_ALLOW_SB_UPDATE, &mddev->flags);
-	wait_event(mddev->sb_wait, !test_bit(MD_UPDATING_SB, &mddev->flags));
-
-	del_timer_sync(&mddev->safemode_timer);
-	/* restrict memory reclaim I/O during raid array is suspend */
-	mddev->noio_flag = memalloc_noio_save();
-
-	mutex_unlock(&mddev->suspend_mutex);
-}
-EXPORT_SYMBOL_GPL(mddev_suspend);
-
-void mddev_resume(struct mddev *mddev)
-{
-	lockdep_assert_held(&mddev->reconfig_mutex);
-
-	/* can't concurrent with __mddev_suspend() and __mddev_resume() */
-	mutex_lock(&mddev->suspend_mutex);
-	if (--mddev->suspended) {
-		mutex_unlock(&mddev->suspend_mutex);
-		return;
-	}
-
-	/* entred the memalloc scope from mddev_suspend() */
-	memalloc_noio_restore(mddev->noio_flag);
-
-	percpu_ref_resurrect(&mddev->active_io);
-	wake_up(&mddev->sb_wait);
-
-	set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
-	md_wakeup_thread(mddev->thread);
-	md_wakeup_thread(mddev->sync_thread); /* possibly kick off a reshape */
-
-	mutex_unlock(&mddev->suspend_mutex);
-}
-EXPORT_SYMBOL_GPL(mddev_resume);
-
 int __mddev_suspend(struct mddev *mddev, bool interruptible)
 {
 	int err = 0;
@@ -9500,18 +9436,6 @@ static void md_start_sync(struct work_struct *ws)
  */
 void md_check_recovery(struct mddev *mddev)
 {
-	if (test_bit(MD_ALLOW_SB_UPDATE, &mddev->flags) && mddev->sb_flags) {
-		/* Write superblock - thread that called mddev_suspend()
-		 * holds reconfig_mutex for us.
-		 */
-		set_bit(MD_UPDATING_SB, &mddev->flags);
-		smp_mb__after_atomic();
-		if (test_bit(MD_ALLOW_SB_UPDATE, &mddev->flags))
-			md_update_sb(mddev, 0);
-		clear_bit_unlock(MD_UPDATING_SB, &mddev->flags);
-		wake_up(&mddev->sb_wait);
-	}
-
 	if (READ_ONCE(mddev->suspended))
 		return;
 
diff --git a/drivers/md/md.h b/drivers/md/md.h
index 63b4c393b1ee..4c5f3f032656 100644
--- a/drivers/md/md.h
+++ b/drivers/md/md.h
@@ -248,10 +248,6 @@ struct md_cluster_info;
  *			    become failed.
  * @MD_HAS_PPL:  The raid array has PPL feature set.
  * @MD_HAS_MULTIPLE_PPLS: The raid array has multiple PPLs feature set.
- * @MD_ALLOW_SB_UPDATE: md_check_recovery is allowed to update the metadata
- *			 without taking reconfig_mutex.
- * @MD_UPDATING_SB: md_check_recovery is updating the metadata without
- *		     explicitly holding reconfig_mutex.
  * @MD_NOT_READY: do_md_run() is active, so 'array_state', ust not report that
  *		   array is ready yet.
  * @MD_BROKEN: This is used to stop writes and mark array as failed.
@@ -268,8 +264,6 @@ enum mddev_flags {
 	MD_FAILFAST_SUPPORTED,
 	MD_HAS_PPL,
 	MD_HAS_MULTIPLE_PPLS,
-	MD_ALLOW_SB_UPDATE,
-	MD_UPDATING_SB,
 	MD_NOT_READY,
 	MD_BROKEN,
 	MD_DELETED,
@@ -810,8 +804,6 @@ extern int md_rdev_init(struct md_rdev *rdev);
 extern void md_rdev_clear(struct md_rdev *rdev);
 
 extern void md_handle_request(struct mddev *mddev, struct bio *bio);
-extern void mddev_suspend(struct mddev *mddev);
-extern void mddev_resume(struct mddev *mddev);
 extern int __mddev_suspend(struct mddev *mddev, bool interruptible);
 extern void __mddev_resume(struct mddev *mddev);
 
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

