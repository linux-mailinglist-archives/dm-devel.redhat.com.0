Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E5288E92
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 23:44:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A002881DE1;
	Sat, 10 Aug 2019 21:44:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76AD3752CF;
	Sat, 10 Aug 2019 21:44:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D6B218005B9;
	Sat, 10 Aug 2019 21:44:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7ALiJUn025575 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 17:44:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6F3F919081; Sat, 10 Aug 2019 21:44:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3151F705B9;
	Sat, 10 Aug 2019 21:44:14 +0000 (UTC)
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 674AD300BEA2;
	Sat, 10 Aug 2019 21:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1565473444; x=1597009444;
	h=from:to:cc:subject:date:message-id:in-reply-to:
	references:mime-version:content-transfer-encoding;
	bh=TBAf4i2biLuEfzUaszMJsRAMw++Q0CODCLF+0WJmLJw=;
	b=py/tmbdT1XM9S1G+6RTbwkiaqo6Fu+8aTGA2AbOyoj6/nUZH+81rcd9+
	oIA0y9TeKge9NpPqz/rVZGdtQfPsc/vMF6roc68Zj90sYLicnt2hEYdlV
	cjtzQ7uwxqKCNklEUdmDWc+FaTjtj4n167G5F8QaO/aPQgg85wxrW/SK/
	5iuR5IzprvqejFmcCxlxYhyCfNox5DS10j4uvslZaWft0Iz+2eF44fu8Y
	xa/nHQ6NEfCdZDwA5/ZBasEhghAUtdQnLNBMUyY49BuTAVUH7qwMNaooP
	t/5GbmrOJQuPen1wBCTukeLLsvzHW1CnTms5IViQuVWjBZhRzkQolRe4L A==;
IronPort-SDR: kH6/onbRNk1sy5Vva6kbgItfmRly6JJEBFm1DhOy5dijucGXjNUJO/OoErG/TQBm+fPRwCe3Rl
	VO31Jf8tg7lg2Q/xOOKMnJk+Db7kCIp3ig5M7JI/E+eQ10T95SfMIhlcPMwnvGGqjJ+TgbRHfK
	DQhcTovWQ9+XdR1MH2TRkxnuZRFiu4X9Ex1DW4GTuAOMyDWMm0HkbK32XZwf+zDd9gN1B/cKNM
	8PUkY/ntzTEyN6f9cUDwpPLl6LjgewHRBGsWtWU66fqhbfZ+S8ptwfkx7pSIdYa5PpvyHxVkMV
	iXg=
X-IronPort-AV: E=Sophos;i="5.64,370,1559491200"; d="scan'208";a="115569225"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 11 Aug 2019 05:43:14 +0800
IronPort-SDR: YGFM4E3vXxMhJG8ofJJnuIgI7gK44C4d7B7dedff+DjcxdMcMO5DnpMMISkHlv6qK36yCK/sLy
	JuTfOxFAGzF9K/711/FLtfmNVmuFWEeA5XfjsnotiJYe/Ixv/Gqh9huSaai6pbNqZQDG/ap9lH
	2njHY3tPc8kLT9LsGaZ0lPc+Wt1G1Y2aNcbpOI2vhL7WZDrFILQvV+EQzRa8nzaOISc9DZZS18
	/hu+Zpc7uR1mS1QcTJ9niazgpHWWwt9G+xHobyxRHTqVIBvCLtaXRbFjk/y4kCgkcur61T8bLl
	XpvoIxduuxSbQzPtBEyGtubi
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	10 Aug 2019 14:40:53 -0700
IronPort-SDR: VQjZ710DNcktUrWUbGMy7tIDvv7YbvNX/2q4hRsnYRKIUCe8oFh5VQE+J/BbkjYJo29Jkm/ZbM
	Tm4GMml//10WQgCZIaRkbjXkK2/KJbf+yAPKVvXqq2j7ZvuvvGn6/MjVgMk8J/XlVx4lXvuXlq
	QS7/z7FA18LYyhfvOA1tj9Q+dWxwVV36ATKDFM/vJQOZ7URBtKv9KVibEH5cxrR/I0LINDXio1
	stNBaVNPUMJ6a0fUIEeB7JaXyW/ypcXT6XFi+yqPFfiOMOX6GHP5td3p/bKEv4/8R0yTft8tWh
	xsY=
Received: from dhcp-10-88-173-43.hgst.com (HELO localhost.localdomain)
	([10.88.173.43])
	by uls-op-cesaip01.wdc.com with ESMTP; 10 Aug 2019 14:43:13 -0700
From: Dmitry Fomichev <dmitry.fomichev@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Sat, 10 Aug 2019 14:43:10 -0700
Message-Id: <20190810214311.9503-3-dmitry.fomichev@wdc.com>
In-Reply-To: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
References: <20190810214311.9503-1-dmitry.fomichev@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Sat, 10 Aug 2019 21:44:04 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Sat, 10 Aug 2019 21:44:04 +0000 (UTC) for IP:'216.71.154.42'
	DOMAIN:'esa4.hgst.iphmx.com' HELO:'esa4.hgst.iphmx.com'
	FROM:'dmitry.fomichev@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.42 esa4.hgst.iphmx.com 216.71.154.42
	esa4.hgst.iphmx.com <prvs=1182bd66c=dmitry.fomichev@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH v2 2/3] dm-zoned: improve error handling in i/o
	map code
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Sat, 10 Aug 2019 21:44:23 +0000 (UTC)

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
