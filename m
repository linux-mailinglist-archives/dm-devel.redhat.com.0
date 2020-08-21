Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8356324E395
	for <lists+dm-devel@lfdr.de>; Sat, 22 Aug 2020 00:46:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-LRVmdbADPeyE3TIIHxo5Tw-1; Fri, 21 Aug 2020 18:46:30 -0400
X-MC-Unique: LRVmdbADPeyE3TIIHxo5Tw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC6A41074658;
	Fri, 21 Aug 2020 22:46:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA46619D7D;
	Fri, 21 Aug 2020 22:46:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F94F1832FC4;
	Fri, 21 Aug 2020 22:46:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LMgkbp002371 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 18:42:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B003C117DB0D; Fri, 21 Aug 2020 22:42:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6746117DB0C
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91A3E101A571
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 22:42:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-339-XH46R19BNzSWg6UxnPpUqA-1;
	Fri, 21 Aug 2020 18:42:39 -0400
X-MC-Unique: XH46R19BNzSWg6UxnPpUqA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9CDB3B5B4;
	Fri, 21 Aug 2020 22:43:06 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 22 Aug 2020 00:42:23 +0200
Message-Id: <20200821224224.13536-3-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LMgkbp002371
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/3] multipath-tools tests: fix bitfield tests
	for big endian
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

On big endian systems, the 32bit words need to be swapped in
the test code to get the byte ordering right.

Fixes: "libmultipath: create bitfield abstraction"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/util.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/tests/util.c b/tests/util.c
index 63a5f59..ec38c55 100644
--- a/tests/util.c
+++ b/tests/util.c
@@ -162,6 +162,22 @@ static int test_basenamecpy(void)
 	return cmocka_run_group_tests(tests, NULL, NULL);
 }
 
+/*
+ * On big endian systems, if bitfield_t is 32bit, we need
+ * to swap the two 32 bit parts of a 64bit value to make
+ * the tests below work.
+ */
+static uint64_t maybe_swap(uint64_t v)
+{
+	uint32_t *s = (uint32_t *)&v;
+
+	if (sizeof(bitfield_t) == 4)
+		/* this is identity for little endian */
+		return ((uint64_t)s[1] << 32) | s[0];
+	else
+		return v;
+}
+
 static void test_bitmask_1(void **state)
 {
 	struct bitfield *bf;
@@ -184,7 +200,7 @@ static void test_bitmask_1(void **state)
 				       b, j, k, arr[k]);
 #endif
 				if (k == j)
-					assert_int_equal(arr[j], 1ULL << i);
+					assert_int_equal(maybe_swap(arr[j]), 1ULL << i);
 				else
 					assert_int_equal(arr[k], 0ULL);
 			}
@@ -235,7 +251,7 @@ static void test_bitmask_2(void **state)
 					assert_int_equal(arr[k], 0ULL);
 				else
 					assert_int_equal(
-						arr[k],
+						maybe_swap(arr[k]),
 						(1ULL << (i + 1)) - 1);
 			}
 		}
@@ -260,7 +276,7 @@ static void test_bitmask_2(void **state)
 					assert_int_equal(arr[k], ~0ULL);
 				else
 					assert_int_equal(
-						arr[k],
+						maybe_swap(arr[k]),
 						~((1ULL << (i + 1)) - 1));
 			}
 		}
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

