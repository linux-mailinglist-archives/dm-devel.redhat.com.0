Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6038B01
	for <lists+dm-devel@lfdr.de>; Fri,  7 Jun 2019 15:10:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5790C89C33;
	Fri,  7 Jun 2019 13:10:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2788B82268;
	Fri,  7 Jun 2019 13:10:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90EDE18433A0;
	Fri,  7 Jun 2019 13:10:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x57D7ER8000941 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Jun 2019 09:07:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BEC7882F56; Fri,  7 Jun 2019 13:07:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E97E82268;
	Fri,  7 Jun 2019 13:07:10 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 638673007400;
	Fri,  7 Jun 2019 13:06:54 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 07 Jun 2019 07:06:45 -0600
From: Martin Wilck <mwilck@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  7 Jun 2019 15:05:51 +0200
Message-Id: <20190607130552.13203-30-mwilck@suse.com>
In-Reply-To: <20190607130552.13203-1-mwilck@suse.com>
References: <20190607130552.13203-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.42]); Fri, 07 Jun 2019 13:07:03 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Fri, 07 Jun 2019 13:07:03 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 29/30] libmultipath: more cautious blacklisting
	by missing property
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Fri, 07 Jun 2019 13:10:14 +0000 (UTC)

If a tool likk sg_inq or scsi_id fails to access a device during uevent
processing, the required properties for whitelisting a device may be
missing. This causes the device to be blacklisted and permanently orphaned,
which is not desired.

Rather, blacklisting by missing properties is meant to ensure that the
WWID determined from udev properties is _reliable_. Therefore, blacklist
only devices that exhibit ID_SERIAL (or more generally, the configured
uid_attribute), but do not have the required whitelist properties set. This
will avoid the above-mentioned problem, because if failed device I/O was
causing properties to be missing, ID_SERIAL will most likely also not be set.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/blacklist.c   | 26 +++++++++++++++++++++++--
 libmultipath/blacklist.h   |  2 +-
 libmultipath/configure.c   |  6 +++---
 libmultipath/discovery.c   |  2 +-
 multipath/multipath.conf.5 |  8 ++++++++
 tests/blacklist.c          | 39 +++++++++++++++++++++++++++++++++-----
 6 files changed, 71 insertions(+), 12 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index e0d02794..00e8dbdb 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -366,7 +366,7 @@ filter_path (struct config * conf, struct path * pp)
 {
 	int r;
 
-	r = filter_property(conf, pp->udev, 3);
+	r = filter_property(conf, pp->udev, 3, pp->uid_attribute);
 	if (r > 0)
 		return r;
 	r = filter_devnode(conf->blist_devnode, conf->elist_devnode, pp->dev);
@@ -384,7 +384,8 @@ filter_path (struct config * conf, struct path * pp)
 }
 
 int
-filter_property(struct config *conf, struct udev_device *udev, int lvl)
+filter_property(struct config *conf, struct udev_device *udev, int lvl,
+		const char *uid_attribute)
 {
 	const char *devname = udev_device_get_sysname(udev);
 	struct udev_list_entry *list_entry;
@@ -395,7 +396,21 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl)
 		/*
 		 * This is the inverse of the 'normal' matching;
 		 * the environment variable _has_ to match.
+		 * But only if the uid_attribute used for determining the WWID
+		 * of the path is is present in the environment
+		 * (uid_attr_seen). If this is not the case, udev probably
+		 * just failed to access the device, which should not cause the
+		 * device to be blacklisted (it won't be used by multipath
+		 * anyway without WWID).
+		 * Likewise, if no uid attribute is defined, udev-based WWID
+		 * determination is effectively off, and devices shouldn't be
+		 * blacklisted by missing properties (check_missing_prop).
 		 */
+
+		bool check_missing_prop = uid_attribute != NULL &&
+			*uid_attribute != '\0';
+		bool uid_attr_seen = false;
+
 		r = MATCH_PROPERTY_BLIST_MISSING;
 		udev_list_entry_foreach(list_entry,
 				udev_device_get_properties_list_entry(udev)) {
@@ -403,6 +418,10 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl)
 			env = udev_list_entry_get_name(list_entry);
 			if (!env)
 				continue;
