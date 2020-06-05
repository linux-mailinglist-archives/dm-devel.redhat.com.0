Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D73541F03D3
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402968;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3TZcGig9Q+aYxXWD1sRM38hTL/HcNecpxfebVUn+Aoo=;
	b=eNUM3DiaYOTdCcRUjmMPzPOQzAZPTN38oshO5y3SqA8yH2KaRv0SKAOL9mMtkCE3INvaWK
	IvZ14H3L7lyu2LW6TrX+K26EafofBNScT4rXkReUoDMfihvS5YfCEUtOtP7yBhJaRGwDqF
	glnydDgeXWmyurJ9Vqg6wIOXLpV6dkE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-uM2sUzbSMg-NxFeeKbrH9g-1; Fri, 05 Jun 2020 20:22:46 -0400
X-MC-Unique: uM2sUzbSMg-NxFeeKbrH9g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3AA16835BC4;
	Sat,  6 Jun 2020 00:22:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BE355D9E5;
	Sat,  6 Jun 2020 00:22:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D0AAA1805312;
	Sat,  6 Jun 2020 00:22:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0550V7Yt000695 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 20:31:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E458100164C; Fri,  5 Jun 2020 00:31:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C42C110013D7;
	Fri,  5 Jun 2020 00:31:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0550V2iK025526; 
	Thu, 4 Jun 2020 19:31:02 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0550V1nn025525;
	Thu, 4 Jun 2020 19:31:01 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  4 Jun 2020 19:30:59 -0500
Message-Id: <1591317060-25484-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
References: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH 1/2] libmultipath: change filter_devnode
	arguments
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of taking the blist and elist devnode vectors, filter device
now takes a config struct. This change is necessary to enable future
commits. It makes no functional changes to the code.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/blacklist.c  |  8 ++++----
 libmultipath/blacklist.h  |  2 +-
 libmultipath/discovery.c  |  4 +---
 libmultipath/print.c      |  3 +--
 libmultipath/uevent.c     |  3 +--
 multipath/main.c          |  3 +--
 multipathd/cli_handlers.c |  3 +--
 tests/blacklist.c         | 18 +++++++++++-------
 8 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index 00e8dbdb..bc8e9e00 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -311,14 +311,14 @@ filter_device (vector blist, vector elist, char * vendor, char * product,
 }
 
 int
