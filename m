Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5469A1F48EA
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 23:36:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591738564;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lBhPVnxZHQ5YwwXFKD6Jq2bllS8mQoQTZzqny/M2Igo=;
	b=gatQFoQrWwBfFB2lCGyCni6+V0JQ5n/NYbECDYWVppJPp3+7B8odT1vt4qimb2aVteGPX+
	vdIxUs4wUQnYSg4eR+QWm4nIiJb5OZ14nInSCJSvnA5ZKi3xNijOD7YfPbkc7xf/FOFXVn
	Dd1KhnCponHuHSeXt2MFHDwGvQ5Usjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-j-5ea5HqMiiN9VVqIbe-1A-1; Tue, 09 Jun 2020 17:36:01 -0400
X-MC-Unique: j-5ea5HqMiiN9VVqIbe-1A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F24F71883604;
	Tue,  9 Jun 2020 21:35:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6978A5D9E5;
	Tue,  9 Jun 2020 21:35:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C62C91809547;
	Tue,  9 Jun 2020 21:35:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059LZc0M029296 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 17:35:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35A795D9E5; Tue,  9 Jun 2020 21:35:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FB0D5D9EF;
	Tue,  9 Jun 2020 21:35:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 059LZZVV026858; 
	Tue, 9 Jun 2020 16:35:36 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 059LZZGs026857;
	Tue, 9 Jun 2020 16:35:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Jun 2020 16:35:29 -0500
Message-Id: <1591738529-26810-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
References: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/3] libmultipath: invert regexes that start
	with exclamation point
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

The number of devices that multipath needs to blacklist keeps growing,
and the udev rules already have

KERNEL!="sd*|dasd*|nvme*", GOTO="end_mpath"

so they only work correctly with these device types.  Instead of
individually blacklisting every type of device that can't be
multipathed, multipath's default blacklist should work like the udev
rule, and blacklist all devices that aren't scsi, dasd, or nvme.
Unfortunately, the c regex library doesn't support negative lookahead.
Instead, multipath should treat "!" at the beginning of
blacklist/exceptions regexes as inverse matching the rest of the regex.
If users need to match a literal '!' as the first character of their
regex, they can use "\!" instead. This allows multipath to change the
default devnode blacklist regex to "!^(sd[a-z]|dasd[a-z]|nvme[0-9])".

Extra tests have been added to the blacklist unit tests to verify the
inverse matching code and the new default blacklist.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/blacklist.c   |  41 +++++++++-----
 libmultipath/blacklist.h   |   3 +
 multipath/multipath.conf.5 |  17 ++++--
 tests/blacklist.c          | 110 +++++++++++++++++++++++++++++++++++++
 tests/test-lib.c           |   2 +-
 5 files changed, 155 insertions(+), 18 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index c21a0e27..db58ccca 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -15,9 +15,24 @@
 #include "structs_vec.h"
 #include "print.h"
 
