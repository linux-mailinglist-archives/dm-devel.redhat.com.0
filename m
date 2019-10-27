Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 69EA2E62EB
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185227;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AxAybvDHBQi0QEZvmczvSfRF4RxxcFkbhnn6dyxin9Q=;
	b=e126ZO5Kaa1LxZ/LjpaV9qCKNza51Nu1YHKAghBusOaDvTRBc2Tcbx58AVYtovBcRCfKxp
	81LopVi+TPeTSiIo/rDDaIw3JfsQ8n4YjQ34toykLPetg/KZlbE2WIkKAjuSFgIS3XLw5q
	7ESSqcEvfT+snNBeLlx8d3HF7Br2X2Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-22-ef1d-pNWOLefew2LOYEZQw-1; Sun, 27 Oct 2019 10:07:05 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A0D79800D49;
	Sun, 27 Oct 2019 14:07:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A6ED60A9D;
	Sun, 27 Oct 2019 14:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B7184E58C;
	Sun, 27 Oct 2019 14:06:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE6lZ6007624 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:06:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB37D60603; Sun, 27 Oct 2019 14:06:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx21.extmail.prod.ext.phx2.redhat.com
	[10.5.110.62])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E7FE6092F;
	Sun, 27 Oct 2019 14:06:42 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 898A418C4267;
	Sun, 27 Oct 2019 14:06:17 +0000 (UTC)
IronPort-SDR: kGkkvPzI5CegoCgKUrX0JVna5Gf/x4qhPy/CWTL9t2O5UU3iS9fCO6zKFLfdntVuE18p++qyns
	O1HceoVSuFZtJBSzgDmeSQPP4GgwRVGZV29H6Vfyd3u8lGHlq/ZIW+eMhks62Euh/BoVMXzCeb
	u6UD8rl7BwFHx9AUWJZw9OkkARLVpoH73ekqffCM3+WrUCkgj5q9uRkhcmviiOAfLzdY3dxS5q
	ea0GEcCUmrw81P7UjC26Jb1I3GmkXzRNipIyH//Hb1YO3wKgbMkLdS47nrKeQ/eYtV83+2HWfH
	JLw=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197754"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:05:54 +0800
IronPort-SDR: rEO6cqgTwZmOvRN4XU2kNsvTDJYg61GxOrpJU2Hbxkm97a1ZlkWeP05KTs3oyCqCpibA/1Yj5w
	JaOUIuqReq4eBQH96S1p4Hj6wKLKnHGGWX4UjkV4qJrrFCtQ7kbc40CWLL/mLeeU4eI0j4uYkg
	W6/iaswhefknNHbVB+8xc+oGwE5ta31um3T1+dzRADesIyGZ0ZbF1aMedoCGXOEWFyfy/3PWTG
	+BB+8STxodeV6MxKMkPymEqZ3kb0Rsm7uiGGg48Wmg5MfibD79QiKhMxxakHQS/xHzvjzms4oY
	CoIVv5bNIuC64/Dd1vBxtEV2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:23 -0700
IronPort-SDR: UoC2Q5lfcrXcukiP5MUowul50Uc7s5EoU9j73nfDk4RULLZ/LxkObuA/Je8nS59wPzBmKCLzfL
	8QuZMfk5D7b6kWtNYeyM5WccaEFCsyyFsOG7nKp3J8cUBnhnQijW6Rur1q75hcBgbM1xktfJWT
	JNg4UwqCEYzYTBKxvFo0/dEbMgrU+DSu7oxNpre0XZAYqYqc6l8lz8R3lMu0/QmDurwAhpDWmv
	XSkOQt60fe3oT5V0blUqjIbJcWRbqCLc65wyPBpeW5OiSKRfyDvv/2A+knmr3JkbIxH40SgeLr
	d+4=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:05:52 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:42 +0900
Message-Id: <20191027140549.26272-2-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.62]); Sun, 27 Oct 2019 14:06:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]);
	Sun, 27 Oct 2019 14:06:33 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.62
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 1/8] block: Remove REQ_OP_ZONE_RESET plugging
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
X-MC-Unique: ef1d-pNWOLefew2LOYEZQw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

REQ_OP_ZONE_RESET operations cannot be merged as these bios and requests
do not have a size and are never sequential due to the zone start sector
position required for their execution. As a result, there is no point in
using a plug around blkdev_reset_zones() bio issuing loop. This patch
removes this unnecessary plugging.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 block/blk-zoned.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/block/blk-zoned.c b/block/blk-zoned.c
index 4bc5f260248a..7fe376eede86 100644
--- a/block/blk-zoned.c
+++ b/block/blk-zoned.c
@@ -258,7 +258,6 @@ int blkdev_reset_zones(struct block_device *bdev,
 	sector_t zone_sectors;
 	sector_t end_sector = sector + nr_sectors;
 	struct bio *bio = NULL;
-	struct blk_plug plug;
 	int ret;
 
 	if (!blk_queue_is_zoned(q))
@@ -283,7 +282,6 @@ int blkdev_reset_zones(struct block_device *bdev,
 	    end_sector != bdev->bd_part->nr_sects)
 		return -EINVAL;
 
-	blk_start_plug(&plug);
 	while (sector < end_sector) {
 
 		bio = blk_next_bio(bio, 0, gfp_mask);
@@ -301,8 +299,6 @@ int blkdev_reset_zones(struct block_device *bdev,
 	ret = submit_bio_wait(bio);
 	bio_put(bio);
 
-	blk_finish_plug(&plug);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(blkdev_reset_zones);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

