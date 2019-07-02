Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDF65D44F
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jul 2019 18:34:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18F9AC04FFEF;
	Tue,  2 Jul 2019 16:33:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCB495C296;
	Tue,  2 Jul 2019 16:33:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 661941806B12;
	Tue,  2 Jul 2019 16:32:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x62GUx1k010608 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jul 2019 12:30:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 015714149; Tue,  2 Jul 2019 16:30:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F088960C44
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:30:56 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3347587622
	for <dm-devel@redhat.com>; Tue,  2 Jul 2019 16:30:47 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so18607286wrs.3
	for <dm-devel@redhat.com>; Tue, 02 Jul 2019 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9PsQvCCZoQ6Pr9ZY9NX1OgTQ4z7Cl/JEAfSQ/wKA4qg=;
	b=ol2y26JO3VcPZrpUUa0uP/W9Nq1zsvNy/OKaa7rB4temFaZpUB5wZToZEorWvTVgjg
	Td8pabZLF60puoXYeKnOOJHoir+mU6ikYpjNsjDB8FwoY1kLqiE1TZlEKK0gDCxLZv3Z
	WBumeokOAMug/Yj2CCf7e5z0YNPlU75LtyZR6y/Qe+hSP5WLE0+Hi5cTRDIabw9ijcfX
	IfdbxnArq98ylsHn+Xvw1e4RAaxQm/0EgHsr3GGx8pL6nYS5lO9iuPEW6BfxnrW3c2CH
	XV6LxrkwYNu2jEGaDCWJibs4ZvaXBQip3yqjlGRzV7bCD4vX8Q/TI69Xi1rD7lrBI8GA
	981g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9PsQvCCZoQ6Pr9ZY9NX1OgTQ4z7Cl/JEAfSQ/wKA4qg=;
	b=AKPIkh1L6Ot6CnVPRJbZmG7BLOkqLzPE0nycK+fJuc0Cwsj2WH8cVQ4OdWfXXfI6Jf
	VENIZV5OMZ2SwB+0l/zgGSHmmVylQnG+ntOSQGURD62pLlmRJC1GU9ls1nm1UxEuJmEt
	HqqdbEi476eUfz4d/H5rA6D1BOsoF7Kj2YFPKcy29eGK+qdqu8XmhVfVJnf2zWSVg/H+
	354PFBhZ2dA8LHvd7IRSSRvbHyve1cS39f4piwlqd+rOckM9kYn1ZC3rXV7I9g80AJkM
	uW1MNXUYVxOZe8kiKSwwvFKLklYz8Tus+d1AazC+WOpZTjNDtu90doOe+mL7WraCisFw
	hDcA==
X-Gm-Message-State: APjAAAXG8qDuJu6tZlNydDy3YUnNhfEQaaVSzCYtJ4kmdNkrm7gO3f/b
	pwBAthoS6dbn+BcT5jPRlBWlcpyXUIYt+3IlqRzWPw==
X-Google-Smtp-Source: APXvYqww7rnr2/OCeFvLIZKy6IV1f5KVjAf+1C7xAyWaibN9SGqeuSRRc5TkIlQIvUv0CkprWr3EM/GO4j5BMsePehE=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr9884997wrw.169.1562085045816; 
	Tue, 02 Jul 2019 09:30:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-5-ard.biesheuvel@linaro.org>
	<f068888f-1a13-babf-0144-07939a79d9d9@gmail.com>
In-Reply-To: <f068888f-1a13-babf-0144-07939a79d9d9@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 2 Jul 2019 18:30:30 +0200
Message-ID: <CAKv+Gu-hATMtNVUJ-WOr0yia0-X=M_ME6CutREy9q_ZyorpCzw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 02 Jul 2019 16:30:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Tue, 02 Jul 2019 16:30:47 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.109  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 02 Jul 2019 16:34:41 +0000 (UTC)

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

Actually, the bad_mem label is used 10 lines up as well.
So I'll keep this goto in the next revision.

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
