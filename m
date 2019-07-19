Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B386E09F
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 07:35:28 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5E0FC3001836;
	Fri, 19 Jul 2019 05:35:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D0DD610190C0;
	Fri, 19 Jul 2019 05:35:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DDA584E58E;
	Fri, 19 Jul 2019 05:35:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6J5YmQj003689 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 01:34:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DEABB62667; Fri, 19 Jul 2019 05:34:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D95885D719
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 05:34:46 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 837B030C34CE
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 05:34:45 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n4so30975525wrs.3
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 22:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Iow/hRxvVSUjo+9McFqy4a9hVvzKVnwTDlHSRUZV1h8=;
	b=x7yc+G267SAGG4+G1mYrx99EtRd9meF6RmN/qzLyX6h7BW1cMrMG2uA5mCfLoPhRvK
	tyjNZBh3NRZ30JNiQVjC1dfbmHZs50BYyNcpaBR5Jl/egodlcFOx4lckK0TQKqrewwcI
	gj5SIZEybkRYNEC1kyAbgq9kQlZ3/ve4ZHq4STBdJuExOlqEXRj7M3XbDv3hUkhrAVKd
	9bbZNGP56jOz56RXjlYUPWQId5uYymwK6anBlKHMPZACUu1+fDL/R7S3LboWCql1x8Pg
	U1XPNQzm2/Kj/nekZmrLPdJ95DSoZGhEAO4/My9cNMdn8BQ+qZEmtHCPI+Bjswi2FQ6a
	3G8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Iow/hRxvVSUjo+9McFqy4a9hVvzKVnwTDlHSRUZV1h8=;
	b=ZRj2sQZEldo3a/0/AZAJQh9amFceOJEsG697D293EAP3e3u0EUj1czlqPsjqeqnF+5
	nl1ko2ZThhEqUSaHwoTBkhZwENTt76/HjnUqz8+xQsmD58cUgV3+uG1FVDL/GoX3o4XZ
	RfldeatPXd3EOy05jWg+etwY5WKeypiJ2+Np4aDsMUqURQr0WD7JfxajDQNoLI6CQ947
	+WJ7XFCsZPSFYg6J9pmpPifv2v7VpFeQnN0p0GL7GyBO/3z2UyuHwa+2OBzVTBmQzTO0
	0bpGses2jix7brp+wTESHUUn3qgzZhjCMpA6j9QhtRq0578egsFKQtKNxU47ZfsXA7WW
	aKgg==
X-Gm-Message-State: APjAAAXTB61pwLpMhfvyDNOY8buYlebu3HRiXWUuz/ifF0taEblre6oJ
	0wS4zncPQ5uBtp7r2c2CFR3vTMHhdT31zao+iiu/Nw==
X-Google-Smtp-Source: APXvYqz2wcEG7VJP1w6LyA/iBG8byNOjpWunC0K9KTLEbNjWP26NaeKKgMXdm5+Hi/0vRhX7nsRFDpDdWga8mlCP7sc=
X-Received: by 2002:a5d:428b:: with SMTP id k11mr23152900wrq.174.1563514484209;
	Thu, 18 Jul 2019 22:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<36e78459-1594-6d19-0ab4-95b03a6de036@gmail.com>
	<MN2PR20MB2973E61815F069E8C7D74177CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718152908.xiuze3kb3fdc7ov6@gondor.apana.org.au>
	<MN2PR20MB2973E1A367986303566E80FCCAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20190718155140.b6ig3zq22askmfpy@gondor.apana.org.au>
	<CAKv+Gu9qm8mDZASJasq18bW=4_oE-cKPGKvdF9+8=7VNo==_fA@mail.gmail.com>
	<MN2PR20MB2973DE308D0050DBF3F26870CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB2973DE308D0050DBF3F26870CAC80@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 19 Jul 2019 07:34:33 +0200
Message-ID: <CAKv+Gu8dE6EO1NOwni91cvEWJvPzieC3wKph73j2jWxzx_xKAw@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 19 Jul 2019 05:34:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 19 Jul 2019 05:34:46 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>, Milan Broz <gmazyland@gmail.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 19 Jul 2019 05:35:27 +0000 (UTC)

On Thu, 18 Jul 2019 at 19:03, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> > > > For XTS, you have this additional curve ball being thrown in called the "tweak".
> > > > For encryption, the underlying "xts" would need to be able to chain the tweak,
> > > > from what I've seen of the source the implementation cannot do that.
> > >
> > > You simply use the underlying xts for the first n - 2 blocks and
> > > do the last two by hand.
> > >
> >
> > OK, so it appears the XTS ciphertext stealing algorithm does not
> > include the peculiar reordering of the 2 final blocks, which means
> > that the kernel's implementation of XTS already conforms to the spec
> > for inputs that are a multiple of the block size.
> >
> Yes, for XTS you effectively don't do CTS if it's a 16 byte multiple ...
>
> > The reason I am not a fan of making any changes here is that there are
> > no in-kernel users that require ciphertext stealing for XTS, nor is
> > anyone aware of any reason why we should be adding it to the userland
> > interface. So we are basically adding dead code so that we are
> > theoretically compliant in a way that we will never exercise in
> > practice.
> >
> You know, having worked on all kinds of workarounds for silly irrelevant
> (IMHO) corner cases in  the inside-secure hardware driver over the past
> months just to keep testmgr happy, this is kind of ironic ...
>
> Cipher text stealing happens to be a *major* part of the XTS specification
> (it's not actually XTS without the CTS part!), yet you are suggesting not
> to implement it because *you* don't have or know a use case for it.
> That seems like a pretty bad argument to me. It's not some minor corner
> case that's not supported.The implementation is just *incomplete*
> without it.
>

I would argue that these cases are diametrically opposite: you
proposed to remove support for zero length input vectors from the
entire crypto API to prevent your driver from having to deal with
inputs that the hardware cannot handle.

I am proposing not to add support for cases that we have no need for.
XTS without CTS is indistinguishable from XTS with CTS if the inputs
are always a multiple of the block size, and in 12 years, nobody has
ever raised the issue that our support is limited to that. So what
problem are we fixing by changing this? dm-crypt does not care,
fscrypt does not care, userland does not care (given that it does not
work today and we are only finding out now due to some fuzz test
failing on CAAM)


> > Note that for software algorithms such as the bit sliced NEON
> > implementation of AES, which can only operate on 8 AES blocks at a
> > time, doing the final 2 blocks sequentially is going to seriously
> > impact performance. This means whatever wrapper we invent around xex()
> > (or whatever we call it) should go out of its way to ensure that the
> > common, non-CTS case does not regress in performance, and the special
> > handling is only invoked when necessary (which will be never).
> >
> I pretty much made the same argument about all these driver workarounds
> slowing down my driver fast path but that was considered a non-issue.
>
> In this particular case, it should not need to be more than:
>
> if (unlikely(size & 15)) {
>   xts_with_partial_last_block();
> } else {
>   xts_with_only_full_blocks();
> }
>

Of course. But why add this at all if it is known to be dead code?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
