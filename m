Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5123B6F317F
	for <lists+dm-devel@lfdr.de>; Mon,  1 May 2023 15:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682947301;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tIyKNVU5SZawWiVTWleT/f6ab+3FkplvojD3Usjm+ao=;
	b=GERedrNPkRRP9GUemchswI17DYg6tq1GDtPlMig8MdFpxsuiRS4a5FSYsQlPijwRdCePx9
	5hnuOR0DpT7ryo5dTFbGhCBq03JhgPguvNtOdvZH9R7QuyYY6nRoAprj4uq5+AGQMKVyS4
	k7vPgsaJnplh3h92YP3ob9eaiD0pIgU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-283-gfWGudGjMfa9Y1pVTVJnfw-1; Mon, 01 May 2023 09:21:24 -0400
X-MC-Unique: gfWGudGjMfa9Y1pVTVJnfw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5137585530F;
	Mon,  1 May 2023 13:20:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 388B040C6E68;
	Mon,  1 May 2023 13:20:10 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id EF80219465A8;
	Mon,  1 May 2023 13:20:09 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 43BA91946587
 for <dm-devel@listman.corp.redhat.com>; Mon,  1 May 2023 13:20:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 3088F2027046; Mon,  1 May 2023 13:20:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 236EA2027043;
 Mon,  1 May 2023 13:20:08 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 341DK8kI009351; Mon, 1 May 2023 09:20:08 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 341DK8R9009347; Mon, 1 May 2023 09:20:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 1 May 2023 09:20:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.21.2305010919480.8207@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH 3/3] dm flakey: introduce the random_read_corrupt
 and random_write_corrupt options
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The random_read_corrupt and random_write_corrupt options corrupt random
byte in a bio with a given probability. The corruptions only happen in the
"down" interval.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 Documentation/admin-guide/device-mapper/dm-flakey.rst |   10 +
 drivers/md/dm-flakey.c                                |  118 ++++++++++++++----
 2 files changed, 108 insertions(+), 20 deletions(-)

Index: linux-2.6/drivers/md/dm-flakey.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-flakey.c
+++ linux-2.6/drivers/md/dm-flakey.c
@@ -16,6 +16,8 @@
 
 #define DM_MSG_PREFIX "flakey"
 
+#define PROBABILITY_BASE	1000000000
+
 #define all_corrupt_bio_flags_match(bio, fc)	\
 	(((bio)->bi_opf & (fc)->corrupt_bio_flags) == (fc)->corrupt_bio_flags)
 
