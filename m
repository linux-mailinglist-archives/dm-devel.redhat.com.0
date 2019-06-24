Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFB505C8
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:31:30 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B41A7C00DE0C;
	Mon, 24 Jun 2019 09:31:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84BE71001E69;
	Mon, 24 Jun 2019 09:31:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 101051806B16;
	Mon, 24 Jun 2019 09:31:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9Tfkh005657 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C85A519728; Mon, 24 Jun 2019 09:29:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6202B19C69;
	Mon, 24 Jun 2019 09:29:39 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D409C308404B;
	Mon, 24 Jun 2019 09:29:31 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:28 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:52 +0200
Message-Id: <20190624092756.7769-28-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Mon, 24 Jun 2019 09:29:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Mon, 24 Jun 2019 09:29:32 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 26/30] libmultipath: fix has_uid_fallback()
	logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 24 Jun 2019 09:31:29 +0000 (UTC)

The idea of 061daf40 "Do not automatically fall back to vpd uid
generation" applies not only to SCSI. Use the same logic for NVMe.
Allow fallback in two cases:
 - uid_attribute has the default value for the bus in question
 - uid_attribute has been set to "" to disable udev-based WWID checking
As uid_fallback() has only one caller, no need to check the conditions
there again.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/defaults.h  |  1 +
 libmultipath/discovery.c | 20 +++++++++++++++-----
 libmultipath/hwtable.c   |  2 +-
 tests/hwtable.c          |  2 +-
 4 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/libmultipath/defaults.h b/libmultipath/defaults.h
index 83f89f37..decc9335 100644
--- a/libmultipath/defaults.h
+++ b/libmultipath/defaults.h
@@ -5,6 +5,7 @@
  * and the TEMPLATE in libmultipath/hwtable.c
  */
 #define DEFAULT_UID_ATTRIBUTE	"ID_SERIAL"
+#define DEFAULT_NVME_UID_ATTRIBUTE	"ID_WWN"
 #define DEFAULT_UDEVDIR		"/dev"
 #define DEFAULT_MULTIPATHDIR	"/" LIB_STRING "/multipath"
 #define DEFAULT_SELECTOR	"service-time 0"
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index d7eaee68..15f5cd4b 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1802,8 +1802,7 @@ static ssize_t uid_fallback(struct path *pp, int path_state,
 {
 	ssize_t len = -1;
 
-	if (pp->bus == SYSFS_BUS_SCSI &&
-	    !strcmp(pp->uid_attribute, DEFAULT_UID_ATTRIBUTE)) {
+	if (pp->bus == SYSFS_BUS_SCSI) {
 		len = get_vpd_uid(pp);
 		*origin = "sysfs";
 		if (len < 0 && path_state == PATH_UP) {
@@ -1833,11 +1832,22 @@ static ssize_t uid_fallback(struct path *pp, int path_state,
 	return len;
 }
 
-static int has_uid_fallback(struct path *pp)
+static bool has_uid_fallback(struct path *pp)
 {
+	/*
+	 * Falling back to direct WWID determination is dangerous
+	 * if uid_attribute is set to something non-standard.
+	 * Allow it only if it's either the default, or if udev
+	 * has been disabled by setting 'uid_attribute ""'.
+	 */
+	if (!pp->uid_attribute)
+		return false;
 	return ((pp->bus == SYSFS_BUS_SCSI &&
-		 !strcmp(pp->uid_attribute, DEFAULT_UID_ATTRIBUTE)) ||
-		pp->bus == SYSFS_BUS_NVME);
+		 (!strcmp(pp->uid_attribute, DEFAULT_UID_ATTRIBUTE) ||
+		  !strcmp(pp->uid_attribute, ""))) ||
+		(pp->bus == SYSFS_BUS_NVME &&
+		 (!strcmp(pp->uid_attribute, DEFAULT_NVME_UID_ATTRIBUTE) ||
+		  !strcmp(pp->uid_attribute, ""))));
 }
 
 int
diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 1d964333..46caaf91 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -88,7 +88,7 @@ static struct hwentry default_hw[] = {
 		/* Generic NVMe */
 		.vendor        = "NVME",
 		.product       = ".*",
-		.uid_attribute = "ID_WWN",
+		.uid_attribute = DEFAULT_NVME_UID_ATTRIBUTE,
 		.checker_name  = NONE,
 		.retain_hwhandler = RETAIN_HWHANDLER_OFF,
 	},
diff --git a/tests/hwtable.c b/tests/hwtable.c
index f436f52d..977a5663 100644
--- a/tests/hwtable.c
+++ b/tests/hwtable.c
@@ -571,7 +571,7 @@ static void test_internal_nvme(const struct hwt_state *hwt)
 	mp = mock_multipath(pp);
 	assert_ptr_not_equal(mp, NULL);
 	TEST_PROP(checker_name(&pp->checker), NONE);
-	TEST_PROP(pp->uid_attribute, "ID_WWN");
+	TEST_PROP(pp->uid_attribute, DEFAULT_NVME_UID_ATTRIBUTE);
 	assert_int_equal(mp->pgpolicy, DEFAULT_PGPOLICY);
 	assert_int_equal(mp->no_path_retry, DEFAULT_NO_PATH_RETRY);
 	assert_int_equal(mp->retain_hwhandler, RETAIN_HWHANDLER_OFF);
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
