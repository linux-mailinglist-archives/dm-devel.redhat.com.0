Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E39B8AEA8
	for <lists+dm-devel@lfdr.de>; Tue, 13 Aug 2019 07:18:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BAD02CE953;
	Tue, 13 Aug 2019 05:18:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F7DA1001281;
	Tue, 13 Aug 2019 05:18:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DBA582551C;
	Tue, 13 Aug 2019 05:18:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7D5ICwB019673 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 01:18:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 983B7811A8; Tue, 13 Aug 2019 05:18:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 925F75D717
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 05:18:10 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24F5A3086262
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 05:18:09 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id j16so4260672wrr.8
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 22:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=vjknMuAeSc0x7oeuMDtq2tLSIl2orQ+1iduGgKWbGiw=;
	b=w5qmuoq9X3Ml79Oe1T1zepUjvQjsv5b3F4f3sRbDxivdoqN+9fmOkhtVxNVieqI/V0
	1UwDPWvUG7SLBcRYLtyKb5wdQ6jb2GAkmuCqCks4MLYK/Nht/6Yxrqzr5ugKIz7Jk2X0
	J3H8XX512BzYf9tbFQhBoOz1DxSRardaf5QQPj3bYPEd6Q8q28AV24jQy+Th02Mt4Hb5
	oSBrKROm9BjZy1kuqABp6BKAHYiQWwZSwCb2ERMycX5krB8CBagv6coSo2nB6bAJKlJc
	UxY6mxBtdJdWdgBWzIbiy51QIrnyTWxqrXwrmrzenSgkfWTlRJ5guihgG8C5I2lfnSeA
	JuBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=vjknMuAeSc0x7oeuMDtq2tLSIl2orQ+1iduGgKWbGiw=;
	b=FKwMNzJIwreoSCfa/BrUOII67ys1V9PbA1MIlMr+NYXrOFe6cRzM+q9l2Mat2PaeK3
	1F7+p6NkvOJMi/uGLtnq7sXJOix1IHkozb2HBgYM4C6h+LctFP6PWYpuvsjwSSpko9dP
	eAiRVEfh7XkF+T3Sbyvq23yGoEznZugIf+yp5cBZfmsYNyMYtsOLcE/QnbBzeY/SqTLg
	PBx4O6zx2YBpGGhPdr6rVBInzCpm3FedkQW3WjI1/Vuhhfo2FsPALIDCbInzLFA2pBhM
	AOEwgJVtm+FJDJoejghcyb8QiiIhvYYJroP1c3EyiNy1tmEyi7rSGoKpDQwypih/fGsa
	n4sg==
X-Gm-Message-State: APjAAAUUBH/2Qn8k6hidg1auIuH2Yc7Qtm6agWdFV2ksxlTdoxf2iY3Y
	MkHD166+5/8h6XnoADUtwG9dL6ubjn/N0EMhJHgRULrtDNE=
X-Google-Smtp-Source: APXvYqyT1D3REzaL959a3ymyuxK4owGKfnAIBTa58BY2l3RptzUHdepEU1bThGxSjSVPCPLqjkiSL+3E6lYeF4pkbOM=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr33607676wrw.169.1565673487792; 
	Mon, 12 Aug 2019 22:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
	<20190812145324.27090-2-ard.biesheuvel@linaro.org>
	<20190812193849.GA131059@gmail.com>
In-Reply-To: <20190812193849.GA131059@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 13 Aug 2019 08:17:56 +0300
Message-ID: <CAKv+Gu-Nk0tMST32d3cwuiwGmZmXgKRDd2h9BuW-iPeoqSN5tA@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org, Gilad Ben-Yossef <gilad@benyossef.com>, 
	Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Tue, 13 Aug 2019 05:18:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 13 Aug 2019 05:18:09 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Tue, 13 Aug 2019 05:18:23 +0000 (UTC)

