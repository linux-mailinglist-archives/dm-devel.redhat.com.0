Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A306A1E7
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jul 2019 07:41:21 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0434A81F1B;
	Tue, 16 Jul 2019 05:41:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7233D5E7A5;
	Tue, 16 Jul 2019 05:41:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CA2EB1800207;
	Tue, 16 Jul 2019 05:40:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6G5ejs2003502 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 01:40:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 971561001B0C; Tue, 16 Jul 2019 05:40:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39EEC1001B02;
	Tue, 16 Jul 2019 05:40:40 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9195F3078AAE;
	Tue, 16 Jul 2019 05:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1563255628; x=1594791628;
	h=from:to:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=SFmKiITfZyEO8mj67z1jVQOIobRGzuKBpNuEGUf7Gmk=;
	b=hJSputDPBVuvfAD1BASPLXj1CxhLCc6NJn0sqRhbkrQtUCoE18pazgS5
	XVFXaCzVqmmmXQ94x+fMa/yPr3lS+cqsIao+ONauuQSD434L8UJH4nr7d
	WUQaxj1Sxy/ZJqfoOwIp0m0m6bGqKWKNXlJ923aBJiVsGG2py8jj8ZA+m
	aP7ZQO0sq2tkybNO+XBIW1KnUqFI2nRvjsvFnpXla8bHVoqF5F7xr5XyM
	1R07f6nqQDApJeEdbphymkOZWIUlQ8JaudpGpkx9UNzHIfONGjpBEkzon
	XSNhidA1aCLiCTxQm/ctpzdBJdQp0coXz6r0z7N/nWI18TxQeRDZkKPIt g==;
IronPort-SDR: +Iwb54cf3CN3YDNJaUn5ry+zhJzONlftSmhJMjToYpAPkp1uks6CnrR+Em3VHWQWiUKG2R1qi9
	9rf9OfmMgZpArm6so3Wg3IFLrjQy5syG8jN/BAotnaC7qSNjgaKIEEG93S15uEG9VM+TEr2gHO
	GV0lPlvCGKH6TeK7t9cwL8LflDx7UiF8NwD05xeihzAMB1JBIFdeKlxJe2sVRbxxfBkDN/WN9I
	BuazOeUpELG532OI9KOcAwbXMEg946kVcR88G6+BzJtPPyn+Ou909ke9tT2tr33j9QvNoY/w7U
	8x8=
X-IronPort-AV: E=Sophos;i="5.63,496,1557158400"; d="scan'208";a="219580796"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2019 13:39:36 +0800
IronPort-SDR: GP2SLLc+ePlA03SiTC8EcQgOlfO8PMdraeFtoWcy3ddYguJHyD+iZ89TBF1F7pcpifKn/h7F67
	qCb1Hx1ZChco5Q5AsCTwvkYX+4KPRdM7G08F2wUD9T0LYTe+dHhLrGQvhr3MdVWTSemIHPSrxL
	GkjUKKECs7XV0AlCOkt4Ve2PRaTHISmJy97kywgu4R8KbKqgqiBnx1pSKJIzrlrm7bQqKmPqHV
	2zmY6qJn/ZczBH0ms8rxF6ybEkCPlczLunA6QA4OMkYjaXAKLdgXc8cIunEQx1ONKwGy/Vxpvh
	WBw1R+YinUp1X5z2wqLCWa+K
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 15 Jul 2019 22:38:09 -0700
IronPort-SDR: D52hZfh2AVocpz12rkFR921XhScv3Uo8btn9C5jNp4vaHWN3vSr5xH7gmVzbf88hYOJQ/kzahI
	1fZXqAG68Ll9uEiObJYYnR4+cR57z3XBMKU+r0Wo3dYa+qlKfVlxyp2Jxn213uRjYOTmMF6BlU
	HnZQYgB16V4OpYsNj1KiLUXCqNy83YWq5lxfYvaN5cZtww0B+0C8Xozc0WN9GDMdq2N+zpNisS
	xdF1rSDnRB0uZLXUSU6JDYNa47GP2gx56WJH5zSP9ocwSZ+xCsTOb2dt6fB+sanR/3szWtA9k5
	CeQ=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2019 22:39:36 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Tue, 16 Jul 2019 14:39:34 +0900
Message-Id: <20190716053934.24132-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Tue, 16 Jul 2019 05:40:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 16 Jul 2019 05:40:28 +0000 (UTC) for IP:'68.232.141.245'
	DOMAIN:'esa1.hgst.iphmx.com' HELO:'esa1.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.141.245 esa1.hgst.iphmx.com 68.232.141.245
	esa1.hgst.iphmx.com <prvs=0936ac21b=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-zoned: Fix zone state management race
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 16 Jul 2019 05:41:19 +0000 (UTC)

