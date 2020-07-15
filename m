Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0B05A220940
	for <lists+dm-devel@lfdr.de>; Wed, 15 Jul 2020 11:52:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-HdPfmqemO_SNBgUMafAtbw-1; Wed, 15 Jul 2020 05:52:46 -0400
X-MC-Unique: HdPfmqemO_SNBgUMafAtbw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02C7F18A1DE6;
	Wed, 15 Jul 2020 09:52:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A73A4100164C;
	Wed, 15 Jul 2020 09:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D35A894EFE;
	Wed, 15 Jul 2020 09:52:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06F9qQ1S007871 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jul 2020 05:52:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 77A5910EE834; Wed, 15 Jul 2020 09:52:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7250710EE828
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7961858EE4
	for <dm-devel@redhat.com>; Wed, 15 Jul 2020 09:52:25 +0000 (UTC)
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-265-vDb29g4wPReVuxVXsJkclw-2; Wed, 15 Jul 2020 05:52:21 -0400
X-MC-Unique: vDb29g4wPReVuxVXsJkclw-2
IronPort-SDR: 0ZDC6YFGE92VW62tpTNMyLI9+jow2dhexZ4ab7TpzMvtTcdWIrY6Hhi1WfU5cJkwYy3vQbay6J
	HeVbcr06Ddn/za7dzV+qcLKkxZON0QVM+qH+YI96Kl4oYGHiKhgj3BZ4YVlFdrAQkUcphmD/9l
	v0SG7iAIgigff4Y7Ex5f+vJE7LhR3bW7ef1seZMxZciBGDikQ/+nV+p/+hLQcIj8N6NFeAYaEY
	6vEmBuiVdvjXwF23OGNMzZM7szikqmIC8WVLeUhHX0IgZJTyVas+AE1v8bwkxysVn4y1MEJjDG
	gi0=
X-IronPort-AV: E=Sophos;i="5.75,354,1589212800"; d="scan'208";a="251769660"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2020 17:52:19 +0800
IronPort-SDR: 0rpbHHittprl8h9OeI9fa5zZM5sHAtEk9sBIE3y/1qQScZjP9rrRKzVQ6zBg7c2VDx56G7+x3I
	Zd1FKgkwIwceixlxyxKkbwaIwUPYg9m8Y=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	15 Jul 2020 02:40:12 -0700
IronPort-SDR: jZlY0uTvoA2vBg06Q51dzBkmS9dNZBseiXw66hY2LJ3tN+nQEqaaKUt+CqrgaG5DIWADcwCh0h
	5l/HTvx6j8rA==
WDCIronportException: Internal
Received: from washi.fujisawa.hgst.com ([10.149.53.254])
	by uls-op-cesaip01.wdc.com with ESMTP; 15 Jul 2020 02:52:18 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 15 Jul 2020 18:52:10 +0900
Message-Id: <20200715095217.441885-2-damien.lemoal@wdc.com>
In-Reply-To: <20200715095217.441885-1-damien.lemoal@wdc.com>
References: <20200715095217.441885-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <damien.lemoal@wdc.com>
Subject: [dm-devel] [PATCH 1/8] dm raid5: Remove set but unused variable
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

Remove the variable offset in r5c_tree_index() to avoid a "set but not
used" compilation warning when compiling with W=1.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/raid5-cache.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/md/raid5-cache.c b/drivers/md/raid5-cache.c
index 9b6da759dca2..eea14fa9e59b 100644
--- a/drivers/md/raid5-cache.c
+++ b/drivers/md/raid5-cache.c
@@ -195,9 +195,7 @@ struct r5l_log {
 static inline sector_t r5c_tree_index(struct r5conf *conf,
 				      sector_t sect)
 {
-	sector_t offset;
-
-	offset = sector_div(sect, conf->chunk_sectors);
+	sector_div(sect, conf->chunk_sectors);
 	return sect;
 }
 
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

