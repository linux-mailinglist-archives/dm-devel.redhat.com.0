Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3106823332A
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jul 2020 15:35:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-1HfpyfuSN9-PW4F-jN1ghQ-1; Thu, 30 Jul 2020 09:35:20 -0400
X-MC-Unique: 1HfpyfuSN9-PW4F-jN1ghQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9757E918;
	Thu, 30 Jul 2020 13:35:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE183619B5;
	Thu, 30 Jul 2020 13:35:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A80C95A7B;
	Thu, 30 Jul 2020 13:35:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06UDRsVD010949 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jul 2020 09:27:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1DB6EF49C8; Thu, 30 Jul 2020 13:27:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19D707D293
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 13:27:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5136D18A6664
	for <dm-devel@redhat.com>; Thu, 30 Jul 2020 13:27:51 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-408-dqxAFfqYMoulmzPJmURynA-1; Thu, 30 Jul 2020 09:27:44 -0400
X-MC-Unique: dqxAFfqYMoulmzPJmURynA-1
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 4CD2B43AE14F5D6C58DC;
	Thu, 30 Jul 2020 21:27:36 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS410-HUB.china.huawei.com
	(10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Jul 2020
	21:27:28 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Benjamin Marzinski
	<bmarzins@redhat.com>,
	Martin Wilck <mwilck@suse.com>, <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <0c9f562c-9c2b-f18f-7399-79d0862a8843@huawei.com>
Date: Thu, 30 Jul 2020 21:27:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: [dm-devel] [PATCH] libmultipath: fix a memory leak in set_ble_device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi.
  I'm very sorry for subject mistake in first mail.

In set_ble_device func, if blist is NULL or ble is NULL,
the vendor and product isn't free. We think it is not
reasonable that strdup(XXX) is used as set_ble_device
and store_ble functions' parameter.

Here we call strdup() in store_ble and set_ble_device
functions and the string will be free if functions fail.
Because constant string like "sdb" will be their parameter,
char * is changed to const char *. This is base on
upstream-queue branch in openSUSE/multipath-tools.

Here we have another question. We want to know which branch
is mainline in https://github.com/openSUSE/multipath-tools.
The master is not changed since two years ago. And we find
the ups/submit-2007 branch in mwilck/multipath-tools have
a great changes. Do you have a plan to merge it to openSUSE.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

---
 libmultipath/blacklist.c | 74 +++++++++++++++++++++++-----------------
 libmultipath/blacklist.h |  4 +--
 tests/blacklist.c        | 31 +++++++----------
 3 files changed, 58 insertions(+), 51 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index db58ccca..04aeb426 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -29,14 +29,19 @@ char *check_invert(char *str, bool *invert)
 	return str;
 }

-int store_ble(vector blist, char * str, int origin)
+int store_ble(vector blist, const char * str, int origin)
 {
 	struct blentry * ble;
 	char *regex_str;
+	char *strdup_str = NULL;

 	if (!str)
 		return 0;

+	strdup_str = strdup(str);
+	if (!strdup_str)
+		return 1;
+
 	if (!blist)
 		goto out;

@@ -45,21 +50,21 @@ int store_ble(vector blist, char * str, int origin)
 	if (!ble)
 		goto out;

-	regex_str = check_invert(str, &ble->invert);
+	regex_str = check_invert(strdup_str, &ble->invert);
 	if (regcomp(&ble->regex, regex_str, REG_EXTENDED|REG_NOSUB))
 		goto out1;

 	if (!vector_alloc_slot(blist))
 		goto out1;

-	ble->str = str;
+	ble->str = strdup_str;
 	ble->origin = origin;
 	vector_set_slot(blist, ble);
 	return 0;
 out1:
 	FREE(ble);
 out:
-	FREE(str);
+	FREE(strdup_str);
 	return 1;
 }

@@ -79,10 +84,12 @@ int alloc_ble_device(vector blist)
 	return 0;
 }

