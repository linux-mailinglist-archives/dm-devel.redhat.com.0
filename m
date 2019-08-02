Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4081180297
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 00:10:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1789436899;
	Fri,  2 Aug 2019 22:10:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3FCA600D1;
	Fri,  2 Aug 2019 22:10:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3786941F53;
	Fri,  2 Aug 2019 22:10:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x72M3sJc027171 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 2 Aug 2019 18:03:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F36319D7A; Fri,  2 Aug 2019 22:03:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3250819C68;
	Fri,  2 Aug 2019 22:03:53 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC213309DEFF;
	Fri,  2 Aug 2019 22:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1564783422; x=1596319422;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=iM+chzIKTnl3615am095Mx4h0+QTZxoPBpvBGb/qwcY=;
	b=Db1S4ki2yWNAP17LeCg5fzILN1FC0+KELzRur59R3vd2Kk9W1Vr9vwBI
	WRAwiyx4cMaMS4iLEhauKXycynj8OQYSMeBPZsjeN2wAa2zP12RbEO7r9
	xLPwD7/ux8tyvYff02d72WQ6OpnUocF8cMjuAEIGv8Qvq3NlzWMpvmHdU
	JRZmj4wkxuF/g/KQsK6VU/mvjzWO+4FKY3LRX23OFeGdAcGF5YHHEYnOx
	4ZYvfz48ps89vhnwKvlt2OxqrUgl0+61TlHFhxO7znXkO7vx7I5SZEIAa
	f+8RID81fu8bTQH3Ys/XGE3EKFsEOS63GbZXudasWvC5kDA2lyBintrBd w==;
IronPort-SDR: 33a+4aVtZ3dykY/zKeA0x0vCKS0WZCy5HHbqSJXlJNwq+FcSuoXBVhmTWdpHkcTpG2Saqbn0ad
	GG4Gv0mj13WQRxT1sCw2+TGE6KoCTaWFwX1/s0pS9Evb8xy3o0HNDFo1CxYvIwPuz3ooh9QUG3
	speB9xWxRQ2b4Ofl7FSxcCv5aODcQL6PFBbM0qJupdIInRhuO/Act59UTu7utdMLU6vgAV1PP8
	/v+T6mg+KMcy/odnVHTgPljGUE8tEJZxqnm3MUSxJinFcOfOnuupZd1KTAANle+wVr9fGgeoYv
	PTo=
X-IronPort-AV: E=Sophos;i="5.64,339,1559491200"; d="scan'208";a="116441581"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 03 Aug 2019 06:02:55 +0800
IronPort-SDR: t228sbSCsbaQCaXnz/GypYwr+ClD/N/ZHr5a0L1WbP93LM0smTJ736d8i6hrBeYRRYEnHPAm1o
	lWzcuRhE6j6wgPXcSScgcEu5MX0cSNeRF/43GvRFjygp4OP7tL57YgU60DX3E3t8OtKIBKpgP7
	MSodZmJwzYRDWTs6+fMmJh0zJFOHU7uC3fgcCJOGOv71iDLQseFYd1kmGuuE9BRs0LH3P9zr83
	nO8z/yCmHAEFDZq0OM1qf90vUvCibQUFwzToLnR5U6V3qIV+sgI+KHtwIjw1JXL2429yVghgJX
	2paLRDNqQFJh5HB7GQqirx0w
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Aug 2019 15:00:51 -0700
IronPort-SDR: rOrM5jM3yQHIxa0IWB5GNydYR8KV+xxp/6bfo0SvnHMTVpZBGCUmHRSZa7GjcnEs30QQM3CHZ9
	K4fiWUtY4KaESFFjRw28qVuK7wYaj9sN/U8y0m+zx2dVmH3A8b8ZJgRYJyAG+oiAGPUkhSZBjj
	XwNZNpo8BesCoPahiKAj4MBze6a+KWUhgsE/xbitLLIH/djK7HhRXyYsB+Mh3Xh8K1rmicDSG1
	dwwuX3vhWBTgIC6HX4ivMduJI0TEU2U+eTau0fpiYmvT55gjC/PzOrf/aEu71feaXjiwrGfxX7
	cVA=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 02 Aug 2019 15:02:54 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Fri,  2 Aug 2019 15:02:51 -0700
Message-Id: <20190802220251.1217-3-dmitry.fomichev@wdc.com>
In-Reply-To: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
References: <20190802220251.1217-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Fri, 02 Aug 2019 22:03:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 02 Aug 2019 22:03:41 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=110ab3187=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Dmitry Fomichev <dmitry.fomichev@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 2/2] dm-zoned: fix a few typos
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 02 Aug 2019 22:10:44 +0000 (UTC)

Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 8 ++++----
 drivers/md/dm-zoned-reclaim.c  | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 23e9a6d9350b..ded4984d18c9 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -35,7 +35,7 @@
  *    (1) Super block (1 block)
  *    (2) Chunk mapping table (nr_map_blocks)
  *    (3) Bitmap blocks (nr_bitmap_blocks)
- * All metadata blocks are stored in conventional zones, starting from the
+ * All metadata blocks are stored in conventional zones, starting from
  * the first conventional zone found on disk.
  */
 struct dmz_super {
@@ -234,7 +234,7 @@ void dmz_unlock_map(struct dmz_metadata *zmd)
  * Lock/unlock metadata access. This is a "read" lock on a semaphore
  * that prevents metadata flush from running while metadata are being
  * modified. The actual metadata write mutual exclusion is achieved with
- * the map lock and zone styate management (active and reclaim state are
+ * the map lock and zone state management (active and reclaim state are
  * mutually exclusive).
  */
 void dmz_lock_metadata(struct dmz_metadata *zmd)
@@ -1629,7 +1629,7 @@ struct dm_zone *dmz_get_chunk_mapping(struct dmz_metadata *zmd, unsigned int chu
 		if (op != REQ_OP_WRITE)
 			goto out;
 
-		/* Alloate a random zone */
+		/* Allocate a random zone */
 		dzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 		if (!dzone) {
 			dmz_wait_for_free_zones(zmd);
@@ -1726,7 +1726,7 @@ struct dm_zone *dmz_get_chunk_buffer(struct dmz_metadata *zmd,
 	if (bzone)
 		goto out;
 
-	/* Alloate a random zone */
+	/* Allocate a random zone */
 	bzone = dmz_alloc_zone(zmd, DMZ_ALLOC_RND);
 	if (!bzone) {
 		dmz_wait_for_free_zones(zmd);
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 387894e2add1..260e3598199e 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -428,7 +428,7 @@ static bool dmz_should_reclaim(struct dmz_reclaim *zrc)
 		return false;
 
 	/*
-	 * If the percentage of unmappped random zones is low,
+	 * If the percentage of unmapped random zones is low,
 	 * reclaim even if the target is busy.
 	 */
 	return p_unmap_rnd <= DMZ_RECLAIM_LOW_UNMAP_RND;
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
