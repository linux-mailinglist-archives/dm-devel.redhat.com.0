Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D09776C4
	for <lists+dm-devel@lfdr.de>; Sat, 27 Jul 2019 07:40:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A614E30860C0;
	Sat, 27 Jul 2019 05:40:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6461B19C79;
	Sat, 27 Jul 2019 05:40:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 63C6D41F53;
	Sat, 27 Jul 2019 05:39:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6R5dPeh016767 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 27 Jul 2019 01:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7CA81001B0C; Sat, 27 Jul 2019 05:39:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0CAE1001B09
	for <dm-devel@redhat.com>; Sat, 27 Jul 2019 05:39:23 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4DDD81F13
	for <dm-devel@redhat.com>; Sat, 27 Jul 2019 05:39:21 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id x15so49576643wmj.3
	for <dm-devel@redhat.com>; Fri, 26 Jul 2019 22:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MUVETRd5jGXNj319q2hmPRDJzjSos23f23Rl11EPouA=;
	b=EdvLuNMV7jhFKSns1ldkH4GCbJ0g1ZLoSbu87dsGP/8WFobdd2gPZpvGvGopDuGCrO
	NAhClaioZe9t3QF+E68aQIqEGhYofXiezJCZRKv95d9qdljFZ1g4dj3kx5749R7ajExW
	9HIozlw1j7shQqGCp3+dD2eF5aJXqxJzvy6noDoSaVULiP4kD5S6KE4x36cyEiU9cnmt
	xHbBbit2+LdsFgPtS9HMZqE3vEKfCgEmI6ElZuatUpqkdO/s/S2d2AQtUiHs518+eIJe
	dqE9O/qZZ7RHu4fquRjH88kalLbQjm0sj8gKbN2lHAtW7q36SCUDoC2Myfp62Y7JDOnJ
	4T4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MUVETRd5jGXNj319q2hmPRDJzjSos23f23Rl11EPouA=;
	b=NN/um8qDoQEC3T6ofEMsuVQmLTQZL0XcpmHjCRTMf9/v5hXk1j8Y5C9EBoGL3MLOxO
	9j5sJ54XN/X7dmYjU/OV0VArEKefNWn0Nh1OKI4eoTGEl5IWcVPro2UvfxrXsiuUkmOx
	zdQdPw/KhJnCMvEhDXcrHH0VeEiA1wEEPclX+yzAli6+ZXlmMeJCBa3OVosM887cyZGr
	vcOfd2LUHD2iYTtQY/RrJkb4EwuRhHI4p9/Z13BkHIUv7ZOZaGOQEh+BbgVyrdPvAjdD
	XZQs6rUEYkO5T7V+3hbmCWE4JZXNsvPX51aoovgHhtWopzxxeuNpETh3BY8ZbKS5jPkl
	G6pg==
X-Gm-Message-State: APjAAAVpYV286l/zXuSXM/wna3HBKqrYHEiHrwXRDR94kxboivoC0bx1
	TWiCXPbkcFTFe1sKZIYrcpu8/fhHK3BAtIvRrttdbg==
X-Google-Smtp-Source: APXvYqzQcd1U5wjYDSIVkLNIWAzSCfPsOd836HkHWKRCZZe7ICMAEtbgEEDDcZhW+g42/wWElyBMKBZJOguOPJsC3FU=
X-Received: by 2002:a1c:720e:: with SMTP id n14mr7388848wmc.53.1564205960368; 
	Fri, 26 Jul 2019 22:39:20 -0700 (PDT)
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
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB34850A016F3228124C0D360698C00@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB29732C3B360EB809EDFBFAC5CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB29732C3B360EB809EDFBFAC5CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sat, 27 Jul 2019 08:39:12 +0300
Message-ID: <CAKv+Gu9krpqWYuD2mQFBTspo3y_TwrN6Arbvkcs=e4MpTeitHA@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 27 Jul 2019 05:39:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Sat, 27 Jul 2019 05:39:22 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 27 Jul 2019 05:40:13 +0000 (UTC)

On Sat, 27 Jul 2019 at 00:43, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> > -----Original Message-----
> > From: Horia Geanta <horia.geanta@nxp.com>
> > Sent: Friday, July 26, 2019 9:59 PM
> > To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>; Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Cc: Milan Broz <gmazyland@gmail.com>; Herbert Xu <herbert@gondor.apana.org.au>; dm-devel@redhat.com; linux-
> > crypto@vger.kernel.org
> > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> >
> > On 7/26/2019 1:31 PM, Pascal Van Leeuwen wrote:
> > > Ok, find below a patch file that adds your vectors from the specification
> > > plus my set of additional vectors covering all CTS alignments combined
> > > with the block sizes you desired. Please note though that these vectors
> > > are from our in-house home-grown model so no warranties.
> > I've checked the test vectors against caam (HW + driver).
> >
> > Test vectors from IEEE 1619-2007 (i.e. up to and including "XTS-AES 18")
> > are fine.
> >
> > caam complains when /* Additional vectors to increase CTS coverage */
> > section starts:
> > alg: skcipher: xts-aes-caam encryption test failed (wrong result) on test vector 9, cfg="in-place"
> >
> > (Unfortunately it seems that testmgr lost the capability of dumping
> > the incorrect output.)
> >
> > IMO we can't rely on test vectors if they are not taken
> > straight out of a spec, or cross-checked with other implementations.
> >
>
> First off, I fully agree with your statement, which is why I did not post this as a straight
> patch. The problem is that specification vectors usually (or actuaclly, always) don't cover
> all the relevant corner cases needed for verification. And "reference" implementations
> by academics are usually shady at best as well.
>
> In this particular case, the reference vectors only cover 5 out of 16 possible alignment
> cases and the current situation proves that this is not sufficient. As we have 2 imple-
> mentations (or actually more, if you count the models used for vector generation)
> that are considered to be correct that disagree on results.
>
> Which is very interesting, because which one is correct? I know that our model and
> hardware implementation were independently developed (by 2 different engineers)
> from the IEEE spec and match on results. And our hardware has been used "out in
> the field" for many years already in disk controllers from major silicon vendors.
> But that's still not a guarantee .... So how do we resolve this? Majority vote? ;-)
>

Thanks for the additional test vectors. They work fine with my SIMD
implementations for ARM [0], so this looks like it might be a CAAM
problem, not a problem with the test vectors.

I will try to find some time today to run them through OpenSSL to double check.


[0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?h=xts-cts

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
