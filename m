Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4C738B04
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:32 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45E7A3086262;
	Fri,  7 Jun 2019 13:10:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1739382705;
	Fri,  7 Jun 2019 13:10:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 95D05206D5;
	Fri,  7 Jun 2019 13:10:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D700h000536 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:07:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8351382F54; Fri,  7 Jun 2019 13:07:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B22A82268;
	Fri,  7 Jun 2019 13:07:00 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83E48307CDD5;
	Fri,  7 Jun 2019 13:06:45 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:40 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:48 +0200
Message-Id: <20190607130552.13203-27-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Fri, 07 Jun 2019 13:06:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 07 Jun 2019 13:06:56 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 26/30] libmultipath: fix has_uid_fallback() logic
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Fri, 07 Jun 2019 13:10:26 +0000 (UTC)

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
