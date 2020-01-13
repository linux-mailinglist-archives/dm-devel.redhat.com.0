Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F181613A8C3
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 12:56:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579002959;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4EqnPEgte3motIOFC22CGmnRKNjvteMm8zjNTNnn4iM=;
	b=Xi0ykcN5S3zG62yoznw+BUmEpNozNMih9Dcowo38qd1exScSh7tzQSro+8A4GC65uesskX
	rJi1ycThYU0Z2zAP170BiAJnr+2g9ZLFzs5Wx4m52euNfTvuOOzIFi0xnigKnQhRNhFAom
	NCpxTgtaeJ0IoiQFA285WRIaT7w79BQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-azKGWtj6NgyMNDeZAnFDsw-1; Tue, 14 Jan 2020 06:55:57 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 44A8D100551D;
	Tue, 14 Jan 2020 11:55:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6B4A5C1D6;
	Tue, 14 Jan 2020 11:55:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B28C1803C33;
	Tue, 14 Jan 2020 11:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00DMfbot019865 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jan 2020 17:41:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C4F2C10F1C0C; Mon, 13 Jan 2020 22:41:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C012810F1C07
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 22:41:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D31EF80301F
	for <dm-devel@redhat.com>; Mon, 13 Jan 2020 22:41:35 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-243-wVUCjW6fMIyWrqdGQADrjw-1; Mon, 13 Jan 2020 17:41:31 -0500
Received: from localhost (unknown [IPv6:2610:98:8005::27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: krisman)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D4CD4291385;
	Mon, 13 Jan 2020 22:41:29 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: snitzer@redhat.com
Date: Mon, 13 Jan 2020 17:41:27 -0500
Message-Id: <20200113224127.3367484-1-krisman@collabora.com>
MIME-Version: 1.0
X-MC-Unique: wVUCjW6fMIyWrqdGQADrjw-1
X-MC-Unique: azKGWtj6NgyMNDeZAnFDsw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00DMfbot019865
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Jan 2020 06:55:09 -0500
Cc: dm-devel@redhat.com, kernel@collabora.com, krisman@collabora.com,
	khazhy@google.com
Subject: [dm-devel] [PATCH v2] dm mpath: Add timeout mechanism for
	queue_if_no_path
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anatol Pomazau <anatol@google.com>

Add a configurable timeout mechanism to disable queue_if_no_path without
assistance from multipathd.  In reality, this reimplements the
no_path_retry mechanism from multipathd in kernel space, which is
interesting to prevent processes from hanging indefinitely in cases
where the daemon might be unable to respond, after a failure or for
whatever reason.

Despite replicating the policy configuration on kernel space, it is
quite an important case to prevent IOs from hanging forever, waiting for
userspace to behave correctly.

v2:
  - Use a module parameter instead of configuring per table
  - Simplify code

Co-developed-by: Frank Mayhar <fmayhar@google.com>
Signed-off-by: Frank Mayhar <fmayhar@google.com>
Co-developed-by: Bharath Ravi <rbharath@google.com>
Signed-off-by: Bharath Ravi <rbharath@google.com>
Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Anatol Pomazau <anatol@google.com>
Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index e0c32793c248..52d90900e85b 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -29,6 +29,7 @@
 #define DM_MSG_PREFIX "multipath"
 #define DM_PG_INIT_DELAY_MSECS 2000
 #define DM_PG_INIT_DELAY_DEFAULT ((unsigned) -1)
+#define QUEUE_IF_NO_PATH_TIMEOUT_DEFAULT 0
 
 /* Path properties */
 struct pgpath {
@@ -91,6 +92,8 @@ struct multipath {
 
 	struct work_struct process_queued_bios;
 	struct bio_list queued_bios;
+
+	struct timer_list nopath_timer;	/* Timeout for queue_if_no_path */
 };
 
 /*
@@ -101,6 +104,10 @@ struct dm_mpath_io {
 	size_t nr_bytes;
 };
 
+static unsigned long queue_if_no_path_timeout = QUEUE_IF_NO_PATH_TIMEOUT_DEFAULT;
+module_param_named(queue_if_no_path_timeout_secs,
+                  queue_if_no_path_timeout, ulong, 0644);
+
 typedef int (*action_fn) (struct pgpath *pgpath);
 
 static struct workqueue_struct *kmultipathd, *kmpath_handlerd;
@@ -109,6 +116,10 @@ static void activate_or_offline_path(struct pgpath *pgpath);
 static void activate_path_work(struct work_struct *work);
 static void process_queued_bios(struct work_struct *work);
 
+static void queue_if_no_path_timeout_work(struct timer_list *t);
+static void enable_nopath_timeout(struct multipath *m);
+static void disable_nopath_timeout(struct multipath *m);
+
 /*-----------------------------------------------
  * Multipath state flags.
  *-----------------------------------------------*/
@@ -195,6 +206,8 @@ static struct multipath *alloc_multipath(struct dm_target *ti)
 
 		m->ti = ti;
 		ti->private = m;
+
+		timer_setup(&m->nopath_timer, queue_if_no_path_timeout_work, 0);
 	}
 
 	return m;
@@ -1090,6 +1103,7 @@ static int multipath_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	struct dm_arg_set as;
 	unsigned pg_count = 0;
 	unsigned next_pg_num;
+	unsigned long flags;
 
 	as.argc = argc;
 	as.argv = argv;
@@ -1154,6 +1168,10 @@ static int multipath_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		goto bad;
 	}
 
