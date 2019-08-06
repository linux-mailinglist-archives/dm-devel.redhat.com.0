Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CB55A82915
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 03:12:51 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19C64C08E2BD;
	Tue,  6 Aug 2019 01:12:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE42B5D6D0;
	Tue,  6 Aug 2019 01:12:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D72C18089C8;
	Tue,  6 Aug 2019 01:12:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76173O4011247 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 21:07:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E7DA60FA1; Tue,  6 Aug 2019 01:07:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B2B60CD3;
	Tue,  6 Aug 2019 01:06:59 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DB4888319;
	Tue,  6 Aug 2019 01:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565053610; x=1596589610;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GYH0DPNgD42uDrCQida6Niw2vCvy+IxEUDm52VTUf88=;
	b=NDqyHeN576nS0ld4sqh+zooBcTxqS1YWyXNQTkFZ98iCnH4efU20PBm8
	VWGU4ShEFvBgX8D2EI3CBMJTgoM6KlVrvGYQgVDUJSFPShafeChmHMh1j
	EeNNdF88MiywnTaFwxL1M8kNPX6qmuhK0VbncAUFKEoy1kIV8aKIBHLSZ
	P+Lp1LwwxlB3emCB/CLtHZs6Z4DpFr471TRn8k8YZ/FIb+Ni2vvWU57Pa
	5ufF+i+uMjKg8F+t4+htrh+6JhbNnkolenIby+mZIetUkLh16Xz2QlVdY
	LqzSwe/0l1sRU4APLcnGRAqsxA4158bNiwrnrNxzKK3HDkSZuhFVbVHn3 g==;
IronPort-SDR: KoJ8Rj9Whv4U0x9RDzT0aeo2EdRAjB96O677qXbd026VAyFoZYdMMpXpTLkT+XNlO+Mc0m1iET
	6CBcw9qUlt748ARWjusX/ZAo50vpJ851tj2mgA63WUxA+1CBXVTXut/r4Pqb8ECGrpdPp52L4O
	IX2h5nbq+iiDvco2gk8CuJdgXkVkJToz9cJRqScN6YYorLmqn+96Kw1bny2b90IOF5Bt7io6hV
	BLvPtl8+LqEcfbq3TCWcOGcdpO/p7QheoX12jBBNJWImlJmFbB/vYFYQ0tDHRo5D9HBSrOf6jA
	TCI=
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="119702621"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2019 09:06:29 +0800
IronPort-SDR: l291/BwJGTuQ3HT08c98cGcLHGv7U04/HzqKKW9FZ/uxzdtMkRLDeRlqOYvo2DKMAOWxhiYsNN
	rt8lXdDnIIazPNyQ5zT/OHGDJXu0EkBHuTdT/oHzAPHiNW7t4CHnbcI5GE5Yn6uSMHIByMLAX/
	rI40CYCKkYbNITIUMoUIN+irU9why+E6Ufc/8Ev488xUjTxKstK/qTabmOc8WNQ91fknEY7nTl
	sSXZmbgob2EUl1GlCeC1AhWtQodgUTcYSE8HvNZYLeSadyWEQ2E2Rx9l2WtTBvXebAnysAhX0O
	9sMZNAsb3pUgre4UjgCmvSiX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 18:04:18 -0700
IronPort-SDR: 2d7220Ftutke9U6pLmWxivpYe+P/DK3vnqeC72c7RRw6zgNMj2ok43c5LkbC0HyRHGTC9Bj3Rb
	u9gZ4XryOZd/J9M6NRvyuJV4svYhfzOJOfeyGFZlCNLJbnOKvco/aN3fbz1SFOqpeaZ2HzenFV
	DU2tVmPO2gmI06mfnAgUxmqJhTCDP0LkwpaNo/8UlQOOpsYm/UHHcYBSz964NmLl8A8y7OcSkz
	dxPGOCozc7oocNFHoE0KXGQR2pTSkkchPDk/J2bHjPJ29rhh8ycUWbtx+OPOg6yBPigms5d9SS
	JC4=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2019 18:06:27 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  5 Aug 2019 18:06:23 -0700
Message-Id: <20190806010625.27503-2-dmitry.fomichev@wdc.com>
In-Reply-To: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Tue, 06 Aug 2019 01:06:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 06 Aug 2019 01:06:48 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com 216.71.153.141
	esa3.hgst.iphmx.com <prvs=11492cde3=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 1/3] dm-zoned: improve error handling in reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 06 Aug 2019 01:12:50 +0000 (UTC)

