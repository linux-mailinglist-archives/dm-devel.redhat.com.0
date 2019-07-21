Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 013FF6F26E
	for <lists+dm-devel@lfdr.de>; Sun, 21 Jul 2019 11:51:08 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 94A38C057EC6;
	Sun, 21 Jul 2019 09:51:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 97EB25B683;
	Sun, 21 Jul 2019 09:50:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C5A21800205;
	Sun, 21 Jul 2019 09:50:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6L9oNUu020799 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 21 Jul 2019 05:50:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59A0B19C79; Sun, 21 Jul 2019 09:50:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 52F7D19C77
	for <dm-devel@redhat.com>; Sun, 21 Jul 2019 09:50:21 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDC0B59455
	for <dm-devel@redhat.com>; Sun, 21 Jul 2019 09:50:19 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id a15so32399407wmj.5
	for <dm-devel@redhat.com>; Sun, 21 Jul 2019 02:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RQaXx84yWJDYOO2wjLxF1QV6zoVPN9ZxOOdoAW7u+BM=;
	b=y8XAoLGX2iH50XgryNmDwfuWVYGdZdKO60N8llqHSZxaim56KJI6E/96fwVOtTeas8
	kmg0ecVjwc7CfZ5CIVqkbYmge0b5w+Y0qbwt21zcU7eOUr9FdXwqa5Ry1vFeH+ULOrSx
	7ikSE99Ar0WahmR5qHw2hfP+Cq9nmEywvod0EFfIu/uXMzhRd1LpUmj7rJ6BsIchkndQ
	YTVR5FcFgzXfN9333I5Pm6/OmmcEWCVFVKYpYBdw5Go3RPtQcDNON9XGJl8sRyBN5STL
	RdQE5ulvc3wlRC4S8t3OO4b7V7LAws/U52hD9Ru8Ik4TwOfh7oWrH8/5YIhaNcicxrNu
	NRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RQaXx84yWJDYOO2wjLxF1QV6zoVPN9ZxOOdoAW7u+BM=;
	b=jODdquMNQKxLgpwDb0k/6U5WJVx6aNtfbv8vVUACaSEq6f3KQ1MJcbRF/aG+yWfYc3
	f3xXatceVcqnIKlrQm3BdNdmmhPoiRuwe5IkvSKkYrbW4OKg/A8rCTkjnP4qMH+OcSuf
	aniSLwmgErHcBCArJblQDC5y7J8zPimxOdSPnrpiaKvI4nWoslMWZO6Nfj52OjryghHC
	ZN3bGdF/mdRQJ97Aj9N5HjLUITBedoLGltPMpesl+hViZgynIdIwC2wpKXc4J6LUFqE0
	63XvwYoNcW2I3HBFZXz+oBa42+oJXQzWgVzh0Je0qzrmyRoCPhJkPhO+hS8pkoBQonIt
	dZGQ==
X-Gm-Message-State: APjAAAWjvBLkbLXb4bmiTHe1C3ganfw564uM56fPGi7V1FtvqPbXzYcN
	tZIFelh2Dtn0fI8kpnlbc0qgv/dfQd3GeVOE0seYJOw9a6cTjQ==
X-Google-Smtp-Source: APXvYqye8yDdcXSDxXz1NeD+aCt85eq+4ajcVUtTYtafRYlbuL+czLGoNh21v0Bdz5CxdHGa/NFkDT+w3ALqZg6jyZQ=
X-Received: by 2002:a05:600c:20c1:: with SMTP id
	y1mr60152036wmm.10.1563702618401; 
	Sun, 21 Jul 2019 02:50:18 -0700 (PDT)
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
In-Reply-To: <0d4d6387-777c-bfd3-e54a-e7244fde0096@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 21 Jul 2019 12:50:06 +0300
Message-ID: <CAKv+Gu9UF+a1UhVU19g1XcLaEqEaAwwkSm3-2wTHEAdD-q4mLQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Sun, 21 Jul 2019 09:50:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sun, 21 Jul 2019 09:50:20 +0000 (UTC) for IP:'209.85.128.68'
	DOMAIN:'mail-wm1-f68.google.com' HELO:'mail-wm1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.68 mail-wm1-f68.google.com 209.85.128.68
	mail-wm1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Horia Geanta <horia.geanta@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Sun, 21 Jul 2019 09:51:06 +0000 (UTC)

On Sat, 20 Jul 2019 at 10:35, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 20/07/2019 08:58, Eric Biggers wrote:
> > On Thu, Jul 18, 2019 at 01:19:41PM +0200, Milan Broz wrote:
> >> Also, I would like to avoid another "just because it is nicer" module dependence (XTS->XEX->ECB).
> >> Last time (when XTS was reimplemented using ECB) we have many reports with initramfs
> >> missing ECB module preventing boot from AES-XTS encrypted root after kernel upgrade...
> >> Just saying. (Despite the last time it was keyring what broke encrypted boot ;-)
> >>
> >
> > Can't the "missing modules in initramfs" issue be solved by using a
> > MODULE_SOFTDEP()?  Actually, why isn't that being used for xts -> ecb already?
> >
> > (There was also a bug where CONFIG_CRYPTO_XTS didn't select CONFIG_CRYPTO_ECB,
> > but that was simply a bug, which was fixed.)
>
> Sure, and it is solved now. (Some systems with a hardcoded list of modules
> have to be manually updated etc., but that is just bad design).
> It can be done properly from the beginning.
>
> I just want to say that that switching to XEX looks like wasting time to me
> for no additional benefit.
>
> Fully implementing XTS does make much more sense for me, even though it is long-term
> the effort and the only user, for now, would be testmgr.
>
> So, there are no users because it does not work. It makes no sense
> to implement it, because there are no users... (sorry, sounds like catch 22 :)
>
> (Maybe someone can use it for keyslot encryption for keys not aligned to
> block size, dunno. Actually, some filesystem encryption could have use for it.)
>
> > Or "xts" and "xex" could go in the same kernel module xts.ko, which would make
> > this a non-issue.
>
> If it is not available for users, I really see no reason to introduce XEX when
> it is just XTS with full blocks.
>
> If it is visible to users, it needs some work in userspace - XEX (as XTS) need two keys,
> people are already confused enough that 256bit key in AES-XTS means AES-128...
> So the examples, hints, man pages need to be updated, at least.
>

OK, consider me persuaded. We are already exposing xts(...) to
userland, and since we already implement a proper subset of true XTS,
it will be simply a matter of making sure that the existing XTS
implementations don't regress in performance on the non-CTS code
paths.

It would be useful, though, to have some generic helper functions,
e.g., like the one we have for CBC, or the one I recently proposed for
CTS, so that existing implementations (such as the bit sliced AES) can
easily be augmented with a CTS code path (but performance may not be
optimal in those cases). For the ARM implementations based on AES
instructions, it should be reasonably straight forward to implement it
close to optimally by reusing some of the code I added for CBC-CTS
(but I won't get around to doing that for a while). If there are any
volunteers for looking into the generic or x86/AES-NI implementations,
please come forward :-) Also, if any of the publications that were
quoted in this thread have suitable test vectors, that would be good
to know.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
