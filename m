Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id EA1921FDA34
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wxasVJpGIvJr8tZ3HABmc3occagERsH4icTuicPRkvY=;
	b=EY1s/58lsppuJBlotNVvw2PXrnvMTweIE6yR7YgJM3XJGr1Y1jF9hlfptdEd0ny6uK74Dz
	5WZBKkwypbvkbjJe4WDyPSn3EoL5u7OypUOTtWQWS+Xq+G/7Ff78n2wnc5Wo+Ukgjiza5u
	SG1a/sPN47671Ow9WLtBsAOagGiKk4Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-XtowiisuPHuECiZnMmkWmQ-1; Wed, 17 Jun 2020 20:25:09 -0400
X-MC-Unique: XtowiisuPHuECiZnMmkWmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0803C184D149;
	Thu, 18 Jun 2020 00:25:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBCDD5C1D6;
	Thu, 18 Jun 2020 00:25:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9070C833B1;
	Thu, 18 Jun 2020 00:25:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0ObEb026523 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 79E2A5C220; Thu, 18 Jun 2020 00:24:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE8DA5C1D6;
	Thu, 18 Jun 2020 00:24:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OXKd018481; 
	Wed, 17 Jun 2020 19:24:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OW1a018480;
	Wed, 17 Jun 2020 19:24:32 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:24 -0500
Message-Id: <1592439867-18427-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/7] multipathd: add "del maps" multipathd command
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This will flush all multipath devices.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c  |  7 +++++--
 libmultipath/devmapper.h  |  2 +-
 multipath/main.c          |  2 +-
 multipathd/cli.c          |  1 +
 multipathd/cli_handlers.c | 19 +++++++++++++++++++
 multipathd/cli_handlers.h |  1 +
 multipathd/main.c         |  3 ++-
 multipathd/main.h         |  1 +
 8 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 682c0038..a5e0d298 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -991,7 +991,7 @@ dm_flush_map_nopaths(const char * mapname, int deferred_remove)
 
 #endif
 
-int dm_flush_maps (int retries)
+int dm_flush_maps (int need_suspend, int retries)
 {
 	int r = 1;
 	struct dm_task *dmt;
@@ -1014,7 +1014,10 @@ int dm_flush_maps (int retries)
 
 	r = 0;
 	do {
-		r |= dm_suspend_and_flush_map(names->name, retries);
+		if (need_suspend)
+			r |= dm_suspend_and_flush_map(names->name, retries);
+		else
+			r |= dm_flush_map(names->name);
 		next = names->next;
 		names = (void *) names + next;
 	} while (next);
diff --git a/libmultipath/devmapper.h b/libmultipath/devmapper.h
index 79c9afb2..adf89342 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -51,7 +51,7 @@ int dm_flush_map_nopaths(const char * mapname, int deferred_remove);
 #define dm_suspend_and_flush_map(mapname, retries) \
 	_dm_flush_map(mapname, 1, 0, 1, retries)
 int dm_cancel_deferred_remove(struct multipath *mpp);
-int dm_flush_maps (int retries);
+int dm_flush_maps (int need_suspend, int retries);
 int dm_fail_path(const char * mapname, char * path);
 int dm_reinstate_path(const char * mapname, char * path);
 int dm_queue_if_no_path(const char *mapname, int enable);
diff --git a/multipath/main.c b/multipath/main.c
index c4740fab..d89f0a91 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1096,7 +1096,7 @@ main (int argc, char *argv[])
 		goto out;
 	}
 	else if (conf->remove == FLUSH_ALL) {
-		r = dm_flush_maps(retries) ? RTVL_FAIL : RTVL_OK;
+		r = dm_flush_maps(1, retries) ? RTVL_FAIL : RTVL_OK;
 		goto out;
 	}
 	while ((r = configure(conf, cmd, dev_type, dev)) == RTVL_RETRY)
