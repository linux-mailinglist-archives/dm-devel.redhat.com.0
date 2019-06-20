Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F5D4CFA5
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 15:54:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 430438CB51;
	Thu, 20 Jun 2019 13:54:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C66C65D9E5;
	Thu, 20 Jun 2019 13:54:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 618401806B16;
	Thu, 20 Jun 2019 13:53:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KDqx0g001899 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 09:52:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C94E19F5E; Thu, 20 Jun 2019 13:52:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C39C65C2E4
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:52:52 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8318C049598
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 13:52:42 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id w25so145803ioc.8
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=dPlo4ROIMQa8sOuaoqIkOQSj3Mcwb4w4V3cG/vc+vQA=;
	b=lxhbTNJhQFHk5Nh49O6lU3dP3+kNBGjoiUV/BmQODg1LQ9Ub0dY++pcl+pEuFGqFrT
	EzzKvo6ufBm/yDlmslfhMxaC6tBCVVuhFtRoZJ2+/uexU7u3Dpw/5JikDj7jbU4h+0vG
	oxm+FB1xxsa00eBmMG6HfGBDgYCY76whWDcTY1+7Dbp7jtNOL0a/VLmwhvraGWbEnYXh
	V+ZRKzeFMi7E5UQ0zNGA6KFdYevZbtBXc4htEE9IXNtQMYreaMAQ17xo2wkT5wJotxy+
	UMVM93Is2GOBTuQTLDk1cKc+cGEIAmgePwFuaFNU9Lw+zlkalRvhmXBXLTjbzwo77HJV
	mlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=dPlo4ROIMQa8sOuaoqIkOQSj3Mcwb4w4V3cG/vc+vQA=;
	b=mB6wOyFUb9ncffD0CGBswUxH8+2NvtmSjzrHNQhLt8FDk163QQigwPojGnPt9Tl/C2
	QMKwjWNvOXZNCfHz/Kw6GRZupGZjT73Gg5y0PLG3RknzkWNVkD88YYKuljG2OF6GWAu8
	2QbICuNw9X0uhC4GyD4NcWjHzQxCxovZW/nNm/5EdV6WXMRlgylufwed8z6RsJ4X2hEf
	7U0VtBCsYnSMbrt/w4CtCDomvuVZR1fKMhTQ4b/gzpXoqE5WintaqetqwimEyVZHL+VV
	BlMt3AgQFtbJPRPHnB2QkE34Z52Bv0IXsOBM7X+AySs0gr1FywiYizKbTacOS1WFea7v
	ljlQ==
X-Gm-Message-State: APjAAAWFRW5+QGgmZ3uCuzKO9IzGDVzdO5XN6+oKsCpAflFUYgUjH7uo
	wA57l8zYdaTSSh3j0ty1MkWYhzLRFpV6GBxggrl87Q==
X-Google-Smtp-Source: APXvYqw6VAlpllr5EWM/2M4CZD21EH8cP8bUHreqigRUdab056YARTj1ExIee/8IV/gjAnwOXXpKbQ6WhMtLupqmbtw=
X-Received: by 2002:a5d:9d97:: with SMTP id 23mr18882540ion.204.1561038762005; 
	Thu, 20 Jun 2019 06:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
	<CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
	<075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
	<6a45dfa5-e383-d8a3-ebf1-abdc43c95ebd@gmail.com>
In-Reply-To: <6a45dfa5-e383-d8a3-ebf1-abdc43c95ebd@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 15:52:30 +0200
Message-ID: <CAKv+Gu-ZETNJh2VzUkpbQUmYv6Zqb7nVj91bxuxKoNAJwgON=w@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 20 Jun 2019 13:52:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Thu, 20 Jun 2019 13:52:42 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Thu, 20 Jun 2019 13:54:32 +0000 (UTC)

On Thu, 20 Jun 2019 at 15:14, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 20/06/2019 14:09, Milan Broz wrote:
> > On 20/06/2019 13:54, Ard Biesheuvel wrote:
> >> On Thu, 20 Jun 2019 at 13:22, Milan Broz <gmazyland@gmail.com> wrote:
> >>>
> >>> On 19/06/2019 18:29, Ard Biesheuvel wrote:
> >>>> This series creates an ESSIV template that produces a skcipher or AEAD
> >>>> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> >>>> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> >>>> encapsulated sync or async skcipher/aead by passing through all operations,
> >>>> while using the cipher/shash pair to transform the input IV into an ESSIV
> >>>> output IV.
> >>>>
> >>>> This matches what both users of ESSIV in the kernel do, and so it is proposed
> >>>> as a replacement for those, in patches #2 and #4.
> >>>>
> >>>> This code has been tested using the fscrypt test suggested by Eric
> >>>> (generic/549), as well as the mode-test script suggested by Milan for
> >>>> the dm-crypt case. I also tested the aead case in a virtual machine,
> >>>> but it definitely needs some wider testing from the dm-crypt experts.
> >>>>
> >>>> Changes since v2:
> >>>> - fixed a couple of bugs that snuck in after I'd done the bulk of my
> >>>>   testing
> >>>> - some cosmetic tweaks to the ESSIV template skcipher setkey function
> >>>>   to align it with the aead one
> >>>> - add a test case for essiv(cbc(aes),aes,sha256)
> >>>> - add an accelerated implementation for arm64 that combines the IV
> >>>>   derivation and the actual en/decryption in a single asm routine
> >>>
> >>> I run tests for the whole patchset, including some older scripts and seems
> >>> it works for dm-crypt now.
> >>>
> >>
> >> Thanks Milan, that is really helpful.
> >>
> >> Does this include configurations that combine authenc with essiv?
> >
> > Hm, seems that we are missing these in luks2-integrity-test. I'll add them there.
> >
> > I also used this older test
> > https://gitlab.com/omos/dm-crypt-test-scripts/blob/master/root/test_dmintegrity.sh
> >
> > (just aes-gcm-random need to be commented out, we never supported this format, it was
> > written for some devel version)
> >
> > But seems ESSIV is there tested only without AEAD composition...
> >
> > So yes, this AEAD part need more testing.
>
> And unfortunately it does not work - it returns EIO on sectors where it should not be data corruption.
>
> I added few lines with length-preserving mode with ESSIV + AEAD, please could you run luks2-integrity-test
> in cryptsetup upstream?
>
> This patch adds the tests:
> https://gitlab.com/cryptsetup/cryptsetup/commit/4c74ff5e5ae328cb61b44bf99f98d08ffee3366a
>
> It is ok on mainline kernel, fails with the patchset:
>
> # ./luks2-integrity-test
> [aes-cbc-essiv:sha256:hmac-sha256:128:512][FORMAT][ACTIVATE]sha256sum: /dev/mapper/dmi_test: Input/output error
> [FAIL]
>  Expecting ee501705a084cd0ab6f4a28014bcf62b8bfa3434de00b82743c50b3abf06232c got .
>
> FAILED backtrace:
> 77 ./luks2-integrity-test
> 112 intformat ./luks2-integrity-test
> 127 main ./luks2-integrity-test
>

OK, I will investigate.

I did my testing in a VM using a volume that was created using a
distro kernel, and mounted and used it using a kernel with these
changes applied.

Likewise, if I take a working key.img and mode-test.img, i can mount
it and use it on the system running these patches.

I noticed that this test uses algif_skcipher not algif_aead when it
formats the volume, and so I wonder if the way userland creates the
image is affected by this?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