+
+			if (check_missing_prop && !strcmp(env, uid_attribute))
+				uid_attr_seen = true;
+
 			if (_blacklist_exceptions(conf->elist_property, env)) {
 				r = MATCH_PROPERTY_BLIST_EXCEPT;
 				break;
@@ -413,6 +432,9 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl)
 			}
 			env = NULL;
 		}
+		if (r == MATCH_PROPERTY_BLIST_MISSING &&
+		    (!check_missing_prop || !uid_attr_seen))
+			r = MATCH_NOTHING;
 	}
 
 	log_filter(devname, NULL, NULL, NULL, env, NULL, r, lvl);
diff --git a/libmultipath/blacklist.h b/libmultipath/blacklist.h
index 4c8ec99e..2d721f60 100644
--- a/libmultipath/blacklist.h
+++ b/libmultipath/blacklist.h
@@ -37,7 +37,7 @@ int filter_devnode (vector, vector, char *);
 int filter_wwid (vector, vector, char *, char *);
 int filter_device (vector, vector, char *, char *, char *);
 int filter_path (struct config *, struct path *);
-int filter_property(struct config *, struct udev_device *, int);
+int filter_property(struct config *, struct udev_device *, int, const char*);
 int filter_protocol(vector, vector, struct path *);
 int store_ble (vector, char *, int);
 int set_ble_device (vector, char *, char *, int);
diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index c8dd69b0..b09ef529 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1369,7 +1369,7 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
-		    filter_property(conf, pp->udev, 3) > 0)
+		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
 			invalid = 1;
 		pthread_cleanup_pop(1);
 		if (invalid)
@@ -1409,7 +1409,7 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
-		    filter_property(conf, pp->udev, 3) > 0)
+		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
 			invalid = 1;
 		pthread_cleanup_pop(1);
 		if (invalid)
@@ -1438,7 +1438,7 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		conf = get_multipath_config();
 		pthread_cleanup_push(put_multipath_config, conf);
 		if (pp->udev && pp->uid_attribute &&
-		    filter_property(conf, pp->udev, 3) > 0)
+		    filter_property(conf, pp->udev, 3, pp->uid_attribute) > 0)
 			invalid = 1;
 		pthread_cleanup_pop(1);
 		if (invalid)
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 15f5cd4b..acca466c 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1945,7 +1945,7 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 			return PATHINFO_SKIPPED;
 		}
 		if (is_claimed_by_foreign(pp->udev) ||
-		    filter_property(conf, pp->udev, 4) > 0)
+		    filter_property(conf, pp->udev, 4, pp->uid_attribute) > 0)
 			return PATHINFO_SKIPPED;
 	}
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 6f08980a..d5fe38ac 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1241,6 +1241,14 @@ otherwise they're treated as blacklisted, and the message
 .
 .RS
 .PP
+.B Note:
+The behavior of this option has changed in \fBmultipath-tools\fR 0.8.2
+compared to previous versions.
+Blacklisting by missing properties is only applied to devices which do have the
+property specified by \fIuid_attribute\fR (e.g. \fIID_SERIAL\fR)
+set. Previously, it was applied to every device, possibly causing devices to be
+blacklisted because of temporary I/O error conditions.
+.PP
 The default \fIblacklist exception\fR is: \fB(SCSI_IDENT_|ID_WWN)\fR, causing
 well-behaved SCSI devices and devices that provide a WWN (World Wide Number)
 to be included, and all others to be excluded.
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 54d568f5..362c44d9 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -267,7 +267,7 @@ static void test_property_blacklist(void **state)
 	static struct udev_device udev = { "sdb", { "ID_FOO", "ID_WWN", "ID_BAR", NULL } };
 	conf.blist_property = blist_property_wwn;
 	expect_condlog(3, "sdb: udev property ID_WWN blacklisted\n");
-	assert_int_equal(filter_property(&conf, &udev, 3),
+	assert_int_equal(filter_property(&conf, &udev, 3, "ID_SERIAL"),
 			 MATCH_PROPERTY_BLIST);
 }
 
@@ -281,17 +281,23 @@ static void test_property_whitelist(void **state)
 	static struct udev_device udev = { "sdb", { "ID_FOO", "ID_WWN", "ID_BAR", NULL } };
 	conf.elist_property = blist_property_wwn;
 	expect_condlog(3, "sdb: udev property ID_WWN whitelisted\n");
