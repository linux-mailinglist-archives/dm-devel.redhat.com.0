Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CB14846491D
	for <lists+dm-devel@lfdr.de>; Wed,  1 Dec 2021 08:48:38 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-71-u1y4cf10PHKKxK1A--Kang-1; Wed, 01 Dec 2021 02:48:36 -0500
X-MC-Unique: u1y4cf10PHKKxK1A--Kang-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FEB8192AB6E;
	Wed,  1 Dec 2021 07:48:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48FB65D9DE;
	Wed,  1 Dec 2021 07:48:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5DFA04A7CA;
	Wed,  1 Dec 2021 07:48:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B15IQem008767 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 00:18:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1AF2B401E54; Wed,  1 Dec 2021 05:18:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16E06401E38
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 05:18:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2EE985A5B5
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 05:18:25 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-530-0pGMySsQNO-0bPCSwzXVCA-1; Wed, 01 Dec 2021 00:18:24 -0500
X-MC-Unique: 0pGMySsQNO-0bPCSwzXVCA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2E599212BA;
	Wed,  1 Dec 2021 05:18:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31F8C13425;
	Wed,  1 Dec 2021 05:18:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id iIzRAJ4Fp2EGbwAAMHmgww
	(envelope-from <wqu@suse.com>); Wed, 01 Dec 2021 05:18:22 +0000
From: Qu Wenruo <wqu@suse.com>
To: linux-btrfs@vger.kernel.org
Date: Wed,  1 Dec 2021 13:17:45 +0800
Message-Id: <20211201051756.53742-7-wqu@suse.com>
In-Reply-To: <20211201051756.53742-1-wqu@suse.com>
References: <20211201051756.53742-1-wqu@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B15IQem008767
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 01 Dec 2021 02:47:50 -0500
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 06/17] btrfs: replace btrfs_dio_private::refs
	with btrfs_dio_private::pending_bytes
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This mostly follows the behavior of compressed_bio::pending_sectors.

The point here is, dip::refs is not split bio friendly, as if a bio with
its bi_private = dip, and the bio get split, we can easily underflow
dip::refs.

By using the same sector based solution as compressed_bio, dio can
handle both unsplit and split bios.

Signed-off-by: Qu Wenruo <wqu@suse.com>
---
 fs/btrfs/btrfs_inode.h | 10 +++----
 fs/btrfs/inode.c       | 67 +++++++++++++++++++++---------------------
 2 files changed, 38 insertions(+), 39 deletions(-)

