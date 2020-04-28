Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1E2BB1BBAD7
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 12:09:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068593;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+5HbpTG8xyPeAoD/VYcs32jAKlIy5X5jPcCMWd0ljoY=;
	b=hr5fEIG7NNZVksKTZGfMAH7ANpS4jnfr+hy9wIebzjZQ2ASACGFygPQqgXJ9o/q3OCS25o
	w9VOIz1OYVtN3/4zWf5tucYz1G1Vp7VAkcThydJmp+UMqXkH7Pre2GDCZRMT7L/1scalDc
	tlBoH3xxTDrFgbNVoL96Gg03wp+oqIg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-O6CEA9TCNAi7nH5Y9DuKTA-1; Tue, 28 Apr 2020 06:09:50 -0400
X-MC-Unique: O6CEA9TCNAi7nH5Y9DuKTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FAECA0BD9;
	Tue, 28 Apr 2020 10:09:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C74610EC;
	Tue, 28 Apr 2020 10:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AC301809542;
	Tue, 28 Apr 2020 10:09:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S0q2Ml011293 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 20:52:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFB8FA9FDB; Tue, 28 Apr 2020 00:52:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4CFAFD4F
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:52:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2B761019CA7
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:51:59 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-191-iKof-UhMMNGlszLBIi1Ibg-1; Mon, 27 Apr 2020 20:51:56 -0400
X-MC-Unique: iKof-UhMMNGlszLBIi1Ibg-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 3495A2A0D12
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 27 Apr 2020 20:51:44 -0400
Message-Id: <20200428005146.242231-2-krisman@collabora.com>
In-Reply-To: <20200428005146.242231-1-krisman@collabora.com>
References: <20200428005146.242231-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S0q2Ml011293
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:09:31 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>, khazhy@google.com
Subject: [dm-devel] [PATCH v2 1/3] md: multipath: Encapsulate parameters
	passed to selectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Different selector will use different parameters, which means .io_start
and .io_end will get their signatures modified to include more and more
parameters.  This encapsulates the data in a structure so we can
simplify the interface for future users.  For now it only passes
nr_bytes, but HST will require start_time already.

Cc: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c         | 25 ++++++++++++++++++++-----
 drivers/md/dm-path-selector.h |  8 ++++++--
 drivers/md/dm-queue-length.c  |  4 ++--
 drivers/md/dm-service-time.c  |  8 ++++----
 4 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index f5e7f8e88767..1ef4fc2e745b 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -500,6 +500,9 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
 	struct dm_mpath_io *mpio = get_mpio(map_context);
 	struct request_queue *q;
 	struct request *clone;
+	struct path_selector_io_data io_data = {
+		.nr_bytes = nr_bytes,
+	};
 
 	/* Do we need to select a new pgpath? */
 	pgpath = READ_ONCE(m->current_pgpath);
@@ -549,7 +552,7 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
 	if (pgpath->pg->ps.type->start_io)
 		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
 					      &pgpath->path,
-					      nr_bytes);
+					      &io_data);
 	return DM_MAPIO_REMAPPED;
 }
 
@@ -563,11 +566,14 @@ static void multipath_release_clone(struct request *clone,
 		 */
 		struct dm_mpath_io *mpio = get_mpio(map_context);
 		struct pgpath *pgpath = mpio->pgpath;
+		struct path_selector_io_data ps_io_data = {
+			.nr_bytes = mpio->nr_bytes,
+		};
 
 		if (pgpath && pgpath->pg->ps.type->end_io)
 			pgpath->pg->ps.type->end_io(&pgpath->pg->ps,
 						    &pgpath->path,
-						    mpio->nr_bytes);
+						    &ps_io_data);
 	}
 
 	blk_put_request(clone);
@@ -617,6 +623,9 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
 			       struct dm_mpath_io *mpio)
 {
 	struct pgpath *pgpath = __map_bio(m, bio);
+	struct path_selector_io_data io_data = {
+		.nr_bytes = mpio->nr_bytes,
+	};
 
 	if (IS_ERR(pgpath))
 		return DM_MAPIO_SUBMITTED;
@@ -637,7 +646,7 @@ static int __multipath_map_bio(struct multipath *m, struct bio *bio,
 	if (pgpath->pg->ps.type->start_io)
 		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
 					      &pgpath->path,
-					      mpio->nr_bytes);
+					      &io_data);
 	return DM_MAPIO_REMAPPED;
 }
 
