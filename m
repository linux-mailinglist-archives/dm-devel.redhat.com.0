Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id C96D4F3DC9
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178439;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1rAjrmhAp3usAaTOhbSJx1+/l9S2sRPL4ucE+EI2xf4=;
	b=fZS5IoSsbeYKOUzg55lixwAq3lD+2bmpTfKlzSbRuEcN1nSWICFyvy0oA0WUbH1Evdt5Cx
	COYAuV2sWGAlSyWu43tmlis8XOF5TnUKUP4/lz7v70CE9RnCa7X+hIvlHe/jtEzeCGXqaK
	sKUIB5SR2sfTmKrYEp7y1VlD4oTgFWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-190-6bGtryoYNQGWO_T09ML-ww-1; Thu, 07 Nov 2019 21:00:36 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510CA801FCD;
	Fri,  8 Nov 2019 02:00:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23F68600F0;
	Fri,  8 Nov 2019 02:00:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67E234E566;
	Fri,  8 Nov 2019 02:00:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81wIkZ000668 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1AD2F608B6; Fri,  8 Nov 2019 01:58:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B21D36084E;
	Fri,  8 Nov 2019 01:58:13 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18D9FC04BD48;
	Fri,  8 Nov 2019 01:57:47 +0000 (UTC)
IronPort-SDR: bGbNl7xB4xhgqi7RuX6KdV6E5IelB3djHownRZ7kmRlu2/kawwAK/mxO2HGNEYrTPUPW/aoZIw
	dlRsUietdVFP1SnLzpO6t7a/8qfOBnKNGMq4MwiKt6qFdMY3rQSOBOrD3yDEMdjJx37plbosS1
	vo5lMYQ6jYBMw4ESUKgpGaDPGJkGRH+VgSKM73Trh+qMWB0YIPPWsp7QJ0jdI8xm0rGigjHlIu
	rl/poWEBhTddKbyRR8q40x5uN9/IT0ACJNWKPoRm5pqOH/OJXQOE1JEI25L3tQxnk40W0WLB8G
	X8c=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636909"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:49 +0800
IronPort-SDR: Sl+WdsIdaQhcHZaNrinF0it4D192qDM3ePCqf1T6tKI/DGvf5YShEVrufRUWSW26IL04zftOUs
	g2XB7z3TVBr0I+m7UyhO5PfKiG/kzzW16T5goiqpqXqL+RLSzmb63MwC8rY6DULrxW50alwCsO
	m5Qn6c+SZ5Wf0JpRSVAdfPxUAviixiz/z5xmdXfyspD/eQG4bEF3A5wseQlQg+hbU7vicPCnuO
	HzJLXjiVjFWgu1aaw2VTTbTS35vg4DMau8A7+1GRkUfvrAJAmIqN5neLSh5Avn7KZlenh2OhPe
	Ng6IEjTJ2Efy7tUssuB5Pp4v
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:22 -0800
IronPort-SDR: /Xjyz0Kh14ySCVzU34mSIqRZ1vmBqP7OykM734wRo0hJHoWbQl2cEq/vf0qS824wFLvW00p5vf
	PZLEgpFmBNiK5oMRHvYMoeyHmyyiWyjp0VrTjomF+AqgIPuJfUrcw1kmRXge5eooanwHAKO4IY
	T9In0tczmRSv5+EmJCYTmPgB0DbOrbL6kGLpmjJuXIVs1VgtPkWuiB+mrft01tqF5b3E6Zj4bV
	c52ECmRgUnXqJoIC0jok0oWJsRjy4xW4cW5BFz4d9xdZv5RfLXxwPoMO3fbGNvRISnnAqDp/oT
	E1Y=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:11 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:58 +0900
Message-Id: <20191108015702.233102-6-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Fri, 08 Nov 2019 01:58:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Fri, 08 Nov 2019 01:58:03 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 5/9] null_blk: clean up the block device
	operations
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 6bGtryoYNQGWO_T09ML-ww-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>

Remove the pointless stub open and release methods, give the operations
vector a slightly less confusing name, and use normal alignment for the
assignment operators.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/block/null_blk_main.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 40a64bdd8ea7..89d385bab45b 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1442,20 +1442,9 @@ static void null_config_discard(struct nullb *nullb)
 	blk_queue_flag_set(QUEUE_FLAG_DISCARD, nullb->q);
 }
 
-static int null_open(struct block_device *bdev, fmode_t mode)
-{
-	return 0;
-}
-
-static void null_release(struct gendisk *disk, fmode_t mode)
-{
-}
-
-static const struct block_device_operations null_fops = {
-	.owner =	THIS_MODULE,
-	.open =		null_open,
-	.release =	null_release,
-	.report_zones =	null_zone_report,
+static const struct block_device_operations null_ops = {
+	.owner		= THIS_MODULE,
+	.report_zones	= null_zone_report,
 };
 
 static void null_init_queue(struct nullb *nullb, struct nullb_queue *nq)
@@ -1556,7 +1545,7 @@ static int null_gendisk_register(struct nullb *nullb)
 	disk->flags |= GENHD_FL_EXT_DEVT | GENHD_FL_SUPPRESS_PARTITION_INFO;
 	disk->major		= null_major;
 	disk->first_minor	= nullb->index;
-	disk->fops		= &null_fops;
+	disk->fops		= &null_ops;
 	disk->private_data	= nullb;
 	disk->queue		= nullb->q;
 	strncpy(disk->disk_name, nullb->disk_name, DISK_NAME_LEN);
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