diff --git a/fs/btrfs/btrfs_inode.h b/fs/btrfs/btrfs_inode.h
index b3e46aabc3d8..196f74ee102e 100644
--- a/fs/btrfs/btrfs_inode.h
+++ b/fs/btrfs/btrfs_inode.h
@@ -358,11 +358,11 @@ struct btrfs_dio_private {
 	/* Used for bio::bi_size */
 	u32 bytes;
 
-	/*
-	 * References to this structure. There is one reference per in-flight
-	 * bio plus one while we're still setting up.
-	 */
-	refcount_t refs;
+	/* Hit any error for the whole DIO bio */
+	bool errors;
+
+	/* How many bytes are still under IO or not submitted */
+	atomic_t pending_bytes;
 
 	/* dio_bio came from fs/direct-io.c */
 	struct bio *dio_bio;
diff --git a/fs/btrfs/inode.c b/fs/btrfs/inode.c
index 007a20a9b076..1aa060de917c 100644
--- a/fs/btrfs/inode.c
+++ b/fs/btrfs/inode.c
@@ -8053,20 +8053,28 @@ static int btrfs_dio_iomap_end(struct inode *inode, loff_t pos, loff_t length,
 	return ret;
 }
 
-static void btrfs_dio_private_put(struct btrfs_dio_private *dip)
+static bool dec_and_test_dio_private(struct btrfs_dio_private *dip, bool error,
+	    			     u32 bytes)
 {
-	/*
-	 * This implies a barrier so that stores to dio_bio->bi_status before
-	 * this and loads of dio_bio->bi_status after this are fully ordered.
-	 */
-	if (!refcount_dec_and_test(&dip->refs))
+	ASSERT(bytes <= dip->bytes);
+	ASSERT(bytes <= atomic_read(&dip->pending_bytes));
+
+	if (error)
+		dip->errors = true;
+	return atomic_sub_and_test(bytes, &dip->pending_bytes);
+}
+
+static void dio_private_finish(struct btrfs_dio_private *dip, bool error,
+			       u32 bytes)
+{
+	if (!dec_and_test_dio_private(dip, error, bytes))
 		return;
 
 	if (btrfs_op(dip->dio_bio) == BTRFS_MAP_WRITE) {
 		__endio_write_update_ordered(BTRFS_I(dip->inode),
 					     dip->file_offset,
 					     dip->bytes,
-					     !dip->dio_bio->bi_status);
+					     !dip->errors);
 	} else {
 		unlock_extent(&BTRFS_I(dip->inode)->io_tree,
 			      dip->file_offset,
@@ -8087,10 +8095,10 @@ static blk_status_t submit_dio_repair_bio(struct inode *inode, struct bio *bio,
 
 	BUG_ON(bio_op(bio) == REQ_OP_WRITE);
 
-	refcount_inc(&dip->refs);
+	atomic_add(bio->bi_iter.bi_size, &dip->pending_bytes);
 	ret = btrfs_map_bio(fs_info, bio, mirror_num);
 	if (ret)
-		refcount_dec(&dip->refs);
+		atomic_sub(bio->bi_iter.bi_size, &dip->pending_bytes);
 	return ret;
 }
 
@@ -8166,20 +8174,20 @@ static blk_status_t btrfs_submit_bio_start_direct_io(struct inode *inode,
 static void btrfs_end_dio_bio(struct bio *bio)
 {
 	struct btrfs_dio_private *dip = bio->bi_private;
+	struct bvec_iter iter;
+	struct bio_vec bvec;
+	u32 bi_size = 0;
 	blk_status_t err = bio->bi_status;
 
-	if (err) {
-		struct bvec_iter_all iter_all;
-		struct bio_vec *bvec;
-		u32 bi_size = 0;
-
-		bio_for_each_segment_all(bvec, bio, iter_all)
-			bi_size += bvec->bv_len;
+	__bio_for_each_segment(bvec, bio, iter, btrfs_bio(bio)->iter)
+		bi_size += bvec.bv_len;
 
+	if (err) {
 		btrfs_warn(BTRFS_I(dip->inode)->root->fs_info,
 			   "direct IO failed ino %llu rw %d,%u sector %#Lx len %u err no %d",
 			   btrfs_ino(BTRFS_I(dip->inode)), bio_op(bio),
 			   bio->bi_opf, bio->bi_iter.bi_sector, bi_size, err);
+		dip->errors = true;
 	}
 
 	if (bio_op(bio) == REQ_OP_READ)
@@ -8191,7 +8199,7 @@ static void btrfs_end_dio_bio(struct bio *bio)
 	btrfs_record_physical_zoned(dip->inode, dip->file_offset, bio);
 
 	bio_put(bio);
-	btrfs_dio_private_put(dip);
+	dio_private_finish(dip, err, bi_size);
 }
 
 static inline blk_status_t btrfs_submit_dio_bio(struct bio *bio,
@@ -8250,7 +8258,8 @@ static inline blk_status_t btrfs_submit_dio_bio(struct bio *bio,
  */
 static struct btrfs_dio_private *btrfs_create_dio_private(struct bio *dio_bio,
 							  struct inode *inode,
-							  loff_t file_offset)
+							  loff_t file_offset,
+							  u32 length)
 {
 	const bool write = (btrfs_op(dio_bio) == BTRFS_MAP_WRITE);
 	const bool csum = !(BTRFS_I(inode)->flags & BTRFS_INODE_NODATASUM);
@@ -8270,12 +8279,12 @@ static struct btrfs_dio_private *btrfs_create_dio_private(struct bio *dio_bio,
 	if (!dip)
 		return NULL;
 
+	atomic_set(&dip->pending_bytes, length);
 	dip->inode = inode;
 	dip->file_offset = file_offset;
 	dip->bytes = dio_bio->bi_iter.bi_size;
 	dip->disk_bytenr = dio_bio->bi_iter.bi_sector << 9;
 	dip->dio_bio = dio_bio;
-	refcount_set(&dip->refs, 1);
 	return dip;
 }
 
@@ -8289,6 +8298,8 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 			     BTRFS_BLOCK_GROUP_RAID56_MASK);
 	struct btrfs_dio_private *dip;
 	struct bio *bio;
+	const u32 length = dio_bio->bi_iter.bi_size;
+	u32 submitted_bytes = 0;
 	u64 start_sector;
 	int async_submit = 0;
 	u64 submit_len;
@@ -8301,7 +8312,7 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 	struct btrfs_dio_data *dio_data = iter->iomap.private;
 	struct extent_map *em = NULL;
 
-	dip = btrfs_create_dio_private(dio_bio, inode, file_offset);
+	dip = btrfs_create_dio_private(dio_bio, inode, file_offset, length);
 	if (!dip) {
 		if (!write) {
 			unlock_extent(&BTRFS_I(inode)->io_tree, file_offset,
@@ -8311,7 +8322,6 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 		bio_endio(dio_bio);
 		return;
 	}
-
 	if (!write) {
 		/*
 		 * Load the csums up front to reduce csum tree searches and
@@ -8365,17 +8375,7 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 		ASSERT(submit_len >= clone_len);
 		submit_len -= clone_len;
 
-		/*
-		 * Increase the count before we submit the bio so we know
-		 * the end IO handler won't happen before we increase the
-		 * count. Otherwise, the dip might get freed before we're
-		 * done setting it up.
-		 *
-		 * We transfer the initial reference to the last bio, so we
-		 * don't need to increment the reference count for the last one.
-		 */
 		if (submit_len > 0) {
-			refcount_inc(&dip->refs);
 			/*
 			 * If we are submitting more than one bio, submit them
 			 * all asynchronously. The exception is RAID 5 or 6, as
@@ -8390,11 +8390,10 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 						async_submit);
 		if (status) {
 			bio_put(bio);
-			if (submit_len > 0)
-				refcount_dec(&dip->refs);
 			goto out_err_em;
 		}
 
+		submitted_bytes += clone_len;
 		dio_data->submitted += clone_len;
 		clone_offset += clone_len;
 		start_sector += clone_len >> 9;
@@ -8408,7 +8407,7 @@ static void btrfs_submit_direct(const struct iomap_iter *iter,
 	free_extent_map(em);
 out_err:
 	dip->dio_bio->bi_status = status;
-	btrfs_dio_private_put(dip);
+	dio_private_finish(dip, status, length - submitted_bytes);
 }
 
 const struct iomap_ops btrfs_dio_iomap_ops = {
-- 
2.34.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

