Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0775C1EA789
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 18:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591027719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZXyXIFVlz6llvzH11aVjfeZ3tGcmx9G5PPGst6jvS6I=;
	b=Dw8/yttF+zc3VU3DOXnuuN8HFJjqfEyGz0y4xPXWlJQXm/Ekz9Qp3sg/LTWNlgqw8pEhyT
	/NPoizxmX2pUCaweg6jaQNwau9yUPWnawH/ibXKa9R2gmtgO588b/ZGrdjLPtqqms6wlW5
	GI+840UPTRSY+RYHgU8BBTrH3zQf27k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-E1xr_GUdNZ6HU7P0nEyvRA-1; Mon, 01 Jun 2020 12:08:36 -0400
X-MC-Unique: E1xr_GUdNZ6HU7P0nEyvRA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F07161B18BE9;
	Mon,  1 Jun 2020 16:08:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B57019C4F;
	Mon,  1 Jun 2020 16:08:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A2ACC1809543;
	Mon,  1 Jun 2020 16:08:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051G4Rp7032243 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 12:04:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AE9F560C81; Mon,  1 Jun 2020 16:04:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1409860F8D;
	Mon,  1 Jun 2020 16:04:24 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jfmvF-0001Vy-Gk; Mon, 01 Jun 2020 18:04:22 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 01 Jun 2020 18:04:20 +0200
Message-Id: <20200601160420.666560920@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 01 Jun 2020 18:03:35 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>, 
	djeffery@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, qat-linux@intel.com, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-crypto@vger.kernel.org, jpittman@redhat.com
Subject: [dm-devel] [PATCH 3/4] qat: use GFP_KERNEL allocations
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=qat-gfp-kernel.patch

Use GFP_KERNEL when the flag CRYPTO_TFM_REQ_MAY_SLEEP is present.
Also, use GFP_KERNEL when setting a key.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

Index: linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
===================================================================
--- linux-2.6.orig/drivers/crypto/qat/qat_common/qat_algs.c
+++ linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
@@ -134,6 +134,11 @@ struct qat_alg_skcipher_ctx {
 	struct crypto_skcipher *tfm;
 };
 
+static int qat_gfp(u32 flags)
+{
+	return flags & CRYPTO_TFM_REQ_MAY_SLEEP ? GFP_KERNEL : GFP_ATOMIC;
+}
+
 static int qat_get_inter_state_size(enum icp_qat_hw_auth_algo qat_hash_alg)
 {
 	switch (qat_hash_alg) {
@@ -622,14 +627,14 @@ static int qat_alg_aead_newkey(struct cr
 	ctx->inst = inst;
 	ctx->enc_cd = dma_alloc_coherent(dev, sizeof(*ctx->enc_cd),
 					 &ctx->enc_cd_paddr,
-					 GFP_ATOMIC);
+					 GFP_KERNEL);
 	if (!ctx->enc_cd) {
 		ret = -ENOMEM;
 		goto out_free_inst;
 	}
 	ctx->dec_cd = dma_alloc_coherent(dev, sizeof(*ctx->dec_cd),
 					 &ctx->dec_cd_paddr,
-					 GFP_ATOMIC);
+					 GFP_KERNEL);
 	if (!ctx->dec_cd) {
 		ret = -ENOMEM;
 		goto out_free_enc;
@@ -704,7 +709,8 @@ static void qat_alg_free_bufl(struct qat
 static int qat_alg_sgl_to_bufl(struct qat_crypto_instance *inst,
 			       struct scatterlist *sgl,
 			       struct scatterlist *sglout,
-			       struct qat_crypto_request *qat_req)
+			       struct qat_crypto_request *qat_req,
+			       int gfp)
 {
 	struct device *dev = &GET_DEV(inst->accel_dev);
 	int i, sg_nctr = 0;
@@ -719,7 +725,7 @@ static int qat_alg_sgl_to_bufl(struct qa
 	if (unlikely(!n))
 		return -EINVAL;
 
-	bufl = kzalloc_node(sz, GFP_ATOMIC,
+	bufl = kzalloc_node(sz, gfp,
 			    dev_to_node(&GET_DEV(inst->accel_dev)));
 	if (unlikely(!bufl))
 		return -ENOMEM;
@@ -753,7 +759,7 @@ static int qat_alg_sgl_to_bufl(struct qa
 		n = sg_nents(sglout);
 		sz_out = struct_size(buflout, bufers, n + 1);
 		sg_nctr = 0;
-		buflout = kzalloc_node(sz_out, GFP_ATOMIC,
+		buflout = kzalloc_node(sz_out, gfp,
 				       dev_to_node(&GET_DEV(inst->accel_dev)));
 		if (unlikely(!buflout))
 			goto err_in;
@@ -876,7 +882,7 @@ static int qat_alg_aead_dec(struct aead_
 	int digst_size = crypto_aead_authsize(aead_tfm);
 	int ret, backed_off;
 
-	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
+	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req, qat_gfp(areq->base.flags));
 	if (unlikely(ret))
 		return ret;
 
@@ -919,7 +925,7 @@ static int qat_alg_aead_enc(struct aead_
 	uint8_t *iv = areq->iv;
 	int ret, backed_off;
 
-	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
+	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req, qat_gfp(areq->base.flags));
 	if (unlikely(ret))
 		return ret;
 
@@ -980,14 +986,14 @@ static int qat_alg_skcipher_newkey(struc
 	ctx->inst = inst;
 	ctx->enc_cd = dma_alloc_coherent(dev, sizeof(*ctx->enc_cd),
 					 &ctx->enc_cd_paddr,
-					 GFP_ATOMIC);
+					 GFP_KERNEL);
 	if (!ctx->enc_cd) {
 		ret = -ENOMEM;
 		goto out_free_instance;
 	}
 	ctx->dec_cd = dma_alloc_coherent(dev, sizeof(*ctx->dec_cd),
 					 &ctx->dec_cd_paddr,
-					 GFP_ATOMIC);
+					 GFP_KERNEL);
 	if (!ctx->dec_cd) {
 		ret = -ENOMEM;
 		goto out_free_enc;
@@ -1063,11 +1069,11 @@ static int qat_alg_skcipher_encrypt(stru
 		return 0;
 
 	qat_req->iv = dma_alloc_coherent(dev, AES_BLOCK_SIZE,
-					 &qat_req->iv_paddr, GFP_ATOMIC);
+					 &qat_req->iv_paddr, qat_gfp(req->base.flags));
 	if (!qat_req->iv)
 		return -ENOMEM;
 
-	ret = qat_alg_sgl_to_bufl(ctx->inst, req->src, req->dst, qat_req);
+	ret = qat_alg_sgl_to_bufl(ctx->inst, req->src, req->dst, qat_req, qat_gfp(req->base.flags));
 	if (unlikely(ret)) {
 		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
 				  qat_req->iv_paddr);
@@ -1122,11 +1128,11 @@ static int qat_alg_skcipher_decrypt(stru
 		return 0;
 
 	qat_req->iv = dma_alloc_coherent(dev, AES_BLOCK_SIZE,
-					 &qat_req->iv_paddr, GFP_ATOMIC);
+					 &qat_req->iv_paddr, qat_gfp(req->base.flags));
 	if (!qat_req->iv)
 		return -ENOMEM;
 
-	ret = qat_alg_sgl_to_bufl(ctx->inst, req->src, req->dst, qat_req);
+	ret = qat_alg_sgl_to_bufl(ctx->inst, req->src, req->dst, qat_req, qat_gfp(req->base.flags));
 	if (unlikely(ret)) {
 		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
 				  qat_req->iv_paddr);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

