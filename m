Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2073C1CD3B4
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589185507;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bdAcF4DIOe8hYewWwlfaccGtvh7B7I1zEHu5bYyoZhI=;
	b=Ho2rPvLQgD4hFRUCuJD/4nE6OGTvVM9hvPpj1VhGf5nNEScqTAASjJGInY1HU8BGsenMsK
	5bY3Po/OUA5gKKsNLbf02MUHQhjwml6MB/G1Su64s3C3J+rFpiJ4DQi5yB8Um2b+pAmnvx
	r+p7euXgjgK1atKO3IKk2veWNHbE0Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-2O2YnofqOPu5ZHuTATysWA-1; Mon, 11 May 2020 04:25:04 -0400
X-MC-Unique: 2O2YnofqOPu5ZHuTATysWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5017C18FE867;
	Mon, 11 May 2020 08:24:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E7E610F2;
	Mon, 11 May 2020 08:24:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A9EE91809547;
	Mon, 11 May 2020 08:24:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8Oo2B031844 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:24:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73B1D202683D; Mon, 11 May 2020 08:24:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FF6E2026FFE
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D01180CDAE
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:24:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-479-_uXQU2S6Mhyn_TcCY6drXg-1;
	Mon, 11 May 2020 04:24:46 -0400
X-MC-Unique: _uXQU2S6Mhyn_TcCY6drXg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 174C8AE5A;
	Mon, 11 May 2020 08:24:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Mon, 11 May 2020 10:24:16 +0200
Message-Id: <20200511082430.39455-2-hare@suse.de>
In-Reply-To: <20200511082430.39455-1-hare@suse.de>
References: <20200511082430.39455-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: [dm-devel] [PATCH 01/15] dm-zoned: add 'status' callback
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

Add callback to supply information for 'dmsetup status'
and 'dmsetup table'. The output for 'dmsetup status' is

0 <size> zoned <nr_zones> zones <nr_unmap_rnd>/<nr_rnd> random <nr_unmap_seq>/<nr_seq> sequential

where <nr_unmap_rnd> is the number of unmapped (ie free) random zones,
<nr_rnd> the total number of random zones, <nr_unmap_seq> the number
of unmapped sequential zones, and <nr_seq> the total number of
sequential zones.

Signed-off-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Bob Liu <bob.liu@oracle.com>
Reviewed-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../admin-guide/device-mapper/dm-zoned.rst         | 16 +++++++++++++
 drivers/md/dm-zoned-metadata.c                     | 15 +++++++++++++
 drivers/md/dm-zoned-target.c                       | 26 ++++++++++++++++++++++
 drivers/md/dm-zoned.h                              |  3 +++
 4 files changed, 60 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-zoned.rst b/Documentation/admin-guide/device-mapper/dm-zoned.rst
index 07f56ebc1730..4165fbf1aeb6 100644
--- a/Documentation/admin-guide/device-mapper/dm-zoned.rst
+++ b/Documentation/admin-guide/device-mapper/dm-zoned.rst
@@ -144,3 +144,19 @@ underlying zoned block device name. Ex::
 
 	echo "0 `blockdev --getsize ${dev}` zoned ${dev}" | \
 	dmsetup create dmz-`basename ${dev}`
+
+Information about the internal layout and current usage of the zones can
+be obtained with the 'status' callback from dmsetup:
+
+Ex::
+
+	dmsetup status /dev/dm-X
+
+will return a line
+
+	0 <size> zoned <nr_zones> zones <nr_unmap_rnd>/<nr_rnd> random <nr_unmap_seq>/<nr_seq> sequential
+
+where <nr_zones> is the total number of zones, <nr_unmap_rnd> is the number
+of unmapped (ie free) random zones, <nr_rnd> the total number of zones,
+<nr_unmap_seq> the number of unmapped sequential zones, and <nr_seq> the
+total number of sequential zones.
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
index f4f83d39b3dc..0b4b27d280fb 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -965,6 +965,31 @@ static int dmz_iterate_devices(struct dm_target *ti,
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
 static struct target_type dmz_type = {
 	.name		 = "zoned",
 	.version	 = {1, 1, 0},
@@ -978,6 +1003,7 @@ static struct target_type dmz_type = {
 	.postsuspend	 = dmz_suspend,
 	.resume		 = dmz_resume,
 	.iterate_devices = dmz_iterate_devices,
+	.status		 = dmz_status,
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

