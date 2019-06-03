Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2A63391C
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 21:31:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6DD493078AB3;
	Mon,  3 Jun 2019 19:31:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EA675D9D2;
	Mon,  3 Jun 2019 19:31:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8487D206D1;
	Mon,  3 Jun 2019 19:30:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53JTOoW029815 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 15:29:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A2D8760C9E; Mon,  3 Jun 2019 19:29:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E10460BFB;
	Mon,  3 Jun 2019 19:29:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x53JTHvt026432; 
	Mon, 3 Jun 2019 14:29:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x53JTGWD026431;
	Mon, 3 Jun 2019 14:29:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon,  3 Jun 2019 14:29:16 -0500
Message-Id: <1559590156-26394-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Hannes Reinecke <hare@suse.com>
Subject: [dm-devel] [PATCH] multipath: call store_pathinfo with DI_BLACKLIST
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 03 Jun 2019 19:31:45 +0000 (UTC)

Commit ca19f865f moved adding DI_BLACKLIST to the pathinfo flags out of
store_pathinfo(), but it didn't add it to all of the necessary callers.
Without this, store_pathinfo() callers can do unnecessary extra work,
including running the path checker on blacklisted devices. Also, running

multipathd add path <blacklisted_path_device>

will add a blacklisted path.

Fixes: ca19f865f "libmultipath: add 'cmd' as argument for get_refwwid()"
Cc: Hannes Reinecke <hare@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c  | 3 ++-
 multipathd/cli_handlers.c | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index b3dc60b1..e9411dfc 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -134,7 +134,8 @@ path_discover (vector pathvec, struct config * conf,
 		pp = find_path_by_devt(pathvec, devt);
 		if (!pp)
 			return store_pathinfo(pathvec, conf,
-					      udevice, flag, NULL);
+					      udevice, flag | DI_BLACKLIST,
+					      NULL);
 	}
 	return pathinfo(pp, conf, flag);
 }
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 60e17d68..4c32d953 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -730,7 +730,7 @@ cli_add_path (void * v, char ** reply, int * len, void * data)
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
 		r = store_pathinfo(vecs->pathvec, conf,
-				   udevice, DI_ALL, &pp);
+				   udevice, DI_ALL | DI_BLACKLIST, &pp);
 		pthread_cleanup_pop(1);
 		udev_device_unref(udevice);
 		if (!pp) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
