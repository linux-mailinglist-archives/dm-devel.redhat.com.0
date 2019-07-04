Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 796B55FA25
	for <lists+dm-devel@lfdr.de>; Thu,  4 Jul 2019 16:32:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AB94A30917AA;
	Thu,  4 Jul 2019 14:32:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B9F05B801;
	Thu,  4 Jul 2019 14:32:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A2921833001;
	Thu,  4 Jul 2019 14:31:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x64EV7Na004171 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jul 2019 10:31:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7B3905B7FD; Thu,  4 Jul 2019 14:31:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 761475B805
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 14:31:05 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4C05A3086272
	for <dm-devel@redhat.com>; Thu,  4 Jul 2019 14:30:54 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 207so5971138wma.1
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=a4qoGy3FmEuaU+szIDUaYI/OOKcXAo5Hn7uEb70lPxs=;
	b=e3o51p2RUzWm2b56QjEHq5S19z2oa3reXZTN/ljTxsiQ9xtiGkD/TdgyuC/UO3i1uc
	hLBSAFCTdgV7t6GcNFaW2OTIYCXjbEZpa7VAsItwuW/KfehMu3zzvN8o+47WPXHoyhgB
	10S/gsRiCSERvimihCRhMRooptK3S18rS1tuFO+yi6fP6IB2wddhk6sPlCtx3qpEQVxj
	X/GDWX6l3unYMQxktdnvgv4sX6gYs8u9OOaVrnFRFxqs3nbFbR2EX7Lhg0ibX5qQK22s
	jxjfI3Zlptmwdgxmo/GEmZdfLUPYeQZeeWgsGXIwROk6BDMNRvJxukRbm8m+HPrIwa4m
	WxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=a4qoGy3FmEuaU+szIDUaYI/OOKcXAo5Hn7uEb70lPxs=;
	b=EqQAaBACUnEqQ5W5E2O78n06HFRci6Q/p8FY3v5MgYKMQZ4XrZH43ygbk/jzgzfpPg
	yar2fS9YPexW7b0s4Uc3r2XW4kfGdLY49weZpL/iRjwlZjGNndLF8nnrNK+cEQTcp7U3
	BxeJ4iA5NIl/O4DVtbvBHbBgF34oaFlsciycFcgHoWmbAQC/j359YrdBDGVJ1Jka/2be
	73odNtn0cRsRcBjTQVvJB+wrz/DQHqPCsyegGR6wLap+KI7T7/ix2Qu60B+b47C5bggw
	0LRTkPpfqYoPKnSNoDYnVFuFFCLlfWKPV3DbHmsRKa8clXtT7pLzhOpCf8D+9Klzpgit
	1BLQ==
X-Gm-Message-State: APjAAAWMlXIEjvy61l8QkxpmemhtAhXnlId+IT5ge77W6WFYQ1qJBNvV
	4FMm7VrKzKqrAhaF93QcUj9GYuoXT3jfZw1YE7NwNg==
X-Google-Smtp-Source: APXvYqycLAqfm1yoq022EjiCx6xMVRZUbK7OOWj9Cuj0VVOk6HNQVWldl3vHTYjgPEgImJWxOA9qaEMbFY8jXTLS3Tw=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr3119729wmm.10.1562250652885; 
	Thu, 04 Jul 2019 07:30:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190704131033.9919-1-gmazyland@gmail.com>
	<20190704131033.9919-3-gmazyland@gmail.com>
	<7a8d13ee-2d3f-5357-48c6-37f56d7eff07@gmail.com>
	<CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
In-Reply-To: <CAKv+Gu_c+OpOwrr0dSM=j=HiDpfM4sarq6u=6AXrU8jwLaEr-w@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 4 Jul 2019 16:30:36 +0200
Message-ID: <CAKv+Gu8a6cBQYsbYs8CDyGbhHx0E=+1SU7afqoy9Cs+K8PMfqA@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>, Eric Biggers <ebiggers@google.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Thu, 04 Jul 2019 14:30:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Thu, 04 Jul 2019 14:30:54 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.09  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH 3/3] dm-crypt: Implement eboiv - encrypted
 byte-offset initialization vector.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Thu, 04 Jul 2019 14:32:49 +0000 (UTC)

