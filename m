Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7449412F6A3
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jan 2020 11:12:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578046342;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=inzls5hpZDbNIQ7xbL0j6WcszzijNQWpW7uVpeJDNDQ=;
	b=EB58LcwlPViH/+K+iuZON+5a8aoNNx5Hs/lnnGoZh5++ioE3ud/G1fUoGfyrY3gV7AJkbC
	HqXcNkwaCb/t0OxgzqfrrgrZwHHPF6mHltOluTAb5qL0pY0053W2hKHi11PdvPRgBvF+iy
	cwuJoSoBzq/B1kI4vwM5kzZhwwRtpjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-XFIP3ZUYMrqokYM8hvP1sQ-1; Fri, 03 Jan 2020 05:12:18 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2F2FD1005510;
	Fri,  3 Jan 2020 10:12:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A18FD7D55A;
	Fri,  3 Jan 2020 10:12:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F8471809567;
	Fri,  3 Jan 2020 10:12:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 002MjQQ0024550 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jan 2020 17:45:26 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1C48DC1246; Thu,  2 Jan 2020 22:45:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 176B4C124E
	for <dm-devel@redhat.com>; Thu,  2 Jan 2020 22:45:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99845802883
	for <dm-devel@redhat.com>; Thu,  2 Jan 2020 22:45:23 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-151-sp2aeNLWOlKI_ubm6uotKw-1; Thu, 02 Jan 2020 17:45:19 -0500
Received: from localhost (unknown [IPv6:2610:98:8005::147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: krisman)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C357C28AE2A;
	Thu,  2 Jan 2020 22:45:17 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com
Date: Thu,  2 Jan 2020 17:45:12 -0500
Message-Id: <20200102224512.3605010-1-krisman@collabora.com>
MIME-Version: 1.0
X-MC-Unique: sp2aeNLWOlKI_ubm6uotKw-1
X-MC-Unique: XFIP3ZUYMrqokYM8hvP1sQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 002MjQQ0024550
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 03 Jan 2020 05:11:38 -0500
Cc: snitzer@redhat.com, Bharath Ravi <rbharath@google.com>,
	Khazhismel Kumykov <khazhy@google.com>, dm-devel@redhat.com,
	Anatol Pomazau <anatol@google.com>,
	Gabriel Krisman Bertazi <krisman@collabora.com>,
	kernel@collabora.com, Frank Mayhar <fmayhar@google.com>
Subject: [dm-devel] [PATCH] dm mpath: Add timeout mechanism for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Anatol Pomazau <anatol@google.com>

Add a configurable timeout mechanism to disable queue_if_no_path without
assistance from multipathd.  In reality, this reimplements the
no_path_retry mechanism from multipathd in kernel space, which is
interesting for cases where we cannot rely on a daemon being present all
the time, in case of failure or to reduce the guest footprint of cloud
services.

Despite replicating the policy configuration on kernel space, it is
quite an important case to prevent IOs from hanging forever, waiting for
userspace to behave correctly.

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
 drivers/md/dm-mpath.c | 96 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 95 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index e0c32793c248..72ba7ae98458 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -91,6 +91,9 @@ struct multipath {
 
 	struct work_struct process_queued_bios;
 	struct bio_list queued_bios;
+
+	unsigned int nopath_timeout;	/* Timeout for queue_if_no_path */
+	struct timer_list nopath_timer;
 };
 
 /*
@@ -109,6 +112,11 @@ static void activate_or_offline_path(struct pgpath *pgpath);
 static void activate_path_work(struct work_struct *work);
 static void process_queued_bios(struct work_struct *work);
 
+static void handle_nopath_timeout(struct timer_list *t);
+static void enable_nopath_timeout(struct multipath *m);
+static int activate_nopath_timeout(struct multipath *m,
+				   unsigned int to, int enable);
+
 /*-----------------------------------------------
  * Multipath state flags.
  *-----------------------------------------------*/
@@ -195,6 +203,8 @@ static struct multipath *alloc_multipath(struct dm_target *ti)
 
 		m->ti = ti;
 		ti->private = m;
+
+		timer_setup(&m->nopath_timer, handle_nopath_timeout, 0);
 	}
 
 	return m;
@@ -1016,6 +1026,7 @@ static int parse_features(struct dm_arg_set *as, struct multipath *m)
 		{0, 8, "invalid number of feature args"},
 		{1, 50, "pg_init_retries must be between 1 and 50"},
 		{0, 60000, "pg_init_delay_msecs must be between 0 and 60000"},
+		{0, 600, "queue_if_no_path_timeout must be 0 or a timeout in seconds"},
 	};
 
 	r = dm_read_arg_group(_args, as, &argc, &ti->error);
@@ -1070,6 +1081,16 @@ static int parse_features(struct dm_arg_set *as, struct multipath *m)
 			continue;
 		}
 
+		if (!strcasecmp(arg_name, "queue_if_no_path_timeout") &&
+		    (argc >= 1)) {
+			unsigned int to;
+
+			r = dm_read_arg(_args+3, as, &to, &ti->error);
+			activate_nopath_timeout(m, to, 0);
+			argc--;
+			continue;
+		}
+
 		ti->error = "Unrecognised multipath feature request";
 		r = -EINVAL;
 	} while (argc && !r);
