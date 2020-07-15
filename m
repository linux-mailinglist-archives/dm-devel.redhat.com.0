Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7FD2F220943
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-3yBpj0YtMdew2fdai6YmqQ-1; Wed, 15 Jul 2020 05:52:47 -0400
X-MC-Unique: 3yBpj0YtMdew2fdai6YmqQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3219E800597;
	Wed, 15 Jul 2020 09:52:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 144A461462;
	Wed, 15 Jul 2020 09:52:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BF57B1809563;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qR4i007888 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DDB3E1007A2B; Wed, 15 Jul 2020 09:52:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D996410073C3
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BA0121832D23
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:27 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-31-bCRaoIqiMRCoRPxCAB-_Mg-3; Wed, 15 Jul 2020 05:52:23 -0400
X-MC-Unique: bCRaoIqiMRCoRPxCAB-_Mg-3
IronPort-SDR: BMJg2yk9AFkgQH8qhVsyUp+cCYZr/fTX7C+EMTVWYeug4Nq3t2v/vD8zD2PkO8eSxqHlI8XthJ
	TOPawMR8ohEN077mF4qQMYHFABGHsmBnvLscQ+uvuOtR6gAoLTRVvwe8oeAH0NpFFgU7z7ZGRp
	HusthtktAK5bulxtPmdWLita81NWC9HGdxoK8YUK1vO4hcUw4AeiLlu7x/ghb0ws2dJqdAUaNV
	xTadzgIYhDTVLtIdRJ9I8HsCwjSSg74+4hi+htY0sw3uAiUOpy6m5/qBQviQoumMOEh1ZUi4n+
	YYM=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769671"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:23 +0800
IronPort-SDR: biC0UcX0cSnnjWqpDHU+hmn5b/sGtiiNY/E7jAFq1RQEpaEzwsX6TNGWBocXArosoDf4MSqAVn
	mwbOkQMqw5sTR9uTzk2bOutz9M1qeYvek=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:16 -0700
IronPort-SDR: qP2Dk+PxsDIeRAS3CeQdsj6m6TSVf4uLTmNvkXhRf1N3sEfDbswU1UZjoN/lRsS42Je8KpfW/8
	5IMTnVrIm3TQ==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:22 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:15 +0900
Message-Id: <20200715095217.441885-7-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 6/8] dm raid: Remove empty if statement
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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

