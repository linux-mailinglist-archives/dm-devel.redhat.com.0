Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9D17C209C06
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 11:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593077973;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1q4/pOhy5H+HiJORGl2MBeD/goxSHfI40rtXPC1wSCg=;
	b=XAKZHjKVbWSINWuDsjaskgtJGzdPzRi0qrbGxYiDupmVe5DfW3kN5GpsYyj+33gYZ7qDUv
	QXCf38Sz7kq97pUL6oHqCb3QAfKK/4g99o167VnWCLIq+DvtXsvCQi39DtRAPkSjSBNmUi
	KNu+q05917OPxEyqJinsuN+wSe6eJ3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-y-LnEvgvPMmX_QuN76viuw-1; Thu, 25 Jun 2020 05:39:30 -0400
X-MC-Unique: y-LnEvgvPMmX_QuN76viuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97DD4800597;
	Thu, 25 Jun 2020 09:39:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77D53891D8;
	Thu, 25 Jun 2020 09:39:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3732C1809561;
	Thu, 25 Jun 2020 09:39:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05P7b1Wf030049 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jun 2020 03:37:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8F6952023282; Thu, 25 Jun 2020 07:37:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AFC52014DFA
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 07:36:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E2BF8007D3
	for <dm-devel@redhat.com>; Thu, 25 Jun 2020 07:36:59 +0000 (UTC)
