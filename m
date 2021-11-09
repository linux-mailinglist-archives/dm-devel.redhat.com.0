Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBED44A9F5
	for <lists+dm-devel@lfdr.de>; Tue,  9 Nov 2021 10:01:55 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-3sxkhG7SOieljJopIqFY-g-1; Tue, 09 Nov 2021 04:01:52 -0500
X-MC-Unique: 3sxkhG7SOieljJopIqFY-g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B90DA19200DC;
	Tue,  9 Nov 2021 09:01:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9437060843;
	Tue,  9 Nov 2021 09:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01524181A1CF;
	Tue,  9 Nov 2021 09:01:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
	[10.11.54.2])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1A990Bet017713 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Nov 2021 04:00:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E37F4047279; Tue,  9 Nov 2021 09:00:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AADC4047272
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 09:00:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 342CF1066565
	for <dm-devel@redhat.com>; Tue,  9 Nov 2021 09:00:11 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-208-R7l4_nL5MbiSUKlYhhOcHg-1; Tue, 09 Nov 2021 04:00:09 -0500
X-MC-Unique: R7l4_nL5MbiSUKlYhhOcHg-1
Received: from [2001:4bb8:19a:7ee7:fb46:2fe1:8652:d9d4] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkMZh-000s7y-MB; Tue, 09 Nov 2021 08:33:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Date: Tue,  9 Nov 2021 09:33:01 +0100
Message-Id: <20211109083309.584081-22-hch@lst.de>
In-Reply-To: <20211109083309.584081-1-hch@lst.de>
References: <20211109083309.584081-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: nvdimm@lists.linux.dev, Mike Snitzer <snitzer@redhat.com>,
	linux-s390@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	virtualization@lists.linux-foundation.org,
	linux-xfs@vger.kernel.org, dm-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>
Subject: [dm-devel] [PATCH 21/29] xfs: move dax device handling into
	xfs_{alloc, free}_buftarg
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hide the DAX device lookup from the xfs_super.c code.

Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 fs/xfs/xfs_buf.c   |  8 ++++----
 fs/xfs/xfs_buf.h   |  4 ++--
 fs/xfs/xfs_super.c | 26 +++++---------------------
 3 files changed, 11 insertions(+), 27 deletions(-)

diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 631c5a61d89b7..4d4553ffa7050 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -1892,6 +1892,7 @@ xfs_free_buftarg(
 	list_lru_destroy(&btp->bt_lru);
 
 	blkdev_issue_flush(btp->bt_bdev);
+	fs_put_dax(btp->bt_daxdev);
 
 	kmem_free(btp);
 }
@@ -1932,11 +1933,10 @@ xfs_setsize_buftarg_early(
 	return xfs_setsize_buftarg(btp, bdev_logical_block_size(bdev));
 }
 
