Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 8B68B2428C7
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:05 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-YzcRnPB3NfeaUiuu6LUNgw-1; Wed, 12 Aug 2020 07:36:01 -0400
X-MC-Unique: YzcRnPB3NfeaUiuu6LUNgw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87B8E1005E76;
	Wed, 12 Aug 2020 11:35:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62E405D6C4;
	Wed, 12 Aug 2020 11:35:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1636E181A06C;
	Wed, 12 Aug 2020 11:35:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBZf7c028768 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:35:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C0BE10EE999; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 283BC10EE991
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106A0800580
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:35:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-461-CXC4fYCfMjaLkT0C-lRvtQ-1;
	Wed, 12 Aug 2020 07:35:36 -0400
X-MC-Unique: CXC4fYCfMjaLkT0C-lRvtQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76454B6FE;
	Wed, 12 Aug 2020 11:35:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:04 +0200
Message-Id: <20200812113511.26469-2-mwilck@suse.com>
In-Reply-To: <20200812113511.26469-1-mwilck@suse.com>
References: <20200812113511.26469-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBZf7c028768
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 55/74] libmultipath: add uninitialize_path()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This helper clears all fields of struct path (except pp->udev) that must be
re-ininitialized if the path ever is to be used again.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/structs.c     | 19 +++++++++++++++++--
 libmultipath/structs.h     |  1 +
 libmultipath/structs_vec.c |  9 +--------
 3 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index d227ec0..28bf8eb 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -114,19 +114,34 @@ alloc_path (void)
 }
 
 void
-free_path (struct path * pp)
+uninitialize_path(struct path *pp)
 {
 	if (!pp)
 		return;
 
+	pp->dmstate = PSTATE_UNDEF;
+	pp->uid_attribute = NULL;
+	pp->getuid = NULL;
+
 	if (checker_selected(&pp->checker))
 		checker_put(&pp->checker);
 
 	if (prio_selected(&pp->prio))
 		prio_put(&pp->prio);
 
-	if (pp->fd >= 0)
+	if (pp->fd >= 0) {
 		close(pp->fd);
+		pp->fd = -1;
+	}
+}
+
+void
+free_path (struct path * pp)
+{
+	if (!pp)
+		return;
+
+	uninitialize_path(pp);
 
 	if (pp->udev) {
 		udev_device_unref(pp->udev);
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index 917e408..5f45f21 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -416,6 +416,7 @@ struct host_group {
 struct path * alloc_path (void);
 struct pathgroup * alloc_pathgroup (void);
 struct multipath * alloc_multipath (void);
+void uninitialize_path(struct path *pp);
 void free_path (struct path *);
 void free_pathvec (vector vec, enum free_path_mode free_paths);
 void free_pathgroup (struct pathgroup * pgp, enum free_path_mode free_paths);
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 2b7c154..ea84a20 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -103,14 +103,7 @@ void orphan_path(struct path *pp, const char *reason)
 		pp->mpp->hwe = NULL;
 	}
 	pp->mpp = NULL;
-	pp->dmstate = PSTATE_UNDEF;
-	pp->uid_attribute = NULL;
-	pp->getuid = NULL;
-	prio_put(&pp->prio);
-	checker_put(&pp->checker);
-	if (pp->fd >= 0)
-		close(pp->fd);
-	pp->fd = -1;
+	uninitialize_path(pp);
 }
 
 void orphan_paths(vector pathvec, struct multipath *mpp, const char *reason)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