@@ -1618,9 +1627,12 @@ static int multipath_end_io(struct dm_target *ti, struct request *clone,
 
 	if (pgpath) {
 		struct path_selector *ps = &pgpath->pg->ps;
+		struct path_selector_io_data io_data = {
+			.nr_bytes = mpio->nr_bytes
+		};
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes);
+			ps->type->end_io(ps, &pgpath->path, &io_data);
 	}
 
 	return r;
@@ -1662,9 +1674,12 @@ static int multipath_end_io_bio(struct dm_target *ti, struct bio *clone,
 done:
 	if (pgpath) {
 		struct path_selector *ps = &pgpath->pg->ps;
+		struct path_selector_io_data io_data = {
+			.nr_bytes = mpio->nr_bytes
+		};
 
 		if (ps->type->end_io)
-			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes);
+			ps->type->end_io(ps, &pgpath->path, &io_data);
 	}
 
 	return r;
diff --git a/drivers/md/dm-path-selector.h b/drivers/md/dm-path-selector.h
index b6eb5365b1a4..fb582a943234 100644
--- a/drivers/md/dm-path-selector.h
+++ b/drivers/md/dm-path-selector.h
@@ -26,6 +26,10 @@ struct path_selector {
 	void *context;
 };
 
+struct path_selector_io_data {
+	size_t nr_bytes;
+};
+
 /* Information about a path selector type */
 struct path_selector_type {
 	char *name;
@@ -72,9 +76,9 @@ struct path_selector_type {
 		       status_type_t type, char *result, unsigned int maxlen);
 
 	int (*start_io) (struct path_selector *ps, struct dm_path *path,
-			 size_t nr_bytes);
+			 const struct path_selector_io_data *io_data);
 	int (*end_io) (struct path_selector *ps, struct dm_path *path,
-		       size_t nr_bytes);
+		       const struct path_selector_io_data *io_data);
 };
 
 /* Register a path selector */
diff --git a/drivers/md/dm-queue-length.c b/drivers/md/dm-queue-length.c
index 969c4f1a3633..eeaa038a1dbb 100644
--- a/drivers/md/dm-queue-length.c
+++ b/drivers/md/dm-queue-length.c
@@ -217,7 +217,7 @@ static struct dm_path *ql_select_path(struct path_selector *ps, size_t nr_bytes)
 }
 
 static int ql_start_io(struct path_selector *ps, struct dm_path *path,
-		       size_t nr_bytes)
+		       const struct path_selector_io_data *io_data)
 {
 	struct path_info *pi = path->pscontext;
 
@@ -227,7 +227,7 @@ static int ql_start_io(struct path_selector *ps, struct dm_path *path,
 }
 
 static int ql_end_io(struct path_selector *ps, struct dm_path *path,
-		     size_t nr_bytes)
+		     const struct path_selector_io_data *io_data)
 {
 	struct path_info *pi = path->pscontext;
 
diff --git a/drivers/md/dm-service-time.c b/drivers/md/dm-service-time.c
index f006a9005593..d751f26b61af 100644
--- a/drivers/md/dm-service-time.c
+++ b/drivers/md/dm-service-time.c
@@ -299,21 +299,21 @@ static struct dm_path *st_select_path(struct path_selector *ps, size_t nr_bytes)
 }
 
 static int st_start_io(struct path_selector *ps, struct dm_path *path,
-		       size_t nr_bytes)
+		       const struct path_selector_io_data *io_data)
 {
 	struct path_info *pi = path->pscontext;
 
-	atomic_add(nr_bytes, &pi->in_flight_size);
+	atomic_add(io_data->nr_bytes, &pi->in_flight_size);
 
 	return 0;
 }
 
 static int st_end_io(struct path_selector *ps, struct dm_path *path,
-		     size_t nr_bytes)
+		     const struct path_selector_io_data *io_data)
 {
 	struct path_info *pi = path->pscontext;
 
-	atomic_sub(nr_bytes, &pi->in_flight_size);
+	atomic_sub(io_data->nr_bytes, &pi->in_flight_size);
 
 	return 0;
 }
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

