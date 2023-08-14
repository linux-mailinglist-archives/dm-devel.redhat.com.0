Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 340F877BAED
	for <lists+dm-devel@lfdr.de>; Mon, 14 Aug 2023 16:06:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692021996;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=nY9XDfpvWAWfMPOCPwd97dnJv2xqvgCD95bgkBDw22s=;
	b=NLJjBOawvmVFptCQQZWV8YhOprLo/37M3z8C+UPO6qixV8gkG3929j32vM0qzDP6ulXFXC
	PvdZ++ZE3gUkjxRUgZXbjii+rze+2CQThZu3eEMa5eWdS0ZGNytR6Yr5MqPDmT7+YE/Bce
	vlJOTJVdT0GZltZxHd9WPzRK/n/J4uU=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-59-dS01lKJSM1W1cb7IWyC10w-1; Mon, 14 Aug 2023 10:06:33 -0400
X-MC-Unique: dS01lKJSM1W1cb7IWyC10w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63FE52A5954E;
	Mon, 14 Aug 2023 14:06:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5768240C206F;
	Mon, 14 Aug 2023 14:06:22 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8B18519465A0;
	Mon, 14 Aug 2023 14:05:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 60F791946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 14 Aug 2023 14:05:55 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EFB4140D283D; Mon, 14 Aug 2023 14:05:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.redhat.com (unknown [10.39.192.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7998540D2839;
 Mon, 14 Aug 2023 14:05:54 +0000 (UTC)
From: heinzm@redhat.com
To: dm-devel@redhat.com
Date: Mon, 14 Aug 2023 16:05:53 +0200
Message-ID: <be1b9883fdc1e91f0b05d2092c7179f4331c18a1.1692021777.git.heinzm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH] dm raid: writebehind for raid1 fails to apply
 and is falsely set
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
Cc: msnitzer@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Heinz Mauelshagen <heinzm@redhat.com>

Call chain md_run() -> md_bitmap_create() in the target's constructor reads the bitmap
superblock thus overwriting any set rs->md.bitmap_info.max_write_behind.  In order to
make such set writebehind value persistent, save/restore its value around the md_run() call.

As the MD bitmap code uses the writebehind numeral as the maximum number of delayed writes
to any writemostly component device(s) in a RAID1 array, avoid falsely dividing it by 2 and
correct comment accordingly.

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
---
 drivers/md/dm-raid.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index becdb689190e..32d55210ea0c 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -1111,7 +1111,7 @@ static int validate_raid_redundancy(struct raid_set *rs)
  *    [min_recovery_rate <kB/sec/disk>]	Throttle RAID initialization
  *    [max_recovery_rate <kB/sec/disk>]	Throttle RAID initialization
  *    [write_mostly <idx>]		Indicate a write mostly drive via index
- *    [max_write_behind <sectors>]	See '-write-behind=' (man mdadm)
+ *    [max_write_behind <#writes>]	See '--write-behind=' (man mdadm)
  *    [stripe_cache <sectors>]		Stripe cache size for higher RAIDs
  *    [region_size <sectors>]		Defines granularity of bitmap
  *    [journal_dev <dev>]		raid4/5/6 journaling deviice
@@ -1349,16 +1349,13 @@ static int parse_raid_params(struct raid_set *rs, struct dm_arg_set *as,
 				return -EINVAL;
 			}
 
-			/*
-			 * In device-mapper, we specify things in sectors, but
-			 * MD records this value in kB
-			 */
-			if (value < 0 || value / 2 > COUNTER_MAX) {
+			/* Check for MD maximum.  */
+			if (!__within_range(value, 0, COUNTER_MAX)) {
 				rs->ti->error = "Max write-behind limit out of range";
 				return -EINVAL;
 			}
 
-			rs->md.bitmap_info.max_write_behind = value / 2;
+			rs->md.bitmap_info.max_write_behind = value;
 		} else if (!strcasecmp(key, dm_raid_arg_name_by_flag(CTR_FLAG_DAEMON_SLEEP))) {
 			if (test_and_set_bit(__CTR_FLAG_DAEMON_SLEEP, &rs->ctr_flags)) {
 				rs->ti->error = "Only one daemon_sleep argument pair allowed";
@@ -2997,6 +2994,7 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bool resize = false;
 	struct raid_type *rt;
 	unsigned int num_raid_params, num_raid_devs;
+	unsigned long max_write_behind;
 	sector_t sb_array_sectors, rdev_sectors, reshape_sectors;
 	struct raid_set *rs = NULL;
 	const char *arg;
@@ -3238,6 +3236,10 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	/* Keep array frozen until resume. */
 	set_bit(MD_RECOVERY_FROZEN, &rs->md.recovery);
 
+	/* Memorize max_write_behind as it does not stick in md_bitmap_create() */
+	if (test_bit(__CTR_FLAG_MAX_WRITE_BEHIND, &rs->ctr_flags))
+		max_write_behind = rs->md.bitmap_info.max_write_behind;
+
 	/* Has to be held on running the array */
 	mddev_lock_nointr(&rs->md);
 	r = md_run(&rs->md);
@@ -3248,6 +3250,10 @@ static int raid_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 		goto bad;
 	}
 
+	/* Now define max_write_behind. */
+	if (test_bit(__CTR_FLAG_MAX_WRITE_BEHIND, &rs->ctr_flags))
+		rs->md.bitmap_info.max_write_behind = max_write_behind;
+
 	r = md_start(&rs->md);
 	if (r) {
 		ti->error = "Failed to start raid array";
-- 
2.41.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

