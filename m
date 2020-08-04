Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2C91D23C098
	for <lists+dm-devel@lfdr.de>; Tue,  4 Aug 2020 22:13:59 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-222-VlEaF61_PL6DLUheVcHy7A-1; Tue, 04 Aug 2020 16:13:54 -0400
X-MC-Unique: VlEaF61_PL6DLUheVcHy7A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD3C61DE1;
	Tue,  4 Aug 2020 20:13:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5276272E48;
	Tue,  4 Aug 2020 20:13:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9C09F1809554;
	Tue,  4 Aug 2020 20:13:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0749PGul000871 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Aug 2020 05:25:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E43E2166BA4; Tue,  4 Aug 2020 09:25:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09B2E2166B28
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 09:25:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D33C8185A78B
	for <dm-devel@redhat.com>; Tue,  4 Aug 2020 09:25:12 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-nrV7h62ROPCHxb6FHovdFg-1; Tue, 04 Aug 2020 05:25:10 -0400
X-MC-Unique: nrV7h62ROPCHxb6FHovdFg-1
IronPort-SDR: W4R4MLbQGVJL2nTrtUrX1XWUgKyrp93jMl95C4juAOWcVkEyJUho3Qc+Zd779FeM515JyBttEs
	ViF22+dSCSMy6YP064mDRi3iSBW4tZoLzCdnYgdsfBlCrZIe2v8lQip5pAaOQPFZZksBVKBpKE
	JdQp5Ogf6jA8ORoaxwRYHdnlUE5TKSMBc4MeErafnMCQYkx9nG6dkddBBM+OyWtKmwaIDU6qXM
	y/za8oTgLeFlvcRdMu77Cr7bOA2bHh4ZB8uKVVJC4WxSZ0EdzgCTlXDLIBewGX7MlgiMbcxG5H
	mqo=
X-IronPort-AV: E=Sophos;i="5.75,433,1589212800"; d="scan'208";a="148405995"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 04 Aug 2020 17:25:09 +0800
IronPort-SDR: gB5OYjT+pJeUxPfnGQ9w8wXDlqCsPcOrbMOMcRAaqll0ZidX0BXuCzZ/XJxJQ7GMyrnm0gnA5O
	JJEfv81ED1TA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	04 Aug 2020 02:12:30 -0700
IronPort-SDR: msS9q4U6bq36kCs3sF3lj5wiBOYViz9U57vE+kNCqdCFGhItj7eeuMuVhcwyx6+llRjUPrEr/V
	xapHunlDYeow==
WDCIronportException: Internal
Received: from unknown (HELO redsun60.ssa.fujisawa.hgst.com) ([10.149.66.36])
	by uls-op-cesaip02.wdc.com with ESMTP; 04 Aug 2020 02:25:08 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  4 Aug 2020 18:25:01 +0900
Message-Id: <20200804092501.7938-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 04 Aug 2020 16:11:07 -0400
Cc: linux-block@vger.kernel.org, Naohiro Aota <Naohiro.Aota@wdc.com>,
	dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [dm-devel] [PATCH] dm: don't call report zones for more than the
	user requested
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't call report zones for more zones than the user actually requested,
otherwise this can lead to out-of-bounds accesses in the callback
functions.

Such a situation can happen if the target's ->report_zones() callback
function returns 0 because we've reached the end of the target and then
restart the report zones on the second target.

We're again calling into ->report_zones() and ultimately into the user
supplied callback function but when we're not subtracting the number of
zones already processed this may lead to out-of-bounds accesses in the
user callbacks.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 5b9de2f71bb0..88b391ff9bea 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -504,7 +504,8 @@ static int dm_blk_report_zones(struct gendisk *disk, sector_t sector,
 		}
 
 		args.tgt = tgt;
-		ret = tgt->type->report_zones(tgt, &args, nr_zones);
+		ret = tgt->type->report_zones(tgt, &args,
+					      nr_zones - args.zone_idx);
 		if (ret < 0)
 			goto out;
 	} while (args.zone_idx < nr_zones &&
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