-xfs_buftarg_t *
+struct xfs_buftarg *
 xfs_alloc_buftarg(
 	struct xfs_mount	*mp,
-	struct block_device	*bdev,
-	struct dax_device	*dax_dev)
+	struct block_device	*bdev)
 {
 	xfs_buftarg_t		*btp;
 
@@ -1945,7 +1945,7 @@ xfs_alloc_buftarg(
 	btp->bt_mount = mp;
 	btp->bt_dev =  bdev->bd_dev;
 	btp->bt_bdev = bdev;
-	btp->bt_daxdev = dax_dev;
+	btp->bt_daxdev = fs_dax_get_by_bdev(bdev);
 
 	/*
 	 * Buffer IO error rate limiting. Limit it to no more than 10 messages
diff --git a/fs/xfs/xfs_buf.h b/fs/xfs/xfs_buf.h
index 6b0200b8007d1..bd7f709f0d232 100644
--- a/fs/xfs/xfs_buf.h
+++ b/fs/xfs/xfs_buf.h
@@ -338,8 +338,8 @@ xfs_buf_update_cksum(struct xfs_buf *bp, unsigned long cksum_offset)
 /*
  *	Handling of buftargs.
  */
-extern struct xfs_buftarg *xfs_alloc_buftarg(struct xfs_mount *,
-		struct block_device *, struct dax_device *);
+struct xfs_buftarg *xfs_alloc_buftarg(struct xfs_mount *mp,
+		struct block_device *bdev);
 extern void xfs_free_buftarg(struct xfs_buftarg *);
 extern void xfs_buftarg_wait(struct xfs_buftarg *);
 extern void xfs_buftarg_drain(struct xfs_buftarg *);
diff --git a/fs/xfs/xfs_super.c b/fs/xfs/xfs_super.c
index 3a45d5caa28d5..7262716afb215 100644
--- a/fs/xfs/xfs_super.c
+++ b/fs/xfs/xfs_super.c
@@ -391,26 +391,19 @@ STATIC void
 xfs_close_devices(
 	struct xfs_mount	*mp)
 {
-	struct dax_device *dax_ddev = mp->m_ddev_targp->bt_daxdev;
-
 	if (mp->m_logdev_targp && mp->m_logdev_targp != mp->m_ddev_targp) {
 		struct block_device *logdev = mp->m_logdev_targp->bt_bdev;
-		struct dax_device *dax_logdev = mp->m_logdev_targp->bt_daxdev;
 
 		xfs_free_buftarg(mp->m_logdev_targp);
 		xfs_blkdev_put(logdev);
-		fs_put_dax(dax_logdev);
 	}
 	if (mp->m_rtdev_targp) {
 		struct block_device *rtdev = mp->m_rtdev_targp->bt_bdev;
-		struct dax_device *dax_rtdev = mp->m_rtdev_targp->bt_daxdev;
 
 		xfs_free_buftarg(mp->m_rtdev_targp);
 		xfs_blkdev_put(rtdev);
-		fs_put_dax(dax_rtdev);
 	}
 	xfs_free_buftarg(mp->m_ddev_targp);
-	fs_put_dax(dax_ddev);
 }
 
 /*
@@ -428,8 +421,6 @@ xfs_open_devices(
 	struct xfs_mount	*mp)
 {
 	struct block_device	*ddev = mp->m_super->s_bdev;
-	struct dax_device	*dax_ddev = fs_dax_get_by_bdev(ddev);
-	struct dax_device	*dax_logdev = NULL, *dax_rtdev = NULL;
 	struct block_device	*logdev = NULL, *rtdev = NULL;
 	int			error;
 
@@ -439,8 +430,7 @@ xfs_open_devices(
 	if (mp->m_logname) {
 		error = xfs_blkdev_get(mp, mp->m_logname, &logdev);
 		if (error)
-			goto out;
-		dax_logdev = fs_dax_get_by_bdev(logdev);
+			return error;
 	}
 
 	if (mp->m_rtname) {
@@ -454,25 +444,24 @@ xfs_open_devices(
 			error = -EINVAL;
 			goto out_close_rtdev;
 		}
-		dax_rtdev = fs_dax_get_by_bdev(rtdev);
 	}
 
 	/*
 	 * Setup xfs_mount buffer target pointers
 	 */
 	error = -ENOMEM;
-	mp->m_ddev_targp = xfs_alloc_buftarg(mp, ddev, dax_ddev);
+	mp->m_ddev_targp = xfs_alloc_buftarg(mp, ddev);
 	if (!mp->m_ddev_targp)
 		goto out_close_rtdev;
 
 	if (rtdev) {
-		mp->m_rtdev_targp = xfs_alloc_buftarg(mp, rtdev, dax_rtdev);
+		mp->m_rtdev_targp = xfs_alloc_buftarg(mp, rtdev);
 		if (!mp->m_rtdev_targp)
 			goto out_free_ddev_targ;
 	}
 
 	if (logdev && logdev != ddev) {
-		mp->m_logdev_targp = xfs_alloc_buftarg(mp, logdev, dax_logdev);
+		mp->m_logdev_targp = xfs_alloc_buftarg(mp, logdev);
 		if (!mp->m_logdev_targp)
 			goto out_free_rtdev_targ;
 	} else {
@@ -488,14 +477,9 @@ xfs_open_devices(
 	xfs_free_buftarg(mp->m_ddev_targp);
  out_close_rtdev:
 	xfs_blkdev_put(rtdev);
-	fs_put_dax(dax_rtdev);
  out_close_logdev:
-	if (logdev && logdev != ddev) {
+	if (logdev && logdev != ddev)
 		xfs_blkdev_put(logdev);
-		fs_put_dax(dax_logdev);
-	}
- out:
-	fs_put_dax(dax_ddev);
 	return error;
 }
 
-- 
2.30.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

