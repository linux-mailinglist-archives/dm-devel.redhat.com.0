Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F268AE9B
	for <lists+dm-devel@lfdr.de>; Tue, 13 Aug 2019 07:10:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5478BC04959E;
	Tue, 13 Aug 2019 05:10:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76A146E09E;
	Tue, 13 Aug 2019 05:10:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5BB3B18005B9;
	Tue, 13 Aug 2019 05:10:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7D59urr019503 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 13 Aug 2019 01:09:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7732C71D5F; Tue, 13 Aug 2019 05:09:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 72E2D1C7
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 05:09:54 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1360F3DE31
	for <dm-devel@redhat.com>; Tue, 13 Aug 2019 05:09:53 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so252011wmj.5
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 22:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ZnFsdjJmeL4sHyht3BAAxUOXidvsHhILUUcniVeWojA=;
	b=uHejEa96zT80k3ajRLhA4BU+iT0qQ8fUJh8p50Rq4bAy8PIv1sU801kZmyDKqIDfFC
	+ov5ks5m/Js+C+og7ZP33zk9wv3lHMtjTc23VbhD/jEweDKfiEXbIiHHyiTsCUdgxW/6
	qJPaNwbdxIZkfeASrPxFLhm6Zrppy2WLaNoebYrHgoKmT8gMfTo2t9g3uokkg6LGSmR9
	xeNuGcnsgHOKSkFQOT51KBctHIh0szAY8NEKyiGtzFdSdfxMgnETf0MhoTzcYXeIgGBz
	VHWh3fKhqVM50xqbr2JpkRw9yceaamAeuVbr2qsVrM+i6aaal3CoOCgqSX3nbrk3s8t9
	/HSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ZnFsdjJmeL4sHyht3BAAxUOXidvsHhILUUcniVeWojA=;
	b=WtF29Tlv3AVV+Sv46xGEKykvdIPECx0PsVijzV80ea+t4umniW1J8oqtCXDG88CulK
	aFYJ8lixmJ424FEQxYxuZziYh292zvvXxXz4pRSi0hmk0Raj9jB8dFeKV5oYIhLvB8mE
	YNQAXhZtTy7p0LkAJkx/92q2D2s+aEypfCseX1BvAV2JIz3C0i2bVD4c0faY7FSLn3Wb
	SdeJ01O/XpUj52iOcjufCngOGTbl7iKOdjnogsk2F45zIzRGRKD8rqa4xWZUq2fd2qBc
	UPZHQPMT8XbQSZvaNF4gW/L4ow9Y24f1BekQu03iGOuahAo4nOi9ry0jJo3bUUpqIRe2
	UqEw==
X-Gm-Message-State: APjAAAUVDwKSZxEVDsjwBJ09r7tAb3qtdlzVCq8iTl7eINpdqWYy2j42
	JWa6FZqXKC90FJ5gp13+EYc5Yz4KDwojVr3l6Rm+Nw==
X-Google-Smtp-Source: APXvYqwf7IjfSieinPs7ESCgDSduH5DW1k3a5XCnPYLPKw+bqOUKAY8U4nqBAvyr2mcYG875gSTrVGL3J/7ddOJRc/A=
X-Received: by 2002:a1c:f511:: with SMTP id t17mr744937wmh.53.1565672991566;
	Mon, 12 Aug 2019 22:09:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
	<20190812145324.27090-3-ard.biesheuvel@linaro.org>
	<20190812194747.GB131059@gmail.com>
In-Reply-To: <20190812194747.GB131059@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 13 Aug 2019 08:09:41 +0300
Message-ID: <CAKv+Gu-9aHY0op6MEmN8PfQhNa0kv=xNYB6rqtaCoiUdH4OASA@mail.gmail.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org, Gilad Ben-Yossef <gilad@benyossef.com>, 
	Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 13 Aug 2019 05:09:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Tue, 13 Aug 2019 05:09:53 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v10 2/7] fs: crypto: invoke crypto API for
	ESSIV handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 13 Aug 2019 05:10:33 +0000 (UTC)

On Mon, 12 Aug 2019 at 22:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Mon, Aug 12, 2019 at 05:53:19PM +0300, Ard Biesheuvel wrote:
> > Instead of open coding the calculations for ESSIV handling, use a
> > ESSIV skcipher which does all of this under the hood.
> >
> > Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>
> This looks fine (except for one comment below), but this heavily conflicts with
> the fscrypt patches planned for v5.4.  So I suggest moving this to the end of
> the series and having Herbert take only 1-6, and I'll apply this one to the
> fscrypt tree later.
>

I think the same applies to dm-crypt: at least patch #7 cannot be
applied until my eboiv patch is applied there as well, but [Milan
should confirm] I'd expect them to prefer taking those patches via the
dm tree anyway.

Herbert, what would you prefer:
- taking a pull request from a [signed] tag based on v4.3-rc1 that
contains patches #1, #4, #5 and #6, allowing Eric and Milan/Mike to
merge it as well, and apply the respective fscrypt and dm-crypt
changes on top
- just take patches #1, #4, #5 and #6 as usual, and let the fscrypt
and dm-crypt changes be reposted to the respective lists during the
next cycle


>
> > ---
> >  fs/crypto/Kconfig           |  1 +
> >  fs/crypto/crypto.c          |  5 --
> >  fs/crypto/fscrypt_private.h |  9 --
> >  fs/crypto/keyinfo.c         | 92 +-------------------
> >  4 files changed, 4 insertions(+), 103 deletions(-)
> >
> > diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> > index 5fdf24877c17..6f3d59b880b7 100644
> > --- a/fs/crypto/Kconfig
> > +++ b/fs/crypto/Kconfig
> > @@ -5,6 +5,7 @@ config FS_ENCRYPTION
> >       select CRYPTO_AES
> >       select CRYPTO_CBC
> >       select CRYPTO_ECB
> > +     select CRYPTO_ESSIV
> >       select CRYPTO_XTS
> >       select CRYPTO_CTS
> >       select KEYS
>
> In v5.3 I removed the 'select CRYPTO_SHA256', so now ESSIV shouldn't be selected
> here either.  Instead we should just update the documentation:
>
> diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
> index 82efa41b0e6c02..a1e2ab12a99943 100644
> --- a/Documentation/filesystems/fscrypt.rst
> +++ b/Documentation/filesystems/fscrypt.rst
> @@ -193,7 +193,8 @@ If unsure, you should use the (AES-256-XTS, AES-256-CTS-CBC) pair.
>  AES-128-CBC was added only for low-powered embedded devices with
>  crypto accelerators such as CAAM or CESA that do not support XTS.  To
>  use AES-128-CBC, CONFIG_CRYPTO_SHA256 (or another SHA-256
> -implementation) must be enabled so that ESSIV can be used.
> +implementation) and CONFIG_CRYPTO_ESSIV must be enabled so that ESSIV
> +can be used.
>
>  Adiantum is a (primarily) stream cipher-based mode that is fast even
>  on CPUs without dedicated crypto instructions.  It's also a true

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
