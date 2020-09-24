Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 76872276A5D
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 09:15:21 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-FOAHWj52N-C_QgvTwLk7Bg-1; Thu, 24 Sep 2020 03:15:18 -0400
X-MC-Unique: FOAHWj52N-C_QgvTwLk7Bg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 958F264094;
	Thu, 24 Sep 2020 07:15:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7075C73668;
	Thu, 24 Sep 2020 07:15:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 124708C7A3;
	Thu, 24 Sep 2020 07:15:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O7BtEn005484 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 03:11:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 713A02156A23; Thu, 24 Sep 2020 07:11:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CCD62166B27
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:11:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52DE68007DF
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:11:55 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-60-JFLHvP6wNcq0s9-teo8Q5A-1; Thu, 24 Sep 2020 03:11:53 -0400
X-MC-Unique: JFLHvP6wNcq0s9-teo8Q5A-1
Received: from p4fdb0c34.dip0.t-ipconnect.de ([79.219.12.52] helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLL6j-0001Bg-1R; Thu, 24 Sep 2020 06:51:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu, 24 Sep 2020 08:51:39 +0200
Message-Id: <20200924065140.726436-13-hch@lst.de>
In-Reply-To: <20200924065140.726436-1-hch@lst.de>
References: <20200924065140.726436-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Justin Sanders <justin@coraid.com>, Jan Kara <jack@suse.cz>,
	Minchan Kim <minchan@kernel.org>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	cgroups@vger.kernel.org, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Richard Weinberger <richard@nod.at>, drbd-dev@tron.linbit.com,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH 12/13] bdi: invert BDI_CAP_NO_ACCT_WB
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace BDI_CAP_NO_ACCT_WB with a positive BDI_CAP_WRITEBACK_ACCT to
make the checks more obvious.  Also remove the pointless
bdi_cap_account_writeback wrapper that just obsfucates the check.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Jan Kara <jack@suse.cz>
Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 fs/fuse/inode.c             |  3 ++-
 include/linux/backing-dev.h | 13 +++----------
 mm/backing-dev.c            |  1 +
 mm/page-writeback.c         |  4 ++--
 4 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/fs/fuse/inode.c b/fs/fuse/inode.c
index 17b00670fb539e..581329203d6860 100644
--- a/fs/fuse/inode.c
+++ b/fs/fuse/inode.c
@@ -1050,7 +1050,8 @@ static int fuse_bdi_init(struct fuse_conn *fc, struct super_block *sb)
 		return err;
 
 	/* fuse does it's own writeback accounting */
-	sb->s_bdi->capabilities = BDI_CAP_NO_ACCT_WB | BDI_CAP_STRICTLIMIT;
+	sb->s_bdi->capabilities &= ~BDI_CAP_WRITEBACK_ACCT;
+	sb->s_bdi->capabilities |= BDI_CAP_STRICTLIMIT;
 
 	/*
 	 * For a single fuse filesystem use max 1% of dirty +
diff --git a/include/linux/backing-dev.h b/include/linux/backing-dev.h
index 5da4ea3dd0cc5c..b217344a2c63be 100644
--- a/include/linux/backing-dev.h
+++ b/include/linux/backing-dev.h
@@ -120,17 +120,17 @@ int bdi_set_max_ratio(struct backing_dev_info *bdi, unsigned int max_ratio);
  *
  * BDI_CAP_NO_ACCT_DIRTY:  Dirty pages shouldn't contribute to accounting
  * BDI_CAP_NO_WRITEBACK:   Don't write pages back
- * BDI_CAP_NO_ACCT_WB:     Don't automatically account writeback pages
+ * BDI_CAP_WRITEBACK_ACCT: Automatically account writeback pages
  * BDI_CAP_STRICTLIMIT:    Keep number of dirty pages below bdi threshold.
  */
 #define BDI_CAP_NO_ACCT_DIRTY	0x00000001
 #define BDI_CAP_NO_WRITEBACK	0x00000002
-#define BDI_CAP_NO_ACCT_WB	0x00000004
+#define BDI_CAP_WRITEBACK_ACCT	0x00000004
 #define BDI_CAP_STRICTLIMIT	0x00000010
 #define BDI_CAP_CGROUP_WRITEBACK 0x00000020
 
 #define BDI_CAP_NO_ACCT_AND_WRITEBACK \
-	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY | BDI_CAP_NO_ACCT_WB)
+	(BDI_CAP_NO_WRITEBACK | BDI_CAP_NO_ACCT_DIRTY)
 
 extern struct backing_dev_info noop_backing_dev_info;
 
@@ -179,13 +179,6 @@ static inline bool bdi_cap_account_dirty(struct backing_dev_info *bdi)
 	return !(bdi->capabilities & BDI_CAP_NO_ACCT_DIRTY);
 }
 
-static inline bool bdi_cap_account_writeback(struct backing_dev_info *bdi)
-{
-	/* Paranoia: BDI_CAP_NO_WRITEBACK implies BDI_CAP_NO_ACCT_WB */
-	return !(bdi->capabilities & (BDI_CAP_NO_ACCT_WB |
-				      BDI_CAP_NO_WRITEBACK));
-}
-
 static inline bool mapping_cap_writeback_dirty(struct address_space *mapping)
 {
 	return bdi_cap_writeback_dirty(inode_to_bdi(mapping->host));
diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 8e3802bf03a968..df18f0088dd3f5 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -745,6 +745,7 @@ struct backing_dev_info *bdi_alloc(int node_id)
 		kfree(bdi);
 		return NULL;
 	}
+	bdi->capabilities = BDI_CAP_WRITEBACK_ACCT;
 	bdi->ra_pages = VM_READAHEAD_PAGES;
 	bdi->io_pages = VM_READAHEAD_PAGES;
 	return bdi;
diff --git a/mm/page-writeback.c b/mm/page-writeback.c
index e9c36521461aaa..0139f9622a92da 100644
--- a/mm/page-writeback.c
+++ b/mm/page-writeback.c
@@ -2738,7 +2738,7 @@ int test_clear_page_writeback(struct page *page)
 		if (ret) {
 			__xa_clear_mark(&mapping->i_pages, page_index(page),
 						PAGECACHE_TAG_WRITEBACK);
-			if (bdi_cap_account_writeback(bdi)) {
+			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT) {
 				struct bdi_writeback *wb = inode_to_wb(inode);
 
 				dec_wb_stat(wb, WB_WRITEBACK);
@@ -2791,7 +2791,7 @@ int __test_set_page_writeback(struct page *page, bool keep_write)
 						   PAGECACHE_TAG_WRITEBACK);
 
 			xas_set_mark(&xas, PAGECACHE_TAG_WRITEBACK);
-			if (bdi_cap_account_writeback(bdi))
+			if (bdi->capabilities & BDI_CAP_WRITEBACK_ACCT)
 				inc_wb_stat(inode_to_wb(inode), WB_WRITEBACK);
 
 			/*
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

