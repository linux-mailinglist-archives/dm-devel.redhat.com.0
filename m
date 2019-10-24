Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2C798E2A99
	for <lists+dm-devel@lfdr.de>; Thu, 24 Oct 2019 08:51:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571899882;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Gxe01NyXRbo6KIKM5/PsV6q3BDHrK/Kd/v0LmaTcFo=;
	b=X2RdRm3dE2wfhz0DqYTlV/FTWkoJZll932nn14OCmBRHLKqj8KG83tZzw5izvbFzNe9d39
	Hqy344eVCWyGuz9Xea8X7ybYa1FTSu9zjzwa2K8tGCv/Xu+u4StIYKoNRpI4UtJbrCzX6y
	6oCwSSqTFwqkso72ESr0UnuFKXg5f9Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-u3bWivMPMamjv6LgtM1Aqw-1; Thu, 24 Oct 2019 02:51:20 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 932AC80183E;
	Thu, 24 Oct 2019 06:51:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 31A321001DE4;
	Thu, 24 Oct 2019 06:51:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2577B18005A0;
	Thu, 24 Oct 2019 06:50:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9O6oiBf013528 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 02:50:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 400B25C219; Thu, 24 Oct 2019 06:50:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A12B55C1B5;
	Thu, 24 Oct 2019 06:50:38 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E411C3082135;
	Thu, 24 Oct 2019 06:50:16 +0000 (UTC)
IronPort-SDR: Q2p/y3m5PskSQC8eCKoXkHW87hj9c7pproKud8qLnZOVTVBT+HaDyH4FFMhqMPG8n2ods4f/50
	Vibwpu/7O53ZKISx/fKf07HQyiPyO2DLuZvAsyYcS6tGciYvRpPDnhpdKW8hgc0e8+914nE7wu
	KJ32LEfmNUkClzh4BlH/cFf2+qkCbWvwa5tHs9kiCBTTAodObh9J6GTPt10BRvUMrLauVmL8na
	nts9dmVMxV6G/yTNzmofrS3zLePIrQCiPU32dY5Hbz+ncCHdV9ddw3rPSfg7qZ8dK403+rSMP7
	V8E=
X-IronPort-AV: E=Sophos;i="5.68,223,1569254400"; d="scan'208";a="121990222"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 24 Oct 2019 14:50:08 +0800
IronPort-SDR: DjmvvndtcNNcb7WQ3Jf7Jfwsepf87/sMCd0OhvW08fJ+1SFIYJ1HmJ79Tn/gDB209cl5iBPP/8
	x/IxCg2vdPuDHY2ZPF2QosaSahh+axwcm5yr0Wetc5X0qHX/sFVQmeawkIZS1ydQMu3zGynfMY
	01414XwPm43MgONIKiP//8xVT1s74EN6JShREVAZVnF77OmwD4XuszTSEo0Pp8MAINeiKey2Ry
	Wg3HWOOGceak+MOlCQCFNSsHyFhQypUwz+oBgyFpb0vFkmmlW0bEhT/1Nli2xZ0JBkHkr1KGr9
	K5K0eIrkuSUn6/sJiA7NkTxN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	23 Oct 2019 23:45:42 -0700
IronPort-SDR: z+VWTacWY9yax5Jn5lpu1A8gHjm/99wY+Sk0dn57pCL3QsHFOlw07IHg2JZUABdXbKCTLR5QwW
	RoMIF3BsW1KSaICNuicq9HByueB0FWp+SbzoDcI8lJxXvmN8b982rEOrdXHkqIQwXICd3sl/y6
	CUwJIhD8OjEoSFA1q/p/HmKTc2LL/UJEPOAWY32lo5ojX0DIZH6DkW4L4CX5tS0QNW1Bd8h51o
	fQBoC8POs7d/5QyKw5GINoxaVUcdGMQxe1YSBSEJdKeFZZi9bag604ZwRhm4wuf01AUMRa9i5Y
	qZk=
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 23 Oct 2019 23:50:08 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
	linux-scsi@vger.kernel.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 15:50:02 +0900
Message-Id: <20191024065006.8684-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Thu, 24 Oct 2019 06:50:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 24 Oct 2019 06:50:29 +0000 (UTC) for IP:'216.71.153.144'
	DOMAIN:'esa5.hgst.iphmx.com' HELO:'esa5.hgst.iphmx.com'
	FROM:'damien.lemoal@wdc.com' RCPT:''
X-RedHat-Spam-Score: -2.399  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE) 216.71.153.144 esa5.hgst.iphmx.com 216.71.153.144
	esa5.hgst.iphmx.com <prvs=193aaee55=damien.lemoal@wdc.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 0/4] zoned block device report zones enhancements
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: u3bWivMPMamjv6LgtM1Aqw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series of patches improve the handling and execution of report
zones operations for zoned block devices.

The first patch enhances device revalidation by moving zone information
checks from the low level driver into the block layer. The second patch
remove some unnecessary code. The last two patches introduce generic
allocation of report zones command buffer, further enhancing zoned disk
revalidation.

As always, comments are welcome.

Damien Le Moal (4):
  block: Enhance blk_revalidate_disk_zones()
  block: Simplify report zones execution
  block: Introduce report zones queue limits
  block: Generically handle report zones buffer

 block/blk-settings.c           |   3 +
 block/blk-zoned.c              | 178 +++++++++++++++++----------
 drivers/block/null_blk.h       |   6 +-
 drivers/block/null_blk_zoned.c |   3 +-
 drivers/md/dm.c                |   9 +-
 drivers/scsi/sd.h              |   3 +-
 drivers/scsi/sd_zbc.c          | 212 +++++++++------------------------
 include/linux/blkdev.h         |  12 +-
 8 files changed, 193 insertions(+), 233 deletions(-)

-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

