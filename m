Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id DFFA82428BE
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:34:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-DN1jCJrrPUa2wLdyrBLSkQ-1; Wed, 12 Aug 2020 07:34:43 -0400
X-MC-Unique: DN1jCJrrPUa2wLdyrBLSkQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC583101C8AA;
	Wed, 12 Aug 2020 11:34:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59E7E74AB3;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11D7CA5558;
	Wed, 12 Aug 2020 11:34:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBYUE1028573 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:34:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8F24B976E; Wed, 12 Aug 2020 11:34:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4D2ED0187
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2326D101A525
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:34:27 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-402-qNjwfcyROaSyNr86qhPtqw-1;
	Wed, 12 Aug 2020 07:34:24 -0400
X-MC-Unique: qNjwfcyROaSyNr86qhPtqw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id ED56DB6D5;
	Wed, 12 Aug 2020 11:34:44 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:34:05 +0200
Message-Id: <20200812113405.26206-3-mwilck@suse.com>
In-Reply-To: <20200812113405.26206-1-mwilck@suse.com>
References: <20200812113405.26206-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBYUE1028573
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 41/42] libmultipath: refuse reloading an
	existing map with different WWID
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If a map with given name (alias) already exists with a different WWID,
reloading it with a new WWID is harmful. The existing paths would first
be replaced by others with the new WWID. The WWIDs of the new paths wouldn't
match the map WWID; thus the next time the map is disassembled, the (correct)
path WWIDs would be overwritten by the different map WWID (with subsequent
patches from this series, they'd be orphaned instead, which is better but
still not ideal). When the map is reloaded later, paths with diffent WWIDs
may be mixed, causing data corruption.

Refuse reloading a map under such circumstances.

Note: this patch doesn't change multipath-tools behavior in the case
where valid map aliases are supposed to be swapped (typically if the bindings
file differs between initrd and root FS). In this case, select_action()
selects ACT_RENAME, which this patch doesn't affect. The user-visible behavior
in this case remains as-is: the map renames fail, and the aliases remain
unchanged, thus not matching the current bindings file, but art least
internally consistent.

To fully fix this use case, coalesce_paths() must cease setting up maps one
by one. Instead, we'd need to build up a full set of maps-to-be-set-up,
and create them in a single batch, figuring out a "rename strategy" beforehand
to avoid clashes between existing and to-be-created maps (for example,
a name swap A<->B would need to be carried out as B->tmp, A->B, tmp->A).
Implementing that is out of the scope of this patch series.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 315eb6a..5f60f74 100644
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

