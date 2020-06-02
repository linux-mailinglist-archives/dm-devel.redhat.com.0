Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5601ED0BC
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 15:26:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591190768;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6f+6RYEGMa+hjr6Lhkqef3NNviV6Eld2yNGCfcmyuvg=;
	b=BWtb6lX7iQtKoezxowdWGLCwYa3jKys+9t/SaXaCm/2ACQG0PZzmTwE5w6WpVMZGxBHP7B
	2Ku4CEejh6pNtzm3568Yw3xEN7un3IyubJv9v59tq5puql0E+SM6W8tG99MbL8Cr7e7/IA
	7TOYPd6R0wqY0ZhfHflIrgpxc16lm8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-uPh2VAIjMSCelJtbRbm_gg-1; Wed, 03 Jun 2020 09:26:05 -0400
X-MC-Unique: uPh2VAIjMSCelJtbRbm_gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75DE683DE2D;
	Wed,  3 Jun 2020 13:25:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 573E15D9D3;
	Wed,  3 Jun 2020 13:25:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 110AC180954D;
	Wed,  3 Jun 2020 13:25:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 052M5a1h021093 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 18:05:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B6458DBAE3; Tue,  2 Jun 2020 22:05:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B230DE38D2
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 22:05:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3AE4C18F0242
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 22:05:33 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-75-fYsF0kbJNQGeu0cJsLs0fg-1; 
	Tue, 02 Jun 2020 18:05:29 -0400
X-MC-Unique: fYsF0kbJNQGeu0cJsLs0fg-1
IronPort-SDR: qCVw/BDlH/EUdW1i/reWhR1uIHel84IApc8wi1gNhlpIChV1f9hvkaF9JLojkNIy5tJ06xeNai
	rt1zb+wZ69aA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	02 Jun 2020 15:05:26 -0700
IronPort-SDR: NqmMFRa8ZSSO8O9xNeDZJ5yE5ZCB0s79dca5YjmIRxoG37KxtWK1lphiKUxqkdhiRrZN+5uVjg
	fBHhsA03inXA==
X-IronPort-AV: E=Sophos;i="5.73,466,1583222400"; d="scan'208";a="470824556"
Received: from silpixa00400314.ir.intel.com (HELO silpixa00400314)
	([10.237.222.51]) by fmsmga006-auth.fm.intel.com with
	ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2020 15:05:23 -0700
Date: Tue, 2 Jun 2020 23:05:16 +0100
From: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200602220516.GA20880@silpixa00400314>
References: <20200601160418.171851200@debian-a64.vm>
MIME-Version: 1.0
In-Reply-To: <20200601160418.171851200@debian-a64.vm>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 03 Jun 2020 09:25:45 -0400
Cc: guazhang@redhat.com, Mike Snitzer <msnitzer@redhat.com>,
	djeffery@redhat.com, Herbert Xu <herbert@gondor.apana.org.au>,
	qat-linux@intel.com, jpittman@redhat.com, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] qat: fix misunderstood -EBUSY return code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Mikulas,

thanks for your patch. See below.

