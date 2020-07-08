Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED91218393
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 11:29:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-wRUAHZ_QNUSFHK5i-ZzRjw-1; Wed, 08 Jul 2020 05:29:54 -0400
X-MC-Unique: wRUAHZ_QNUSFHK5i-ZzRjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B01FF8005B0;
	Wed,  8 Jul 2020 09:29:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 334E95DA27;
	Wed,  8 Jul 2020 09:29:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C05D72F60;
	Wed,  8 Jul 2020 09:29:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0689SUjU020885 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 8 Jul 2020 05:28:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E5532156A50; Wed,  8 Jul 2020 09:28:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699DA2156A30
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 09:28:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACB6F1049840
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 09:28:27 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-118-_32Ste13Opys7mqDvKN54A-1; Wed, 08 Jul 2020 05:28:25 -0400
X-MC-Unique: _32Ste13Opys7mqDvKN54A-1
IronPort-SDR: JohGqhG5bfTiAlTW/tgYApuet0EGbbH7I8lctpGx0ggFlN2+qJ4WX7/DstEo2kYYIqbCPDzhX4
	tje0454/M+2hSAilczSq+tkmIugKYOdCURn2ZRgCPbuDWe8oFU+F0RH58G2fpm5IjExV1NDMfH
	kgFDiZrB3T1kNYEh8/MPggUwCxHm8p6P8cfDCTH/Rt2MEOzFExRMCygMtqRSJ35MLWr/6eTtIj
	pik1Iq64sM9fEazKAEjKk3towQ/UU3WBpGHmXm3G910NTbjFYCr0u9iRqpFQGFrxgi03ksm/0h
	B9o=
X-IronPort-AV: E=Sophos;i="5.75,327,1589212800"; d="scan'208";a="251151981"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 17:28:11 +0800
IronPort-SDR: oFdeuN8SkOsH2sjksp6LPXeIQoCaz4oy6FE0H77E0nB4KC0st+GMrk2KZ9uXg/vRY6TmYpSNVP
	okSjPBS91UGSDjrbm9TII5rH47pLek/m4=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	08 Jul 2020 02:16:16 -0700
IronPort-SDR: dmA/DODBKwN8JFU2VX6sZpEIn+LG/4XImwpeTT+8QDpuN6KVkxfq3iFhZbrFRzARz1YVmTrtFQ
	a/mOzrOBrbHg==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 08 Jul 2020 02:28:11 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  8 Jul 2020 18:28:08 +0900
Message-Id: <20200708092808.57041-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH] dm crypt: Enable zoned block device support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enable support for zoned block devices. This is done by:
1) implementing the target report_zones method
2) adding the DM_TARGET_ZONED_HM flag to the target features
3) Introducing inline write encryption completion to preserve write
   ordering

The last point is implemented by introducing the internal flag
DM_CRYPT_WRITE_INLINE. When this flag is set for a zoned block device,
kcryptd_crypt_write_convert() always waits inline for the completion of
a write request encryption if the request is not already completed once
crypt_convert() returns. Completions of write requests encryption is
signaled using the restart completion by kcryptd_async_done(). This
mechanism allows using cyphers that have an asynchronous
implementation, isolating dm-crypt from any potential request
completion reordering for these cyphers.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-crypt.c | 83 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 76 insertions(+), 7 deletions(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 7536ecb2c95d..bad05c5ed3b5 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -129,7 +129,8 @@ struct iv_elephant_private {
  */
 enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
 	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD,
-	     DM_CRYPT_NO_READ_WORKQUEUE, DM_CRYPT_NO_WRITE_WORKQUEUE };
+	     DM_CRYPT_NO_READ_WORKQUEUE, DM_CRYPT_NO_WRITE_WORKQUEUE,
+	     DM_CRYPT_WRITE_INLINE };
 
 enum cipher_flags {
 	CRYPT_MODE_INTEGRITY_AEAD,	/* Use authenticated mode for cihper */
@@ -1919,9 +1920,32 @@ static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
 	spin_unlock_irqrestore(&cc->write_thread_lock, flags);
 }
 