On Thu, 4 Jul 2019 at 16:28, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> (+ Eric)
>
> On Thu, 4 Jul 2019 at 15:29, Milan Broz <gmazyland@gmail.com> wrote:
> >
> > Hi Herbert,
> >
> > I have a question about the crypto_cipher API in dm-crypt:
> >
> > We are apparently trying to deprecate cryto_cipher API (see the ESSIV patchset),
> > but I am not sure what API now should be used instead.
> >
>
> Not precisely - what I would like to do is to make the cipher part of
> the internal crypto API. The reason is that there are too many
> occurrences where non-trivial chaining modes have been cobbled
> together from the cipher API.
>
> > See the patch below - all we need is to one block encryption for IV.
> >
> > This algorithm makes sense only for FDE (old compatible Bitlocker devices),
> > I really do not want this to be shared in some crypto module...
> >
> > What API should I use here? Sync skcipher? Is the crypto_cipher API
> > really a problem in this case?
> >
>
> Are arbitrary ciphers supported? Or are you only interested in AES? In
> the former case, I'd suggest the sync skcipher API to instantiate
> "ecb(%s)", otherwise, use the upcoming AES library interface.
>

Actually, if CBC is the only supported mode, you could also use the
skcipher itself to encrypt a single block of input (just encrypt the
IV using CBC but with an IV of all zeroes)


