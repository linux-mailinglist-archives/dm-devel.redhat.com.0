Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E088713AEF7
	for <lists+dm-devel@lfdr.de>; Tue, 14 Jan 2020 17:15:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579018552;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QzP3G7itjjHl5XJXCjHY6jkEdAlWCrpCsD0NqroPKRc=;
	b=eemEM3q3E1w5RsCQ4rC0xOll5aQfe33Xchm8j8u4tQGo4/jv8opjxqsMeczUD55LiNEIgk
	k22H7ohGbXlzxBVA6TZgZCYAuoH6KAvxwAATqidFJga49TSaJIKr+V/WmnIUV4XDmzyQbi
	8M7UT7Qxf81YmOXVreToRogvFKoOjks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-JoABfTz-ORWIOUdXIZWgJQ-1; Tue, 14 Jan 2020 11:15:50 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 330C08D6A75;
	Tue, 14 Jan 2020 16:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F3DF88876;
	Tue, 14 Jan 2020 16:15:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C87FC18089CD;
	Tue, 14 Jan 2020 16:15:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00EGFEUm020178 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Jan 2020 11:15:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9991A20316EC; Tue, 14 Jan 2020 16:15:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9344C20316E8
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 16:15:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 719B88032B2
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 16:15:10 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-413-zz1O5O_KOPm_S3g8Qur8ow-1; Tue, 14 Jan 2020 11:15:07 -0500
Received: by mail-qt1-f196.google.com with SMTP id d18so12901570qtj.10
	for <dm-devel@redhat.com>; Tue, 14 Jan 2020 08:15:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
	:references:mime-version:content-disposition:in-reply-to;
	bh=no+8rVIkCgB2Z8Sk7KqrUizLlBxEFc/kMsjYetvdUvM=;
	b=Vm4UtaySmD8y3y2Ho6HaOaAFWcLpxcYInnVHvFGpJbb5kPVzX2YWNNf3+wXa6OxoyB
	6T0NeWmBTfZreD+DJhbicz9JtGINnPCgbYl9oLhqGYAbzJT73b0Big/StVmQpGE2a5DF
	uIK77SdlB7qyIV/bYZtb8txfd4EOpxAMvaPf6hgQAGFCvqo0JApYsTGYw/FaKiZg9dR2
	WpwR0KEa/nsWO6/bb1OC/RAI2BGh/gdlAxVUCoKiqmDPAToW4qHPmXLPPoLrxhzfcMIn
	aGEdObuMBFXe6m2tuw1Cs1zi/L+dbf7rM75RTFl9Y3Uo26CMluygJgLe2RlRkORqvXKs
	DubQ==
X-Gm-Message-State: APjAAAXIcAX5AZu2TRYqPoi41D0/pf02I45b4o5stuNvTCTBrv5Fk8Fq
	Mi4Mz3B1IjO4Fh9Pc5GS5Kc=
X-Google-Smtp-Source: APXvYqxdwOszSsPs5EODo0oZARi3jIFGUD51EE5ZjcIP/GuhBpr2DV12iK4aIu9JTm8EV9N3F/iTTg==
X-Received: by 2002:aed:2fa1:: with SMTP id m30mr4116574qtd.211.1579018507248; 
	Tue, 14 Jan 2020 08:15:07 -0800 (PST)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id
	j15sm7563042qtn.37.2020.01.14.08.15.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 08:15:06 -0800 (PST)
Date: Tue, 14 Jan 2020 11:15:05 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <20200114161505.GA48507@lobo>
References: <20200113224127.3367484-1-krisman@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20200113224127.3367484-1-krisman@collabora.com>
X-MC-Unique: zz1O5O_KOPm_S3g8Qur8ow-1
X-MC-Unique: JoABfTz-ORWIOUdXIZWgJQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00EGFEUm020178
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kernel@collabora.com, khazhy@google.com
Subject: Re: [dm-devel] [PATCH v2] dm mpath: Add timeout mechanism for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jan 13 2020 at  5:41P -0500,
Gabriel Krisman Bertazi <krisman@collabora.com> wrote:

