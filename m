Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF50163D3F
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:50:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095018;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qoTLrIttXpFQS/PwLJMk/yFOhIOJEabK3jXWRdaD9e8=;
	b=bAE5pVjrOFhyGdzn3OslgsNeQGzheJnofywXo0Z90/fgi8RYQKyuVigoEpw3C2Pxa4+sN1
	qxl6WYLjUTsRTuOmm07b1xkgyhgilB6YE2GACZQkax340NO9IA5tReAyRFL9axDaVuHX9p
	F6nWHHXv5TMMaguR73r9wf2FXnXJH3E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-s3-K43ibPdiqbUJ_25pSRg-1; Wed, 19 Feb 2020 01:49:37 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3F36107ACCC;
	Wed, 19 Feb 2020 06:49:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DFE38B56F;
	Wed, 19 Feb 2020 06:49:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 332651800B6C;
	Wed, 19 Feb 2020 06:49:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6n25f015938 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:49:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 614DA60C87; Wed, 19 Feb 2020 06:49:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49F8460C84;
	Wed, 19 Feb 2020 06:49:02 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6n0iD009969; 
	Wed, 19 Feb 2020 00:49:01 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6n0ed009968;
	Wed, 19 Feb 2020 00:49:00 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:34 -0600
Message-Id: <1582094920-9883-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 12/18] multipathd: add new paths under vecs
	lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: s3-K43ibPdiqbUJ_25pSRg-1
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

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index a590ba8d..e607acf3 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -872,9 +872,8 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
 			}
 		}
 	}
-	lock_cleanup_pop(vecs->lock);
 	if (pp)
-		return ret;
+		goto out;
 
 	/*
 	 * get path vital state
@@ -886,13 +885,13 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
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
@@ -906,6 +905,7 @@ uev_add_path (struct uevent *uev, struct vectors * vecs, int need_do_map)
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

