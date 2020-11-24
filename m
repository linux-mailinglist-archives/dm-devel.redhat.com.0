Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5FFBA2C27ED
	for <lists+dm-devel@lfdr.de>; Tue, 24 Nov 2020 14:33:17 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-XQoFIadDOLSaoy9CDhH8EA-1; Tue, 24 Nov 2020 08:33:12 -0500
X-MC-Unique: XQoFIadDOLSaoy9CDhH8EA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8B85100C601;
	Tue, 24 Nov 2020 13:33:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6BA19C46;
	Tue, 24 Nov 2020 13:33:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1234E50035;
	Tue, 24 Nov 2020 13:33:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AODX20e019093 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Nov 2020 08:33:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E4CF01003330; Tue, 24 Nov 2020 13:33:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0E931112869
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:33:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C9C85858EEC
	for <dm-devel@redhat.com>; Tue, 24 Nov 2020 13:33:01 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-418-7ygKKmDINPSsLtPHAumzLQ-1; Tue, 24 Nov 2020 08:32:59 -0500
X-MC-Unique: 7ygKKmDINPSsLtPHAumzLQ-1
Received: from [2001:4bb8:180:5443:c70:4a89:bc61:3] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khYMZ-0006VO-IX; Tue, 24 Nov 2020 13:28:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 24 Nov 2020 14:27:15 +0100
Message-Id: <20201124132751.3747337-10-hch@lst.de>
In-Reply-To: <20201124132751.3747337-1-hch@lst.de>
References: <20201124132751.3747337-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	Richard Weinberger <richard@nod.at>, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>,
	Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
	linux-mm@kvack.org
Subject: [dm-devel] [PATCH 09/45] dm: simplify flush_bio initialization in
	__send_empty_flush
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We don't really need the struct block_device to initialize a bio.  So
switch from using bio_set_dev to manually setting up bi_disk (bi_partno
will always be zero and has been cleared by bio_init already).

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 50541d336c719b..ab0a8335f098d9 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1422,18 +1422,12 @@ static int __send_empty_flush(struct clone_info *ci)
 	 */
 	bio_init(&flush_bio, NULL, 0);
 	flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH | REQ_SYNC;
+	flush_bio.bi_disk = ci->io->md->disk;
+	bio_associate_blkg(&flush_bio);
+
 	ci->bio = &flush_bio;
 	ci->sector_count = 0;
 
-	/*
-	 * Empty flush uses a statically initialized bio, as the base for
-	 * cloning.  However, blkg association requires that a bdev is
-	 * associated with a gendisk, which doesn't happen until the bdev is
-	 * opened.  So, blkg association is done at issue time of the flush
-	 * rather than when the device is created in alloc_dev().
-	 */
-	bio_set_dev(ci->bio, ci->io->md->bdev);
-
 	BUG_ON(bio_has_data(ci->bio));
 	while ((ti = dm_table_get_target(ci->map, target_nr++)))
 		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

