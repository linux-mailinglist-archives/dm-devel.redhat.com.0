Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF52491FF6
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jan 2022 08:21:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-217-jYmT8-nSOiqpJBboLtRSaw-1; Tue, 18 Jan 2022 02:20:59 -0500
X-MC-Unique: jYmT8-nSOiqpJBboLtRSaw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 428361008063;
	Tue, 18 Jan 2022 07:20:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7954DC26;
	Tue, 18 Jan 2022 07:20:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9F9721806D1C;
	Tue, 18 Jan 2022 07:20:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I7KW39012999 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 18 Jan 2022 02:20:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 00E69400E10D; Tue, 18 Jan 2022 07:20:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1B7C400F3FF
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA1AA2A7A50E
	for <dm-devel@redhat.com>; Tue, 18 Jan 2022 07:20:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
	[198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-553-Bp9pEfO4M36wqFPnHgSMBw-1; Tue, 18 Jan 2022 02:20:28 -0500
X-MC-Unique: Bp9pEfO4M36wqFPnHgSMBw-1
Received: from [2001:4bb8:184:72a4:a4a9:19c0:5242:7768] (helo=localhost)
	by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9in3-000ZZB-B2; Tue, 18 Jan 2022 07:20:25 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 18 Jan 2022 08:19:44 +0100
Message-Id: <20220118071952.1243143-12-hch@lst.de>
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
Subject: [dm-devel] [PATCH 11/19] rnbd-src: remove struct rnbd_dev_blk_io
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Only the priv field of rnbd_dev_blk_io is used, so store the value of
that in bio->bi_private directly and remove the entire bio_set overhead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/block/rnbd/rnbd-srv-dev.c |  4 +---
 drivers/block/rnbd/rnbd-srv-dev.h | 13 ++-----------
 drivers/block/rnbd/rnbd-srv.c     | 30 +++++-------------------------
 drivers/block/rnbd/rnbd-srv.h     |  1 -
 4 files changed, 8 insertions(+), 40 deletions(-)

diff --git a/drivers/block/rnbd/rnbd-srv-dev.c b/drivers/block/rnbd/rnbd-srv-dev.c
index 98d3e591a0885..c5d0a03911659 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.c
+++ b/drivers/block/rnbd/rnbd-srv-dev.c
@@ -12,8 +12,7 @@
 #include "rnbd-srv-dev.h"
 #include "rnbd-log.h"
 
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs)
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags)
 {
 	struct rnbd_dev *dev;
 	int ret;
@@ -30,7 +29,6 @@ struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
 
 	dev->blk_open_flags = flags;
 	bdevname(dev->bdev, dev->name);
-	dev->ibd_bio_set = bs;
 
 	return dev;
 
diff --git a/drivers/block/rnbd/rnbd-srv-dev.h b/drivers/block/rnbd/rnbd-srv-dev.h
index 1a14ece0be726..2c3df02b5e8ec 100644
--- a/drivers/block/rnbd/rnbd-srv-dev.h
+++ b/drivers/block/rnbd/rnbd-srv-dev.h
@@ -14,25 +14,16 @@
 
 struct rnbd_dev {
 	struct block_device	*bdev;
-	struct bio_set		*ibd_bio_set;
 	fmode_t			blk_open_flags;
 	char			name[BDEVNAME_SIZE];
 };
 
-struct rnbd_dev_blk_io {
-	struct rnbd_dev *dev;
-	void		 *priv;
-	/* have to be last member for front_pad usage of bioset_init */
-	struct bio	bio;
-};
-
 /**
  * rnbd_dev_open() - Open a device
+ * @path:	path to open
  * @flags:	open flags
- * @bs:		bio_set to use during block io,
  */
-struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags,
-			       struct bio_set *bs);
+struct rnbd_dev *rnbd_dev_open(const char *path, fmode_t flags);
 
 /**
  * rnbd_dev_close() - Close a device
diff --git a/drivers/block/rnbd/rnbd-srv.c b/drivers/block/rnbd/rnbd-srv.c
index 65c670e96075b..b1ac1414b56d5 100644
--- a/drivers/block/rnbd/rnbd-srv.c
+++ b/drivers/block/rnbd/rnbd-srv.c
@@ -116,9 +116,7 @@ rnbd_get_sess_dev(int dev_id, struct rnbd_srv_session *srv_sess)
 
 static void rnbd_dev_bi_end_io(struct bio *bio)
 {
-	struct rnbd_dev_blk_io *io = bio->bi_private;
-
-	rnbd_endio(io->priv, blk_status_to_errno(bio->bi_status));
+	rnbd_endio(bio->bi_private, blk_status_to_errno(bio->bi_status));
 	bio_put(bio);
 }
 
@@ -131,7 +129,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	struct rnbd_srv_sess_dev *sess_dev;
 	u32 dev_id;
 	int err;
-	struct rnbd_dev_blk_io *io;
 	struct bio *bio;
 	short prio;
 
@@ -152,20 +149,16 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 	priv->sess_dev = sess_dev;
 	priv->id = id;
 
-	bio = bio_alloc_bioset(GFP_KERNEL, 1, sess_dev->rnbd_dev->ibd_bio_set);
+	bio = bio_alloc(GFP_KERNEL, 1);
 	if (bio_add_page(bio, virt_to_page(data), datalen,
 			offset_in_page(data))) {
 		rnbd_srv_err(sess_dev, "Failed to map data to bio\n");
 		err = -EINVAL;
-		goto sess_dev_put;
+		goto bio_put;
 	}
 
-	io = container_of(bio, struct rnbd_dev_blk_io, bio);
-	io->dev = sess_dev->rnbd_dev;
-	io->priv = priv;
-
 	bio->bi_end_io = rnbd_dev_bi_end_io;
-	bio->bi_private = io;
+	bio->bi_private = priv;
 	bio->bi_opf = rnbd_to_bio_flags(le32_to_cpu(msg->rw));
 	bio->bi_iter.bi_sector = le64_to_cpu(msg->sector);
 	bio->bi_iter.bi_size = le32_to_cpu(msg->bi_size);
@@ -180,7 +173,6 @@ static int process_rdma(struct rnbd_srv_session *srv_sess,
 
 bio_put:
 	bio_put(bio);
-sess_dev_put:
 	rnbd_put_sess_dev(sess_dev);
 err:
 	kfree(priv);
@@ -261,7 +253,6 @@ static void destroy_sess(struct rnbd_srv_session *srv_sess)
 
 out:
 	xa_destroy(&srv_sess->index_idr);
-	bioset_exit(&srv_sess->sess_bio_set);
 
 	pr_info("RTRS Session %s disconnected\n", srv_sess->sessname);
 
@@ -290,16 +281,6 @@ static int create_sess(struct rtrs_srv_sess *rtrs)
 		return -ENOMEM;
 
 	srv_sess->queue_depth = rtrs_srv_get_queue_depth(rtrs);
-	err = bioset_init(&srv_sess->sess_bio_set, srv_sess->queue_depth,
-			  offsetof(struct rnbd_dev_blk_io, bio),
-			  BIOSET_NEED_BVECS);
-	if (err) {
-		pr_err("Allocating srv_session for path %s failed\n",
-		       pathname);
-		kfree(srv_sess);
-		return err;
-	}
-
 	xa_init_flags(&srv_sess->index_idr, XA_FLAGS_ALLOC);
 	INIT_LIST_HEAD(&srv_sess->sess_dev_list);
 	mutex_init(&srv_sess->lock);
@@ -748,8 +729,7 @@ static int process_msg_open(struct rnbd_srv_session *srv_sess,
 		goto reject;
 	}
 
-	rnbd_dev = rnbd_dev_open(full_path, open_flags,
-				 &srv_sess->sess_bio_set);
+	rnbd_dev = rnbd_dev_open(full_path, open_flags);
 	if (IS_ERR(rnbd_dev)) {
 		pr_err("Opening device '%s' on session %s failed, failed to open the block device, err: %ld\n",
 		       full_path, srv_sess->sessname, PTR_ERR(rnbd_dev));
diff --git a/drivers/block/rnbd/rnbd-srv.h b/drivers/block/rnbd/rnbd-srv.h
index e5604bce123ab..be2ae486d407e 100644
--- a/drivers/block/rnbd/rnbd-srv.h
+++ b/drivers/block/rnbd/rnbd-srv.h
@@ -23,7 +23,6 @@ struct rnbd_srv_session {
 	struct rtrs_srv_sess	*rtrs;
 	char			sessname[NAME_MAX];
 	int			queue_depth;
-	struct bio_set		sess_bio_set;
 
 	struct xarray		index_idr;
 	/* List of struct rnbd_srv_sess_dev */
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

