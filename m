Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DA88E454F3C
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 22:22:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637184119;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0CGVz9sGDbWJrSzPRC+55hnIUxAtjl48m/QTZePfCYI=;
	b=OE3wqee8s3eWHDHd/FgYsIjtKAxXjio5N/QBA3pPYerJyR8twThM8p6+BBv0l7T5JhBWrm
	zHw+8sQ+XvFAtHtIac7TZ6PYEwQwxwZv8V8haqdUQWy8RK844PhvW6uo3Vlp9k9n6CquVE
	TVgfBx3dx0Q0Wf64l4o6PLeFvgH2BSA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-P3GPpdhXOgyoyrmM4tZubg-1; Wed, 17 Nov 2021 16:21:58 -0500
X-MC-Unique: P3GPpdhXOgyoyrmM4tZubg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1AE415729;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E3DB5DEFA;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 455D8181A1CF;
	Wed, 17 Nov 2021 21:21:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHLLYS6025260 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 16:21:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id ECED25C22B; Wed, 17 Nov 2021 21:21:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7E085C1BB;
	Wed, 17 Nov 2021 21:21:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHLLXsu004943; 
	Wed, 17 Nov 2021 15:21:33 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHLLWe0004942;
	Wed, 17 Nov 2021 15:21:32 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Nov 2021 15:21:21 -0600
Message-Id: <1637184084-4882-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
References: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/9] multipathd: retrigger uevent for partial
	paths
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a partial path appears and is not fully initialized within
180 seconds, trigger a uevent. If the udev device is not initialized
trigger an add event. Otherwise, trigger a change event.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/libmultipath.version |  2 +-
 libmultipath/structs.h            |  1 +
 libmultipath/structs_vec.c        |  1 +
 multipathd/main.c                 | 20 ++++++++++++++++++++
 4 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 6473091d..58a7d1be 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -31,7 +31,7 @@
  *   The new version inherits the previous ones.
  */
 
-LIBMULTIPATH_10.0.0 {
+LIBMULTIPATH_11.0.0 {
 global:
 	/* symbols referenced by multipath and multipathd */
 	add_foreign;
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 69409fd4..c21d1eda 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -318,6 +318,7 @@ struct path {
 	int fd;
 	int initialized;
 	int retriggers;
+	int partial_retrigger_delay;
 	unsigned int path_failures;
 	time_t dis_reinstate_time;
 	int disable_reinstate;
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 1de9175e..9b6407bd 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -195,6 +195,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 					condlog(2, "%s: adding new path %s",
 						mpp->alias, pp->dev);
 					pp->initialized = INIT_PARTIAL;
+					pp->partial_retrigger_delay = 180;
 					store_path(pathvec, pp);
 					pp->tick = 1;
 				}
diff --git a/multipathd/main.c b/multipathd/main.c
index 8f6be6b9..b0037721 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1948,6 +1948,25 @@ retry_count_tick(vector mpvec)
 	}
 }
 
+static void
+partial_retrigger_tick(vector pathvec)
+{
+	struct path *pp;
+	unsigned int i;
+
+	vector_foreach_slot (pathvec, pp, i) {
+		if (pp->initialized == INIT_PARTIAL && pp->udev &&
+		    pp->partial_retrigger_delay > 0 &&
+		    --pp->partial_retrigger_delay == 0) {
+			const char *msg = udev_device_get_is_initialized(pp->udev) ?
+					  "change" : "add";
+
+			sysfs_attr_set_value(pp->udev, "uevent", msg,
+					     strlen(msg));
+		}
+	}
+}
+
 int update_prio(struct path *pp, int refresh_all)
 {
 	int oldpriority;
@@ -2566,6 +2585,7 @@ checkerloop (void *ap)
 		retry_count_tick(vecs->mpvec);
 		missing_uev_wait_tick(vecs);
 		ghost_delay_tick(vecs);
+		partial_retrigger_tick(vecs->pathvec);
 		lock_cleanup_pop(vecs->lock);
 
 		if (count)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

