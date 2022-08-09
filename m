Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBFA58E206
	for <lists+dm-devel@lfdr.de>; Tue,  9 Aug 2022 23:46:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1660081600;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZUR9TM8rOK9vuTjTg6xaGGCzHjKELgGIvUq5dQtVo60=;
	b=ELhdvotMTS3gTK3NY8zrkHqOjWXoKk9XPWQCJY9PXqIjN+fkQIOv8hLeW56TQCfYEix0qd
	wZtFCRey0ilswCiDmYsP+7/kSK4xqw81FL22Q4BsZbrQAes9r7ZhRTZSr2j3P/YhsvukHM
	VbbuortcVmpvl4y9OHOoMZPHCWf605Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-qN45A9mgPdOzuqEtrD7PMA-1; Tue, 09 Aug 2022 17:46:38 -0400
X-MC-Unique: qN45A9mgPdOzuqEtrD7PMA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AABAA8037B5;
	Tue,  9 Aug 2022 21:46:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 609012166B26;
	Tue,  9 Aug 2022 21:46:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 22A291946A6A;
	Tue,  9 Aug 2022 21:46:33 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EEF391946A56
 for <dm-devel@listman.corp.redhat.com>; Tue,  9 Aug 2022 21:46:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id D447B40315E; Tue,  9 Aug 2022 21:46:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C316C492C3B;
 Tue,  9 Aug 2022 21:46:31 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 279LkUM9023320;
 Tue, 9 Aug 2022 16:46:30 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 279LkUlt023319;
 Tue, 9 Aug 2022 16:46:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Aug 2022 16:46:26 -0500
Message-Id: <1660081588-23278-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1660081588-23278-1-git-send-email-bmarzins@redhat.com>
References: <1660081588-23278-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [dm-devel] [PATCH 1/3] multipathd: factor out the code to flush a
 map with no paths
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The code to flush a multipath device because all of its paths have
been removed will be used by another caller, so factor it out of
ev_remove_path().

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 56 ++++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 27 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 5c2a7272..325f8cd4 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -561,6 +561,30 @@ int update_multipath (struct vectors *vecs, char *mapname, int reset)
 	return 0;
 }
 
+static bool
+flush_map_nopaths(struct multipath *mpp, struct vectors *vecs) {
+	char alias[WWID_SIZE];
+
+	/*
+	 * flush_map will fail if the device is open
+	 */
+	strlcpy(alias, mpp->alias, WWID_SIZE);
+	if (mpp->flush_on_last_del == FLUSH_ENABLED) {
+		condlog(2, "%s Last path deleted, disabling queueing",
+			mpp->alias);
+		mpp->retry_tick = 0;
+		mpp->no_path_retry = NO_PATH_RETRY_FAIL;
+		mpp->disable_queueing = 1;
+		mpp->stat_map_failures++;
+		dm_queue_if_no_path(mpp->alias, 0);
+	}
+	if (!flush_map(mpp, vecs, 1)) {
+		condlog(2, "%s: removed map after removing all paths", alias);
+		return true;
+	}
+	return false;
+}
+
 static int
 update_map (struct multipath *mpp, struct vectors *vecs, int new_map)
 {
@@ -1351,34 +1375,12 @@ ev_remove_path (struct path *pp, struct vectors * vecs, int need_do_map)
 			vector_del_slot(mpp->paths, i);
 
 		/*
-		 * remove the map IF removing the last path
+		 * remove the map IF removing the last path. If
+		 * flush_map_nopaths succeeds, the path has been removed.
 		 */
-		if (VECTOR_SIZE(mpp->paths) == 0) {
-			char alias[WWID_SIZE];
-
-			/*
-			 * flush_map will fail if the device is open
-			 */
-			strlcpy(alias, mpp->alias, WWID_SIZE);
-			if (mpp->flush_on_last_del == FLUSH_ENABLED) {
-				condlog(2, "%s Last path deleted, disabling queueing", mpp->alias);
-				mpp->retry_tick = 0;
-				mpp->no_path_retry = NO_PATH_RETRY_FAIL;
-				mpp->disable_queueing = 1;
-				mpp->stat_map_failures++;
-				dm_queue_if_no_path(mpp->alias, 0);
-			}
-			if (!flush_map(mpp, vecs, 1)) {
-				condlog(2, "%s: removed map after"
-					" removing all paths",
-					alias);
-				/* flush_map() has freed the path */
-				goto out;
-			}
-			/*
-			 * Not an error, continue
-			 */
-		}
+		if (VECTOR_SIZE(mpp->paths) == 0 &&
+		    flush_map_nopaths(mpp, vecs))
+			goto out;
 
 		if (setup_map(mpp, &params, vecs)) {
 			condlog(0, "%s: failed to setup map for"
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

