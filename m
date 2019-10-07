Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 971FCCEB2C
	for <lists+dm-devel@lfdr.de>; Mon,  7 Oct 2019 19:55:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6E83110C0940;
	Mon,  7 Oct 2019 17:55:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72C28600C1;
	Mon,  7 Oct 2019 17:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F8344EDA6;
	Mon,  7 Oct 2019 17:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x97Ht2il001380 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Oct 2019 13:55:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1FDDD5EE1D; Mon,  7 Oct 2019 17:55:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx24.extmail.prod.ext.phx2.redhat.com
	[10.5.110.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 196A35D712
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 17:54:58 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7539A10CC1F4
	for <dm-devel@redhat.com>; Mon,  7 Oct 2019 17:54:57 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z9so16332382wrl.11
	for <dm-devel@redhat.com>; Mon, 07 Oct 2019 10:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XcS/ERwrb7T6YvVK6CMD0vT6ys/2CmD4Z2G4VmjOfiw=;
	b=y+0Yaliu0Vk3jKzsZ4uvwUvlfWCikxxvQaA4BFuvcbcGsH9e7J4fWHKglmdxsIB5Fi
	btcuf9jrvtaiQUCneF0LGDGN1dat1YgoXw66edowWDBZKaThTkf/vb8Ixi8O/zwdHraq
	vaeCTrfljsKSP+cAf82AAUpne9C/G33r8ytgNPnATQ6aWGW0vobsq24wk9ZgpioOdrFq
	+EreWC/Qqsy1zWcuuW0otar5Tl4U5GCKcjD116W8NLOtVz4BN+p6ZNwhnW3P0/SeVlM3
	5tctBuCsX/d4hbwlFDclsWGn0Xb6J/SP4AirzWOA+Z5GPAXImyOuPg3D1pd8qwMXuhmx
	rcmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XcS/ERwrb7T6YvVK6CMD0vT6ys/2CmD4Z2G4VmjOfiw=;
	b=K0nVe6G34fV0arnE7bRCV1JE6BkNBZ43VulJupsG8CAdSf1dFODLq+y7yBsR+KR8pT
	5/oOMUoezux2Sc5kWsqdv3TSYWr1uAhtHcOuu6UrohYECZtjwL0rHOp6SlkOStG6NmwJ
	kbZrukykzgNZO0xUh51DwXKjegcFDyUAbimx26xnc5q3keMBUeJYTkwtx4iTevoI6seb
	el6+F0reQAKZLdZfaxNUBMgzwkJMYkZMuKLmKNvwjkzDyeT2PHIWDfyAXUrGzp/wPVDv
	Bta+SziCyFU5RmekC20JUeJHS1wKKc30qw6Ssbtn+b2XY4nGmj2AA9avNQpt0pl0uQmv
	z8Bw==
X-Gm-Message-State: APjAAAXUwyw9524mlHNc0Mx2LRWCxB/ornnS8is1YOaFrmiNNV6aET+l
	7qf6wPGcKIWTZyg2uEW956hXqg==
X-Google-Smtp-Source: APXvYqyrYFivmJOS/8EosOBLa8DFu/m8CaZDQa2lowwygIQxRSjitjOjgPsAwUi0FGkw8cg0mUhWRw==
X-Received: by 2002:a5d:4f04:: with SMTP id c4mr23099249wru.98.1570470896127; 
	Mon, 07 Oct 2019 10:54:56 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id p5sm399227wmi.4.2019.10.07.10.54.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Oct 2019 10:54:55 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com,
	mpatocka@redhat.com
Date: Mon,  7 Oct 2019 20:54:41 +0300
Message-Id: <20191007175441.13328-1-ntsironis@arrikto.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.65]);
	Mon, 07 Oct 2019 17:54:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]);
	Mon, 07 Oct 2019 17:54:57 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.65
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH] dm clone: add bucket_lock_irq/bucket_unlock_irq
	helpers
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Mon, 07 Oct 2019 17:55:52 +0000 (UTC)

