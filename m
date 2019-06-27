Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 681F457CE0
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69F54308A953;
	Thu, 27 Jun 2019 07:11:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DC33600CC;
	Thu, 27 Jun 2019 07:11:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 225511806B19;
	Thu, 27 Jun 2019 07:10:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5R74ibw027338 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 03:04:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0605B1001B14; Thu, 27 Jun 2019 07:04:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F23391001959
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 07:04:41 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2293430024AD
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 07:04:26 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j6so2464314ioa.5
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 00:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AZmkg14rhmcX5Dvn99I9Bdojb+GxN0kaY+JY2CKjAGo=;
	b=vbR3WYhUS9HeIiQnXzqMjOMfF59F2nBROJQUUfNES1Cd8B0fbpsjXssBRAwBd4OJWb
	UCpNtnUJlqgzQGSq6iTYX6coyVr/A4iw4si1tGeljV3UibLsB4dpN7hiG8JSFpTgw/O+
	Ud4ifzxOXHzXuDDLlYp0GOuHO2/CPZtQf8hCGmP+qIwKsbIcgxDo4T4DVrrwnLutmHVl
	zbqqUHgT1TnteK5e0ksflhMCgTp2MLDb4JZtBvfrENyu4SEt1xhsANAccIFeIhkB6a94
	XykjByBhbk34K9b33OPIQG+ZGnUDzklMMdD3fqmUXLson+2cL1cBzrus+P0MH0xC1eSY
	scug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AZmkg14rhmcX5Dvn99I9Bdojb+GxN0kaY+JY2CKjAGo=;
	b=dYnOU/7NYrYPc8HHBHW1lpzB9RqJYypvF+s2N3vsOMpOO4xilmCs1c4xYJNr+YMRe3
	LaQGG1spAky/byOOHcxs/C1/kjxNeBPek5fA2NZvVkW+2d89X0X6aAlcpLKliTZNob2a
	weyHfn/r5fsRFmI7PIn5qyGfMHTNDQQ7u4x4bZeI1pTz6zWm6q/z6T1TdQmr5S4Wq7ao
	3mGwBPpgiKSrxCZT281T+a5oheXp7dGtoH3KhSbRZjpvVLsPMC5uTKypUMBbbLsC28/R
	0JajQ7rLFiX0TpqeoqN2qwCeqco0hc/Rgkh6/+Tos8ZjLavDcUMJ6WSgzqf6xCpa60ie
	trBQ==
X-Gm-Message-State: APjAAAWII+zhdPuavTuyPTXu0iYVQelPvwTI1nZkP1ydq0t2noAt6KMS
	hpQ/32aUeOk/2SlulCQ9W4LST8i5HSD+rOqdHYcc2w==
X-Google-Smtp-Source: APXvYqyQ8lEGEOe574tAaBoj1hNDqt9LhwaGLmd8WzETW0ivzLxr8aw/A+Me4o6JpnjnyIzfoRf+ZGTv19sNDODhzm8=
X-Received: by 2002:a6b:7312:: with SMTP id e18mr2631988ioh.156.1561619065452; 
	Thu, 27 Jun 2019 00:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
	<20190626204047.32131-2-ard.biesheuvel@linaro.org>
In-Reply-To: <20190626204047.32131-2-ard.biesheuvel@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 27 Jun 2019 09:04:10 +0200
Message-ID: <CAKv+Gu8ivcjgM0hjLHrf55kWHpoV8ZYYYLkPuaapMe6Yj37Zbg@mail.gmail.com>
To: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 27 Jun 2019 07:04:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 27 Jun 2019 07:04:26 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.189  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com
	209.85.166.68 mail-io1-f68.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [dm-devel] [PATCH v5 1/7] crypto: essiv - create wrapper
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 27 Jun 2019 07:12:15 +0000 (UTC)

