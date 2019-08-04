Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3F80A04
	for <lists+dm-devel@lfdr.de>; Sun,  4 Aug 2019 10:39:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 577543CA06;
	Sun,  4 Aug 2019 08:39:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11D1E60BFB;
	Sun,  4 Aug 2019 08:38:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E186241F53;
	Sun,  4 Aug 2019 08:38:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x748afwk028999 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 4 Aug 2019 04:36:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E790660C47; Sun,  4 Aug 2019 08:36:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E061660BFB
	for <dm-devel@redhat.com>; Sun,  4 Aug 2019 08:36:39 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 936C936899
	for <dm-devel@redhat.com>; Sun,  4 Aug 2019 08:36:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id 207so71998861wma.1
	for <dm-devel@redhat.com>; Sun, 04 Aug 2019 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S5z3diwrj3LTNJL99A/1OowPibFl4kOSfl1ebMrUQAM=;
	b=gZQuXkDa92Cg03NJBMuifLv2d00BelHmlNmbsuBjP/1HV2Jot7X3S36dFGBXMo32TO
	pkH1RiRWaspaELe4VXwWZS+b5aL0k3utLiRrvRDiuWI57ppEyxSbQnUYHNltOM8TsIW3
	MDJKTS2VfidcnNerS6p5N+KalylRTweD9Fdj9ZylNJivZOJnG/xy02sAdkyEL6l4DGli
	6MKls/brtzzYOHF76Qp9PvNcdKo0QKPBfDvkzCiOaF9bDdogY3QFeaG//ubRpmrcCDOf
	F2DeR1mTxT4KH7asc3pl8biSGI8PBvT+OzBqWdrVY4PUJAJvLQ67NsaYTh8ZxY6m2rVM
	7u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S5z3diwrj3LTNJL99A/1OowPibFl4kOSfl1ebMrUQAM=;
	b=LqXXIAxAOkd0xp7e0NyiYKB3u+zKRMeYjPYsETs4mABELIZKg8JlNaQtGPTUYAJaaS
	QSlPjiUcYsIGIrf2K7dUt3Qic0deeIwTyLGgXNCGBcveqYmzQDhhX3Ij0rzvg0YlfUrS
	eDI9QCzG8O/3/OLxZ12bXe16NoBvlrDbLxxl4VU8rU0fNn3VbTFtN6AhW+LFo86An/Bx
	jSI/oHSExXDMnxzGmUKCsWJBk3rD3Pt4BxOb8ecz5L6IsjuuSVmSDp8vZPodxrVQ4He/
	ku9N4J4f6+asRM/kmb2iHOXh3pKg5tNy1v0dTeAVvTPzdMoFXVb+/HBT1jzQOXlZCCAo
	PQxQ==
X-Gm-Message-State: APjAAAWmBu+s9+VaNmKRVusp2mqi7YED+vwwx8eQ9ORHaJ1HECzBv1wt
	K2/YDBS9aYmsoPSYuzcf5ZlRN+njVOZ9Tgf8wYK6bV2ytgc=
X-Google-Smtp-Source: APXvYqzwfFFMUOMV4ujWhOonieSQIcv9qD5u01lkqbHt35xWftkOx8hC38QvI2mu4JjWc36l0PN9p6bAjlX2GLNcllI=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr11976048wmj.61.1564907797099; 
	Sun, 04 Aug 2019 01:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190716221639.GA44406@gmail.com>
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
	<CAKv+Gu9krpqWYuD2mQFBTspo3y_TwrN6Arbvkcs=e4MpTeitHA@mail.gmail.com>
	<97532fae-4c17-bb8f-d245-04bf97cef4d1@gmail.com>
In-Reply-To: <97532fae-4c17-bb8f-d245-04bf97cef4d1@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 4 Aug 2019 11:36:25 +0300
Message-ID: <CAKv+Gu9JuXJspTO9tYbBgkdgmUznhgW+DWc029JWR2bqNsW_Bw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Sun, 04 Aug 2019 08:36:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Sun, 04 Aug 2019 08:36:38 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Sun, 04 Aug 2019 08:39:06 +0000 (UTC)

On Sat, 27 Jul 2019 at 19:04, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 27/07/2019 07:39, Ard Biesheuvel wrote:
> > Thanks for the additional test vectors. They work fine with my SIMD
> > implementations for ARM [0], so this looks like it might be a CAAM
> > problem, not a problem with the test vectors.
> >
> > I will try to find some time today to run them through OpenSSL to double check.
>
> I shamelessly copied your test vectors to my vector test for cryptsetup backend.
>
> Both OpenSSL and gcrypt XTS implementation passed all tests here!
>
> If interested - this is copy of backend we have in cryptsetup, vectors added in crypto-vectors.c
> (there are some hard defines in Makefile, cryptsetup uses autoconf instead).
>   OpenSSL: https://github.com/mbroz/cryptsetup_backend_test
>   gcrypt branch: https://github.com/mbroz/cryptsetup_backend_test/tree/gcrypt
>
> Once kernel AF_ALG supports it, I can easily test it the same way.
>

Thanks for confirming. So we can be reasonably confident that the test
vectors contributed by Pascal are sound.

I'll try to send out my ARM/arm64 changes shortly. However, I won't
have any access to hardware until end of next month, so they are
tested on QEMU only, which means I won't be able to provide any
performance numbers.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
