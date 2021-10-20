Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A704353B2
	for <lists+dm-devel@lfdr.de>; Wed, 20 Oct 2021 21:19:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634757555;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ilqgmie6cPDcHvl9Ke2OIbc1mcMcojW7h90AO5SJVUA=;
	b=RzeYLA+erDYvM8EWX25AdGBdNUn1M2RG18uLCpFfO+idu/U+0eE4DPBcYxADcHZYyE5muh
	o8Biab7XGo6Xy4Bh7SJHYCXuNHz6m2djA2rR6AoTHOUz4WMRbzxnMb2GsoGY7t0C0ZHQvq
	BBWczWpq1YW79Gjc1lDWcS/+vbMns5U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-kbDZHr2EPL6x3EXxw6RIVQ-1; Wed, 20 Oct 2021 15:19:13 -0400
X-MC-Unique: kbDZHr2EPL6x3EXxw6RIVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2CE41927802;
	Wed, 20 Oct 2021 19:19:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AF2962A41;
	Wed, 20 Oct 2021 19:19:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B1604E58F;
	Wed, 20 Oct 2021 19:18:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJFSCl000596 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:15:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F13495F4E0; Wed, 20 Oct 2021 19:15:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC2E5D6D7;
	Wed, 20 Oct 2021 19:15:28 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 19KJFR6B006065; 
	Wed, 20 Oct 2021 14:15:27 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 19KJFQBP006064;
	Wed, 20 Oct 2021 14:15:26 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 20 Oct 2021 14:15:18 -0500
Message-Id: <1634757322-6015-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
References: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/7] libmultipath: don't use fallback wwid in
	update_pathvec_from_dm
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When new paths are added in update_pathvec_from_dm(). If they can't get
their regular wwid, they shouldn't try the getting the fallback wwid,
and should just copy the wwid of the multipath device.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c   | 7 ++++---
 libmultipath/discovery.h   | 2 ++
 libmultipath/structs_vec.c | 3 +--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index f25fe9e3..5edf9593 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2363,15 +2363,16 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 	}
 
 	if ((mask & DI_WWID) && !strlen(pp->wwid)) {
-		get_uid(pp, path_state, pp->udev,
-			(pp->retriggers >= conf->retrigger_tries));
+		int allow_fallback = ((mask & DI_NOFALLBACK) == 0 &&
+				      pp->retriggers >= conf->retrigger_tries);
+		get_uid(pp, path_state, pp->udev, allow_fallback);
 		if (!strlen(pp->wwid)) {
 			if (pp->bus == SYSFS_BUS_UNDEF)
 				return PATHINFO_SKIPPED;
 			if (pp->initialized != INIT_FAILED) {
 				pp->initialized = INIT_MISSING_UDEV;
 				pp->tick = conf->retrigger_delay;
-			} else if (pp->retriggers >= conf->retrigger_tries &&
+			} else if (allow_fallback &&
 				   (pp->state == PATH_UP || pp->state == PATH_GHOST)) {
 				/*
 				 * We have failed to read udev info for this path
diff --git a/libmultipath/discovery.h b/libmultipath/discovery.h
index a5446b4d..095657bb 100644
--- a/libmultipath/discovery.h
+++ b/libmultipath/discovery.h
@@ -70,6 +70,7 @@ enum discovery_mode {
 	__DI_WWID,
 	__DI_BLACKLIST,
 	__DI_NOIO,
+	__DI_NOFALLBACK,
 };
 
 #define DI_SYSFS	(1 << __DI_SYSFS)
@@ -79,6 +80,7 @@ enum discovery_mode {
 #define DI_WWID		(1 << __DI_WWID)
 #define DI_BLACKLIST	(1 << __DI_BLACKLIST)
 #define DI_NOIO		(1 << __DI_NOIO) /* Avoid IO on the device */
+#define DI_NOFALLBACK	(1 << __DI_NOFALLBACK) /* do not allow wwid fallback */
 
 #define DI_ALL		(DI_SYSFS  | DI_SERIAL | DI_CHECKER | DI_PRIO | \
 			 DI_WWID)
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 4d56107a..d363e7f6 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -182,8 +182,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 							     conf);
 					pp->checkint = conf->checkint;
 					rc = pathinfo(pp, conf,
-						      DI_SYSFS|DI_WWID|DI_BLACKLIST|
-						      pathinfo_flags);
+						      DI_SYSFS|DI_WWID|DI_BLACKLIST|DI_NOFALLBACK|pathinfo_flags);
 					pthread_cleanup_pop(1);
 					if (rc != PATHINFO_OK) {
 						condlog(1, "%s: error %d in pathinfo, discarding path",
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