On Wed, 26 Jun 2019 at 22:40, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> Implement a template that wraps a (skcipher,cipher,shash) or
> (aead,cipher,shash) tuple so that we can consolidate the ESSIV handling
> in fscrypt and dm-crypt and move it into the crypto API. This will result
> in better test coverage, and will allow future changes to make the bare
> cipher interface internal to the crypto subsystem, in order to increase
> robustness of the API against misuse.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  crypto/Kconfig  |   4 +
>  crypto/Makefile |   1 +
>  crypto/essiv.c  | 636 ++++++++++++++++++++
>  3 files changed, 641 insertions(+)
>
...
> diff --git a/crypto/essiv.c b/crypto/essiv.c
> new file mode 100644
> index 000000000000..fddf6dcc3823
> --- /dev/null
> +++ b/crypto/essiv.c
> @@ -0,0 +1,636 @@
...
> +static void essiv_aead_done(struct crypto_async_request *areq, int err)
> +{
> +       struct aead_request *req = areq->data;
> +       struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
> +
> +       if (rctx->iv)
> +               kfree(rctx->iv);
> +       aead_request_complete(req, err);
> +}
> +
> +static int essiv_aead_crypt(struct aead_request *req, bool enc)
> +{
> +       gfp_t gfp = (req->base.flags & CRYPTO_TFM_REQ_MAY_SLEEP) ? GFP_KERNEL
> +                                                                : GFP_ATOMIC;
> +       struct crypto_aead *tfm = crypto_aead_reqtfm(req);
> +       const struct essiv_tfm_ctx *tctx = crypto_aead_ctx(tfm);
> +       struct essiv_aead_request_ctx *rctx = aead_request_ctx(req);
> +       struct aead_request *subreq = &rctx->aead_req;
> +       struct scatterlist *sg;
> +       int err;
> +
> +       crypto_cipher_encrypt_one(tctx->essiv_cipher, req->iv, req->iv);
> +
> +       /*
> +        * dm-crypt embeds the sector number and the IV in the AAD region, so
> +        * we have to copy the converted IV into the source scatterlist before
> +        * we pass it on. If the source and destination scatterlist pointers
> +        * are the same, we just update the IV copy in the AAD region in-place.
> +        * However, if they are different, the caller is not expecting us to
> +        * modify the memory described by the source scatterlist, and so we have
> +        * to do this little dance to create a new scatterlist that backs the
> +        * IV slot in the AAD region with a scratch buffer that we can freely
> +        * modify.
> +        */
> +       rctx->iv = NULL;
> +       if (req->src != req->dst) {
> +               int ivsize = crypto_aead_ivsize(tfm);
> +               int ssize = req->assoclen - ivsize;
> +               u8 *iv;
> +
> +               if (ssize < 0 || sg_nents_for_len(req->src, ssize) != 1)
> +                       return -EINVAL;
> +
> +               if (enc) {
> +                       rctx->iv = iv = kmemdup(req->iv, ivsize, gfp);

This allocation is not really needed - I'll enlarge the request ctx
struct instead so I can incorporate it as an anonymous member.

> +                       if (!iv)
> +                               return -ENOMEM;
> +               } else {
> +                       /*
> +                        * On the decrypt path, the ahash executes before the
> +                        * skcipher gets a chance to clobber req->iv with its
> +                        * output IV, so just map the buffer directly.
> +                        */
> +                       iv = req->iv;
> +               }
> +
> +               sg_init_table(rctx->sg, 4);
> +               sg_set_page(rctx->sg, sg_page(req->src), ssize, req->src->offset);
> +               sg_set_buf(rctx->sg + 1, iv, ivsize);
> +               sg = scatterwalk_ffwd(rctx->sg + 2, req->src, req->assoclen);
> +               if (sg != rctx->sg + 2)
> +                       sg_chain(rctx->sg, 3, sg);
> +               sg = rctx->sg;
> +       } else {
> +               scatterwalk_map_and_copy(req->iv, req->dst,
> +                                        req->assoclen - crypto_aead_ivsize(tfm),
> +                                        crypto_aead_ivsize(tfm), 1);
> +               sg = req->src;
> +       }
> +
> +       aead_request_set_tfm(subreq, tctx->u.aead);
> +       aead_request_set_ad(subreq, req->assoclen);
> +       aead_request_set_callback(subreq, aead_request_flags(req),
> +                                 essiv_aead_done, req);
> +       aead_request_set_crypt(subreq, sg, req->dst, req->cryptlen, req->iv);
> +
> +       err = enc ? crypto_aead_encrypt(subreq) :
> +                   crypto_aead_decrypt(subreq);
> +
> +       if (rctx->iv && err != -EINPROGRESS)
> +               kfree(rctx->iv);
> +
> +       return err;
> +}
> +
...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
