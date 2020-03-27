Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id DCFFB1951BA
	for <lists+dm-devel@lfdr.de>; Fri, 27 Mar 2020 08:10:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585293012;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ohghBTwx4/DySONpOp21BksbGyYy43/b9VrAfYYto64=;
	b=PXalHGkBbVkjXcBtlzwJ6Qd780JrhIvl6GmMKo7dktbq9E06hUO9p5djb/+lp9MAg9gk3D
	Y9YM8Jb2tap9gJard7prNlpV8labUTsqHHMLxx++QDXo+LVnI+tYu0ZRE0ygJgaH6QH6yY
	gGlrDWvcu+EgMHRO0lA3vMZcUb2xye8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-388-tvUmvSoFP9aZQ_7qArmAQw-1; Fri, 27 Mar 2020 03:10:10 -0400
X-MC-Unique: tvUmvSoFP9aZQ_7qArmAQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12351107ACC9;
	Fri, 27 Mar 2020 07:10:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01F5260304;
	Fri, 27 Mar 2020 07:09:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7A1841809565;
	Fri, 27 Mar 2020 07:09:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02R796dk027173 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Mar 2020 03:09:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A37F11069F50; Fri, 27 Mar 2020 07:09:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FDFF1069F4D
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:09:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8FACA101A55A
	for <dm-devel@redhat.com>; Fri, 27 Mar 2020 07:09:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-193-FS82Gbh4NmW4WFSalmd7Yg-1;
	Fri, 27 Mar 2020 03:09:00 -0400
X-MC-Unique: FS82Gbh4NmW4WFSalmd7Yg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 313DAB1FC;
	Fri, 27 Mar 2020 07:08:58 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 27 Mar 2020 08:08:49 +0100
Message-Id: <20200327070849.67694-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02R796dk027173
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-zoned: add 'status' and 'message' callbacks
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

Add callbacks to supply information for 'dmsetup status'
and 'dmsetup info', and implement the message 'reclaim'
to start the reclaim worker.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 drivers/md/dm-zoned-metadata.c | 15 +++++++++++++++
 drivers/md/dm-zoned-target.c   | 43 ++++++++++++++++++++++++++++++++++++++++++
 drivers/md/dm-zoned.h          |  3 +++
 3 files changed, 61 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 516c7b671d25..6c456b9165db 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -202,6 +202,11 @@ sector_t dmz_start_block(struct dmz_metadata *zmd, struct dm_zone *zone)
 	return (sector_t)dmz_id(zmd, zone) << zmd->dev->zone_nr_blocks_shift;
 }
 
+unsigned int dmz_nr_zones(struct dmz_metadata *zmd)
+{
+	return zmd->dev->nr_zones;
+}
+
 unsigned int dmz_nr_chunks(struct dmz_metadata *zmd)
 {
 	return zmd->nr_chunks;
@@ -217,6 +222,16 @@ unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd)
 	return atomic_read(&zmd->unmap_nr_rnd);
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
index f4f83d39b3dc..44e30a7de8b9 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -965,6 +965,47 @@ static int dmz_iterate_devices(struct dm_target *ti,
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
+		       "%u/%u random "
+		       "%u/%u sequential",
+		       dmz_nr_zones(dmz->metadata),
+		       dmz_nr_unmap_rnd_zones(dmz->metadata),
+		       dmz_nr_rnd_zones(dmz->metadata),
+		       dmz_nr_unmap_seq_zones(dmz->metadata),
+		       dmz_nr_seq_zones(dmz->metadata));
+		break;
+	case STATUSTYPE_TABLE:
+		format_dev_t(buf, dmz->dev->bdev->bd_dev);
+		DMEMIT("%s ", buf);
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
@@ -978,6 +1019,8 @@ static struct target_type dmz_type = {
 	.postsuspend	 = dmz_suspend,
 	.resume		 = dmz_resume,
 	.iterate_devices = dmz_iterate_devices,
+	.status		 = dmz_status,
+	.message	 = dmz_message,
 };
 
 static int __init dmz_init(void)
diff --git a/drivers/md/dm-zoned.h b/drivers/md/dm-zoned.h
index 5b5e493d479c..884c0e586082 100644
--- a/drivers/md/dm-zoned.h
+++ b/drivers/md/dm-zoned.h
@@ -190,8 +190,11 @@ void dmz_free_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
 void dmz_map_zone(struct dmz_metadata *zmd, struct dm_zone *zone,
 		  unsigned int chunk);
 void dmz_unmap_zone(struct dmz_metadata *zmd, struct dm_zone *zone);
+unsigned int dmz_nr_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_rnd_zones(struct dmz_metadata *zmd);
 unsigned int dmz_nr_unmap_rnd_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_seq_zones(struct dmz_metadata *zmd);
+unsigned int dmz_nr_unmap_seq_zones(struct dmz_metadata *zmd);
 
 /*
  * Activate a zone (increment its reference count).
-- 
2.16.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

