Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8461EBA1F
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 13:10:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591096250;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Dk14v2/BeLyn6waO3DfrS2sx5ZpmuyeQmq4WCKXEQK8=;
	b=YCsttTY0vfI6CnEh+uNMSgqrNxUwIo5YtWuRe4aYAadOzlcrABdUf26yw+j9IjmExTGVxb
	b3OkMTFzgydcG5UmOYWLcRMaZ51TX+/+p9O2ntOkFve02pwUKF9FWCmlo3g4gn8nzi1nid
	NnUg4DE7oKnAm5n7v4cWnmKL2PsUdLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-vxRBUAV1OYeCHV71rK-5cA-1; Tue, 02 Jun 2020 07:10:47 -0400
X-MC-Unique: vxRBUAV1OYeCHV71rK-5cA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D02B108BD1F;
	Tue,  2 Jun 2020 11:10:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E05D17F0B3;
	Tue,  2 Jun 2020 11:10:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A4AAE9701B;
	Tue,  2 Jun 2020 11:10:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052BADcV027509 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 07:10:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 80759100B191; Tue,  2 Jun 2020 11:10:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6D710EE799
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E86D91019CAA
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 11:10:08 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-210-VNw9kXlROHm2fug4_0qd_w-1;
	Tue, 02 Jun 2020 07:10:04 -0400
X-MC-Unique: VNw9kXlROHm2fug4_0qd_w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EAFF4AD66;
	Tue,  2 Jun 2020 11:10:04 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue,  2 Jun 2020 13:09:45 +0200
Message-Id: <20200602110956.121170-5-hare@suse.de>
In-Reply-To: <20200602110956.121170-1-hare@suse.de>
References: <20200602110956.121170-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 04/15] dm-zoned: add a 'reserved' zone flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of counting the number of reserved zones in dmz_free_zone()
we should mark the zone as 'reserved' during allocation and simplify
dmz_free_zone().

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 4 ++--
 drivers/md/dm-zoned.h          | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 043ed882970a..0982ab1758a6 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1743,6 +1743,7 @@ static int dmz_load_mapping(struct dmz_metadata *zmd)
 			atomic_inc(&zmd->unmap_nr_rnd);
 		} else if (atomic_read(&zmd->nr_reserved_seq_zones) < zmd->nr_reserved_seq) {
 			list_add_tail(&dzone->link, &zmd->reserved_seq_zones_list);
+			set_bit(DMZ_RESERVED, &dzone->flags);
 			atomic_inc(&zmd->nr_reserved_seq_zones);
 			zmd->nr_seq--;
 		} else {
@@ -2168,8 +2169,7 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone)
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
index 8083607b9535..3451b5a768b4 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -123,6 +123,7 @@ enum {
 	DMZ_META,
 	DMZ_DATA,
 	DMZ_BUF,
+	DMZ_RESERVED,
 
 	/* Zone internal state */
 	DMZ_RECLAIM,
@@ -140,6 +141,7 @@ enum {
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