On Mon, Jun 01, 2020 at 06:03:33PM +0200, Mikulas Patocka wrote:
> Using dm-crypt with QAT result in deadlocks.
> 
> If a crypto routine returns -EBUSY, it is expected that the crypto driver
> have already queued the request and the crypto API user should assume that
> this request was processed, but it should stop sending more requests. When
> an -EBUSY request is processed, the crypto driver calls the callback with
> the error code -EINPROGRESS - this means that the request is still being
> processed (i.e. the user should wait for another callback), but the user
> can start sending more requests now.
> 
> The QAT driver misunderstood this logic, it return -EBUSY when the queue
> was full and didn't queue the request - the request was lost and it
> resulted in a deadlock.
> 
> This patch fixes busy state handling - if the queue is at least 15/16
> full, we return -EBUSY to signal to the user that no more requests should
> be sent. We remember that we returned -EBUSY (the variable backed_off) and
> if we finish the request, we return -EINPROGRESS to indicate that the user
> can send more requests.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> 
> Index: linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
> ===================================================================
> --- linux-2.6.orig/drivers/crypto/qat/qat_common/qat_algs.c
> +++ linux-2.6/drivers/crypto/qat/qat_common/qat_algs.c
> @@ -826,6 +826,9 @@ static void qat_aead_alg_callback(struct
>  	qat_alg_free_bufl(inst, qat_req);
>  	if (unlikely(qat_res != ICP_QAT_FW_COMN_STATUS_FLAG_OK))
>  		res = -EBADMSG;
> +
> +	if (qat_req->backed_off)
> +		areq->base.complete(&areq->base, -EINPROGRESS);
>  	areq->base.complete(&areq->base, res);
>  }
>  
> @@ -847,6 +850,8 @@ static void qat_skcipher_alg_callback(st
>  	dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
>  			  qat_req->iv_paddr);
>  
> +	if (qat_req->backed_off)
> +		sreq->base.complete(&sreq->base, -EINPROGRESS);
>  	sreq->base.complete(&sreq->base, res);
>  }
>  
> @@ -869,7 +874,7 @@ static int qat_alg_aead_dec(struct aead_
>  	struct icp_qat_fw_la_auth_req_params *auth_param;
>  	struct icp_qat_fw_la_bulk_req *msg;
>  	int digst_size = crypto_aead_authsize(aead_tfm);
> -	int ret, ctr = 0;
> +	int ret, backed_off;
>  
>  	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
>  	if (unlikely(ret))
> @@ -890,15 +895,16 @@ static int qat_alg_aead_dec(struct aead_
>  	auth_param = (void *)((uint8_t *)cipher_param + sizeof(*cipher_param));
>  	auth_param->auth_off = 0;
>  	auth_param->auth_len = areq->assoclen + cipher_param->cipher_length;
> -	do {
> -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> -	} while (ret == -EAGAIN && ctr++ < 10);
>  
> +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> +again:
> +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
>  	if (ret == -EAGAIN) {
> -		qat_alg_free_bufl(ctx->inst, qat_req);
> -		return -EBUSY;
> +		qat_req->backed_off = backed_off = 1;
> +		cpu_relax();
> +		goto again;
>  	}
I am a bit concerned about this potential infinite loop.
If an error occurred on the device and the queue is full, we will be
stuck here forever.
Should we just retry a number of times and then fail?
Or, should we just move to the crypto-engine?

> -	return -EINPROGRESS;
> +	return backed_off ? -EBUSY : -EINPROGRESS;
>  }
>  
>  static int qat_alg_aead_enc(struct aead_request *areq)
> @@ -911,7 +917,7 @@ static int qat_alg_aead_enc(struct aead_
>  	struct icp_qat_fw_la_auth_req_params *auth_param;
>  	struct icp_qat_fw_la_bulk_req *msg;
>  	uint8_t *iv = areq->iv;
> -	int ret, ctr = 0;
> +	int ret, backed_off;
>  
>  	ret = qat_alg_sgl_to_bufl(ctx->inst, areq->src, areq->dst, qat_req);
>  	if (unlikely(ret))
> @@ -935,15 +941,15 @@ static int qat_alg_aead_enc(struct aead_
>  	auth_param->auth_off = 0;
>  	auth_param->auth_len = areq->assoclen + areq->cryptlen;
>  
> -	do {
> -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> -	} while (ret == -EAGAIN && ctr++ < 10);
> -
> +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
checkpatch: line over 80 characters - same in every place
adf_should_back_off is used.

> +again:
> +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
>  	if (ret == -EAGAIN) {
> -		qat_alg_free_bufl(ctx->inst, qat_req);
> -		return -EBUSY;
> +		qat_req->backed_off = backed_off = 1;
> +		cpu_relax();
> +		goto again;
>  	}
> -	return -EINPROGRESS;
> +	return backed_off ? -EBUSY : -EINPROGRESS;
>  }
>  
>  static int qat_alg_skcipher_rekey(struct qat_alg_skcipher_ctx *ctx,
> @@ -1051,7 +1057,7 @@ static int qat_alg_skcipher_encrypt(stru
>  	struct icp_qat_fw_la_cipher_req_params *cipher_param;
>  	struct icp_qat_fw_la_bulk_req *msg;
>  	struct device *dev = &GET_DEV(ctx->inst->accel_dev);
> -	int ret, ctr = 0;
> +	int ret, backed_off;
>  
>  	if (req->cryptlen == 0)
>  		return 0;
> @@ -1081,17 +1087,16 @@ static int qat_alg_skcipher_encrypt(stru
>  	cipher_param->cipher_offset = 0;
>  	cipher_param->u.s.cipher_IV_ptr = qat_req->iv_paddr;
>  	memcpy(qat_req->iv, req->iv, AES_BLOCK_SIZE);
> -	do {
> -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> -	} while (ret == -EAGAIN && ctr++ < 10);
>  
> +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> +again:
> +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
>  	if (ret == -EAGAIN) {
> -		qat_alg_free_bufl(ctx->inst, qat_req);
> -		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
> -				  qat_req->iv_paddr);
> -		return -EBUSY;
> +		qat_req->backed_off = backed_off = 1;
> +		cpu_relax();
> +		goto again;
>  	}
> -	return -EINPROGRESS;
> +	return backed_off ? -EBUSY : -EINPROGRESS;
>  }
>  
>  static int qat_alg_skcipher_blk_encrypt(struct skcipher_request *req)
> @@ -1111,7 +1116,7 @@ static int qat_alg_skcipher_decrypt(stru
>  	struct icp_qat_fw_la_cipher_req_params *cipher_param;
>  	struct icp_qat_fw_la_bulk_req *msg;
>  	struct device *dev = &GET_DEV(ctx->inst->accel_dev);
> -	int ret, ctr = 0;
> +	int ret, backed_off;
>  
>  	if (req->cryptlen == 0)
>  		return 0;
> @@ -1141,17 +1146,16 @@ static int qat_alg_skcipher_decrypt(stru
>  	cipher_param->cipher_offset = 0;
>  	cipher_param->u.s.cipher_IV_ptr = qat_req->iv_paddr;
>  	memcpy(qat_req->iv, req->iv, AES_BLOCK_SIZE);
> -	do {
> -		ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
> -	} while (ret == -EAGAIN && ctr++ < 10);
>  
> +	qat_req->backed_off = backed_off = adf_should_back_off(ctx->inst->sym_tx);
> +again:
> +	ret = adf_send_message(ctx->inst->sym_tx, (uint32_t *)msg);
>  	if (ret == -EAGAIN) {
> -		qat_alg_free_bufl(ctx->inst, qat_req);
> -		dma_free_coherent(dev, AES_BLOCK_SIZE, qat_req->iv,
> -				  qat_req->iv_paddr);
> -		return -EBUSY;
> +		qat_req->backed_off = backed_off = 1;
> +		cpu_relax();
> +		goto again;
>  	}
> -	return -EINPROGRESS;
> +	return backed_off ? -EBUSY : -EINPROGRESS;
>  }
>  
>  static int qat_alg_skcipher_blk_decrypt(struct skcipher_request *req)
> Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> ===================================================================
> --- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.c
> +++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.c
> @@ -114,10 +114,19 @@ static void adf_disable_ring_irq(struct
>  	WRITE_CSR_INT_COL_EN(bank->csr_addr, bank->bank_number, bank->irq_mask);
>  }
>  
> +bool adf_should_back_off(struct adf_etr_ring_data *ring)
> +{
> +	return atomic_read(ring->inflights) > ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size) * 15 / 16;
How did you came up with 15/16?
checkpatch: WARNING: line over 80 characters

> +}
> +
>  int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg)
>  {
> -	if (atomic_add_return(1, ring->inflights) >
> -	    ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size)) {
> +	int limit = ADF_MAX_INFLIGHTS(ring->ring_size, ring->msg_size);
> +
> +	if (atomic_read(ring->inflights) >= limit)
> +		return -EAGAIN;
Can this be removed and leave only the condition below?
Am I missing something here?
> +
> +	if (atomic_add_return(1, ring->inflights) > limit) {
>  		atomic_dec(ring->inflights);
>  		return -EAGAIN;
>  	}
> Index: linux-2.6/drivers/crypto/qat/qat_common/adf_transport.h
> ===================================================================
> --- linux-2.6.orig/drivers/crypto/qat/qat_common/adf_transport.h
> +++ linux-2.6/drivers/crypto/qat/qat_common/adf_transport.h
> @@ -58,6 +58,7 @@ int adf_create_ring(struct adf_accel_dev
>  		    const char *ring_name, adf_callback_fn callback,
>  		    int poll_mode, struct adf_etr_ring_data **ring_ptr);
>  
> +bool adf_should_back_off(struct adf_etr_ring_data *ring);
>  int adf_send_message(struct adf_etr_ring_data *ring, uint32_t *msg);
>  void adf_remove_ring(struct adf_etr_ring_data *ring);
>  #endif
> Index: linux-2.6/drivers/crypto/qat/qat_common/qat_crypto.h
> ===================================================================
> --- linux-2.6.orig/drivers/crypto/qat/qat_common/qat_crypto.h
> +++ linux-2.6/drivers/crypto/qat/qat_common/qat_crypto.h
> @@ -90,6 +90,7 @@ struct qat_crypto_request {
>  		   struct qat_crypto_request *req);
>  	void *iv;
>  	dma_addr_t iv_paddr;
> +	int backed_off;
>  };
>  
>  #endif
> 
Regards,

-- 
Giovanni

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

