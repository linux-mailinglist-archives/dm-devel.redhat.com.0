Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 867DF1958A0
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 15:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585318134;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ETNbbzbM82+LgfEXl+7sAYw7F4QBRB0+CFCiDQtgmrY=;
	b=f0MowgwRnF1QL5rY9VPb7RSmsCLEq5XVBWXEzb4ydPVzIW9buWxcCqPD3ZPILhZNP0YCaP
	mJKy8pH9maqaP8ja35c0/3p2W1FvJZhmrxEaprePRpv+VX9dTokmiY/AruzrwqmJtQVYbt
	r/pR/UjfzSmOCtpfYBEOLuiyVckftOA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-kJK-G4isNj6wMYcr_NKoOg-1; Fri, 27 Mar 2020 10:08:52 -0400
X-MC-Unique: kJK-G4isNj6wMYcr_NKoOg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67B71084424;
	Fri, 27 Mar 2020 14:08:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761DE7E303;
	Fri, 27 Mar 2020 14:08:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 209B28A056;
	Fri, 27 Mar 2020 14:08:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02RE8cVD007658 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 10:08:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DADC2166B2B; Fri, 27 Mar 2020 14:08:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6957B2166B2D
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:08:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A91BE8F784F
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 14:08:35 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-256-ixfCwZhvPWarBiYpu8F0Gg-1; Fri, 27 Mar 2020 10:08:33 -0400
X-MC-Unique: ixfCwZhvPWarBiYpu8F0Gg-1
Received: by mail-pg1-f196.google.com with SMTP id b22so4619361pgb.6
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ry/vDCGBU/wmPZGsuooji6NeOvuL2s5fj0a6lMjpAfs=;
	b=GtSu1nWzqsr1JnLngKmZfh4OujxiON9+W1pGkMw1SeG7XDkn4Y/2P6jgbg1pNdJ8wm
	YZSDXzY/tCCIR9wxj6kNLuzydqqUh0KG87RdsulXVzLX2k9FNFqcsh6HpNCXWzTCpNA6
	coxoldduq5DA2igLm0nUcRH/ZTc1xysiff9LF5uducIABi42OcFhwLG8284gZ7Dc8N8S
	Kq2y1TlhlH9d1sIKm+5SlJ8ms6E7afoXv0ZcOtdEr/LFaAaBw6JPKimsMixLfGz7KOVz
	mjRGOEsuCPxPMw+qfieLj5GkHnZLlSGIa5VJpgC256nt0TDOVXGZNqmR0mJES5p4iMTt
	p+XA==
X-Gm-Message-State: ANhLgQ1bAqhc6QDlMpOXGubZDr85+737rYurvXHPlGyb8RYhajdhs99d
	vSYrE8AicLK8qBrEz9ce4ziAbFgH7VQ=
X-Google-Smtp-Source: ADFU+vuUfcaiTc+zdgbu2+m8dp3Tme9qGvg5ZhcUfnSRN0/+91ep3Qys7y91I7WrWNG66iuBrfva8g==
X-Received: by 2002:a63:5d60:: with SMTP id o32mr13663279pgm.126.1585317755063;
	Fri, 27 Mar 2020 07:02:35 -0700 (PDT)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l5sm3963399pgt.10.2020.03.27.07.02.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Mar 2020 07:02:33 -0700 (PDT)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: agk@redhat.com, snitzer@redhat.com, dm-devel@redhat.com
Date: Fri, 27 Mar 2020 16:01:08 +0200
Message-Id: <20200327140111.7798-2-ntsironis@arrikto.com>
In-Reply-To: <20200327140111.7798-1-ntsironis@arrikto.com>
References: <20200327140111.7798-1-ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02RE8cVD007658
X-loop: dm-devel@redhat.com
Cc: ntsironis@arrikto.com
Subject: [dm-devel] [PATCH 1/4] dm clone: Fix handling of partial region
	discards
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is a bug in the way dm-clone handles discards, which can lead to
discarding the wrong blocks or trying to discard blocks beyond the end
of the device.

