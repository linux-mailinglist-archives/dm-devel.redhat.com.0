Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 60D452008E3
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:40:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570403;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l5rbNer6TptGaTf16FZhhrs7NBLbv0fl1VXT3gAyyVQ=;
	b=gknZiuO2SIU4/tPY5Xr8qpsUMJgezMCeyw0Z0o+l+qQ+uLitrGwD9FoHdnzZ9eL74/NbSU
	IF4H7hFzMZXfcLxoh9U0KZo2anjqpHTY772+RQ/VlvMjt+2ce4qJ4mOhNFYvrHGNiNxBzH
	hieAwktY9rOrAdn6L8E35xY62bdKKfs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-PIgQCoU2Nfu4oER_5m3Rnw-1; Fri, 19 Jun 2020 08:39:25 -0400
X-MC-Unique: PIgQCoU2Nfu4oER_5m3Rnw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98A2F8035D7;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 712D51002388;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2E7AA1809561;
	Fri, 19 Jun 2020 12:39:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05J70x1M014932 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 03:00:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F09542157F23; Fri, 19 Jun 2020 07:00:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC2FD2166B27
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F05A858EE2
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 07:00:53 +0000 (UTC)
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-1-SHlXO5ElMZiVGIJjFGELyg-1; Fri, 19 Jun 2020 03:00:48 -0400
X-MC-Unique: SHlXO5ElMZiVGIJjFGELyg-1
IronPort-SDR: n1/Xiug9MiwF4QcHCtqu+L7j12jKul+gqp71GOHUE8/w8AakeRHM3VFrZzJneRdmL9hF3tTQ30
	tslb1cwmOBdxdTjJyVuJAySU3hhpsde5QLn2akflVg7FnnBPxpeTJjJ/wTiEBlWLEc7QVqgKHA
	zaun/Ygvj4zTlTUoIQ8w54mf92F/nH8Rrws6yJLWrmiwQCuG+1ngHSCONbtuqx4Xu+BorVnJ+p
	ffILxVcHVG32A6ZWy3BRjEQrfB5hwP8bJ/7GARYAddtq5NvC0UEwsvKFOUu5nTbUhDNDfd6l+8
	rRg=
X-IronPort-AV: E=Sophos;i="5.75,254,1589212800"; d="scan'208";a="140655411"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
	([199.255.45.15])
	by ob1.hgst.iphmx.com with ESMTP; 19 Jun 2020 14:59:37 +0800
IronPort-SDR: mrg4TEupsTLl7lp7U7uLU71SaybhOUczbkygLnpIKvEZgbDQGDwpNHsOvyYoaFeWqo2zSl0H2n
	lnFAK/0xeTFiPXzHhHcKbabJ7PXEBiJI4=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	18 Jun 2020 23:48:15 -0700
IronPort-SDR: u9Kv7E5QQyn81KViuTNae0YHX8OB5WFteqds4KJ20uGT18MTcG0vVXBqTzpxKdWm3w6lFrM5dR
	EykqgG4lWh6g==
WDCIronportException: Internal
Received: from unknown (HELO redsun60.ssa.fujisawa.hgst.com) ([10.149.66.36])
	by uls-op-cesaip01.wdc.com with ESMTP; 18 Jun 2020 23:59:36 -0700
From: Johannes Thumshirn <johannes.thumshirn@wdc.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 19 Jun 2020 15:59:05 +0900
Message-Id: <20200619065905.22228-3-johannes.thumshirn@wdc.com>
In-Reply-To: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
References: <20200619065905.22228-1-johannes.thumshirn@wdc.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: linux-block@vger.kernel.org, Naohiro Aota <Naohiro.Aota@wdc.com>,
	dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>
Subject: [dm-devel] [RFC PATCH 2/2] dm: don't try to split
	REQ_OP_ZONE_APPEND bios
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

REQ_OP_ZONE_APPEND bios cannot be split so return EIO if we can't fit it
into one IO.

Signed-off-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>
---
 drivers/md/dm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index 058c34abe9d1..c720a7e3269a 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -1609,6 +1609,9 @@ static int __split_and_process_non_flush(struct clone_info *ci)
 
 	len = min_t(sector_t, max_io_len(ci->sector, ti), ci->sector_count);
 
+	if (bio_op(ci->bio) == REQ_OP_ZONE_APPEND && len < ci->sector_count)
+		return -EIO;
+
 	r = __clone_and_map_data_bio(ci, ti, ci->sector, &len);
 	if (r < 0)
 		return r;
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

