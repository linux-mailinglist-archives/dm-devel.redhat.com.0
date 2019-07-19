Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A3C6E9E8
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jul 2019 19:15:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 229B8B59AD;
	Fri, 19 Jul 2019 17:15:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C8E15183ED;
	Fri, 19 Jul 2019 17:15:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DC204E58E;
	Fri, 19 Jul 2019 17:15:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6JHF7pp013309 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jul 2019 13:15:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 699BA2FC52; Fri, 19 Jul 2019 17:15:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 62FAF63628
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 17:15:03 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F4090A3EA8
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 17:15:01 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id p74so29467821wme.4
	for <dm-devel@redhat.com>; Fri, 19 Jul 2019 10:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=uEAqm1stTO9823fBrOpppjd8fzZPKzRMlZWQILPMn+g=;
	b=mT9yffXq78ALikWp59ge7dfnWEvsfs/MazrFFbM1BQQG8pzRljsgYwI+fr1mKYe1w6
	VzqOBVM28KOPQeDDekgxWquoEJPswvZyq4Pf4HvBc0Ad8CRVuCmaASwzT5hcheyhMnNZ
	U6MEbiKNSnvfgNdYp7QH3+XfyMg3obCy6JinNzynOaWdV7EyvFboup/D3jH7t1UaWeCQ
	6l9Dty7yLogV36VDwxs/D2CJvptX/7d23pFdwD7LGl66oECRLb+N7Za8Gn/C3z1vLD1M
	YQ7AMBKQbo/DoGk6jLnbEchUT8X4tSCa4ikZeBBHbaPzTmmQ73AInEPJuHwdIGb6vJD7
	SCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=uEAqm1stTO9823fBrOpppjd8fzZPKzRMlZWQILPMn+g=;
	b=pJSWWqowW0pc2Y9pHCk56dhxcYQ0lhjHNKO8H08N6HcNRn7XlzXBwnQHZ+wIJjEdtZ
	AK4VpIaysOm5f+wheYofz3L4NNaYTTdFCfLNXsypKAa+wJdTWKgrnYfxKV66+Luoheto
	fNbRE1JfWZdvB3vlK0VIAXyTnyGt5emWV3tI+fIKhoWggfmBYvnw41Txsves7Xs8vm00
	sLqTumUi+pe+keIeLcNkN9H+eNEHrnXIIXJ7GLh7IdTNDcWpsrdhIRvaDZdoOEDq3Cua
	qwSqYuKApPDR8cnsdysJ3nwyBtYp/KoMy2piHWxytdcJX7uQfkAyc8ONAhiKf9kPWvLj
	ZHng==
X-Gm-Message-State: APjAAAWTH5N5ghG6ZhtA0vDb/uTnVxqd6zFSa0RXMdn/s0QuhWAEE96O
	ZcdNkN/sb0KZYbDawOLE35hdalKFOW3OMi10iqN5Tg==
X-Google-Smtp-Source: APXvYqxPLiyDoU4Jv1g5iP/e8ZDOu8y7mC1ktjAQrga59UhOtU14oiDb7MS0KsRRoVPYZeLAryvpFMH2sdH6ngL0Js0=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr50632500wmm.10.1563556500588; 
	Fri, 19 Jul 2019 10:15:00 -0700 (PDT)
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
	<CAKv+Gu8dE6EO1NOwni91cvEWJvPzieC3wKph73j2jWxzx_xKAw@mail.gmail.com>
	<MN2PR20MB297371CEE0F60E58E110C6FDCACB0@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB297371CEE0F60E58E110C6FDCACB0@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 19 Jul 2019 19:14:49 +0200
Message-ID: <CAKv+Gu-_1Bv1WQw+7ENWmjgvbgncKXGYOfxSr2GhVfN3-U3VtQ@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Fri, 19 Jul 2019 17:15:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Fri, 19 Jul 2019 17:15:02 +0000 (UTC) for IP:'209.85.128.54'
	DOMAIN:'mail-wm1-f54.google.com' HELO:'mail-wm1-f54.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.54 mail-wm1-f54.google.com 209.85.128.54
	mail-wm1-f54.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 19 Jul 2019 17:15:45 +0000 (UTC)

On Fri, 19 Jul 2019 at 09:29, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Sent: Friday, July 19, 2019 7:35 AM
> > To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>; Milan Broz <gmazyland@gmail.com>; Horia Geanta <horia.geanta@nxp.com>; linux-
> > crypto@vger.kernel.org; dm-devel@redhat.com
> > Subject: Re: xts fuzz testing and lack of ciphertext stealing support
>  >
> > I would argue that these cases are diametrically opposite: you
> > proposed to remove support for zero length input vectors from the
> > entire crypto API to prevent your driver from having to deal with
> > inputs that the hardware cannot handle.
> >
> I did not propose any such thing - I just proposed to make zero length hash support *optional*
> (i.e. don't fail and disable the driver on it) as it's totally irrelevant for 99.99999% of use cases.
> (including *all* use cases I consider relevant for HW acceleration)
>

Fair enough. But it did involve making modifications to the generic
layer, since there are known users of the AF_ALG interface that may
pass zero length inputs (e.g., sha1sum).

> > I am proposing not to add support for cases that we have no need for.
> >
> While you are proposing to stick with an implementation that can only deal with 6.25% (1/16th) of
> *legal* input data for XTS and fails on the remaining 93.75%. That's hardly a corner case anymore.
>

I never said it was a corner case, nor does it make a lot of sense to
reason about fractional compliance, given that 100% of the inputs we
ever encounter are covered by your 6.25% of legal input data.

What i did say was that the moving parts we will add to the code will
never be put into motion, while they do increase the validation space,
and so the value of the contribution will be negative.

Perhaps I should emphasize that my concern is mainly about in-kernel
usage of the sync software ciphers, since they typically have no use
for userland, given that they can simply issue the same instructions
directly. For AF_ALG, I agree that exposing a non-compliant XTS
implementation is a bad idea.

> > XTS without CTS is indistinguishable from XTS with CTS if the inputs
> > are always a multiple of the block size, and in 12 years, nobody has
> > ever raised the issue that our support is limited to that. So what
> > problem are we fixing by changing this? dm-crypt does not care,
> > fscrypt does not care, userland does not care (given that it does not
> > work today and we are only finding out now due to some fuzz test
> > failing on CAAM)
> >
> If it's not supported, then it cannot be used. Most people would not start complaining about that,
> they would just roll their own locally or they'd give up and/or use something else.
> So the fact that it's currently not being used does not mean a whole lot. Also, it does not mean
> that there will not be a relevant use case tomorrow. (and I can assure you there *are* definitely
> real-life use cases, so I have to assume these are currently handled outside of the base kernel)
>
> In any case, if you try to use XTS you would *expect* it to work for any input >= 16 bytes as that's
> how the algorithm is *specified*. Without the CTS part it's simply not XTS.
>

I really don't care what we call it. My point is that we don't need
functionality that we will not use, regardless of how it is called.

> > > I pretty much made the same argument about all these driver workarounds
> > > slowing down my driver fast path but that was considered a non-issue.
> > >
> > > In this particular case, it should not need to be more than:
> > >
> > > if (unlikely(size & 15)) {
> > >   xts_with_partial_last_block();
> > > } else {
> > >   xts_with_only_full_blocks();
> > > }
> > >
> >
> > Of course. But why add this at all if it is known to be dead code?
> >
> But that's just an assumption and assumptions are the root of all evil ;-)
>

I think it was premature optimization that is the root of all evil, no?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
