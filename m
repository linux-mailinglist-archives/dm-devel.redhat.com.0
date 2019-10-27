Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D379DE62EE
	for <lists+dm-devel@lfdr.de>; Sun, 27 Oct 2019 15:07:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572185270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FHZiVznc+bcc4eeAuwp/eh6oUAMCnJyuLLWgVYveBbw=;
	b=V1kEITEAVgOVESlN+yKDtN27dmip9x3SAjRLDCgUwnb6669PDnJqlVoxich7ap3lcLj8RQ
	v8kUcYGriVYiOsKXkOMfD4bMsfP1FMmaUwVQZfSXrIWXPLOqTXdreFjJe3DPQP+BYvKrxl
	LKwRfsqkEwSbzQsnFkIW8jsWO2i46qk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-g7X022XjPBaRUkuCOOScTw-1; Sun, 27 Oct 2019 10:07:47 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6EA0A107AD33;
	Sun, 27 Oct 2019 14:07:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47E7E60C57;
	Sun, 27 Oct 2019 14:07:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DF95C4EDA6;
	Sun, 27 Oct 2019 14:07:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9RE7bmq007745 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 27 Oct 2019 10:07:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D2A276012E; Sun, 27 Oct 2019 14:07:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 498E560161;
	Sun, 27 Oct 2019 14:07:32 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4F7F0308FC22;
	Sun, 27 Oct 2019 14:07:07 +0000 (UTC)
IronPort-SDR: AvCB4zB4Lt8MuV+04fV6mWKl7IYizhO6iLB5nLCzy0FubJNbGos+xEYtEI6m9LNZCSbWSsojru
	Uh2sRPhzOn8WcRovCTHNZ92Kh0bOh+dN2tNTipOnocx712H9lC3hM3cjwkxhDBQOZpVyrWh5V/
	eT744c7W5v8sNE2rumkCEeYqqVMj9yRMKvXIgzYFv0MqyOqYbuO+Ft7ixk2OhUoN7WhSYzPFb5
	iWQ4zhyB6fcWRoODe0qnlOUmXoVjFn3WrT5Mvjz8dRtliFKHWBZglc/PHzAk2Jyp4wvBnHXa6t
	YaU=
X-IronPort-AV: E=Sophos;i="5.68,236,1569254400"; d="scan'208";a="122197776"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 27 Oct 2019 22:06:07 +0800
IronPort-SDR: hF5OMDmVW5Z/zzGk5egsRLz59jOmMJ3azuM+PJ1xRweNtMir94pvtAO0trDSxOhD3KeDVegi/5
	ENwiVWg0fPOzJDHOjua0NnCz8YF37GxhhD9XOXvgy4GJPX2UVdA0yZHXGkdNCsDx8gQeSly+8/
	aNr1grGpmtdsKRJJYR74s3dW005vvyvjBtQAD/AVMtswteaI+ookqUrmmmQfNxO0N1lKsOt+o5
	L0Oa/SMGrS7NUFKvUIJrYrh+PvvIldH6Kc5tpIvV0JhLX5yWaR8moeV5TidCZd2AbS52HsXvOP
	I8HO7ukBOrGAiKSp6OMU+JW5
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	27 Oct 2019 07:01:36 -0700
IronPort-SDR: zsGaibo1ct/ZMz0zQXZesnRk7H+7gE+bmgCZApkHVlYevcV1Tj2tEfX4GZWHh4cHMc+lsEGY15
	1JeVUeUxd6loyv6BRrQCQeD7KfeJPKYfOa51yRBlnM0AjUg/I/XmlXWdtglPlwwiE5G+8MeCv/
	i4Nq0R2+bmrCWrtZP1jHkuLL7HYDrJeabtnPfmel/ZHXPWsOPowTQnyTUeOcJfrlocDneS2fcP
	niK5oQ6QT5CvPknM1cPDuGGq5pl4msjHPlYBX1D4TUTwmPr5pO0+ertG6KTqbhDP/IQis9GTNA
	mMU=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 27 Oct 2019 07:06:05 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sun, 27 Oct 2019 23:05:49 +0900
