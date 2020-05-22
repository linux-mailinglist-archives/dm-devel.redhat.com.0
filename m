Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7D41DEC3B
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 17:40:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590162010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TqOe9sxoEfMqbNo/mx9EGd9+3THuRJbgNsiPuhW1aMk=;
	b=HSkCD65LBZWSsMhXB5o9ik8RYQA/Shnpbj2pQP3kWOHMQ98p+6ms2+r4TPkgYenKRtKqeg
	w/S+0nfbeu7TVsvrKlD9ukoOFwxAXa06A8CuJAU1EMOsyqAoQgcvPS92OEu262a2pN/+4Q
	w6u7g24LBS8oS7M8cSu92DGqzF5WGwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-3TystIxyNpSZVKVcix_6LA-1; Fri, 22 May 2020 11:40:06 -0400
X-MC-Unique: 3TystIxyNpSZVKVcix_6LA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E4CB08CC410;
	Fri, 22 May 2020 15:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEE2560E1C;
	Fri, 22 May 2020 15:39:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58E4B1809547;
	Fri, 22 May 2020 15:39:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04MFdJ5r012637 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 11:39:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 16747200AFEA; Fri, 22 May 2020 15:39:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 126EA2026FFE
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E551D18E0AC5
	for <dm-devel@redhat.com>; Fri, 22 May 2020 15:39:15 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-272--Lw4pzBdPXGXOE2W_mAcfQ-1;
	Fri, 22 May 2020 11:39:13 -0400
X-MC-Unique: -Lw4pzBdPXGXOE2W_mAcfQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C4422B20F;
	Fri, 22 May 2020 15:39:12 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Fri, 22 May 2020 17:38:56 +0200
Message-Id: <20200522153901.133375-8-hare@suse.de>
In-Reply-To: <20200522153901.133375-1-hare@suse.de>
References: <20200522153901.133375-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 07/12] dm-zoned: add a 'reserved' zone flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of counting the number of reserved zones in dmz_free_zone()
we should mark the zone as 'reserved' during allocation and simplify
dmz_free_zone().

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 drivers/md/dm-zoned.h          | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 73479b4c8bca..1b9da698a812 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1783,6 +1783,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 			atomic_inc(&zmd->unmap_nr_rnd);
 		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
 			list_add_tail(&dzone->link, &zmd->reserved_seq_zones_list);
+			set_bit(DMZ_RESERVED, &dzone->flags);
 			atomic_inc(&zmd->nr_reserved_seq_zones);
 			zmd->nr_seq--;
 		} else {
@@ -2210,8 +2211,7 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
 	} else if (dmz_is_rnd(zone)) {
 		list_add_tail(&zone->link, &zmd->unmap_rnd_list);
 		atomic_inc(&zmd->unmap_nr_rnd);
-	} else if (atomic_read(&zmd->nr_reserved_seq_zones) <
-		   zmd->nr_reserved_seq) {
+	} else if (dmz_is_reserved(zone)) {
 		list_add_tail(&zone->link, &zmd->reserved_seq_zones_list);
 		atomic_inc(&zmd->nr_reserved_seq_zones);
 	} else {
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index dab701893b67..983f5b5e9fa0 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -130,6 +130,7 @@ enum {
 	DMZ_META,
 	DMZ_DATA,
 	DMZ_BUF,
+	DMZ_RESERVED,
 
 	/* Zone internal state */
 	DMZ_RECLAIM,
@@ -147,6 +148,7 @@ enum {
 #define dmz_is_offline(z)	test_bit(DMZ_OFFLINE, &(z)->flags)
 #define dmz_is_readonly(z)	test_bit(DMZ_READ_ONLY, &(z)->flags)
 #define dmz_in_reclaim(z)	test_bit(DMZ_RECLAIM, &(z)->flags)
+#define dmz_is_reserved(z)	test_bit(DMZ_RESERVED, &(z)->flags)
 #define dmz_seq_write_err(z)	test_bit(DMZ_SEQ_WRITE_ERR, &(z)->flags)
 #define dmz_reclaim_should_terminate(z) \
 				test_bit(DMZ_RECLAIM_TERMINATE, &(z)->flags)
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