On Mon, 12 Aug 2019 at 22:38, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Aug 12, 2019 at 05:53:18PM +0300, Ard Biesheuvel wrote:
> > +     switch (type) {
> > +     case CRYPTO_ALG_TYPE_BLKCIPHER:
> > +             skcipher_inst = kzalloc(sizeof(*skcipher_inst) +
> > +                                     sizeof(*ictx), GFP_KERNEL);
> > +             if (!skcipher_inst)
> > +                     return -ENOMEM;
> > +             inst = skcipher_crypto_instance(skcipher_inst);
> > +             base = &skcipher_inst->alg.base;
> > +             ictx = crypto_instance_ctx(inst);
> > +
> > +             /* Block cipher, e.g. "cbc(aes)" */
> > +             crypto_set_skcipher_spawn(&ictx->u.skcipher_spawn, inst);
> > +             err = crypto_grab_skcipher(&ictx->u.skcipher_spawn,
> > +                                        inner_cipher_name, 0,
> > +                                        crypto_requires_sync(algt->type,
> > +                                                             algt->mask));
> > +             if (err)
> > +                     goto out_free_inst;
>
> This should say "Symmetric cipher", not "Block cipher".
>
> > +
> > +     if (!parse_cipher_name(essiv_cipher_name, block_base->cra_name)) {
> > +             pr_warn("Failed to parse ESSIV cipher name from skcipher cra_name\n");
> > +             goto out_drop_skcipher;
> > +     }
>
> This is missing:
>
>                 err = -EINVAL;
>
> > +     if (type == CRYPTO_ALG_TYPE_BLKCIPHER) {
> > +             skcipher_inst->alg.setkey       = essiv_skcipher_setkey;
> > +             skcipher_inst->alg.encrypt      = essiv_skcipher_encrypt;
> > +             skcipher_inst->alg.decrypt      = essiv_skcipher_decrypt;
> > +             skcipher_inst->alg.init         = essiv_skcipher_init_tfm;
> > +             skcipher_inst->alg.exit         = essiv_skcipher_exit_tfm;
> > +
> > +             skcipher_inst->alg.min_keysize  = crypto_skcipher_alg_min_keysize(skcipher_alg);
> > +             skcipher_inst->alg.max_keysize  = crypto_skcipher_alg_max_keysize(skcipher_alg);
> > +             skcipher_inst->alg.ivsize       = crypto_skcipher_alg_ivsize(skcipher_alg);
> > +             skcipher_inst->alg.chunksize    = crypto_skcipher_alg_chunksize(skcipher_alg);
> > +             skcipher_inst->alg.walksize     = crypto_skcipher_alg_walksize(skcipher_alg);
> > +
> > +             skcipher_inst->free             = essiv_skcipher_free_instance;
> > +
> > +             err = skcipher_register_instance(tmpl, skcipher_inst);
> > +     } else {
> > +             aead_inst->alg.setkey           = essiv_aead_setkey;
> > +             aead_inst->alg.setauthsize      = essiv_aead_setauthsize;
> > +             aead_inst->alg.encrypt          = essiv_aead_encrypt;
> > +             aead_inst->alg.decrypt          = essiv_aead_decrypt;
> > +             aead_inst->alg.init             = essiv_aead_init_tfm;
> > +             aead_inst->alg.exit             = essiv_aead_exit_tfm;
> > +
> > +             aead_inst->alg.ivsize           = crypto_aead_alg_ivsize(aead_alg);
> > +             aead_inst->alg.maxauthsize      = crypto_aead_alg_maxauthsize(aead_alg);
> > +             aead_inst->alg.chunksize        = crypto_aead_alg_chunksize(aead_alg);
> > +
> > +             aead_inst->free                 = essiv_aead_free_instance;
> > +
> > +             err = aead_register_instance(tmpl, aead_inst);
> > +     }
>
> 'ivsize' is already in a variable, so could use
>
>                 skcipher_inst->alg.ivsize       = ivsize;
>
>         and
>                 aead_inst->alg.ivsize           = ivsize;
>

Thanks Eric. These will all be fixed in the next respin.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