+static bool kcryptd_crypt_write_inline(struct crypt_config *cc,
+				       struct convert_context *ctx)
+
+{
+	if (!test_bit(DM_CRYPT_WRITE_INLINE, &cc->flags))
+		return false;
+
+	/*
+	 * Note: zone append writes (REQ_OP_ZONE_APPEND) do not have ordering
+	 * constraints so they do not need to be issued inline by
+	 * kcryptd_crypt_write_convert().
+	 */
+	switch (bio_op(ctx->bio_in)) {
+	case REQ_OP_WRITE:
+	case REQ_OP_WRITE_SAME:
+	case REQ_OP_WRITE_ZEROES:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
 {
 	struct crypt_config *cc = io->cc;
+	struct convert_context *ctx = &io->ctx;
 	struct bio *clone;
 	int crypt_finished;
 	sector_t sector = io->sector;
@@ -1931,7 +1955,7 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
 	 * Prevent io from disappearing until this function completes.
 	 */
 	crypt_inc_pending(io);
-	crypt_convert_init(cc, &io->ctx, NULL, io->base_bio, sector);
+	crypt_convert_init(cc, ctx, NULL, io->base_bio, sector);
 
 	clone = crypt_alloc_buffer(io, io->base_bio->bi_iter.bi_size);
 	if (unlikely(!clone)) {
@@ -1945,11 +1969,16 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
 	sector += bio_sectors(clone);
 
 	crypt_inc_pending(io);
-	r = crypt_convert(cc, &io->ctx,
+	r = crypt_convert(cc, ctx,
 			  test_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags));
 	if (r)
 		io->error = r;
-	crypt_finished = atomic_dec_and_test(&io->ctx.cc_pending);
+	crypt_finished = atomic_dec_and_test(&ctx->cc_pending);
+	if (!crypt_finished && kcryptd_crypt_write_inline(cc, ctx)) {
+		/* Wait for completion signaled by kcryptd_async_done() */
+		wait_for_completion(&ctx->restart);
+		crypt_finished = 1;
+	}
 
 	/* Encryption was already finished, submit io now */
 	if (crypt_finished) {
@@ -2021,10 +2050,21 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
 	if (!atomic_dec_and_test(&ctx->cc_pending))
 		return;
 
-	if (bio_data_dir(io->base_bio) == READ)
+	/*
+	 * The request is fully completed: for inline writes, let
+	 * kcryptd_crypt_write_convert() do the IO submission.
+	 */
+	if (bio_data_dir(io->base_bio) == READ) {
 		kcryptd_crypt_read_done(io);
-	else
-		kcryptd_crypt_write_io_submit(io, 1);
+		return;
+	}
+
+	if (kcryptd_crypt_write_inline(cc, ctx)) {
+		complete(&ctx->restart);
+		return;
+	}
+
+	kcryptd_crypt_write_io_submit(io, 1);
 }
 
 static void kcryptd_crypt(struct work_struct *work)
@@ -2936,6 +2976,21 @@ static int crypt_ctr_optional(struct dm_target *ti, unsigned int argc, char **ar
 	return 0;
 }
 
+#ifdef CONFIG_BLK_DEV_ZONED
+
+static int crypt_report_zones(struct dm_target *ti,
+		struct dm_report_zones_args *args, unsigned int nr_zones)
+{
+	struct crypt_config *cc = ti->private;
+	sector_t sector = cc->start + dm_target_offset(ti, args->next_sector);
+
+	args->start = cc->start;
+	return blkdev_report_zones(cc->dev->bdev, sector, nr_zones,
+				   dm_report_zones_cb, args);
+}
+
+#endif
+
 /*
  * Construct an encryption mapping:
  * <cipher> [<key>|:<key_size>:<user|logon>:<key_description>] <iv_offset> <dev_path> <start>
@@ -3069,6 +3124,16 @@ static int crypt_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 	cc->start = tmpll;
 
+	/*
+	 * For zoned block devices, we need to preserve the issuer write
+	 * ordering. To do so, disable write workqueues and force inline
+	 * encryption completion.
+	 */
+	if (bdev_is_zoned(cc->dev->bdev)) {
+		set_bit(DM_CRYPT_NO_WRITE_WORKQUEUE, &cc->flags);
+		set_bit(DM_CRYPT_WRITE_INLINE, &cc->flags);
+	}
+
 	if (crypt_integrity_aead(cc) || cc->integrity_iv_size) {
 		ret = crypt_integrity_ctr(cc, ti);
 		if (ret)
@@ -3358,6 +3423,10 @@ static struct target_type crypt_target = {
 	.module = THIS_MODULE,
 	.ctr    = crypt_ctr,
 	.dtr    = crypt_dtr,
+#ifdef CONFIG_BLK_DEV_ZONED
+	.features = DM_TARGET_ZONED_HM,
+	.report_zones = crypt_report_zones,
+#endif
 	.map    = crypt_map,
 	.status = crypt_status,
 	.postsuspend = crypt_postsuspend,
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

