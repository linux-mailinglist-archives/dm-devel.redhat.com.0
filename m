Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 874AE24E393
	for <lists+dm-devel@lfdr.de>; Sat, 22 Aug 2020 00:46:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-qc0inC8vOVmt_oPr7ehrQA-1; Fri, 21 Aug 2020 18:46:02 -0400
X-MC-Unique: qc0inC8vOVmt_oPr7ehrQA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6D68B1005E5E;
	Fri, 21 Aug 2020 22:45:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCFEE10013C2;
	Fri, 21 Aug 2020 22:45:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB4A71832FC2;
	Fri, 21 Aug 2020 22:45:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LMgiHU002358 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 18:42:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6EF9108BD6; Fri, 21 Aug 2020 22:42:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A4B2B108BCC
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EB8F1815DC7
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-162-pZTIN6VpNG2Pf2bXDSwz7g-1;
	Fri, 21 Aug 2020 18:42:39 -0400
X-MC-Unique: pZTIN6VpNG2Pf2bXDSwz7g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 63C22B59D;
	Fri, 21 Aug 2020 22:43:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 22 Aug 2020 00:42:22 +0200
Message-Id: <20200821224224.13536-2-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LMgiHU002358
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] multipath-tools tests: fix bitfield tests
	for small fields
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The bitmask tests may fail if sizeof(bitfield_t) is 32, depending
on compiler options and other circumstances.
This is because allocation of the bitfield with calloc() only zeroes
out the actual length of the bitfield rounded to 32, and thus
the assertion *((uint64_t *)bf->bits) == 0 may fail.

Use uint32_t in the tests instead of uint64_t.

Fixes: "libmultipath: create bitfield abstraction"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 104 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 81 insertions(+), 23 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index 16774df..63a5f59 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -282,32 +282,48 @@ static void test_bitmask_len_0(void **state)
 static void _test_bitmask_small(unsigned int n)
 {
 	struct bitfield *bf;
-	uint64_t *arr;
+	uint32_t *arr;
+	unsigned int size = (n - 1) / 32 + 1, i;
 
+	assert(sizeof(bitfield_t) == 4 || sizeof(bitfield_t) == 8);
 	assert(n <= 64);
 	assert(n >= 1);
 
 	bf = alloc_bitfield(n);
 	assert_non_null(bf);
 	assert_int_equal(bf->len, n);
-	arr = (uint64_t *)bf->bits;
+	arr = (uint32_t *)bf->bits;
 
-	assert_int_equal(*arr, 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n + 1, bf);
-	assert_int_equal(*arr, 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n, bf);
-	assert_int_equal(*arr, 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n - 1, bf);
-	assert_int_equal(*arr, 1ULL << (n - 1));
+	for (i = 0; i < size; i++) {
+		unsigned int k = (n - 1) / 32;
+		unsigned int j = (n - 1) - k * 32;
+
+		if (i == k)
+			assert_int_equal(arr[i], 1UL << j);
+		else
+			assert_int_equal(arr[i], 0);
+	}
 
 	clear_bit_in_bitfield(n - 1, bf);
-	assert_int_equal(*arr, 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(0, bf);
-	assert_int_equal(*arr, 1);
+	assert_int_equal(arr[0], 1);
+	for (i = 1; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	free(bf);
 }
@@ -315,7 +331,8 @@ static void _test_bitmask_small(unsigned int n)
 static void _test_bitmask_small_2(unsigned int n)
 {
 	struct bitfield *bf;
-	uint64_t *arr;
+	uint32_t *arr;
+	unsigned int size = (n - 1) / 32 + 1, i;
 
 	assert(n <= 128);
 	assert(n >= 65);
@@ -323,34 +340,75 @@ static void _test_bitmask_small_2(unsigned int n)
 	bf = alloc_bitfield(n);
 	assert_non_null(bf);
 	assert_int_equal(bf->len, n);
-	arr = (uint64_t *)bf->bits;
+	arr = (uint32_t *)bf->bits;
 
-	assert_int_equal(arr[0], 0);
-	assert_int_equal(arr[1], 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n + 1, bf);
-	assert_int_equal(arr[0], 0);
-	assert_int_equal(arr[1], 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n, bf);
-	assert_int_equal(arr[0], 0);
-	assert_int_equal(arr[1], 0);
+	for (i = 0; i < size; i++)
+		assert_int_equal(arr[i], 0);
 
 	set_bit_in_bitfield(n - 1, bf);
 	assert_int_equal(arr[0], 0);
-	assert_int_equal(arr[1], 1ULL << (n - 65));
+	for (i = 0; i < size; i++) {
+		unsigned int k = (n - 1) / 32;
+		unsigned int j = (n - 1) - k * 32;
+
+		if (i == k)
+			assert_int_equal(arr[i], 1UL << j);
+		else
+			assert_int_equal(arr[i], 0);
+	}
 
 	set_bit_in_bitfield(0, bf);
-	assert_int_equal(arr[0], 1);
-	assert_int_equal(arr[1], 1ULL << (n - 65));
+	for (i = 0; i < size; i++) {
+		unsigned int k = (n - 1) / 32;
+		unsigned int j = (n - 1) - k * 32;
+
+		if (i == k && k == 0)
+			assert_int_equal(arr[i], (1UL << j) | 1);
+		else if (i == k)
+			assert_int_equal(arr[i], 1UL << j);
+		else if (i == 0)
+			assert_int_equal(arr[i], 1);
+		else
+			assert_int_equal(arr[i], 0);
+	}
 
 	set_bit_in_bitfield(64, bf);
-	assert_int_equal(arr[0], 1);
-	assert_int_equal(arr[1], (1ULL << (n - 65)) | 1);
+	for (i = 0; i < size; i++) {
+		unsigned int k = (n - 1) / 32;
+		unsigned int j = (n - 1) - k * 32;
+
+		if (i == k && (k == 0 || k == 2))
+			assert_int_equal(arr[i], (1UL << j) | 1);
+		else if (i == k)
+			assert_int_equal(arr[i], 1UL << j);
+		else if (i == 2 || i == 0)
+			assert_int_equal(arr[i], 1);
+		else
+			assert_int_equal(arr[i], 0);
+	}
 
 	clear_bit_in_bitfield(0, bf);
-	assert_int_equal(arr[0], 0);
-	assert_int_equal(arr[1], (1ULL << (n - 65)) | 1);
+	for (i = 0; i < size; i++) {
+		unsigned int k = (n - 1) / 32;
+		unsigned int j = (n - 1) - k * 32;
+
+		if (i == k && k == 2)
+			assert_int_equal(arr[i], (1UL << j) | 1);
+		else if (i == k)
+			assert_int_equal(arr[i], 1UL << j);
+		else if (i == 2)
+			assert_int_equal(arr[i], 1);
+		else
+			assert_int_equal(arr[i], 0);
+	}
 
 	free(bf);
 }
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

