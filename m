Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFC682916
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 03:13:13 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18E77C05AA58;
	Tue,  6 Aug 2019 01:13:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7C8260632;
	Tue,  6 Aug 2019 01:13:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 322912551D;
	Tue,  6 Aug 2019 01:13:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7617PFI011259 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 5 Aug 2019 21:07:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5DF8F5C22F; Tue,  6 Aug 2019 01:07:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 070A75C1D8;
	Tue,  6 Aug 2019 01:07:20 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2F47530BCB98;
	Tue,  6 Aug 2019 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565053631; x=1596589631;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=TBAf4i2biLuEfzUaszMJsRAMw++Q0CODCLF+0WJmLJw=;
	b=bCmmKVZd2RMbB0/Z5GDhfD1jL1vXytcjZe9Hw7kNujSOuG2XgXTlJPIi
	Xer1lbTzhoLzxrAbaUAeV5MHJkUUmfGNG7UrbtPH8OyTjJ0MCwEmUxQcF
	kW2s2bpzq4oWf+xJeJDY0CMe3cOQ2/yI6vPaiHGiFJRvbWlKnPAL11T58
	38QqvZhnGnQOzTZkKlN4cEJFDDrxzjYOWCrOVGnazx3EFuHf9j7fYRRD2
	1+hZwis53yzV4sZugqe5qAibcnCHGv1ZXhKX2ekPO1Lx/Vog2OBapicWi
	bbAFDual7/SWiPE8EDmIs26RXeDpaJcO6WCuAfD12gi/bvTlfEh9VNnvD g==;
IronPort-SDR: UKv44dV7TvxpUAqnv5+Ci6LtuSCah0jfIzQfjRZYP6HZNL1QOSD2/Jmh0CYBdPy73sTVvo4umo
	1QDWMfSCWsnSZNAtbgsjFuzynr1dl3W6O2/xW6r3YO20OcvplAqXwSwxaW3bmdFdLpC6aX2CDm
	bFZv5Z1ILofJ+C8svJluX06wUkYt+wD1s2k0L8IhLhgD2xce05h7W98wt9bo0NK6iCZ8B2aO3P
	hpgX1B36QNHWER+f/thUmaJSxeYC6lVzI770Ex8YZqZ3Ei2TCv70UOK5pcEbqKl6eC89MMoSbv
	a90=
X-IronPort-AV: E=Sophos;i="5.64,350,1559491200"; d="scan'208";a="119702622"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 06 Aug 2019 09:06:29 +0800
IronPort-SDR: SptfjEcjRoh0g3Hsl9Gp9lFBu+r3zBu1VWFEV1Wsa6MmN+jlXyBtYjB/fMDi/VjksnB0n50HgN
	+SLotJWzgAw98JzpgHfsOBBYSkPjzwbH92IWsPLVymJGmWOEk5PNszjIlqq3zlb6ATfxNxcFH8
	52yrHCz9iUKGF9nmOWfeLaSKfdFksky9+yxcmKp33ijohokcrZ1yuDgmxs186EmwKfOBb+3xkd
	DtEfTJX9A1yMVqJmPEKt5AFW2SeR1UbVgI19gqqn2dsmDmNP7l5L62RWTsBm7Ih5QlGwhGy/0T
	VW7G2E0RMOMkIQ7MKgL/+Zqb
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Aug 2019 18:04:18 -0700
IronPort-SDR: r1z12UgT9t2s4VuAaMmG1RO4p5PJJiO5an5LYLQP34aMAQ8GM6WnnTXQA8IuamvztaGVj5me4M
	/CwHBOPoVnwpFKKU/Ep+/st31pDOA71DcToXsUg12qvnmcMUfstwkCugFnfRAidnekmpYMkgha
	HJo1W1gvRs+77wu/uMrQrvwJdsTL8zO91aQ+5XEsA639F9J1LyjlE1K/vTVhs1/V6IrxtVxmQc
	ym/IvxKd44qeIDIbLTt82GF/LqR/osDhRi2RX7arXLHfMVxCyeqNsDAF04tqfl1Nec1oOZI8j0
	C1A=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Aug 2019 18:06:27 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Mon,  5 Aug 2019 18:06:24 -0700
