Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D615324171D
	for <lists+dm-devel@lfdr.de>; Tue, 11 Aug 2020 09:24:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-Ll8EYDwANaSbWiC4bx2H4A-1; Tue, 11 Aug 2020 03:24:25 -0400
X-MC-Unique: Ll8EYDwANaSbWiC4bx2H4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9398F79EC2;
	Tue, 11 Aug 2020 07:24:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8DE67C0F5;
	Tue, 11 Aug 2020 07:24:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6D2CBA552B;
	Tue, 11 Aug 2020 07:24:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07B7OAHZ028566 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 03:24:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6354D2156A49; Tue, 11 Aug 2020 07:24:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5ECD62166BA4
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 07:24:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 351A48007B3
	for <dm-devel@redhat.com>; Tue, 11 Aug 2020 07:24:08 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-274-FA0Gr8auM5iHE4-Z7iAOyA-1; Tue, 11 Aug 2020 03:24:05 -0400
X-MC-Unique: FA0Gr8auM5iHE4-Z7iAOyA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id BF9E9167C08A4A0747D9;
	Tue, 11 Aug 2020 15:23:59 +0800 (CST)
Received: from [127.0.0.1] (10.174.179.62) by DGGEMS412-HUB.china.huawei.com
	(10.3.19.212) with Microsoft SMTP Server id 14.3.487.0; Tue, 11 Aug 2020
	15:23:51 +0800
To: Christophe Varoqui <christophe.varoqui@opensvc.com>, Martin Wilck
	<mwilck@suse.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, <dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <c6ff6ae5-8b58-4beb-b6c9-10db444ffce2@huawei.com>
Date: Tue, 11 Aug 2020 15:23:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-GB
X-Originating-IP: [10.174.179.62]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong@huawei.com, liuzhiqiang26@huawei.com, lutianxiong@huawei.com
Subject: [dm-devel] [PATCH V2] libmultipath: fix a memory leak in
	set_ble_device
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

In set_ble_device func, if blist is NULL or ble is NULL,
the vendor and product isn't freed. We think it is not
reasonable that strdup(XXX) is used as set_ble_device
and store_ble functions' parameter.

Here we call strdup() in store_ble and set_ble_device
functions and the string will be free if functions fail.
Because constant string like "sdb" will be their parameter,
char * is changed to const char *. This is base on
upstream-queue branch in openSUSE/multipath-tools.

Signed-off-by: Lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
---
 libmultipath/blacklist.c | 81 ++++++++++++++++++++++------------------
 libmultipath/blacklist.h |  4 +-
 tests/blacklist.c        | 31 +++++++--------
 3 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index db58ccca..a9ad9de4 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -29,14 +29,19 @@ char *check_invert(char *str, bool *invert)
 	return str;
 }

-int store_ble(vector blist, char * str, int origin)
+int store_ble(vector blist, const char *str, int origin)
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
+int set_ble_device(vector blist, const char *vendor, const char *product, int origin)
 {
 	struct blentry_device * ble;
 	char *regex_str;
+	char *vendor_str = NULL;
+	char *product_str = NULL;

 	if (!blist)
 		return 1;
@@ -93,31 +100,40 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 		return 1;

 	if (vendor) {
-		regex_str = check_invert(vendor, &ble->vendor_invert);
-		if (regcomp(&ble->vendor_reg, regex_str,
-			    REG_EXTENDED|REG_NOSUB)) {
-			FREE(vendor);
-			if (product)
-				FREE(product);
-			return 1;
-		}
-		ble->vendor = vendor;
+		vendor_str = STRDUP(vendor);
+		if (!vendor_str)
+			goto out;
+
+		regex_str = check_invert(vendor_str, &ble->vendor_invert);
+		if (regcomp(&ble->vendor_reg, regex_str, REG_EXTENDED|REG_NOSUB))
+			goto out;
+
+		ble->vendor = vendor_str;
 	}
 	if (product) {
-		regex_str = check_invert(product, &ble->product_invert);
-		if (regcomp(&ble->product_reg, regex_str,
-			    REG_EXTENDED|REG_NOSUB)) {
-			FREE(product);
-			if (vendor) {
-				ble->vendor = NULL;
-				FREE(vendor);
-			}
-			return 1;
-		}
-		ble->product = product;
+		product_str = STRDUP(product);
+		if (!product_str)
+			goto out1;
+
+		regex_str = check_invert(product_str, &ble->product_invert);
+		if (regcomp(&ble->product_reg, regex_str, REG_EXTENDED|REG_NOSUB))
+			goto out1;
+
+		ble->product = product_str;
 	}
 	ble->origin = origin;
 	return 0;
+out1:
+	if (vendor_str)
+		ble->vendor = NULL;
+out:
+	free(vendor_str);
+	vendor_str = NULL;
+
+	free(product_str);
+	product_str = NULL;
+
+	return 1;
 }

 static int
@@ -178,19 +194,12 @@ setup_default_blist (struct config * conf)
 {
 	struct blentry * ble;
 	struct hwentry *hwe;
-	char * str;
 	int i;

-	str = STRDUP("!^(sd[a-z]|dasd[a-z]|nvme[0-9])");
-	if (!str)
-		return 1;
-	if (store_ble(conf->blist_devnode, str, ORIGIN_DEFAULT))
+	if (store_ble(conf->blist_devnode, "!^(sd[a-z]|dasd[a-z]|nvme[0-9])", ORIGIN_DEFAULT))
 		return 1;

-	str = STRDUP("(SCSI_IDENT_|ID_WWN)");
-	if (!str)
-		return 1;
-	if (store_ble(conf->elist_property, str, ORIGIN_DEFAULT))
+	if (store_ble(conf->elist_property, "(SCSI_IDENT_|ID_WWN)", ORIGIN_DEFAULT))
 		return 1;

 	vector_foreach_slot (conf->hwtable, hwe, i) {
@@ -202,9 +211,7 @@ setup_default_blist (struct config * conf)
 				return 1;
 			ble = VECTOR_SLOT(conf->blist_device,
 					  VECTOR_SIZE(conf->blist_device) - 1);
-			if (set_ble_device(conf->blist_device,
-					   STRDUP(hwe->vendor),
-					   STRDUP(hwe->bl_product),
+			if (set_ble_device(conf->blist_device, hwe->vendor, hwe->bl_product,
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

