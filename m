Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B2F6C0CD
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 20:09:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57F7980F7C;
	Wed, 17 Jul 2019 18:09:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DDDB60C44;
	Wed, 17 Jul 2019 18:08:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EEE4A1800202;
	Wed, 17 Jul 2019 18:08:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HI8jNJ003190 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 14:08:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BB3BD5C220; Wed, 17 Jul 2019 18:08:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5B575FC02
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 18:08:40 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 11817307E04E
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 18:08:40 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id v19so23087777wmj.5
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=zv8wcEa6GYy4YZQahLdN/TanAjq6LmsiMTWLNjQH94k=;
	b=q/7J3fU6PDaEBbr2nkuxyzQoz8cgHtbgf1YxcPMSWfEEMq3Dd1ksOdnSWjURBlC98A
	qjsT1x0lucqEByJrWHSW3THwpHO65XHtupbPeXRHbAuRSidwiw/Npdt64jcJHcVV1mRu
	hGls0hJ6cD30K/z4YfGF/Rdzr0KQPyqvI8Ywye2UUv2BbmTdTH0deB7YdjZzvqV9tKRn
	G1pyJNahzIOMs3jPotbId7bvnCRz9skPp4QRBTkZXZAizSAZFSMQVtukLbqYS6w1howW
	hWBUg/VDShpjx1CGZYfcquUrpp4qTuuO/Q49aSblWjAajzgwm5GBBmE6h3o7a34FaG/K
	fZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=zv8wcEa6GYy4YZQahLdN/TanAjq6LmsiMTWLNjQH94k=;
	b=iivkX/x3d+qAgwvKao6jo1okf8rlEoPriWjBfSy1HCBoFMr+jPYY/qoZ3bd5wCagUu
	HUHVIAQ8aavIDPhwRWdEAV7grToajGNOVivvSztUgUuBctkica6Jak+0QgSZ9y96Dl3u
	CUfSTNmiYg/Y3L5Hpu5o6qys1uPGgqOGCTOUPY53Z2k18EQw+T4SZuVFgXMNXzkowDp8
	gUWiOhh5OboDEL2W1hHCzT1kFxWeTfQeJrJwEZ/DRaABaNi/Mr3ELeKmy2/J+Su6lR7k
	VNScKnST1DkeMkyqwvoZo+xSYugTCx+2pSCtfKLX+i5xPLTwRyqyXaZaGvUVfA8W0Egz
	GrvQ==
X-Gm-Message-State: APjAAAXGdmbXLulVNfMAIz4Ob1cTjv+jlUaVRQgYZNKvynhyY3838O23
	MlU9Kgz5T8g+vP23S0dNV0V5bSs9UiGbVmuZlqZOEg==
X-Google-Smtp-Source: APXvYqxmjONHtcsZZASFx3N2OTq1HdgdMKU6bkt0xXd/bpop34cTFabMv0RftY+oyh6eAThyKpuQePlIdxwqOm7TMJ0=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr34589939wmj.61.1563386918556; 
	Wed, 17 Jul 2019 11:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
In-Reply-To: <20190717172823.GA205944@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 17 Jul 2019 20:08:27 +0200
Message-ID: <CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
To: Horia Geanta <horia.geanta@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 18:08:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Wed, 17 Jul 2019 18:08:40 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x6HI8jNJ003190
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing
	support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 17 Jul 2019 18:09:02 +0000 (UTC)

On Wed, 17 Jul 2019 at 19:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jul 17, 2019 at 05:09:31PM +0000, Horia Geanta wrote:
> > On 7/17/2019 1:16 AM, Eric Biggers wrote:
> > > Hi Horia,
> > >
> > > On Tue, Jul 16, 2019 at 05:46:29PM +0000, Horia Geanta wrote:
> > >> Hi,
> > >>
> > >> With fuzz testing enabled, I am seeing xts(aes) failures on caam drivers.
> > >>
> > >> Below are several failures, extracted from different runs:
> > >>
> > >> [    3.921654] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=40 klen=64"; expected_error=-22, cfg="random: inplace use_finup nosimd src_divs=[57.93%@+11, 37.18%@+164, <reimport>0.68%@+4, 0.50%@+305, 3.71%@alignmask+3975]"
> > >>
> > >> [    3.726698] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=369 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@alignmask+584]"
> > >>
> > >> [    3.741082] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=2801 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+6] iv_offset=18"
> > >>
> > >> It looks like the problem is not in CAAM driver.
> > >> More exactly, fuzz testing is generating random test vectors and running
> > >> them through both SW generic (crypto/xts.c) and CAAM implementation:
> > >> -SW generic implementation of xts(aes) does not support ciphertext stealing
> > >> and throws -EINVAL when input is not a multiple of AES block size (16B)
> > >> -caam has support for ciphertext stealing, and allows for any input size
> > >> which results in "unexpectedly succeeded" error messages.
> > >>
> > >> Any suggestion how this should be fixed?
> > >>
> > >> Thanks,
> > >> Horia
> > >
> > > I don't think drivers should allow inputs the generic implementation doesn't,
> > > since those inputs aren't tested by the crypto self-tests (so how do you know
> > How about implementation adding static test vectors and using them to validate
> > the standard feature set that's not supported by the generic implementation?
> >
> > > it's even correct?), and people could accidentally rely on the driver-specific
> > > behavior and then be unable to migrate to another platform or implementation.
> > >
> > People could also *intentionally* rely on a driver offering an implementation
> > that is closer to the spec / standard.
> >
> > > So for now I recommend just updating the caam driver to return -EINVAL on XTS
> > > inputs not evenly divisible by the block size.
> > >
> > I was hoping for something more constructive...
> >
> > > Of course, if there are actual use cases for XTS with ciphertext stealing in the
> > > kernel, we could add it to all the other implementations too.  But I'm not aware
> > > of any currently.  Don't all XTS users in the kernel pass whole blocks?
> > >
> > That's my guess too.
> >
> > What about user space relying on offloading and xts working
> > according to the spec?
> >
>
> Sure, AF_ALG users could expect ciphertext stealing to work.  I don't know of
> any actual examples of people saying they want it, but it's possible.
>
> My point is simply that we add this, we need to find a way to support it in all
> implementations.  It's not helpful to add it to only one specific driver, as
> then it's inconsistent and is untestable with the common tests.
>

IIRC there are different ways to implement CTS, and the cts template
we have in the kernel (which is used for CBC in some cases) implements
the flavor where the last two blocks are reordered if the input size
is an exact multiple of the block size. If your CTS implementation
does not implement this reordering (which seems to be the case since
it is compatible with plain XTS), it implements CTS in an incompatible
way.

Since the kernel does not support CTS for XTS any way, and since no
AF_ALG users can portably rely on this, I agree with Eric that the
only sensible way to address this is to disable this functionality in
the driver.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
