Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 30ACD1EBA19
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096245;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=898oiaI1Meqr5pkhIX5URcQhYPPzjZ6tYMQoQGen0BU=;
	b=J6QV9iD++9u5oKNPijdoeO7ftEo0PkjtwEfN3BHbtHQewN+vfLu+2z6f0zc7/4FT3dt05e
	zE8Edwt6srviJBgU/DHSu2Yvf0rEuERL3pi/+jRWI8eRUvGn0qQ22dA1oi9yE61Fnl5rCV
	pP3/wlIwN+sw1XKfuTb7Zw83Wyy0t9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-5HBrU-1yNPCpMAL283XoVA-1; Tue, 02 Jun 2020 07:10:41 -0400
X-MC-Unique: 5HBrU-1yNPCpMAL283XoVA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA585108BD16;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920421A912;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D0EC97018;
	Tue,  2 Jun 2020 11:10:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BAC9F027462 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CF42029F60; Tue,  2 Jun 2020 11:10:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D06B2026FFE
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A249D80CDB3
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:10 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-108-uJAVkbxmMJmQkL-JljjHNQ-1;
	Tue, 02 Jun 2020 07:10:06 -0400
X-MC-Unique: uJAVkbxmMJmQkL-JljjHNQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6CA05AEA8;
	Tue,  2 Jun 2020 11:10:05 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:56 +0200
Message-Id: <20200602110956.121170-16-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 15/15] dm-zoned: check superblock location
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When specifying several devices we need to check the superblock
location to ensure the devices are specified in the correct order.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index e01ca1c57ff2..bf54c5d90095 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -995,7 +995,7 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
 	struct dmz_dev *dev = dsb->dev;
 	unsigned int nr_meta_zones, nr_data_zones;
 	u32 crc, stored_crc;
-	u64 gen;
+	u64 gen, sb_block;
 
 	if (le32_to_cpu(sb->magic) != DMZ_MAGIC) {
 		dmz_dev_err(dev, "Invalid meta magic (needed 0x%08x, got 0x%08x)",
@@ -1024,6 +1024,14 @@ static int dmz_check_sb(struct dmz_metadata *zmd, struct dmz_sb *dsb,
 		return -ENXIO;
 	}
 
+	sb_block = le64_to_cpu(sb->sb_block);
+	if (sb_block != (u64)dsb->zone->id << zmd->zone_nr_blocks_shift ) {
+		dmz_dev_err(dev, "Invalid superblock position "
+			    "(is %llu expected %llu)",
+			    sb_block,
+			    (u64)dsb->zone->id << zmd->zone_nr_blocks_shift);
+		return -EINVAL;
+	}
 	if (zmd->sb_version > 1) {
 		uuid_t sb_uuid;
 
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

