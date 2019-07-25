Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACA7748AC
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jul 2019 10:02:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6F53B4ACDF;
	Thu, 25 Jul 2019 08:02:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 210C160619;
	Thu, 25 Jul 2019 08:02:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6917441F53;
	Thu, 25 Jul 2019 08:02:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6P81v6O009751 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jul 2019 04:01:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FFB45DA65; Thu, 25 Jul 2019 08:01:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 290575D9DE
	for <dm-devel@redhat.com>; Thu, 25 Jul 2019 08:01:54 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C29E30B1AD2
	for <dm-devel@redhat.com>; Thu, 25 Jul 2019 08:01:53 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id f17so43794298wme.2
	for <dm-devel@redhat.com>; Thu, 25 Jul 2019 01:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IPV+5nYuHvPip1in8zVbGa9yz5HxPYcILBTs+OS2gzU=;
	b=sI5ZGVHQRajJ75UblxSdXtL2Tg9vKFcnI1Bbbc+Pdg0DcHOerTl82uWjHrxBBBaJYo
	w41fLdG8OgOSXnCkAvmob6PhKwmAboLjZ8IiCguewmXdOwBT25vw92Z08WjNJTHpjOzC
	d2s1CyruhfZMZ5iY0spEeL2pblTpii1S+hexeQdI5tNtI7yf48l66X4Tw1Z+74nlV4QW
	1AKWmGHuWuLSxWBBXEe+Bh6GwIy/h33FimJ8by4V7QtTd0X7bOB6Zcd9k2/hX4Ry1t8U
	Cku12EOS2zTbJG9hTa8wVgiIgGv5c2+PFptNK2fNW61gqhzr/LjksvBjPtBMoM3WbXq6
	Fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IPV+5nYuHvPip1in8zVbGa9yz5HxPYcILBTs+OS2gzU=;
	b=C5zcmc3F+78pjM76jOJw5q8U/C1pv/LPxnsjr6h2/mMpcfWIYcOrDumi+zNfj0COvf
	4s7H0ByydpYnrEh3bTTIoxNfSX/5MetxrxLR0XYkDIfyKb+RCnBWS10irvvRfPdJam98
	DE2+8BDRvA9Bf1IS5s8di819vvCmIk7Vb4F28KtPtfo+QD9wY/iZsrhwvQdEYpxSaIR/
	rV8GTFChJ+PRGj1SOgJGg4/uMp8l5PekPtHfwPZg3cniJuH0OjigjfItXXAa2as7t+gP
	pE/ZnDTnQ0tSpX/yx3FEBy89pZwme/+56+ICmhtVaRdAogoX+bUztIq5AgG/uB3NSRzD
	NXoQ==
X-Gm-Message-State: APjAAAVbKvHOT1dy+DzbGFrn5OYN4MyVEe6MZobyFXmu4to2nWf9WV8v
	yVwueXVOjsaTE7iyBC64vCWas8y3Zf6XYKXiLkhkxVuC34w=
X-Google-Smtp-Source: APXvYqwMqa+2T5HCA0DRhMyVsHLssDvqMHodAKEXLQTRGl8hAGbjSUU0X9nw3G/LFfBx7/k4ksnQ0fXHiLMeTGZtwr8=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr71796865wmj.61.1564041711747; 
	Thu, 25 Jul 2019 01:01:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<b042649c-db98-9710-b063-242bdf520252@gmail.com>
	<20190720065807.GA711@sol.localdomain>
	<0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
	<CAKv+Gu9UF+a1UhVU19g1XcLaEqEaAwwkSm3-2wTHEAdD-q4mLQ@mail.gmail.com>
	<MN2PR20MB2973B9C2DDC508A81AF4A207CAC40@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 25 Jul 2019 11:01:40 +0300
Message-ID: <CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Thu, 25 Jul 2019 08:01:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Thu, 25 Jul 2019 08:01:53 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 25 Jul 2019 08:02:33 +0000 (UTC)

On Thu, 25 Jul 2019 at 10:49, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Sent: Thursday, July 25, 2019 8:22 AM
> > To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
> > Cc: Milan Broz <gmazyland@gmail.com>; Herbert Xu <herbert@gondor.apana.org.au>; dm-devel@redhat.com; linux-
> > crypto@vger.kernel.org; Horia Geanta <horia.geanta@nxp.com>
> > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> >
> > > >
> > > > Actually, that spec has a couple of test vectors. Unfortunately, they
> > > > are all rather short (except the last one in the 'no multiple of 16
> > > > bytes' paragraph, but unfortunately, that one is in fact a multiple of
> > > > 16 bytes)
> > > >
> > > > I added them here [0] along with an arm64 implementation for the AES
> > > > instruction based driver. Could you please double check that these
> > > > work against your driver?
> > > >
> > > I got XTS working with the inside-secure driver and these (and all other) vectors pass :-)
> > >
> >
> > Excellent, thanks for the report. May I add your Tested-by when I post
> > the patch? (just the one that adds the test vectors)
> >
> Sure, feel free
>

Thanks

> > > > That would establish a ground truth against
> > > > which we can implement the generic version as well.
> > > >
> > > > [0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=xts-cts
> > > >
> > > > > Besides that, I'd be happy to generate some testvectors from our defacto-standard
> > > > > implementation ;-)
> > > > >
> > > >
> > > > One or two larger ones would be useful, yes.
> > > >
> > > I'll see if I can extract some suitable vectors from our verification suite ...
> > >
> >
> > Great. Once available, I'll run them against my implementations and report back.
> >
> Just wondering ... do you have any particular requirements on the sizes?
> From my implementation's perspective, it doesn't make a whole lot of sense to test vectors
> of more than 3 times the cipher block size, but then I realized that you probably need
> larger vectors due to the loop unrolling you do for the vector implementations?
> You also don't want them to be too big as they take up space in the kernel image ...
>

We have code that operates on 1 block, 3 blocks (ARM), 4-5 blocks
(arm64) or 8 blocks (ARM,arm64) at a time. However, the most important
thing is to test the handover between the block based loop and the
epilogue that operates on the final 17-31 bytes when ciphertext
stealing is being done.

So ideally, we'd have 1 full block + 1 full/1 partial, 3 full blocks +
1 full/1 partial, and so on for 4, 5 and 8 blocks, to cover all the
code flows, but since the unrolled routines all support arbitrary
block counts (and so the handover between the multiblock and the
single block handling is already covered), just having the first two
would  be sufficient IMO.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