@@ -1090,6 +1111,7 @@ static int multipath_ctr(struct dm_target *ti, unsigned argc, char **argv)
 	struct dm_arg_set as;
 	unsigned pg_count = 0;
 	unsigned next_pg_num;
+	unsigned long flags;
 
 	as.argc = argc;
 	as.argv = argv;
@@ -1154,6 +1176,10 @@ static int multipath_ctr(struct dm_target *ti, unsigned argc, char **argv)
 		goto bad;
 	}
 
+	spin_lock_irqsave(&m->lock, flags);
+	enable_nopath_timeout(m);
+	spin_unlock_irqrestore(&m->lock, flags);
+
 	ti->num_flush_bios = 1;
 	ti->num_discard_bios = 1;
 	ti->num_write_same_bios = 1;
@@ -1208,10 +1234,26 @@ static void multipath_dtr(struct dm_target *ti)
 {
 	struct multipath *m = ti->private;
 
+	del_timer_sync(&m->nopath_timer);
+
 	flush_multipath_work(m);
 	free_multipath(m);
 }
 
+/*
+ * If the queue_if_no_path timeout fires, turn off queue_if_no_path and
+ * process any queued I/O.
+ */
+static void handle_nopath_timeout(struct timer_list *t)
+{
+	struct multipath *m = from_timer(m, t, nopath_timer);
+	struct mapped_device *md = dm_table_get_md((m)->ti->table);
+
+	DMWARN("queue_if_no_path timeout on %s", dm_device_name(md));
+
+	(void)queue_if_no_path(m, false, false);
+}
+
 /*
  * Take a path out of use.
  */
@@ -1241,6 +1283,8 @@ static int fail_path(struct pgpath *pgpath)
 
 	schedule_work(&m->trigger_event);
 
+	enable_nopath_timeout(m);
+
 out:
 	spin_unlock_irqrestore(&m->lock, flags);
 
@@ -1291,6 +1335,8 @@ static int reinstate_path(struct pgpath *pgpath)
 		process_queued_io_list(m);
 	}
 
+	del_timer_sync(&m->nopath_timer);
+
 	return r;
 }
 
@@ -1314,6 +1360,47 @@ static int action_dev(struct multipath *m, struct dm_dev *dev,
 	return r;
 }
 
+/*
+ * Enable the queue_if_no_path timeout if necessary.  Called with m->lock
+ * held.
+ */
+static void enable_nopath_timeout(struct multipath *m)
+{
+	if (atomic_read(&m->nr_valid_paths) == 0 && m->nopath_timeout > 0 &&
+	    test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags)) {
+		mod_timer(&m->nopath_timer, jiffies + m->nopath_timeout * HZ);
+	}
+}
+
+static int activate_nopath_timeout(struct multipath *m, unsigned int to,
+				   int enable)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&m->lock, flags);
+
+	m->nopath_timeout = to;
+	if (to && enable)
+		enable_nopath_timeout(m);
+
+	spin_unlock_irqrestore(&m->lock, flags);
+
+	if (!to)
+		del_timer_sync(&m->nopath_timer);
+	return 0;
+}
+
+static int set_nopath_timeout(struct multipath *m, const char *timestr)
+{
+	unsigned long to;
+
+	if (!timestr || (kstrtol(timestr, 10, &to) != 1)) {
+		DMWARN("invalid timeout supplied to %s", __func__);
+		return -EINVAL;
+	}
+	return activate_nopath_timeout(m, to, 1);
+}
+
 /*
  * Temporarily try to avoid having to use the specified PG
  */
@@ -1682,7 +1769,8 @@ static void multipath_status(struct dm_target *ti, status_type_t type,
 			      (m->pg_init_retries > 0) * 2 +
 			      (m->pg_init_delay_msecs != DM_PG_INIT_DELAY_DEFAULT) * 2 +
 			      test_bit(MPATHF_RETAIN_ATTACHED_HW_HANDLER, &m->flags) +
-			      (m->queue_mode != DM_TYPE_REQUEST_BASED) * 2);
+			      (m->queue_mode != DM_TYPE_REQUEST_BASED) * 2 +
+			      (m->nopath_timeout > 0) * 2);
 
 		if (test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags))
 			DMEMIT("queue_if_no_path ");
@@ -1702,6 +1790,9 @@ static void multipath_status(struct dm_target *ti, status_type_t type,
 				break;
 			}
 		}
+		if (m->nopath_timeout)
+			DMEMIT("queue_if_no_path_timeout %u ",
+			       m->nopath_timeout);
 	}
 
 	if (!m->hw_handler_name || type == STATUSTYPE_INFO)
@@ -1821,6 +1912,9 @@ static int multipath_message(struct dm_target *ti, unsigned argc, char **argv,
 	} else if (!strcasecmp(argv[0], "switch_group")) {
 		r = switch_pg_num(m, argv[1]);
 		goto out;
+	} else if (!strcasecmp(argv[0], "queue_if_no_path_timeout")) {
+		r = set_nopath_timeout(m, argv[1]);
+		goto out;
 	} else if (!strcasecmp(argv[0], "reinstate_path"))
 		action = reinstate_path;
 	else if (!strcasecmp(argv[0], "fail_path"))
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

