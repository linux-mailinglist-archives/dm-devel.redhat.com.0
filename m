Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1489B1F03CB
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:21:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402867;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eVk3slDTaydxh9pa2z+v9cJtCUrs9rcwCbrpV1KxVe8=;
	b=ZN2ab+M2H+RsD9qC+GZOWcjuzK5tiYxQTsqG+etxQFix0UhAlOuszLHKzSrzK0uAmHWZt6
	uZAXwnDQt22ClALGbAQfGHTKx0sk0TMlBlPi2+yy3JQeed+zhmiwLrmyIF+B1vgIyQIA30
	T60ckkXE8Z8lnPkTTPhd/xrKhLIppvw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-FIJlShPEN0CAcnAI9NOsZg-1; Fri, 05 Jun 2020 20:20:24 -0400
X-MC-Unique: FIJlShPEN0CAcnAI9NOsZg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8953108BD0D;
	Sat,  6 Jun 2020 00:20:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97DAD60C1D;
	Sat,  6 Jun 2020 00:20:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 38A7887420;
	Sat,  6 Jun 2020 00:20:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0550V8wZ000705 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 20:31:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0A77660BE2; Fri,  5 Jun 2020 00:31:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8896C60E1C;
	Fri,  5 Jun 2020 00:31:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0550V3hu025530; 
	Thu, 4 Jun 2020 19:31:03 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0550V2I2025529;
	Thu, 4 Jun 2020 19:31:02 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  4 Jun 2020 19:31:00 -0500
Message-Id: <1591317060-25484-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
References: <1591317060-25484-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH 2/2] libmultipath: change how default devnode
	blacklist works
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Instead, multipath needs a special regex list that it can check.  If the
denode doesn't match any rule in the list, it will be blacklisted. This
is checked after the devnode exceptions, so it is still possible to add
other devices via the exceptions.

It is not possible (or necessary) to directly set the special regex list
in /etc/multipath.conf. Because of this, there is no good way to show it
with "multipathd show config" or "multipath -t", since those are
expected to print a valid condig. It is displayed in the "multipathd
show blacklist" output, however.

The blacklist unit tests have also been updated to deal with the
changes.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/blacklist.c   | 13 +++++--------
 libmultipath/config.c      |  5 +++++
 libmultipath/config.h      |  1 +
 libmultipath/print.c       |  9 ++++++++-
 multipath/multipath.conf.5 | 11 +++++++----
 tests/blacklist.c          | 33 +++++++++++++++++++++++++++++++++
 6 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index bc8e9e00..ae74b6b7 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -192,16 +192,10 @@ setup_default_blist (struct config * conf)
 	char * str;
 	int i;
 
-	str = STRDUP("^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]");
+	str = STRDUP("^(sd[a-z]|dasd[a-z]|nvme[0-9])");
 	if (!str)
 		return 1;
-	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
-		return 1;
-
-	str = STRDUP("^(td|hd|vd)[a-z]");
-	if (!str)
-		return 1;
-	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
+	if (store_ble(conf->elist_devnode_default, str, ORIGIN_DEFAULT))
 		return 1;
 
 	str = STRDUP("(SCSI_IDENT_|ID_WWN)");
@@ -318,6 +312,9 @@ filter_devnode (struct config *conf, char * dev)
 	if (dev) {
 		if (_blacklist_exceptions(conf->elist_devnode, dev))
 			r = MATCH_DEVNODE_BLIST_EXCEPT;
+		else if (!_blacklist_exceptions(conf->elist_devnode_default,
+						dev))
+			r = MATCH_DEVNODE_BLIST;
 		else if (_blacklist(conf->blist_devnode, dev))
 			r = MATCH_DEVNODE_BLIST;
 	}
diff --git a/libmultipath/config.c b/libmultipath/config.c
index b4d87689..b695f01b 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -632,6 +632,7 @@ free_config (struct config * conf)
 	if (conf->config_dir)
 		FREE(conf->config_dir);
 
