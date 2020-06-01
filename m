Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id B82341EA78A
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 18:08:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591027719;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Zzex0OObRMRl6LH0iSRUhaOVGrKlkQfp9xQ3JnGxKQ=;
	b=F0mwvDKUgbaxiTFx1BtrAVAZHE732UmZbyiG0xg3mT0ZO+2TkGTu7LGjZMwKQ8u8IMk3NP
	Uj5eQDVihsla+rnqA9+yQN6/ms1Riji/icR1wMF6/jWm01q2s7rbaRj4EH2H8Xsoe8tbWn
	Cmi2KsDYZTrvnRXL6A0dlabmHWDIDDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-EXFazIdiOGiuxnZxFU6l7w-1; Mon, 01 Jun 2020 12:08:37 -0400
X-MC-Unique: EXFazIdiOGiuxnZxFU6l7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10CD47BAC;
	Mon,  1 Jun 2020 16:08:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30643D01FD;
	Mon,  1 Jun 2020 16:08:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D54D9338A;
	Mon,  1 Jun 2020 16:08:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 051G4Ogp032212 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 1 Jun 2020 12:04:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C8BD85C1D0; Mon,  1 Jun 2020 16:04:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.194.129])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 760AD5C1B2;
	Mon,  1 Jun 2020 16:04:21 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jfmvD-0001Vo-0i; Mon, 01 Jun 2020 18:04:20 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 01 Jun 2020 18:04:18 +0200
Message-Id: <20200601160418.171851200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 01 Jun 2020 18:03:33 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>, 
	djeffery@redhat.com
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: guazhang@redhat.com, qat-linux@intel.com, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
	linux-crypto@vger.kernel.org, jpittman@redhat.com
Subject: [dm-devel] [PATCH 1/4] qat: fix misunderstood -EBUSY return code
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
Content-Disposition: inline; filename=qat-fix-4.patch

Using dm-crypt with QAT result in deadlocks.

If a crypto routine returns -EBUSY, it is expected that the crypto driver
have already queued the request and the crypto API user should assume that
this request was processed, but it should stop sending more requests. When
an -EBUSY request is processed, the crypto driver calls the callback with
the error code -EINPROGRESS - this means that the request is still being
processed (i.e. the user should wait for another callback), but the user
can start sending more requests now.

The QAT driver misunderstood this logic, it return -EBUSY when the queue
was full and didn't queue the request - the request was lost and it
resulted in a deadlock.

This patch fixes busy state handling - if the queue is at least 15/16
full, we return -EBUSY to signal to the user that no more requests should
be sent. We remember that we returned -EBUSY (the variable backed_off) and
if we finish the request, we return -EINPROGRESS to indicate that the user
can send more requests.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

Index: linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
===================================================================
--- linux-2.6.orig/drivers/crypto/qat/qat_common/qat_algs.c
+++ linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
@@ -826,6 +826,9 @@ static void qat_aead_alg_callback(struct
 	qat_alg_free_bufl(inst, qat_req);
 	if (unlikely(qat_res != ICP_QAT_FW_COMN_STATUS_FLAG_OK))
 		res = -EBADMSG;
+
+	if (qat_req->backed_off)
+		areq->base.complete(&areq->base, -EINPROGRESS);
 	areq->base.complete(&areq->base, res);
 }
 
@@ -847,6 +850,8 @@ static void qat_skcipher_alg_callback(st
 	dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
 			  qat_req->iv_paddr);
 
+	if (qat_req->backed_off)
+		sreq->base.complete(&sreq->base, -EINPROGRESS);
 	sreq->base.complete(&sreq->base, res);
 }
 
