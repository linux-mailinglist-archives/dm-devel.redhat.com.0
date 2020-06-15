Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id AECBE1F8CA1
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 05:43:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592192622;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AzpMnHMe6jm+akZvMwqJSvqMQ8iC/J78LYlqs2f2NbI=;
	b=NClUFDh6TooJZW5mC7CqZYaVsD+hCkPUwM20BpVQlegLGsZplJEWmAEvp7DNbxoHuXY9wI
	4bimeChAWP60D6eWa6I85e50YLwl5D+dtfv0SgXP1l88xpJbrWGP3jP5XQ7163AkEykLhf
	z6PZOz+oF1kjkds/XE9eILCDDPJGsRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-GhbVMba6OEyMZsc2r4CRMQ-1; Sun, 14 Jun 2020 23:43:40 -0400
X-MC-Unique: GhbVMba6OEyMZsc2r4CRMQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 553EE800053;
	Mon, 15 Jun 2020 03:43:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B237F19C66;
	Mon, 15 Jun 2020 03:43:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 976CF1809547;
	Mon, 15 Jun 2020 03:43:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05F3gvJ7010654 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 14 Jun 2020 23:42:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8D308110F3A8; Mon, 15 Jun 2020 03:42:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 89319110F3A7
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 03:42:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 894AE811E77
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 03:42:54 +0000 (UTC)
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-353-Tam4Spd7NAiCU0gSeeBZqA-1; Sun, 14 Jun 2020 23:42:51 -0400
X-MC-Unique: Tam4Spd7NAiCU0gSeeBZqA-1
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id EDE3D384DC8E028CB08C;
	Mon, 15 Jun 2020 11:26:20 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
	(10.3.19.209) with Microsoft SMTP Server id 14.3.487.0; Mon, 15 Jun 2020
	11:26:18 +0800
From: Hou Tao <houtao1@huawei.com>
To: <dm-devel@redhat.com>
Date: Mon, 15 Jun 2020 11:33:23 +0800
Message-ID: <20200615033323.146312-1-houtao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05F3gvJ7010654
X-loop: dm-devel@redhat.com
Cc: Bart Van Assche <bvanassche@acm.org>,
	Damien Le Moal <damien.lemoal@wdc.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>, Hannes Reinecke <hare@suse.com>
Subject: [dm-devel] [PATCH] dm zoned: assign max_io_len correctly
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The unit of max_io_len is sector instead of byte (spotted through
code review), so fix it.

Fixes: 3b1a94c88b79 ("dm zoned: drive-managed zoned block device target")
Signed-off-by: Hou Tao <houtao1@huawei.com>
---
 drivers/md/dm-zoned-target.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index a907a9446c0b..cf915009c306 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -890,7 +890,7 @@ static int dmz_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	}
 
 	/* Set target (no write same support) */
-	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata) << 9;
+	ti->max_io_len = dmz_zone_nr_sectors(dmz->metadata);
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_write_zeroes_bios = 1;
-- 
2.25.0.4.g0ad7144999


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