-	assert_int_equal(filter_property(&conf, &udev, 3),
+	assert_int_equal(filter_property(&conf, &udev, 3, "ID_SERIAL"),
 			 MATCH_PROPERTY_BLIST_EXCEPT);
 }
 
 static void test_property_missing(void **state)
 {
-	static struct udev_device udev = { "sdb", { "ID_FOO", "ID_BAZ", "ID_BAR", NULL } };
+	static struct udev_device udev = { "sdb", { "ID_FOO", "ID_BAZ", "ID_BAR", "ID_SERIAL", NULL } };
 	conf.blist_property = blist_property_wwn;
 	expect_condlog(3, "sdb: blacklisted, udev property missing\n");
-	assert_int_equal(filter_property(&conf, &udev, 3),
+	assert_int_equal(filter_property(&conf, &udev, 3, "ID_SERIAL"),
 			 MATCH_PROPERTY_BLIST_MISSING);
+	assert_int_equal(filter_property(&conf, &udev, 3, "ID_BLAH"),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_property(&conf, &udev, 3, ""),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_property(&conf, &udev, 3, NULL),
+			 MATCH_NOTHING);
 }
 
 struct udev_device test_udev = { "sdb", { "ID_FOO", "ID_WWN", "ID_BAR", NULL } };
@@ -347,16 +353,25 @@ static void test_filter_path_wwid(void **state)
 	assert_int_equal(filter_path(&conf, &test_pp), MATCH_WWID_BLIST);
 }
 
-struct udev_device miss_udev = { "sdb", { "ID_FOO", "ID_BAZ", "ID_BAR", NULL } };
+struct udev_device miss_udev = { "sdb", { "ID_FOO", "ID_BAZ", "ID_BAR", "ID_SERIAL", NULL } };
 
 struct path miss1_pp = { .dev = "sdc", .bus = SYSFS_BUS_SCSI,
 			.udev = &miss_udev,
+			 .uid_attribute = "ID_SERIAL",
 			.sg_id.proto_id = SCSI_PROTOCOL_ISCSI,
 			.vendor_id = "foo", .product_id = "baz",
 			.wwid = "plugh" };
 
 struct path miss2_pp = { .dev = "sdc", .bus = SYSFS_BUS_SCSI,
 			.udev = &test_udev,
+			 .uid_attribute = "ID_SERIAL",
+			.sg_id.proto_id = SCSI_PROTOCOL_ISCSI,
+			.vendor_id = "foo", .product_id = "baz",
+			.wwid = "plugh" };
+
+struct path miss3_pp = { .dev = "sdc", .bus = SYSFS_BUS_SCSI,
+			.udev = &miss_udev,
+			 .uid_attribute = "ID_EGGS",
 			.sg_id.proto_id = SCSI_PROTOCOL_ISCSI,
 			.vendor_id = "foo", .product_id = "baz",
 			.wwid = "plugh" };
@@ -387,6 +402,19 @@ static void test_filter_path_missing2(void **state)
 			 MATCH_NOTHING);
 }
 
+/* Here we use a different uid_attribute which is also missing, thus
+   the path is not blacklisted */
+static void test_filter_path_missing3(void **state)
+{
+	conf.blist_property = blist_property_wwn;
+	conf.blist_devnode = blist_devnode_sdb;
+	conf.blist_device = blist_device_foo_bar;
+	conf.blist_protocol = blist_protocol_fcp;
+	conf.blist_wwid = blist_wwid_xyzzy;
+	assert_int_equal(filter_path(&conf, &miss3_pp),
+			 MATCH_NOTHING);
+}
+
 static void test_filter_path_whitelist(void **state)
 {
 	conf.elist_property = blist_property_wwn;
@@ -495,6 +523,7 @@ int test_blacklist(void)
 		test_and_reset(test_filter_path_wwid),
 		test_and_reset(test_filter_path_missing1),
 		test_and_reset(test_filter_path_missing2),
+		test_and_reset(test_filter_path_missing3),
 		test_and_reset(test_filter_path_whitelist),
 		test_and_reset(test_filter_path_whitelist_property),
 		test_and_reset(test_filter_path_whitelist_devnode),
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