@@ -869,7 +874,7 @@ static int qat_alg_aead_dec(struct aead_
 	struct icp_qat_fw_la_auth_req_params *auth_param;
 	struct icp_qat_fw_la_bulk_req *msg;
 	int digst_size = crypto_aead_authsize(aead_tfm);
-	int ret, ctr = 0;
+	int ret, backed_off;
 
 	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
 	if (unlikely(ret))
@@ -890,15 +895,16 @@ static int qat_alg_aead_dec(struct aead_
 	auth_param = (void *)((uint8_t *)cipher_param + sizeof(*cipher_param));
 	auth_param->auth_off = 0;
 	auth_param->auth_len = areq->assoclen + cipher_param->cipher_length;
-	do {
-		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
-	} while (ret == -EAGAIN && ctr++ < 10);
 
+	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
+again:
+	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
 	if (ret == -EAGAIN) {
-		qat_alg_free_bufl(ctx->inst, qat_req);
-		return -EBUSY;
+		qat_req->backed_off = backed_off = 1;
+		cpu_relax();
+		goto again;
 	}
-	return -EINPROGRESS;
+	return backed_off ? -EBUSY : -EINPROGRESS;
 }
 
 static int qat_alg_aead_enc(struct aead_request *areq)
@@ -911,7 +917,7 @@ static int qat_alg_aead_enc(struct aead_
 	struct icp_qat_fw_la_auth_req_params *auth_param;
 	struct icp_qat_fw_la_bulk_req *msg;
 	uint8_t *iv = areq->iv;
-	int ret, ctr = 0;
+	int ret, backed_off;
 
 	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
 	if (unlikely(ret))
@@ -935,15 +941,15 @@ static int qat_alg_aead_enc(struct aead_
 	auth_param->auth_off = 0;
 	auth_param->auth_len = areq->assoclen + areq->cryptlen;
 
-	do {
-		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
-	} while (ret == -EAGAIN && ctr++ < 10);
-
+	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
+again:
+	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
 	if (ret == -EAGAIN) {
-		qat_alg_free_bufl(ctx->inst, qat_req);
-		return -EBUSY;
+		qat_req->backed_off = backed_off = 1;
+		cpu_relax();
+		goto again;
 	}
-	return -EINPROGRESS;
+	return backed_off ? -EBUSY : -EINPROGRESS;
 }
 
 static int qat_alg_skcipher_rekey(struct qat_alg_skcipher_ctx *ctx,
@@ -1051,7 +1057,7 @@ static int qat_alg_skcipher_encrypt(stru
 	struct icp_qat_fw_la_cipher_req_params *cipher_param;
 	struct icp_qat_fw_la_bulk_req *msg;
 	struct device *dev = &GET_DEV(ctx->inst->accel_dev);
-	int ret, ctr = 0;
+	int ret, backed_off;
 
 	if (req->cryptlen == 0)
 		return 0;
@@ -1081,17 +1087,16 @@ static int qat_alg_skcipher_encrypt(stru
 	cipher_param->cipher_offset = 0;
 	cipher_param->u.s.cipher_IV_ptr = qat_req->iv_paddr;
 	memcpy(qat_req->iv, req->iv, AES_BLOCK_SIZE);
-	do {
-		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
-	} while (ret == -EAGAIN && ctr++ < 10);
 
+	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
+again:
+	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
 	if (ret == -EAGAIN) {
-		qat_alg_free_bufl(ctx->inst, qat_req);
-		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
-				  qat_req->iv_paddr);
-		return -EBUSY;
+		qat_req->backed_off = backed_off = 1;
+		cpu_relax();
+		goto again;
 	}
-	return -EINPROGRESS;
+	return backed_off ? -EBUSY : -EINPROGRESS;
 }
 
 static int qat_alg_skcipher_blk_encrypt(struct skcipher_request *req)
@@ -1111,7 +1116,7 @@ static int qat_alg_skcipher_decrypt(stru
 	struct icp_qat_fw_la_cipher_req_params *cipher_param;
 	struct icp_qat_fw_la_bulk_req *msg;
 	struct device *dev = &GET_DEV(ctx->inst->accel_dev);
-	int ret, ctr = 0;
+	int ret, backed_off;
 
 	if (req->cryptlen == 0)
 		return 0;
@@ -1141,17 +1146,16 @@ static int qat_alg_skcipher_decrypt(stru
 	cipher_param->cipher_offset = 0;
 	cipher_param->u.s.cipher_IV_ptr = qat_req->iv_paddr;
 	memcpy(qat_req->iv, req->iv, AES_BLOCK_SIZE);
-	do {
-		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
-	} while (ret == -EAGAIN && ctr++ < 10);
 
+	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
+again:
+	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
 	if (ret == -EAGAIN) {
-		qat_alg_free_bufl(ctx->inst, qat_req);
-		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
-				  qat_req->iv_paddr);
-		return -EBUSY;
+		qat_req->backed_off = backed_off = 1;
+		cpu_relax();
+		goto again;
 	}
-	return -EINPROGRESS;
+	return backed_off ? -EBUSY : -EINPROGRESS;
 }
 
 static int qat_alg_skcipher_blk_decrypt(struct skcipher_request *req)
Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
===================================================================
--- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.c
+++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
@@ -114,10 +114,19 @@ static void adf_disable_ring_irq(struct
 	WRITE_CSR_INT_COL_EN(bank->csr_addr, bank->bank_number, bank->irq_mask);
 }
 
+bool adf_should_back_off(struct adf_etr_ring_data *ring)
+{
+	return atomic_read(ring->inflights) > ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size) * 15 / 16;
+}
+
 int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg)
 {
-	if (atomic_add_return(1, ring->inflights) >
-	    ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size)) {
+	int limit = ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size);
+
+	if (atomic_read(ring->inflights) >= limit)
+		return -EAGAIN;
+
+	if (atomic_add_return(1, ring->inflights) > limit) {
 		atomic_dec(ring->inflights);
 		return -EAGAIN;
 	}
Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.h
===================================================================
--- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.h
+++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.h
@@ -58,6 +58,7 @@ int adf_create_ring(struct adf_accel_dev
 		    const char *ring_name, adf_callback_fn callback,
 		    int poll_mode, struct adf_etr_ring_data **ring_ptr);
 
+bool adf_should_back_off(struct adf_etr_ring_data *ring);
 int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg);
 void adf_remove_ring(struct adf_etr_ring_data *ring);
 #endif
Index: linux-2.6/drivers/crypto/qat/qat_common/qat_crypto.h
===================================================================
--- linux-2.6.orig/drivers/crypto/qat/qat_common/qat_crypto.h
+++ linux-2.6/drivers/crypto/qat/qat_common/qat_crypto.h
@@ -90,6 +90,7 @@ struct qat_crypto_request {
 		   struct qat_crypto_request *req);
 	void *iv;
 	dma_addr_t iv_paddr;
+	int backed_off;
 };
 
 #endif

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

