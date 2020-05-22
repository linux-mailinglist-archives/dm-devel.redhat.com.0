Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id CC9341DEC3F
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162016;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LNa9DfXZCB54u11tJShT+u0ZxiidvBI6SUsNDwfQvGQ=;
	b=IxiR58PGR4wZvo/fqsKLEpe8t+la0B6zpfKVa3yFzsHq/HAvyXP89QeDNkXAyB0+hNofnL
	HyCFs2JvT0lMDXa4bmc+aDcoTd1jr1MJ5ev4E/BsA0W6ERNEUrIivzAvWE8xpD+3osShim
	sGo9nT9fpohoikQp+sMfZJwRgEOBelk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-upGZSwQkMV6as1GGbRwSGQ-1; Fri, 22 May 2020 11:40:11 -0400
X-MC-Unique: upGZSwQkMV6as1GGbRwSGQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82F4109F1D1;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 833725C1D6;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4029E54D0D;
	Fri, 22 May 2020 15:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdNk4012695 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6A30D2026FFE; Fri, 22 May 2020 15:39:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66C932029F61
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52D2886BCD4
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:23 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-210-NVnWKa12NZqvm2BxsTy1qw-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: NVnWKa12NZqvm2BxsTy1qw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C701FB22B;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:39:00 +0200
Message-Id: <20200522153901.133375-12-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 11/12] dm-zoned: round-robin load balancer for
	reclaiming zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When reclaiming zones we should arbitrate between the zoned
devices to get a better throughput. So implement a simple
round-robin load balancer between the zoned devices.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 87784e7785bc..25dcad2a565f 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -171,6 +171,8 @@ struct dmz_metadata {
 	unsigned int		nr_reserved_seq;
 	unsigned int		nr_chunks;
 
+	unsigned int		last_alloc_idx;
+
 	/* Zone information array */
 	struct xarray		zones;
 
@@ -2178,7 +2180,7 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 {
 	struct list_head *list;
 	struct dm_zone *zone;
-	unsigned int dev_idx = 0;
+	unsigned int dev_idx = zmd->last_alloc_idx;
 
 again:
 	if (flags & DMZ_ALLOC_CACHE)
@@ -2214,6 +2216,9 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 	zone = list_first_entry(list, struct dm_zone, link);
 	list_del_init(&zone->link);
 
+	if (!(flags & DMZ_ALLOC_CACHE))
+		zmd->last_alloc_idx = (dev_idx + 1) % zmd->nr_devs;
+
 	if (dmz_is_cache(zone))
 		atomic_dec(&zmd->unmap_nr_cache);
 	else if (dmz_is_rnd(zone))
@@ -2839,6 +2844,7 @@ int dmz_ctr_metadata(struct dmz_dev *dev, int num_dev,
 	zmd->dev = dev;
 	zmd->nr_devs = num_dev;
 	zmd->mblk_rbtree = RB_ROOT;
+	zmd->last_alloc_idx = 0;
 	init_rwsem(&zmd->mblk_sem);
 	mutex_init(&zmd->mblk_flush_lock);
 	spin_lock_init(&zmd->mblk_lock);
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