Message-Id: <20191027140549.26272-9-damien.lemoal@wdc.com>
In-Reply-To: <20191027140549.26272-1-damien.lemoal@wdc.com>
References: <20191027140549.26272-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Sun, 27 Oct 2019 14:07:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Sun, 27 Oct 2019 14:07:23 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=196f58c8b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>, Keith Busch <kbusch@kernel.org>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Ajay Joshi <ajay.joshi@wdc.com>,
	Matias Bjorling <matias.bjorling@wdc.com>
Subject: [dm-devel] [PATCH 8/8] null_blk: add zone open, close,
	and finish support
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
X-MC-Unique: g7X022XjPBaRUkuCOOScTw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ajay Joshi <ajay.joshi@wdc.com>

Implement REQ_OP_ZONE_OPEN, REQ_OP_ZONE_CLOSE and REQ_OP_ZONE_FINISH
support to allow explicit control of zone states.

Contains contributions from Matias Bjorling, Hans Holmberg,
Keith Busch and Damien Le Moal.

Signed-off-by: Ajay Joshi <ajay.joshi@wdc.com>
Signed-off-by: Matias Bjorling <matias.bjorling@wdc.com>
Signed-off-by: Hans Holmberg <hans.holmberg@wdc.com>
Signed-off-by: Keith Busch <kbusch@kernel.org>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/block/null_blk_zoned.c | 33 ++++++++++++++++++++++++++++++---
 1 file changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/block/null_blk_zoned.c b/drivers/block/null_blk_zoned.c
index 4e56b17ed3ef..02f41a3bc4cb 100644
--- a/drivers/block/null_blk_zoned.c
+++ b/drivers/block/null_blk_zoned.c
@@ -136,13 +136,14 @@ static blk_status_t null_zone_write(struct nullb_cmd *cmd, sector_t sector,
 	return BLK_STS_OK;
 }
 
-static blk_status_t null_zone_reset(struct nullb_cmd *cmd, sector_t sector)
+static blk_status_t null_zone_mgmt(struct nullb_cmd *cmd, enum req_opf op,
+				   sector_t sector)
 {
 	struct nullb_device *dev = cmd->nq->dev;
 	struct blk_zone *zone = &dev->zones[null_zone_no(dev, sector)];
 	size_t i;
 
-	switch (req_op(cmd->rq)) {
+	switch (op) {
 	case REQ_OP_ZONE_RESET_ALL:
 		for (i = 0; i < dev->nr_zones; i++) {
 			if (zone[i].type == BLK_ZONE_TYPE_CONVENTIONAL)
@@ -158,6 +159,29 @@ static blk_status_t null_zone_reset(struct nullb_cmd *cmd, sector_t sector)
 		zone->cond = BLK_ZONE_COND_EMPTY;
 		zone->wp = zone->start;
 		break;
+	case REQ_OP_ZONE_OPEN:
+		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
+			return BLK_STS_IOERR;
+		if (zone->cond == BLK_ZONE_COND_FULL)
+			return BLK_STS_IOERR;
+
+		zone->cond = BLK_ZONE_COND_EXP_OPEN;
+		break;
+	case REQ_OP_ZONE_CLOSE:
+		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
+			return BLK_STS_IOERR;
+		if (zone->cond == BLK_ZONE_COND_FULL)
+			return BLK_STS_IOERR;
+
+		zone->cond = BLK_ZONE_COND_CLOSED;
+		break;
+	case REQ_OP_ZONE_FINISH:
+		if (zone->type == BLK_ZONE_TYPE_CONVENTIONAL)
+			return BLK_STS_IOERR;
+
+		zone->cond = BLK_ZONE_COND_FULL;
+		zone->wp = zone->start + zone->len;
+		break;
 	default:
 		return BLK_STS_NOTSUPP;
 	}
@@ -172,7 +196,10 @@ blk_status_t null_handle_zoned(struct nullb_cmd *cmd, enum req_opf op,
 		return null_zone_write(cmd, sector, nr_sectors);
 	case REQ_OP_ZONE_RESET:
 	case REQ_OP_ZONE_RESET_ALL:
-		return null_zone_reset(cmd, sector);
+	case REQ_OP_ZONE_OPEN:
+	case REQ_OP_ZONE_CLOSE:
+	case REQ_OP_ZONE_FINISH:
+		return null_zone_mgmt(cmd, op, sector);
 	default:
 		return BLK_STS_OK;
 	}
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

