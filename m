Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 92F0232A9F4
	for <lists+dm-devel@lfdr.de>; Tue,  2 Mar 2021 20:06:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614711976;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kGTgB7ll2npBjmTNHvtyLD1/KocY8q6kKGuPOssR1nU=;
	b=eu7J/wkObwc/Yum7YHrFlvOcMZHSySRAh5/HRpszEa8AjDw5fPm6lhHXzGHQkyQsSon/gb
	osoUl1fztLQcC/15XSEP636C+0EG8rUwlClrMnFVai2bQFVEydGLpP7cBiOtb/YY2YL2yX
	2xCbNZE1me0A6d7kN0m5NLlL6csH3U4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-x-rluAvoPgSy47ffwg_E0g-1; Tue, 02 Mar 2021 14:06:13 -0500
X-MC-Unique: x-rluAvoPgSy47ffwg_E0g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C8231005501;
	Tue,  2 Mar 2021 19:06:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 543206F452;
	Tue,  2 Mar 2021 19:06:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6EA3F18095CC;
	Tue,  2 Mar 2021 19:06:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 122J5w29011074 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Mar 2021 14:05:58 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7A35F60C4D; Tue,  2 Mar 2021 19:05:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-116-252.ams2.redhat.com
	[10.36.116.252])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A37160BFA;
	Tue,  2 Mar 2021 19:05:55 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1lHALA-0003k7-OQ; Tue, 02 Mar 2021 20:05:53 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Tue, 02 Mar 2021 20:05:51 +0100
Message-Id: <20210302190551.473015400@debian-a64.vm>
User-Agent: quilt/0.65
Date: Tue, 02 Mar 2021 20:05:14 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: JeffleXu <jefflexu@linux.alibaba.com>, Mike Snitzer <msnitzer@redhat.com>, 
	Heinz Mauelshagen <heinzm@redhat.com>, axboe@kernel.dk,
	caspar@linux.alibaba.com, io-uring@vger.kernel.org,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, hch@lst.de
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 1/4] block: introduce a function
	submit_bio_noacct_mq_direct
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline; filename=block-submit-bio-mq-direct.patch
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a function that submits bio to a request-based device driver.
The function doesn't offload requests to current->bio_list. It is expected
to be called from device mapper, where current->bio_list is already set
up.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 block/blk-core.c       |   16 ++++++++++++++++
 include/linux/blkdev.h |    1 +
 2 files changed, 17 insertions(+)

Index: linux-2.6/block/blk-core.c
===================================================================
--- linux-2.6.orig/block/blk-core.c	2021-03-01 19:47:27.000000000 +0100
+++ linux-2.6/block/blk-core.c	2021-03-02 10:43:28.000000000 +0100
@@ -992,6 +992,22 @@ static blk_qc_t __submit_bio_noacct(stru
 	return ret;
 }
 
+blk_qc_t submit_bio_noacct_mq_direct(struct bio *bio)
+{
+	struct gendisk *disk = bio->bi_bdev->bd_disk;
+
+	if (unlikely(bio_queue_enter(bio) != 0))
+		return BLK_QC_T_NONE;
+	
+	if (!blk_crypto_bio_prep(&bio)) {
+		blk_queue_exit(disk->queue);
+		return BLK_QC_T_NONE;
+	}
+
+	return blk_mq_submit_bio(bio);
+}
+EXPORT_SYMBOL(submit_bio_noacct_mq_direct);
+
 static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
 {
 	struct bio_list bio_list[2] = { };
Index: linux-2.6/include/linux/blkdev.h
===================================================================
--- linux-2.6.orig/include/linux/blkdev.h	2021-03-01 19:47:29.000000000 +0100
+++ linux-2.6/include/linux/blkdev.h	2021-03-02 10:44:04.000000000 +0100
@@ -912,6 +912,7 @@ static inline void rq_flush_dcache_pages
 
 extern int blk_register_queue(struct gendisk *disk);
 extern void blk_unregister_queue(struct gendisk *disk);
+blk_qc_t submit_bio_noacct_mq_direct(struct bio *bio);
 blk_qc_t submit_bio_noacct(struct bio *bio);
 extern void blk_rq_init(struct request_queue *q, struct request *rq);
 extern void blk_put_request(struct request *);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