> From: Anatol Pomazau <anatol@google.com>
> 
> Add a configurable timeout mechanism to disable queue_if_no_path without
> assistance from multipathd.  In reality, this reimplements the
> no_path_retry mechanism from multipathd in kernel space, which is
> interesting to prevent processes from hanging indefinitely in cases
> where the daemon might be unable to respond, after a failure or for
> whatever reason.
> 
> Despite replicating the policy configuration on kernel space, it is
> quite an important case to prevent IOs from hanging forever, waiting for
> userspace to behave correctly.
> 
> v2:
>   - Use a module parameter instead of configuring per table
>   - Simplify code
> 
> Co-developed-by: Frank Mayhar <fmayhar@google.com>
> Signed-off-by: Frank Mayhar <fmayhar@google.com>
> Co-developed-by: Bharath Ravi <rbharath@google.com>
> Signed-off-by: Bharath Ravi <rbharath@google.com>
> Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
> Signed-off-by: Anatol Pomazau <anatol@google.com>
> Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
> Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>

All these tags seem rather excessive (especially in that you aren't cc
most of them on the submission).  Please review/scrub.  Just seems odd
that so many had a hand in this relatively small patch.

The Signed-off-by for anatol@google.com seems wrong, or did Anatol
shephard this patch at some point?  Or did you mean Reviewed-by?
Something else?

Anyway, if in the end you hold these tags to reflect the development
evolution of this patch then so be it ;)

I've reviewed the changes and found various things I felt were
worthwhile to modify.  Summary:

- included missing <linux/timer.h>
- added MODULE_PARM_DESC
- moved new functions to reduce needed forward declarations
- tweaked queue_if_no_path_timeout_work's DMWARN message
- added lockdep_assert_held to enable_nopath_timeout
- renamed static queue_if_no_path_timeout to queue_if_no_path_timeout_secs
- use READ_ONCE when accessing queue_if_no_path_timeout_secs

Think that was it.

Please review/apply//test and if you're OK with the end result I'll
get it staged for 5.6 inclusion.

Thanks,
Mike


diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index b09e3f925f47..2bc18c9c3abc 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -20,6 +20,7 @@
 #include <linux/pagemap.h>
 #include <linux/slab.h>
 #include <linux/time.h>
+#include <linux/timer.h>
 #include <linux/workqueue.h>
 #include <linux/delay.h>
 #include <scsi/scsi_dh.h>
@@ -31,6 +32,8 @@
 #define DM_PG_INIT_DELAY_DEFAULT ((unsigned) -1)
 #define QUEUE_IF_NO_PATH_TIMEOUT_DEFAULT 0
 
