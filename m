Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69AA9EE5
	for <lists+dm-devel@lfdr.de>; Thu,  5 Sep 2019 11:52:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 621C918C427B;
	Thu,  5 Sep 2019 09:52:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A78A5DA60;
	Thu,  5 Sep 2019 09:52:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 481021802218;
	Thu,  5 Sep 2019 09:52:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x859qVGO026764 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Sep 2019 05:52:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A3B4F5D9E5; Thu,  5 Sep 2019 09:52:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx29.extmail.prod.ext.phx2.redhat.com
	[10.5.110.70])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AE665D9E1;
	Thu,  5 Sep 2019 09:52:25 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B449C190C007;
	Thu,  5 Sep 2019 09:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1567677135; x=1599213135;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=Cs/kYxOynowlSHLGbvCRTCAdV79X3s4AnL02e7kfB/w=;
	b=LuzpFQplk2QZ+F1FBkU4DHAqQvZVEZtJBxssu+Fcvl7Xo+bUcsJ9lyaq
	WoRNczPE0qrAYpSEhaRDkxamlrPh9DNKamGNqJrAUHpCLNL1hTsnUrbv9
	3c0gIH0F8mZX+QGqongxTQLntqwztu5etO0hw/7vFqZdh57Xi03S9kH8o
	rL1WbJIb66kfgz3di85z7FdjZJfHZg2LRCiFmrSUsrvV17hWIykvylzyX
	sPrfi/eqGU/VK6GBrK8BiJjFabTu3VKNRVGMdVQvrsWbhUf8C/U4ALy0f
	uec1KIuFk/tVA7yMfdNRYHVePCLSWm040VW5iwZkdTumIXVHlNDN6nH9M g==;
IronPort-SDR: ze3nrCxyKDCWz+i2wvpb3WMLPfD6gSM6bS7GB7pNJsu3xsXo+q8tRicjSZiyU1G/q8oo85FM+L
	jaRkbCTJnV4ez3oEhyiKqxi8vQhZuG/0FXROP0OMcaNIpuCqcyXPePTbJwjMpOgb5CsnkKOlPl
	L6fsP7PN8c5bwWN6mDXxnfsGdFmnBTwHMmSDBtJGjQfEV2oHYRjXYsDHlFpLKtulArkbHPLHZ2
	SkdflRaGUVUAYV31fSwDrIhLlh3SCPbHHDmQMZskuA8SP6lXPtzvPX+shiimJaoGNTwRbA/nHO
	wdA=
X-IronPort-AV: E=Sophos;i="5.64,470,1559491200"; d="scan'208";a="119106236"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 05 Sep 2019 17:51:37 +0800
IronPort-SDR: kFONbgXX/M33+wYbKgr5KPAKlnVxPBd2zN9s41CdPlj1sKpnA6s276ilmc4q+UnoMXzHwvP6i3
	5+ck3/1/h3hL9+LLGZKY29yuElyrjqkI0lFR3MbhEPiF8ewdTsh7tWPbTrAArZ6/ethlHkjDjp
	IF2PU6SlfC6aqyh41jSEkRRG+mMko9zAfLH4/v6TICyUYpSYCDEaFwRr5p2vTL1+1yYc4bTkNT
	bP6owXDKlM933dQlYhlSBXaIQXotSQJbpj4qblLrSVy9N10E9BF2ThHuzDwzkPVIOUUAWnPagH
	jSZYHsotLFv+S1hO1I05vo5z
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	05 Sep 2019 02:48:34 -0700
IronPort-SDR: Swvm3JGu1EFRj2eCypZzaVkhb977bgBGcHjrQxAyDzagh1Swod1OY4+qoMIPCGCfugLlx5iLND
	R+hgwKOYflCwuBq4/le79FynoSmiK0JTRzbYWbZljCxZkDdhVil7a5ai68uptZ04VoMDuPYlBy
	mWxVEx+drNZc2K1WeltGEhx4mrHkwd5ZEwg96ontrTgxkaCc1EBO8VjbsHQZhvdLvPLrARHbRp
	VZLqDKMIrOaRXQ2XeOiG35ADcOor8DPWAj0lqrNQv4M6t63OA137tmxZbN3WtJ3vbI7TqCMOpc
	Amw=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 05 Sep 2019 02:51:37 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu,  5 Sep 2019 18:51:28 +0900
Message-Id: <20190905095135.26026-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.70]); Thu, 05 Sep 2019 09:52:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]);
	Thu, 05 Sep 2019 09:52:14 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=1441e10e1=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.70
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v5 0/7] Elevator cleanups and improvements
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.62]); Thu, 05 Sep 2019 09:52:52 +0000 (UTC)

This patch series implements some cleanup of the elevator initialization
code and introduces elevator features identification and device matching
to enhance checks for elevator/device compatibility and fitness.

The first 2 patches of the series are simple cleanups which simplify 
elevator initialization for newly allocated device queues.

Patch 3 introduce elevator features, allowing a clean and extensible
definition of devices and features that an elevator supports and match
these against features required by a block device. With this, the sysfs
elevator list for a device always shows only elevators matching the
features that a particular device requires, with the exception of the
none elevator which has no features but is always available for use
with any device.

The first feature defined is for zoned block device sequential write
constraint support through zone write locking which prevents the use of
any elevator that does not support this feature with zoned devices.

The last 4 patches of this series rework the default elevator selection
and initialization to allow for the elevator/device features matching
to work, doing so addressing cases not currently well supported, namely,
multi-queue zoned block devices.

Changes from v4:
* Fix patch 5 again to correctly handle request based DM devices and
  avoid that default queue elevator of these devices end up always
  being "none".

Changes from v3:
* Fixed patch 5 to correctly handle DM devices which do not register a
  request queue and so do not need elevator initialization.

Changes from v2:
* Fixed patch 4
* Call elevator_init_mq() earlier in device_add_disk() as suggested by
  Christoph (patch 5)
* Fixed title of patch 7

Changes from v1:
* Addressed Johannes comments
* Rebased on newest for-next branch to include Ming's sysfs lock changes

Damien Le Moal (7):
  block: Cleanup elevator_init_mq() use
  block: Change elevator_init_mq() to always succeed
  block: Introduce elevator features
  block: Improve default elevator selection
  block: Delay default elevator initialization
  block: Set ELEVATOR_F_ZBD_SEQ_WRITE for nullblk zoned disks
  sd: Set ELEVATOR_F_ZBD_SEQ_WRITE for ZBC disks

 block/blk-mq.c                |  20 +++--
 block/blk-settings.c          |  16 ++++
 block/blk.h                   |   2 +-
 block/elevator.c              | 137 ++++++++++++++++++++++++++--------
 block/genhd.c                 |   9 +++
 block/mq-deadline.c           |   1 +
 drivers/block/null_blk_main.c |   2 +
 drivers/md/dm-rq.c            |   2 +-
 drivers/scsi/sd_zbc.c         |   2 +
 include/linux/blk-mq.h        |   3 +-
 include/linux/blkdev.h        |   4 +
 include/linux/elevator.h      |   8 ++
 12 files changed, 161 insertions(+), 45 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
