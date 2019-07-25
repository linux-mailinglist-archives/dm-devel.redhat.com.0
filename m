Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DB57471A
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jul 2019 08:23:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 91D0130C583B;
	Thu, 25 Jul 2019 06:23:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB1AF5D71A;
	Thu, 25 Jul 2019 06:23:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D37641800206;
	Thu, 25 Jul 2019 06:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6P6MeX6023993 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Jul 2019 02:22:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 34DF95DAAF; Thu, 25 Jul 2019 06:22:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 300E15DA34
	for <dm-devel@redhat.com>; Thu, 25 Jul 2019 06:22:37 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FA8C30805C4
	for <dm-devel@redhat.com>; Thu, 25 Jul 2019 06:22:36 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 207so43818397wma.1
	for <dm-devel@redhat.com>; Wed, 24 Jul 2019 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XO+kLN/o2g5vVTMjJb2RVqXQqDH7sHAXIU/oFvB4D58=;
	b=X2+y/ViHkdaapFZ4Gapey81vy+lCDfHRvsjtx5e7eRXXG5eOPfn4I5HSUn5Xbad9hc
	mTDebNtdnwnAYWqPe7nsdr3hJK064CxBvmOcPLEMS5s0EgzREZRIasyeI9ARE42oMTOa
	BTaOvGEOnp/nRDnKbPoHC5Rd7/Ga8StqTBSob4VPyPhZrFiZEiwrh79/04EXFhClE68E
	11kfoKDjnJByas4QDg0cg/8x8fVdtYlBSr4zkVii+K4X2KTjVhzvZVzJ0BpY+KJq6/Ch
	OqgWBpuPiw2m6b+bBYpaCTE/ngaKTgKZbuiY9fEf+uX81Li4XPgVc7R4v6BFNtqokjwc
	2/8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XO+kLN/o2g5vVTMjJb2RVqXQqDH7sHAXIU/oFvB4D58=;
	b=qCh7y/+Z0mEV2hacZSKgwgjPHdcFwTQD7vnr5LTv5l5yRmM7ts4MZWFEw/8j9Bsvzn
	OQpnq8Zoz2DuRCO5AhUvLFUALteUz6qjbh2aQ5Hsz2gIDajuTjAyC0zgTJJ5+4zRE4v4
	3GJt3WBsps+iuYqCeh10SE/Th+Zav5Vb9+odOpp1BYwGrksfKKR/PjWMxvzDj4Pw5h4L
	QtSopcnXCfWJCkDhPS4qUD+EPhCpuBHakq399qpNdffJ1LWNYophJZJmD94J/++u0KX/
	SkwIOJPz2hVH2bE5vDQ7a4x2FU9faLimv5P4cZPjroZ6/05gRbwGf9D11ZVtP58bMw/8
	pD9Q==
X-Gm-Message-State: APjAAAVDI2QSXJHKpaqkCUktF1A/KEJEWU9qrADHmh0LQccQr0+9KeHK
	oodQ89ReYjwdJ4qo3Km+/P4QoTMVg7a62hTXaPJNiw==
X-Google-Smtp-Source: APXvYqx8yMtnDp0E8NWqMSKzAEGxQ7jT1Iziv8+LDjVyXrWQuEJoxO7pWrKg3A1vzxVuevbR7CAi8+cLHR5HBe7G2Is=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr80069769wmm.10.1564035755194; 
	Wed, 24 Jul 2019 23:22:35 -0700 (PDT)
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
In-Reply-To: <MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 25 Jul 2019 09:22:24 +0300
Message-ID: <CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 25 Jul 2019 06:22:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 25 Jul 2019 06:22:36 +0000 (UTC) for IP:'209.85.128.67'
	DOMAIN:'mail-wm1-f67.google.com' HELO:'mail-wm1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.67 mail-wm1-f67.google.com 209.85.128.67
	mail-wm1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 25 Jul 2019 06:23:13 +0000 (UTC)