+static unsigned long queue_if_no_path_timeout_secs = QUEUE_IF_NO_PATH_TIMEOUT_DEFAULT;
+
 /* Path properties */
 struct pgpath {
 	struct list_head list;
@@ -104,10 +107,6 @@ struct dm_mpath_io {
 	size_t nr_bytes;
 };
 
-static unsigned long queue_if_no_path_timeout = QUEUE_IF_NO_PATH_TIMEOUT_DEFAULT;
-module_param_named(queue_if_no_path_timeout_secs,
-                  queue_if_no_path_timeout, ulong, 0644);
-
 typedef int (*action_fn) (struct pgpath *pgpath);
 
 static struct workqueue_struct *kmultipathd, *kmpath_handlerd;
@@ -115,10 +114,7 @@ static void trigger_event(struct work_struct *work);
 static void activate_or_offline_path(struct pgpath *pgpath);
 static void activate_path_work(struct work_struct *work);
 static void process_queued_bios(struct work_struct *work);
-
 static void queue_if_no_path_timeout_work(struct timer_list *t);
-static void enable_nopath_timeout(struct multipath *m);
-static void disable_nopath_timeout(struct multipath *m);
 
 /*-----------------------------------------------
  * Multipath state flags.
@@ -730,6 +726,43 @@ static int queue_if_no_path(struct multipath *m, bool queue_if_no_path,
 	return 0;
 }
 
+/*
+ * If the queue_if_no_path timeout fires, turn off queue_if_no_path and
+ * process any queued I/O.
+ */
+static void queue_if_no_path_timeout_work(struct timer_list *t)
+{
+	struct multipath *m = from_timer(m, t, nopath_timer);
+	struct mapped_device *md = dm_table_get_md(m->ti->table);
+
+	DMWARN("queue_if_no_path timeout on %s, failing queued IO", dm_device_name(md));
+	queue_if_no_path(m, false, false);
+}
+
+/*
+ * Enable the queue_if_no_path timeout if necessary.
+ * Called with m->lock held.
+ */
+static void enable_nopath_timeout(struct multipath *m)
+{
+	unsigned long queue_if_no_path_timeout =
+		READ_ONCE(queue_if_no_path_timeout_secs) * HZ;
+
+	lockdep_assert_held(&m->lock);
+
+	if (queue_if_no_path_timeout > 0 &&
+	    atomic_read(&m->nr_valid_paths) == 0 &&
+	    test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags)) {
+		mod_timer(&m->nopath_timer,
+			  jiffies + queue_if_no_path_timeout);
+	}
+}
+
+static void disable_nopath_timeout(struct multipath *m)
+{
+	del_timer_sync(&m->nopath_timer);
+}
+
 /*
  * An event is triggered whenever a path is taken out of use.
  * Includes path failure and PG bypass.
@@ -1231,20 +1264,6 @@ static void multipath_dtr(struct dm_target *ti)
 	free_multipath(m);
 }
 
-/*
- * If the queue_if_no_path timeout fires, turn off queue_if_no_path and
- * process any queued I/O.
- */
-static void queue_if_no_path_timeout_work(struct timer_list *t)
-{
-	struct multipath *m = from_timer(m, t, nopath_timer);
-	struct mapped_device *md = dm_table_get_md((m)->ti->table);
-
-	DMWARN("queue_if_no_path timeout on %s", dm_device_name(md));
-
-	queue_if_no_path(m, false, false);
-}
-
 /*
  * Take a path out of use.
  */
@@ -1352,25 +1371,6 @@ static int action_dev(struct multipath *m, struct dm_dev *dev,
 	return r;
 }
 
-/*
- * Enable the queue_if_no_path timeout if necessary.  Called with m->lock
- * held.
- */
-static void enable_nopath_timeout(struct multipath *m)
-{
-	if (queue_if_no_path_timeout > 0 &&
-	    atomic_read(&m->nr_valid_paths) == 0 &&
-	    test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags)) {
-		mod_timer(&m->nopath_timer,
-			  jiffies + queue_if_no_path_timeout * HZ);
-	}
-}
-
-static void disable_nopath_timeout(struct multipath *m)
-{
-	del_timer_sync(&m->nopath_timer);
-}
-
 /*
  * Temporarily try to avoid having to use the specified PG
  */
@@ -2127,6 +2127,10 @@ static void __exit dm_multipath_exit(void)
 module_init(dm_multipath_init);
 module_exit(dm_multipath_exit);
 
+module_param_named(queue_if_no_path_timeout_secs,
+		   queue_if_no_path_timeout_secs, ulong, S_IRUGO | S_IWUSR);
+MODULE_PARM_DESC(queue_if_no_path_timeout_secs, "No available paths queue IO timeout in seconds");
+
 MODULE_DESCRIPTION(DM_NAME " multipath target");
 MODULE_AUTHOR("Sistina Software <dm-devel@redhat.com>");
 MODULE_LICENSE("GPL");


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