-filter_devnode (vector blist, vector elist, char * dev)
+filter_devnode (struct config *conf, char * dev)
 {
 	int r = MATCH_NOTHING;
 
 	if (dev) {
-		if (_blacklist_exceptions(elist, dev))
+		if (_blacklist_exceptions(conf->elist_devnode, dev))
 			r = MATCH_DEVNODE_BLIST_EXCEPT;
-		else if (_blacklist(blist, dev))
+		else if (_blacklist(conf->blist_devnode, dev))
 			r = MATCH_DEVNODE_BLIST;
 	}
 
@@ -369,7 +369,7 @@ filter_path (struct config * conf, struct path * pp)
 	r = filter_property(conf, pp->udev, 3, pp->uid_attribute);
 	if (r > 0)
 		return r;
-	r = filter_devnode(conf->blist_devnode, conf->elist_devnode, pp->dev);
+	r = filter_devnode(conf, pp->dev);
 	if (r > 0)
 		return r;
 	r = filter_device(conf->blist_device, conf->elist_device,
diff --git a/libmultipath/blacklist.h b/libmultipath/blacklist.h
index 2d721f60..938b9505 100644
--- a/libmultipath/blacklist.h
+++ b/libmultipath/blacklist.h
@@ -33,7 +33,7 @@ struct blentry_device {
 
 int setup_default_blist (struct config *);
 int alloc_ble_device (vector);
-int filter_devnode (vector, vector, char *);
+int filter_devnode (struct config *, char *);
 int filter_wwid (vector, vector, char *, char *);
 int filter_device (vector, vector, char *, char *, char *);
 int filter_path (struct config *, struct path *);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index ffec5162..2d003359 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2066,9 +2066,7 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 			return PATHINFO_SKIPPED;
 	}
 
-	if (filter_devnode(conf->blist_devnode,
-			   conf->elist_devnode,
-			   pp->dev) > 0)
+	if (filter_devnode(conf, pp->dev) > 0)
 		return PATHINFO_SKIPPED;
 
 	condlog(4, "%s: mask = 0x%x", pp->dev, mask);
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 298b3764..ee79a9d0 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -2071,8 +2071,7 @@ int snprint_devices(struct config *conf, char * buff, int len,
 				blkdev->d_name);
 		pp = find_path_by_dev(vecs->pathvec, blkdev->d_name);
 		if (!pp) {
-			r = filter_devnode(conf->blist_devnode,
-					   conf->elist_devnode, blkdev->d_name);
+			r = filter_devnode(conf, blkdev->d_name);
 			if (r > 0)
 				fwd += snprintf(buff + fwd, len - fwd,
 						" devnode blacklisted, unmonitored");
diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index e0d13b11..05937306 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -202,8 +202,7 @@ uevent_can_discard(struct uevent *uev)
 	 */
 	conf = get_multipath_config();
 	pthread_cleanup_push(put_multipath_config, conf);
-	if (filter_devnode(conf->blist_devnode, conf->elist_devnode,
-			   uev->kernel) > 0)
+	if (filter_devnode(conf, uev->kernel) > 0)
 		invalid = 1;
 	pthread_cleanup_pop(1);
 
diff --git a/multipath/main.c b/multipath/main.c
index 953fab27..b235ad66 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -565,8 +565,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
 	if (dev && (dev_type == DEV_DEVNODE ||
 		    dev_type == DEV_UEVENT) &&
 	    cmd != CMD_REMOVE_WWID &&
-	    (filter_devnode(conf->blist_devnode,
-			    conf->elist_devnode, dev) > 0)) {
+	    (filter_devnode(conf, dev) > 0)) {
 		goto out;
 	}
 
diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 31c3d9fd..bda81184 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -705,8 +705,7 @@ cli_add_path (void * v, char ** reply, int * len, void * data)
 	condlog(2, "%s: add path (operator)", param);
 	conf = get_multipath_config();
 	pthread_cleanup_push(put_multipath_config, conf);
-	if (filter_devnode(conf->blist_devnode, conf->elist_devnode,
-			   param) > 0)
+	if (filter_devnode(conf, param) > 0)
 		invalid = 1;
 	pthread_cleanup_pop(1);
 	if (invalid)
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 6e7c1864..0ae82592 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -138,24 +138,28 @@ static int reset_blists(void **state)
 
 static void test_devnode_blacklist(void **state)
 {
+	conf.blist_devnode = blist_devnode_sdb;
 	expect_condlog(3, "sdb: device node name blacklisted\n");
-	assert_int_equal(filter_devnode(blist_devnode_sdb, NULL, "sdb"),
+	assert_int_equal(filter_devnode(&conf, "sdb"),
 			 MATCH_DEVNODE_BLIST);
 }
 
 static void test_devnode_whitelist(void **state)
 {
+	conf.blist_devnode = blist_all;
+	conf.elist_devnode = blist_devnode_sdb;
 	expect_condlog(3, "sdb: device node name whitelisted\n");
-	assert_int_equal(filter_devnode(blist_all, blist_devnode_sdb, "sdb"),
+	assert_int_equal(filter_devnode(&conf, "sdb"),
 			 MATCH_DEVNODE_BLIST_EXCEPT);
 	expect_condlog(3, "sdc: device node name blacklisted\n");
-	assert_int_equal(filter_devnode(blist_all, blist_devnode_sdb, "sdc"),
+	assert_int_equal(filter_devnode(&conf, "sdc"),
 			 MATCH_DEVNODE_BLIST);
 }
 
 static void test_devnode_missing(void **state)
 {
-	assert_int_equal(filter_devnode(blist_devnode_sdb, NULL, "sdc"),
+	conf.blist_devnode = blist_devnode_sdb;
+	assert_int_equal(filter_devnode(&conf, "sdc"),
 			 MATCH_NOTHING);
 }
 
@@ -481,9 +485,9 @@ static void test_filter_path_whitelist_wwid(void **state)
 int test_blacklist(void)
 {
 	const struct CMUnitTest tests[] = {
-		cmocka_unit_test(test_devnode_blacklist),
-		cmocka_unit_test(test_devnode_whitelist),
-		cmocka_unit_test(test_devnode_missing),
+		test_and_reset(test_devnode_blacklist),
+		test_and_reset(test_devnode_whitelist),
+		test_and_reset(test_devnode_missing),
 		cmocka_unit_test(test_device_blacklist),
 		cmocka_unit_test(test_device_whitelist),
 		cmocka_unit_test(test_device_missing),
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

