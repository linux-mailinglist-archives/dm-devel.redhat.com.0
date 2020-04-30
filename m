Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DC7CA1C2CD7
	for <lists+dm-devel@lfdr.de>; Sun,  3 May 2020 15:42:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588513361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WR8yCM/dxWci04jpXA8WKmo5tqFmvHARovUTLl0c/pg=;
	b=OiTxKjXS1XC86+/sTT5gc/Uy/utTJGKgKU2X4LvTXtexnd7P/S7cZP1wbKcKsK74PpHl4f
	natWX41mUtR6ME7J/9yJ3IVfcieCw6QLhTAWm4vJ5Bhhpv503EBk8ZXVL6OTQ2Hcb+iW+y
	uvCwTluvPEg6O+FJ6cPs+UvkxZ/lz/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-pVVBk7G7Nb2S5Re3Wkk6NQ-1; Sun, 03 May 2020 09:42:39 -0400
X-MC-Unique: pVVBk7G7Nb2S5Re3Wkk6NQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 747FB872FEB;
	Sun,  3 May 2020 13:42:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A3805C48C;
	Sun,  3 May 2020 13:42:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E11FE1809543;
	Sun,  3 May 2020 13:42:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03UKmlZK030851 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Apr 2020 16:48:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7AC4D10BBCD4; Thu, 30 Apr 2020 20:48:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7765F10BBCD2
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 20:48:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7FE62804025
	for <dm-devel@redhat.com>; Thu, 30 Apr 2020 20:48:44 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-317-UATR2HvSOReg8QoJkhvBLA-1; Thu, 30 Apr 2020 16:48:40 -0400
X-MC-Unique: UATR2HvSOReg8QoJkhvBLA-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 4C1832A2BBA
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Thu, 30 Apr 2020 16:48:29 -0400
Message-Id: <20200430204830.2589456-2-krisman@collabora.com>
In-Reply-To: <20200430204830.2589456-1-krisman@collabora.com>
References: <20200430204830.2589456-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03UKmlZK030851
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Sun, 03 May 2020 09:42:25 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v3 1/2] md: mpath: Pass IO start time to path
	selector
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

HST is going to need this information to perform path prediction. For
request-based mpath, we use the struct request io_start_time, while for
bio based, use the DM layer start_time.

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c         |  9 ++++++---
 drivers/md/dm-path-selector.h |  2 +-
 drivers/md/dm-queue-length.c  |  2 +-
 drivers/md/dm-service-time.c  |  2 +-
 drivers/md/dm.c               | 10 ++++++++++
 include/linux/device-mapper.h |  2 ++
 6 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index f5e7f8e88767..08b57964719b 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -567,7 +567,8 @@ static void multipath_release_clone(struct request *clone,
 		if (pgpath && pgpath->pg->ps.type->end_io)
 			pgpath->pg->ps.type->end_io(&pgpath->pg->ps,
 						    &pgpath->path,
-						    mpio->nr_bytes);
+						    mpio->nr_bytes,
+						    clone->io_start_time_ns);
 	}
 
 	blk_put_request(clone);
@@ -1620,7 +1621,8 @@ static int multipath_end_io(struct dm_target *ti, struct request *clone,
 		struct path_selector *ps = &pgpath->pg->ps;
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes);
+			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes,
+					 clone->io_start_time_ns);
 	}
 
 	return r;
@@ -1664,7 +1666,8 @@ static int multipath_end_io_bio(struct dm_target *ti, struct bio *clone,
 		struct path_selector *ps = &pgpath->pg->ps;
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes);
+			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes,
+					 dm_start_time_ns_from_clone(clone));
 	}
 
 	return r;
diff --git a/drivers/md/dm-path-selector.h b/drivers/md/dm-path-selector.h
index b6eb5365b1a4..c47bc0e20275 100644
--- a/drivers/md/dm-path-selector.h
+++ b/drivers/md/dm-path-selector.h
@@ -74,7 +74,7 @@ struct path_selector_type {
 	int (*start_io) (struct path_selector *ps, struct dm_path *path,
 			 size_t nr_bytes);
 	int (*end_io) (struct path_selector *ps, struct dm_path *path,
-		       size_t nr_bytes);
+		       size_t nr_bytes, u64 start_time);
 };
 
 /* Register a path selector */
diff --git a/drivers/md/dm-queue-length.c b/drivers/md/dm-queue-length.c
index 969c4f1a3633..5fd018d18418 100644
--- a/drivers/md/dm-queue-length.c
+++ b/drivers/md/dm-queue-length.c
@@ -227,7 +227,7 @@ static int ql_start_io(struct path_selector *ps, struct dm_path *path,
 }
 
 static int ql_end_io(struct path_selector *ps, struct dm_path *path,
-		     size_t nr_bytes)
+		     size_t nr_bytes, u64 start_time)
 {
 	struct path_info *pi = path->pscontext;
 
diff --git a/drivers/md/dm-service-time.c b/drivers/md/dm-service-time.c
index f006a9005593..9cfda665e9eb 100644
--- a/drivers/md/dm-service-time.c
+++ b/drivers/md/dm-service-time.c
@@ -309,7 +309,7 @@ static int st_start_io(struct path_selector *ps, struct dm_path *path,
 }
 
 static int st_end_io(struct path_selector *ps, struct dm_path *path,
-		     size_t nr_bytes)
+		     size_t nr_bytes, u64 start_time)
 {
 	struct path_info *pi = path->pscontext;
 
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index df13fdebe21f..c5deee1bea67 100644
--- a/drivers/md/dm.c
+++ b/drivers/md/dm.c
@@ -674,6 +674,16 @@ static bool md_in_flight(struct mapped_device *md)
 		return md_in_flight_bios(md);
 }
 
+u64 dm_start_time_ns_from_clone(struct bio *bio)
+{
+	struct dm_target_io *tio = container_of(bio, struct dm_target_io, clone);
+	struct dm_io *io = tio->io;
+
+	/* FIXME: convert io->start_time from jiffies to nanoseconds */
+	return jiffies_to_nsecs(io->start_time);
+}
+EXPORT_SYMBOL_GPL(dm_start_time_ns_from_clone);
+
 static void start_io_acct(struct dm_io *io)
 {
 	struct mapped_device *md = io->md;
diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index 475668c69dbc..e2d506dd805e 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -329,6 +329,8 @@ void *dm_per_bio_data(struct bio *bio, size_t data_size);
 struct bio *dm_bio_from_per_bio_data(void *data, size_t data_size);
 unsigned dm_bio_get_target_bio_nr(const struct bio *bio);
 
+u64 dm_start_time_ns_from_clone(struct bio *bio);
+
 int dm_register_target(struct target_type *t);
 void dm_unregister_target(struct target_type *t);
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

