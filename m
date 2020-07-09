Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8D1EC219E51
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-SeS5g36zOMKHdygyduiPTw-1; Thu, 09 Jul 2020 06:52:46 -0400
X-MC-Unique: SeS5g36zOMKHdygyduiPTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2EB3108598D;
	Thu,  9 Jul 2020 10:52:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1BE890E75;
	Thu,  9 Jul 2020 10:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 467381806B0D;
	Thu,  9 Jul 2020 10:52:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqOb4000733 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8EE62166B28; Thu,  9 Jul 2020 10:52:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A47E32157F24
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEB741884987
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-202-MgTzUfA-NfG4coz4mmtpIA-1;
	Thu, 09 Jul 2020 06:52:18 -0400
X-MC-Unique: MgTzUfA-NfG4coz4mmtpIA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 30128AE7F;
	Thu,  9 Jul 2020 10:52:15 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:41 +0200
Message-Id: <20200709105145.9211-18-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqOb4000733
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 70/74] libmultipath: disassemble_map(): do not
	change pathvec and WWIDs
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

After introducing update_pathvec_from_dm() in a predecessor patch,
the "layer violations" in disassemble_map() can now be removed.
I hope this clarifies program logic a little bit.

Callers need to call update_pathvec_from_dm() after disassemble_map().

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c    | 48 +++++---------------------------------
 libmultipath/structs_vec.c |  3 +++
 2 files changed, 9 insertions(+), 42 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 233a1b8..e629a89 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -122,6 +122,12 @@ err:
 
 #undef APPEND
 
+/*
+ * Caution callers: If this function encounters yet unkown path devices, it
+ * adds them uninitialized to the mpp.
+ * Call update_pathvec_from_dm() after this function to make sure
+ * all data structures are in a sane state.
+ */
 int disassemble_map(vector pathvec, char *params, struct multipath *mpp)
 {
 	char * word;
@@ -282,20 +288,12 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp)
 		FREE(word);
 
 		for (j = 0; j < num_paths; j++) {
-			char devname[FILE_NAME_SIZE];
-
 			pp = NULL;
 			p += get_word(p, &word);
 
 			if (!word)
 				goto out;
 
-			if (devt2devname(devname, FILE_NAME_SIZE, word)) {
-				condlog(2, "%s: cannot find block device",
-					word);
-				devname[0] = '\0';
-			}
-
 			pp = find_path_by_devt(pathvec, word);
 
 			if (!pp) {
@@ -305,46 +303,12 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp)
 					goto out1;
 
 				strlcpy(pp->dev_t, word, BLK_DEV_SIZE);
-				strlcpy(pp->dev, devname, FILE_NAME_SIZE);
-				if (strlen(mpp->wwid)) {
-					strlcpy(pp->wwid, mpp->wwid,
-						WWID_SIZE);
-				}
-				if (store_path(pathvec, pp))
-					goto out1;
-			} else {
-				if (!strlen(pp->wwid) &&
-				    strlen(mpp->wwid))
-					strlcpy(pp->wwid, mpp->wwid,
-						WWID_SIZE);
 			}
 			FREE(word);
 
 			if (store_path(pgp->paths, pp))
 				goto out;
 
-			/*
-			 * Update wwid for multipaths which are not setup
-			 * in the get_dm_mpvec() code path
-			 */
-			if (!strlen(mpp->wwid))
-				strlcpy(mpp->wwid, pp->wwid, WWID_SIZE);
-
-			/*
-			 * Update wwid for paths which may not have been
-			 * active at the time the getuid callout was run
-			 */
-			else if (!strlen(pp->wwid))
-				strlcpy(pp->wwid, mpp->wwid, WWID_SIZE);
-
-			/*
-			 * Do not allow in-use patch to change wwid
-			 */
-			else if (strcmp(pp->wwid, mpp->wwid) != 0) {
-				condlog(0, "%s: path wwid appears to have changed. Using map wwid.\n", pp->dev_t);
-				strlcpy(pp->wwid, mpp->wwid, WWID_SIZE);
-			}
-
 			pgp->id ^= (long)pp;
 			pp->pgindex = i + 1;
 
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index 73a7221..2ddb8cd 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -389,6 +389,9 @@ update_multipath_table (struct multipath *mpp, vector pathvec)
 		return DMP_ERR;
 	}
 
+	/* FIXME: we should deal with the return value here */
+	update_pathvec_from_dm(pathvec, mpp, 0);
+
 	return DMP_OK;
 }
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