Message-Id: <20190806010625.27503-3-dmitry.fomichev@wdc.com>
In-Reply-To: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
References: <20190806010625.27503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 06 Aug 2019 01:07:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 06 Aug 2019 01:07:10 +0000 (UTC) for IP:'216.71.153.141'
	DOMAIN:'esa3.hgst.iphmx.com' HELO:'esa3.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.141 esa3.hgst.iphmx.com 216.71.153.141
	esa3.hgst.iphmx.com <prvs=11492cde3=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 2/3] dm-zoned: improve error handling in i/o map
	code
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Tue, 06 Aug 2019 01:13:11 +0000 (UTC)

Some errors are ignored in the I/O path during queueing chunks
for processing by chunk works. Since at least these errors are
transient in nature, it should be possible to retry the failed
incoming commands.

The fix -

Errors that can happen while queueing chunks are carried upwards
to the main mapping function and it now returns DM_MAPIO_REQUEUE
for any incoming requests that can not be properly queued.

Error logging/debug messages are added where needed.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Fomichev <dmitry.fomichev@wdc.com>
---
 drivers/md/dm-zoned-target.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 1bf6e6eebee1..c1992034c099 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -514,22 +514,24 @@ static void dmz_flush_work(struct work_struct *work)
  * Get a chunk work and start it to process a new BIO.
  * If the BIO chunk has no work yet, create one.
  */
-static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
+static int dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 {
 	unsigned int chunk = dmz_bio_chunk(dmz->dev, bio);
 	struct dm_chunk_work *cw;
+	int ret = 0;
 
 	mutex_lock(&dmz->chunk_lock);
 
 	/* Get the BIO chunk work. If one is not active yet, create one */
 	cw = radix_tree_lookup(&dmz->chunk_rxtree, chunk);
 	if (!cw) {
-		int ret;
 
 		/* Create a new chunk work */
 		cw = kmalloc(sizeof(struct dm_chunk_work), GFP_NOIO);
-		if (!cw)
+		if (unlikely(!cw)) {
+			ret = -ENOMEM;
 			goto out;
+		}
 
 		INIT_WORK(&cw->work, dmz_chunk_work);
 		refcount_set(&cw->refcount, 0);
@@ -540,7 +542,6 @@ static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 		ret = radix_tree_insert(&dmz->chunk_rxtree, chunk, cw);
 		if (unlikely(ret)) {
 			kfree(cw);
-			cw = NULL;
 			goto out;
 		}
 	}
@@ -548,10 +549,12 @@ static void dmz_queue_chunk_work(struct dmz_target *dmz, struct bio *bio)
 	bio_list_add(&cw->bio_list, bio);
 	dmz_get_chunk_work(cw);
 
+	dmz_reclaim_bio_acc(dmz->reclaim);
 	if (queue_work(dmz->chunk_wq, &cw->work))
 		dmz_get_chunk_work(cw);
 out:
 	mutex_unlock(&dmz->chunk_lock);
+	return ret;
 }
 
 /*
@@ -565,6 +568,7 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 	sector_t sector = bio->bi_iter.bi_sector;
 	unsigned int nr_sectors = bio_sectors(bio);
 	sector_t chunk_sector;
+	int ret;
 
 	dmz_dev_debug(dev, "BIO op %d sector %llu + %u => chunk %llu, block %llu, %u blocks",
 		      bio_op(bio), (unsigned long long)sector, nr_sectors,
@@ -602,8 +606,14 @@ static int dmz_map(struct dm_target *ti, struct bio *bio)
 		dm_accept_partial_bio(bio, dev->zone_nr_sectors - chunk_sector);
 
 	/* Now ready to handle this BIO */
-	dmz_reclaim_bio_acc(dmz->reclaim);
-	dmz_queue_chunk_work(dmz, bio);
+	ret = dmz_queue_chunk_work(dmz, bio);
+	if (ret) {
+		dmz_dev_debug(dmz->dev,
+			      "BIO op %d, can't process chunk %llu, err %i\n",
+			      bio_op(bio), (u64)dmz_bio_chunk(dmz->dev, bio),
+			      ret);
+		return DM_MAPIO_REQUEUE;
+	}
 
 	return DM_MAPIO_SUBMITTED;
 }
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