@@ -34,6 +36,8 @@ struct flakey_c {
 	unsigned int corrupt_bio_rw;
 	unsigned int corrupt_bio_value;
 	blk_opf_t corrupt_bio_flags;
+	unsigned int random_read_corrupt;
+	unsigned int random_write_corrupt;
 };
 
 enum feature_flag_bits {
@@ -54,10 +58,11 @@ static int parse_features(struct dm_arg_
 	const char *arg_name;
 
 	static const struct dm_arg _args[] = {
-		{0, 7, "Invalid number of feature args"},
+		{0, 11, "Invalid number of feature args"},
 		{1, UINT_MAX, "Invalid corrupt bio byte"},
 		{0, 255, "Invalid corrupt value to write into bio byte (0-255)"},
 		{0, UINT_MAX, "Invalid corrupt bio flags mask"},
+		{0, PROBABILITY_BASE, "Invalid random corrupt argument"},
 	};
 
 	/* No feature arguments supplied. */
@@ -170,6 +175,32 @@ static int parse_features(struct dm_arg_
 			continue;
 		}
 
+		if (!strcasecmp(arg_name, "random_read_corrupt")) {
+			if (!argc) {
+				ti->error = "Feature random_read_corrupt requires a parameter";
+				return -EINVAL;
+			}
+			r = dm_read_arg(_args + 4, as, &fc->random_read_corrupt, &ti->error);
+			if (r)
+				return r;
+			argc--;
+
+			continue;
+		}
+
+		if (!strcasecmp(arg_name, "random_write_corrupt")) {
+			if (!argc) {
+				ti->error = "Feature random_write_corrupt requires a parameter";
+				return -EINVAL;
+			}
+			r = dm_read_arg(_args + 4, as, &fc->random_write_corrupt, &ti->error);
+			if (r)
+				return r;
+			argc--;
+
+			continue;
+		}
+
 		ti->error = "Unrecognised flakey feature requested";
 		return -EINVAL;
 	}
@@ -184,7 +215,8 @@ static int parse_features(struct dm_arg_
 	}
 
 	if (!fc->corrupt_bio_byte && !test_bit(ERROR_READS, &fc->flags) &&
-	    !test_bit(DROP_WRITES, &fc->flags) && !test_bit(ERROR_WRITES, &fc->flags)) {
+	    !test_bit(DROP_WRITES, &fc->flags) && !test_bit(ERROR_WRITES, &fc->flags) &&
+	    !fc->random_read_corrupt && !fc->random_write_corrupt) {
 		set_bit(ERROR_WRITES, &fc->flags);
 		set_bit(ERROR_READS, &fc->flags);
 	}
@@ -306,28 +338,23 @@ static void flakey_map_bio(struct dm_tar
 	bio->bi_iter.bi_sector = flakey_map_sector(ti, bio->bi_iter.bi_sector);
 }
 
-static void corrupt_bio_data(struct bio *bio, struct flakey_c *fc)
+static void corrupt_bio_common(struct bio *bio, unsigned int corrupt_bio_byte, unsigned char corrupt_bio_value)
 {
-	unsigned int corrupt_bio_byte = fc->corrupt_bio_byte - 1;
-
 	struct bvec_iter iter;
 	struct bio_vec bvec;
 
-	if (!bio_has_data(bio))
-		return;
-
 	/*
 	 * Overwrite the Nth byte of the bio's data, on whichever page
 	 * it falls.
 	 */
 	bio_for_each_segment(bvec, bio, iter) {
 		if (bio_iter_len(bio, iter) > corrupt_bio_byte) {
-			char *segment = bvec_kmap_local(&bvec);
-			segment[corrupt_bio_byte] = fc->corrupt_bio_value;
+			unsigned char *segment = bvec_kmap_local(&bvec);
+			segment[corrupt_bio_byte] = corrupt_bio_value;
 			kunmap_local(segment);
 			DMDEBUG("Corrupting data bio=%p by writing %u to byte %u "
 				"(rw=%c bi_opf=%u bi_sector=%llu size=%u)\n",
-				bio, fc->corrupt_bio_value, fc->corrupt_bio_byte,
+				bio, corrupt_bio_value, corrupt_bio_byte,
 				(bio_data_dir(bio) == WRITE) ? 'w' : 'r', bio->bi_opf,
 				(unsigned long long)bio->bi_iter.bi_sector, bio->bi_iter.bi_size);
 			break;
@@ -336,6 +363,30 @@ static void corrupt_bio_data(struct bio
 	}
 }
 
+static void corrupt_bio_data(struct bio *bio, struct flakey_c *fc)
+{
+	unsigned int corrupt_bio_byte = fc->corrupt_bio_byte - 1;
+
+	if (!bio_has_data(bio))
+		return;
+
+	corrupt_bio_common(bio, corrupt_bio_byte, fc->corrupt_bio_value);
+}
+
+static void corrupt_bio_random(struct bio *bio)
+{
+	unsigned int corrupt_byte;
+	unsigned char corrupt_value;
+
+	if (!bio_has_data(bio))
+		return;
+
+	corrupt_byte = get_random_u32() % bio->bi_iter.bi_size;
+	corrupt_value = get_random_u8();
+
+	corrupt_bio_common(bio, corrupt_byte, corrupt_value);
+}
+
 static void clone_free(struct bio *clone)
 {
 	struct folio_iter fi;
@@ -436,6 +487,7 @@ static int flakey_map(struct dm_target *
 	/* Are we alive ? */
 	elapsed = (jiffies - fc->start_time) / HZ;
 	if (elapsed % (fc->up_interval + fc->down_interval) >= fc->up_interval) {
+		bool corrupt_fixed, corrupt_random;
 		/*
 		 * Flag this bio as submitted while down.
 		 */
@@ -465,16 +517,28 @@ static int flakey_map(struct dm_target *
 		/*
 		 * Corrupt matching writes.
 		 */
+		corrupt_fixed = false;
+		corrupt_random = false;
 		if (fc->corrupt_bio_byte && fc->corrupt_bio_rw == WRITE) {
-			if (all_corrupt_bio_flags_match(bio, fc)) {
-				struct bio *clone = clone_bio(ti, fc, bio);
-				if (clone) {
+			if (all_corrupt_bio_flags_match(bio, fc))
+				corrupt_fixed = true;
+		}
+		if (fc->random_write_corrupt) {
+			u64 rnd = get_random_u64();
+			u32 rem = do_div(rnd, PROBABILITY_BASE);
+			if (rem < fc->random_write_corrupt)
+				corrupt_random = true;
+		}
+		if (corrupt_fixed || corrupt_random) {
+			struct bio *clone = clone_bio(ti, fc, bio);
+			if (clone) {
+				if (corrupt_fixed)
 					corrupt_bio_data(clone, fc);
-					submit_bio(clone);
-					return DM_MAPIO_SUBMITTED;
-				}
- 			}
- 			goto map_bio;
+				if (corrupt_random)
+					corrupt_bio_random(clone);
+				submit_bio(clone);
+				return DM_MAPIO_SUBMITTED;
+			}
 		}
 	}
 
@@ -503,6 +567,12 @@ static int flakey_end_io(struct dm_targe
 				corrupt_bio_data(bio, fc);
 			}
 		}
+		if (fc->random_read_corrupt) {
+			u64 rnd = get_random_u64();
+			u32 rem = do_div(rnd, PROBABILITY_BASE);
+			if (rem < fc->random_read_corrupt)
+				corrupt_bio_random(bio);
+		}
 		if (test_bit(ERROR_READS, &fc->flags)) {
 			/*
 			 * Error read during the down_interval if drop_writes
@@ -535,7 +605,10 @@ static void flakey_status(struct dm_targ
 		error_reads = test_bit(ERROR_READS, &fc->flags);
 		drop_writes = test_bit(DROP_WRITES, &fc->flags);
 		error_writes = test_bit(ERROR_WRITES, &fc->flags);
-		DMEMIT(" %u", error_reads + drop_writes + error_writes + (fc->corrupt_bio_byte > 0) * 5);
+		DMEMIT(" %u", error_reads + drop_writes + error_writes +
+			(fc->corrupt_bio_byte > 0) * 5 +
+			(fc->random_read_corrupt > 0) * 2 +
+			(fc->random_write_corrupt > 0) * 2);
 
 		if (error_reads)
 			DMEMIT(" error_reads");
@@ -550,6 +623,11 @@ static void flakey_status(struct dm_targ
 			       (fc->corrupt_bio_rw == WRITE) ? 'w' : 'r',
 			       fc->corrupt_bio_value, fc->corrupt_bio_flags);
 
+		if (fc->random_read_corrupt > 0)
+			DMEMIT(" %u", fc->random_read_corrupt);
+		if (fc->random_write_corrupt > 0)
+			DMEMIT(" %u", fc->random_write_corrupt);
+
 		break;
 
 	case STATUSTYPE_IMA:
Index: linux-2.6/Documentation/admin-guide/device-mapper/dm-flakey.rst
===================================================================
--- linux-2.6.orig/Documentation/admin-guide/device-mapper/dm-flakey.rst
+++ linux-2.6/Documentation/admin-guide/device-mapper/dm-flakey.rst
@@ -67,6 +67,16 @@ Optional feature parameters:
 	Perform the replacement only if bio->bi_opf has all the
 	selected flags set.
 
+  random_read_corrupt <probability>
+	During <down interval>, replace random byte in a read bio
+	with a random value. probability is an integer between
+	0 and 1000000000 meaning 0% to 100% probability of corruption.
+
+  random_write_corrupt <probability>
+	During <down interval>, replace random byte in a write bio
+	with a random value. probability is an integer between
+	0 and 1000000000 meaning 0% to 100% probability of corruption.
+
 Examples:
 
 Replaces the 32nd byte of READ bios with the value 1::

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

