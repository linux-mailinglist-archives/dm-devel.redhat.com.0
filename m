Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0A791221B6F
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jul 2020 06:38:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-a7fdmJXpNxCEgll0PH0feA-1; Thu, 16 Jul 2020 00:38:51 -0400
X-MC-Unique: a7fdmJXpNxCEgll0PH0feA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14B418015F3;
	Thu, 16 Jul 2020 04:38:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E95665D9DC;
	Thu, 16 Jul 2020 04:38:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C73481809554;
	Thu, 16 Jul 2020 04:38:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06G4cQ8u010360 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jul 2020 00:38:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1D413208DD82; Thu, 16 Jul 2020 04:38:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14D03208DD89
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF928800399
	for <dm-devel@redhat.com>; Thu, 16 Jul 2020 04:38:23 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-317-5BmO1vJZMm--oGsbEdxJEQ-2; Thu, 16 Jul 2020 00:38:21 -0400
X-MC-Unique: 5BmO1vJZMm--oGsbEdxJEQ-2
IronPort-SDR: quL3OuvRrTaeSySxGIFYJPm6UeRir3w+Q3+2KXb+Ai6RcghYClLdVJ7khzU5BxYheNHwAzr5tB
	nX6samurBdCaBsutYVHwfYG1y6B3lFGXN/R+EIuhnH5GTPmXr4V7g1SYYMPHZ/2vivC1qQcplu
	E6obeRP7JOznI9cutIMvILCG6mHak94QAzS5AUoK4gLj5nJ3fBzS59olwXnzZ34YWz4lL8oL+j
	fYUMNGQvPdWxuuNEAmfHZWTFKpwwk+38pgyAH4mHvf9N3S2s2Oq+IdFKtIUWgFSox8fTXsBc1f
	3fw=
X-IronPort-AV: E=Sophos;i="5.75,358,1589212800"; d="scan'208";a="142711058"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 16 Jul 2020 12:38:20 +0800
IronPort-SDR: sx1r1QZkNd1AyhSZruup8yAvIADh1CLa5lZs0VWqPSilrgNc54u65GXcoif4EyyrYS1Wri2BMk
	pfl2DXYDXwpDM4IlLXxttyyhMSh2asy/o=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 21:26:45 -0700
IronPort-SDR: i5bOr8TPHJNrmuTJAvC3v/FPhHyFEIb4URwJ+8rTpNwD+s7HI7yvp4Bhmk8vazWDYTn9Io0j/E
	ENYSEDm5rOMg==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 21:38:20 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 16 Jul 2020 13:38:15 +0900
Message-Id: <20200716043815.605448-5-damien.lemoal@wdc.com>
In-Reply-To: <20200716043815.605448-1-damien.lemoal@wdc.com>
References: <20200716043815.605448-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 4/4] dm init: Set file local variable static
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Declare dm_allowed_targets as static to avoid the warning:

drivers/md/dm-init.c:39:12: warning: symbol 'dm_allowed_targets' was
not declared. Should it be static?

when compiling with C=1.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index b869316d3722..b0c45c6ebe0b 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -36,7 +36,7 @@ struct dm_device {
 	struct list_head list;
 };
 
-const char * const dm_allowed_targets[] __initconst = {
+static const char * const dm_allowed_targets[] __initconst = {
 	"crypt",
 	"delay",
 	"linear",
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

