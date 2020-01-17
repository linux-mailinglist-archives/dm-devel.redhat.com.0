Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8181401CC
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:20:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227608;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I8Kg90QH9k7cbbgo3Tm+PF/zi562x5TX3oP+3MI6AKI=;
	b=K+CGDvXP47CG+TElrkMsgvUtGHfpKQ9nX4VnjO2liEsqIfFlubJHaS2eF0SBzYmB5iomZ5
	VKzL6JDPgl5g92fTyINAALs/+gbbk6MThijyHPtsFpP2mahlOrWwntNzSCRFaNc5FLreBs
	HhVTY8UYltp733++zUzGHjpQyFLuMgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-391-vRKyafX7MFmibJG2zBEaGA-1; Thu, 16 Jan 2020 21:19:03 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11B1C801E76;
	Fri, 17 Jan 2020 02:18:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE33C8889F;
	Fri, 17 Jan 2020 02:18:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 67CAE18089D0;
	Fri, 17 Jan 2020 02:18:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IYeV030659 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D0D3B60C87; Fri, 17 Jan 2020 02:18:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE80A60C84;
	Fri, 17 Jan 2020 02:18:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IXOr017265; 
	Thu, 16 Jan 2020 20:18:33 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IWHK017264;
	Thu, 16 Jan 2020 20:18:32 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:12 -0600
Message-Id: <1579227500-17196-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 07/15] libmultipath: fix sgio_get_vpd looping
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
X-MC-Unique: vRKyafX7MFmibJG2zBEaGA-1
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
 libmultipath/discovery.c | 12 +++---
 tests/vpd.c              | 84 ++++++++++++++++++++++++----------------
 2 files changed, 57 insertions(+), 39 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 72f455e8..3c72a80a 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -870,6 +870,7 @@ static int
 sgio_get_vpd (unsigned char * buff, int maxlen, int fd, int pg)
 {
 	int len = DEFAULT_SGIO_LEN;
+	int rlen;
 
 	if (fd < 0) {
 		errno = EBADF;
@@ -877,12 +878,11 @@ sgio_get_vpd (unsigned char * buff, int maxlen, int fd, int pg)
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
index d9f80eaa..4dbce010 100644
--- a/tests/vpd.c
+++ b/tests/vpd.c
@@ -306,7 +306,7 @@ static int create_vpd83(unsigned char *buf, size_t bufsiz, const char *id,
 	default:
 		break;
 	}
-	put_unaligned_be16(n, buf + 2);
+	put_unaligned_be16(bufsiz, buf + 2);
 	return n + 4;
 }
 
@@ -429,6 +429,8 @@ static void test_vpd_vnd_ ## len ## _ ## wlen(void **state)             \
 	free(exp_wwid);							\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
+	will_return(__wrap_ioctl, n);					\
+	will_return(__wrap_ioctl, vt->vpdbuf);				\
 	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
 	assert_correct_wwid("test_vpd_vnd_" #len "_" #wlen,		\
 			    exp_len, ret, '1', 0, false,		\
@@ -459,6 +461,8 @@ static void test_vpd_str_ ## typ ## _ ## len ## _ ## wlen(void **state) \
 		exp_len = wlen - 1;					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
+	will_return(__wrap_ioctl, n);					\
+	will_return(__wrap_ioctl, vt->vpdbuf);				\
 	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
 	assert_correct_wwid("test_vpd_str_" #typ "_" #len "_" #wlen,	\
 			    exp_len, ret, byte0[type], 0,		\
@@ -496,6 +500,8 @@ static void test_vpd_naa_ ## naa ## _ ## wlen(void **state)             \
 			 3, naa, 0);					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
+	will_return(__wrap_ioctl, n);					\
+	will_return(__wrap_ioctl, vt->vpdbuf);				\
 	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
 	assert_correct_wwid("test_vpd_naa_" #naa "_" #wlen,		\
 			    exp_len, ret, '3', '0' + naa, true,		\
@@ -506,22 +512,26 @@ static void test_vpd_naa_ ## naa ## _ ## wlen(void **state)             \
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
 	/* returned size is always uneven */				\
 	int exp_len = wlen > 2 * len + 1 ? 2 * len + 1 :		\
 		wlen % 2 == 0 ? wlen - 1 : wlen - 2;			\
+	int bufsize = sml ? 255 : sizeof(vt->vpdbuf);			\
 									\
-	n = create_vpd83(vt->vpdbuf, sizeof(vt->vpdbuf), test_id,	\
+	n = create_vpd83(vt->vpdbuf, bufsize, test_id,			\
 			 2, 0, len);					\
 	will_return(__wrap_ioctl, n);					\
 	will_return(__wrap_ioctl, vt->vpdbuf);				\
+	will_return(__wrap_ioctl, n);					\
+	will_return(__wrap_ioctl, vt->vpdbuf);				\
 	ret = get_vpd_sgio(10, 0x83, vt->wwid, wlen);			\
-	assert_correct_wwid("test_vpd_eui_" #len "_" #wlen,		\
+	assert_correct_wwid("test_vpd_eui_" #len "_" #wlen "_" #sml,	\
 			    exp_len, ret, '2', 0, true,			\
 			    test_id, vt->wwid);				\
 }
@@ -603,25 +613,30 @@ make_test_vpd_vnd(20, 10);
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
@@ -722,20 +737,23 @@ static int test_vpd(void)
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

