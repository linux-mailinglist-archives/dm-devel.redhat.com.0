Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id CFD63167A72
	for <lists+dm-devel@lfdr.de>; Fri, 21 Feb 2020 11:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582280395;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qPV2SneOkdP3Plk5jRXfJi9xArkZinX6+/j0/YNP4pQ=;
	b=BrkGfK56EvMA81fmB+ebO+xpc/xQjREjfd0GvE8HfStxiziAv6XOmlHUcA1zesPYNuOPM7
	0fSHQQJM8L7AaO/dVdfDkZhzXkefu43WgYB0/8eMWtAWphcYfWwVZUyuzJK7qPrjQNLDph
	cfCCd/8S4p8VX4ZP/5be0aeJsJDtO+4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-LxNrg2wePDaRgylfTD6xZw-1; Fri, 21 Feb 2020 05:19:53 -0500
X-MC-Unique: LxNrg2wePDaRgylfTD6xZw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA598107ACC5;
	Fri, 21 Feb 2020 10:19:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E3825C114;
	Fri, 21 Feb 2020 10:19:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B00F5182B00E;
	Fri, 21 Feb 2020 10:19:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01KI4rNN004099 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Feb 2020 13:04:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9EBE2166B2E; Thu, 20 Feb 2020 18:04:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B56B62166B2B
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 18:04:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7539A8007C9
	for <dm-devel@redhat.com>; Thu, 20 Feb 2020 18:04:51 +0000 (UTC)
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from mout.web.de (mout.web.de [212.227.15.14]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-151-BYVUUD04Nk29O1m8K4MwdQ-1;
	Thu, 20 Feb 2020 13:04:48 -0500
Received: from luklap ([94.134.180.199]) by smtp.web.de (mrweb001
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0Lzs0p-1jZD011LVb-0152pg;
	Thu, 20 Feb 2020 19:04:46 +0100
Date: Thu, 20 Feb 2020 19:04:45 +0100
From: Lukas Straub <lukasstraub2@web.de>
To: linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <20200220190445.2222af54@luklap>
MIME-Version: 1.0
X-Provags-ID: V03:K1:j/VhRjSkDO6znn4FrHt3mC8n7LlVlbZVwkVTUlm/MVlZnqIEN/E
	Q+Q63qWJCXLRysqLWXYyI5sNRzNR+nGrjrwhjDL4AmIDX2z/tbid1AOZi9cSolIRjDJ+E6G
	DpcGJbKsRMvzxriSnblo6CEIuPT08lG584MRJ7/JMFo51AfBGgF9FQx3nvZ/8dDueft3vqE
	tg0Rg+vgmApE9S/rn6h0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:634g0Ktj+5Q=:OeZZsXReddB08MfLeqtxs0
	aR3FIXFQVklIZVpkbWdK1bZpWyfc7djbSeGEZrQGoo3dMIypBGlgDGaWsuip2P9orzj1K6H8L
	608zJQn8tOapXyKRHZZiV6jcsO+AnPqhHRksRJhqZwKo9IqATTOg7Cg2ulu2Swkh6HpIacpK9
	ocnzDTx15Giux/YoWWZqSNb2zJza7uPOAINUtC4CdT32l2/YsUcAUXdFgcGOJjgwtRWA5WEbE
	HjU0zL+h3L26r72nK1m6FzHdqKjhcnimIza5VQmJLSJ3QJQuWdqx1jWakMuBajKMJr6wmLWsR
	b1zdq4yP9nIeWXrusutgDHydrMRwvpDtALPte4a2jOM70tGAL8+klwAySC8fRpFLv+ky0DLx/
	HEG680CRO6Ugn73qWA+04uLuLFg4WeECqNBJPrPbwegwk2F2QYxLwqldTtUZhFI+ceeZU4w0H
	8bL9GyU1upbHGcRoQBJvqDB1fsq6X53A7nq44anR61Rh9uYE6drDelNKskmKoBeErf76Q+D3T
	OEvh06DIhR4f10Igwfgox+NwgBb9igZOyzrggesZmJCHDVEPmu9nkc2U6dEK0K8NjpyMIDPQN
	EyNwbhS4aa3JlP1sU7WrfsBPTS3ycGlZACp6jN+brmmY8APQEP05yDdfyL6Tg54XcZDSN/JNv
	FloOqdHkJtc1f4ZTEu72uE5TaCs+i465myRpT519jV0q/ww4Ei98S8luXtWjoSVWcqqY5+mlW
	bRgffY83z0WyQUNrMHFPG17qrIQ//f0lYCDYl0YrHAsv2Lnz1iAFwXTURiwY42e+ssComG1Ee
	azeqSpNYur8h+aW1mcCeI/2WqyADj64LNGsTAiGyQjLAvdaKWvGF5EtRw2m7R1ub8RLDPaNZv
	744U5sncz2Ni/S/+1+DZaLb0kq0ihkbgx5nUIdW52Btft4fjqKwMj4AJhTW29/jrBvto8FQpk
	EwacYMkvw3a7ILT7buj+zg8cR1MN+T4cphpmSRY7IAQoiuwQRPlDnGGTS1cPZNvkgxr6Q3c4g
	wwD1LrOtktt99A7XeRd2RERBJwiweTp8eXEJnApIFQ9mE/qxg++ZjCM033/XFjtlp7kn3Tp8r
	CZiLvWPDslG3s5raDK9dyckajifS6kxqnBHAXgIwHYrnGv1RSK5sAABbx6yHiZMSwKQ69NO2c
	x45hbhF+LSC1mqv6vl7NcadHCTVCYE2My2bVuAXc2Y3eko5NFVHb2KWX+DiiXj6xUlapQYktx
	muWXXnnvOWYEcKusS
X-MC-Unique: BYVUUD04Nk29O1m8K4MwdQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 01KI4rNN004099
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 21 Feb 2020 05:19:27 -0500
Cc: dm-devel <dm-devel@redhat.com>, Mike Snitzer <snitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm-integrity: Prevent RMW for full tag area
	writes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a full tag area is being written, don't read it first. This prevents a
read-modify-write cycle and increases performance on HDDs considerably.

To do this we now calculate the checksums for all sectors in the bio in one
go in integrity_metadata and then pass the result to dm_integrity_rw_tag,
which now checks if we overwrite the whole tag area.

Benchmarking with a 5400RPM HDD with bitmap mode:
integritysetup format --no-wipe --batch-mode --interleave-sectors $((64*1024)) -t 4 -s 512 -I crc32c -B /dev/sdc
integritysetup open -I crc32c -B /dev/sdc hdda_integ
dd if=/dev/zero of=/dev/mapper/hdda_integ bs=64K count=$((16*1024*4)) conv=fsync oflag=direct status=progress

Without patch:
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 400.326 s, 10.7 MB/s

With patch:
4294967296 bytes (4.3 GB, 4.0 GiB) copied, 41.2057 s, 104 MB/s

Signed-off-by: Lukas Straub <lukasstraub2@web.de>
---
 drivers/md/dm-integrity.c | 80 ++++++++++++++++++++++-----------------
 1 file changed, 46 insertions(+), 34 deletions(-)

diff --git a/drivers/md/dm-integrity.c b/drivers/md/dm-integrity.c
index b225b3e445fa..0e5ddcf44935 100644
--- a/drivers/md/dm-integrity.c
+++ b/drivers/md/dm-integrity.c
@@ -1309,9 +1309,16 @@ static int dm_integrity_rw_tag(struct dm_integrity_c *ic, unsigned char *tag, se
 		if (unlikely(r))
 			return r;

-		data = dm_bufio_read(ic->bufio, *metadata_block, &b);
-		if (IS_ERR(data))
-			return PTR_ERR(data);
+		/* Don't read tag area from disk if we're going to overwrite it completely */
+		if (op == TAG_WRITE && *metadata_offset == 0 && total_size >= ic->metadata_run) {
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
@@ -1514,6 +1521,8 @@ static void integrity_metadata(struct work_struct *w)
 {
 	struct dm_integrity_io *dio = container_of(w, struct dm_integrity_io, work);
 	struct dm_integrity_c *ic = dio->ic;
+	unsigned sectors_to_process = dio->range.n_sectors;
+	sector_t sector = dio->range.logical_sector;

 	int r;

@@ -1522,16 +1531,14 @@ static void integrity_metadata(struct work_struct *w)
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
@@ -1542,49 +1549,45 @@ static void integrity_metadata(struct work_struct *w)
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

@@ -1615,6 +1618,13 @@ static void integrity_metadata(struct work_struct *w)
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
@@ -3019,6 +3029,8 @@ static void dm_integrity_io_hints(struct dm_target *ti, struct queue_limits *lim
 		limits->physical_block_size = ic->sectors_per_block << SECTOR_SHIFT;
 		blk_limits_io_min(limits, ic->sectors_per_block << SECTOR_SHIFT);
 	}
+
+	blk_limits_io_opt(limits, (1U << ic->sb->log2_interleave_sectors));
 }

 static void calculate_journal_section_size(struct dm_integrity_c *ic)
--
2.20.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