Received: from out20-97.mail.aliyun.com (out20-97.mail.aliyun.com
	[115.124.20.97]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-294-CdEw32csP22BvlGtbhMkDA-1; Thu, 25 Jun 2020 03:36:56 -0400
X-MC-Unique: CdEw32csP22BvlGtbhMkDA-1
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07436287|-1; CH=green;
	DM=|CONTINUE|false|;
	DS=CONTINUE|ham_system_inform|0.0910485-0.000687188-0.908264;
	FP=0|0|0|0|0|-1|-1|-1; HT=e02c03310; MF=aiden.leong@aibsd.com;
	NM=1; PH=DS; RN=8; RT=8; SR=0; TI=SMTPD_---.HsCAlbk_1593070608;
Received: from ubuntu(mailfrom:aiden.leong@aibsd.com
	fp:SMTPD_---.HsCAlbk_1593070608)
	by smtp.aliyun-inc.com(10.147.42.197);
	Thu, 25 Jun 2020 15:36:48 +0800
From: Aiden Leong <aiden.leong@aibsd.com>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ferdinand Blomqvist <ferdinand.blomqvist@gmail.com>,
	YueHaibing <yuehaibing@huawei.com>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org
Date: Thu, 25 Jun 2020 00:36:01 -0700
Message-Id: <20200625073621.4919-1-aiden.leong@aibsd.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 25 Jun 2020 05:38:56 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [RFC v2] Reed-Solomon Code: Update no_eras to the actual
	number of errors
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Corr and eras_pos are updated to actual correction pattern and erasure
positions, but no_eras is not.

When this library is used to recover lost bytes, we normally memset the
lost trunk of bytes to zero as a placeholder. Unfortunately, if the lost
byte is zero, b[i] is zero too. Without correct no_eras, users won't be
able to determine the valid length of corr and eras_pos.

Signed-off-by: Aiden Leong <aiden.leong@aibsd.com>
---
 drivers/md/dm-verity-fec.c      |  2 +-
 include/linux/rslib.h           |  4 ++--
 lib/reed_solomon/decode_rs.c    | 20 ++++++++++++++------
 lib/reed_solomon/reed_solomon.c |  4 ++--
 lib/reed_solomon/test_rslib.c   | 18 ++++++++++++------
 5 files changed, 31 insertions(+), 17 deletions(-)

diff --git a/drivers/md/dm-verity-fec.c b/drivers/md/dm-verity-fec.c
index fb41b4f23c48..ae8366a50244 100644
--- a/drivers/md/dm-verity-fec.c
+++ b/drivers/md/dm-verity-fec.c
@@ -50,7 +50,7 @@ static int fec_decode_rs8(struct dm_verity *v, struct dm_verity_fec_io *fio,
 	for (i = 0; i < v->fec->roots; i++)
 		par[i] = fec[i];
 
-	return decode_rs8(fio->rs, data, par, v->fec->rsn, NULL, neras,
+	return decode_rs8(fio->rs, data, par, v->fec->rsn, NULL, &neras,
 			  fio->erasures, 0, NULL);
 }
 
diff --git a/include/linux/rslib.h b/include/linux/rslib.h
index 238bb85243d3..80662abc9af7 100644
--- a/include/linux/rslib.h
+++ b/include/linux/rslib.h
@@ -64,7 +64,7 @@ int encode_rs8(struct rs_control *rs, uint8_t *data, int len, uint16_t *par,
 #endif
 #ifdef CONFIG_REED_SOLOMON_DEC8
 int decode_rs8(struct rs_control *rs, uint8_t *data, uint16_t *par, int len,
-		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
+		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
 	       uint16_t *corr);
 #endif
 
@@ -75,7 +75,7 @@ int encode_rs16(struct rs_control *rs, uint16_t *data, int len, uint16_t *par,
 #endif
 #ifdef CONFIG_REED_SOLOMON_DEC16
 int decode_rs16(struct rs_control *rs, uint16_t *data, uint16_t *par, int len,
-		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
+		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
 		uint16_t *corr);
 #endif
 
diff --git a/lib/reed_solomon/decode_rs.c b/lib/reed_solomon/decode_rs.c
index 805de84ae83d..44136ea33d16 100644
--- a/lib/reed_solomon/decode_rs.c
+++ b/lib/reed_solomon/decode_rs.c
@@ -24,6 +24,7 @@
 	int count = 0;
 	int num_corrected;
 	uint16_t msk = (uint16_t) rs->nn;
+	int no_eras_local = no_eras ? *no_eras : 0;
 
 	/*
 	 * The decoder buffers are in the rs control struct. They are
@@ -106,11 +107,11 @@
 	memset(&lambda[1], 0, nroots * sizeof(lambda[0]));
 	lambda[0] = 1;
 
-	if (no_eras > 0) {
+	if (no_eras_local > 0) {
 		/* Init lambda to be the erasure locator polynomial */
 		lambda[1] = alpha_to[rs_modnn(rs,
 					prim * (nn - 1 - (eras_pos[0] + pad)))];
-		for (i = 1; i < no_eras; i++) {
+		for (i = 1; i < no_eras_local; i++) {
 			u = rs_modnn(rs, prim * (nn - 1 - (eras_pos[i] + pad)));
 			for (j = i + 1; j > 0; j--) {
 				tmp = index_of[lambda[j - 1]];
@@ -129,8 +130,8 @@
 	 * Begin Berlekamp-Massey algorithm to determine error+erasure
 	 * locator polynomial
 	 */
-	r = no_eras;
-	el = no_eras;
+	r = no_eras_local;
+	el = no_eras_local;
 	while (++r <= nroots) {	/* r is the step number */
 		/* Compute discrepancy at the r-th step in poly-form */
 		discr_r = 0;
@@ -158,8 +159,8 @@
 				} else
 					t[i + 1] = lambda[i + 1];
 			}
-			if (2 * el <= r + no_eras - 1) {
-				el = r + no_eras - el;
+			if (2 * el <= r + no_eras_local - 1) {
+				el = r + no_eras_local - el;
 				/*
 				 * 2 lines below: B(x) <-- inv(discr_r) *
 				 * lambda(x)
@@ -312,14 +313,21 @@
 				eras_pos[j++] = loc[i] - pad;
 			}
 		}
+		if (no_eras)
+			*no_eras = j;
 	} else if (data && par) {
 		/* Apply error to data and parity */
+		j = 0;
 		for (i = 0; i < count; i++) {
 			if (loc[i] < (nn - nroots))
 				data[loc[i] - pad] ^= b[i];
 			else
 				par[loc[i] - pad - len] ^= b[i];
+			if (b[i])
+				j++;
 		}
+		if (no_eras)
+			*no_eras = j;
 	}
 
 	return  num_corrected;
diff --git a/lib/reed_solomon/reed_solomon.c b/lib/reed_solomon/reed_solomon.c
index bbc01bad3053..b2c811674c98 100644
--- a/lib/reed_solomon/reed_solomon.c
+++ b/lib/reed_solomon/reed_solomon.c
@@ -359,7 +359,7 @@ EXPORT_SYMBOL_GPL(encode_rs8);
  *  errors. The count includes errors in the parity.
  */
 int decode_rs8(struct rs_control *rsc, uint8_t *data, uint16_t *par, int len,
-	       uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
+	       uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
 	       uint16_t *corr)
 {
 #include "decode_rs.c"
@@ -410,7 +410,7 @@ EXPORT_SYMBOL_GPL(encode_rs16);
  *  errors. The count includes errors in the parity.
  */
 int decode_rs16(struct rs_control *rsc, uint16_t *data, uint16_t *par, int len,
-		uint16_t *s, int no_eras, int *eras_pos, uint16_t invmsk,
+		uint16_t *s, int *no_eras, int *eras_pos, uint16_t invmsk,
 		uint16_t *corr)
 {
 #include "decode_rs.c"
diff --git a/lib/reed_solomon/test_rslib.c b/lib/reed_solomon/test_rslib.c
index 4eb29f365ece..b30a4aea8796 100644
--- a/lib/reed_solomon/test_rslib.c
+++ b/lib/reed_solomon/test_rslib.c
@@ -258,7 +258,7 @@ static void compute_syndrome(struct rs_control *rsc, uint16_t *data,
 
 /* Test up to error correction capacity */
 static void test_uc(struct rs_control *rs, int len, int errs,
-		int eras, int trials, struct estat *stat,
+		int *eras, int trials, struct estat *stat,
 		struct wspace *ws, int method)
 {
 	int dlen = len - rs->codec->nroots;
@@ -327,8 +327,11 @@ static int ex_rs_helper(struct rs_control *rs, struct wspace *ws,
 		pr_info("  %s\n", desc[method]);
 
 	for (errs = 0; errs <= nroots / 2; errs++)
-		for (eras = 0; eras <= nroots - 2 * errs; eras++)
-			test_uc(rs, len, errs, eras, trials, &stat, ws, method);
+		for (eras = 0; eras <= nroots - 2 * errs; eras++) {
+			int no_eras = ers;
+
+			test_uc(rs, len, errs, &no_eras, trials, &stat, ws, method);
+		}
 
 	if (v >= V_CSUMMARY) {
 		pr_info("    Decodes wrong:        %d / %d\n",
@@ -364,7 +367,7 @@ static int exercise_rs(struct rs_control *rs, struct wspace *ws,
 
 /* Tests for correct behaviour beyond error correction capacity */
 static void test_bc(struct rs_control *rs, int len, int errs,
-		int eras, int trials, struct bcstat *stat,
+		int *eras, int trials, struct bcstat *stat,
 		struct wspace *ws)
 {
 	int nroots = rs->codec->nroots;
@@ -420,8 +423,11 @@ static int exercise_rs_bc(struct rs_control *rs, struct wspace *ws,
 			eras = 0;
 
 		cutoff = nroots <= len - errs ? nroots : len - errs;
-		for (; eras <= cutoff; eras++)
-			test_bc(rs, len, errs, eras, trials, &stat, ws);
+		for (; eras <= cutoff; eras++) {
+			int no_eras = eras;
+
+			test_bc(rs, len, errs, &no_eras, trials, &stat, ws);
+		}
 	}
 
 	if (v >= V_CSUMMARY) {
-- 
2.25.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

