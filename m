Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id BDBEE163D3A
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:50:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095002;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z49DeGOWaUwvP2zGVXZVScEpHCEBvGyRQ8EQLtrZdB0=;
	b=PRh0PcOlRuhofiqXSakWxChlKu/PxU9NHBDX5A2SRUoc9BrblpAYisbxM/zWJtpeZQmN9Y
	/BG2sbShmmVpmn6hGW6Ny6pjwosdExtE3oJ3EnmWWtsOSLVQx52xqeCaYuQnJjj6UThbgc
	kNIujLV2dn2i9hdobSshxFsjWb/pFLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-jc08lejIOoyKGvI-gzBw4w-1; Wed, 19 Feb 2020 01:49:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C01B107ACCC;
	Wed, 19 Feb 2020 06:49:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E08235C1B0;
	Wed, 19 Feb 2020 06:49:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6A7FC35B16;
	Wed, 19 Feb 2020 06:49:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6muco015889 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:48:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5689290526; Wed, 19 Feb 2020 06:48:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD5F790089;
	Wed, 19 Feb 2020 06:48:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6mqNt009949; 
	Wed, 19 Feb 2020 00:48:52 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6mp82009948;
	Wed, 19 Feb 2020 00:48:51 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:29 -0600
Message-Id: <1582094920-9883-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 07/18] libmultipath: fix sgio_get_vpd looping
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: jc08lejIOoyKGvI-gzBw4w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If do_inq returns a page with a length that is less than maxlen, but
larger than DEFAULT_SGIO_LEN, this function will loop forever. Also
if do_inq returns with a length equal to or greater than maxlen,
sgio_get_vpd will exit immediately, even if it hasn't read the entire
page.  Fix these issues, modify the tests to verify the new behavior.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 12 +++----
 tests/vpd.c              | 77 ++++++++++++++++++++++++----------------
 2 files changed, 52 insertions(+), 37 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 5f41dcb7..19a8d2af 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -928,6 +928,7 @@ static int
 sgio_get_vpd (unsigned char * buff, int maxlen, int fd, int pg)
 {
 	int len = DEFAULT_SGIO_LEN;
+	int rlen;
 
 	if (fd < 0) {
 		errno = EBADF;
@@ -935,12 +936,11 @@ sgio_get_vpd (unsigned char * buff, int maxlen, int fd, int pg)
 	}
 retry:
 	if (0 == do_inq(fd, 0, 1, pg, buff, len)) {
-		len = get_unaligned_be16(&buff[2]) + 4;
-		if (len >= maxlen)
-			return len;
-		if (len > DEFAULT_SGIO_LEN)
-			goto retry;
-		return len;
+		rlen = get_unaligned_be16(&buff[2]) + 4;
+		if (rlen <= len || len >= maxlen)
+			return rlen;
+		len = (rlen < maxlen)? rlen : maxlen;
+		goto retry;
 	}
 	return -1;
 }
diff --git a/tests/vpd.c b/tests/vpd.c
index d9f80eaa..1e653ed4 100644
--- a/tests/vpd.c
+++ b/tests/vpd.c
@@ -506,9 +506,10 @@ static void test_vpd_naa_ ## naa ## _ ## wlen(void **state)             \
  * test_vpd_eui_LEN_WLEN() - test code for VPD 83, EUI64
  * @LEN:	EUI64 length (8, 12, or 16)
  * @WLEN:	WWID buffer size
+ * @SML:	Use small VPD page size
  */
