Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9A591F3DD2
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:02:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178525;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lXSlbol3dBmlS57i7VbWLYaXW0jg9fx04j4DgjfsEp4=;
	b=agHE7d7w+0li362A1HuDsKCEEuGp/9oHzYivF5v/lOehzm6IAgs3Tsfyx5Wbt2BWD1m/E9
	mBhZV485Be+irFJclzY0XnlWE7hM5XcxS4dH9KQMNudVsGUll0XV01+f3bTtBHLS8F+I9V
	YD7nmGQjuiy02nPic7pwST+B+DTZNC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-zqwFJ_w-ML-rXfr3icavCw-1; Thu, 07 Nov 2019 21:01:05 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0525D8017DE;
	Fri,  8 Nov 2019 02:01:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE85B19481;
	Fri,  8 Nov 2019 02:01:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 35C1F4E566;
	Fri,  8 Nov 2019 02:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81wkFb000742 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:58:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A4C2D5C3FD; Fri,  8 Nov 2019 01:58:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F9145C554;
	Fri,  8 Nov 2019 01:58:37 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D83993082D68;
	Fri,  8 Nov 2019 01:58:11 +0000 (UTC)
IronPort-SDR: W8bDAJj0soD86uqc/Vputz66BwZIuqKeZWjO4tLw3ho/wAcMSam8Au1J1H1RFmerAyCdSOOVlW
	lBmiORz/0sdS/njbykiTPBOlsg+iwO4HktZhAMq6y3xxGTelsma43lBYUf+rZcaW4/DQDS1uKc
	rm6keSBKTJsceyIWgLJDT8LezEZPU0ZDuiFhwRcJHvT+bbwysPbi8+1A2meIYYJDXDYqHyQQyF
	1Her6PbM6Ojb9hScpSjus6cwqqi+pD4Xql5Je7gYozKZPvpcL1eiRE5jByRUdAWHgNPFFTPjpT
	py4=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636916"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:54 +0800
IronPort-SDR: hvBoS7ev3BEvziBNhBSTfCsmNDd2MygucloUsFYL5s4YTYiy/iD96g8XyB2xmrAbYkaVZrPTkn
	H9Qs+ZZ2rdDKeRZ63LS9j+yCBVL5e77LGXide837I3h0cuiQEjE4YYnh+nx1VIJLf9Ju+gIqTN
	f5uyaD2AyAX3l78biSuaQYWDo2yQJR+ZmBd5E84bcXwZcEsqL0/ZhoUt8dNNEjJf658a2GJCNf
	/lAoC+jPqhjFICVR9vS2+ZAC8wAvWURFXWT4HgjpKQNXemd0C4E7NxWDJLrTgsLYneDumULLlC
	SIOOrm8p0YEsUdWP5Uvl9LnC
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:26 -0800
IronPort-SDR: eEzgyNms9DdIGk7sRIpN96F8FHGQ06z8avuZlFaN3KKigJBu+LO6ibEz+bD6UKDLObxbCGWKrq
	qXxDKKIVequs0bz2Mmbc2gCKQ8RIIFt3dNjcaHsmUhYC81ER/dlQzPyeEwS6AAJbdoFl3NuE3+
	GP1SLuVOOCyvTrPg6u8HiBFq4tLtmeEaOZdfiEtANGNEn2h8kSQL4eVWOKDVK9X3VfpodIFDIH
	2j9psiwRP02r26em63ZNUVJUGD9fDwUWMsLeCvbu+LVXK/Wg8I1PhoyH5skaS419+eKEEEO0ZC
	hJU=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:15 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:57:00 +0900
Message-Id: <20191108015702.233102-8-damien.lemoal@wdc.com>
In-Reply-To: <20191108015702.233102-1-damien.lemoal@wdc.com>
References: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.46]); Fri, 08 Nov 2019 01:58:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 08 Nov 2019 01:58:28 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 7/9] null_blk: Add zone_nr_conv to features
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
X-MC-Unique: zqwFJ_w-ML-rXfr3icavCw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

For a null_blk device with zoned mode enabled, the number of
conventional zones can be configured through configfs with the
zone_nr_conv parameter. Add this missing parameter in the features
string.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/block/null_blk_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/null_blk_main.c b/drivers/block/null_blk_main.c
index 2687eb36441c..27fb34d7da31 100644
--- a/drivers/block/null_blk_main.c
+++ b/drivers/block/null_blk_main.c
@@ -467,7 +467,7 @@ nullb_group_drop_item(struct config_group *group, struct config_item *item)
 
 static ssize_t memb_group_features_show(struct config_item *item, char *page)
 {
-	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size\n");
+	return snprintf(page, PAGE_SIZE, "memory_backed,discard,bandwidth,cache,badblocks,zoned,zone_size,zone_nr_conv\n");
 }
 
 CONFIGFS_ATTR_RO(memb_group_, features);
-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

