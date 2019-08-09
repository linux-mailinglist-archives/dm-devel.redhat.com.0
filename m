Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9CD88300
	for <lists+dm-devel@lfdr.de>; Fri,  9 Aug 2019 20:53:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56602316E536;
	Fri,  9 Aug 2019 18:53:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 598FF60BF3;
	Fri,  9 Aug 2019 18:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2051418005B9;
	Fri,  9 Aug 2019 18:53:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x79IqqoD021142 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 9 Aug 2019 14:52:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA66E5D6A9; Fri,  9 Aug 2019 18:52:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A52FC5D6A0
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 18:52:50 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1BDED30C2425
	for <dm-devel@redhat.com>; Fri,  9 Aug 2019 18:52:47 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id v15so6659537wml.0
	for <dm-devel@redhat.com>; Fri, 09 Aug 2019 11:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jva4IllYopbsrm/y3/X7WqbwqZFCf5iLfNxoz0XqtZI=;
	b=VOI5nGc2ZQmXD7kwFPQoSYXcu1xM/xQmi6PwhYUnPckejvpuM6qyjzJooEmosNiNO+
	WNm2dv8MKdEtUhdnbiKOrCG1S7kCfwX89cBY8FVD3JQJcFIoqv8CKXKlrbsytbTI2vXO
	Z98S2AuxtNpnfqJoE+1URjhdayr/fhRLdy6jfGf0nYOATPEI9h00ezqWZTFOL3d6pIjb
	Ejr15f+uxwD/XVvyZowTXzQ6mfql02AFaT++SLjbQk4rldN2+roclIkriN5Os14pR2tL
	4w3AjRuQR/OS27UrKJczIYQ7Bn8N6OfGbtyQ2wxz9ivmi7xX8qArpTmLzfAPJxWsKEK9
	Ytyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jva4IllYopbsrm/y3/X7WqbwqZFCf5iLfNxoz0XqtZI=;
	b=aJVIVm37uSdr8k9J+l5CtcY7Hi3R6nBiXo9RPGUBd9aasgg5+nln10/BSSAvmtCGbj
	6zpXvl1rr67RpKZ8NOtdQPHZuNfAI16JQbMv8/tMiGQBvnirVTu7ACTEZTxqcvIQVdf5
	LB3/Ro7Vv6tefjpPh0e55MdFAOxVCq3c0T/GdQaykAIyY7WSYWxTbVIMDtgmXpRU0YEX
	E/3j8iDrbwu49I9SN0+kUrOPic7S92fRKKpOE/OrL+pocd1ISaJUMJbcEh3W7S0X4M1O
	RFPT8l0YepuBShvw6n1XAlH76hfx9ElTJ/B29dxuXNz/zs6YZTe3fU4TWY3DI2YmxRZ8
	jNqw==
X-Gm-Message-State: APjAAAXLx4/ff51UfYNtdNuWRTULyT4n0wz8/UiZj9oEQt8Yfq7ZH8za
	pdJ9tdrJLH1DkpR/6S+POwYtJvxcAoxbEzMNYloB7A==
X-Google-Smtp-Source: APXvYqw4Ilzxya6hIiDOjE3ote/Aq97/U2eUbYXu5BS0rpMErX03XS26xpvIctl8LCuLv7fb5eKXBQulHLXp8GOn7Cg=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr12784864wmm.10.1565376765631; 
	Fri, 09 Aug 2019 11:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190807055022.15551-1-ard.biesheuvel@linaro.org>
	<e13525a4-4885-e0f3-6711-efd83dd4a9fb@gmail.com>
In-Reply-To: <e13525a4-4885-e0f3-6711-efd83dd4a9fb@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 9 Aug 2019 21:52:07 +0300
Message-ID: <CAKv+Gu-X5D8U-getjTmpn1x50E41GvSRTPPvOL=NbB9Q33=PFQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Fri, 09 Aug 2019 18:52:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Fri, 09 Aug 2019 18:52:47 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, "Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH v2] md/dm-crypt - reuse eboiv skcipher
	for IV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 09 Aug 2019 18:53:18 +0000 (UTC)

On Thu, 8 Aug 2019 at 14:53, Milan Broz <gmazyland@gmail.com> wrote:
>
> Hi,
>
> On 07/08/2019 07:50, Ard Biesheuvel wrote:
> > Instead of instantiating a separate cipher to perform the encryption
> > needed to produce the IV, reuse the skcipher used for the block data
> > and invoke it one additional time for each block to encrypt a zero
> > vector and use the output as the IV.
> >
> > For CBC mode, this is equivalent to using the bare block cipher, but
> > without the risk of ending up with a non-time invariant implementation
> > of AES when the skcipher itself is time variant (e.g., arm64 without
> > Crypto Extensions has a NEON based time invariant implementation of
> > cbc(aes) but no time invariant implementation of the core cipher other
> > than aes-ti, which is not enabled by default)
> >
> > This approach is a compromise between dm-crypt API flexibility and
> > reducing dependence on parts of the crypto API that should not usually
> > be exposed to other subsystems, such as the bare cipher API.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> For now I have just pair of images here to test, but seems checksums are ok.
>
> Tested-by: Milan Broz <gmazyland@gmail.com>
>
> I talked with Mike already, so it should go through DM tree now.
>

