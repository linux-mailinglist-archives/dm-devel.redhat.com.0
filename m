Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EA5032002FF
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 09:51:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592553094;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iwVrb3tBwfAHnDyIZtqswMgucJsw2SR+Xw5LbUXzKwQ=;
	b=PjiOedxIWDcr1JePmqR3pnXsIIR9OZTKZGlVWeGATBV1iTBS6XM86ZeZsmxKCSVrMGkpPj
	VmKLDVaJZTYz9eL+QQtRtFE9sOQGc+uKCB3hqQvAwKjEzjPFbiV99007poq+7335JsMifA
	+8yyBAspkJdaqS8qTpxJSF1xTCm1cV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-rDYkAPedPh2_3wpdEm07IQ-1; Fri, 19 Jun 2020 03:51:31 -0400
X-MC-Unique: rDYkAPedPh2_3wpdEm07IQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97A8C107ACF4;
	Fri, 19 Jun 2020 07:51:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE8A6707C6;
	Fri, 19 Jun 2020 07:51:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC4C7180954D;
	Fri, 19 Jun 2020 07:51:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J7pAIl022305 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:51:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E27E7103281; Fri, 19 Jun 2020 07:51:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE42E103284
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AD32101A526
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:51:08 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-39-x2n3pNHHOrKhrDbZI7SOfg-1; Fri, 19 Jun 2020 03:51:04 -0400
X-MC-Unique: x2n3pNHHOrKhrDbZI7SOfg-1
IronPort-SDR: /gYIIN/W0S+3aW17NW4z7nfiC+CK73UcLpiLLovXFAUa1nVs+lnXH9tZM2edU2LnaDQ2Q4izMX
	LKROsawLdB+yEnFHNHw4VS5AefmCI7jO3qhRQuX1MbnLBn8jtPPJ5sij+8rW1FDSB5kWMJeZhJ
	9mN3Om1oxKCuAWf1orxWcUHsdjBTWv9WQJdtiXN6mRuDszctoOOa9ZyKxeVWQCS6VjkGjDppK6
	szkS3nIP28dFDoYCD2saSvJXLuPkhJW/D4ucbvbd+hYJVidptFTNFv9E271iFungRrCEdD06g5
	i1Q=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="249594582"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 15:49:59 +0800
IronPort-SDR: tsnlKhZb56nZEbcm2ImNJIbnT0zqbB69vbjpPK0QhgImwIEbY74+dh9nRRcLf2LReD0quWAQFv
	xpFkPKAFBFTc53UUquBga0CDvoGZq7F/U=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	19 Jun 2020 00:38:38 -0700
IronPort-SDR: z8gYTk+GooNe33um/XvPO3v+N+lRx4X/QIdnRX9RcZpHleMNtFwAhQ1qhMWjhWYCABUPgtCZzi
	Ng9TLZ/4lpXg==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 19 Jun 2020 00:49:59 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 16:49:56 +0900
Message-Id: <20200619074956.352647-3-damien.lemoal@wdc.com>
In-Reply-To: <20200619074956.352647-1-damien.lemoal@wdc.com>
References: <20200619074956.352647-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Subject: [dm-devel] [PATCH 2/2] dm zoned: Fix reclaim zone selection
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>

When dm zoned has multiple devices, random zones are never selected for
reclaim if all reserved sequential write zones are in use and no
sequential write required zones can be selected for reclaim. This can
lead to deadlocks as selecting a cache zone allows reclaiming a
sequential zone, ensuring forward progress.

Fix this by always defaulting to selecting a random zone when no
sequential write required zone can be selected.

[Damien: fix commit message]

Signed-off-by: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 8bdf71dce7fb..c332e2c121b8 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2025,7 +2025,7 @@ static struct dm_zone *dmz_get_seq_zone_for_reclaim(struct dmz_metadata *zmd,
 struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
 					 unsigned int dev_idx, bool idle)
 {
-	struct dm_zone *zone;
+	struct dm_zone *zone = NULL;
 
 	/*
 	 * Search for a zone candidate to reclaim: 2 cases are possible.
@@ -2038,7 +2038,7 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd,
 	dmz_lock_map(zmd);
 	if (list_empty(&zmd->reserved_seq_zones_list))
 		zone = dmz_get_seq_zone_for_reclaim(zmd, dev_idx);
-	else
+	if (!zone)
 		zone = dmz_get_rnd_zone_for_reclaim(zmd, dev_idx, idle);
 	dmz_unlock_map(zmd);
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

