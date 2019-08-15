Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7738F28E
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 19:47:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0EBB33083363;
	Thu, 15 Aug 2019 17:47:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF8D6841E9;
	Thu, 15 Aug 2019 17:47:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9989118005A0;
	Thu, 15 Aug 2019 17:47:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7FHkc3P014996 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 13:46:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12A2543FD5; Thu, 15 Aug 2019 17:46:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D11143FD1
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 17:46:35 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0FCD11A12
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 17:46:33 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id z11so2951939wrt.4
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 10:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hYNKyNDEVZaSn3KKU5nVN59Ch0APFsTcvR6fvX99Bx4=;
	b=zSc8i1ypbaWLdawvBpPJamGyioGgXkw4qE2S4xlu//+y7XHfmkYpBAWMiqgxswdXnT
	2Kbfqp7macugCIm2p0D3m8IR1/f/Xo7txfxoxUzpPVH9s2sUfzUibBFsgUZa/cq+b++j
	IkGa7fJqNQFnokMj/UTRlUTDsC5o8OCJij7bpBFg1XajnkkC8Noym1U5oVmhRX+Fmz95
	kgYaqoi0zEc0LZFqbK6Xk8XLgBOD6IpQgBTNGllnJ1SW++MYBRikQDBjavNXifJJkFSh
	I7h/rPVxmsHPi992yiHoHK9t7r5H1urmjbDXNz1JRsxI77xKSGeO2h32kgPSvYx1XNzn
	vwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hYNKyNDEVZaSn3KKU5nVN59Ch0APFsTcvR6fvX99Bx4=;
	b=PmeIgvB/95WDrSzWNVIoiDjRnCaFj9TsYQJiCd1ZAI5NjMk+/buWrQHfUHbABboV0Y
	ZR42df2iXzT/5o8weXPX+ff+AMwbrsWml9puNM9BIBy5r1sAk5gDuKcJHqCjA1Unfe7Z
	yJYqmmbfeudy4aEcelHyykmCjQxo2478faZHfN0Fhx3TPkBT9TuQrcQlZQ41Lc/UZsJW
	GCAibQPygx6nzdDTAzK1QpIqjzshudN/AzbcSDqV0VJ5mbKJ1Y9Q9pdbpa/vevzFGokQ
	aUqZDMo8hzM77pVFfofMOdmzNOEtX6JXCZabgY8EQp6iX2DjWyrltOs97nEQKCTTzyOA
	6coQ==
X-Gm-Message-State: APjAAAV1c88MOMbXZloo8IFzrzeuX+6KXt3Mt+jP6aWU7Y2Ba7Ozp5Sq
	5Lu9eKe1IFuV0ndPWRg9PFxab+Z0KhKPOeIRMY64Ag==
X-Google-Smtp-Source: APXvYqyQgpk/VC0fEjSazze6ItoFVCjI/DkEOxBShq9LIPJT1ACJ9jFU5KOvmph9m5hLW3UbL54QtU/RwDF2CkyQcVA=
X-Received: by 2002:adf:9e09:: with SMTP id u9mr6695965wre.169.1565891192633; 
	Thu, 15 Aug 2019 10:46:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190814163746.3525-1-ard.biesheuvel@linaro.org>
	<20190814163746.3525-2-ard.biesheuvel@linaro.org>
	<20190815023734.GB23782@gondor.apana.org.au>
	<CAKv+Gu_maif=kZk-HRMx7pP=ths1vuTgcu4kFpzz0tCkO2+DFA@mail.gmail.com>
	<20190815051320.GA24982@gondor.apana.org.au>
	<CAKv+Gu_OVUfXW6t+j1RHA4_Uc43o50Sspke2KkVw9djbFDd04g@mail.gmail.com>
	<20190815113548.GA27723@gondor.apana.org.au>
In-Reply-To: <20190815113548.GA27723@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 15 Aug 2019 20:46:21 +0300
Message-ID: <CAKv+Gu9Yx3Jk_ikZC1GrR8rR1zV_5CzkXv5NntXnLYim2n+R9g@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 17:46:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 15 Aug 2019 17:46:34 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v11 1/4] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 15 Aug 2019 17:47:17 +0000 (UTC)

On Thu, 15 Aug 2019 at 14:35, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 15, 2019 at 08:15:29AM +0300, Ard Biesheuvel wrote:
> >
> > So what about checking that the cipher key size matches the shash
> > digest size, or that the cipher block size matches the skcipher IV
> > size? This all moves to the TFM init function?
>
> I don't think you need to check those things.  If the shash produces
> an incorrect key size the setkey will just fail naturally.  As to
> the block size matching the IV size, in the kernel it's not actually
> possible to get an underlying cipher with different block size
> than the cbc mode that you used to derive it.
>

dm-crypt permits any skcipher to be used with ESSIV, so the template
does not enforce CBC to be used.

> The size checks that we have in general are to stop people from
> making crazy combinations such as lrw(des3_ede), it's not there
> to test the correctness of a given implementation.  That is,
> we assume that whoever provides "aes" will give it the correct
> geometry for it.
>
> Sure we haven't made it explicit (which we should at some point)
> but as it stands, it can only occur if we have a bug or someone
> loads a malicious kernel module in which case none of this matters.
>

OK.

> > Are there any existing templates that use this approach?
>
> I'm not sure of templates doing this but this is similar to fallbacks.
> In fact we don't check any gemoetry on the fallbacks at all.
>

OK, so one other thing: how should I populate the cra_name template
field if someone instantiates essiv(cbc(aes),sha256-ce)? We won't know
until TFM init time what cra_name allocating the sha256-ce shash
actually produces, so the only way to populate those names is to use
the bare string supplied by the caller, which could be bogus.

To me, it seems like retaining the spawn for the shash is more
idiomatic, and avoids strange issues like the one above. Dropping the
spawn for the encapsulated cipher (which is tightly coupled to the
skcipher/aead being encapsulated) does seem feasible, so I'll go with
that.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
