Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE0B112D38
	for <lists+dm-devel@lfdr.de>; Wed,  4 Dec 2019 15:07:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575468460;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xwKZOY6WgEX7ym2okmUxvIUUY6+djd9v7IFlCcy9mxw=;
	b=CPjMetgmXJlRSGq25GVWglJUjhmDw3MqWJZXw2INSQs5gUT3gYhPPVMLC7sJauv3Gkn8rZ
	lh8H5QnBxy6r2sLEUdFnawDpHDNtf/lFQ6u9VzINHIVbE+rn4Rutu9uxlAJdIFAXIMhYpo
	kfoDsEWHmZrTZeWEuzLTRPtgvDkEwxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-uHcxgvFQMi-wiH1QQYdUGA-1; Wed, 04 Dec 2019 09:07:37 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA64010CE79F;
	Wed,  4 Dec 2019 14:07:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB99560C63;
	Wed,  4 Dec 2019 14:07:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 48BEC18089CE;
	Wed,  4 Dec 2019 14:07:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB4E7Bn6006891 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Dec 2019 09:07:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B19AA10545F5; Wed,  4 Dec 2019 14:07:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB3E410545EF
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6462585A32B
	for <dm-devel@redhat.com>; Wed,  4 Dec 2019 14:07:08 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-224-uFTvmP6MOaWAZ7Xkee5zrg-1; Wed, 04 Dec 2019 09:07:06 -0500
Received: by mail-lj1-f196.google.com with SMTP id c19so8200037lji.11
	for <dm-devel@redhat.com>; Wed, 04 Dec 2019 06:07:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=2FKSdUh5oYjVbB/mhP4PZCnVvTtHIBBs/6ko75iZmOM=;
	b=qrXHqqXuq2YZX1M1+17w8077Nr6Outb9DbqfqjzpiomJYsFUIwCMuhD/EgGGtzpyjQ
	mw9mpBcyZtKp9kmqoVoB0hBJiqZYnnQEIEtOck9mOA59xrpc8f0x7CrUz2u3N+HYfgmo
	Pq0uA75kAN/0+CFUIqZWvy3SRy+oU/SvF+7aBpwaIuZUu8Vph0Q6D4rOYgGHSbyMIb+D
	+xTARfQq7+I0UL0Zrd8Lq5ONnFuGyqmSHdiLQG8HHombKhp+Y3vXLEA0R9swExcCu3Qh
	Isgp+jLBUsLEnftGdT7zPiEVfIvtqrEf1vhYx+Dv267jW22P09lDuvpO1wKbkAPQijV/
	CzXw==
X-Gm-Message-State: APjAAAXVrAASUjSvcF3msVP1VLFiK7thZeCVy97ElrwXatN8tm7f1anb
	lNbJ71AVRTPg8Gu9iXih94mDhA==
X-Google-Smtp-Source: APXvYqyYrseq4vR0tB//bjOFtvkyicIWXAs6c75VRJ5g9+POmSx4Ab7aEXMmKpJruFgHEwLEGAjrQg==
X-Received: by 2002:a2e:58c:: with SMTP id 134mr2206481ljf.12.1575468424465;
	Wed, 04 Dec 2019 06:07:04 -0800 (PST)
Received: from snf-864.vm.snf.arr ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	i19sm3335533ljj.24.2019.12.04.06.07.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2019 06:07:03 -0800 (PST)
From: Nikos Tsironis <ntsironis@arrikto.com>
To: snitzer@redhat.com, agk@redhat.com, dm-devel@redhat.com
Date: Wed,  4 Dec 2019 16:06:54 +0200
Message-Id: <20191204140654.26214-4-ntsironis@arrikto.com>
In-Reply-To: <20191204140654.26214-1-ntsironis@arrikto.com>
References: <20191204140654.26214-1-ntsironis@arrikto.com>
X-MC-Unique: uFTvmP6MOaWAZ7Xkee5zrg-1
X-MC-Unique: uHcxgvFQMi-wiH1QQYdUGA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB4E7Bn6006891
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, ntsironis@arrikto.com, iliastsi@arrikto.com
Subject: [dm-devel] [PATCH 3/3] dm clone: Flush destination device before
	committing metadata
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-clone maintains an on-disk bitmap which records which regions are
valid in the destination device, i.e., which regions have already been
hydrated, or have been written to directly, via user I/O.

Setting a bit in the on-disk bitmap meas the corresponding region is
valid in the destination device and we redirect all I/O regarding it to
the destination device.

Suppose the destination device has a volatile write-back cache and the
following sequence of events occur:

1. A region gets hydrated, either through the background hydration or
   because it was written to directly, via user I/O.

2. The commit timeout expires and we commit the metadata, marking that
   region as valid in the destination device.

3. The system crashes and the destination device's cache has not been
   flushed, meaning the region's data are lost.

The next time we read that region we read it from the destination
device, since the metadata have been successfully committed, but the
data are lost due to the crash, so we read garbage instead of the old
data.

This has several implications:

1. In case of background hydration or of writes with size smaller than
   the region size (which means we first copy the whole region and then
   issue the smaller write), we corrupt data that the user never
   touched.

2. In case of writes with size equal to the device's logical block size,
   we fail to provide atomic sector writes. When the system recovers the
   user will read garbage from the sector instead of the old data or the
   new data.

3. In case of writes without the FUA flag set, after the system
   recovers, the written sectors will contain garbage instead of a
   random mix of sectors containing either old data or new data, thus we
   fail again to provide atomic sector writes.

4. Even when the user flushes the dm-clone device, because we first
   commit the metadata and then pass down the flush, the same risk for
   corruption exists (if the system crashes after the metadata have been
   committed but before the flush is passed down).