+char *check_invert(char *str, bool *invert)
+{
+	if (str[0] == '!') {
+		*invert = true;
+		return str + 1;
+	}
+	if (str[0] == '\\' && str[1] == '!') {
+		*invert = false;
+		return str + 1;
+	}
+	*invert = false;
+	return str;
+}
+
 int store_ble(vector blist, char * str, int origin)
 {
 	struct blentry * ble;
+	char *regex_str;
 
 	if (!str)
 		return 0;
@@ -30,7 +45,8 @@ int store_ble(vector blist, char * str, int origin)
 	if (!ble)
 		goto out;
 
-	if (regcomp(&ble->regex, str, REG_EXTENDED|REG_NOSUB))
+	regex_str = check_invert(str, &ble->invert);
+	if (regcomp(&ble->regex, regex_str, REG_EXTENDED|REG_NOSUB))
 		goto out1;
 
 	if (!vector_alloc_slot(blist))
@@ -66,6 +82,7 @@ int alloc_ble_device(vector blist)
 int set_ble_device(vector blist, char * vendor, char * product, int origin)
 {
 	struct blentry_device * ble;
+	char *regex_str;
 
 	if (!blist)
 		return 1;
@@ -76,7 +93,8 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 		return 1;
 
 	if (vendor) {
-		if (regcomp(&ble->vendor_reg, vendor,
+		regex_str = check_invert(vendor, &ble->vendor_invert);
+		if (regcomp(&ble->vendor_reg, regex_str,
 			    REG_EXTENDED|REG_NOSUB)) {
 			FREE(vendor);
 			if (product)
@@ -86,7 +104,8 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 		ble->vendor = vendor;
 	}
 	if (product) {
-		if (regcomp(&ble->product_reg, product,
+		regex_str = check_invert(product, &ble->product_invert);
+		if (regcomp(&ble->product_reg, regex_str,
 			    REG_EXTENDED|REG_NOSUB)) {
 			FREE(product);
 			if (vendor) {
@@ -108,7 +127,7 @@ match_reglist (vector blist, const char * str)
 	struct blentry * ble;
 
 	vector_foreach_slot (blist, ble, i) {
-		if (!regexec(&ble->regex, str, 0, NULL, 0))
+		if (!!regexec(&ble->regex, str, 0, NULL, 0) == ble->invert)
 			return 1;
 	}
 	return 0;
@@ -125,9 +144,11 @@ match_reglist_device (const struct _vector *blist, const char * vendor,
 		if (!ble->vendor && !ble->product)
 			continue;
 		if ((!ble->vendor ||
-		     !regexec(&ble->vendor_reg, vendor, 0, NULL, 0)) &&
+		     !!regexec(&ble->vendor_reg, vendor, 0, NULL, 0) ==
+		     ble->vendor_invert) &&
 		    (!ble->product ||
-		     !regexec(&ble->product_reg, product, 0, NULL, 0)))
+		     !!regexec(&ble->product_reg, product, 0, NULL, 0) ==
+		     ble->product_invert))
 			return 1;
 	}
 	return 0;
@@ -160,13 +181,7 @@ setup_default_blist (struct config * conf)
 	char * str;
 	int i;
 
-	str = STRDUP("^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]");
-	if (!str)
-		return 1;
-	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
-		return 1;
-
-	str = STRDUP("^(td|hd|vd)[a-z]");
+	str = STRDUP("!^(sd[a-z]|dasd[a-z]|nvme[0-9])");
 	if (!str)
 		return 1;
 	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
diff --git a/libmultipath/blacklist.h b/libmultipath/blacklist.h
index 2d721f60..4305857d 100644
--- a/libmultipath/blacklist.h
+++ b/libmultipath/blacklist.h
@@ -20,6 +20,7 @@
 struct blentry {
 	char * str;
 	regex_t regex;
+	bool invert;
 	int origin;
 };
 
@@ -28,6 +29,8 @@ struct blentry_device {
 	char * product;
 	regex_t vendor_reg;
 	regex_t product_reg;
+	bool vendor_invert;
+	bool product_invert;
 	int origin;
 };
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..28cb6057 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1248,6 +1248,16 @@ being handled by multipath-tools.
 .LP
 .
 .
+In the \fIblacklist\fR and \fIblacklist_exceptions\fR sections, starting a
+quoted value with an exclamation mark \fB"!"\fR will invert the matching
+of the rest of the regular expression. For instance, \fB"!^sd[a-z]"\fR will
+match all values that do not start with \fB"sd[a-z]"\fR. The exclamation mark
+can be escaped \fB"\\!"\fR to match a literal \fB!\fR at the start of a
+regular expression. \fBNote:\fR The exclamation mark must be inside quotes,
+otherwise it will be treated as starting a comment.
+.LP
+.
+.
 The \fIblacklist_exceptions\fR section is used to revert the actions of the
 \fIblacklist\fR section. This allows one to selectively include ("whitelist") devices which
 would normally be excluded via the \fIblacklist\fR section. A common usage is
@@ -1264,10 +1274,9 @@ unless explicitly stated.
 Regular expression matching the device nodes to be excluded/included.
 .RS
 .PP
-The default \fIblacklist\fR consists of the regular expressions
-"^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]" and
-"^(td|hd|vd)[a-z]". This causes virtual devices, non-disk devices, and some other
-device types to be excluded from multipath handling by default.
+The default \fIblacklist\fR consists of the regular expression
+\fB"!^(sd[a-z]|dasd[a-z]|nvme[0-9])"\fR. This causes all device types other
+than scsi, dasd, and nvme to be excluded from multipath handling by default.
 .RE
 .TP
 .B wwid
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 6e7c1864..d5c40898 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -60,20 +60,46 @@ __wrap_udev_list_entry_get_name(struct udev_list_entry *list_entry)
 	return *(const char **)list_entry;
 }
 
+vector elist_property_default;
+vector blist_devnode_default;
 vector blist_devnode_sdb;
+vector blist_devnode_sdb_inv;
 vector blist_all;
 vector blist_device_foo_bar;
+vector blist_device_foo_inv_bar;
+vector blist_device_foo_bar_inv;
 vector blist_device_all;
 vector blist_wwid_xyzzy;
+vector blist_wwid_xyzzy_inv;
 vector blist_protocol_fcp;
+vector blist_protocol_fcp_inv;
 vector blist_property_wwn;
+vector blist_property_wwn_inv;
 
 static int setup(void **state)
 {
+	struct config conf;
+
+	memset(&conf, 0, sizeof(conf));
+	conf.blist_devnode = vector_alloc();
+	if (!conf.blist_devnode)
+		return -1;
+	conf.elist_property = vector_alloc();
+	if (!conf.elist_property)
+		return -1;
+	if (setup_default_blist(&conf) != 0)
+		return -1;
+	elist_property_default = conf.elist_property;
+	blist_devnode_default = conf.blist_devnode;
+
 	blist_devnode_sdb = vector_alloc();
 	if (!blist_devnode_sdb ||
 	    store_ble(blist_devnode_sdb, strdup("sdb"), ORIGIN_CONFIG))
 		return -1;
+	blist_devnode_sdb_inv = vector_alloc();
+	if (!blist_devnode_sdb_inv ||
+	    store_ble(blist_devnode_sdb_inv, strdup("!sdb"), ORIGIN_CONFIG))
+		return -1;
 
 	blist_all = vector_alloc();
 	if (!blist_all || store_ble(blist_all, strdup(".*"), ORIGIN_CONFIG))
@@ -84,6 +110,18 @@ static int setup(void **state)
 	    set_ble_device(blist_device_foo_bar, strdup("foo"), strdup("bar"),
 			   ORIGIN_CONFIG))
 		return -1;
+	blist_device_foo_inv_bar = vector_alloc();
+	if (!blist_device_foo_inv_bar ||
+	    alloc_ble_device(blist_device_foo_inv_bar) ||
+	    set_ble_device(blist_device_foo_inv_bar, strdup("!foo"),
+			   strdup("bar"), ORIGIN_CONFIG))
+		return -1;
+	blist_device_foo_bar_inv = vector_alloc();
+	if (!blist_device_foo_bar_inv ||
+	    alloc_ble_device(blist_device_foo_bar_inv) ||
+	    set_ble_device(blist_device_foo_bar_inv, strdup("foo"),
+			   strdup("!bar"), ORIGIN_CONFIG))
+		return -1;
 
 	blist_device_all = vector_alloc();
 	if (!blist_device_all || alloc_ble_device(blist_device_all) ||
@@ -95,29 +133,50 @@ static int setup(void **state)
 	if (!blist_wwid_xyzzy ||
 	    store_ble(blist_wwid_xyzzy, strdup("xyzzy"), ORIGIN_CONFIG))
 		return -1;
+	blist_wwid_xyzzy_inv = vector_alloc();
+	if (!blist_wwid_xyzzy_inv ||
+	    store_ble(blist_wwid_xyzzy_inv, strdup("!xyzzy"), ORIGIN_CONFIG))
+		return -1;
 
 	blist_protocol_fcp = vector_alloc();
 	if (!blist_protocol_fcp ||
 	    store_ble(blist_protocol_fcp, strdup("scsi:fcp"), ORIGIN_CONFIG))
 		return -1;
+	blist_protocol_fcp_inv = vector_alloc();
+	if (!blist_protocol_fcp_inv ||
+	    store_ble(blist_protocol_fcp_inv, strdup("!scsi:fcp"),
+		      ORIGIN_CONFIG))
+		return -1;
 
 	blist_property_wwn = vector_alloc();
 	if (!blist_property_wwn ||
 	    store_ble(blist_property_wwn, strdup("ID_WWN"), ORIGIN_CONFIG))
 		return -1;
+	blist_property_wwn_inv = vector_alloc();
+	if (!blist_property_wwn_inv ||
+	    store_ble(blist_property_wwn_inv, strdup("!ID_WWN"), ORIGIN_CONFIG))
+		return -1;
 
 	return 0;
 }
 
 static int teardown(void **state)
 {
+	free_blacklist(elist_property_default);
+	free_blacklist(blist_devnode_default);
 	free_blacklist(blist_devnode_sdb);
+	free_blacklist(blist_devnode_sdb_inv);
 	free_blacklist(blist_all);
 	free_blacklist_device(blist_device_foo_bar);
+	free_blacklist_device(blist_device_foo_inv_bar);
+	free_blacklist_device(blist_device_foo_bar_inv);
 	free_blacklist_device(blist_device_all);
 	free_blacklist(blist_wwid_xyzzy);
+	free_blacklist(blist_wwid_xyzzy_inv);
 	free_blacklist(blist_protocol_fcp);
+	free_blacklist(blist_protocol_fcp_inv);
 	free_blacklist(blist_property_wwn);
+	free_blacklist(blist_property_wwn_inv);
 	return 0;
 }
 
@@ -141,6 +200,11 @@ static void test_devnode_blacklist(void **state)
 	expect_condlog(3, "sdb: device node name blacklisted\n");
 	assert_int_equal(filter_devnode(blist_devnode_sdb, NULL, "sdb"),
 			 MATCH_DEVNODE_BLIST);
+	assert_int_equal(filter_devnode(blist_devnode_sdb_inv, NULL, "sdb"),
+			 MATCH_NOTHING);
+	expect_condlog(3, "sdc: device node name blacklisted\n");
+	assert_int_equal(filter_devnode(blist_devnode_sdb_inv, NULL, "sdc"),
+			 MATCH_DEVNODE_BLIST);
 }
 
 static void test_devnode_whitelist(void **state)
@@ -159,12 +223,39 @@ static void test_devnode_missing(void **state)
 			 MATCH_NOTHING);
 }
 
+static void test_devnode_default(void **state)
+{
+	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "sdaa"),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "nvme0n1"),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "dasda"),
+			 MATCH_NOTHING);
+	expect_condlog(3, "hda: device node name blacklisted\n");
+	assert_int_equal(filter_devnode(blist_devnode_default, NULL, "hda"),
+			 MATCH_DEVNODE_BLIST);
+}
+
 static void test_device_blacklist(void **state)
 {
 	expect_condlog(3, "sdb: (foo:bar) vendor/product blacklisted\n");
 	assert_int_equal(filter_device(blist_device_foo_bar, NULL, "foo",
 				       "bar", "sdb"),
 			 MATCH_DEVICE_BLIST);
+	assert_int_equal(filter_device(blist_device_foo_inv_bar, NULL, "foo",
+				        "bar", "sdb"),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_device(blist_device_foo_bar_inv, NULL, "foo",
+				        "bar", "sdb"),
+			 MATCH_NOTHING);
+	expect_condlog(3, "sdb: (baz:bar) vendor/product blacklisted\n");
+	assert_int_equal(filter_device(blist_device_foo_inv_bar, NULL, "baz",
+				        "bar", "sdb"),
+			 MATCH_DEVICE_BLIST);
+	expect_condlog(3, "sdb: (foo:baz) vendor/product blacklisted\n");
+	assert_int_equal(filter_device(blist_device_foo_bar_inv, NULL, "foo",
+				        "baz", "sdb"),
+			 MATCH_DEVICE_BLIST);
 }
 
 static void test_device_whitelist(void **state)
