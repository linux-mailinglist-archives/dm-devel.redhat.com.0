Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D118C219DEF
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:35:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-178-o6XDC0I_M7CPyuRUYJJtXg-1; Thu, 09 Jul 2020 06:35:48 -0400
X-MC-Unique: o6XDC0I_M7CPyuRUYJJtXg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 137E218FF660;
	Thu,  9 Jul 2020 10:35:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 920825C1C3;
	Thu,  9 Jul 2020 10:35:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 781421809561;
	Thu,  9 Jul 2020 10:35:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AZY7s031449 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:35:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCCF61000DAA; Thu,  9 Jul 2020 10:35:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8AEB114B2FF
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB1528007CA
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:35:30 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-149-Qyu8qiw1OgeCqGMNlG8qdw-1;
	Thu, 09 Jul 2020 06:35:28 -0400
X-MC-Unique: Qyu8qiw1OgeCqGMNlG8qdw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id B1C3AAE65;
	Thu,  9 Jul 2020 10:35:26 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:35:12 +0200
Message-Id: <20200709103513.8142-3-mwilck@suse.com>
In-Reply-To: <20200709103513.8142-1-mwilck@suse.com>
References: <20200709103513.8142-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AZY7s031449
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 41/42] libmultipath: refuse reloading an existing
	map with different WWID
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If a map with given name (alias) already exists with a different WWID,
reloading it with a new WWID will be harmful. The existing paths would
be replaced by other, unrelated ones. The WWIDs of the new paths would
not match the map WWID, and thus sooner or later overwritten by
disassemble_map with the map's wwid.

Refuse reloading a map under such circumstances. This makes it impossible
to "swap" multipath names in a single reconfigure run, but avoiding
data corruption should be worth it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index c62807e..75e11fd 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -897,10 +897,21 @@ int domap(struct multipath *mpp, char *params, int is_daemon)
 		return DOMAP_DRY;
 	}
 
-	if (mpp->action == ACT_CREATE &&
-	    dm_map_present(mpp->alias)) {
-		condlog(3, "%s: map already present", mpp->alias);
-		mpp->action = ACT_RELOAD;
+	if (mpp->action == ACT_CREATE && dm_map_present(mpp->alias)) {
+		char wwid[WWID_SIZE];
+
+		if (dm_get_uuid(mpp->alias, wwid, sizeof(wwid)) == 0) {
+			if (!strncmp(mpp->wwid, wwid, sizeof(wwid))) {
+				condlog(3, "%s: map already present",
+					mpp->alias);
+				mpp->action = ACT_RELOAD;
+			} else {
+				condlog(0, "%s: map \"%s\" already present with WWID %s, skipping",
+					mpp->wwid, mpp->alias, wwid);
+				condlog(0, "please check alias settings in config and bindings file");
+				mpp->action = ACT_REJECT;
+			}
+		}
 	}
 
 	switch (mpp->action) {
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

