Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 219AF8A757
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 21:39:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 281933082E61;
	Mon, 12 Aug 2019 19:39:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9E1D69FDE;
	Mon, 12 Aug 2019 19:39:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C37524F2F;
	Mon, 12 Aug 2019 19:39:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CJcvKs003169 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 15:38:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 66FB362675; Mon, 12 Aug 2019 19:38:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62128808A8
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 19:38:54 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1D1AAC0022F1
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 19:38:53 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 61E8B20663;
	Mon, 12 Aug 2019 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565638732;
	bh=TeNAgou5xhC4DS9qCYvzkbTcsAXOHiXZsiyoVTGksr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pT1/RiKjvjn9rcJ/uUe9r5Nl7U+g5vpswiAX3x9/aCYMQ8wVB66k98/H5VsWY0gbh
	9RXMGMNr2gYg7IARkB5t7trghqw9MuGqQQGB/TCfHhANdfV2izFzhKukuGZpNnhJ9I
	m9Qm1l+6GCeqQM0CcnTYjyhR4VUfSIqVoJPo/2XQ=
Date: Mon, 12 Aug 2019 12:38:50 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190812193849.GA131059@gmail.com>
Mail-Followup-To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Milan Broz <gmazyland@gmail.com>
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
	<20190812145324.27090-2-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812145324.27090-2-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 12 Aug 2019 19:38:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 12 Aug 2019 19:38:53 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -2.002  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v10 1/7] crypto: essiv - create wrapper
 template for ESSIV generation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 12 Aug 2019 19:39:13 +0000 (UTC)

On Mon, Aug 12, 2019 at 05:53:18PM +0300, Ard Biesheuvel wrote:
> +	switch (type) {
> +	case CRYPTO_ALG_TYPE_BLKCIPHER:
> +		skcipher_inst = kzalloc(sizeof(*skcipher_inst) +
> +					sizeof(*ictx), GFP_KERNEL);
> +		if (!skcipher_inst)
> +			return -ENOMEM;
> +		inst = skcipher_crypto_instance(skcipher_inst);
> +		base = &skcipher_inst->alg.base;
> +		ictx = crypto_instance_ctx(inst);
> +
> +		/* Block cipher, e.g. "cbc(aes)" */
> +		crypto_set_skcipher_spawn(&ictx->u.skcipher_spawn, inst);
> +		err = crypto_grab_skcipher(&ictx->u.skcipher_spawn,
> +					   inner_cipher_name, 0,
> +					   crypto_requires_sync(algt->type,
> +								algt->mask));
> +		if (err)
> +			goto out_free_inst;

This should say "Symmetric cipher", not "Block cipher".

> +
> +	if (!parse_cipher_name(essiv_cipher_name, block_base->cra_name)) {
> +		pr_warn("Failed to parse ESSIV cipher name from skcipher cra_name\n");
> +		goto out_drop_skcipher;
> +	}

This is missing:
		
		err = -EINVAL;

> +	if (type == CRYPTO_ALG_TYPE_BLKCIPHER) {
> +		skcipher_inst->alg.setkey	= essiv_skcipher_setkey;
> +		skcipher_inst->alg.encrypt	= essiv_skcipher_encrypt;
> +		skcipher_inst->alg.decrypt	= essiv_skcipher_decrypt;
> +		skcipher_inst->alg.init		= essiv_skcipher_init_tfm;
> +		skcipher_inst->alg.exit		= essiv_skcipher_exit_tfm;
> +
> +		skcipher_inst->alg.min_keysize	= crypto_skcipher_alg_min_keysize(skcipher_alg);
> +		skcipher_inst->alg.max_keysize	= crypto_skcipher_alg_max_keysize(skcipher_alg);
> +		skcipher_inst->alg.ivsize	= crypto_skcipher_alg_ivsize(skcipher_alg);
> +		skcipher_inst->alg.chunksize	= crypto_skcipher_alg_chunksize(skcipher_alg);
> +		skcipher_inst->alg.walksize	= crypto_skcipher_alg_walksize(skcipher_alg);
> +
> +		skcipher_inst->free		= essiv_skcipher_free_instance;
> +
> +		err = skcipher_register_instance(tmpl, skcipher_inst);
> +	} else {
> +		aead_inst->alg.setkey		= essiv_aead_setkey;
> +		aead_inst->alg.setauthsize	= essiv_aead_setauthsize;
> +		aead_inst->alg.encrypt		= essiv_aead_encrypt;
> +		aead_inst->alg.decrypt		= essiv_aead_decrypt;
> +		aead_inst->alg.init		= essiv_aead_init_tfm;
> +		aead_inst->alg.exit		= essiv_aead_exit_tfm;
> +
> +		aead_inst->alg.ivsize		= crypto_aead_alg_ivsize(aead_alg);
> +		aead_inst->alg.maxauthsize	= crypto_aead_alg_maxauthsize(aead_alg);
> +		aead_inst->alg.chunksize	= crypto_aead_alg_chunksize(aead_alg);
> +
> +		aead_inst->free			= essiv_aead_free_instance;
> +
> +		err = aead_register_instance(tmpl, aead_inst);
> +	}

'ivsize' is already in a variable, so could use

		skcipher_inst->alg.ivsize       = ivsize;

	and
		aead_inst->alg.ivsize           = ivsize;
		
- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