+	free_blacklist(conf->elist_devnode_default);
 	free_blacklist(conf->blist_devnode);
 	free_blacklist(conf->blist_wwid);
 	free_blacklist(conf->blist_property);
@@ -803,6 +804,10 @@ load_config (char * file)
 	condlog(3, "polling interval: %d, max: %d",
 		conf->checkint, conf->max_checkint);
 
+	conf->elist_devnode_default = vector_alloc();
+	if (!conf->elist_devnode_default)
+		goto out;
+
 	if (conf->blist_devnode == NULL) {
 		conf->blist_devnode = vector_alloc();
 
diff --git a/libmultipath/config.h b/libmultipath/config.h
index ceecff2d..49fae19f 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -223,6 +223,7 @@ struct config {
 	vector blist_device;
 	vector blist_property;
 	vector blist_protocol;
+	vector elist_devnode_default;
 	vector elist_devnode;
 	vector elist_wwid;
 	vector elist_device;
diff --git a/libmultipath/print.c b/libmultipath/print.c
index ee79a9d0..c003ee40 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -1702,7 +1702,14 @@ int snprint_blacklist_report(struct config *conf, char *buff, int len)
 	if ((len - fwd - threshold) <= 0)
 		return len;
 	fwd += snprintf(buff + fwd, len - fwd, "device node rules:\n"
-					       "- blacklist:\n");
+					       "- allowed:\n");
+	if (!snprint_blacklist_group(buff, len, &fwd,
+				     &conf->elist_devnode_default))
+		return len;
+
+	if ((len - fwd - threshold) <= 0)
+		return len;
+	fwd += snprintf(buff + fwd, len - fwd, "- blacklist:\n");
 	if (!snprint_blacklist_group(buff, len, &fwd, &conf->blist_devnode))
 		return len;
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 05a5e8ff..d0b8c5c0 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1264,10 +1264,13 @@ unless explicitly stated.
 Regular expression matching the device nodes to be excluded/included.
 .RS
 .PP
-The default \fIblacklist\fR consists of the regular expressions
-"^(ram|zram|raw|loop|fd|md|dm-|sr|scd|st|dcssblk)[0-9]" and
-"^(td|hd|vd)[a-z]". This causes virtual devices, non-disk devices, and some other
-device types to be excluded from multipath handling by default.
+By default, multipath excludes devnodes that do not match the regular
+expression "^(sd[a-z]|dasd[a-z]|nvme[0-9])". This works differently than how
+the user defined expressions work in either the \fIblacklist\fR section (which
+excludes devnodes that match the expression) or the \fIblacklist_exceptions\fR
+section (which includes devnodes that match the regular expression). For
+multipath to include devices that are not scsi, dasd, or nvme, the devnodes
+must be added to the \fIblacklist_exceptions\fR section.
 .RE
 .TP
 .B wwid
diff --git a/tests/blacklist.c b/tests/blacklist.c
index 0ae82592..8db3d394 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -60,6 +60,8 @@ __wrap_udev_list_entry_get_name(struct udev_list_entry *list_entry)
 	return *(const char **)list_entry;
 }
 
+vector elist_devnode_default;
+vector elist_property_default;
 vector blist_devnode_sdb;
 vector blist_all;
 vector blist_device_foo_bar;
