Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 19C2A219D9B
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:21:46 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-PGGYYmaUOOqNJdUQr0mpLw-1; Thu, 09 Jul 2020 06:21:43 -0400
X-MC-Unique: PGGYYmaUOOqNJdUQr0mpLw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E72680BCA2;
	Thu,  9 Jul 2020 10:21:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5AD490E66;
	Thu,  9 Jul 2020 10:21:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63A63180BA96;
	Thu,  9 Jul 2020 10:21:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH2LP029493 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18FBB114B2F8; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 15197114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EC13710B94FF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-392-MJM1NEI7PF-animsJ4aJQA-1;
	Thu, 09 Jul 2020 06:16:59 -0400
X-MC-Unique: MJM1NEI7PF-animsJ4aJQA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B77D2B080;
	Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:17 +0200
Message-Id: <20200709101620.6786-33-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH2LP029493
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 32/35] libmultipath: log table params in addmap()
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We currently log the table parameters with "load table" in domap()
in the success case. But it's at least as interesting to get this
information when domap() fails. Log in addmap() instead at v2 level.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 2 +-
 libmultipath/devmapper.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index fe590f4..315eb6a 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -992,7 +992,7 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
 		} else  {
 			/* multipath daemon mode */
 			mpp->stat_map_loads++;
-			condlog(2, "%s: load table [0 %llu %s %s]", mpp->alias,
+			condlog(4, "%s: load table [0 %llu %s %s]", mpp->alias,
 				mpp->size, TGT_MPATH, params);
 			/*
 			 * Required action is over, reset for the stateful daemon.
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 4096e9d..a177a54 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -395,7 +395,7 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
 	if (mpp->attribute_flags & (1 << ATTR_GID) &&
 	    !dm_task_set_gid(dmt, mpp->gid))
 		goto freeout;
-	condlog(4, "%s: %s [0 %llu %s %s]", mpp->alias,
+	condlog(2, "%s: %s [0 %llu %s %s]", mpp->alias,
 		task == DM_DEVICE_RELOAD ? "reload" : "addmap", mpp->size,
 		target, params);
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

