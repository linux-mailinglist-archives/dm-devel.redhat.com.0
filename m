Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0F6202008D9
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=623hptyABgKTJ2LMe6MInxsSHmNdOvR3leW4b6UO0j8=;
	b=FSbzBF5/bsZ0szmXF24URJSEe0Cb7Jo1p4q3RGsO8IUltO0NPqUgTskmBd0LsF195/t3Wn
	mqP+E4KCgOOyd9X/ixPXl4ith39zzKu6Rn96IIOiV39Ulnspb8oqiF+ezDDUA8w1SiWBnd
	jk5nM5nUnhUxp8nXvP/o2tqdR3GYhD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-127-IRa9o-9ONluSPSzm2py95g-1; Fri, 19 Jun 2020 08:39:20 -0400
X-MC-Unique: IRa9o-9ONluSPSzm2py95g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 953F2108BD14;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7062060E1C;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B70A21809557;
	Fri, 19 Jun 2020 12:39:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J70s93014917 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:00:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE92A2017EA7; Fri, 19 Jun 2020 07:00:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7FA42029F62
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3E5331019CAA
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:52 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-61-7x3ZPLeuMciUngebUJKHZg-2; Fri, 19 Jun 2020 03:00:48 -0400
X-MC-Unique: 7x3ZPLeuMciUngebUJKHZg-2
IronPort-SDR: GMHg1ZBnYrxzNhKqIFwe9OJs7b/syG5qt4MSRseqJiPW/BRsyRlmLSXBrTf37540qr+RRbCkb6
	AwqZLLve8TG0/OI9IW44NLADtsH8NkSKGS4bwK1pNhD7qHN2/OHZG35iy3WJTdEDRoQ3o5Cfbt
	Mb1/XbI0u3Ub315jQZXPpdUamQmbbGMTLmOyE9ODuCUssHhzO2eg5fdrDMAjjZkg0HK5Nx73rU
	60N3AkmGBByFFkNpdK9wuMPTNRH/8uDXNwrRrpReV5zpGTiSNMSMcwhxkRJCHWN85+9dKnMf12
	B1o=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="140655410"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:59:36 +0800
IronPort-SDR: YdzCmtQnh0ApbChJ4nkx9HHqnAXSTFt0P9wIh3IRGzwzTPLKYI2pbSrKTDc0PWoKTFb7oE88M9
	fer1zS6popciVpb4TREp8Fyq7scwgxyBM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jun 2020 23:48:13 -0700
IronPort-SDR: 4dy8/kN3qrCG6mS0UpGTc1PHUIiEhq6DN/I9DlHGP1GBNYFhF6BihxpavInPBmGrJjdTNTjYVS
	DWb+RkHuV2Og==
WDCIronportException: Internal
Received: from unknown (HELO redsun60.ssa.fujisawa.hgst.com) ([10.149.66.36])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2020 23:59:35 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 15:59:04 +0900
Message-Id: <20200619065905.22228-2-johannes.thumshirn@wdc.com>
In-Reply-To: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: linux-block@vger.kernel.org, Naohiro Aota <Naohiro.Aota@wdc.com>,
	dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [dm-devel] [PATCH 1/2] dm: update original bio sector on Zone Append
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

Naohiro reported that issuing zone-append bios to a zoned block device
underneath a dm-linear device does not work as expected.

This because we forgot to reverse-map the sector the device wrote to the
original bio.

For zone-append bios, get the offset in the zone of the written sector
from the clone bio and add that to the original bio's sector position.

Reported-by: Naohiro Aota <Naohiro.Aota@wdc.com>
Fixes: 0512a75b98f8 ("block: Introduce REQ_OP_ZONE_APPEND")
Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 109e81f33edb..058c34abe9d1 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1009,6 +1009,7 @@ static void clone_endio(struct bio *bio)
 	struct dm_io *io = tio->io;
 	struct mapped_device *md = tio->io->md;
 	dm_endio_fn endio = tio->ti->type->end_io;
+	struct bio *orig_bio = io->orig_bio;
 
 	if (unlikely(error == BLK_STS_TARGET) && md->type != DM_TYPE_NVME_BIO_BASED) {
 		if (bio_op(bio) == REQ_OP_DISCARD &&
@@ -1022,6 +1023,18 @@ static void clone_endio(struct bio *bio)
 			disable_write_zeroes(md);
 	}
 
+	/*
+	 * for zone-append bios get offset in zone of the written sector and add
+	 * that to the original bio sector pos.
+	 */
+	if (bio_op(orig_bio) == REQ_OP_ZONE_APPEND) {
+		sector_t written_sector = bio->bi_iter.bi_sector;
+		struct request_queue *q = orig_bio->bi_disk->queue;
+		u64 mask = (u64)blk_queue_zone_sectors(q) - 1;
+
+		orig_bio->bi_iter.bi_sector += written_sector & mask;
+	}
+
 	if (endio) {
 		int r = endio(tio->ti, bio, &error);
 		switch (r) {
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

