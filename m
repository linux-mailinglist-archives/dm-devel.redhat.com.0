Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 11CF822F8FC
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 21:25:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595877907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X9bOI5EpfZtVyA8njfBHpPBY9OSWrcobBC+5XKAY6v8=;
	b=IJx1AADbVoFpGAvaBI0s6blRyqwuytzc061Pa1ipfaWQNTjkBULYqX/inW207Ta5WFToHi
	WL0pthKIQvXdkchApMfrhFYYJBdUY+/PFbVC7vMkYms59HJ8l60LDQmxZCDyuBvVFM+ZCk
	9KLnLRIvPngGot8x/A6/GY7Flz3jZkM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-V3U2Z5y_MWS_uA_LC9jdUA-1; Mon, 27 Jul 2020 15:25:04 -0400
X-MC-Unique: V3U2Z5y_MWS_uA_LC9jdUA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24EF2100A690;
	Mon, 27 Jul 2020 19:24:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04F475C1B2;
	Mon, 27 Jul 2020 19:24:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AEC211809563;
	Mon, 27 Jul 2020 19:24:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJOb5b024693 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:24:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A48C71D0C; Mon, 27 Jul 2020 19:24:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1827B71D06;
	Mon, 27 Jul 2020 19:24:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RJOZBE005647; 
	Mon, 27 Jul 2020 14:24:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RJOZ1C005646;
	Mon, 27 Jul 2020 14:24:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 27 Jul 2020 14:24:26 -0500
Message-Id: <1595877868-5595-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/6] libmultipath: count pending paths as active
	on loads
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
index 3eac3d61..0d1f969d 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -491,6 +491,13 @@ int count_active_paths(const struct multipath *mpp)
 	return do_pathcount(mpp, states, 2);
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

