Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BA89C221B70
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 06:38:55 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495--Ml591QPPfmD6kVPlF1Usg-1; Thu, 16 Jul 2020 00:38:52 -0400
X-MC-Unique: -Ml591QPPfmD6kVPlF1Usg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 805F58027ED;
	Thu, 16 Jul 2020 04:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CDFC610AF;
	Thu, 16 Jul 2020 04:38:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 161C61809554;
	Thu, 16 Jul 2020 04:38:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G4cQbx010359 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 00:38:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B9572026D5D; Thu, 16 Jul 2020 04:38:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 126D7208DD82
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 307C3858EE4
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:25 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-xSoKeW8EPQOyCfUrBOaHag-2; Thu, 16 Jul 2020 00:38:20 -0400
X-MC-Unique: xSoKeW8EPQOyCfUrBOaHag-2
IronPort-SDR: Pc5NHxgwPG7KTmW9u6yjZl1JnC0dupbAvK2nYyBFlR9obaP9ThGgO8I1vMSAIFPPuhXkX29M9F
	zVIvux1cs0I+4r8Ep6LpGarx8p/Rc9j4HUBTM2HaEW2PnVFpXMrJ6yU1i6DpoOCfmg7oOdWeHA
	dZdzr/L/AEr7pdu1KKSItSHmL9OdUy7xPY1LdkIC4E5+5Lfj5HgS8k6hUpK19wkG/z9r/7NhNH
	vxxUNi2qjxVkl9xHIEKGtUuXzLzK+yc5sLGaCMyg50el3KxUALWaWL0OUlJBC/l7ELHc9Arhmz
	LOA=
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; d="scan'208";a="142711054"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 12:38:18 +0800
IronPort-SDR: aTI2PrOGVxn8ALx4tfRXwxonz906Nx2nOzn1oFku2zLwb0Mb7SIAesBm30STRvakvNZNxf5eNh
	pIdRxTjfHIjcKrSNMggveWTYvYDCI3xaM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 21:26:43 -0700
IronPort-SDR: 1rU7rvMS2Lxu8leBibqOg9vccLC0YS52axn1+AsiJvJmf/3ez73OTuaG3lI1QX02xEz7UiZ8eK
	nJPQ1/KIUZ7g==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 21:38:18 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 16 Jul 2020 13:38:13 +0900
Message-Id: <20200716043815.605448-3-damien.lemoal@wdc.com>
In-Reply-To: <20200716043815.605448-1-damien.lemoal@wdc.com>
References: <20200716043815.605448-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 2/4] dm raid: Remove empty if statement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In super_init_validation(), remove a body-less if statement testing only
variables to avoid a compilation warning when compiling with W=1.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-raid.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index 10e8b2fe787b..08023c50aaa0 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -2345,8 +2345,6 @@ static int super_init_validation(struct raid_set *rs, struct md_rdev *rdev)
 
 	if (new_devs == rs->raid_disks || !rebuilds) {
 		/* Replace a broken device */
-		if (new_devs == 1 && !rs->delta_disks)
-			;
 		if (new_devs == rs->raid_disks) {
 			DMINFO("Superblocks created for new raid set");
 			set_bit(MD_ARRAY_FIRST_USE, &mddev->flags);
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