diff --git a/multipathd/cli.c b/multipathd/cli.c
index 800c0fbe..bdc9fb10 100644
--- a/multipathd/cli.c
+++ b/multipathd/cli.c
@@ -568,6 +568,7 @@ cli_init (void) {
 	add_handler(DEL+PATH, NULL);
 	add_handler(ADD+MAP, NULL);
 	add_handler(DEL+MAP, NULL);
+	add_handler(DEL+MAPS, NULL);
 	add_handler(SWITCH+MAP+GROUP, NULL);
 	add_handler(RECONFIGURE, NULL);
 	add_handler(SUSPEND+MAP, NULL);
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 31c3d9fd..782bb003 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -852,6 +852,25 @@ cli_del_map (void * v, char ** reply, int * len, void * data)
 	return rc;
 }
 
+int
+cli_del_maps (void *v, char **reply, int *len, void *data)
+{
+	struct vectors * vecs = (struct vectors *)data;
+	struct multipath *mpp;
+	int i, ret = 0;
+
+	condlog(2, "remove maps (operator)");
+	vector_foreach_slot(vecs->mpvec, mpp, i) {
+		if (flush_map(mpp, vecs, 0))
+			ret++;
+		else
+			i--;
+	}
+	/* flush any multipath maps that aren't currently known by multipathd */
+	ret |= dm_flush_maps(0, 0);
+	return ret;
+}
+
 int
 cli_reload(void *v, char **reply, int *len, void *data)
 {
diff --git a/multipathd/cli_handlers.h b/multipathd/cli_handlers.h
index 0f451064..6f57b429 100644
--- a/multipathd/cli_handlers.h
+++ b/multipathd/cli_handlers.h
@@ -26,6 +26,7 @@ int cli_add_path (void * v, char ** reply, int * len, void * data);
 int cli_del_path (void * v, char ** reply, int * len, void * data);
 int cli_add_map (void * v, char ** reply, int * len, void * data);
 int cli_del_map (void * v, char ** reply, int * len, void * data);
+int cli_del_maps (void * v, char ** reply, int * len, void * data);
 int cli_switch_group(void * v, char ** reply, int * len, void * data);
 int cli_reconfigure(void * v, char ** reply, int * len, void * data);
 int cli_resize(void * v, char ** reply, int * len, void * data);
diff --git a/multipathd/main.c b/multipathd/main.c
index 8fb73922..8f055646 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -631,7 +631,7 @@ sync_maps_state(vector mpvec)
 		sync_map_state(mpp);
 }
 
-static int
+int
 flush_map(struct multipath * mpp, struct vectors * vecs, int nopaths)
 {
 	int r;
@@ -1551,6 +1551,7 @@ uxlsnrloop (void * ap)
 	set_handler_callback(DEL+PATH, cli_del_path);
 	set_handler_callback(ADD+MAP, cli_add_map);
 	set_handler_callback(DEL+MAP, cli_del_map);
+	set_handler_callback(DEL+MAPS, cli_del_maps);
 	set_handler_callback(SWITCH+MAP+GROUP, cli_switch_group);
 	set_unlocked_handler_callback(RECONFIGURE, cli_reconfigure);
 	set_handler_callback(SUSPEND+MAP, cli_suspend);
diff --git a/multipathd/main.h b/multipathd/main.h
index 7bb8463f..5dff17e5 100644
--- a/multipathd/main.h
+++ b/multipathd/main.h
@@ -28,6 +28,7 @@ int ev_add_path (struct path *, struct vectors *, int);
 int ev_remove_path (struct path *, struct vectors *, int);
 int ev_add_map (char *, const char *, struct vectors *);
 int ev_remove_map (char *, char *, int, struct vectors *);
+int flush_map(struct multipath *, struct vectors *, int);
 int set_config_state(enum daemon_status);
 void * mpath_alloc_prin_response(int prin_sa);
 int prin_do_scsi_ioctl(char *, int rq_servact, struct prin_resp * resp,
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