+	spin_lock_irqsave(&m->lock, flags);
+	enable_nopath_timeout(m);
+	spin_unlock_irqrestore(&m->lock, flags);
+
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_write_same_bios = 1;
@@ -1208,10 +1226,25 @@ static void multipath_dtr(struct dm_target *ti)
 {
 	struct multipath *m = ti->private;
 
+	disable_nopath_timeout(m);
 	flush_multipath_work(m);
 	free_multipath(m);
 }
 
+/*
+ * If the queue_if_no_path timeout fires, turn off queue_if_no_path and
+ * process any queued I/O.
+ */
+static void queue_if_no_path_timeout_work(struct timer_list *t)
+{
+	struct multipath *m = from_timer(m, t, nopath_timer);
+	struct mapped_device *md = dm_table_get_md((m)->ti->table);
+
+	DMWARN("queue_if_no_path timeout on %s", dm_device_name(md));
+
+	queue_if_no_path(m, false, false);
+}
+
 /*
  * Take a path out of use.
  */
@@ -1241,6 +1274,8 @@ static int fail_path(struct pgpath *pgpath)
 
 	schedule_work(&m->trigger_event);
 
+	enable_nopath_timeout(m);
+
 out:
 	spin_unlock_irqrestore(&m->lock, flags);
 
@@ -1291,6 +1326,9 @@ static int reinstate_path(struct pgpath *pgpath)
 		process_queued_io_list(m);
 	}
 
+	if (pgpath->is_active)
+		disable_nopath_timeout(m);
+
 	return r;
 }
 
@@ -1314,6 +1352,25 @@ static int action_dev(struct multipath *m, struct dm_dev *dev,
 	return r;
 }
 
+/*
+ * Enable the queue_if_no_path timeout if necessary.  Called with m->lock
+ * held.
+ */
+static void enable_nopath_timeout(struct multipath *m)
+{
+	if (queue_if_no_path_timeout > 0 &&
+	    atomic_read(&m->nr_valid_paths) == 0 &&
+	    test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags)) {
+		mod_timer(&m->nopath_timer,
+			  jiffies + queue_if_no_path_timeout * HZ);
+	}
+}
+
+static void disable_nopath_timeout(struct multipath *m)
+{
+	del_timer_sync(&m->nopath_timer);
+}
+
 /*
  * Temporarily try to avoid having to use the specified PG
  */
@@ -1789,6 +1846,7 @@ static int multipath_message(struct dm_target *ti, unsigned argc, char **argv,
 	struct dm_dev *dev;
 	struct multipath *m = ti->private;
 	action_fn action;
+	unsigned long flags;
 
 	mutex_lock(&m->work_mutex);
 
@@ -1800,9 +1858,13 @@ static int multipath_message(struct dm_target *ti, unsigned argc, char **argv,
 	if (argc == 1) {
 		if (!strcasecmp(argv[0], "queue_if_no_path")) {
 			r = queue_if_no_path(m, true, false);
+			spin_lock_irqsave(&m->lock, flags);
+			enable_nopath_timeout(m);
+			spin_unlock_irqrestore(&m->lock, flags);
 			goto out;
 		} else if (!strcasecmp(argv[0], "fail_if_no_path")) {
 			r = queue_if_no_path(m, false, false);
+			disable_nopath_timeout(m);
 			goto out;
 		}
 	}
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