There are several places in reclaim code where errors are not
propagated to the main function, dmz_reclaim(). This function
is responsible for unlocking zones that might be still locked
at the end of any failed reclaim iterations. As the result,
some device zones may be left permanently locked for reclaim,
degrading target's capability to reclaim zones.

This patch fixes these issues as follows -

Make sure that dmz_reclaim_buf(), dmz_reclaim_seq_data() and
dmz_reclaim_rnd_data() return error codes to the caller.

dmz_reclaim() function is renamed to dmz_do_reclaim() to avoid
clashing with "struct dmz_reclaim" and is modified to return the
error to the caller.

dmz_get_zone_for_reclaim() now returns an error instead of NULL
pointer and reclaim code checks for that error.

Error logging/debug messages are added where necessary.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-metadata.c |  4 ++--
 drivers/md/dm-zoned-reclaim.c  | 28 +++++++++++++++++++---------
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index ded4984d18c9..6b7fbbd735ef 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1543,7 +1543,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
 	struct dm_zone *zone;
 
 	if (list_empty(&zmd->map_rnd_list))
-		return NULL;
+		return ERR_PTR(-EBUSY);
 
 	list_for_each_entry(zone, &zmd->map_rnd_list, link) {
 		if (dmz_is_buf(zone))
@@ -1554,7 +1554,7 @@ static struct dm_zone *dmz_get_rnd_zone_for_reclaim(struct dmz_metadata *zmd)
 			return dzone;
 	}
 
-	return NULL;
+	return ERR_PTR(-EBUSY);
 }
 
 /*
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 260e3598199e..26e34493a2db 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -216,7 +216,7 @@ static int dmz_reclaim_buf(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_unlock_flush(zmd);
 
-	return 0;
+	return ret;
 }
 
 /*
@@ -260,7 +260,7 @@ static int dmz_reclaim_seq_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_unlock_flush(zmd);
 
-	return 0;
+	return ret;
 }
 
 /*
@@ -313,7 +313,7 @@ static int dmz_reclaim_rnd_data(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 
 	dmz_unlock_flush(zmd);
 
-	return 0;
+	return ret;
 }
 
 /*
@@ -335,7 +335,7 @@ static void dmz_reclaim_empty(struct dmz_reclaim *zrc, struct dm_zone *dzone)
 /*
  * Find a candidate zone for reclaim and process it.
  */
-static void dmz_reclaim(struct dmz_reclaim *zrc)
+static int dmz_do_reclaim(struct dmz_reclaim *zrc)
 {
 	struct dmz_metadata *zmd = zrc->metadata;
 	struct dm_zone *dzone;
@@ -345,8 +345,8 @@ static void dmz_reclaim(struct dmz_reclaim *zrc)
 
 	/* Get a data zone */
 	dzone = dmz_get_zone_for_reclaim(zmd);
-	if (!dzone)
-		return;
+	if (IS_ERR(dzone))
+		return PTR_ERR(dzone);
 
 	start = jiffies;
 
@@ -392,13 +392,20 @@ static void dmz_reclaim(struct dmz_reclaim *zrc)
 out:
 	if (ret) {
 		dmz_unlock_zone_reclaim(dzone);
-		return;
+		return ret;
 	}
 
-	(void) dmz_flush_metadata(zrc->metadata);
+	ret = dmz_flush_metadata(zrc->metadata);
+	if (ret) {
+		dmz_dev_debug(zrc->dev,
+			      "Metadata flush for zone %u failed, err %d\n",
+			      dmz_id(zmd, rzone), ret);
+		return ret;
+	}
 
 	dmz_dev_debug(zrc->dev, "Reclaimed zone %u in %u ms",
 		      dmz_id(zmd, rzone), jiffies_to_msecs(jiffies - start));
+	return 0;
 }
 
 /*
@@ -443,6 +450,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 	struct dmz_metadata *zmd = zrc->metadata;
 	unsigned int nr_rnd, nr_unmap_rnd;
 	unsigned int p_unmap_rnd;
+	int ret;
 
 	if (!dmz_should_reclaim(zrc)) {
 		mod_delayed_work(zrc->wq, &zrc->work, DMZ_IDLE_PERIOD);
@@ -472,7 +480,9 @@ static void dmz_reclaim_work(struct work_struct *work)
 		      (dmz_target_idle(zrc) ? "Idle" : "Busy"),
 		      p_unmap_rnd, nr_unmap_rnd, nr_rnd);
 
-	dmz_reclaim(zrc);
+	ret = dmz_do_reclaim(zrc);
+	if (ret)
+		dmz_dev_debug(zrc->dev, "Reclaim error %d\n", ret);
 
 	dmz_schedule_reclaim(zrc);
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