> > On 04/07/2019 15:10, Milan Broz wrote:
> > > This IV is used in some BitLocker devices with CBC encryption mode.
> > >
> > > NOTE: maybe we need to use another crypto API if the bare cipher
> > >       API is going to be deprecated.
> > >
> > > Signed-off-by: Milan Broz <gmazyland@gmail.com>
> > > ---
> > >  drivers/md/dm-crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++++-
> > >  1 file changed, 81 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> > > index 96ead4492787..a5ffa1ac6a28 100644
> > > --- a/drivers/md/dm-crypt.c
> > > +++ b/drivers/md/dm-crypt.c
> > > @@ -120,6 +120,10 @@ struct iv_tcw_private {
> > >       u8 *whitening;
> > >  };
> > >
> > > +struct iv_eboiv_private {
> > > +     struct crypto_cipher *tfm;
> > > +};
> > > +
> > >  /*
> > >   * Crypt: maps a linear range of a block device
> > >   * and encrypts / decrypts at the same time.
> > > @@ -159,6 +163,7 @@ struct crypt_config {
> > >               struct iv_benbi_private benbi;
> > >               struct iv_lmk_private lmk;
> > >               struct iv_tcw_private tcw;
> > > +             struct iv_eboiv_private eboiv;
> > >       } iv_gen_private;
> > >       u64 iv_offset;
> > >       unsigned int iv_size;
> > > @@ -290,6 +295,10 @@ static struct crypto_aead *any_tfm_aead(struct crypt_config *cc)
> > >   *       is calculated from initial key, sector number and mixed using CRC32.
> > >   *       Note that this encryption scheme is vulnerable to watermarking attacks
> > >   *       and should be used for old compatible containers access only.
> > > + *
> > > + * eboiv: Encrypted byte-offset IV (used in Bitlocker in CBC mode)
> > > + *        The IV is encrypted little-endian byte-offset (with the same key
> > > + *        and cipher as the volume).
> > >   */
> > >
> > >  static int crypt_iv_plain_gen(struct crypt_config *cc, u8 *iv,
> > > @@ -838,6 +847,67 @@ static int crypt_iv_random_gen(struct crypt_config *cc, u8 *iv,
> > >       return 0;
> > >  }
> > >
> > > +static void crypt_iv_eboiv_dtr(struct crypt_config *cc)
> > > +{
> > > +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > > +
> > > +     crypto_free_cipher(eboiv->tfm);
> > > +     eboiv->tfm = NULL;
> > > +}
> > > +
> > > +static int crypt_iv_eboiv_ctr(struct crypt_config *cc, struct dm_target *ti,
> > > +                         const char *opts)
> > > +{
> > > +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > > +     struct crypto_cipher *tfm;
> > > +
> > > +     tfm = crypto_alloc_cipher(cc->cipher, 0, 0);
> > > +     if (IS_ERR(tfm)) {
> > > +             ti->error = "Error allocating crypto tfm for EBOIV";
> > > +             return PTR_ERR(tfm);
> > > +     }
> > > +
> > > +     if (crypto_cipher_blocksize(tfm) != cc->iv_size) {
> > > +             ti->error = "Block size of EBOIV cipher does "
> > > +                         "not match IV size of block cipher";
> > > +             crypto_free_cipher(tfm);
> > > +             return -EINVAL;
> > > +     }
> > > +
> > > +     eboiv->tfm = tfm;
> > > +     return 0;
> > > +}
> > > +
> > > +static int crypt_iv_eboiv_init(struct crypt_config *cc)
> > > +{
> > > +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > > +     int err;
> > > +
> > > +     err = crypto_cipher_setkey(eboiv->tfm, cc->key, cc->key_size);
> > > +     if (err)
> > > +             return err;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int crypt_iv_eboiv_wipe(struct crypt_config *cc)
> > > +{
> > > +     /* Called after cc->key is set to random key in crypt_wipe() */
> > > +     return crypt_iv_eboiv_init(cc);
> > > +}
> > > +
> > > +static int crypt_iv_eboiv_gen(struct crypt_config *cc, u8 *iv,
> > > +                         struct dm_crypt_request *dmreq)
> > > +{
> > > +     struct iv_eboiv_private *eboiv = &cc->iv_gen_private.eboiv;
> > > +
> > > +     memset(iv, 0, cc->iv_size);
> > > +     *(__le64 *)iv = cpu_to_le64(dmreq->iv_sector * cc->sector_size);
> > > +     crypto_cipher_encrypt_one(eboiv->tfm, iv, iv);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > >  static const struct crypt_iv_operations crypt_iv_plain_ops = {
> > >       .generator = crypt_iv_plain_gen
> > >  };
> > > @@ -890,6 +960,14 @@ static struct crypt_iv_operations crypt_iv_random_ops = {
> > >       .generator = crypt_iv_random_gen
> > >  };
> > >
> > > +static struct crypt_iv_operations crypt_iv_eboiv_ops = {
> > > +     .ctr       = crypt_iv_eboiv_ctr,
> > > +     .dtr       = crypt_iv_eboiv_dtr,
> > > +     .init      = crypt_iv_eboiv_init,
> > > +     .wipe      = crypt_iv_eboiv_wipe,
> > > +     .generator = crypt_iv_eboiv_gen
> > > +};
> > > +
> > >  /*
> > >   * Integrity extensions
> > >   */
> > > @@ -2293,6 +2371,8 @@ static int crypt_ctr_ivmode(struct dm_target *ti, const char *ivmode)
> > >               cc->iv_gen_ops = &crypt_iv_benbi_ops;
> > >       else if (strcmp(ivmode, "null") == 0)
> > >               cc->iv_gen_ops = &crypt_iv_null_ops;
> > > +     else if (strcmp(ivmode, "eboiv") == 0)
> > > +             cc->iv_gen_ops = &crypt_iv_eboiv_ops;
> > >       else if (strcmp(ivmode, "lmk") == 0) {
> > >               cc->iv_gen_ops = &crypt_iv_lmk_ops;
> > >               /*
> > > @@ -3093,7 +3173,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
> > >
> > >  static struct target_type crypt_target = {
> > >       .name   = "crypt",
> > > -     .version = {1, 18, 1},
> > > +     .version = {1, 19, 0},
> > >       .module = THIS_MODULE,
> > >       .ctr    = crypt_ctr,
> > >       .dtr    = crypt_dtr,
> > >

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
