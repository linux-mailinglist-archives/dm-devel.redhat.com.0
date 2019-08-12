Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C36E889673
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 06:52:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6325C81DE7;
	Mon, 12 Aug 2019 04:52:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A9BD69CB6;
	Mon, 12 Aug 2019 04:52:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11F4818005B9;
	Mon, 12 Aug 2019 04:51:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7C4pXH9004380 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 00:51:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 287416012D; Mon, 12 Aug 2019 04:51:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2BE769CB6
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 04:51:30 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hx2Ij-0004WY-3n; Mon, 12 Aug 2019 14:51:21 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hx2Ig-0004X1-Lf; Mon, 12 Aug 2019 14:51:18 +1000
Date: Mon, 12 Aug 2019 14:51:18 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>
Message-ID: <20190812045118.GA17383@gondor.apana.org.au>
References: <MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
	<MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
	<d6d0b155-476b-d495-3418-4b171003cdd7@gmail.com>
	<MN2PR20MB2973D499FDBC5652CC3FEE6BCAD00@MN2PR20MB2973.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MN2PR20MB2973D499FDBC5652CC3FEE6BCAD00@MN2PR20MB2973.namprd20.prod.outlook.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>, Horia Geanta <horia.geanta@nxp.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Mon, 12 Aug 2019 04:52:21 +0000 (UTC)

On Sun, Aug 11, 2019 at 09:29:38PM +0000, Pascal Van Leeuwen wrote:
>
> It will very likely fail with that CAAM h/w, but that only proves that you
> should not use plain64be IV's together with CAAM h/w. Which should be

It doesn't matter whether it's wrong or not.

The fact is that this is an interface that we export to user-space
and we must NEVER break that.  So if your driver is breaking this
interface then your driver is broken and needs to be fixed.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
