Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C64D7301B35
	for <lists+dm-devel@lfdr.de>; Sun, 24 Jan 2021 11:13:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-gRiFowNIPgew0TleBvAOuw-1; Sun, 24 Jan 2021 05:13:47 -0500
X-MC-Unique: gRiFowNIPgew0TleBvAOuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DF6A803F46;
	Sun, 24 Jan 2021 10:13:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2626410021AA;
	Sun, 24 Jan 2021 10:13:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D759A1809CA2;
	Sun, 24 Jan 2021 10:13:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10OADcWd005709 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 24 Jan 2021 05:13:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0ED102026D25; Sun, 24 Jan 2021 10:13:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09F422026D46
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:13:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F177F811E78
	for <dm-devel@redhat.com>; Sun, 24 Jan 2021 10:13:35 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-179-B0rhwPSdPRyj48TFmc3M6A-1; Sun, 24 Jan 2021 05:13:34 -0500
X-MC-Unique: B0rhwPSdPRyj48TFmc3M6A-1
Received: from [2001:4bb8:188:1954:a3b3:627f:702b:2136] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
	id 1l3cH5-002q9k-0b; Sun, 24 Jan 2021 10:05:40 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sun, 24 Jan 2021 11:02:36 +0100
Message-Id: <20210124100241.1167849-6-hch@lst.de>
In-Reply-To: <20210124100241.1167849-1-hch@lst.de>
References: <20210124100241.1167849-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-s390@vger.kernel.org, linux-bcache@vger.kernel.org,
	Coly Li <colyli@suse.de>, linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>, dm-devel@redhat.com,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: [dm-devel] [PATCH 05/10] block: do not reassig ->bi_bdev when
	partition remapping
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There is no good reason to reassign ->bi_bdev when remapping the
partition-relative block number to the device wide one, as all the
information required by the drivers comes from the gendisk anyway.

Keeping the original ->bi_bdev alive will allow to greatly simplify
the partition-away I/O accounting.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Tejun Heo <tj@kernel.org>
---
 block/blk-core.c          | 5 +++--
 include/linux/bio.h       | 2 ++
 include/linux/blk_types.h | 1 +
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/block/blk-core.c b/block/blk-core.c
index 64f69022de9627..1c1b97a82caa2e 100644
--- a/block/blk-core.c
+++ b/block/blk-core.c
@@ -752,7 +752,7 @@ static int blk_partition_remap(struct bio *bio)
 				      bio->bi_iter.bi_sector -
 				      p->bd_start_sect);
 	}
-	bio->bi_bdev = bdev_whole(p);
+	bio_set_flag(bio, BIO_REMAPPED);
 	return 0;
 }
 
@@ -817,7 +817,8 @@ static noinline_for_stack bool submit_bio_checks(struct bio *bio)
 		goto end_io;
 	if (unlikely(bio_check_eod(bio)))
 		goto end_io;
-	if (bio->bi_bdev->bd_partno && unlikely(blk_partition_remap(bio)))
+	if (bio->bi_bdev->bd_partno && !bio_flagged(bio, BIO_REMAPPED) &&
+	    unlikely(blk_partition_remap(bio)))
 		goto end_io;
 
 	/*
diff --git a/include/linux/bio.h b/include/linux/bio.h
index 12af7aa5db3778..2f1155eabaff29 100644
--- a/include/linux/bio.h
+++ b/include/linux/bio.h
@@ -485,6 +485,7 @@ extern const char *bio_devname(struct bio *bio, char *buffer);
 
 #define bio_set_dev(bio, bdev) 				\
 do {							\
+	bio_clear_flag(bio, BIO_REMAPPED);		\
 	if ((bio)->bi_bdev != (bdev))			\
 		bio_clear_flag(bio, BIO_THROTTLED);	\
 	(bio)->bi_bdev = (bdev);			\
@@ -493,6 +494,7 @@ do {							\
 
 #define bio_copy_dev(dst, src)			\
 do {						\
+	bio_clear_flag(dst, BIO_REMAPPED);		\
 	(dst)->bi_bdev = (src)->bi_bdev;	\
 	bio_clone_blkg_association(dst, src);	\
 } while (0)
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index 8ebd8be3e05082..1bc6f6a01070fc 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -303,6 +303,7 @@ enum {
 				 * of this bio. */
 	BIO_CGROUP_ACCT,	/* has been accounted to a cgroup */
 	BIO_TRACKED,		/* set if bio goes through the rq_qos path */
+	BIO_REMAPPED,
 	BIO_FLAG_LAST
 };
 
-- 
2.29.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