This could lead to data corruption, if the destination device indeed
discards the underlying blocks, i.e., if the discard operation results
in the original contents of a block to be lost.

The root of the problem is the code that calculates the range of regions
covered by a discard request and decides which regions to discard.

Since dm-clone handles the device in units of regions, we don't discard
parts of a region, only whole regions.

The range is calculated as:

    rs = dm_sector_div_up(bio->bi_iter.bi_sector, clone->region_size);
    re = bio_end_sector(bio) >> clone->region_shift;

, where 'rs' is the first region to discard and (re - rs) is the number
of regions to discard.

The bug manifests when we try to discard part of a single region, i.e.,
when we try to discard a block with size < region_size, and the discard
request both starts at an offset with respect to the beginning of that
region and ends before the end of the region.

The root cause is the following comparison:

  if (rs == re)
    // skip discard and complete original bio immediately

, which doesn't take into account that 'rs' might be greater than 're'.

Thus, we then issue a discard request for the wrong blocks, instead of
skipping the discard all together.

Fix the check to also take into account the above case, so we don't end
up discarding the wrong blocks.

Also, add some range checks to dm_clone_set_region_hydrated() and
dm_clone_cond_set_range(), which update dm-clone's region bitmap.

Note that the aforementioned bug doesn't cause invalid memory accesses,
because dm_clone_is_range_hydrated() returns True for this case, so the
checks are just precautionary.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-metadata.c | 13 +++++++++++++
 drivers/md/dm-clone-target.c   | 43 ++++++++++++++++++++++++++++--------------
 2 files changed, 42 insertions(+), 14 deletions(-)

