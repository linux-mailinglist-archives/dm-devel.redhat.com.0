Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF0778A426
	for <lists+dm-devel@lfdr.de>; Mon, 28 Aug 2023 04:05:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693188312;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gg/nKLeI2UeExFKT5ztvYYr/UXjlU99R2X9hUmCTmVs=;
	b=SoMelpniKOKgzd+kofDDd+4J0bXMy1VdtcIHdYiolTBJ360AXqb79I1qxnG6KWX3CtHL3S
	vfcntjAjUTQLEP/dnPMI+F5JofbSiALngzep3YzznCyAbc1F2Fm9X+TKV2bF75uo1V8THV
	NwW35lSznD30Qr4xCCBR8NoMDIn5ROA=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-gmn9UiOpOhKgYH610ErEPw-1; Sun, 27 Aug 2023 22:05:10 -0400
X-MC-Unique: gmn9UiOpOhKgYH610ErEPw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B99883C0DDAC;
	Mon, 28 Aug 2023 02:05:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7B39A40282C;
	Mon, 28 Aug 2023 02:05:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7657E1946A66;
	Mon, 28 Aug 2023 02:05:03 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EC4E819465A8
 for <dm-devel@listman.corp.redhat.com>; Mon, 28 Aug 2023 02:04:59 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D9CB52026D2A; Mon, 28 Aug 2023 02:04:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D25A52026D76
 for <dm-devel@redhat.com>; Mon, 28 Aug 2023 02:04:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B90E91C07587
 for <dm-devel@redhat.com>; Mon, 28 Aug 2023 02:04:59 +0000 (UTC)
Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com
 [45.249.212.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-556-r4tXnXRiOxK8qn5WyYdZog-1; Sun, 27 Aug 2023 22:04:57 -0400
X-MC-Unique: r4tXnXRiOxK8qn5WyYdZog-1
Received: from mail02.huawei.com (unknown [172.30.67.169])
 by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4RYv5J1P6Xz4f3knx;
 Mon, 28 Aug 2023 10:04:52 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.104.67])
 by APP4 (Coremail) with SMTP id gCh0CgAnBai7AOxk9qcCBw--.25880S21;
 Mon, 28 Aug 2023 10:04:52 +0800 (CST)
From: Yu Kuai <yukuai1@huaweicloud.com>
To: agk@redhat.com, snitzer@kernel.org, dm-devel@redhat.com, song@kernel.org,
 xni@redhat.com
Date: Mon, 28 Aug 2023 10:00:10 +0800
Message-Id: <20230828020021.2489641-18-yukuai1@huaweicloud.com>
In-Reply-To: <20230828020021.2489641-1-yukuai1@huaweicloud.com>
References: <20230828020021.2489641-1-yukuai1@huaweicloud.com>
MIME-Version: 1.0
X-CM-TRANSID: gCh0CgAnBai7AOxk9qcCBw--.25880S21
X-Coremail-Antispam: 1UD129KBjvJXoWxWFykZr18Cry7tr1kGFWfZrb_yoW5Xr4Dpw
 s0gFsrXr4UWF9xu34DZa1kWFyrK3yUKrWkKryxW39Yva47Gr4kurWfJw45ZFy7G34FyFs7
 t3y5J34kZFWvqrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
 kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
 z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
 4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq
 3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
 IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
 M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
 kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
 14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
 kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjxv20xvEc7CjxVAF
 wI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQ
 SdkUUUUU=
X-CM-SenderInfo: 51xn3trlr6x35dzhxuhorxvhhfrp/
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH -next v2 17/28] md/raid5: replace suspend with
 quiesce() callback
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: huaweicloud.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yu Kuai <yukuai3@huawei.com>

raid5 is the only personality to suspend array in check_reshape() and
start_reshape() callback, suspend and quiesce() callback can both wait
for all normal io to be done, and prevent new io to be dispatched, the
difference is that suspend is implemented in common layer, and quiesce()
callback is implemented in raid5.

In order to cleanup all the usage of mddev_suspend(), the new apis
__mddev_suspend() need to be called before 'reconfig_mutex' is held,
and it's not good to affect all the personalities in common layer just
for raid5. Hence replace suspend with quiesce() callaback, prepare to
reomove all the users of mddev_suspend().

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/md/raid5.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index e6b8c0145648..d6de084a85e5 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -70,6 +70,8 @@ MODULE_PARM_DESC(devices_handle_discard_safely,
 		 "Set to Y if all devices in each array reliably return zeroes on reads from discarded regions");
 static struct workqueue_struct *raid5_wq;
 
+static void raid5_quiesce(struct mddev *mddev, int quiesce);
+
 static inline struct hlist_head *stripe_hash(struct r5conf *conf, sector_t sect)
 {
 	int hash = (sect >> RAID5_STRIPE_SHIFT(conf)) & HASH_MASK;
@@ -2492,15 +2494,12 @@ static int resize_chunks(struct r5conf *conf, int new_disks, int new_sectors)
 	unsigned long cpu;
 	int err = 0;
 
-	/*
-	 * Never shrink. And mddev_suspend() could deadlock if this is called
-	 * from raid5d. In that case, scribble_disks and scribble_sectors
-	 * should equal to new_disks and new_sectors
-	 */
+	/* Never shrink. */
 	if (conf->scribble_disks >= new_disks &&
 	    conf->scribble_sectors >= new_sectors)
 		return 0;
-	mddev_suspend(conf->mddev);
+
+	raid5_quiesce(conf->mddev, true);
 	cpus_read_lock();
 
 	for_each_present_cpu(cpu) {
@@ -2514,7 +2513,8 @@ static int resize_chunks(struct r5conf *conf, int new_disks, int new_sectors)
 	}
 
 	cpus_read_unlock();
-	mddev_resume(conf->mddev);
+	raid5_quiesce(conf->mddev, false);
+
 	if (!err) {
 		conf->scribble_disks = new_disks;
 		conf->scribble_sectors = new_sectors;
@@ -8551,8 +8551,8 @@ static int raid5_start_reshape(struct mddev *mddev)
 	 * the reshape wasn't running - like Discard or Read - have
 	 * completed.
 	 */
-	mddev_suspend(mddev);
-	mddev_resume(mddev);
+	raid5_quiesce(mddev, true);
+	raid5_quiesce(mddev, false);
 
 	/* Add some new drives, as many as will fit.
 	 * We know there are enough to make the newly sized array work.
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