Introduce bucket_lock_irq() and bucket_unlock_irq() helpers and use them
in places where it is known that interrupts are enabled.

Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-target.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index f7d1070a4d40..b3d89072d21c 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -552,6 +552,12 @@ struct hash_table_bucket {
 #define bucket_unlock_irqrestore(bucket, flags) \
 	spin_unlock_irqrestore(&(bucket)->lock, flags)
 
+#define bucket_lock_irq(bucket) \
+	spin_lock_irq(&(bucket)->lock)
+
+#define bucket_unlock_irq(bucket) \
+	spin_unlock_irq(&(bucket)->lock)
+
 static int hash_table_init(struct clone *clone)
 {
 	unsigned int i, sz;
@@ -849,7 +855,6 @@ static void hydration_overwrite(struct dm_clone_region_hydration *hd, struct bio
  */
 static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 {
-	unsigned long flags;
 	unsigned long region_nr;
 	struct hash_table_bucket *bucket;
 	struct dm_clone_region_hydration *hd, *hd2;
@@ -857,19 +862,19 @@ static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 	region_nr = bio_to_region(clone, bio);
 	bucket = get_hash_table_bucket(clone, region_nr);
 
-	bucket_lock_irqsave(bucket, flags);
+	bucket_lock_irq(bucket);
 
 	hd = __hash_find(bucket, region_nr);
 	if (hd) {
 		/* Someone else is hydrating the region */
 		bio_list_add(&hd->deferred_bios, bio);
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		return;
 	}
 
 	if (dm_clone_is_region_hydrated(clone->cmd, region_nr)) {
 		/* The region has been hydrated */
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		issue_bio(clone, bio);
 		return;
 	}
@@ -878,16 +883,16 @@ static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 	 * We must allocate a hydration descriptor and start the hydration of
 	 * the corresponding region.
 	 */
-	bucket_unlock_irqrestore(bucket, flags);
+	bucket_unlock_irq(bucket);
 
 	hd = alloc_hydration(clone);
 	hydration_init(hd, region_nr);
 
-	bucket_lock_irqsave(bucket, flags);
+	bucket_lock_irq(bucket);
 
 	/* Check if the region has been hydrated in the meantime. */
 	if (dm_clone_is_region_hydrated(clone->cmd, region_nr)) {
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		free_hydration(hd);
 		issue_bio(clone, bio);
 		return;
@@ -897,7 +902,7 @@ static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 	if (hd2 != hd) {
 		/* Someone else started the region's hydration. */
 		bio_list_add(&hd2->deferred_bios, bio);
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		free_hydration(hd);
 		return;
 	}
@@ -909,7 +914,7 @@ static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 	 */
 	if (unlikely(get_clone_mode(clone) >= CM_READ_ONLY)) {
 		hlist_del(&hd->h);
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		free_hydration(hd);
 		bio_io_error(bio);
 		return;
@@ -923,11 +928,11 @@ static void hydrate_bio_region(struct clone *clone, struct bio *bio)
 	 * to the destination device.
 	 */
 	if (is_overwrite_bio(clone, bio)) {
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		hydration_overwrite(hd, bio);
 	} else {
 		bio_list_add(&hd->deferred_bios, bio);
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 		hydration_copy(hd, 1);
 	}
 }
@@ -994,7 +999,6 @@ static unsigned long __start_next_hydration(struct clone *clone,
 					    unsigned long offset,
 					    struct batch_info *batch)
 {
-	unsigned long flags;
 	struct hash_table_bucket *bucket;
 	struct dm_clone_region_hydration *hd;
 	unsigned long nr_regions = clone->nr_regions;
@@ -1008,13 +1012,13 @@ static unsigned long __start_next_hydration(struct clone *clone,
 			break;
 
 		bucket = get_hash_table_bucket(clone, offset);
-		bucket_lock_irqsave(bucket, flags);
+		bucket_lock_irq(bucket);
 
 		if (!dm_clone_is_region_hydrated(clone->cmd, offset) &&
 		    !__hash_find(bucket, offset)) {
 			hydration_init(hd, offset);
 			__insert_region_hydration(bucket, hd);
-			bucket_unlock_irqrestore(bucket, flags);
+			bucket_unlock_irq(bucket);
 
 			/* Batch hydration */
 			__batch_hydration(batch, hd);
@@ -1022,7 +1026,7 @@ static unsigned long __start_next_hydration(struct clone *clone,
 			return (offset + 1);
 		}
 
-		bucket_unlock_irqrestore(bucket, flags);
+		bucket_unlock_irq(bucket);
 
 	} while (++offset < nr_regions);
 
-- 
2.11.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