diff --git a/drivers/md/dm-clone-metadata.c b/drivers/md/dm-clone-metadata.c
index c05b12110456..199e7af00858 100644
--- a/drivers/md/dm-clone-metadata.c
+++ b/drivers/md/dm-clone-metadata.c
@@ -850,6 +850,12 @@ int dm_clone_set_region_hydrated(struct dm_clone_metadata *cmd, unsigned long re
 	struct dirty_map *dmap;
 	unsigned long word, flags;
 
+	if (unlikely(region_nr >= cmd->nr_regions)) {
+		DMERR("Region %lu out of range (total number of regions %lu)",
+		      region_nr, cmd->nr_regions);
+		return -ERANGE;
+	}
+
 	word = region_nr / BITS_PER_LONG;
 
 	spin_lock_irqsave(&cmd->bitmap_lock, flags);
@@ -879,6 +885,13 @@ int dm_clone_cond_set_range(struct dm_clone_metadata *cmd, unsigned long start,
 	struct dirty_map *dmap;
 	unsigned long word, region_nr;
 
+	if (unlikely(start >= cmd->nr_regions || (start + nr_regions) < start ||
+		     (start + nr_regions) > cmd->nr_regions)) {
+		DMERR("Invalid region range: start %lu, nr_regions %lu (total number of regions %lu)",
+		      start, nr_regions, cmd->nr_regions);
+		return -ERANGE;
+	}
+
 	spin_lock_irq(&cmd->bitmap_lock);
 
 	if (cmd->read_only) {
diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index d1e1b5b56b1b..022dddcad647 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -293,10 +293,17 @@ static inline unsigned long bio_to_region(struct clone *clone, struct bio *bio)
 
 /* Get the region range covered by the bio */
 static void bio_region_range(struct clone *clone, struct bio *bio,
-			     unsigned long *rs, unsigned long *re)
+			     unsigned long *rs, unsigned long *nr_regions)
 {
+	unsigned long end;
+
 	*rs = dm_sector_div_up(bio->bi_iter.bi_sector, clone->region_size);
-	*re = bio_end_sector(bio) >> clone->region_shift;
+	end = bio_end_sector(bio) >> clone->region_shift;
+
+	if (*rs >= end)
+		*nr_regions = 0;
+	else
+		*nr_regions = end - *rs;
 }
 
 /* Check whether a bio overwrites a region */
@@ -454,7 +461,7 @@ static void trim_bio(struct bio *bio, sector_t sector, unsigned int len)
 
 static void complete_discard_bio(struct clone *clone, struct bio *bio, bool success)
 {
-	unsigned long rs, re;
+	unsigned long rs, nr_regions;
 
 	/*
 	 * If the destination device supports discards, remap and trim the
@@ -463,9 +470,9 @@ static void complete_discard_bio(struct clone *clone, struct bio *bio, bool succ
 	 */
 	if (test_bit(DM_CLONE_DISCARD_PASSDOWN, &clone->flags) && success) {
 		remap_to_dest(clone, bio);
-		bio_region_range(clone, bio, &rs, &re);
+		bio_region_range(clone, bio, &rs, &nr_regions);
 		trim_bio(bio, rs << clone->region_shift,
-			 (re - rs) << clone->region_shift);
+			 nr_regions << clone->region_shift);
 		generic_make_request(bio);
 	} else
 		bio_endio(bio);
@@ -473,12 +480,21 @@ static void complete_discard_bio(struct clone *clone, struct bio *bio, bool succ
 
 static void process_discard_bio(struct clone *clone, struct bio *bio)
 {
-	unsigned long rs, re;
+	unsigned long rs, nr_regions;
 
-	bio_region_range(clone, bio, &rs, &re);
-	BUG_ON(re > clone->nr_regions);
+	bio_region_range(clone, bio, &rs, &nr_regions);
+	if (!nr_regions) {
+		bio_endio(bio);
+		return;
+	}
 
-	if (unlikely(rs == re)) {
+	if (WARN_ON(rs >= clone->nr_regions || (rs + nr_regions) < rs ||
+		    (rs + nr_regions) > clone->nr_regions)) {
+		DMERR("%s: Invalid range (%lu + %lu, total regions %lu) for discard (%llu + %u)",
+		      clone_device_name(clone), rs, nr_regions,
+		      clone->nr_regions,
+		      (unsigned long long)bio->bi_iter.bi_sector,
+		      bio_sectors(bio));
 		bio_endio(bio);
 		return;
 	}
@@ -487,7 +503,7 @@ static void process_discard_bio(struct clone *clone, struct bio *bio)
 	 * The covered regions are already hydrated so we just need to pass
 	 * down the discard.
 	 */
-	if (dm_clone_is_range_hydrated(clone->cmd, rs, re - rs)) {
+	if (dm_clone_is_range_hydrated(clone->cmd, rs, nr_regions)) {
 		complete_discard_bio(clone, bio, true);
 		return;
 	}
@@ -1169,7 +1185,7 @@ static void process_deferred_discards(struct clone *clone)
 	int r = -EPERM;
 	struct bio *bio;
 	struct blk_plug plug;
-	unsigned long rs, re;
+	unsigned long rs, nr_regions;
 	struct bio_list discards = BIO_EMPTY_LIST;
 
 	spin_lock_irq(&clone->lock);
@@ -1185,14 +1201,13 @@ static void process_deferred_discards(struct clone *clone)
 
 	/* Update the metadata */
 	bio_list_for_each(bio, &discards) {
-		bio_region_range(clone, bio, &rs, &re);
+		bio_region_range(clone, bio, &rs, &nr_regions);
 		/*
 		 * A discard request might cover regions that have been already
 		 * hydrated. There is no need to update the metadata for these
 		 * regions.
 		 */
-		r = dm_clone_cond_set_range(clone->cmd, rs, re - rs);
-
+		r = dm_clone_cond_set_range(clone->cmd, rs, nr_regions);
 		if (unlikely(r))
 			break;
 	}
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

