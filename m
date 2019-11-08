Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 34A87F3DC8
	for <lists+dm-devel@lfdr.de>; Fri,  8 Nov 2019 03:00:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573178433;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ujtpb63bS0Z0dXVKzL/INJG/lNrAkZCG/eCe4uLJZGk=;
	b=Jp3CMVEKbSt1n1QCWzAoyaDz8FaxqCP8c/h9PAhnSN6Ws149zX4oExVOWxBPkzkI1tsxHP
	sJPSUJJ55xIorqRby04uUdbwAAb2pGNluMqJyJXvhEGs8J8SZaP31jOrjwVpEZaTArVuHq
	lfCZqbJpeva3g9j1UlR+5qOb26A/KN0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-YBbjXNCGN6KBFYte0JluRg-1; Thu, 07 Nov 2019 21:00:29 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6748B801FBF;
	Fri,  8 Nov 2019 02:00:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2E2685D6A5;
	Fri,  8 Nov 2019 02:00:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6639D4BB65;
	Fri,  8 Nov 2019 02:00:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA81vfx0000545 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 20:57:41 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 95ECF60C88; Fri,  8 Nov 2019 01:57:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22EA760BE1;
	Fri,  8 Nov 2019 01:57:35 +0000 (UTC)
Received: from esa2.hgst.iphmx.com (esa2.hgst.iphmx.com [68.232.143.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 929918AB926;
	Fri,  8 Nov 2019 01:57:13 +0000 (UTC)
IronPort-SDR: tWb06v1QQUgy0wf0W+GiQKmliPIPA4LeNR3w3udLbeATzBM3pg5Wcmqcv1JEbU+W0MP3m+ibZb
	oYLYPRSAxdm5R+Qx9DriY31sZK34Zbfm7PDuBQtdNzLO5U1pcjgBJuiY7ViUW/HcK0Zq/Pe4Gq
	iRC8tC9QqcjeXyFrxDDobDGGz/sCHG18KXflSWeT1n6pdn72zcUZkQT83RoWiJOp8orp0eoJwn
	B+F4cO/5gP3d/ZyysRy6vDZ+0ICaK9JVw0oxW/sdrfedSl2i48eXnhVsDQRa4Cp487kDVNSDRp
	3uw=
X-IronPort-AV: E=Sophos;i="5.68,279,1569254400"; d="scan'208";a="223636896"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Nov 2019 09:57:36 +0800
IronPort-SDR: QRiYTuuVhkkYwOi3dvdPZB4NMArSdopIblwbl0vIZNOpGBZ1pUjfmu2MsLplrS0BzeZu7seJNH
	ZXnS3NujADb6dU2qpNd+65PQSa8HOoeDPcPz/oX9jDnnmqlqgPULaTmodJiIpgsP1Iy9XDiBoi
	AHu4lFk1EpYZ3bOWA6DD9EKq9xvx+l9iBFSJUiz+2Jv5fojPVuaZIPduZmXkDnozge5R9ZxGae
	yDwXO9gHIrglxnvqlV1hSWaZuC4FXS2OYpvD8en0drVxlBdoflavAtOTuJX7LLcJeuzbjBm9Lj
	pUnyc4eFswwfokpb0Z63Y4MX
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Nov 2019 17:52:14 -0800
IronPort-SDR: n1JB/r/HWWN2B17V0qOnL+HfFwacsPp5S7iKAhVZGZsNZezmTrmkpdg7au+KUF22Zv4gjzyhb7
	NHHxOniZM35NXgyv3T+t/RUTLj9+ZkQSbX7SIgY7GZHWE8zXAyV+VCl3tx8wJpZ3D0qpEbNLAK
	7lTAk0GlfNVg6qBZeCDlW+7HFz5ZLDgOHAwhAZhqjj2Nv6zn+b7OuaTwd/ou9i+FLBk4tB18CH
	gz93U1hqWBN1NMh1oiqBwxd5rlbxaIZgAFJxbbCE5WrcvT0uWh4c9ostOi3q4RjsklKO86XJSy
	ZTE=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2019 17:57:03 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net,
	Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>
Date: Fri,  8 Nov 2019 10:56:53 +0900
Message-Id: <20191108015702.233102-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Fri, 08 Nov 2019 01:57:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Fri, 08 Nov 2019 01:57:26 +0000 (UTC) for IP:'68.232.143.124'
	DOMAIN:'esa2.hgst.iphmx.com' HELO:'esa2.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 68.232.143.124 esa2.hgst.iphmx.com 68.232.143.124
	esa2.hgst.iphmx.com <prvs=208d19533=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/9] Zoned block device enhancements and zone
	report rework
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: YBbjXNCGN6KBFYte0JluRg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series of patches introduces changes to zoned block device handling
code with the intent to simplify the code while optimizing run-time
operation, particularly in the area of zone reporting.

The first patch lifts the device zone check code out of the sd driver
and reimplements these zone checks generically as part of
blk_revalidate_disk_zones(). This avoids zoned block device drivers to
have to implement these checks. The second patch simplifies this
function code for the !zoned case.

The third patch is a small cleanup of zone report processing in
preparation for the fourth patch which removes support for partitions
on zoned block devices. As mentioned in that patch commit message, none
of the known partitioning tools support zoned devices and there are no
known use case in the field of SMR disks being used with partitions.
Dropping partition supports allows to significantly simplify the code
for zone report as zone sector values remapping becomes unnecessary.

Patch 5 to 6 are small cleanups and fixes of the null_blk driver zoned
mode.

The prep patch 7 optimizes zone report buffer allocation for the SCSI
sd driver. Finally, patch 8 introduces a new interface for report zones
handling using a callback function executed per zone reported by the
device. This allows avoiding the need to allocate large arrays of
blk_zone structures for the execution of zone reports. This can
significantly reduce memory usage and pressure on the memory management
system while significantly simplify the code all over.

Overall, this series not only reduces significantly the code size, it
also improves run-time memory usage for zone report execution.

This series applies cleanly on the for-next block tree on top of the
zone management operation series. It may however create a conflict with
Christoph's reqork of disk size revalidation. Please consider this
series for inclusion in the 5.5 kernel.

As always, comments are welcome.


Christoph Hellwig (4):
  block: cleanup the !zoned case in blk_revalidate_disk_zones
  null_blk: clean up the block device operations
  null_blk: clean up report zones
  block: rework zone reporting

Damien Le Moal (5):
  block: Enhance blk_revalidate_disk_zones()
  block: Simplify report zones execution
  block: Remove partition support for zoned block devices
  null_blk: Add zone_nr_conv to features
  scsi: sd_zbc: Cleanup sd_zbc_alloc_report_buffer()

 block/blk-core.c               |   6 +-
 block/blk-zoned.c              | 356 ++++++++++++++-------------------
 block/partition-generic.c      |  74 +------
 drivers/block/null_blk.h       |  11 +-
 drivers/block/null_blk_main.c  |  21 +-
 drivers/block/null_blk_zoned.c |  33 ++-
 drivers/md/dm-flakey.c         |  18 +-
 drivers/md/dm-linear.c         |  20 +-
 drivers/md/dm-zoned-metadata.c | 131 +++++-------
 drivers/md/dm.c                | 130 +++++-------
 drivers/scsi/sd.h              |   4 +-
 drivers/scsi/sd_zbc.c          | 235 ++++++++--------------
 fs/f2fs/super.c                |  51 ++---
 include/linux/blkdev.h         |  15 +-
 include/linux/device-mapper.h  |  24 ++-
 15 files changed, 427 insertions(+), 702 deletions(-)

-- 
2.23.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

