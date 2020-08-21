Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 34A1F24E394
	for <lists+dm-devel@lfdr.de>; Sat, 22 Aug 2020 00:46:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-kVtI73zENL6yuhgW4VZW9Q-1; Fri, 21 Aug 2020 18:46:03 -0400
X-MC-Unique: kVtI73zENL6yuhgW4VZW9Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88856801AF5;
	Fri, 21 Aug 2020 22:45:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 699FC7C56E;
	Fri, 21 Aug 2020 22:45:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8D1381832FC2;
	Fri, 21 Aug 2020 22:45:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LMgjR4002363 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 18:42:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 072422157F24; Fri, 21 Aug 2020 22:42:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E372166BA4
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C5EB0811E90
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-402-r6aAkoxqOEGeUK7kATMumg-1;
	Fri, 21 Aug 2020 18:42:40 -0400
X-MC-Unique: r6aAkoxqOEGeUK7kATMumg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D6483B5B5;
	Fri, 21 Aug 2020 22:43:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 22 Aug 2020 00:42:24 +0200
Message-Id: <20200821224224.13536-4-mwilck@suse.com>
In-Reply-To: <20200821224224.13536-1-mwilck@suse.com>
References: <20200821224224.13536-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LMgjR4002363
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/3] multipath-tools tests: fix small bitfield
	tests for big endian
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is the opposite case of the previous patch: 64 bit bitfield_t,
tested with 32 bit words.

Fixes: "libmultipath: create bitfield abstraction"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 60 ++++++++++++++++++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 20 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index ec38c55..21311b2 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -22,6 +22,7 @@
 #include <setjmp.h>
 #include <stdlib.h>
 #include <cmocka.h>
+#include <endian.h>
 #include "util.h"
 
 #include "globals.c"
@@ -295,11 +296,25 @@ static void test_bitmask_len_0(void **state)
 	assert_null(bf);
 }
 
+/*
+ * We use uint32_t in the "small bitmask" tests below.
+ * This means that we may have to swap 32bit words if bitfield_t
+ * is 64bit wide.
+ */
+static unsigned int maybe_swap_idx(unsigned int i)
+{
+	if (BYTE_ORDER == LITTLE_ENDIAN || sizeof(bitfield_t) == 4)
+		return i;
+	else
+		/* 0<->1, 2<->3, ... */
+		return i + (i % 2 == 0 ? 1 : -1);
+}
+
 static void _test_bitmask_small(unsigned int n)
 {
 	struct bitfield *bf;
 	uint32_t *arr;
-	unsigned int size = (n - 1) / 32 + 1, i;
+	unsigned int size = maybe_swap_idx((n - 1) / 32) + 1, i;
 
 	assert(sizeof(bitfield_t) == 4 || sizeof(bitfield_t) == 8);
 	assert(n <= 64);
@@ -325,11 +340,12 @@ static void _test_bitmask_small(unsigned int n)
 	for (i = 0; i < size; i++) {
 		unsigned int k = (n - 1) / 32;
 		unsigned int j = (n - 1) - k * 32;
+		unsigned int i1 = maybe_swap_idx(i);
 
 		if (i == k)
-			assert_int_equal(arr[i], 1UL << j);
+			assert_int_equal(arr[i1], 1UL << j);
 		else
-			assert_int_equal(arr[i], 0);
+			assert_int_equal(arr[i1], 0);
 	}
 
 	clear_bit_in_bitfield(n - 1, bf);
@@ -337,9 +353,9 @@ static void _test_bitmask_small(unsigned int n)
 		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(0, bf);
-	assert_int_equal(arr[0], 1);
+	assert_int_equal(arr[maybe_swap_idx(0)], 1);
 	for (i = 1; i < size; i++)
-		assert_int_equal(arr[i], 0);
+		assert_int_equal(arr[maybe_swap_idx(i)], 0);
 
 	free(bf);
 }
@@ -348,7 +364,7 @@ static void _test_bitmask_small_2(unsigned int n)
 {
 	struct bitfield *bf;
 	uint32_t *arr;
-	unsigned int size = (n - 1) / 32 + 1, i;
+	unsigned int size = maybe_swap_idx((n - 1) / 32) + 1, i;
 
 	assert(n <= 128);
 	assert(n >= 65);
@@ -374,56 +390,60 @@ static void _test_bitmask_small_2(unsigned int n)
 	for (i = 0; i < size; i++) {
 		unsigned int k = (n - 1) / 32;
 		unsigned int j = (n - 1) - k * 32;
+		unsigned int i1 = maybe_swap_idx(i);
 
 		if (i == k)
-			assert_int_equal(arr[i], 1UL << j);
+			assert_int_equal(arr[i1], 1UL << j);
 		else
-			assert_int_equal(arr[i], 0);
+			assert_int_equal(arr[i1], 0);
 	}
 
 	set_bit_in_bitfield(0, bf);
 	for (i = 0; i < size; i++) {
 		unsigned int k = (n - 1) / 32;
 		unsigned int j = (n - 1) - k * 32;
+		unsigned int i1 = maybe_swap_idx(i);
 
 		if (i == k && k == 0)
-			assert_int_equal(arr[i], (1UL << j) | 1);
+			assert_int_equal(arr[i1], (1UL << j) | 1);
 		else if (i == k)
-			assert_int_equal(arr[i], 1UL << j);
+			assert_int_equal(arr[i1], 1UL << j);
 		else if (i == 0)
-			assert_int_equal(arr[i], 1);
+			assert_int_equal(arr[i1], 1);
 		else
-			assert_int_equal(arr[i], 0);
+			assert_int_equal(arr[i1], 0);
 	}
 
 	set_bit_in_bitfield(64, bf);
 	for (i = 0; i < size; i++) {
 		unsigned int k = (n - 1) / 32;
 		unsigned int j = (n - 1) - k * 32;
+		unsigned int i1 = maybe_swap_idx(i);
 
 		if (i == k && (k == 0 || k == 2))
-			assert_int_equal(arr[i], (1UL << j) | 1);
+			assert_int_equal(arr[i1], (1UL << j) | 1);
 		else if (i == k)
-			assert_int_equal(arr[i], 1UL << j);
+			assert_int_equal(arr[i1], 1UL << j);
 		else if (i == 2 || i == 0)
-			assert_int_equal(arr[i], 1);
+			assert_int_equal(arr[i1], 1);
 		else
-			assert_int_equal(arr[i], 0);
+			assert_int_equal(arr[i1], 0);
 	}
 
 	clear_bit_in_bitfield(0, bf);
 	for (i = 0; i < size; i++) {
 		unsigned int k = (n - 1) / 32;
 		unsigned int j = (n - 1) - k * 32;
+		unsigned int i1 = maybe_swap_idx(i);
 
 		if (i == k && k == 2)
-			assert_int_equal(arr[i], (1UL << j) | 1);
+			assert_int_equal(arr[i1], (1UL << j) | 1);
 		else if (i == k)
-			assert_int_equal(arr[i], 1UL << j);
+			assert_int_equal(arr[i1], 1UL << j);
 		else if (i == 2)
-			assert_int_equal(arr[i], 1);
+			assert_int_equal(arr[i1], 1);
 		else
-			assert_int_equal(arr[i], 0);
+			assert_int_equal(arr[i1], 0);
 	}
 
 	free(bf);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