dm-zoned uses the zone flag DMZ_ACTIVE to indicate that a zone of the
backend device is being actively read or written and so cannot be
reclaimed. This flag is set as long as the zone atomic reference
counter is not 0. When this atomic is decremented and reaches 0 (e.g.
on BIO completion), the active flag is cleared and set again whenever
the zone is reused and BIO issued with the atomic counter incremented.
These 2 operations (atomic inc/dec and flag set/clear) are however not
always executed atomically under the target metadata mutex lock and
this causes the warning:

WARN_ON(!test_bit(DMZ_ACTIVE, &zone->flags));

in dmz_deactivate_zone() to be displayed. This problem is regularly
triggered with xfstests generic/209, generic/300, generic/451 and
xfs/077 with XFS being used as the file system on the dm-zoned target
device. Similarly, xfstests ext4/303, ext4/304, generic/209 and
generic/300 trigger the warning with ext4 use.

This problem can be easily fixed by simply removing the DMZ_ACTIVE flag
and managing the "ACTIVE" state by directly looking at the reference
counter value. To do so, the functions dmz_activate_zone() and
dmz_deactivate_zone() are changed to inline functions respectively
calling atomic_inc() and atomic_dec(), while the dmz_is_active() macro
is changed to an inline function calling atomic_read().

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Cc: stable@vger.kernel.org
Reported-by: Masato Suzuki <masato.suzuki@wdc.com>
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 24 ------------------------
 drivers/md/dm-zoned.h          | 28 ++++++++++++++++++++++++----
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 9faf3e49c7af..8545dcee9fd0 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1601,30 +1601,6 @@ struct dm_zone *dmz_get_zone_for_reclaim(struct dmz_metadata *zmd)
 	return zone;
 }
 
-/*
- * Activate a zone (increment its reference count).
- */
-void dmz_activate_zone(struct dm_zone *zone)
-{
-	set_bit(DMZ_ACTIVE, &zone->flags);
-	atomic_inc(&zone->refcount);
-}
-
-/*
- * Deactivate a zone. This decrement the zone reference counter
- * and clears the active state of the zone once the count reaches 0,
- * indicating that all BIOs to the zone have completed. Returns
- * true if the zone was deactivated.
- */
-void dmz_deactivate_zone(struct dm_zone *zone)
-{
-	if (atomic_dec_and_test(&zone->refcount)) {
-		WARN_ON(!test_bit(DMZ_ACTIVE, &zone->flags));
-		clear_bit_unlock(DMZ_ACTIVE, &zone->flags);
-		smp_mb__after_atomic();
-	}
-}
-
 /*
  * Get the zone mapping a chunk, if the chunk is mapped already.
  * If no mapping exist and the operation is WRITE, a zone is
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 12419f0bfe78..ed8de49c9a08 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -115,7 +115,6 @@ enum {
 	DMZ_BUF,
 
 	/* Zone internal state */
-	DMZ_ACTIVE,
 	DMZ_RECLAIM,
 	DMZ_SEQ_WRITE_ERR,
 };
@@ -128,7 +127,6 @@ enum {
 #define dmz_is_empty(z)		((z)->wp_block == 0)
 #define dmz_is_offline(z)	test_bit(DMZ_OFFLINE, &(z)->flags)
 #define dmz_is_readonly(z)	test_bit(DMZ_READ_ONLY, &(z)->flags)
-#define dmz_is_active(z)	test_bit(DMZ_ACTIVE, &(z)->flags)
 #define dmz_in_reclaim(z)	test_bit(DMZ_RECLAIM, &(z)->flags)
 #define dmz_seq_write_err(z)	test_bit(DMZ_SEQ_WRITE_ERR, &(z)->flags)
 
@@ -188,8 +186,30 @@ void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
 
-void dmz_activate_zone(struct dm_zone *zone);
-void dmz_deactivate_zone(struct dm_zone *zone);
+/*
+ * Activate a zone (increment its reference count).
+ */
+static inline void dmz_activate_zone(struct dm_zone *zone)
+{
+	atomic_inc(&zone->refcount);
+}
+
+/*
+ * Deactivate a zone. This decrement the zone reference counter
+ * indicating that all BIOs to the zone have completed when the count is 0.
+ */
+static inline void dmz_deactivate_zone(struct dm_zone *zone)
+{
+	atomic_dec(&zone->refcount);
+}
+
+/*
+ * Test if a zone is active, that is, has a refcount > 0.
+ */
+static inline bool dmz_is_active(struct dm_zone *zone)
+{
+	return atomic_read(&zone->refcount);
+}
 
 int dmz_lock_zone_reclaim(struct dm_zone *zone);
 void dmz_unlock_zone_reclaim(struct dm_zone *zone);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
