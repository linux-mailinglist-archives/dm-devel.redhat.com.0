Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 37742F3DCB
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178449;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1074UcZbfnVDw0n9zAo3kQYu86B+2txoLRqKYRxdOac=;
	b=gdEgQ2mhzc88ygk1qzbOsjIc68wyngOD5fDIfal+6GRC4P/7eGuwz41mSTycIuDx0fbmys
	8R47HEqZ+gjI9PO/i3a2ANkoAsBe8iANFbUfroYDl3jdbXpw4rinsfLqjYLCF8jjYzCCY6
	BlcioHYR12dqtJtYy6oJuTfVn2tUoAQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-VTAl5jOgMramr17c-dfiug-1; Thu, 07 Nov 2019 21:00:46 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66AC1801FCD;
	Fri,  8 Nov 2019 02:00:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22E4160133;
	Fri,  8 Nov 2019 02:00:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9DF3418089CF;
	Fri,  8 Nov 2019 02:00:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81vp4F000586 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:57:51 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C7C9A600F4; Fri,  8 Nov 2019 01:57:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57F51600D3;
	Fri,  8 Nov 2019 01:57:46 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2053A3082D69;
	Fri,  8 Nov 2019 01:57:25 +0000 (UTC)
IronPort-SDR: TWr8nKyHRyMwyU1FvkUJ+SnL9g+s96yaEUaXcYdaKJgavaxgKn3PNe5g6tafqPB1KSqU60SUxh
	oBHDobcqV+HoAmNaelIkXvvZgAZDKhl9S6ntxrBlM1E1NfA1gZ/fv0MxoBXZshTsq86oFCkMnM
	MydpVyMTGZoPlib5du5xEDnoi9kvIRPotIlpQnqjo5vNsfeoY0cjUZ7JxaLeulsDihTPVD1dMc
	xvsyYkiab2gyklQih4/6jIt+u6frUb1sGelUddx3q7evr5OBMFuHqWcdV8YmNGqDg9VK9UfvKl
	T0Q=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636901"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:41 +0800
IronPort-SDR: YNGFat5Y05ClbSc4lEyH3tuUCAGHvyxJm0QdJ6x7DCu0T5QYaxWMUDr2yKiLy6lGF2e5UKiK7j
	4VZKh2Yc1wB6bJRK0Ysg/ddxOrlgLmdIO866dc46KJR55DJSpswIMI4IOHMzPc3g5dnMut0pxV
	SHcx8KYdx4KQaSqpPEd0g3xNLKW16kT6yHKox0Pjl7RKc+B2wHW6T/oOK/tQk9lnqTD8ouMeJ9
	OrCSlA/QYHj4nagzfjFTPs4wHNkXZs/3PdMEW/q1bG/ZnQUrkSuXIpYuuVTqzrwzKyQUMt65jh
	KKMJHqUqw2V9cUOfrMlr4emP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:17 -0800
IronPort-SDR: kr5/VwrcP8yZzj4vxGSaX58AWt4Y0XIBpscbpf4VnoVn+egmpoigIllEUBkXIYCD1cImYlODiZ
	g8C+Nd45aBRiX4cf6noKEGG+nI/z+ZDf6qo00fCPiXYYYNMxW2h+NYmssFipj9pIJZyNYItBPD
	/VE6yjmXGBUfpKzK1Cz65/5NNfQ9qhr3maxb1To4K13ZZspuK434rmXVRT5gEmH6xtndFTEFwg
	gmzxaShxISia7XM7WKrb5fQYFupSU+1Rks3wXAQxRlTjH5TnbPpW+DOVLaalFLDWU92lRGFfxU
	vzQ=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:06 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:55 +0900
Message-Id: <20191108015702.233102-3-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Fri, 08 Nov 2019 01:57:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 08 Nov 2019 01:57:36 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/9] block: cleanup the !zoned case in
	blk_revalidate_disk_zones
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
X-MC-Unique: VTAl5jOgMramr17c-dfiug-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Christoph Hellwig <hch@lst.de>

blk_revalidate_disk_zones is never called for non-zoned devices.  Just
return early and warn instead of trying to handle this case.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index dae787f67019..523a28d7a15c 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -520,6 +520,9 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	sector_t sector = 0;
 	int ret = 0;
 
+	if (WARN_ON_ONCE(!blk_queue_is_zoned(q)))
+		return -EIO;
+
 	/*
 	 * BIO based queues do not use a scheduler so only q->nr_zones
 	 * needs to be updated so that the sysfs exposed value is correct.
@@ -535,10 +538,8 @@ int blk_revalidate_disk_zones(struct gendisk *disk)
 	 */
 	noio_flag = memalloc_noio_save();
 
-	if (!blk_queue_is_zoned(q) || !nr_zones) {
-		nr_zones = 0;
+	if (!nr_zones)
 		goto update;
-	}
 
 	/* Allocate bitmaps */
 	ret = -ENOMEM;
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

