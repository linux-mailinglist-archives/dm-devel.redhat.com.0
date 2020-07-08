Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5732D217C28
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jul 2020 02:21:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-7A8_DFOKPkKBW0xfwL2Z_Q-1; Tue, 07 Jul 2020 20:21:53 -0400
X-MC-Unique: 7A8_DFOKPkKBW0xfwL2Z_Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1622C8015CE;
	Wed,  8 Jul 2020 00:21:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB12660E1C;
	Wed,  8 Jul 2020 00:21:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 02E2F1809554;
	Wed,  8 Jul 2020 00:21:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0680LX61030878 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jul 2020 20:21:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7CF7B100321E; Wed,  8 Jul 2020 00:21:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7880B10062AC
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C4A0100CF84
	for <dm-devel@redhat.com>; Wed,  8 Jul 2020 00:21:31 +0000 (UTC)
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-189-z-URBoC6P0yZ-Cq8VUFCzA-1; Tue, 07 Jul 2020 20:21:29 -0400
X-MC-Unique: z-URBoC6P0yZ-Cq8VUFCzA-1
IronPort-SDR: WtoxiYV5AyYR5t7O9U3H7tGLGPU3OvNErl+HUP6BWIywF6NWZY46u2+/E5K06HXMrKUZED+6yV
	Ci40ASi6/Uh1AJnpmaTxTj+Iz1Xta02HX1s7rC7yrytIFZcPNOCZFZ00GA44kUo1L4zQmn1M6o
	+xuHW9NPEt476Jokupy1TZ1Cv+q9lLQt26kb5kiIvvx4Wcv3RPz5WDv1MuIrxSieOd1jUq5PQz
	D2Rdr6cDg0ps7DXD7id2/8KWkqfsC2K46SpJbvjhC7Wde8lWQH3mC0wm6cmwCfKZbGB+p74fYI
	9nU=
X-IronPort-AV: E=Sophos;i="5.75,325,1589212800"; d="scan'208";a="146187469"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 08 Jul 2020 08:20:25 +0800
IronPort-SDR: 2IkKwTTmuYdIuOK1yC5Pr6gkjtQMsYOmWO2tO2zykPgLlgnJ1ApxgtnV3ZopYKpJ0DyLewrPro
	jwYuey0RJ1udjQA/q/DYQfNOfC5fvgiMM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	07 Jul 2020 17:08:31 -0700
IronPort-SDR: aidb53C0QOEnKxF2QkTsyKzGVKg8pIkn65BvjXj4+SpVNSwo4u4zDw5l2UQz5BxDUBuPzBiDhd
	MLYWHBNH2j0Q==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 07 Jul 2020 17:20:24 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed,  8 Jul 2020 09:20:21 +0900
Message-Id: <20200708002023.738147-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 0/2] dm zoned fixes for 5.8
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Mike,

A couple of fixes for dm-zoned for this cycle. The first patch fixes
a possible hang under intensive write workload with a setup that has a
very limited number of cache zones. The second patch fixes some
compilation warnings showing when compiling with W=1.

Damien Le Moal (2):
  dm zoned: Fix zone reclaim trigger
  dm zoned: Remove set but unused variables

 drivers/md/dm-zoned-metadata.c |  9 ++++++++-
 drivers/md/dm-zoned-reclaim.c  |  7 +++----
 drivers/md/dm-zoned-target.c   | 10 +---------
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