-int set_ble_device(vector blist, char * vendor, char * product, int origin)
+int set_ble_device(vector blist, const char * vendor, const char * product, int origin)
 {
 	struct blentry_device * ble;
 	char *regex_str;
+	char *vendor_str = NULL;
+	char *product_str = NULL;

 	if (!blist)
 		return 1;
@@ -93,31 +100,42 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 		return 1;

 	if (vendor) {
-		regex_str = check_invert(vendor, &ble->vendor_invert);
+		vendor_str = STRDUP(vendor);
+		if (!vendor_str)
+			goto out;
+
+		regex_str = check_invert(vendor_str, &ble->vendor_invert);
 		if (regcomp(&ble->vendor_reg, regex_str,
 			    REG_EXTENDED|REG_NOSUB)) {
-			FREE(vendor);
-			if (product)
-				FREE(product);
-			return 1;
+			goto out;
 		}
-		ble->vendor = vendor;
+		ble->vendor = vendor_str;
 	}
 	if (product) {
-		regex_str = check_invert(product, &ble->product_invert);
+		product_str = STRDUP(product);
+		if (!product_str)
+			goto out1;
+
+		regex_str = check_invert(product_str, &ble->product_invert);
 		if (regcomp(&ble->product_reg, regex_str,
 			    REG_EXTENDED|REG_NOSUB)) {
-			FREE(product);
-			if (vendor) {
-				ble->vendor = NULL;
-				FREE(vendor);
-			}
-			return 1;
+			goto out1;
 		}
-		ble->product = product;
+		ble->product = product_str;
 	}
 	ble->origin = origin;
 	return 0;
+out1:
+	if (vendor_str)
+		ble->vendor = NULL;
+out:
+	if (vendor_str)
+		FREE(vendor_str);
+
+	if (product_str)
+		FREE(product_str);
+
+	return 1;
 }

 static int
@@ -178,20 +196,16 @@ setup_default_blist (struct config * conf)
 {
 	struct blentry * ble;
 	struct hwentry *hwe;
-	char * str;
 	int i;

-	str = STRDUP("!^(sd[a-z]|dasd[a-z]|nvme[0-9])");
-	if (!str)
-		return 1;
-	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
+	if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])"
+		, ORIGIN_DEFAULT)) {
 		return 1;
+	}

