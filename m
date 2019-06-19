Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8C74B4C5
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 11:16:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 123193082201;
	Wed, 19 Jun 2019 09:16:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C24835F7C0;
	Wed, 19 Jun 2019 09:15:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA6384EBC5;
	Wed, 19 Jun 2019 09:15:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5J9EiOb019316 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 05:14:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D5CC019C6A; Wed, 19 Jun 2019 09:14:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6AD19C5B
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 09:14:42 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD11C3092671
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 09:14:18 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j6so6866419ioa.5
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=qu2Wc9HSIWJ2oV3uEIa9Pnf61IRfW5CUxnsT2crY2Kg=;
	b=z1tFpZVK/HK0VY5eVY2WNvMLU6ctmJ2nrKm2YDzlh2fQVAcbG9Ua06wIbyg5Sra6Rz
	IIUhspyguXILIOXCfjypHWkxJWVav8CtN9xD3OAAKJ2AGIRv9Urkb7vqHBcKHKANLrsi
	REUj6s1MB+naHoxaDD4/5eeah0fLrf/nlCGCqjwry2ck6rSNfmtizUoe0yT0/C23RMuM
	Ze3XoVCzxsKpFf4xNO9eSlF4P/b4i45AjLo/eA5bERnlvt1voC0FiV3q+gxPD96ct9qk
	UEWbs2XdqT0OjJd5IY3FOS/6l69+NitTE1kyXcAu3Co5k/UgvPWEs3mp94VrESBRNwlL
	Gn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=qu2Wc9HSIWJ2oV3uEIa9Pnf61IRfW5CUxnsT2crY2Kg=;
	b=DrRAtuBXtNh2Wrj+MACJPtW4dVvl7X3oP4eMUBmxfxOKwsHppCmrdXQz/b4Crcl/lq
	EgwSgPGQoTIdAMfEKO02uoWFKDX+FCZ+UsQhErutaz7RbCpmDpoVWZ+up0+o5I5WJrqz
	f1GY4WWx7sMiGf9IPldQt7LnPti8owRtqjWuz+QajjWjhAh9PhDxuocgjUfG9RJWHziF
	Lt3a6vLe9XOiHfjkZ/mV77Yg+TxxWSWQzNCb3wtMb/tb6pXRvw01RGWoH600+atDYlfG
	ODemy6dQLy3ZKjwiTwPmUdrfrEpEZtdNQ/nkXrttYG8geFEft+zvxlB7Eeje+D6z7Bul
	DTEg==
X-Gm-Message-State: APjAAAWSGKfwrB8ZgwH9CsX6agwZyHqQmTz43KLzWJsYPAyDZTxg1bbR
	kTWzzfjoSuFbCv+PBVgTqXHsGHrwQSPG3ZNVHrAEkg==
X-Google-Smtp-Source: APXvYqxjashyDDd0tqlY6wyY6sA4zhIOYDGA7twoLsRYMoBDPncQojd0OT5uVJY8+apNN8wWb615gJIBsnmgOteEZV0=
X-Received: by 2002:a6b:7312:: with SMTP id e18mr4106503ioh.156.1560935658152; 
	Wed, 19 Jun 2019 02:14:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
In-Reply-To: <CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 11:14:07 +0200
Message-ID: <CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 19 Jun 2019 09:14:19 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Wed, 19 Jun 2019 09:14:19 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.2  (DKIM_INVALID, DKIM_SIGNED, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com
	209.85.166.68 mail-io1-f68.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v2 0/4] crypto: switch to crypto API for
	ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Wed, 19 Jun 2019 09:16:15 +0000 (UTC)

On Wed, 19 Jun 2019 at 09:11, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Wed, 19 Jun 2019 at 08:56, Milan Broz <gmazyland@gmail.com> wrote:
> >
> > On 18/06/2019 23:27, Ard Biesheuvel wrote:
> > > This series creates an ESSIV template that produces a skcipher or AEAD
> > > transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> > > (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> > > encapsulated sync or async skcipher/aead by passing through all operations,
> > > while using the cipher/shash pair to transform the input IV into an ESSIV
> > > output IV.
> > >
> > > This matches what both users of ESSIV in the kernel do, and so it is proposed
> > > as a replacement for those, in patches #2 and #4.
> > >
> > > This code has been tested using the fscrypt test suggested by Eric
> > > (generic/549), as well as the mode-test script suggested by Milan for
> > > the dm-crypt case. I also tested the aead case in a virtual machine,
> > > but it definitely needs some wider testing from the dm-crypt experts.
> >
> > Well, I just run "make check" on cyptsetup upstream (32bit VM, Linus' tree
> > with this patcheset applied), and get this on the first api test...
> >
>
> Ugh. Thanks for trying. I will have a look today.
>
>
> > Just try
> > cryptsetup open --type plain -c aes-cbc-essiv:sha256 /dev/sdd test
> >

Apologies, this was a rebase error on my part.

Could you please apply the hunk below and try again?

diff --git a/crypto/essiv.c b/crypto/essiv.c
index 029a65afb4d7..5dc2e592077e 100644
--- a/crypto/essiv.c
+++ b/crypto/essiv.c
@@ -243,6 +243,8 @@ static int essiv_aead_encrypt(struct aead_request *req)
 static int essiv_skcipher_decrypt(struct skcipher_request *req)
 {
        struct essiv_skcipher_request_ctx *rctx = skcipher_request_ctx(req);
+
+       essiv_skcipher_prepare_subreq(req);
        return crypto_skcipher_decrypt(&rctx->blockcipher_req);
 }

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