@@ -191,6 +282,11 @@ static void test_wwid_blacklist(void **state)
 	expect_condlog(3, "sdb: wwid xyzzy blacklisted\n");
 	assert_int_equal(filter_wwid(blist_wwid_xyzzy, NULL, "xyzzy", "sdb"),
 			 MATCH_WWID_BLIST);
+	assert_int_equal(filter_wwid(blist_wwid_xyzzy_inv, NULL, "xyzzy",
+				     "sdb"), MATCH_NOTHING);
+	expect_condlog(3, "sdb: wwid plugh blacklisted\n");
+	assert_int_equal(filter_wwid(blist_wwid_xyzzy_inv, NULL, "plugh",
+				     "sdb"), MATCH_WWID_BLIST);
 }
 
 static void test_wwid_whitelist(void **state)
@@ -218,6 +314,12 @@ static void test_protocol_blacklist(void **state)
 	expect_condlog(3, "sdb: protocol scsi:fcp blacklisted\n");
 	assert_int_equal(filter_protocol(blist_protocol_fcp, NULL, &pp),
 			 MATCH_PROTOCOL_BLIST);
+	assert_int_equal(filter_protocol(blist_protocol_fcp_inv, NULL, &pp),
+			 MATCH_NOTHING);
+	pp.sg_id.proto_id = SCSI_PROTOCOL_ATA;
+	expect_condlog(3, "sdb: protocol scsi:ata blacklisted\n");
+	assert_int_equal(filter_protocol(blist_protocol_fcp_inv, NULL, &pp),
+			 MATCH_PROTOCOL_BLIST);
 }
 
 static void test_protocol_whitelist(void **state)
