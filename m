Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 493C9171AC8
	for <lists+dm-devel@lfdr.de>; Thu, 27 Feb 2020 14:57:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582811829;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1FDYDrC5qh33cIV/IyBYeOydXfcFNiCtbvJUGKBKJIE=;
	b=ZxEXhSWUBy645pPxzchUkGSgmbi5IXITP6hJ8HESD77jD6eguaY3BZFAKl3R0C++Bevf/+
	LpWT6C0nioJYFfCwSs5FQzzej0kVcOqCn6kwiG9pl3jpe7gtvlrbhx42LlN3mh1PpK14K3
	cmb/ArBI82wFn3x4YeAV1gvPmAGtWIU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-Ywie2okxOOmrMuYiw7Yfxg-1; Thu, 27 Feb 2020 08:57:07 -0500
X-MC-Unique: Ywie2okxOOmrMuYiw7Yfxg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73BAC1005516;
	Thu, 27 Feb 2020 13:57:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E2C90CC8;
	Thu, 27 Feb 2020 13:56:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B772618095FF;
	Thu, 27 Feb 2020 13:56:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01RDQ9Oe032066 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Feb 2020 08:26:10 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D151B1054FCE; Thu, 27 Feb 2020 13:26:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA3921054FD1
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 13:26:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A37361011E02
	for <dm-devel@redhat.com>; Thu, 27 Feb 2020 13:26:07 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.15.3]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-ZlltUN0SM7ejcMzKVOtM1g-1;
	Thu, 27 Feb 2020 08:26:04 -0500
X-MC-Unique: ZlltUN0SM7ejcMzKVOtM1g-1
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from luklap ([88.130.61.170]) by smtp.web.de (mrweb002
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MXpmp-1isASz1uEx-00Wmpi;
	Thu, 27 Feb 2020 14:26:02 +0100
Date: Thu, 27 Feb 2020 14:26:01 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <20200227142601.61f3cd54@luklap>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gFHhBvnByvSMOxFLQSNLjz+7HzXasLy8tEH06JBC/AgIOkntixN
	rg8LHEb/XFDYsyqlD9uigZH1ygvSC7Wc4gIyS5bQqnInJnLCI/xVFXvA6MCznv9wcO8bYiZ
	CA0L36gHhjbQF0XRg7+ES56m9HAlAH1pqmHq243PPsTCSRoMybHOWkDQOSNJk8aFAcXtKAZ
	J38hCFlfy5Bj192iIUxRg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oYdG+isJ23w=:IjdpVrPCXxw//pghbJ3lp9
	2w31JGZ6BgzAaXbVuBBNxDhVBtvDC0YQGGAaa6Y0W5IEaiL4kKy2szZ17bD5ftCiUAVVoVZtU
	P7s+gjLUJKaJx/gfZf/rS62PklEkSK1Ao9EZwCxtRyv9IE9mr1s9ManKHlP7GxZUpreX9aW3P
	y7egdRrFXVAZsMElDx0ByQf2tfidnC03cZeasso/Ipu6kTfm1bKaZ6Gw9Liut83leGE/uiDdG
	fkUSIiAMte+TyeKiNs7w1dt6cLjqCRubTlxxe5WsQkpNg1tZJS1SYHYZwIviQsXw1kQVA4DJD
	M1E5KLfpYaMJdNxzQb71dqgDEVuLxY6JiKR3N9qIQV8ZuruQg8QYk6m/UUOfi14ehtGFMKXH/
	EEB6fOA0GP7us3r5F3dEmiK3y/6VuAt1KJ+KF0cge5b75FL8JhZTRLQBVRJQ3qC8qh+od7bgH
	nxtUjQJO7EBzjAbYrg504EfcRT0+p90dLPK9SnuknMFmB+fULB6ycgtPQfE86y/X9M0L3pwDY
	Mk5MECMkMXl7FejpuyMAZPU/J5vY4Gz1KyUJl6w92t0Ab0rbDUTl6ZpPSFhekAUMo2//fd5mS
	7Le3fvPRdhtree3ZNaq8Tn4feN58wTXDy+F3huwVSC42bLhtE7/3aaEWW5LdPP3OUf74KR20m
	BWCVfyS9rakzL9kyjGlYrwyxGrKaedCyZanqBthNzOs9yIlWZlQ48BehOa80QoMQteYrr5KGB
	96YMXEOwgxbH9I7UzCsE2yxu/gH7uYdlgu1aWsDkLhWM03TsfjEWkcQ5yKKUEsDkfYGoURR2S
	AoP2FszcHqfVKFzVPhhEiRUuESIa82qZVPEzxLjQCKwzGMZ8bO1XIseBNK7u6RbfonQJRZ0az
	mkmn5xDqnXAxcOeoVM/MGha9+HqS94jINZMNMZHDfbKghQ3r/140kKW2RJVSvaURstHzbAF7Q
	QulQp4MjngZ2SdgkFykn1XHAMbHlEF5WlKvir352ESvY9idmL5dsoWc9C9UM92TVXQ2C5YboF
	wzPGGjS1KUs0k/KfDC4IMih0pc/iRwroCrxX2jsGp8W5jFL2+mkq7rIC4Z8cy6LyW4aJsSgB7
	Z0YXgK3QYLJXC3LTMoFDIqH+yRkuwy9/APNLE+Nog5B73rr0CLod+oJJECNIUKDyLZeJKa/DJ
	nJhgomnRDZX+MQY2oP2KDuzouPqYRYzuGGhLjcOLYpYNinekoaNsZkNwJtR5G9ORTDtOiRVEG
	dH2xkQj6kiB66eq1n
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01RDQ9Oe032066
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:56:22 -0500
Cc: dm-devel <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH v2] dm-integrity: Prevent RMW for full metadata
 buffer writes
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a full metadata buffer is being written, don't read it first. This
prevents a read-modify-write cycle and increases performance on HDDs
considerably.

