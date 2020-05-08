Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 78D781CA6BD
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:04:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588928665;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UYwMeVuF8W873cVvM6XD9+Z6Gbi5W+9i6BHaDGNANNE=;
	b=UCZg3l/ZQwdzKbg3saxzXra+Tl/hL/gY5EExCeS2RuzAqZ/RH2beN0LD1LmfsHHwzVVTXI
	Uoos2BxcC2Equ3jv1OUdx558R1VOgcXEuhGSRQ708chrd6KLf+vqXZRC9tnTagKY0WW9bp
	fThO5L1/haAH2KpHUZ8HKqA8fOBBPTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-221-x0-fMnVAMcSybZUTiv3HmQ-1; Fri, 08 May 2020 05:04:23 -0400
X-MC-Unique: x0-fMnVAMcSybZUTiv3HmQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 873A6BFC0;
	Fri,  8 May 2020 09:04:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C11576ACEC;
	Fri,  8 May 2020 09:04:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1FEE4CAA7;
	Fri,  8 May 2020 09:04:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048941Vj000733 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:04:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 45E7D202683D; Fri,  8 May 2020 09:04:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423212026E1C
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:03:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F415A8001E5
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:03:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-238-g10XuoULPG60TfLDFN0cvA-1;
	Fri, 08 May 2020 05:03:56 -0400
X-MC-Unique: g10XuoULPG60TfLDFN0cvA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id E0B3EAD1E;
	Fri,  8 May 2020 09:03:56 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri,  8 May 2020 11:03:19 +0200
Message-Id: <20200508090332.40716-2-hare@suse.de>
In-Reply-To: <20200508090332.40716-1-hare@suse.de>
References: <20200508090332.40716-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048941Vj000733
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 01/14] dm-zoned: add 'status' and 'message'
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add callbacks to supply information for 'dmsetup status'
and 'dmsetup info', and implement the message 'reclaim'
to start the reclaim worker.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 drivers/md/dm-zoned-metadata.c | 15 +++++++++++++++
 drivers/md/dm-zoned-target.c   | 41 +++++++++++++++++++++++++++++++++++++++++
 drivers/md/dm-zoned.h          |  3 +++
 3 files changed, 59 insertions(+)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index 369de15c4e80..c8787560fa9f 100644
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
index f4f83d39b3dc..0bfe34162dbb 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -965,6 +965,45 @@ static int dmz_iterate_devices(struct dm_target *ti,
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
+		DMEMIT("%u zones %u/%u random %u/%u sequential",
+		       dmz_nr_zones(dmz->metadata),
+		       dmz_nr_unmap_rnd_zones(dmz->metadata),
+		       dmz_nr_rnd_zones(dmz->metadata),
+		       dmz_nr_unmap_seq_zones(dmz->metadata),
+		       dmz_nr_seq_zones(dmz->metadata));
+		break;
+	case STATUSTYPE_TABLE:
+		format_dev_t(buf, dmz->dev->bdev->bd_dev);
+		DMEMIT("%s", buf);
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
@@ -978,6 +1017,8 @@ static struct target_type dmz_type = {
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

