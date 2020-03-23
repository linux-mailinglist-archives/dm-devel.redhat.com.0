Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2D4A518F821
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 16:04:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584975872;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EjZdTnWO5d8Qmn9moNzBLyKVll2UFQpVFOdXtlHV95A=;
	b=OX4dh9bs+BxcE6vqWh5JKgQmSUl68yna56Mrh8+KcmCI5ed72dw3EOHk3EPYyausevyDS8
	H8Jv5obQ1ztFP/+JvTIkrT5ZWc/SXO1ZeFEtVzWk+ks2hB8Qncbe1kb+/ojkgQGyiCdOLg
	hyvxjwYxog6pTLwdGCOI39ICojWVWxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-NCfWTDK5M2e8QRyxM8IdxA-1; Mon, 23 Mar 2020 11:04:29 -0400
X-MC-Unique: NCfWTDK5M2e8QRyxM8IdxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB219800EB6;
	Mon, 23 Mar 2020 15:04:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA481196AE;
	Mon, 23 Mar 2020 15:04:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 33A7B18089C8;
	Mon, 23 Mar 2020 15:04:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NF47Yt001642 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:04:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 469DD2166B33; Mon, 23 Mar 2020 15:04:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 42D402166B2F
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:04:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28294101A55F
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:04:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-110-Wwna7z26P-KOvh3_sr5jkw-1;
	Mon, 23 Mar 2020 11:04:01 -0400
X-MC-Unique: Wwna7z26P-KOvh3_sr5jkw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 05F62AD11;
	Mon, 23 Mar 2020 15:03:59 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Damien LeMoal <damien.lemoal@wdc.com>
Date: Mon, 23 Mar 2020 16:03:52 +0100
Message-Id: <20200323150352.107826-3-hare@suse.de>
In-Reply-To: <20200323150352.107826-1-hare@suse.de>
References: <20200323150352.107826-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NF47Yt001642
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Johannes Thumshirn <jth@kernel.org>,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH 2/2] dm-zoned: add 'status' and 'message'
	callbacks
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

Add callbacks to supply information for 'dmsetup status'
and 'dmsetup info', and implement the message 'reclaim'
to start the reclaim worker.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 15 ++++++++++
 drivers/md/dm-zoned-target.c   | 50 ++++++++++++++++++++++++++++++++++
 drivers/md/dm-zoned.h          |  3 ++
 3 files changed, 68 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 41cc3a29db0b..878e152250ab 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -219,6 +219,11 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 	return zone_id << zmd->dev->zone_nr_blocks_shift;
 }
 
+unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
+{
+	return zmd->nr_zones;
+}
+
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
 {
 	return zmd->nr_chunks;
@@ -244,6 +249,16 @@ unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_cache);
 }
 
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd)
+{
+	return zmd->nr_seq;
+}
+
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd)
+{
+	return atomic_read(&zmd->unmap_nr_seq);
+}
+
 /*
  * Lock/unlock mapping table.
  * The map lock also protects all the zone lists.
diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index 3f25953672b9..1c0368981f49 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -1050,6 +1050,54 @@ static int dmz_iterate_devices(struct dm_target *ti,
 	return fn(ti, dmz->ddev, 0, capacity, data);
 }
 
+static void dmz_status(struct dm_target *ti, status_type_t type,
+		       unsigned int status_flags, char *result,
+		       unsigned int maxlen)
+{
+	struct dmz_target *dmz = ti->private;
+	ssize_t sz = 0;
+	char buf[BDEVNAME_SIZE];
+
+	switch (type) {
+	case STATUSTYPE_INFO:
+		DMEMIT("%u zones "
+		       "%u/%u cache "
+		       "%u/%u random "
+		       "%u/%u sequential",
+		       dmz_nr_zones(dmz->metadata),
+		       dmz_nr_unmap_cache_zones(dmz->metadata),
+		       dmz_nr_cache_zones(dmz->metadata),
+		       dmz_nr_unmap_rnd_zones(dmz->metadata),
+		       dmz_nr_rnd_zones(dmz->metadata),
+		       dmz_nr_unmap_seq_zones(dmz->metadata),
+		       dmz_nr_seq_zones(dmz->metadata));
+		break;
+	case STATUSTYPE_TABLE:
+		format_dev_t(buf, dmz->dev->bdev->bd_dev);
+		DMEMIT("%s ", buf);
+		if (dmz->cdev) {
+			format_dev_t(buf, dmz->cdev->bdev->bd_dev);
+			DMEMIT("%s ", buf);
+		}
+		break;
+	}
+	return;
+}
+
+static int dmz_message(struct dm_target *ti, unsigned int argc, char **argv,
+		       char *result, unsigned int maxlen)
+{
+	struct dmz_target *dmz = ti->private;
+	int r = -EINVAL;
+
+	if (!strcasecmp(argv[0], "reclaim")) {
+		dmz_schedule_reclaim(dmz->reclaim);
+		r = 0;
+	} else
+		DMERR("unrecognized message %s", argv[0]);
+	return r;
+}
+
 static struct target_type dmz_type = {
 	.name		 = "zoned",
 	.version	 = {1, 1, 0},
@@ -1063,6 +1111,8 @@ static struct target_type dmz_type = {
 	.postsuspend	 = dmz_suspend,
 	.resume		 = dmz_resume,
 	.iterate_devices = dmz_iterate_devices,
+	.status		 = dmz_status,
+	.message	 = dmz_message,
 };
 
 static int __init dmz_init(void)
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index c2b6a919681a..2b3745e8f679 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -213,10 +213,13 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
 		  unsigned int chunk);
 void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
+unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_cache_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_cache_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
 
 /*
  * Activate a zone (increment its reference count).
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

