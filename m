Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A35491FDF
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jan 2022 08:20:56 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-668-gsHoJlzdOXy6IbNnCEah6Q-1; Tue, 18 Jan 2022 02:20:52 -0500
X-MC-Unique: gsHoJlzdOXy6IbNnCEah6Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCA941006AAB;
	Tue, 18 Jan 2022 07:20:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 561FD795AE;
	Tue, 18 Jan 2022 07:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01B244BB7B;
	Tue, 18 Jan 2022 07:20:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I7KPJD012973 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 02:20:25 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2C16B400F3FD; Tue, 18 Jan 2022 07:20:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27DCE400E10D
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 114542A7A517
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-503-BvDy4XaqMZmYLcja8CfVFw-1; Tue, 18 Jan 2022 02:20:22 -0500
X-MC-Unique: BvDy4XaqMZmYLcja8CfVFw-1
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9imx-000ZVy-OM; Tue, 18 Jan 2022 07:20:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:42 +0100
Message-Id: <20220118071952.1243143-10-hch@lst.de>
In-Reply-To: <20220118071952.1243143-1-hch@lst.de>
References: <20220118071952.1243143-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Ryusuke Konishi <konishi.ryusuke@gmail.com>,
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.co>,
	dm-devel@redhat.com, "Md . Haris Iqbal " <haris.iqbal@ionos.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
	Andrew Morton <akpm@linux-foundation.org>, ntfs3@lists.linux.dev,
	Jack Wang <jinpu.wang@ionos.com>, Pavel Begunkov <asml.silence@gmail.com>,
	drbd-dev@lists.linbit.com
Subject: [dm-devel] [PATCH 09/19] drbd: bio_alloc can't fail if it is allow
	to sleep
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove handling of NULL returns from sleeping bio_alloc calls given that
those can't fail.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/drbd/drbd_receiver.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/block/drbd/drbd_receiver.c b/drivers/block/drbd/drbd_receiver.c
index 6df2539e215ba..90402abb77e93 100644
--- a/drivers/block/drbd/drbd_receiver.c
+++ b/drivers/block/drbd/drbd_receiver.c
@@ -1281,14 +1281,13 @@ static void submit_one_flush(struct drbd_device *device, struct issue_flush_cont
 {
 	struct bio *bio = bio_alloc(GFP_NOIO, 0);
 	struct one_flush_context *octx = kmalloc(sizeof(*octx), GFP_NOIO);
-	if (!bio || !octx) {
-		drbd_warn(device, "Could not allocate a bio, CANNOT ISSUE FLUSH\n");
+
+	if (!octx) {
+		drbd_warn(device, "Could not allocate a octx, CANNOT ISSUE FLUSH\n");
 		/* FIXME: what else can I do now?  disconnecting or detaching
 		 * really does not help to improve the state of the world, either.
 		 */
-		kfree(octx);
-		if (bio)
-			bio_put(bio);
+		bio_put(bio);
 
 		ctx->error = -ENOMEM;
 		put_ldev(device);
@@ -1688,10 +1687,6 @@ int drbd_submit_peer_request(struct drbd_device *device,
 	 */
 next_bio:
 	bio = bio_alloc(GFP_NOIO, nr_pages);
-	if (!bio) {
-		drbd_err(device, "submit_ee: Allocation of a bio failed (nr_pages=%u)\n", nr_pages);
-		goto fail;
-	}
 	/* > peer_req->i.sector, unless this is the first bio */
 	bio->bi_iter.bi_sector = sector;
 	bio_set_dev(bio, device->ldev->backing_bdev);
@@ -1726,14 +1721,6 @@ int drbd_submit_peer_request(struct drbd_device *device,
 		drbd_submit_bio_noacct(device, fault_type, bio);
 	} while (bios);
 	return 0;
-
-fail:
-	while (bios) {
-		bio = bios;
-		bios = bios->bi_next;
-		bio_put(bio);
-	}
-	return err;
 }
 
 static void drbd_remove_epoch_entry_interval(struct drbd_device *device,
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

