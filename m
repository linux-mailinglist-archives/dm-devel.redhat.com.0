Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id CE13A242239
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:01:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183269;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uPrhcUdYuZ22Vs/plOmZH7OJhnreiQjRtUThzyFhSSE=;
	b=B5PxH9VetVFAeiCEZlOmiZOjBwDtspA/V4wV5pUSjDdLNXyQ7CqeqcKBT+13D6koonIDM9
	5192LZ2GI+eEwOY0X7/cYyDqsv9eOiai3caRn7znjvmLY6/2WTD4aSyW6crxpccvi/I9AG
	ONXxiK2d9tj4cCVCnMDX0VCrlXHdgbk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-dnc_D0PbPMapkf-COQ0ZoA-1; Tue, 11 Aug 2020 18:01:06 -0400
X-MC-Unique: dnc_D0PbPMapkf-COQ0ZoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11691106B20B;
	Tue, 11 Aug 2020 22:01:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBCDC1EA;
	Tue, 11 Aug 2020 22:01:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B0C41809554;
	Tue, 11 Aug 2020 22:01:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwri7009163 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AF6F45D9DD; Tue, 11 Aug 2020 21:58:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDE635D9D7;
	Tue, 11 Aug 2020 21:58:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwnSq015851; 
	Tue, 11 Aug 2020 16:58:49 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwn2o015850;
	Tue, 11 Aug 2020 16:58:49 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:39 -0500
Message-Id: <1597183123-15797-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/8] libmultipath: count pending paths as
	active on loads
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When multipath loads a table, it signals to udev if there are no active
paths.  Multipath wasn't counting pending paths as active.  This meant
that if all the paths were pending, udev would treat the device as not
ready, and not run kpartx on it.  Even if the pending paths later
because active and were reinstated, the kernel would not send a new
uevent, because from its point of view, they were always up.

The alternative would be to continue to treat them as failed in the udev
rules, but then also tell the kernel that they were down, so that it
would trigger a uevent when they were reinstated. However, this could
lead to newly created multipath devices failing IO, simply because the
path checkers hadn't returned yet. Having udev assume that the the
device is up, like the kernel does, seems like the safer option.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 3 ++-
 libmultipath/structs.c   | 7 +++++++
 libmultipath/structs.h   | 1 +
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index f597ff8b..126cd728 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -417,7 +417,8 @@ static uint16_t build_udev_flags(const struct multipath *mpp, int reload)
 	/* DM_UDEV_DISABLE_LIBRARY_FALLBACK is added in dm_addmap */
 	return	(mpp->skip_kpartx == SKIP_KPARTX_ON ?
 		 MPATH_UDEV_NO_KPARTX_FLAG : 0) |
-		((count_active_paths(mpp) == 0 || mpp->ghost_delay_tick > 0) ?
+		((count_active_pending_paths(mpp) == 0 ||
+		  mpp->ghost_delay_tick > 0) ?
 		 MPATH_UDEV_NO_PATHS_FLAG : 0) |
 		(reload && !mpp->force_udev_reload ?
 		 MPATH_UDEV_RELOAD_FLAG : 0);
diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index 90874559..010deb47 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -503,6 +503,13 @@ int count_active_paths(const struct multipath *mpp)
 	return count;
 }
 
+int count_active_pending_paths(const struct multipath *mpp)
+{
+	int states[] = {PATH_UP, PATH_GHOST, PATH_PENDING};
+
+	return do_pathcount(mpp, states, 3);
+}
+
 int pathcmp(const struct pathgroup *pgp, const struct pathgroup *cpgp)
 {
 	int i, j;
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 0c03e711..917e4083 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -448,6 +448,7 @@ struct path * first_path (const struct multipath *mpp);
 
 int pathcount (const struct multipath *, int);
 int count_active_paths(const struct multipath *);
+int count_active_pending_paths(const struct multipath *);
 int pathcmp (const struct pathgroup *, const struct pathgroup *);
 int add_feature (char **, const char *);
 int remove_feature (char **, const char *);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

