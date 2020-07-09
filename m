Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 54512219DF0
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:35:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-cmKIbwn6P1ahUb1VA5yBHw-1; Thu, 09 Jul 2020 06:35:49 -0400
X-MC-Unique: cmKIbwn6P1ahUb1VA5yBHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55995107BEFA;
	Thu,  9 Jul 2020 10:35:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCD536FEDB;
	Thu,  9 Jul 2020 10:35:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77EE01809557;
	Thu,  9 Jul 2020 10:35:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AZXPv031444 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:35:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C7345F252; Thu,  9 Jul 2020 10:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17E595F255
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1265F858EE9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:31 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-23-YCSZ60HCMcSh9ZDBuSFpkw-1;
	Thu, 09 Jul 2020 06:35:28 -0400
X-MC-Unique: YCSZ60HCMcSh9ZDBuSFpkw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E826BAE6F;
	Thu,  9 Jul 2020 10:35:26 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:35:13 +0200
Message-Id: <20200709103513.8142-4-mwilck@suse.com>
In-Reply-To: <20200709103513.8142-1-mwilck@suse.com>
References: <20200709103513.8142-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AZXPv031444
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 42/42] libmultipath: dm_addmap(): refuse creating
	map with empty WWID
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We already avoid creating maps with empty WWID in coalesce_paths()
as well as in ev_add_path(). The only code path where it's difficult
to prove (although extremely unlikely) that we can't call
dm_addmap(ACT_CREATE) with an empty WWID is update_path_groups()->
reload_map(). To make the code easier to review and avoid ugly
corner cases, simply refuse to create maps with a zero-length
WWID.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/devmapper.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index a177a54..fb7675c 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -352,6 +352,12 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
 	char *prefixed_uuid = NULL;
 	uint32_t cookie = 0;
 
+	if (task == DM_DEVICE_CREATE && strlen(mpp->wwid) == 0) {
+		condlog(1, "%s: refusing to create map with empty WWID",
+			mpp->alias);
+		return 0;
+	}
+
 	/* Need to add this here to allow 0 to be passed in udev_flags */
 	udev_flags |= DM_UDEV_DISABLE_LIBRARY_FALLBACK;
 
@@ -368,18 +374,16 @@ dm_addmap (int task, const char *target, struct multipath *mpp,
 		dm_task_set_ro(dmt);
 
 	if (task == DM_DEVICE_CREATE) {
-		if (strlen(mpp->wwid) > 0) {
-			prefixed_uuid = MALLOC(UUID_PREFIX_LEN +
-					       strlen(mpp->wwid) + 1);
-			if (!prefixed_uuid) {
-				condlog(0, "cannot create prefixed uuid : %s",
-					strerror(errno));
-				goto addout;
-			}
-			sprintf(prefixed_uuid, UUID_PREFIX "%s", mpp->wwid);
-			if (!dm_task_set_uuid(dmt, prefixed_uuid))
-				goto freeout;
+		prefixed_uuid = MALLOC(UUID_PREFIX_LEN +
+				       strlen(mpp->wwid) + 1);
+		if (!prefixed_uuid) {
+			condlog(0, "cannot create prefixed uuid : %s",
+				strerror(errno));
+			goto addout;
 		}
+		sprintf(prefixed_uuid, UUID_PREFIX "%s", mpp->wwid);
+		if (!dm_task_set_uuid(dmt, prefixed_uuid))
+			goto freeout;
 		dm_task_skip_lockfs(dmt);
 #ifdef LIBDM_API_FLUSH
 		dm_task_no_flush(dmt);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

