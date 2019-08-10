Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DF1538883C
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 06:40:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D064630FB8EB;
	Sat, 10 Aug 2019 04:40:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB5DF100197A;
	Sat, 10 Aug 2019 04:40:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EBAE718005B9;
	Sat, 10 Aug 2019 04:40:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7A4dus8001052 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 00:39:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 004041001B12; Sat, 10 Aug 2019 04:39:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE98E1001B07
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 04:39:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 568503DE0B
	for <dm-devel@redhat.com>; Sat, 10 Aug 2019 04:39:52 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f72so7477791wmf.5
	for <dm-devel@redhat.com>; Fri, 09 Aug 2019 21:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sr/zw12oaV0tFYuK6So8cdvlVZQffOlnt1O8uVTE8/A=;
	b=VmyOY5Ra89SwHutLuCooN7L4rHx7jBchuaQusIv7w7GvWVvV7wbGCM5xtqKARpgVNw
	fpV43QJBKXyjHV3GyUxz389KeSpTGALHK7X9I4BfxuUGirvNqt+025AovTONWPSQRSUa
	jRkbz3YGHRDHEwyaFAXtmfodWhrtQY53egXDJ4SKhxRNN8azovI2Tp2+JVEbLlXqPjrC
	woXv9pPh8hOuq9ObtUPJZ8bPIYVQ0t5jo7l/Tqwy3sRFH/WYbwr5GzPC9SGBAxv0JpIM
	FbtgwUba7+NHqeFt6/IpJyKxkzSe8vJ5EniifW8jf9aVDXjZfuIWfKrzI5JhMAXg3kRv
	1Qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sr/zw12oaV0tFYuK6So8cdvlVZQffOlnt1O8uVTE8/A=;
	b=oo+SGt0kpT52yHhsRrBYdzOq+v7Izp9dLRuloGk2oDuwktEe40DvWlGR6ZdeiE5/x0
	Vfge3ZXxrSCS/PxS2HDEGmc4KZOrvlW76EFOKwuV5hjeKq3zZD1fpY1yqsvnbGhENXPA
	SGz7uJo5Au6B7wjAGJc08L3tFCLakfcBklhFKhaKlhH4eRSZAKtmpqR6dRzs/LQLEA57
	OwEGe54wEyDydLaKjxiVUHZWhyI+GONGkPJHMNFk3tmrXN1Oc+Kf3N+6K7N28eDJ22xk
	Rtkrjr9YwY2zeuHtjaOx2S7V6yD3nqnsKAXktoYnpifJZgpBKne46D9NrhS8DkSYJfPm
	Shww==
X-Gm-Message-State: APjAAAVbrm0bSnk7xMWsVn0jThHQo5B/TkvVwPq1525SfvtgimGZGRUc
	ep1TsoG4sG8kjMKwyrgs8i+SlZeR9wHFyrsiuJ19bg==
X-Google-Smtp-Source: APXvYqw32jl/rEhhkWYtE8QXGrQYkQpqnBb27Hr1AdgKPkLqwjAlVpRZWLqEvO21GkblI2++t+WWziHZIpEet2juMiI=
X-Received: by 2002:a05:600c:2255:: with SMTP id
	a21mr13465304wmm.119.1565411990875; 
	Fri, 09 Aug 2019 21:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKv+Gu9C2AEbb++W=QTVWbeA_88Fo57NcOwgU5R8HBvzFwXkJw@mail.gmail.com>
	<MN2PR20MB2973C378AE5674F9E3E29445CAC60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-8n_DoauycDQS_9zzRew1rTuPaLxHyg6xhXMmqEvMaCA@mail.gmail.com>
	<MN2PR20MB2973CAE4E9CFFE1F417B2509CAC10@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-j-8-bQS2A46-Kf1KHtkoPJ5Htk8WratqzyngnVu-wpw@mail.gmail.com>
	<MN2PR20MB29739591E1A3E54E7A8A8E18CAC00@MN2PR20MB2973.namprd20.prod.outlook.com>
	<20f4832e-e3af-e3c2-d946-13bf8c367a60@nxp.com>
	<VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
	<MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
In-Reply-To: <MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sat, 10 Aug 2019 07:39:38 +0300
Message-ID: <CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Sat, 10 Aug 2019 04:39:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Sat, 10 Aug 2019 04:39:52 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Sat, 10 Aug 2019 04:40:32 +0000 (UTC)

