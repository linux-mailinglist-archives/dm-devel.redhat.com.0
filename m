Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 577296CA50
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 09:51:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E9CA730832DA;
	Thu, 18 Jul 2019 07:51:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 970635D719;
	Thu, 18 Jul 2019 07:51:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E400E54D3C;
	Thu, 18 Jul 2019 07:51:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I7ostE006058 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 03:50:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CFC6C60A35; Thu, 18 Jul 2019 07:50:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from deadmen.hmeau.com (ovpn-12-19.pek2.redhat.com [10.72.12.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82E6660920
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:50:52 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1ho1Bd-0000ca-IH; Thu, 18 Jul 2019 15:50:45 +0800
Received: from herbert by gondobar with local (Exim 4.89)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1ho1BZ-0005qk-5u; Thu, 18 Jul 2019 15:50:41 +0800
Date: Thu, 18 Jul 2019 15:50:41 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190718075041.2mutant44rxx2ipq@gondor.apana.org.au>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
	<CAKv+Gu_CVBKUkb19yPPHJp3HcnAgxRn834yfKHcuUD5A69786g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKv+Gu_CVBKUkb19yPPHJp3HcnAgxRn834yfKHcuUD5A69786g@mail.gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Horia Geanta <horia.geanta@nxp.com>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Thu, 18 Jul 2019 07:51:37 +0000 (UTC)

On Thu, Jul 18, 2019 at 09:28:03AM +0200, Ard Biesheuvel wrote:
>
> If we were adding XTS to the kernel today, then I would agree with
> you. But xts() has an established meaning now, and I don't think it
> makes sense to update all implementations for a theoretical use case,
> given that no portable userland code can rely on the correct semantics
> today, since CAAM is the only one that implements them correctly.
> 
> In any case, I won't have time to fix the ARM or arm64 implementations
> (or review the changes if someone else steps up) until the end of
> September.

I'm not asking you or anyone to fix this right away.  I'm just
saying that this is the direction we should be moving in.

After all, there is no immediate crisis as all that is broken
today is a fuzz test.

It should be possible to do this without causing performance
regressions for ARM.  We could rename the existing xts to a
new name (xek perhaps) and add xts into the cts template as
a wrapper around xek.

That way you don't have to touch the ARM code at all and it
should just work.

PS should we mark xek or whatever it's called as internal so
it isn't visible to user-space?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