The only case which is unaffected is that of writes with size equal to
the region size and with the FUA flag set. But, because FUA writes
trigger metadata commits, this case can trigger the corruption
indirectly.

To solve this and avoid the potential data corruption we flush the
destination device **before** committing the metadata.

This ensures that any freshly hydrated regions, for which we commit the
metadata, are properly written to non-volatile storage and won't be lost
in case of a crash.

Fixes: 7431b7835f55 ("dm: add clone target")
Cc: stable@vger.kernel.org # v5.4+
Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
---
 drivers/md/dm-clone-target.c | 46 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
index 613c913c296c..d1e1b5b56b1b 100644
--- a/drivers/md/dm-clone-target.c
+++ b/drivers/md/dm-clone-target.c
@@ -86,6 +86,12 @@ struct clone {
 
 	struct dm_clone_metadata *cmd;
 
+	/*
+	 * bio used to flush the destination device, before committing the
+	 * metadata.
+	 */
+	struct bio flush_bio;
+
 	/* Region hydration hash table */
 	struct hash_table_bucket *ht;
 
@@ -1108,10 +1114,13 @@ static bool need_commit_due_to_time(struct clone *clone)
 /*
  * A non-zero return indicates read-only or fail mode.
  */
-static int commit_metadata(struct clone *clone)
+static int commit_metadata(struct clone *clone, bool *dest_dev_flushed)
 {
 	int r = 0;
 
+	if (dest_dev_flushed)
+		*dest_dev_flushed = false;
+
 	mutex_lock(&clone->commit_lock);
 
 	if (!dm_clone_changed_this_transaction(clone->cmd))
@@ -1128,6 +1137,19 @@ static int commit_metadata(struct clone *clone)
 		goto out;
 	}
 
+	bio_reset(&clone->flush_bio);
+	bio_set_dev(&clone->flush_bio, clone->dest_dev->bdev);
+	clone->flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
+
+	r = submit_bio_wait(&clone->flush_bio);
+	if (unlikely(r)) {
+		__metadata_operation_failed(clone, "flush destination device", r);
+		goto out;
+	}
+
+	if (dest_dev_flushed)
+		*dest_dev_flushed = true;
+
 	r = dm_clone_metadata_commit(clone->cmd);
 	if (unlikely(r)) {
 		__metadata_operation_failed(clone, "dm_clone_metadata_commit", r);
@@ -1199,6 +1221,7 @@ static void process_deferred_bios(struct clone *clone)
 static void process_deferred_flush_bios(struct clone *clone)
 {
 	struct bio *bio;
+	bool dest_dev_flushed;
 	struct bio_list bios = BIO_EMPTY_LIST;
 	struct bio_list bio_completions = BIO_EMPTY_LIST;
 
@@ -1218,7 +1241,7 @@ static void process_deferred_flush_bios(struct clone *clone)
 	    !(dm_clone_changed_this_transaction(clone->cmd) && need_commit_due_to_time(clone)))
 		return;
 
-	if (commit_metadata(clone)) {
+	if (commit_metadata(clone, &dest_dev_flushed)) {
 		bio_list_merge(&bios, &bio_completions);
 
 		while ((bio = bio_list_pop(&bios)))
@@ -1232,8 +1255,17 @@ static void process_deferred_flush_bios(struct clone *clone)
 	while ((bio = bio_list_pop(&bio_completions)))
 		bio_endio(bio);
 
-	while ((bio = bio_list_pop(&bios)))
-		generic_make_request(bio);
+	while ((bio = bio_list_pop(&bios))) {
+		if ((bio->bi_opf & REQ_PREFLUSH) && dest_dev_flushed) {
+			/* We just flushed the destination device as part of
+			 * the metadata commit, so there is no reason to send
+			 * another flush.
+			 */
+			bio_endio(bio);
+		} else {
+			generic_make_request(bio);
+		}
+	}
 }
 
 static void do_worker(struct work_struct *work)
@@ -1405,7 +1437,7 @@ static void clone_status(struct dm_target *ti, status_type_t type,
 
 		/* Commit to ensure statistics aren't out-of-date */
 		if (!(status_flags & DM_STATUS_NOFLUSH_FLAG) && !dm_suspended(ti))
-			(void) commit_metadata(clone);
+			(void) commit_metadata(clone, NULL);
 
 		r = dm_clone_get_free_metadata_block_count(clone->cmd, &nr_free_metadata_blocks);
 
@@ -1839,6 +1871,7 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	bio_list_init(&clone->deferred_flush_completions);
 	clone->hydration_offset = 0;
 	atomic_set(&clone->hydrations_in_flight, 0);
+	bio_init(&clone->flush_bio, NULL, 0);
 
 	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
 	if (!clone->wq) {
@@ -1912,6 +1945,7 @@ static void clone_dtr(struct dm_target *ti)
 	struct clone *clone = ti->private;
 
 	mutex_destroy(&clone->commit_lock);
+	bio_uninit(&clone->flush_bio);
 
 	for (i = 0; i < clone->nr_ctr_args; i++)
 		kfree(clone->ctr_args[i]);
@@ -1966,7 +2000,7 @@ static void clone_postsuspend(struct dm_target *ti)
 	wait_event(clone->hydration_stopped, !atomic_read(&clone->hydrations_in_flight));
 	flush_workqueue(clone->wq);
 
-	(void) commit_metadata(clone);
+	(void) commit_metadata(clone, NULL);
 }
 
 static void clone_resume(struct dm_target *ti)
-- 
2.11.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