@@ -245,10 +347,17 @@ static void test_protocol_missing(void **state)
 static void test_property_blacklist(void **state)
 {
 	static struct udev_device udev = { "sdb", { "ID_FOO", "ID_WWN", "ID_BAR", NULL } };
+	static struct udev_device udev_inv = { "sdb", { "ID_WWN", NULL } };
 	conf.blist_property = blist_property_wwn;
 	expect_condlog(3, "sdb: udev property ID_WWN blacklisted\n");
 	assert_int_equal(filter_property(&conf, &udev, 3, "ID_SERIAL"),
 			 MATCH_PROPERTY_BLIST);
+	conf.blist_property = blist_property_wwn_inv;
+	expect_condlog(3, "sdb: udev property ID_FOO blacklisted\n");
+	assert_int_equal(filter_property(&conf, &udev, 3, "ID_SERIAL"),
+			 MATCH_PROPERTY_BLIST);
+	assert_int_equal(filter_property(&conf, &udev_inv, 3, "ID_SERIAL"),
+			 MATCH_NOTHING);
 }
 
 /* the property check works different in that you check all the property
@@ -484,6 +593,7 @@ int test_blacklist(void)
 		cmocka_unit_test(test_devnode_blacklist),
 		cmocka_unit_test(test_devnode_whitelist),
 		cmocka_unit_test(test_devnode_missing),
+		cmocka_unit_test(test_devnode_default),
 		cmocka_unit_test(test_device_blacklist),
 		cmocka_unit_test(test_device_whitelist),
 		cmocka_unit_test(test_device_missing),
diff --git a/tests/test-lib.c b/tests/test-lib.c
index 00bae58e..b7c09cc2 100644
--- a/tests/test-lib.c
+++ b/tests/test-lib.c
@@ -15,7 +15,7 @@
 #include "test-lib.h"
 
 const int default_mask = (DI_SYSFS|DI_BLACKLIST|DI_WWID|DI_CHECKER|DI_PRIO);
-const char default_devnode[] = "sdTEST";
+const char default_devnode[] = "sdxTEST";
 const char default_wwid[] = "TEST-WWID";
 /* default_wwid should be a substring of default_wwid_1! */
 const char default_wwid_1[] = "TEST-WWID-1";
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

