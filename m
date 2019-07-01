Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E4A5B3DD
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jul 2019 07:12:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 632943082B55;
	Mon,  1 Jul 2019 05:11:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5612160FDE;
	Mon,  1 Jul 2019 05:11:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7AB51806B16;
	Mon,  1 Jul 2019 05:11:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x615AC1Q004118 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jul 2019 01:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80F4E6A974; Mon,  1 Jul 2019 05:10:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DE1C6A96D;
	Mon,  1 Jul 2019 05:10:04 +0000 (UTC)
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BC79A20276;
	Mon,  1 Jul 2019 05:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1561957786; x=1593493786;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=qEEVG/GleY2IhHFbty0HJ0pJ2y5UIrI3mATRE7IF8Kc=;
	b=bTXQDGHXEHFXQ6ZrTUPVDfJo+0ReEwlBQYarGPf0LsBYX02as2DQPLlZ
	8xpBRlkYB9cTiJOysmvTPgEkXE2trp8PkD4TJusAqIIDeRE+L8fim/Ozk
	9bolJY7jivtPDYZ0vg03TKPXpPUX/BbjeuLF9Gdf/GssnnJHsHbqukzSk
	xbjHlTp125R6ykeU/G3IatO52PactcGnNjThgXlQvZ8QiaCGNIUjofuax
	kEP/Qsjjx1/JnY/g4QIuu80KvX0vHAFOf8yx0bJgyBKqMIQ/72RPdUKky
	xlh1BClEEUCAAlO9PukNxDS2nAK7M8SLXCZfw6otTW+aV8MK/sAyu97i3 Q==;
X-IronPort-AV: E=Sophos;i="5.63,437,1557158400"; d="scan'208";a="113544721"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 01 Jul 2019 13:09:21 +0800
IronPort-SDR: mT/JygAZaBPBqhAsh0Q7Q1hW1CnpOGCh1eQCxNEdHvP5bg9LX9ehvb1af8Q0AJv6f8wMBsItmr
	Kc0Ub7bmrUzflItHWEr3tAHKP5XCO3mDlIqGJbs7D8RcAh49uz6OqDwBramzX3F7zRpSdKzIfF
	UYimE35LTKKRvVtY6AiV3XsMJEe3RBdwwJLrJzCHjx0jiRP0+G+5qogNCPcBqLMlFV5hlM/eC9
	N1lVSfGFn5XEZgmK0vFAG6w6A2sirvmdlKs10LXnX+xixd11UyhzhW1UxpOID9AmCO5I4SVT13
	9vsxvQPHSX7M50JfjQ5BAo5f
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
	by uls-op-cesaep01.wdc.com with ESMTP; 30 Jun 2019 22:08:21 -0700
IronPort-SDR: 5Q1/wtgNC7LQxTyrkYhLPNIik4AI54eskNVOntHzv7mffxKlteo9NrYKdCUn8bKYhw4isvZJ5g
	SPdVCloutID4n2c79mxSiUfb8JH8Z2Rket2Ka84Uno0LYrzN3jOtW/sXX6u8cp6ZTjGVry6aiJ
	Gc/2K7ZuhS/EQ4B35E28wEXte+jOZls35SdbunSPMbrjyus3Emt6VMM9Dakm7MbdAcItebyKxU
	qCXawUZNo+M7LvMfE8Mz4LdqTlekC2voQqegup+Sjma7hhN3izjmqYYrdmvhMeP/iTKRhZj74/
	KSU=
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip02.wdc.com with ESMTP; 30 Jun 2019 22:09:19 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon,  1 Jul 2019 14:09:14 +0900
Message-Id: <20190701050918.27511-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 01 Jul 2019 05:09:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 01 Jul 2019 05:09:45 +0000 (UTC) for IP:'216.71.154.45'
	DOMAIN:'esa6.hgst.iphmx.com' HELO:'esa6.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.154.45 esa6.hgst.iphmx.com 216.71.154.45
	esa6.hgst.iphmx.com <prvs=078492c59=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Christoph Hellwig <hch@lst.de>, Bart Van Assche <bvanassche@acm.org>
Subject: [dm-devel] [PATCH V6 0/4] Fix zone revalidation memory allocation
	failures
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 01 Jul 2019 05:11:54 +0000 (UTC)

This series addresses a reccuring problem with zone revalidation
failures observed during extensive testing with memory constrained
system and device hot-plugging.

The problem source is failure to allocate large memory areas with
alloc_pages() or kmalloc() in blk_revalidate_disk_zones() to store the
disk array of zones (struct blk_zone) or in sd_zbc_report_zones() for
the report zones command reply buffer.

The solution proposed here is to:
1) limit the number of zones to be reported with a single report zones
command execution, and
2) Use vmalloc to allocate large-ish arrays and buffers in place of
alloc_pages() or kmalloc().

With these changes, tests do not show any zone revalidation failures
while not impacting the time taken for a disk zone inspection during
device scan and revalidation.

Changes from v5:
* Remove the gfp_t argument from blkdev_report_zones() function and
  device report zones method, relying instead on
  memalloc_noio_save/restore() where GFP_NOIO was used.

Changes from v4:
* bio_copy_kern does not use the vmalloc buffer for IO so does not
  need flush/invalidate_kernel_vmap_range() of the buffer.

Changes from v3:
* Reworked use of flush_kernel_vmap_range() and
  invalidate_kernel_vmap_range() to contain the calls within bio.c,
  transparently to the user of bio_map_kern().
* Add similar support to bio_copy_kern().

Changes from v2:
* Move invalidate_kernel_vmap_range() of vmalloc-ed buffer to sd_zbc.c
  in patch 2, after completion of scsi_execute_req().
* In patch 2, add flush_kernel_vmap_range() before scsi_execute_req().

Changes from V1:
* Added call to invalidate_kernel_vmap_range() for vmalloc-ed buffers
  in patch 1.
* Fixed patch 2 compilation error with Sparc64 (kbuild robot)

Damien Le Moal (4):
  block: Allow mapping of vmalloc-ed buffers
  block: Kill gfp_t argument of blkdev_report_zones()
  sd_zbc: Fix report zones buffer allocation
  block: Limit zone array allocation size

 block/bio.c                    |  28 ++++++++-
 block/blk-zoned.c              |  67 +++++++++++---------
 drivers/block/null_blk.h       |   3 +-
 drivers/block/null_blk_zoned.c |   3 +-
 drivers/md/dm-flakey.c         |   5 +-
 drivers/md/dm-linear.c         |   5 +-
 drivers/md/dm-zoned-metadata.c |  16 +++--
 drivers/md/dm.c                |   6 +-
 drivers/scsi/sd.h              |   3 +-
 drivers/scsi/sd_zbc.c          | 108 +++++++++++++++++++++++----------
 fs/f2fs/super.c                |   4 +-
 include/linux/blkdev.h         |  10 ++-
 include/linux/device-mapper.h  |   3 +-
 13 files changed, 172 insertions(+), 89 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
