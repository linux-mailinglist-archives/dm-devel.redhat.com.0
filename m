Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 957D937FC6F
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 19:23:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620926637;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=A51yAflqaT9HeABK59H6mtWb7JHvaeBthx13IT50MbU=;
	b=DMOD4Z0rqrjnoaUqFcJVzlAnAls2/FeZll2cZxSwj/iPXzsiOrF7h3WVae52YBTZ2ZuIX6
	uhrSnkkREIMKPS+bQ3vvycZXXS5uoRJiahGxODV5dNzbL1iSsCGH0hiz0bjALVLaJZC5T7
	Eld73zZ80EefDdBUkrVf2ZiXy1oDtkA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-K_gg_E-CMM-OlXridAzdZg-1; Thu, 13 May 2021 13:23:55 -0400
X-MC-Unique: K_gg_E-CMM-OlXridAzdZg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF8B110AE5E4;
	Thu, 13 May 2021 17:23:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74BAC5D9DC;
	Thu, 13 May 2021 17:23:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EC87518005B6;
	Thu, 13 May 2021 17:23:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DHNM0P005628 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 13:23:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E11433AC0; Thu, 13 May 2021 17:23:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047F55D736;
	Thu, 13 May 2021 17:23:21 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DHNKUk012079; 
	Thu, 13 May 2021 12:23:20 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DHNKO0012078;
	Thu, 13 May 2021 12:23:20 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 13 May 2021 12:23:12 -0500
Message-Id: <1620926595-12029-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
References: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/6] multipathd: make ev_remove_path return
	success on path removal
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

When ev_remove_path() returns success, callers assume that the path (and
possibly the map) has been removed.  When ev_remove_path() returns
failure, callers assume that the path has not been removed. However, the
path could be removed on both success or failure. This could cause
callers to dereference the path after it was removed. Change
ev_remove_path() to return success whenever the path is removed, even if
the map was removed due to a failure when trying to reload it. Found by
coverity.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 6090434c..4bdf14bd 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1284,7 +1284,7 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 
 			strlcpy(devt, pp->dev_t, sizeof(devt));
 			if (setup_multipath(vecs, mpp))
-				return 1;
+				return 0;
 			/*
 			 * Successful map reload without this path:
 			 * sync_map_state() will free it.
@@ -1304,8 +1304,10 @@ out:
 	return retval;
 
 fail:
+	condlog(0, "%s: error removing path. removing map %s", pp->dev,
+		mpp->alias);
 	remove_map_and_stop_waiter(mpp, vecs);
-	return 1;
+	return 0;
 }
 
 static int
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

