Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D4444353B8
	for <lists+dm-devel@lfdr.de>; Wed, 20 Oct 2021 21:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634757608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x3egeFvHfTuycasuzeKAJZENj49xAwNadVAPh1mDNmI=;
	b=QzuRgHggsM6TNZpLAP1kzD7hXCsGLS5+Gs6NLxAVUmWAKxL9TTuhAinRI89W+Q+rFaVO2p
	ilsylN+RWXdEwQYXpkyQq4+ocpEpnB8mlq1WEBEAxrvEruAfy1gbPZDutxNLLnrMf5ftk9
	GPRY2Xhi6lP4AxGEq2fodNciBokEH7o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-lK26fb77PWaLgVk017_J1w-1; Wed, 20 Oct 2021 15:20:02 -0400
X-MC-Unique: lK26fb77PWaLgVk017_J1w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DF9880EFA9;
	Wed, 20 Oct 2021 19:19:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 474A260CA0;
	Wed, 20 Oct 2021 19:19:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0486E1832DD2;
	Wed, 20 Oct 2021 19:19:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJFQaI000579 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:15:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3D3E460CA0; Wed, 20 Oct 2021 19:15:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27D7E60C0F;
	Wed, 20 Oct 2021 19:15:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 19KJFOo6006057; 
	Wed, 20 Oct 2021 14:15:24 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 19KJFNIE006056;
	Wed, 20 Oct 2021 14:15:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 20 Oct 2021 14:15:16 -0500
Message-Id: <1634757322-6015-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
References: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/7] multipathd: remove missing paths on startup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a path device was removed from the system while multipathd was not
running, multipathd would not remove the path from the multipath table
on start-up, or on a weak reconfigure. update_pathvec_from_dm() would
return that a reload was necessary, but that information wasn't
propigated back to where it could be used to reload the device.

Multipath devices now remember if they need to be reloaded, and if so,
force_reload is set in select_action().  This means that even when
configure is called with FORCE_RELOAD_WEAK, these devices will still be
reloaded.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c   | 2 ++
 libmultipath/devmapper.c   | 2 ++
 libmultipath/structs.h     | 1 +
 libmultipath/structs_vec.c | 1 +
 4 files changed, 6 insertions(+)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index eb8ec1bd..f1a890af 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -715,6 +715,8 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 
 	cmpp = find_mp_by_wwid(curmp, mpp->wwid);
 	cmpp_by_name = find_mp_by_alias(curmp, mpp->alias);
+	if (mpp->need_reload || (cmpp && cmpp->need_reload))
+		force_reload = 1;
 
 	if (!cmpp_by_name) {
 		if (cmpp) {
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index c05dc201..3e1a7260 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -522,6 +522,8 @@ freeout:
 addout:
 	dm_task_destroy (dmt);
 
+	if (r)
+		mpp->need_reload = false;
 	return r;
 }
 
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 399540e7..d0b266b7 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -355,6 +355,7 @@ struct multipath {
 	int retain_hwhandler;
 	int deferred_remove;
 	bool in_recovery;
+	bool need_reload;
 	int san_path_err_threshold;
 	int san_path_err_forget_rate;
 	int san_path_err_recovery_time;
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 85d97ac1..e52db0c4 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -237,6 +237,7 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 		free_pathgroup(pgp, KEEP_PATHS);
 		must_reload = true;
 	}
+	mpp->need_reload = mpp->need_reload || must_reload;
 	return must_reload;
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

