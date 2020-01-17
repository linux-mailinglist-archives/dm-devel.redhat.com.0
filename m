Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 76A9C1401CE
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:20:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/pdTYT639vK+eh0ZOVQ/ldvoac320rL7VbILbZBuouw=;
	b=Cu3RBsyoaBk1tiy3IWuAoAw6iXPaC9xMLyml8Z8N6jL+xRq/GgmRlBVRyuOgX2MppUSHNk
	DiNN2qIrwuCUyB0RygrnpfSgmTbI+se0bXNbZvmYU2GcL3aKpWpwpitR2Yu2/w4CYYMVYe
	gE6AFtc4Dwz3+3XWjelletWI+PYvAxY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-V3MK1Zg6OZSaAwYVzeTuTg-1; Thu, 16 Jan 2020 21:19:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BE8D800D4C;
	Fri, 17 Jan 2020 02:19:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D386C5D9C9;
	Fri, 17 Jan 2020 02:19:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 727AB18089D7;
	Fri, 17 Jan 2020 02:19:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IkdE030742 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8B4C284324; Fri, 17 Jan 2020 02:18:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 297B89A84;
	Fri, 17 Jan 2020 02:18:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IgaK017285; 
	Thu, 16 Jan 2020 20:18:42 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IerC017284;
	Thu, 16 Jan 2020 20:18:40 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:17 -0600
Message-Id: <1579227500-17196-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 12/15] multipathd: add new paths under vecs lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: V3MK1Zg6OZSaAwYVzeTuTg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Right now, multipathd only ever calls pathinfo on a path outside of the
vecs lock in one circumstance, when it's adding a new path from a
uevent. Doing this can cause weirdness or crash multipathd.

First off, the path checker code is written assuming that only one
checker instance will be active at a time.  If this isn't the case, two
processes can modify the checker's refcounts at the same time,
potentially causing a checker to get removed while still in use (if two
threads try to increment the refcount at the same time, causing it to
only increment once).

Another issue is that since the vecs lock isn't grabbed until after all
of the pathinfo is gathered, and the vecs lock is the only thing keeping
the uevent servicing thread from running at the same time as a
reconfigure is happening, it is possible to have multipathd add a path
using the old config after reconfigure has already added that path using
the new config. Leading to two versions of the path on the pathvec.
There are possibly other issues with running pathinfo outside of the
vecs lock that I haven't noticed, as well.

The easiest solution is to call pathinfo on the path while holding the
vecs lock, to keep other threads from modifying the checker structure or
the config while setting up the path. This is what happens every other
time multipathd calls pathinfo, including when a path is added through
the multipathd command interface.

This does mean that any time spent calling pathinfo on new paths will
block other threads that need the vecs lock, but since the checker is
now always called in async mode, and the prio function will use a
short timeout if called on a failed path, this shouldn't be any more
noticeable than the calls to check_path() for already existing paths.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 7b364cfe..9e01cfaa 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -906,9 +906,8 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 			}
 		}
 	}
-	lock_cleanup_pop(vecs->lock);
 	if (pp)
-		return ret;
+		goto out;
 
 	/*
 	 * get path vital state
@@ -920,13 +919,13 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 	pthread_cleanup_pop(1);
 	if (!pp) {
 		if (ret == PATHINFO_SKIPPED)
-			return 0;
-		condlog(3, "%s: failed to get path info", uev->kernel);
-		return 1;
+			ret = 0;
+		else {
+			condlog(3, "%s: failed to get path info", uev->kernel);
+			ret = 1;
+		}
+		goto out;
 	}
-	pthread_cleanup_push(cleanup_lock, &vecs->lock);
-	lock(&vecs->lock);
-	pthread_testcancel();
 	ret = store_path(vecs->pathvec, pp);
 	if (!ret) {
 		conf = get_multipath_config();
@@ -940,6 +939,7 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 		free_path(pp);
 		ret = 1;
 	}
+out:
 	lock_cleanup_pop(vecs->lock);
 	return ret;
 }
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

