Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 905C5221B72
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 06:38:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-QfIWQsX5NQCoClRwwY-AfA-1; Thu, 16 Jul 2020 00:38:53 -0400
X-MC-Unique: QfIWQsX5NQCoClRwwY-AfA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B5C800597;
	Thu, 16 Jul 2020 04:38:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A54121002391;
	Thu, 16 Jul 2020 04:38:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64C9296231;
	Thu, 16 Jul 2020 04:38:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G4cRDG010388 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 00:38:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B57922157F23; Thu, 16 Jul 2020 04:38:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B00AD2157F25
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91F0F924906
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:23 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-477-vpP293yEPviQKJpbi6bZhQ-1; Thu, 16 Jul 2020 00:38:18 -0400
X-MC-Unique: vpP293yEPviQKJpbi6bZhQ-1
IronPort-SDR: TIM4L7ptwPU+bftFmRT17JOLQICePTyK1orB8eVvEp6SF/5Ch2YEmG7y/JRz7IJbUqD4rTBtHH
	ULmxj0ofMFB3NPHdGVQuI79aMDsY9xAGoPGncx4w3fA+Qj3odQhbA6o0KnvlbfJDbnNjhprA8q
	lGyntAk711etfy8a+V+49En8gTP/O71tQRBJ41l+l6peeQ2inp+bEPoKWVozAJUmXjEr7WYdpn
	zUmGff1BFWjFVizfnbxdSm3VXwVBgf0miRNjQvT3Qld6Z4A3F722oI3Qb2ztWmPgR5J643tSAb
	UlI=
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; d="scan'208";a="142711048"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 12:38:17 +0800
IronPort-SDR: qaL8LtxyG/Lyf/pIGf/g8AZ+V7VyXSMU/b3b7Xc1UlHBUstIpmRbIz7OcBQCWqhD5yR3yrqoY0
	+HcUj0IYR2VobuwRlhnKeCpU0z1zPBzSI=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 21:26:41 -0700
IronPort-SDR: f5jE/HtceNIseobFt8Af4inq5HO8dF8eD6d4kUyp2RY+aMCal8AJAkbwGaqhhPsuWVhAemPazL
	9vuWAGciV/Eg==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 21:38:16 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 16 Jul 2020 13:38:11 +0900
Message-Id: <20200716043815.605448-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 0/4 v2] Various cleanups
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike,

These patches fix various compilation warnings showing up when
compiling with W=1. The last patch addresses a static checker warning
(C=1 compilation). There are a lot more of these code checker warnings
remaining that probably could be addressed, some seem to be false
positive though.

Damien Le Moal (4):
  dm verity: Fix compilation warning
  dm raid: Remove empty if statement
  dm ioctl: Fix compilation warning
  dm init: Set file local variable static

 drivers/md/dm-init.c              |  2 +-
 drivers/md/dm-ioctl.c             |  2 +-
 drivers/md/dm-raid.c              |  2 --
 drivers/md/dm-verity-verify-sig.h | 14 +++++++-------
 4 files changed, 9 insertions(+), 11 deletions(-)

Changes from v1:
* Removed md patches to route them through linux-raid

-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

