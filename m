Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 60663484CA
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 16:01:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57D5730860B9;
	Mon, 17 Jun 2019 14:01:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2638A69182;
	Mon, 17 Jun 2019 14:01:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6D8A149E1;
	Mon, 17 Jun 2019 14:00:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HDxbv2007611 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 09:59:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F45F7E694; Mon, 17 Jun 2019 13:59:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B71D80DE4
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 13:59:33 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 365EB309B15A
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 13:59:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id s7so21270711iob.11
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 06:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ds0uKO2F2VBQKsr2RusLC1lcJKUY+GVXGb2P0niujFc=;
	b=bfmCe5ZvpsbrhWXibP60qlo99R0zU6tV2L2MvNrbM4MncYm4LfPSlrM3ayQ5VzFPEz
	lZiFIdCduTD0iR4PDFOUA6MAbuVQh3ofZ9rToV3LJvfAFGteuaOCPH6MTHR8rTkR3n23
	2IHycpR+EErC2r8W8wLritKg/M98M6GQ+9AzMxiFhLXY41cWxfzQ/X6hTCqTaPZNRcma
	sioi3EDB8jjCW7DPhXK10DUzMLKJQst2Pi8ZXq5lMrrblOUJaDS2+U7Q2zDjfLe9ABNh
	Jp0W8D98pOVi+V+5MFDFp9YP/aMw1l8+zUPy4Ay7/uBlmSrzuxcqmGbL6mg8XBlMKZAB
	rYVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ds0uKO2F2VBQKsr2RusLC1lcJKUY+GVXGb2P0niujFc=;
	b=aC2DG96aF+Z6b2jojB6Z2jWPoCFcBnhBfgCxUCK4PISH5l5Z/Qvr0spssdp8xgLNpI
	d1dbEhW4Fa6GXbVv5w5ENYzmkIfXC+4COkXQeEJqunshWS9kOr8BS/ROxNuIHsidx2gE
	lcl20QfkH2dk5wYbgXmhPIujQObKk587tCsgUuegjM+Rpda0DxPETChcDw4o0AfCulaQ
	7DvE6eca7KFz0pIkqsmqX3c3olmYm99zWyHZihLLBXR8h/Me60RJTQ9cL7OmjSoDcxV5
	r+cYrVr27/I/lUy55ngTj6MjFUON0GLMVxbFcRkeAb86XJqJ6lq+XUhZWqFQKTZimEqJ
	tNMg==
X-Gm-Message-State: APjAAAWNZq2Lh+Yql+OcE6OBG/phrMBuWcJCbmlnqIYEvVikceQgRMwz
	BEk8+8JjALep2wMo4eCv1L7B+erIOs1rgXblgrb1Aw==
X-Google-Smtp-Source: APXvYqw8Dm5Maf3dh0eDaPaNRRb4D5ZIJAbg4W7ou2HnqLUzQVCO4UcSCR6xwjeLaf2UN5zBb8rssHpaAwMF+VCUSVA=
X-Received: by 2002:a6b:7312:: with SMTP id e18mr562668ioh.156.1560779952486; 
	Mon, 17 Jun 2019 06:59:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
In-Reply-To: <CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 15:59:01 +0200
Message-ID: <CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Mon, 17 Jun 2019 13:59:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Mon, 17 Jun 2019 13:59:13 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 17 Jun 2019 14:01:43 +0000 (UTC)

On Mon, 17 Jun 2019 at 12:58, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Mon, 17 Jun 2019 at 12:39, Milan Broz <gmazyland@gmail.com> wrote:
> >
> > On 17/06/2019 11:15, Ard Biesheuvel wrote:
> > >> I will also add that going the skcipher route rather than shash will
> > >> allow hardware tfm providers like CryptoCell that can do the ESSIV
> > >> part in hardware implement that as a single API call and/or hardware
> > >> invocation flow.
> > >> For those system that benefit from hardware providers this can be beneficial.
> > >>
> > >
> > > Ah yes, thanks for reminding me. There was some debate in the past
> > > about this, but I don't remember the details.
> > >
> > > I think implementing essiv() as a skcipher template is indeed going to
> > > be the best approach, I will look into that.
> >
> > For ESSIV (that is de-facto standard now), I think there is no problem
> > to move it to crypto API.
> >
> > The problem is with some other IV generators in dm-crypt.
> >
> > Some do a lot of more work than just IV (it is hackish, it can modify data, this applies
> > for loop AES "lmk" and compatible TrueCrypt "tcw" IV implementations).
> >
> > For these I would strongly say it should remain "hacked" inside dm-crypt only
> > (it is unusable for anything else than disk encryption and should not be visible outside).
> >
> > Moreover, it is purely legacy code - we provide it for users can access old systems only.
> >
> > If you end with rewriting all IVs as templates, I think it is not a good idea.
> >
> > If it is only about ESSIV, and patch for dm-crypt is simple, it is a reasonable approach.
> >
> > (The same applies for simple dmcryp IVs like "plain" "plain64", "plain64be and "benbi" that
> > are just linear IVs in various encoded variants.)
> >
>
> Agreed.
>
> I am mostly only interested in ensuring that the bare 'cipher'
> interface is no longer used outside of the crypto subsystem itself.
> Since ESSIV is the only one using that, ESSIV is the only one I intend
> to change.

OK, so inferring the block cipher name from the skcipher algo name is
a bit finicky, since the dm-crypt code does that *after* allocating
the TFMs, and allocating the essiv skcipher happens before.
But more importantly, it appears to be allowed currently to use ESSIV
with authenticated modes, which means we'd need both a skcipher and a
aead essiv template, or do some non-trivial hacking to insert the
essiv template in the right place (which I'm not sure is even
possible)

So my main question/showstopper at the moment is: which modes do we
need to support for ESSIV? Only CBC? Any skcipher? Or both skciphers
and AEADs?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