-	str = STRDUP("(SCSI_IDENT_|ID_WWN)");
-	if (!str)
-		return 1;
-	if (store_ble(conf->elist_property, str, ORIGIN_DEFAULT))
+	if (store_ble(conf->elist_property, "(SCSI_IDENT_|ID_WWN)", ORIGIN_DEFAULT)) {
 		return 1;
+	}

 	vector_foreach_slot (conf->hwtable, hwe, i) {
 		if (hwe->bl_product) {
@@ -202,9 +216,7 @@ setup_default_blist (struct config * conf)
 				return 1;
 			ble = VECTOR_SLOT(conf->blist_device,
 					  VECTOR_SIZE(conf->blist_device) - 1);
-			if (set_ble_device(conf->blist_device,
-					   STRDUP(hwe->vendor),
-					   STRDUP(hwe->bl_product),
+			if (set_ble_device(conf->blist_device,hwe->vendor,hwe->bl_product,
 					   ORIGIN_DEFAULT)) {
 				FREE(ble);
 				vector_del_slot(conf->blist_device, VECTOR_SIZE(conf->blist_device) - 1);
diff --git a/libmultipath/blacklist.h b/libmultipath/blacklist.h
index 4305857d..b08e0978 100644
--- a/libmultipath/blacklist.h
+++ b/libmultipath/blacklist.h
@@ -42,8 +42,8 @@ int filter_device (vector, vector, char *, char *, char *);
 int filter_path (struct config *, struct path *);
 int filter_property(struct config *, struct udev_device *, int, const char*);
 int filter_protocol(vector, vector, struct path *);
-int store_ble (vector, char *, int);
-int set_ble_device (vector, char *, char *, int);
+int store_ble (vector, const char *, int);
+int set_ble_device (vector, const char *, const char *, int);
 void free_blacklist (vector);
 void free_blacklist_device (vector);
 void merge_blacklist(vector);
diff --git a/tests/blacklist.c b/tests/blacklist.c
index d5c40898..84a3ba2f 100644
--- a/tests/blacklist.c
+++ b/tests/blacklist.c
@@ -94,67 +94,62 @@ static int setup(void **state)

 	blist_devnode_sdb = vector_alloc();
 	if (!blist_devnode_sdb ||
-	    store_ble(blist_devnode_sdb, strdup("sdb"), ORIGIN_CONFIG))
+	    store_ble(blist_devnode_sdb, "sdb", ORIGIN_CONFIG))
 		return -1;
 	blist_devnode_sdb_inv = vector_alloc();
 	if (!blist_devnode_sdb_inv ||
-	    store_ble(blist_devnode_sdb_inv, strdup("!sdb"), ORIGIN_CONFIG))
+	    store_ble(blist_devnode_sdb_inv, "!sdb", ORIGIN_CONFIG))
 		return -1;

 	blist_all = vector_alloc();
-	if (!blist_all || store_ble(blist_all, strdup(".*"), ORIGIN_CONFIG))
+	if (!blist_all || store_ble(blist_all, ".*", ORIGIN_CONFIG))
 		return -1;

 	blist_device_foo_bar = vector_alloc();
 	if (!blist_device_foo_bar || alloc_ble_device(blist_device_foo_bar) ||
-	    set_ble_device(blist_device_foo_bar, strdup("foo"), strdup("bar"),
-			   ORIGIN_CONFIG))
+	    set_ble_device(blist_device_foo_bar, "foo", "bar", ORIGIN_CONFIG))
 		return -1;
 	blist_device_foo_inv_bar = vector_alloc();
 	if (!blist_device_foo_inv_bar ||
 	    alloc_ble_device(blist_device_foo_inv_bar) ||
-	    set_ble_device(blist_device_foo_inv_bar, strdup("!foo"),
-			   strdup("bar"), ORIGIN_CONFIG))
+	    set_ble_device(blist_device_foo_inv_bar, "!foo", "bar", ORIGIN_CONFIG))
 		return -1;
 	blist_device_foo_bar_inv = vector_alloc();
 	if (!blist_device_foo_bar_inv ||
 	    alloc_ble_device(blist_device_foo_bar_inv) ||
-	    set_ble_device(blist_device_foo_bar_inv, strdup("foo"),
-			   strdup("!bar"), ORIGIN_CONFIG))
+	    set_ble_device(blist_device_foo_bar_inv, "foo", "!bar", ORIGIN_CONFIG))
 		return -1;

 	blist_device_all = vector_alloc();
 	if (!blist_device_all || alloc_ble_device(blist_device_all) ||
-	    set_ble_device(blist_device_all, strdup(".*"), strdup(".*"),
-			   ORIGIN_CONFIG))
+	    set_ble_device(blist_device_all, ".*", ".*", ORIGIN_CONFIG))
 		return -1;

 	blist_wwid_xyzzy = vector_alloc();
 	if (!blist_wwid_xyzzy ||
-	    store_ble(blist_wwid_xyzzy, strdup("xyzzy"), ORIGIN_CONFIG))
+	    store_ble(blist_wwid_xyzzy, "xyzzy", ORIGIN_CONFIG))
 		return -1;
 	blist_wwid_xyzzy_inv = vector_alloc();
 	if (!blist_wwid_xyzzy_inv ||
-	    store_ble(blist_wwid_xyzzy_inv, strdup("!xyzzy"), ORIGIN_CONFIG))
+	    store_ble(blist_wwid_xyzzy_inv, "!xyzzy", ORIGIN_CONFIG))
 		return -1;

 	blist_protocol_fcp = vector_alloc();
 	if (!blist_protocol_fcp ||
-	    store_ble(blist_protocol_fcp, strdup("scsi:fcp"), ORIGIN_CONFIG))
+	    store_ble(blist_protocol_fcp, "scsi:fcp", ORIGIN_CONFIG))
 		return -1;
 	blist_protocol_fcp_inv = vector_alloc();
 	if (!blist_protocol_fcp_inv ||
-	    store_ble(blist_protocol_fcp_inv, strdup("!scsi:fcp"),
-		      ORIGIN_CONFIG))
+	    store_ble(blist_protocol_fcp_inv, "!scsi:fcp", ORIGIN_CONFIG))
 		return -1;

 	blist_property_wwn = vector_alloc();
 	if (!blist_property_wwn ||
-	    store_ble(blist_property_wwn, strdup("ID_WWN"), ORIGIN_CONFIG))
+	    store_ble(blist_property_wwn, "ID_WWN", ORIGIN_CONFIG))
 		return -1;
 	blist_property_wwn_inv = vector_alloc();
 	if (!blist_property_wwn_inv ||
-	    store_ble(blist_property_wwn_inv, strdup("!ID_WWN"), ORIGIN_CONFIG))
+	    store_ble(blist_property_wwn_inv, "!ID_WWN", ORIGIN_CONFIG))
 		return -1;

 	return 0;
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

