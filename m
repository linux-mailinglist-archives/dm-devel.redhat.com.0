Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 284F9A9EEE
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:54:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E19B5309B69C;
	Thu,  5 Sep 2019 09:54:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADDE45C25B;
	Thu,  5 Sep 2019 09:54:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B67D2551E;
	Thu,  5 Sep 2019 09:54:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859s4cJ026879 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:54:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAAA6194B9; Thu,  5 Sep 2019 09:54:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx30.extmail.prod.ext.phx2.redhat.com
	[10.5.110.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7BA419C6A;
	Thu,  5 Sep 2019 09:53:57 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C9531DA2;
	Thu,  5 Sep 2019 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677227; x=1599213227;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=+BoXKBI8NPREtCwEN8cyWiTl5gToB5DcHyIz5CI6+dg=;
	b=QOA4eIWlnyMupmr8WQ827twihmD8fX5+CsVUkjlIrzL8VdjKFkT1ASNP
	ZaiyQG6MWvsLSCBZd0enC44DGFf493h0ocDRrQ4FmZQohSZYJqiYlaUPO
	rMfceqvHVdZkyKbk7dRel4ybTY+9XF4FBX3Ik22rp73zzoH2G/tdWsOwO
	P5qA75E9yyG6FbaumzbY0l6Fpm3tgbDNABhWfOtuYHBn/dcY42TzWgosW
	7v4hU3ksqt2fAKPvrG1hHnO816cmgOjHS1LbCwXHA89EZPhAPvOumhYwd
	qu9nv323OCrM86U82waO/vpMCM57+DPUPw14WDsfSvSONvH1eCcSdWG53 w==;
IronPort-SDR: OlWBI6aMHEZs1Ev+f5asqeG4J13vcOY5MsNzbaQyrgjHnZtFSA4frQpPa5DH6VL9Tsv+VXgiDL
	u2wkT1WFVIMWL+GWswD8ajLBBk3BEveYNmN4DTNGuvLjJ0Y8WMRnTOMRJ8+oNtl0qt3tOZGEWf
	Qs0iYdCz/7biFksuvXegY8tZ3qJrRLUOZNJl1JWDkU6jbk+lOj9VzNlH9JrA8Ven+jSB+ZxqnB
	3/jt6VxolQn9IKXT5Sj7bEkox+yC9RO/bwFVym2MzOKpbeMb2mqNbzZCEFVG3ijzHnFNwPRd45
	zCI=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106277"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:45 +0800
IronPort-SDR: Zy80qjBz6bFC94ODmbEZbUmrkEko+Wk/94wN65+Gnnwn6P7VSsI6yA9eTEdXxg3BjtNS+lxul7
	CDImIPY/dur89v2sMQkRH1ZkMWMwule6isO/FaCXGL4pAZWE/w2goGETBbAJjUsHisbL1m7Yvv
	qG5ltGTo2D6UvLOdy+xjpCtPqY9t3DSvtrNm+CO0a8oTSQ21wdHTlP8iOMnR88MskEmKZHWvmZ
	fLK+CjjZRg3fmO2FMSC+oWEBoe3c/8yqsIUdQ4yDF4y5Y1EmbL56cddYLlvqeSJPafOgJxo7Ty
	7qAfOPw7HReicC/+vKE6Gdcd
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:42 -0700
IronPort-SDR: Lfq6lKAztSB3r+9NM2ybsRXa847PgYMz1cpkVkbcK/5O6l3KjTn47sJkjX5sYzZqM87vEd1H6B
	sG9XxTFxstHIIo72pzsTUpcc6Fhx7YeajeAOQ5LKHGg/dFXkMzxS37QPdMEsu3t7TGfpLSo1DW
	wj2SxRsBLQmESwEevJYsqoPyBT1lpzoHfiV+OlSiIXWo+/k3kXIziEVFAacN61BY6o58Vuo+4R
	I8n4EuROm7l/RIY2WszBVXC0p6ySS4motlLqbWs+K95qbP1LvMlIGUPC4mcVGFhpzlf4aTPCXs
	Fis=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:44 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:34 +0900
Message-Id: <20190905095135.26026-7-damien.lemoal@wdc.com>
In-Reply-To: <20190905095135.26026-1-damien.lemoal@wdc.com>
References: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.71]); Thu, 05 Sep 2019 09:53:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]);
	Thu, 05 Sep 2019 09:53:47 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.71
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 6/7] block: Set ELEVATOR_F_ZBD_SEQ_WRITE for
	nullblk zoned disks
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 05 Sep 2019 09:54:10 +0000 (UTC)

Using the helper blk_queue_required_elevator_features(), set the
elevator feature ELEVATOR_F_ZBD_SEQ_WRITE as required for the request
queue of null_blk devices created with zoned mode enabled.

This feature requirement can always be satisfied as the mq-deadline
elevator is always selected for in-kernel compilation when
CONFIG_BLK_DEV_ZONED (zoned block device support) is enabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>
---
 drivers/block/null_blk_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index b26a178d064d..b29b273690b0 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -1695,6 +1695,8 @@ static int null_add_dev(struct nullb_device *dev)
 		blk_queue_chunk_sectors(nullb->q, dev->zone_size_sects);
 		nullb->q->limits.zoned = BLK_ZONED_HM;
 		blk_queue_flag_set(QUEUE_FLAG_ZONE_RESETALL, nullb->q);
+		blk_queue_required_elevator_features(nullb->q,
+						ELEVATOR_F_ZBD_SEQ_WRITE);
 	}
 
 	nullb->q->queuedata = nullb;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
