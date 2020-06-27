Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 90B7220BFCA
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jun 2020 09:38:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593243481;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AEcA3NrqaekIeGWN64OUm8Ysc7P7prspW3515KdZHwk=;
	b=avBLy2UWE6BrFtcb/DMvs7N6zBOzqX3OqW8x5DW4J9NJy5w1m9ySg8VHVembxKe+2G2eyV
	yhP1+iSmfUOui3mfDuMMV+Cz2PHJ+2HnqS82fvi9OLG3Rq3PS7U0xXN+PmcKIZC4MODUk2
	AwLyM5/erxueVRil+Kgt2AkUxetTNag=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-eAfBvtwpMAOyqXBfN_yIng-1; Sat, 27 Jun 2020 03:37:59 -0400
X-MC-Unique: eAfBvtwpMAOyqXBfN_yIng-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D43E7BAE;
	Sat, 27 Jun 2020 07:37:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 37ADD60E3E;
	Sat, 27 Jun 2020 07:37:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EAAE2180BA96;
	Sat, 27 Jun 2020 07:37:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05R7boot004498 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jun 2020 03:37:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B05A7109FC83; Sat, 27 Jun 2020 07:37:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC74E109FC82
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93814805F40
	for <dm-devel@redhat.com>; Sat, 27 Jun 2020 07:37:50 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-282-zIPpnwV5ObOTMOv6zrT-XQ-1; Sat, 27 Jun 2020 03:37:48 -0400
X-MC-Unique: zIPpnwV5ObOTMOv6zrT-XQ-1
Received: from [2001:4bb8:184:76e3:595:ba65:ae56:65a6] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jp5Jm-0006la-8A; Sat, 27 Jun 2020 07:32:07 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>
Date: Sat, 27 Jun 2020 09:31:46 +0200
Message-Id: <20200627073159.2447325-2-hch@lst.de>
In-Reply-To: <20200627073159.2447325-1-hch@lst.de>
References: <20200627073159.2447325-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mm@kvack.org,
	dm-devel@redhat.com, Li Zefan <lizefan@huawei.com>,
	Johannes Weiner <hannes@cmpxchg.org>, Dennis Zhou <dennis@kernel.org>
Subject: [dm-devel] [PATCH 01/14] dm: use bio_uninit instead of
	bio_disassociate_blkg
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bio_uninit is the proper API to clean up a BIO that has been allocated
on stack or inside a structure that doesn't come from the BIO allocator.
Switch dm to use that instead of bio_disassociate_blkg, which really is
an implementation detail.  Note that the bio_uninit calls are also moved
to the two callers of __send_empty_flush, so that they better pair with
the bio_init calls used to initialize them.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/md/dm.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 109e81f33edb2d..e44473fe0f4873 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1452,9 +1452,6 @@ static int __send_empty_flush(struct clone_info *ci)
 	BUG_ON(bio_has_data(ci->bio));
 	while ((ti = dm_table_get_target(ci->map, target_nr++)))
 		__send_duplicate_bios(ci, ti, ti->num_flush_bios, NULL);
-
-	bio_disassociate_blkg(ci->bio);
-
 	return 0;
 }
 
@@ -1642,6 +1639,7 @@ static blk_qc_t __split_and_process_bio(struct mapped_device *md,
 		ci.bio = &flush_bio;
 		ci.sector_count = 0;
 		error = __send_empty_flush(&ci);
+		bio_uninit(ci.bio);
 		/* dec_pending submits any data associated with flush */
 	} else if (op_is_zone_mgmt(bio_op(bio))) {
 		ci.bio = bio;
@@ -1716,6 +1714,7 @@ static blk_qc_t __process_bio(struct mapped_device *md, struct dm_table *map,
 		ci.bio = &flush_bio;
 		ci.sector_count = 0;
 		error = __send_empty_flush(&ci);
+		bio_uninit(ci.bio);
 		/* dec_pending submits any data associated with flush */
 	} else {
 		struct dm_target_io *tio;
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

