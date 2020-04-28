Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C347F1BBADC
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 12:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DYIRBguC6I4DQCBuQbOqME13UDqjk9exawZQ1wPzE5E=;
	b=BgdHoZ20or4Cjv1CMnC6c/ipe9BFhe7ihlGTpVmBVz00RfN/ODFZu/YbZdcBsdPhOsMnd7
	uWwc1+IIVAPT4fXkDNK/m9hOvFAXC6d4bPspggTsFKwdOaOEMwgMUY+cnhI+UfBUKVEP57
	vC7rRaE9pSn7XDGeMK9A7K1I/h1ZFQY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-hjeivZANPIiq36burx9dzw-1; Tue, 28 Apr 2020 06:09:53 -0400
X-MC-Unique: hjeivZANPIiq36burx9dzw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D22E1899521;
	Tue, 28 Apr 2020 10:09:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 527E05C1D6;
	Tue, 28 Apr 2020 10:09:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D80E81809542;
	Tue, 28 Apr 2020 10:09:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S0q7g4011310 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 20:52:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 822FB2026E1C; Tue, 28 Apr 2020 00:52:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA3E2026D69
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF9F8811E77
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:04 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-479-Zl1tT-JPPcWf17MvCbOrow-1; Mon, 27 Apr 2020 20:52:00 -0400
X-MC-Unique: Zl1tT-JPPcWf17MvCbOrow-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id C46F32A0D12
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 27 Apr 2020 20:51:45 -0400
Message-Id: <20200428005146.242231-3-krisman@collabora.com>
In-Reply-To: <20200428005146.242231-1-krisman@collabora.com>
References: <20200428005146.242231-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S0q7g4011310
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:09:31 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v2 2/3] md: multipath: Pass io_start_time to the
	path selector
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

HST need to know the IO start time in order to predict path
performance. For request-based multipath use the block layer
io_start_time, while for BIO use the dm_io start_time.

The dm_start_time_ns_from_clone function was suggested and implemented
by Mike Snitzer <snitzer@redhat.com>.

Cc: Mike Snitzer <snitzer@redhat.com>
Cc: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c         | 25 +++++++++++++++----------
 drivers/md/dm-path-selector.h |  1 +
 drivers/md/dm.c               | 10 ++++++++++
 include/linux/device-mapper.h |  2 ++
 4 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 1ef4fc2e745b..7af3249948be 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -500,8 +500,9 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
 	struct dm_mpath_io *mpio = get_mpio(map_context);
 	struct request_queue *q;
 	struct request *clone;
-	struct path_selector_io_data io_data = {
+	struct path_selector_io_data ps_io_data = {
 		.nr_bytes = nr_bytes,
+		.io_start_time = rq->io_start_time_ns
 	};
 
 	/* Do we need to select a new pgpath? */
@@ -552,7 +553,7 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
 	if (pgpath->pg->ps.type->start_io)
 		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
 					      &pgpath->path,
-					      &io_data);
+					      &ps_io_data);
 	return DM_MAPIO_REMAPPED;
 }
 
@@ -568,6 +569,7 @@ static void multipath_release_clone(struct request *clone,
 		struct pgpath *pgpath = mpio->pgpath;
 		struct path_selector_io_data ps_io_data = {
 			.nr_bytes = mpio->nr_bytes,
+			.io_start_time = clone->io_start_time_ns,
 		};
 
 		if (pgpath && pgpath->pg->ps.type->end_io)
@@ -623,8 +625,9 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
 			       struct dm_mpath_io *mpio)
 {
 	struct pgpath *pgpath = __map_bio(m, bio);
-	struct path_selector_io_data io_data = {
+	struct path_selector_io_data ps_io_data = {
 		.nr_bytes = mpio->nr_bytes,
+		.io_start_time = dm_start_time_ns_from_clone(bio)
 	};
 
 	if (IS_ERR(pgpath))
@@ -646,7 +649,7 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
 	if (pgpath->pg->ps.type->start_io)
 		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
 					      &pgpath->path,
-					      &io_data);
+					      &ps_io_data);
 	return DM_MAPIO_REMAPPED;
 }
 
@@ -1627,12 +1630,13 @@ static int multipath_end_io(struct dm_target *ti, struct request *clone,
 
 	if (pgpath) {
 		struct path_selector *ps = &pgpath->pg->ps;
-		struct path_selector_io_data io_data = {
-			.nr_bytes = mpio->nr_bytes
+		struct path_selector_io_data ps_io_data = {
+			.nr_bytes = mpio->nr_bytes,
+			.io_start_time = clone->io_start_time_ns
 		};
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, &io_data);
+			ps->type->end_io(ps, &pgpath->path, &ps_io_data);
 	}
 
 	return r;
@@ -1674,12 +1678,13 @@ static int multipath_end_io_bio(struct dm_target *ti, struct bio *clone,
 done:
 	if (pgpath) {
 		struct path_selector *ps = &pgpath->pg->ps;
-		struct path_selector_io_data io_data = {
-			.nr_bytes = mpio->nr_bytes
+		struct path_selector_io_data ps_io_data = {
+			.nr_bytes = mpio->nr_bytes,
+			.io_start_time = dm_start_time_ns_from_clone(clone)
 		};
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, &io_data);
+			ps->type->end_io(ps, &pgpath->path, &ps_io_data);
 	}
 
 	return r;
diff --git a/drivers/md/dm-path-selector.h b/drivers/md/dm-path-selector.h
index fb582a943234..4c5fa6a2efe3 100644
--- a/drivers/md/dm-path-selector.h
+++ b/drivers/md/dm-path-selector.h
@@ -28,6 +28,7 @@ struct path_selector {
 
 struct path_selector_io_data {
 	size_t nr_bytes;
+	u64 io_start_time;
 };
 
 /* Information about a path selector type */
diff --git a/drivers/md/dm.c b/drivers/md/dm.c
index df13fdebe21f..2e0637a6de9d 100644
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
+	return (u64)jiffies_to_msecs(io->start_time) * NSEC_PER_MSEC;
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