On Fri, 9 Aug 2019 at 23:57, Pascal Van Leeuwen
<pvanleeuwen@verimatrix.com> wrote:
>
> > -----Original Message-----
> > From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> > Sent: Friday, August 9, 2019 7:49 PM
> > To: Horia Geanta <horia.geanta@nxp.com>
> > Cc: Herbert Xu <herbert@gondor.apana.org.au>; Pascal Van Leeuwen
> > <pvanleeuwen@verimatrix.com>; Milan Broz <gmazyland@gmail.com>; dm-devel@redhat.com; linux-
> > crypto@vger.kernel.org
> > Subject: Re: [dm-devel] xts fuzz testing and lack of ciphertext stealing support
> >
> > On Fri, 9 Aug 2019 at 10:44, Horia Geanta <horia.geanta@nxp.com> wrote:
> > >
> > > On 8/9/2019 9:45 AM, Ard Biesheuvel wrote:
> > > > On Fri, 9 Aug 2019 at 05:48, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> > > >>
> > > >> On Thu, Aug 08, 2019 at 06:01:49PM +0000, Horia Geanta wrote:
> > > >>>
> > > >>> -- >8 --
> > > >>>
> > > >>> Subject: [PATCH] crypto: testmgr - Add additional AES-XTS vectors for covering
> > > >>>  CTS (part II)
> > > >>
> > > >> Patchwork doesn't like it when you do this and it'll discard
> > > >> your patch.  To make it into patchwork you need to put the new
> > > >> Subject in the email headers.
> > > >>
> > > >
> > > > IMO, pretending that your XTS implementation is compliant by only
> > > I've never said that.
> > > Some parts are compliant, some are not.
> > >
> > > > providing test vectors with the last 8 bytes of IV cleared is not the
> > > > right fix for this issue. If you want to be compliant, you will need
> > > It's not a fix.
> > > It's adding test vectors which are not provided in the P1619 standard,
> > > where "data unit sequence number" is at most 5B.
> > >
> >
> > Indeed. But I would prefer not to limit ourselves to 5 bytes of sector
> > numbers in the test vectors. However, we should obviously not add test
> > vectors that are known to cause breakages on hardware that works fine
> > in practice.
> >
> Well, obviously, the full 16 byte sector number vectors fail on existing
> CAAM hardware, which I do assume to work fine in practice. And you know
> I'm not in favor of building all kinds of workarounds into the drivers.
>
> Fact is, we know there are no current users that need more than 64 bits
> of IV. Fact is also that having 64 bits of IV in the vectors is already
> an improvement over the 40 bits in the original vectors. And unlike CTS,
> I am not aware of any real use case for more than 64 bits.
> Finally, another fact is that limiting the *vectors* to 64 bits of IV
> does not prohibit anyone from *using* a full 128 bit IV on an
> implementation that *does* support this. I would think most users of
> XTS, like dmcrypt, would allow you to specify the cra_drivername
> explictly anyway, so just don't select legacy CAAM if you need that.
> (heck, if it would be reading and writing its own data, and not need
> compatibility with other implementations, it wouldn't even matter)
>
> So yes, the specs are quite clear on the sector number being a full
> 128 bits. But that doesn't prevent us from specifying that the
> crypto API implementation currently only supports 64 bits, with the
> remaining bits being forced to 0. We can always revisit that when
> an actual use case for more than 64 bits arises ...
>

You have got it completely backwards:

CTS has never worked in any kernel implementation, so regardless of
what the spec says, supporting it in the kernel is not a high priority
issue whichever way you put it. Now is the first time anyone has asked
for it in 12 years, and only because someone spotted a deviation
between a h/w and a s/w implementation, not because anyone tried to
use it and failed. (Note that passing anything other than a multiple
of the block size will cause an error rather than fail silently)

Truncated IVs are a huge issue, since we already expose the correct
API via AF_ALG (without any restrictions on how many of the IV bits
are populated), and apparently, if your AF_ALG request for xts(aes)
happens to be fulfilled by the CAAM driver and your implementation
uses more than 64 bits for the IV, the top bits get truncated silently
and your data might get eaten.

In my experience, users tend to care more about the latter than the former.


> > > > to provide a s/w fallback for these cases.
> > > >
> > > Yes, the plan is to:
> > >
> > > -add 16B IV support for caam versions supporting it - caam Era 9+,
> > > currently deployed in lx2160a and ls108a
> > >
> > > -remove current 8B IV support and add s/w fallback for affected caam versions
> > > I'd assume this could be done dynamically, i.e. depending on IV provided
> > > in the crypto request to use either the caam engine or s/w fallback.
> > >
> >
> > Yes. If the IV received from the caller has bytes 8..15 cleared, you
> > use the limited XTS h/w implementation, otherwise you fall back to
> > xts(ecb-aes-caam..).
>
> Regards,
> Pascal van Leeuwen
> Silicon IP Architect, Multi-Protocol Engines @ Verimatrix
> www.insidesecure.com
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