To do this we now calculate the checksums for all sectors in the bio in one
go in integrity_metadata and then pass the result to dm_integrity_rw_tag,
which now checks if we overwrite the whole buffer.

Benchmarking with a 5400RPM HDD with bitmap mode:
integritysetup format --no-wipe --batch-mode --interleave-sectors $((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
integritysetup open --buffer-sectors=1 -I crc32c -B /dev/sdc hdda_integ
dd if=/dev/zero of=/dev/mapper/hdda_integ bs=64K count=$((16*1024*4)) conv=fsync oflag=direct status=progress

Without patch:
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s

With patch:
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
Hello Everyone,
So here is v2, now checking if we overwrite a whole metadata buffer instead
of the (buggy) check if we overwrite a whole tag area before.
Performance stayed the same (with --buffer-sectors=1).

The only quirk now is that it advertises a very big optimal io size in the
standard configuration (where buffer_sectors=128). Is this a Problem?

v2:
 -fix dm_integrity_rw_tag to check if we overwrite a whole metadat buffer
 -fix optimal io size to check if we overwrite a whole metadata buffer

Regards,
Lukas Straub

 drivers/md/dm-integrity.c | 81 +++++++++++++++++++++++----------------
 1 file changed, 47 insertions(+), 34 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b225b3e445fa..a6d3cf1406df 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1309,9 +1309,17 @@ static int dm_integrity_rw_tag(struct dm_integrity_c *ic, unsigned char *tag, se
 		if (unlikely(r))
 			return r;

-		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
-		if (IS_ERR(data))
-			return PTR_ERR(data);
+		/* Don't read metadata sectors from disk if we're going to overwrite them completely */
+		if (op == TAG_WRITE && *metadata_offset == 0 \
+			&& total_size >= (1U << SECTOR_SHIFT << ic->log2_buffer_sectors)) {
+			data = dm_bufio_new(ic->bufio, *metadata_block, &b);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+		} else {
+			data = dm_bufio_read(ic->bufio, *metadata_block, &b);
+			if (IS_ERR(data))
+				return PTR_ERR(data);
+		}

 		to_copy = min((1U << SECTOR_SHIFT << ic->log2_buffer_sectors) - *metadata_offset, total_size);
 		dp = data + *metadata_offset;
@@ -1514,6 +1522,8 @@ static void integrity_metadata(struct work_struct *w)
 {
 	struct dm_integrity_io *dio = container_of(w, struct dm_integrity_io, work);
 	struct dm_integrity_c *ic = dio->ic;
+	unsigned sectors_to_process = dio->range.n_sectors;
+	sector_t sector = dio->range.logical_sector;

 	int r;

@@ -1522,16 +1532,14 @@ static void integrity_metadata(struct work_struct *w)
 		struct bio_vec bv;
 		unsigned digest_size = crypto_shash_digestsize(ic->internal_hash);
 		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
-		char *checksums;
+		char *checksums, *checksums_ptr;
 		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
 		char checksums_onstack[HASH_MAX_DIGESTSIZE];
-		unsigned sectors_to_process = dio->range.n_sectors;
-		sector_t sector = dio->range.logical_sector;

 		if (unlikely(ic->mode == 'R'))
 			goto skip_io;

-		checksums = kmalloc((PAGE_SIZE >> SECTOR_SHIFT >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
+		checksums = kmalloc((dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size + extra_space,
 				    GFP_NOIO | __GFP_NORETRY | __GFP_NOWARN);
 		if (!checksums) {
 			checksums = checksums_onstack;
@@ -1542,49 +1550,45 @@ static void integrity_metadata(struct work_struct *w)
 			}
 		}

+		checksums_ptr = checksums;
 		__bio_for_each_segment(bv, bio, iter, dio->orig_bi_iter) {
 			unsigned pos;
-			char *mem, *checksums_ptr;
-
-again:
+			char *mem;
 			mem = (char *)kmap_atomic(bv.bv_page) + bv.bv_offset;
 			pos = 0;
-			checksums_ptr = checksums;
 			do {
 				integrity_sector_checksum(ic, sector, mem + pos, checksums_ptr);
-				checksums_ptr += ic->tag_size;
-				sectors_to_process -= ic->sectors_per_block;
+
+				if (likely(checksums != checksums_onstack)) {
+					checksums_ptr += ic->tag_size;
+				} else {
+					r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
+								ic->tag_size, !dio->write ? TAG_CMP : TAG_WRITE);
+					if (unlikely(r))
+						goto internal_hash_error;
+				}
+
 				pos += ic->sectors_per_block << SECTOR_SHIFT;
 				sector += ic->sectors_per_block;
-			} while (pos < bv.bv_len && sectors_to_process && checksums != checksums_onstack);
+				sectors_to_process -= ic->sectors_per_block;
+			} while (pos < bv.bv_len && sectors_to_process);
 			kunmap_atomic(mem);

-			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
-						checksums_ptr - checksums, !dio->write ? TAG_CMP : TAG_WRITE);
-			if (unlikely(r)) {
-				if (r > 0) {
-					DMERR_LIMIT("Checksum failed at sector 0x%llx",
-						    (unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
-					r = -EILSEQ;
-					atomic64_inc(&ic->number_of_mismatches);
-				}
-				if (likely(checksums != checksums_onstack))
-					kfree(checksums);
-				goto error;
-			}
-
 			if (!sectors_to_process)
 				break;
+		}

-			if (unlikely(pos < bv.bv_len)) {
-				bv.bv_offset += pos;
-				bv.bv_len -= pos;
-				goto again;
+		if (likely(checksums != checksums_onstack)) {
+			r = dm_integrity_rw_tag(ic, checksums, &dio->metadata_block, &dio->metadata_offset,
+						(dio->range.n_sectors >> ic->sb->log2_sectors_per_block) * ic->tag_size,
+						!dio->write ? TAG_CMP : TAG_WRITE);
+			if (unlikely(r)) {
+				kfree(checksums);
+				goto internal_hash_error;
 			}
+			kfree(checksums);
 		}

-		if (likely(checksums != checksums_onstack))
-			kfree(checksums);
 	} else {
 		struct bio_integrity_payload *bip = dio->orig_bi_integrity;

@@ -1615,6 +1619,13 @@ static void integrity_metadata(struct work_struct *w)
 skip_io:
 	dec_in_flight(dio);
 	return;
+internal_hash_error:
+	if (r > 0) {
+		DMERR_LIMIT("Checksum failed at sector 0x%llx",
+				(unsigned long long)(sector - ((r + ic->tag_size - 1) / ic->tag_size)));
+		r = -EILSEQ;
+		atomic64_inc(&ic->number_of_mismatches);
+	}
 error:
 	dio->bi_status = errno_to_blk_status(r);
 	dec_in_flight(dio);
@@ -3019,6 +3030,8 @@ static void dm_integrity_io_hints(struct dm_target *ti, struct queue_limits *lim
 		limits->physical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
 		blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT);
 	}
+
+	blk_limits_io_opt(limits, 1U << SECTOR_SHIFT << ic->log2_buffer_sectors >> ic->log2_tag_size << SECTOR_SHIFT );
 }

 static void calculate_journal_section_size(struct dm_integrity_c *ic)
--
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