@@ -70,6 +72,20 @@ vector blist_property_wwn;
 
 static int setup(void **state)
 {
+	struct config conf;
+
+	memset(&conf, 0, sizeof(conf));
+	conf.elist_devnode_default = vector_alloc();
+	if (!conf.elist_devnode_default)
+		return -1;
+	conf.elist_property = vector_alloc();
+	if (!conf.elist_property)
+		return -1;
+	if (setup_default_blist(&conf) != 0)
+		return -1;
+	elist_property_default = conf.elist_property;
+	elist_devnode_default = conf.elist_devnode_default;
+
 	blist_devnode_sdb = vector_alloc();
 	if (!blist_devnode_sdb ||
 	    store_ble(blist_devnode_sdb, strdup("sdb"), ORIGIN_CONFIG))
@@ -111,6 +127,8 @@ static int setup(void **state)
 
 static int teardown(void **state)
 {
+	free_blacklist(elist_devnode_default);
+	free_blacklist(elist_property_default);
 	free_blacklist(blist_devnode_sdb);
 	free_blacklist(blist_all);
 	free_blacklist_device(blist_device_foo_bar);
@@ -123,6 +141,7 @@ static int teardown(void **state)
 
 static int reset_blists(void **state)
 {
+	conf.elist_devnode_default = NULL;
 	conf.blist_devnode = NULL;
 	conf.blist_wwid = NULL;
 	conf.blist_property = NULL;
@@ -159,8 +178,16 @@ static void test_devnode_whitelist(void **state)
 static void test_devnode_missing(void **state)
 {
 	conf.blist_devnode = blist_devnode_sdb;
+	conf.elist_devnode_default = elist_devnode_default;
 	assert_int_equal(filter_devnode(&conf, "sdc"),
 			 MATCH_NOTHING);
+	assert_int_equal(filter_devnode(&conf, "nvme0n1"),
+			 MATCH_NOTHING);
+	assert_int_equal(filter_devnode(&conf, "dasda"),
+			 MATCH_NOTHING);
+	expect_condlog(3, "hda: device node name blacklisted\n");
+	assert_int_equal(filter_devnode(&conf, "hda"),
+			 MATCH_DEVNODE_BLIST);
 }
 
 static void test_device_blacklist(void **state)
@@ -302,6 +329,7 @@ static void test_filter_path_devnode(void **state)
 	/* always must include property elist, to avoid "missing property"
 	 * blacklisting */
 	conf.elist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_devnode = blist_devnode_sdb;
 	expect_condlog(3, "sdb: udev property ID_WWN whitelisted\n");
 	expect_condlog(3, "sdb: device node name blacklisted\n");
@@ -313,6 +341,7 @@ static void test_filter_path_device(void **state)
 	/* always must include property elist, to avoid "missing property"
 	 * blacklisting */
 	conf.elist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_device = blist_device_foo_bar;
 	expect_condlog(3, "sdb: udev property ID_WWN whitelisted\n");
 	expect_condlog(3, "sdb: (foo:bar) vendor/product blacklisted\n");
@@ -322,6 +351,7 @@ static void test_filter_path_device(void **state)
 static void test_filter_path_protocol(void **state)
 {
 	conf.elist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_protocol = blist_protocol_fcp;
 	expect_condlog(3, "sdb: udev property ID_WWN whitelisted\n");
 	expect_condlog(3, "sdb: protocol scsi:fcp blacklisted\n");
@@ -331,6 +361,7 @@ static void test_filter_path_protocol(void **state)
 static void test_filter_path_wwid(void **state)
 {
 	conf.elist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_wwid = blist_wwid_xyzzy;
 	expect_condlog(3, "sdb: udev property ID_WWN whitelisted\n");
 	expect_condlog(3, "sdb: wwid xyzzy blacklisted\n");
@@ -377,6 +408,7 @@ static void test_filter_path_missing1(void **state)
 static void test_filter_path_missing2(void **state)
 {
 	conf.elist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_devnode = blist_devnode_sdb;
 	conf.blist_device = blist_device_foo_bar;
 	conf.blist_protocol = blist_protocol_fcp;
@@ -391,6 +423,7 @@ static void test_filter_path_missing2(void **state)
 static void test_filter_path_missing3(void **state)
 {
 	conf.blist_property = blist_property_wwn;
+	conf.elist_devnode_default = elist_devnode_default;
 	conf.blist_devnode = blist_devnode_sdb;
 	conf.blist_device = blist_device_foo_bar;
 	conf.blist_protocol = blist_protocol_fcp;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

