Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DD7543F5
	for <lists+dm-devel@lfdr.de>; Fri, 14 Jul 2023 22:54:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1689368064;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=izKIs3kzRSXk8rYlwEYYX3HagBxVXqav/EAiidNmkRY=;
	b=HX8uO0BnO2ZkBA4pUYLIg2sK8Xp0uwK2jkGoWXieN8auXI0GKs6cQfLNFg3zvJdAXyxLd/
	zv8qb4Ceb6pbFTxgfUE9woeUWWfo773VNjlP9P3CCqCfIhg0kQ/s7q+51/RGu1ZOvhT4J0
	5Iq0qe1U2BdoyjyZmVwDnD1LzhLZFo0=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-471-6ETnfCX3OSq7oB8HZy0NLg-1; Fri, 14 Jul 2023 16:54:19 -0400
X-MC-Unique: 6ETnfCX3OSq7oB8HZy0NLg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C12E28EC108;
	Fri, 14 Jul 2023 20:54:17 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 64F10C57964;
	Fri, 14 Jul 2023 20:54:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8FFEC19465B9;
	Fri, 14 Jul 2023 20:54:08 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5F0B0194658F
 for <dm-devel@listman.corp.redhat.com>; Fri, 14 Jul 2023 20:54:07 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id EDB601454145; Fri, 14 Jul 2023 20:54:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E48D81454142
 for <dm-devel@redhat.com>; Fri, 14 Jul 2023 20:54:06 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC97C28EC108
 for <dm-devel@redhat.com>; Fri, 14 Jul 2023 20:54:06 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-a5EMS2I-OMSWuYLpGKjZJw-1; Fri, 14 Jul 2023 16:54:04 -0400
X-MC-Unique: a5EMS2I-OMSWuYLpGKjZJw-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 40F0E61DE7;
 Fri, 14 Jul 2023 20:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14ACCC433C8;
 Fri, 14 Jul 2023 20:54:00 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: stable-commits@vger.kernel.org,
	heinzm@redhat.com
Date: Fri, 14 Jul 2023 16:53:57 -0400
Message-Id: <20230714205359.1301794-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] Patch "dm: avoid split of quoted strings where possible"
 has been added to the 6.1-stable tree
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
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is a note to let you know that I've just added the patch titled

    dm: avoid split of quoted strings where possible

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dm-avoid-split-of-quoted-strings-where-possible.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.



commit 675613846fe006664753948bf9100f1ce52009c9
Author: Heinz Mauelshagen <heinzm@redhat.com>
Date:   Fri Feb 3 18:55:47 2023 +0100

    dm: avoid split of quoted strings where possible
    
    [ Upstream commit 2e84fecf19e1694338deec8bf6c90ff84f8f31fb ]
    
    Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
    Signed-off-by: Mike Snitzer <snitzer@kernel.org>
    Stable-dep-of: 249bed821b4d ("dm ioctl: Avoid double-fetch of version")
    Signed-off-by: Sasha Levin <sashal@kernel.org>

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index ee269b1d09fac..ff515437d81e7 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -733,8 +733,7 @@ static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
 	}
 
 	if (crypto_skcipher_blocksize(any_tfm(cc)) != cc->iv_size) {
-		ti->error = "Block size of EBOIV cipher does "
-			    "not match IV size of block cipher";
+		ti->error = "Block size of EBOIV cipher does not match IV size of block cipher";
 		return -EINVAL;
 	}
 