-#define make_test_vpd_eui(len, wlen)					\
-static void test_vpd_eui_ ## len ## _ ## wlen(void **state)             \
+#define make_test_vpd_eui(len, wlen, sml)				\
+static void test_vpd_eui_ ## len ## _ ## wlen ## _ ## sml(void **state)	\
 {									\
 	struct vpdtest *vt = *state;                                    \
 	int n, ret;							\
@@ -518,10 +519,16 @@ static void test_vpd_eui_ ## len ## _ ## wlen(void **state)             \
 									\
 	n = create_vpd83(vt->vpdbuf, sizeof(vt->vpdbuf), test_id,	\
 			 2, 0, len);					\
+	if (sml) {							\
+		/* overwrite the page side to DEFAULT_SGIO_LEN + 1 */	\
+		put_unaligned_be16(255, vt->vpdbuf + 2);		\
+		will_return(__wrap_ioctl, n);				\
+		will_return(__wrap_ioctl, vt->vpdbuf);			\
+	}								\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
 	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
-	assert_correct_wwid("test_vpd_eui_" #len "_" #wlen,		\
+	assert_correct_wwid("test_vpd_eui_" #len "_" #wlen "_" #sml,	\
 			    exp_len, ret, '2', 0, true,			\
 			    test_id, vt->wwid);				\
 }
@@ -603,25 +610,30 @@ make_test_vpd_vnd(20, 10);
 make_test_vpd_vnd(10, 10);
 
 /* EUI64 tests */
+/* small vpd page test */
+make_test_vpd_eui(8, 32, 1);
+make_test_vpd_eui(12, 32, 1);
+make_test_vpd_eui(16, 40, 1);
+
 /* 64bit, WWID size: 18 */
-make_test_vpd_eui(8, 32);
-make_test_vpd_eui(8, 18);
-make_test_vpd_eui(8, 17);
-make_test_vpd_eui(8, 16);
-make_test_vpd_eui(8, 10);
+make_test_vpd_eui(8, 32, 0);
+make_test_vpd_eui(8, 18, 0);
+make_test_vpd_eui(8, 17, 0);
+make_test_vpd_eui(8, 16, 0);
+make_test_vpd_eui(8, 10, 0);
 
 /* 96 bit, WWID size: 26 */
-make_test_vpd_eui(12, 32);
-make_test_vpd_eui(12, 26);
-make_test_vpd_eui(12, 25);
-make_test_vpd_eui(12, 20);
-make_test_vpd_eui(12, 10);
+make_test_vpd_eui(12, 32, 0);
+make_test_vpd_eui(12, 26, 0);
+make_test_vpd_eui(12, 25, 0);
+make_test_vpd_eui(12, 20, 0);
+make_test_vpd_eui(12, 10, 0);
 
 /* 128 bit, WWID size: 34 */
-make_test_vpd_eui(16, 40);
-make_test_vpd_eui(16, 34);
-make_test_vpd_eui(16, 33);
-make_test_vpd_eui(16, 20);
+make_test_vpd_eui(16, 40, 0);
+make_test_vpd_eui(16, 34, 0);
+make_test_vpd_eui(16, 33, 0);
+make_test_vpd_eui(16, 20, 0);
 
 /* NAA IEEE registered extended (36), WWID size: 34 */
 make_test_vpd_naa(6, 40);
@@ -722,20 +734,23 @@ static int test_vpd(void)
 		cmocka_unit_test(test_vpd_vnd_19_20),
 		cmocka_unit_test(test_vpd_vnd_20_10),
 		cmocka_unit_test(test_vpd_vnd_10_10),
-		cmocka_unit_test(test_vpd_eui_8_32),
-		cmocka_unit_test(test_vpd_eui_8_18),
-		cmocka_unit_test(test_vpd_eui_8_17),
-		cmocka_unit_test(test_vpd_eui_8_16),
-		cmocka_unit_test(test_vpd_eui_8_10),
-		cmocka_unit_test(test_vpd_eui_12_32),
-		cmocka_unit_test(test_vpd_eui_12_26),
-		cmocka_unit_test(test_vpd_eui_12_25),
-		cmocka_unit_test(test_vpd_eui_12_20),
-		cmocka_unit_test(test_vpd_eui_12_10),
-		cmocka_unit_test(test_vpd_eui_16_40),
-		cmocka_unit_test(test_vpd_eui_16_34),
-		cmocka_unit_test(test_vpd_eui_16_33),
-		cmocka_unit_test(test_vpd_eui_16_20),
+		cmocka_unit_test(test_vpd_eui_8_32_1),
+		cmocka_unit_test(test_vpd_eui_12_32_1),
+		cmocka_unit_test(test_vpd_eui_16_40_1),
+		cmocka_unit_test(test_vpd_eui_8_32_0),
+		cmocka_unit_test(test_vpd_eui_8_18_0),
+		cmocka_unit_test(test_vpd_eui_8_17_0),
+		cmocka_unit_test(test_vpd_eui_8_16_0),
+		cmocka_unit_test(test_vpd_eui_8_10_0),
+		cmocka_unit_test(test_vpd_eui_12_32_0),
+		cmocka_unit_test(test_vpd_eui_12_26_0),
+		cmocka_unit_test(test_vpd_eui_12_25_0),
+		cmocka_unit_test(test_vpd_eui_12_20_0),
+		cmocka_unit_test(test_vpd_eui_12_10_0),
+		cmocka_unit_test(test_vpd_eui_16_40_0),
+		cmocka_unit_test(test_vpd_eui_16_34_0),
+		cmocka_unit_test(test_vpd_eui_16_33_0),
+		cmocka_unit_test(test_vpd_eui_16_20_0),
 		cmocka_unit_test(test_vpd_naa_6_40),
 		cmocka_unit_test(test_vpd_naa_6_34),
 		cmocka_unit_test(test_vpd_naa_6_33),
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

