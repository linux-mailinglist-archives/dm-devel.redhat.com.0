Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8F6A9220944
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-OWZo2LbxNnO84qKrlXqtKg-1; Wed, 15 Jul 2020 05:52:51 -0400
X-MC-Unique: OWZo2LbxNnO84qKrlXqtKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B992A1DF0;
	Wed, 15 Jul 2020 09:52:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95033100164C;
	Wed, 15 Jul 2020 09:52:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 517911809554;
	Wed, 15 Jul 2020 09:52:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qT40007914 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 39E77215670A; Wed, 15 Jul 2020 09:52:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32B1C2156A59
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D80E18007A4
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:24 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-t8GbYQHiN-ufHI-iw45rpQ-1; Wed, 15 Jul 2020 05:52:19 -0400
X-MC-Unique: t8GbYQHiN-ufHI-iw45rpQ-1
IronPort-SDR: 03ScPBGEcr7LkAtbAhzjfw66TGeX1xIw9Vy7fTm1uFwCdtMdGjvFRbFNdC770sQ0/2vnvfaGB2
	cMj5wbHTLjFNahYqueFUD4M92KIJJvmk/BFUsV7U5ECTJm2pps4/YReNefVLbDmDjEDeouiTHi
	cnJppe1IWAXBPAK6RMrJ1ap0yP+tp6ojbiL8nagMTJRfzMMo1m2QGzrf2dYBL9JP8qjYlU9M52
	WMoMMseOh26GUsKXJ6ddPeaMYngnFbBAdLXclmtMMLFakrF/aTcfwwKoBIasfzH1iD/8y0mj8N
	CAU=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769658"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:18 +0800
IronPort-SDR: mYbHIeZ0c4dC7Gt1RiG/rt2TG82uxRpsAV+5IZ4NkaFR3Y6ifv+kb0eLabfYpHVcYMhzZj1/KF
	oBGRReUjOpR7gawrHcjGCFJRw0iRS0iLo=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:11 -0700
IronPort-SDR: 0qCzDDd8Z1j/iYYhWbUi+TlWi59Zmz0RMo4C1vHl4zW7yJAj/NIxjkSIzp/ejwbkO1sH/VdWat
	fYxL78RyH8Lw==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:18 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:09 +0900
Message-Id: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 0/8] Various cleanups
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

These patches fix various compilation warnings showing up when compiling
with W=1. The last patch addresses a static checker warning (C=1
compilation). There are a lot more of these code checker warnings
remaining that probably could be addressed, some seem to be false
positive though.

Damien Le Moal (8):
  dm raid5: Remove set but unused variable
  dm raid5: Fix compilation warning
  md: Fix compilation warning
  dm raid10: Fix compilation warning
  dm verity: Fix compilation warning
  dm raid: Remove empty if statement
  dm ioctl: Fix compilation warning
  dm init: Set file local variable static

 drivers/md/dm-init.c              |  2 +-
 drivers/md/dm-ioctl.c             |  2 +-
 drivers/md/dm-raid.c              |  2 --
 drivers/md/dm-verity-verify-sig.h | 14 +++++++-------
 drivers/md/md.c                   | 12 ++++++------
 drivers/md/raid10.c               |  4 ++--
 drivers/md/raid5-cache.c          |  4 +---
 drivers/md/raid5.c                | 12 ++++++------
 8 files changed, 24 insertions(+), 28 deletions(-)

-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