Thanks!


>
> > ---
> >  drivers/md/dm-crypt.c | 70 ++++++++++++++-----------------------------
> >  1 file changed, 22 insertions(+), 48 deletions(-)
> >
> > diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> > index d5216bcc4649..48cd76c88d77 100644
> > --- a/drivers/md/dm-crypt.c
> > +++ b/drivers/md/dm-crypt.c
> > @@ -120,10 +120,6 @@ struct iv_tcw_private {
> >       u8 *whitening;
> >  };
> >
> > -struct iv_eboiv_private {
> > -     struct crypto_cipher *tfm;
> > -};
> > -
> >  /*
> >   * Crypt: maps a linear range of a block device
> >   * and encrypts / decrypts at the same time.
> > @@ -163,7 +159,6 @@ struct crypt_config {
> >               struct iv_benbi_private benbi;
> >               struct iv_lmk_private lmk;
> >               struct iv_tcw_private tcw;
> > -             struct iv_eboiv_private eboiv;
> >       } iv_gen_private;
> >       u64 iv_offset;
> >       unsigned int iv_size;
> > @@ -847,65 +842,47 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
> >       return 0;
> >  }
> >
> > -static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
> > -{
> > -     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > -
> > -     crypto_free_cipher(eboiv->tfm);
> > -     eboiv->tfm = NULL;
> > -}
> > -
> >  static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
> >                           const char *opts)
> >  {
> > -     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > -     struct crypto_cipher *tfm;
> > -
> > -     tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
> > -     if (IS_ERR(tfm)) {
> > -             ti->error = "Error allocating crypto tfm for EBOIV";
> > -             return PTR_ERR(tfm);
> > +     if (test_bit(CRYPT_MODE_INTEGRITY_AEAD, &cc->cipher_flags)) {
> > +             ti->error = "AEAD transforms not supported for EBOIV";
> > +             return -EINVAL;
> >       }
> >
> > -     if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
> > +     if (crypto_skcipher_blocksize(any_tfm(cc)) != cc->iv_size) {
> >               ti->error = "Block size of EBOIV cipher does "
> >                           "not match IV size of block cipher";
> > -             crypto_free_cipher(tfm);
> >               return -EINVAL;
> >       }
> >
> > -     eboiv->tfm = tfm;
> >       return 0;
> >  }
> >
> > -static int crypt_iv_eboiv_init(struct crypt_config *cc)
> > +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> > +                         struct dm_crypt_request *dmreq)
> >  {
> > -     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > +     u8 buf[MAX_CIPHER_BLOCKSIZE] __aligned(__alignof__(__le64));
> > +     struct skcipher_request *req;
> > +     struct scatterlist src, dst;
> > +     struct crypto_wait wait;
> >       int err;
> >
> > -     err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
> > -     if (err)
> > -             return err;
> > -
> > -     return 0;
> > -}
> > -
> > -static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
> > -{
> > -     /* Called after cc->key is set to random key in crypt_wipe() */
> > -     return crypt_iv_eboiv_init(cc);
> > -}
> > +     req = skcipher_request_alloc(any_tfm(cc), GFP_KERNEL | GFP_NOFS);
> > +     if (!req)
> > +             return -ENOMEM;
> >
> > -static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> > -                         struct dm_crypt_request *dmreq)
> > -{
> > -     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > +     memset(buf, 0, cc->iv_size);
> > +     *(__le64 *)buf = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> >
> > -     memset(iv, 0, cc->iv_size);
> > -     *(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> > -     crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
> > +     sg_init_one(&src, page_address(ZERO_PAGE(0)), cc->iv_size);
> > +     sg_init_one(&dst, iv, cc->iv_size);
> > +     skcipher_request_set_crypt(req, &src, &dst, cc->iv_size, buf);
> > +     skcipher_request_set_callback(req, 0, crypto_req_done, &wait);
> > +     err = crypto_wait_req(crypto_skcipher_encrypt(req), &wait);
> > +     skcipher_request_free(req);
> >
> > -     return 0;
> > +     return err;
> >  }
> >
> >  static const struct crypt_iv_operations crypt_iv_plain_ops = {
> > @@ -962,9 +939,6 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
> >
> >  static struct crypt_iv_operations crypt_iv_eboiv_ops = {
> >       .ctr       = crypt_iv_eboiv_ctr,
> > -     .dtr       = crypt_iv_eboiv_dtr,
> > -     .init      = crypt_iv_eboiv_init,
> > -     .wipe      = crypt_iv_eboiv_wipe,
> >       .generator = crypt_iv_eboiv_gen
> >  };
> >
> >

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