diff --git a/drivers/md/dm-ioctl.c b/drivers/md/dm-ioctl.c
index 9fc4a5d51b3fc..2ced382cdd70b 100644
--- a/drivers/md/dm-ioctl.c
+++ b/drivers/md/dm-ioctl.c
@@ -434,8 +434,7 @@ static struct mapped_device *dm_hash_rename(struct dm_ioctl *param,
 		hc = __get_name_cell(new);
 
 	if (hc) {
-		DMERR("Unable to change %s on mapped device %s to one that "
-		      "already exists: %s",
+		DMERR("Unable to change %s on mapped device %s to one that already exists: %s",
 		      change_uuid ? "uuid" : "name",
 		      param->name, new);
 		dm_put(hc->md);
@@ -1822,8 +1821,7 @@ static int check_version(unsigned int cmd, struct dm_ioctl __user *user)
 
 	if ((DM_VERSION_MAJOR != version[0]) ||
 	    (DM_VERSION_MINOR < version[1])) {
-		DMERR("ioctl interface mismatch: "
-		      "kernel(%u.%u.%u), user(%u.%u.%u), cmd(%d)",
+		DMERR("ioctl interface mismatch: kernel(%u.%u.%u), user(%u.%u.%u), cmd(%d)",
 		      DM_VERSION_MAJOR, DM_VERSION_MINOR,
 		      DM_VERSION_PATCHLEVEL,
 		      version[0], version[1], version[2], cmd);
diff --git a/drivers/md/dm-log-userspace-transfer.c b/drivers/md/dm-log-userspace-transfer.c
index 072559b709edd..ee5586e8e1c1e 100644
--- a/drivers/md/dm-log-userspace-transfer.c
+++ b/drivers/md/dm-log-userspace-transfer.c
@@ -108,9 +108,8 @@ static int fill_pkg(struct cn_msg *msg, struct dm_ulog_request *tfr)
 			if (pkg->error != -EAGAIN)
 				*(pkg->data_size) = 0;
 		} else if (tfr->data_size > *(pkg->data_size)) {
-			DMERR("Insufficient space to receive package [%u] "
-			      "(%u vs %zu)", tfr->request_type,
-			      tfr->data_size, *(pkg->data_size));
+			DMERR("Insufficient space to receive package [%u] (%u vs %zu)",
+			      tfr->request_type, tfr->data_size, *(pkg->data_size));
 
 			*(pkg->data_size) = 0;
 			pkg->error = -ENOSPC;
diff --git a/drivers/md/dm-log.c b/drivers/md/dm-log.c
index 159f2c05dfd3c..05141eea18d3c 100644
--- a/drivers/md/dm-log.c
+++ b/drivers/md/dm-log.c
@@ -382,8 +382,7 @@ static int create_log_context(struct dm_dirty_log *log, struct dm_target *ti,
 		else if (!strcmp(argv[1], "nosync"))
 			sync = NOSYNC;
 		else {
-			DMWARN("unrecognised sync argument to "
-			       "dirty region log: %s", argv[1]);
+			DMWARN("unrecognised sync argument to dirty region log: %s", argv[1]);
 			return -EINVAL;
 		}
 	}
diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
index 8bd7e87d3538e..c38e63706d911 100644
--- a/drivers/md/dm-raid1.c
+++ b/drivers/md/dm-raid1.c
@@ -236,8 +236,8 @@ static void fail_mirror(struct mirror *m, enum dm_raid1_error error_type)
 		 * Better to issue requests to same failing device
 		 * than to risk returning corrupt data.
 		 */
-		DMERR("Primary mirror (%s) failed while out-of-sync: "
-		      "Reads may fail.", m->dev->name);
+		DMERR("Primary mirror (%s) failed while out-of-sync: Reads may fail.",
+		      m->dev->name);
 		goto out;
 	}
 
@@ -517,8 +517,7 @@ static void read_callback(unsigned long error, void *context)
 	fail_mirror(m, DM_RAID1_READ_ERROR);
 
 	if (likely(default_ok(m)) || mirror_available(m->ms, bio)) {
-		DMWARN_LIMIT("Read failure on mirror device %s.  "
-			     "Trying alternative device.",
+		DMWARN_LIMIT("Read failure on mirror device %s. Trying alternative device.",
 			     m->dev->name);
 		queue_bio(m->ms, bio, bio_data_dir(bio));
 		return;
diff --git a/drivers/md/dm-snap-persistent.c b/drivers/md/dm-snap-persistent.c
index 5176810f5d243..80b95746a43e0 100644
--- a/drivers/md/dm-snap-persistent.c
+++ b/drivers/md/dm-snap-persistent.c
@@ -354,8 +354,7 @@ static int read_header(struct pstore *ps, int *new_snapshot)
 		return 0;
 
 	if (chunk_size_supplied)
-		DMWARN("chunk size %u in device metadata overrides "
-		       "table chunk size of %u.",
+		DMWARN("chunk size %u in device metadata overrides table chunk size of %u.",
 		       chunk_size, ps->store->chunk_size);
 
 	/* We had a bogus chunk_size. Fix stuff up. */
@@ -958,8 +957,7 @@ int dm_persistent_snapshot_init(void)
 
 	r = dm_exception_store_type_register(&_persistent_compat_type);
 	if (r) {
-		DMERR("Unable to register old-style persistent exception "
-		      "store type");
+		DMERR("Unable to register old-style persistent exception store type");
 		dm_exception_store_type_unregister(&_persistent_type);
 		return r;
 	}
diff --git a/drivers/md/dm-snap-transient.c b/drivers/md/dm-snap-transient.c
index d83a0565bd101..11de107f5f462 100644
--- a/drivers/md/dm-snap-transient.c
+++ b/drivers/md/dm-snap-transient.c
@@ -140,8 +140,7 @@ int dm_transient_snapshot_init(void)
 
 	r = dm_exception_store_type_register(&_transient_compat_type);
 	if (r) {
-		DMWARN("Unable to register old-style transient "
-		       "exception store type");
+		DMWARN("Unable to register old-style transient exception store type");
 		dm_exception_store_type_unregister(&_transient_type);
 		return r;
 	}
diff --git a/drivers/md/dm-snap.c b/drivers/md/dm-snap.c
index cb80d03b37370..b748901a4fb55 100644
--- a/drivers/md/dm-snap.c
+++ b/drivers/md/dm-snap.c
@@ -490,8 +490,7 @@ static int __validate_exception_handover(struct dm_snapshot *snap)
 	if ((__find_snapshots_sharing_cow(snap, &snap_src, &snap_dest,
 					  &snap_merge) == 2) ||
 	    snap_dest) {
-		snap->ti->error = "Snapshot cow pairing for exception "
-				  "table handover failed";
+		snap->ti->error = "Snapshot cow pairing for exception table handover failed";
 		return -EINVAL;
 	}
 
@@ -518,8 +517,7 @@ static int __validate_exception_handover(struct dm_snapshot *snap)
 
 	if (!snap_src->store->type->prepare_merge ||
 	    !snap_src->store->type->commit_merge) {
-		snap->ti->error = "Snapshot exception store does not "
-				  "support snapshot-merge.";
+		snap->ti->error = "Snapshot exception store does not support snapshot-merge.";
 		return -EINVAL;
 	}
 
@@ -937,8 +935,7 @@ static int __remove_single_exception_chunk(struct dm_snapshot *s,
 
 	e = dm_lookup_exception(&s->complete, old_chunk);
 	if (!e) {
-		DMERR("Corruption detected: exception for block %llu is "
-		      "on disk but not in memory",
+		DMERR("Corruption detected: exception for block %llu is on disk but not in memory",
 		      (unsigned long long)old_chunk);
 		return -EINVAL;
 	}
@@ -965,8 +962,7 @@ static int __remove_single_exception_chunk(struct dm_snapshot *s,
 		e->new_chunk++;
 	} else if (old_chunk != e->old_chunk +
 		   dm_consecutive_chunk_count(e)) {
-		DMERR("Attempt to merge block %llu from the "
-		      "middle of a chunk range [%llu - %llu]",
+		DMERR("Attempt to merge block %llu from the middle of a chunk range [%llu - %llu]",
 		      (unsigned long long)old_chunk,
 		      (unsigned long long)e->old_chunk,
 		      (unsigned long long)
@@ -1059,8 +1055,7 @@ static void snapshot_merge_next_chunks(struct dm_snapshot *s)
 						      &new_chunk);
 	if (linear_chunks <= 0) {
 		if (linear_chunks < 0) {
-			DMERR("Read error in exception store: "
-			      "shutting down merge");
+			DMERR("Read error in exception store: shutting down merge");
 			down_write(&s->lock);
 			s->merge_failed = true;
 			up_write(&s->lock);
@@ -2208,12 +2203,10 @@ static int snapshot_preresume(struct dm_target *ti)
 	if (snap_src && snap_dest) {
 		down_read(&snap_src->lock);
 		if (s == snap_src) {
-			DMERR("Unable to resume snapshot source until "
-			      "handover completes.");
+			DMERR("Unable to resume snapshot source until handover completes.");
 			r = -EINVAL;
 		} else if (!dm_suspended(snap_src->ti)) {
-			DMERR("Unable to perform snapshot handover until "
-			      "source is suspended.");
+			DMERR("Unable to perform snapshot handover until source is suspended.");
 			r = -EINVAL;
 		}
 		up_read(&snap_src->lock);
diff --git a/drivers/md/dm-stripe.c b/drivers/md/dm-stripe.c
index a81ed080730a7..547aefe85c076 100644
--- a/drivers/md/dm-stripe.c
+++ b/drivers/md/dm-stripe.c
@@ -108,15 +108,13 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 
 	width = ti->len;
 	if (sector_div(width, stripes)) {
-		ti->error = "Target length not divisible by "
-		    "number of stripes";
+		ti->error = "Target length not divisible by number of stripes";
 		return -EINVAL;
 	}
 
 	tmp_len = width;
 	if (sector_div(tmp_len, chunk_size)) {
-		ti->error = "Target length not divisible by "
-		    "chunk size";
+		ti->error = "Target length not divisible by chunk size";
 		return -EINVAL;
 	}
 
@@ -124,15 +122,13 @@ static int stripe_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	 * Do we have enough arguments for that many stripes ?
 	 */
 	if (argc != (2 + 2 * stripes)) {
-		ti->error = "Not enough destinations "
-			"specified";
+		ti->error = "Not enough destinations specified";
 		return -EINVAL;
 	}
 
 	sc = kmalloc(struct_size(sc, stripe, stripes), GFP_KERNEL);
 	if (!sc) {
-		ti->error = "Memory allocation for striped context "
-		    "failed";
+		ti->error = "Memory allocation for striped context failed";
 		return -ENOMEM;
 	}
 
diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 337e667323c4a..288f600ee56dc 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -234,8 +234,7 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 		return 0;
 
 	if ((start >= dev_size) || (start + len > dev_size)) {
-		DMERR("%s: %pg too small for target: "
-		      "start=%llu, len=%llu, dev_size=%llu",
+		DMERR("%s: %pg too small for target: start=%llu, len=%llu, dev_size=%llu",
 		      dm_device_name(ti->table->md), bdev,
 		      (unsigned long long)start,
 		      (unsigned long long)len,
@@ -280,8 +279,7 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 		return 0;
 
 	if (start & (logical_block_size_sectors - 1)) {
-		DMERR("%s: start=%llu not aligned to h/w "
-		      "logical block size %u of %pg",
+		DMERR("%s: start=%llu not aligned to h/w logical block size %u of %pg",
 		      dm_device_name(ti->table->md),
 		      (unsigned long long)start,
 		      limits->logical_block_size, bdev);
@@ -289,8 +287,7 @@ static int device_area_is_invalid(struct dm_target *ti, struct dm_dev *dev,
 	}
 
 	if (len & (logical_block_size_sectors - 1)) {
-		DMERR("%s: len=%llu not aligned to h/w "
-		      "logical block size %u of %pg",
+		DMERR("%s: len=%llu not aligned to h/w logical block size %u of %pg",
 		      dm_device_name(ti->table->md),
 		      (unsigned long long)len,
 		      limits->logical_block_size, bdev);
@@ -880,8 +877,7 @@ static int dm_table_determine_type(struct dm_table *t)
 			bio_based = 1;
 
 		if (bio_based && request_based) {
-			DMERR("Inconsistent table: different target types"
-			      " can't be mixed up");
+			DMERR("Inconsistent table: different target types can't be mixed up");
 			return -EINVAL;
 		}
 	}
@@ -1184,8 +1180,7 @@ static int dm_table_register_integrity(struct dm_table *t)
 	 * profile the new profile should not conflict.
 	 */
 	if (blk_integrity_compare(dm_disk(md), template_disk) < 0) {
-		DMERR("%s: conflict with existing integrity profile: "
-		      "%s profile mismatch",
+		DMERR("%s: conflict with existing integrity profile: %s profile mismatch",
 		      dm_device_name(t->md),
 		      template_disk->disk_name);
 		return 1;
@@ -1698,8 +1693,7 @@ int dm_calculate_queue_limits(struct dm_table *t,
 		 * for the table.
 		 */
 		if (blk_stack_limits(limits, &ti_limits, 0) < 0)
-			DMWARN("%s: adding target device "
-			       "(start sect %llu len %llu) "
+			DMWARN("%s: adding target device (start sect %llu len %llu) "
 			       "caused an alignment inconsistency",
 			       dm_device_name(t->md),
 			       (unsigned long long) ti->begin,
diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
index 59eb1cb7037a0..4a0e15109997b 100644
--- a/drivers/md/dm-thin-metadata.c
+++ b/drivers/md/dm-thin-metadata.c
@@ -265,15 +265,15 @@ static int sb_check(struct dm_block_validator *v,
 	__le32 csum_le;
 
 	if (dm_block_location(b) != le64_to_cpu(disk_super->blocknr)) {
-		DMERR("sb_check failed: blocknr %llu: "
-		      "wanted %llu", le64_to_cpu(disk_super->blocknr),
+		DMERR("sb_check failed: blocknr %llu: wanted %llu",
+		      le64_to_cpu(disk_super->blocknr),
 		      (unsigned long long)dm_block_location(b));
 		return -ENOTBLK;
 	}
 
 	if (le64_to_cpu(disk_super->magic) != THIN_SUPERBLOCK_MAGIC) {
-		DMERR("sb_check failed: magic %llu: "
-		      "wanted %llu", le64_to_cpu(disk_super->magic),
+		DMERR("sb_check failed: magic %llu: wanted %llu",
+		      le64_to_cpu(disk_super->magic),
 		      (unsigned long long)THIN_SUPERBLOCK_MAGIC);
 		return -EILSEQ;
 	}
diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 13070c25adc3d..0548b5d925f74 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1014,10 +1014,8 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
 
 	sb_block = le64_to_cpu(sb->sb_block);
 	if (sb_block != (u64)dsb->zone->id << zmd->zone_nr_blocks_shift) {
-		dmz_dev_err(dev, "Invalid superblock position "
-			    "(is %llu expected %llu)",
-			    sb_block,
-			    (u64)dsb->zone->id << zmd->zone_nr_blocks_shift);
+		dmz_dev_err(dev, "Invalid superblock position (is %llu expected %llu)",
+			    sb_block, (u64)dsb->zone->id << zmd->zone_nr_blocks_shift);
 		return -EINVAL;
 	}
 	if (zmd->sb_version > 1) {
@@ -1030,16 +1028,14 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
 		} else if (uuid_is_null(&zmd->uuid)) {
 			uuid_copy(&zmd->uuid, &sb_uuid);
 		} else if (!uuid_equal(&zmd->uuid, &sb_uuid)) {
-			dmz_dev_err(dev, "mismatching DM-Zoned uuid, "
-				    "is %pUl expected %pUl",
+			dmz_dev_err(dev, "mismatching DM-Zoned uuid, is %pUl expected %pUl",
 				    &sb_uuid, &zmd->uuid);
 			return -ENXIO;
 		}
 		if (!strlen(zmd->label))
 			memcpy(zmd->label, sb->dmz_label, BDEVNAME_SIZE);
 		else if (memcmp(zmd->label, sb->dmz_label, BDEVNAME_SIZE)) {
-			dmz_dev_err(dev, "mismatching DM-Zoned label, "
-				    "is %s expected %s",
+			dmz_dev_err(dev, "mismatching DM-Zoned label, is %s expected %s",
 				    sb->dmz_label, zmd->label);
 			return -ENXIO;
 		}

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

