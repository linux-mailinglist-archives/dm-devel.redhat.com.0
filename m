Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1747C1CA6C8
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:05:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588928704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AWu9GYy7Q6VjxPbX0oAnZpNlkjIl7eLftbKzjz5sjxA=;
	b=MZCvRgbAFnMMkK+fRjdJp5JFpK1FaAff6JXuAQ5aJlbsG5eM2N9YhtWetO3IjBcXPL2F1Y
	90NX/dCI6MLn8WZJWHjeV73MqrA+DYxjZv59bR7s61Za/ZR5+5odjqbVOV4LHJTXKUZ9Rk
	daXYi7XK9XIvS4KjXhlQ+zFdb2+smqk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-a8BfeU8JN2uMMTHOUFJS4A-1; Fri, 08 May 2020 05:04:30 -0400
X-MC-Unique: a8BfeU8JN2uMMTHOUFJS4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B89DBFCF;
	Fri,  8 May 2020 09:04:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1123A707CE;
	Fri,  8 May 2020 09:04:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A09501809554;
	Fri,  8 May 2020 09:04:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048944df000790 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:04:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EB60E11F4A8; Fri,  8 May 2020 09:04:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E803411F4A9
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1186811E77
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:04:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-212-k2-diHNvMKa-RuPnyCClJQ-1;
	Fri, 08 May 2020 05:03:58 -0400
X-MC-Unique: k2-diHNvMKa-RuPnyCClJQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9866DAE87;
	Fri,  8 May 2020 09:03:57 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri,  8 May 2020 11:03:30 +0200
Message-Id: <20200508090332.40716-13-hare@suse.de>
In-Reply-To: <20200508090332.40716-1-hare@suse.de>
References: <20200508090332.40716-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048944df000790
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 12/14] dm-zoned: Reduce logging output on startup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-zoned is becoming quite chatty during startup; reduce the noise
by moving some information to 'debug' level.

Suggested-by: Mike Snitzer <snitzer@redhat.com>
Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 77b9ea4bad74..80c0fe4c3546 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1279,8 +1279,8 @@ static int dmz_init_zones(struct dmz_metadata *zmd)
 	if (!zmd->zones)
 		return -ENOMEM;
 
-	DMINFO("(%s): Using %zu B for zone information",
-	       zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
+	DMDEBUG("(%s): Using %zu B for zone information",
+		zmd->devname, sizeof(struct dm_zone) * zmd->nr_zones);
 
 	/*
 	 * Get zone information and initialize zone descriptors.  At the same
@@ -2562,16 +2562,16 @@ int dmz_ctr_metadata(struct dmz_dev *dev, struct dmz_metadata **metadata,
 
 	dmz_zmd_info(zmd, "  %u zones of %llu 512-byte logical sectors",
 		     zmd->nr_zones, (u64)zmd->zone_nr_sectors);
-	dmz_zmd_info(zmd, "  %u metadata zones",
-		     zmd->nr_meta_zones * 2);
-	dmz_zmd_info(zmd, "  %u data zones for %u chunks",
-		     zmd->nr_data_zones, zmd->nr_chunks);
-	dmz_zmd_info(zmd, "    %u random zones (%u unmapped)",
-		     zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
-	dmz_zmd_info(zmd, "    %u sequential zones (%u unmapped)",
-		     zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
-	dmz_zmd_info(zmd, "  %u reserved sequential data zones",
-		     zmd->nr_reserved_seq);
+	dmz_zmd_debug(zmd, "  %u metadata zones",
+		      zmd->nr_meta_zones * 2);
+	dmz_zmd_debug(zmd, "  %u data zones for %u chunks",
+		      zmd->nr_data_zones, zmd->nr_chunks);
+	dmz_zmd_debug(zmd, "    %u random zones (%u unmapped)",
+		      zmd->nr_rnd, atomic_read(&zmd->unmap_nr_rnd));
+	dmz_zmd_debug(zmd, "    %u sequential zones (%u unmapped)",
+		      zmd->nr_seq, atomic_read(&zmd->unmap_nr_seq));
+	dmz_zmd_debug(zmd, "  %u reserved sequential data zones",
+		      zmd->nr_reserved_seq);
 	dmz_zmd_debug(zmd, "Format:");
 	dmz_zmd_debug(zmd, "%u metadata blocks per set (%u max cache)",
 		      zmd->nr_meta_blocks, zmd->max_nr_mblks);
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

