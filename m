Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED9D3DAE7F
	for <lists+dm-devel@lfdr.de>; Thu, 29 Jul 2021 23:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627595288;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=urtwKRT32rTB0xrAzVbKeVSVz8nUwykbJmHLsi9xQ7I=;
	b=WKyxut5dXdFSb0rMOTr5eQeV4V1ELlPzwNrM2md+FCgpGl80TLfMnyS1dEX5/aHFIl2rrU
	t2bCxvbD8hgMpDc9dwr7C8mxy2x9JDAw0w0k72TvGWtTqryjuSWb0FFTr+rBYKk0Uikw5S
	kWMGGhcstwQhzR6Oo3jOuaVLO+UjZWk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-STRLgscvODigX7jBQAPtsw-1; Thu, 29 Jul 2021 17:47:25 -0400
X-MC-Unique: STRLgscvODigX7jBQAPtsw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6D88190B2A9;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BAA8100760B;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23B944BB7C;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TLkGOk030920 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 17:46:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BCE1460875; Thu, 29 Jul 2021 21:46:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE640687D5;
	Thu, 29 Jul 2021 21:46:12 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16TLkBHR020030; 
	Thu, 29 Jul 2021 16:46:11 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16TLkBEq020029;
	Thu, 29 Jul 2021 16:46:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 29 Jul 2021 16:46:03 -0500
Message-Id: <1627595165-19980-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
References: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/5] multipath: print warning if multipathd is
	not running.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If multipath notices that multipath devices exist or were created, and
multipathd is not running, it now prints a warning message, so users are
notified of the issue.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c          | 13 +++++++++++--
 libmultipath/configure.h          |  1 +
 libmultipath/libmultipath.version |  5 +++++
 multipath/main.c                  |  5 +++++
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 12278640..0c00bf50 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1082,7 +1082,8 @@ deadmap (struct multipath * mpp)
 	return 1; /* dead */
 }
 
-int check_daemon(void)
+extern int
+check_daemon(void)
 {
 	int fd;
 	char *reply;
@@ -1137,6 +1138,8 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 	struct config *conf = NULL;
 	int allow_queueing;
 	struct bitfield *size_mismatch_seen;
+	bool map_processed = false;
+	bool no_daemon = false;
 
 	/* ignore refwwid if it's empty */
 	if (refwwid && !strlen(refwwid))
@@ -1288,7 +1291,9 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 		conf = get_multipath_config();
 		allow_queueing = conf->allow_queueing;
 		put_multipath_config(conf);
-		if (!is_daemon && !allow_queueing && !check_daemon()) {
+		if (!is_daemon && !allow_queueing &&
+		    (no_daemon || !check_daemon())) {
+			no_daemon = true;
 			if (mpp->no_path_retry != NO_PATH_RETRY_UNDEF &&
 			    mpp->no_path_retry != NO_PATH_RETRY_FAIL)
 				condlog(3, "%s: multipathd not running, unset "
@@ -1311,6 +1316,7 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 		else
 			remove_map(mpp, vecs->pathvec, vecs->mpvec,
 				   KEEP_VEC);
+		map_processed = true;
 	}
 	/*
 	 * Flush maps with only dead paths (ie not in sysfs)
@@ -1336,6 +1342,9 @@ int coalesce_paths (struct vectors *vecs, vector mpvec, char *refwwid,
 				condlog(2, "%s: remove (dead)", alias);
 		}
 	}
+	if (map_processed && !is_daemon && (no_daemon || !check_daemon()))
+		condlog(2, "multipath devices exist, but multipathd service is not running");
+
 	ret = CP_OK;
 out:
 	free(size_mismatch_seen);
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index 92a5aba6..efe18b7d 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -59,3 +59,4 @@ struct udev_device *get_udev_device(const char *dev, enum devtypes dev_type);
 void trigger_paths_udev_change(struct multipath *mpp, bool is_mpath);
 void trigger_partitions_udev_change(struct udev_device *dev, const char *action,
 				    int len);
+int check_daemon(void);
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 1d84d97c..7b48265f 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -285,3 +285,8 @@ global:
 	print_strbuf;
 	truncate_strbuf;
 } LIBMULTIPATH_8.0.0;
+
+LIBMULTIPATH_8.2.0 {
+global:
+	check_daemon;
+} LIBMULTIPATH_8.1.0;
diff --git a/multipath/main.c b/multipath/main.c
index 8fc0e15f..33377147 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -180,6 +180,7 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 	int i;
 	struct multipath * mpp;
 	int flags = (cmd == CMD_LIST_SHORT ? DI_NOIO : DI_ALL);
+	bool maps_present = false;
 
 	if (dm_get_maps(curmp))
 		return 1;
@@ -212,11 +213,15 @@ get_dm_mpvec (enum mpath_cmds cmd, vector curmp, vector pathvec, char * refwwid)
 
 		if (cmd == CMD_CREATE)
 			reinstate_paths(mpp);
+
+		maps_present = true;
 	}
 
 	if (cmd == CMD_LIST_SHORT || cmd == CMD_LIST_LONG)
 		print_foreign_topology(libmp_verbosity);
 
+	if (maps_present && !check_daemon())
+		condlog(2, "multipath devices exist, but multipathd service is not running");
 	return 0;
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

