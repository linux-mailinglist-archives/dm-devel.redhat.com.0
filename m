Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D65BC20A6F0
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 22:42:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593117766;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=AlGmYb2YAu/XZ2mRxGYvhqLbFhlYxY95Rvytw2wMI6E=;
	b=Yq6CjCaNyONCUWAcoyiPsjGU/NQ9pAH/T824R9Wt4LDz0QJmmYawzUQAYE/Y1biAc042xb
	SB6zo3gWjs/2CXaxOdfgPf/DTLVhED7wq+tuCfPuGXCUIujjP8LlRjVlQECxw2R33kzz9I
	t7xYrKamIoYe6D9dm7tLf8cnxuqA1gc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-aHH1UyeiMy6BDkGcpC28WA-1; Thu, 25 Jun 2020 16:42:44 -0400
X-MC-Unique: aHH1UyeiMy6BDkGcpC28WA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD8F68064AD;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCFD71A90F;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8089A875A3;
	Thu, 25 Jun 2020 20:42:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05PKgVck014044 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 16:42:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0948660C80; Thu, 25 Jun 2020 20:42:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3101E60E1C;
	Thu, 25 Jun 2020 20:42:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05PKgQW2028804; 
	Thu, 25 Jun 2020 15:42:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05PKgQVC028803;
	Thu, 25 Jun 2020 15:42:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Jun 2020 15:42:18 -0500
Message-Id: <1593117741-28750-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
References: <1593117741-28750-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/7] multipathd: add "del maps" multipathd
	command
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
index b799634a..899c24d2 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1005,7 +1005,7 @@ dm_flush_map_nopaths(const char * mapname, int deferred_remove)
 
 #endif
 
-int dm_flush_maps (int retries)
+int dm_flush_maps (int need_suspend, int retries)
 {
 	int r = 1;
 	struct dm_task *dmt;
@@ -1028,7 +1028,10 @@ int dm_flush_maps (int retries)
 
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
index 5b18bf4b..2c5b1f56 100644
--- a/libmultipath/devmapper.h
+++ b/libmultipath/devmapper.h
@@ -57,7 +57,7 @@ int dm_flush_map_nopaths(const char * mapname, int deferred_remove);
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
index 22bc4363..104dbe7a 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -635,7 +635,7 @@ sync_maps_state(vector mpvec)
 		sync_map_state(mpp);
 }
 
-static int
+int
 flush_map(struct multipath * mpp, struct vectors * vecs, int nopaths)
 {
 	int r;
@@ -1555,6 +1555,7 @@ uxlsnrloop (void * ap)
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

