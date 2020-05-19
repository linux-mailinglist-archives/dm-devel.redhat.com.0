Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D9C0C1D91E1
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 10:15:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589876120;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xPAeY1xSogpy2LZRfYpZCSszKyw/tBtqUUnCS88ZAG4=;
	b=VPjqzvLzIi9SntJQNScxzOEgGREFN+sVe7O09IyhYChnoxK+ayq8HPSquL22pBSlCRiZsg
	qGl5e21e4FLnuuPH3HS4jkmibUfNBx2NmaA6LzQTl9ZC/Y74O8/ms6JjZI5lJtNjovGz6U
	TL+F6KZlE4TB0hnKWeHDsLMoz7L5WMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-7PjG68HgNweSAE65ayanJw-1; Tue, 19 May 2020 04:15:18 -0400
X-MC-Unique: 7PjG68HgNweSAE65ayanJw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0230E805721;
	Tue, 19 May 2020 08:15:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFE0910016EB;
	Tue, 19 May 2020 08:15:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8A43D4ED5B;
	Tue, 19 May 2020 08:15:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J8Em6a030941 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 04:14:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB10042ADD; Tue, 19 May 2020 08:14:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D57BD5AB8B
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4036C101A526
	for <dm-devel@redhat.com>; Tue, 19 May 2020 08:14:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-508-el1qJyjnM4arqDUxgzts8g-1;
	Tue, 19 May 2020 04:14:44 -0400
X-MC-Unique: el1qJyjnM4arqDUxgzts8g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id EC04DAB76;
	Tue, 19 May 2020 08:14:43 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 19 May 2020 10:14:23 +0200
Message-Id: <20200519081424.103318-6-hare@suse.de>
In-Reply-To: <20200519081424.103318-1-hare@suse.de>
References: <20200519081424.103318-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 5/6] dm-zoned: terminate reclaim on congestion
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When dmz_get_chunk_mapping() selects a zone which is under reclaim
we should terminating the reclaim copy process; as we're changing
the zone itself reclaim needs to run afterwards again anyway.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 2 ++
 drivers/md/dm-zoned-reclaim.c  | 6 ++++--
 drivers/md/dm-zoned.h          | 3 +++
 3 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index ee613ba2e8aa..857390030cac 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -1851,7 +1851,9 @@ static void dmz_wait_for_reclaim(struct dmz_metadata *zmd, struct dm_zone *zone)
 {
 	dmz_unlock_map(zmd);
 	dmz_unlock_metadata(zmd);
+	set_bit(DMZ_RECLAIM_TERMINATE, &zone->flags);
 	wait_on_bit_timeout(&zone->flags, DMZ_RECLAIM, TASK_UNINTERRUPTIBLE, HZ);
+	clear_bit(DMZ_RECLAIM_TERMINATE, &zone->flags);
 	dmz_lock_metadata(zmd);
 	dmz_lock_map(zmd);
 }
diff --git a/drivers/md/dm-zoned-reclaim.c b/drivers/md/dm-zoned-reclaim.c
index 1283405bec29..3ed88581dc48 100644
--- a/drivers/md/dm-zoned-reclaim.c
+++ b/drivers/md/dm-zoned-reclaim.c
@@ -143,6 +143,9 @@ static int dmz_reclaim_copy(struct dmz_reclaim *zrc,
 		if (dst_dev->flags & DMZ_BDEV_DYING)
 			return -EIO;
 
+		if (dmz_reclaim_should_terminate(src_zone))
+			return -EINTR;
+
 		/* Get a valid region from the source zone */
 		ret = dmz_first_valid_block(zmd, src_zone, &block);
 		if (ret <= 0)
@@ -517,7 +520,7 @@ static void dmz_reclaim_work(struct work_struct *work)
 		dmz_nr_rnd_zones(zmd));
 
 	ret = dmz_do_reclaim(zrc);
-	if (ret) {
+	if (ret && ret != -EINTR) {
 		DMDEBUG("(%s): Reclaim error %d",
 			dmz_metadata_label(zmd), ret);
 		if (!dmz_check_dev(zmd))
@@ -617,4 +620,3 @@ void dmz_schedule_reclaim(struct dmz_reclaim *zrc)
 	if (dmz_should_reclaim(zrc, p_unmap))
 		mod_delayed_work(zrc->wq, &zrc->work, 0);
 }
-
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 288054dd7cf4..8083607b9535 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -127,6 +127,7 @@ enum {
 	/* Zone internal state */
 	DMZ_RECLAIM,
 	DMZ_SEQ_WRITE_ERR,
+	DMZ_RECLAIM_TERMINATE,
 };
 
 /*
@@ -140,6 +141,8 @@ enum {
 #define dmz_is_readonly(z)	test_bit(DMZ_READ_ONLY, &(z)->flags)
 #define dmz_in_reclaim(z)	test_bit(DMZ_RECLAIM, &(z)->flags)
 #define dmz_seq_write_err(z)	test_bit(DMZ_SEQ_WRITE_ERR, &(z)->flags)
+#define dmz_reclaim_should_terminate(z) \
+				test_bit(DMZ_RECLAIM_TERMINATE, &(z)->flags)
 
 #define dmz_is_meta(z)		test_bit(DMZ_META, &(z)->flags)
 #define dmz_is_buf(z)		test_bit(DMZ_BUF, &(z)->flags)
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

