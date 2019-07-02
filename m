Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7F45CAE0
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 10:09:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFB6C30C31A5;
	Tue,  2 Jul 2019 08:08:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52B901001B10;
	Tue,  2 Jul 2019 08:08:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BD313F6E4;
	Tue,  2 Jul 2019 08:08:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6287uKZ003373 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 04:07:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E2401001B19; Tue,  2 Jul 2019 08:07:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7911B1001B10
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 08:07:54 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C14342F8BDA
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 08:07:44 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so5429373wro.5
	for <dm-devel@redhat.com>; Tue, 02 Jul 2019 01:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fVYsMgjvlhzbh/TqKhi7d4SFK7B/Ukhib20YGwD2OlM=;
	b=q9ZilC05a2m+mrPUNO5+3iadDkIlMvNCFVYKl5FwLDPma2TRWE2R0chNTM9iMMEJrH
	ln26Gtv3kLxEQ7ulT1DkTflxRzOwddrLnWXMwiWJwKlsKAnIi7J33WBU5V1Quqvbc72s
	dd52JvuRxilYVEeEFwthTvCbMFJTWKlEdApwk2O4qdpjwKuR8kZiIU2pFTfsAa23aVMb
	8FwY1p93XrB1ewOEpLAGY23N5AibhbXyLd4QbBrI/O8VD+2yiqIzRtZrmonKEEpGn9wS
	WRwgd95Nut+jEnE6ytQXprbCcr0g9xR14lMdywhfUMDKpnS6rB3KHbxwPdR0YL1tJpfH
	RWlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fVYsMgjvlhzbh/TqKhi7d4SFK7B/Ukhib20YGwD2OlM=;
	b=Ipnje7cSkTSyLNB70dBcs7QwsRAbm67OUH4vMkwlst6nYuZYeiR17S88YJMfmNrpQ8
	vBvyHKwRFq3i3TP4Y6RsluVE6eQIdSoXW1hYoHzHp5XSos82lYtklEa+f5RgaRD0F7Z6
	D62vGtS14n9ENX+rjzSZ9jCGDLvjKAc2bFs4tCqm1DOoBHwdR+bVtP6lPXSPgkmGNi6+
	Ym2U+MRhJHA5X+GGj2iVX+DXyz/TwxnfyTRvz0nyh8MQQgCz0pgueupo3w26mt/fVWfP
	/C1lvsVVplZQ8U+vO50XTlspipbkKSKFhwjdwpQ5dnxq7aNIK/omielm3PVad/44v1vX
	wxmQ==
X-Gm-Message-State: APjAAAV5fWK1MYvNyuIEjMoHtfNX6x+mx4X0mT7qXpejNgHWUxmKRz8e
	q1+Ie/9LLmz2SDG2h8e+XGbtQ+igAYKJfMvdman9MCcS9h01Dg==
X-Google-Smtp-Source: APXvYqxFTr09aEUjlKJBTyUb2A6Ysfnih9bFlGYN09LsP6ZlqtItJRPDuv1wBv6XO4bEEeoL2GdtXHtohvv80mpjsQ8=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr7958887wrw.169.1562054863371; 
	Tue, 02 Jul 2019 01:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-5-ard.biesheuvel@linaro.org>
	<f068888f-1a13-babf-0144-07939a79d9d9@gmail.com>
In-Reply-To: <f068888f-1a13-babf-0144-07939a79d9d9@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 2 Jul 2019 10:07:32 +0200
Message-ID: <CAKv+Gu-gnKk2EQ4Asq2evghhyTFYVq9SRQ8tu_p4VCA1dSJfHQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Tue, 02 Jul 2019 08:07:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Tue, 02 Jul 2019 08:07:45 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v6 4/7] md: dm-crypt: switch to ESSIV crypto
	API template
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 02 Jul 2019 08:09:15 +0000 (UTC)

On Mon, 1 Jul 2019 at 10:59, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 28/06/2019 17:21, Ard Biesheuvel wrote:
> > Replace the explicit ESSIV handling in the dm-crypt driver with calls
> > into the crypto API, which now possesses the capability to perform
> > this processing within the crypto subsystem.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> >  drivers/md/dm-crypt.c | 200 ++++----------------
>
> ...
>
> > -/* Wipe salt and reset key derived from volume key */
> > -static int crypt_iv_essiv_wipe(struct crypt_config *cc)
>
> Do I understand it correctly, that this is now called inside the whole cipher
> set key in wipe command (in crypt_wipe_key())?
>
> (Wipe message is meant to suspend the device and wipe all key material
> from memory without actually destroying the device.)
>

Yes, setting the random key in wipe() triggers the SHA256 operation as
normal, which is slightly wasteful but not a big deal imo.

> > -{
> > -     struct iv_essiv_private *essiv = &cc->iv_gen_private.essiv;
> > -     unsigned salt_size = crypto_shash_digestsize(essiv->hash_tfm);
> > -     struct crypto_cipher *essiv_tfm;
> > -     int r, err = 0;
> > -
> > -     memset(essiv->salt, 0, salt_size);
> > -
> > -     essiv_tfm = cc->iv_private;
> > -     r = crypto_cipher_setkey(essiv_tfm, essiv->salt, salt_size);
> > -     if (r)
> > -             err = r;
> > -
> > -     return err;
> > -}
>
> ...
>
> > @@ -2435,9 +2281,19 @@ static int crypt_ctr_cipher_new(struct dm_target *ti, char *cipher_in, char *key
> >       }
> >
> >       ret = crypt_ctr_blkdev_cipher(cc, cipher_api);
> > -     if (ret < 0) {
> > -             ti->error = "Cannot allocate cipher string";
> > -             return -ENOMEM;
> > +     if (ret < 0)
> > +             goto bad_mem;
> > +
> > +     if (*ivmode && !strcmp(*ivmode, "essiv")) {
> > +             if (!*ivopts) {
> > +                     ti->error = "Digest algorithm missing for ESSIV mode";
> > +                     return -EINVAL;
> > +             }
> > +             ret = snprintf(buf, CRYPTO_MAX_ALG_NAME, "essiv(%s,%s,%s)",
> > +                            cipher_api, cc->cipher, *ivopts);
> > +             if (ret < 0 || ret >= CRYPTO_MAX_ALG_NAME)
> > +                     goto bad_mem;
>
> Hm, nitpicking, but goto from only one place while we have another -ENOMEM above...
>
> Just place this here without goto?
>

OK

> > +     ti->error = "Cannot allocate cipher string";
> > +     return -ENOMEM;
>
> Otherwise
>
> Reviewed-by: Milan Broz <gmazyland@gmail.com>
>
> Thanks,
> Milan

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