On Wed, 24 Jul 2019 at 19:10, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> Ard,
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Sent: Monday, July 22, 2019 6:43 PM
> > To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
> > Cc: Milan Broz <gmazyland@gmail.com>; Herbert Xu <herbert@gondor.apana.org.au>; dm-devel@redhat.com; linux-
> > crypto@vger.kernel.org; Horia Geanta <horia.geanta@nxp.com>
> > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> >
> > On Mon, 22 Jul 2019 at 12:44, Pascal Van Leeuwen
> > <pvanleeuwen@verimatrix.com> wrote:
> > >
> > > > -----Original Message-----
> > > > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > > > Sent: Sunday, July 21, 2019 11:50 AM
> > > > To: Milan Broz <gmazyland@gmail.com>
> > > > Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>; Herbert Xu <herbert@gondor.apana.org.au>; dm-devel@redhat.com; linux-
> > > > crypto@vger.kernel.org; Horia Geanta <horia.geanta@nxp.com>
> > > > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> > > >
> > > > On Sat, 20 Jul 2019 at 10:35, Milan Broz <gmazyland@gmail.com> wrote:
> > > > >
> > > > > On 20/07/2019 08:58, Eric Biggers wrote:
> > > > > > On Thu, Jul 18, 2019 at 01:19:41PM +0200, Milan Broz wrote:
> > > > > >> Also, I would like to avoid another "just because it is nicer" module dependence (XTS->XEX->ECB).
> > > > > >> Last time (when XTS was reimplemented using ECB) we have many reports with initramfs
> > > > > >> missing ECB module preventing boot from AES-XTS encrypted root after kernel upgrade...
> > > > > >> Just saying. (Despite the last time it was keyring what broke encrypted boot ;-)
> > > > > >>
> > > > > >
> > > > > > Can't the "missing modules in initramfs" issue be solved by using a
> > > > > > MODULE_SOFTDEP()?  Actually, why isn't that being used for xts -> ecb already?
> > > > > >
> > > > > > (There was also a bug where CONFIG_CRYPTO_XTS didn't select CONFIG_CRYPTO_ECB,
> > > > > > but that was simply a bug, which was fixed.)
> > > > >
> > > > > Sure, and it is solved now. (Some systems with a hardcoded list of modules
> > > > > have to be manually updated etc., but that is just bad design).
> > > > > It can be done properly from the beginning.
> > > > >
> > > > > I just want to say that that switching to XEX looks like wasting time to me
> > > > > for no additional benefit.
> > > > >
> > > > > Fully implementing XTS does make much more sense for me, even though it is long-term
> > > > > the effort and the only user, for now, would be testmgr.
> > > > >
> > > > > So, there are no users because it does not work. It makes no sense
> > > > > to implement it, because there are no users... (sorry, sounds like catch 22 :)
> > > > >
> > > > > (Maybe someone can use it for keyslot encryption for keys not aligned to
> > > > > block size, dunno. Actually, some filesystem encryption could have use for it.)
> > > > >
> > > > > > Or "xts" and "xex" could go in the same kernel module xts.ko, which would make
> > > > > > this a non-issue.
> > > > >
> > > > > If it is not available for users, I really see no reason to introduce XEX when
> > > > > it is just XTS with full blocks.
> > > > >
> > > > > If it is visible to users, it needs some work in userspace - XEX (as XTS) need two keys,
> > > > > people are already confused enough that 256bit key in AES-XTS means AES-128...
> > > > > So the examples, hints, man pages need to be updated, at least.
> > > > >
> > > >
> > > > OK, consider me persuaded. We are already exposing xts(...) to
> > > > userland, and since we already implement a proper subset of true XTS,
> > > > it will be simply a matter of making sure that the existing XTS
> > > > implementations don't regress in performance on the non-CTS code
> > > > paths.
> > > >
> > > > It would be useful, though, to have some generic helper functions,
> > > > e.g., like the one we have for CBC, or the one I recently proposed for
> > > > CTS, so that existing implementations (such as the bit sliced AES) can
> > > > easily be augmented with a CTS code path (but performance may not be
> > > > optimal in those cases). For the ARM implementations based on AES
> > > > instructions, it should be reasonably straight forward to implement it
> > > > close to optimally by reusing some of the code I added for CBC-CTS
> > > > (but I won't get around to doing that for a while). If there are any
> > > > volunteers for looking into the generic or x86/AES-NI implementations,
> > > > please come forward :-) Also, if any of the publications that were
> > > > quoted in this thread have suitable test vectors, that would be good
> > > > to know.
> > >
> > > Unfortunately, these algorithm & protocol specifications tend to be very frugal when it
> > > comes to providing test vectors, barely scratching the surface of any corner cases, but
> > > at least there is one non-multiple-of-16 vector in the original IEEE P1619 / D16
> > > specification in Annex B Test Vectors (last vector, "XTS-AES-128 applied for a data unit
> > > that is not a multiple of 16 bytes")
> > >
> >
> > Actually, that spec has a couple of test vectors. Unfortunately, they
> > are all rather short (except the last one in the 'no multiple of 16
> > bytes' paragraph, but unfortunately, that one is in fact a multiple of
> > 16 bytes)
> >
> > I added them here [0] along with an arm64 implementation for the AES
> > instruction based driver. Could you please double check that these
> > work against your driver?
> >
> I got XTS working with the inside-secure driver and these (and all other) vectors pass :-)
>

Excellent, thanks for the report. May I add your Tested-by when I post
the patch? (just the one that adds the test vectors)

> > That would establish a ground truth against
> > which we can implement the generic version as well.
> >
> > [0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=xts-cts
> >
> > > Besides that, I'd be happy to generate some testvectors from our defacto-standard
> > > implementation ;-)
> > >
> >
> > One or two larger ones would be useful, yes.
> >
> I'll see if I can extract some suitable vectors from our verification suite ...
>

Great. Once available, I'll run them against my implementations and report back.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
