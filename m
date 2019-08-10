Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE1088E91
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 23:44:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27C5F36899;
	Sat, 10 Aug 2019 21:44:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A32C60872;
	Sat, 10 Aug 2019 21:44:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8B6E2551C;
	Sat, 10 Aug 2019 21:44:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ALiCig025562 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 17:44:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61FC85D6B0; Sat, 10 Aug 2019 21:44:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3170B6B57F;
	Sat, 10 Aug 2019 21:44:08 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2A57A8E585;
	Sat, 10 Aug 2019 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565473439; x=1597009439;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=GYH0DPNgD42uDrCQida6Niw2vCvy+IxEUDm52VTUf88=;
	b=VCRj69MZWOedpNFfnEvoI8wIety+WFy8SQHdOFETTHuINQ5pdNovx5Bz
	FrMndAWhc6p3ZC6HNNGwowsDKk0JVQygKviUn2061vPy33VKWk5Q/Ida1
	838pWwobQX467yxoOnlYrVATFb8YBdlrXT+gqDNlcB5+PipVvTvXXDbyf
	jlD6xBFKxAwZS1SIujOx909ocyb4ynSakjdwFOwUV2NtAeQUsC94wpFWh
	sdvRCdnoddxaXF+YdTuomaE/by9fe8D/Nw6a0WGKyYTc4wvVVGt8NnaMJ
	89Hc7onB54IpgbAmAcswU6Eb8vkZybcaVslG0s5GvdIHqZZVHyJgLo1NX Q==;
IronPort-SDR: 6ikMh7QpdjrWFn3jJIFZD+jX9S9JEEyu5y9ieMSSMeHLUNznOrmLC2eIKI1sRnfG+DJD+b+zwr
	AqX7/8YZogsX1C0vI/2+25HS7gSkdfjZkdSJbIrFWQ5zra0Bu/arPD2oCuTiTWPmfwyDX7x9Fi
	UyFHp79qmZ1BwHzRrmgvD00diewiwYlIbKTBHUCbfLqDAaX/hs2Un0o84OfB/cqqaoTslTKvMV
	JDA6GAbTHX5JTBzWQAhTfWVECtSFSBB0ysqXwjNZ60u7tdG3Lzto6oeNXkKq2kv0pDYZhh3G8g
	I3U=
X-IronPort-AV: E=Sophos;i="5.64,370,1559491200"; d="scan'208";a="115569224"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2019 05:43:13 +0800
IronPort-SDR: P2VXyW9KOl5Lse706W+dUC5wX1/x+/BAi1gZduAJRCpSau6I0vCm3+M4R9rbPuiem3zzJMo3A7
	fR6BzpwxhO1NiKKIpzBNJt32q+AffXxmtOD6bLTMGC+9fJArCzlYDf2s5W7d1nO3FHmWiegnbN
	ezA1ksK5F3AoGDoMMk69q50HpxhBcU8vJbu3a4Y94AXLgUMafJoF39IzvPTtfadP/nSXZe3gOZ
	YEKy6BcO6xzpAvI2hon/+N1maV0EvO1y6UK4sBwi2XwZB7z82wGFPPFwzZ9yByC4muDdGtnHhy
	vjBHZxHYJqhd7Q+6QF+wuj/j
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Aug 2019 14:40:52 -0700
IronPort-SDR: p8wj1lyp9fCeWBX8j0Kz7+iwUm/R6JD1OZoP7v8DF3HvIVIch9SZS8dMYBGYyPC9L1alUyARqW
	/V54RFHktKmmT2pQYVveoXjnaK/+LZJfvVFBParMdI8jju2Z4oNjDS+JKAhRtQHQaGHHez1ggu
	NLRblW9Phr9Ftyjmv8BTQLvbJxG/DPrdLoHWTA4ma5w3bdcM9RMz4XxllCrnBEag1Fz1HaVz6X
	Db+n7gAQ6x979wpJ7lsObzP4mbLLufj0cqs/0B8lpfiWKAi2vb0Im2qz5+NN0zHfFdNSh3+0AI
	4lM=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Aug 2019 14:43:12 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sat, 10 Aug 2019 14:43:09 -0700
Message-Id: <20190810214311.9503-2-dmitry.fomichev@wdc.com>
In-Reply-To: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
References: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Sat, 10 Aug 2019 21:43:59 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Sat, 10 Aug 2019 21:43:59 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=1182bd66c=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH v2 1/3] dm-zoned: improve error handling in
	reclaim
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Sat, 10 Aug 2019 21:44:20 +0000 (UTC)

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
