Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DC139893B6
	for <lists+dm-devel@lfdr.de>; Sun, 11 Aug 2019 22:35:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 73FB08C32C;
	Sun, 11 Aug 2019 20:35:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BCFDF579A;
	Sun, 11 Aug 2019 20:35:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 11E1A1C8A;
	Sun, 11 Aug 2019 20:35:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7BKYK4K023818 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 11 Aug 2019 16:34:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA1701726C; Sun, 11 Aug 2019 20:34:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C951C2
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 20:34:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DA5C9315C008
	for <dm-devel@redhat.com>; Sun, 11 Aug 2019 20:34:17 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2C18A208C2;
	Sun, 11 Aug 2019 20:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565555657;
	bh=zyT1J9izO43wde10EowpdqxvCnXXhgr2NVZbukgkcUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CLvhhSDarI/wDRTxJuVwt9RYXfG91H1jVia5EHiciPqlZrpDff5/3dIF5Vro1oy4D
	4ycK+28p68QG45ykghs3CbBKNIGCwJ3US7HezFXecIzfoKNjVnhLmIKtWOR/rpYvI8
	7v+1eAUDjJR4y3eo0+hdtKwcXSm0bIj17z/f44Ao=
Date: Sun, 11 Aug 2019 13:34:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190811203406.GA17421@sol.localdomain>
Mail-Followup-To: Milan Broz <gmazyland@gmail.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>
References: <VI1PR0402MB34856F03FCE57AB62FC2257998D40@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<MN2PR20MB2973127E4C159A8F5CFDD0C9CAD70@MN2PR20MB2973.namprd20.prod.outlook.com>
	<VI1PR0402MB3485689B4B65C879BC1D137398D70@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190809024821.GA7186@gondor.apana.org.au>
	<CAKv+Gu9hk=PGpsAWWOU61VrA3mVQd10LudA1qg0LbiX7DG9RjA@mail.gmail.com>
	<VI1PR0402MB3485F94AECC495F133F6B3D798D60@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<CAKv+Gu-_WObNm+ySXDWjhqe2YPzajX83MofuF-WKPSdLg5t4Ew@mail.gmail.com>
	<MN2PR20MB297361CA3C29C236D6D8F6F4CAD60@MN2PR20MB2973.namprd20.prod.outlook.com>
	<CAKv+Gu-xWxZ58tzyYoH_jDKfJoM+KzOWWpzCeHEmOXQ39Bv15g@mail.gmail.com>
	<d6d0b155-476b-d495-3418-4b171003cdd7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d6d0b155-476b-d495-3418-4b171003cdd7@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Sun, 11 Aug 2019 20:34:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Sun, 11 Aug 2019 20:34:17 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Horia Geanta <horia.geanta@nxp.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Sun, 11 Aug 2019 20:35:54 +0000 (UTC)

On Sun, Aug 11, 2019 at 01:12:56PM +0200, Milan Broz wrote:
> On 10/08/2019 06:39, Ard Biesheuvel wrote:
> > Truncated IVs are a huge issue, since we already expose the correct
> > API via AF_ALG (without any restrictions on how many of the IV bits
> > are populated), and apparently, if your AF_ALG request for xts(aes)
> > happens to be fulfilled by the CAAM driver and your implementation
> > uses more than 64 bits for the IV, the top bits get truncated silently
> > and your data might get eaten.
> 
> Actually, I think we have already serious problem with in in kernel (no AF_ALG needed).
> 
> I do not have the hardware, but please could you check that dm-crypt big-endian IV
> (plain64be) produces the same output on CAAM?
> 
> It is 64bit IV, but big-endian and we use size of cipher block (16bytes) here,
> so the first 8 bytes are zero in this case.
> 
> I would expect data corruption in comparison to generic implementation,
> if it supports only the first 64bit...
> 
> Try this:
> 
> # create small null device of 8 sectors,  we use zeroes as fixed ciphertext
> dmsetup create zero --table "0 8 zero"
> 
> # create crypt device on top of it (with some key), using plain64be IV
> dmsetup create crypt --table "0 8 crypt aes-xts-plain64be e8cfa3dbfe373b536be43c5637387786c01be00ba5f730aacb039e86f3eb72f3 0 /dev/mapper/zero 0"
> 
> # and compare it with and without your driver, this is what I get here:
> # sha256sum /dev/mapper/crypt 
> 532f71198d0d84d823b8e410738c6f43bc3e149d844dd6d37fa5b36d150501e1  /dev/mapper/crypt
> # dmsetup remove crypt
> 
> You can try little-endian version (plain64), this should always work even with CAAM
> dmsetup create crypt --table "0 8 crypt aes-xts-plain64 e8cfa3dbfe373b536be43c5637387786c01be00ba5f730aacb039e86f3eb72f3 0 /dev/mapper/zero 0"
> 
> # sha256sum /dev/mapper/crypt 
> f17abd27dedee4e539758eabdb6c15fa619464b509cf55f16433e6a25da42857  /dev/mapper/crypt
> # dmsetup remove crypt
> 
> # dmsetup remove zero
> 
> 
> If you get different plaintext in the first case, your driver is actually creating
> data corruption in this configuration and it should be fixed!
> (Only the first sector must be the same, because it has IV == 0.)
> 
> Milan
> 
> p.s.
> If you ask why we have this IV, it was added per request to allow map some chipset-based
> encrypted drives directly. I guess it is used for some data forensic things.
> 

Also, if the CAAM driver is really truncating the IV for "xts(aes)", it should
already be failing the extra crypto self-tests, since the fuzz testing in
test_skcipher_vs_generic_impl() uses random IVs.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
