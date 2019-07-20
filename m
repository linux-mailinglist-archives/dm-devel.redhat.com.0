Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C47F16EE1A
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jul 2019 08:58:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1F21581F0C;
	Sat, 20 Jul 2019 06:58:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80BAD5C298;
	Sat, 20 Jul 2019 06:58:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 032654E58E;
	Sat, 20 Jul 2019 06:58:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6K6wDNt016732 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jul 2019 02:58:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 01EC85D70D; Sat, 20 Jul 2019 06:58:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0C3662660
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 06:58:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AA5E0309BB7D
	for <dm-devel@redhat.com>; Sat, 20 Jul 2019 06:58:09 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BC18E21873;
	Sat, 20 Jul 2019 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563605889;
	bh=OFZAHQHXLV8GwXYrMSGu/SOmauNVVlNoeQquIaDV4sg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2GwRSuZC0c9rkYEqR9wXTttGef4p2LVlv9kQc/mhRUi6jC9Kdbzw58EUyS9cKb8xH
	aUEJWIQyPe8x70Kgu0U8Ql9DAn+hLv77YXg1Le91HwmYfDGa5iEBwechIsO2RsbHWr
	2u/lUp7HMyk0KqUUG2/wVX+A9JoxKsG3BNu47G00=
Date: Fri, 19 Jul 2019 23:58:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Milan Broz <gmazyland@gmail.com>
Message-ID: <20190720065807.GA711@sol.localdomain>
Mail-Followup-To: Milan Broz <gmazyland@gmail.com>,
	Pascal Van Leeuwen <pvanleeuwen@verimatrix.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Horia Geanta <horia.geanta@nxp.com>
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
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b042649c-db98-9710-b063-242bdf520252@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Sat, 20 Jul 2019 06:58:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Sat, 20 Jul 2019 06:58:09 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Sat, 20 Jul 2019 06:58:45 +0000 (UTC)

On Thu, Jul 18, 2019 at 01:19:41PM +0200, Milan Broz wrote:
> 
> > From that perspective - to prevent people from doing cryptographically stupid things -
> > IMHO it would be better to just pull the CTS into the XTS implementation i.e. make
> > xts natively support blocks that are not a multiple of (but >=) the cipher blocksize ...
> 
> I would definitely prefer adding CTS directly to XTS (as it is in gcrypt or OpenSSL now)
> instead of some new compositions.
> 
> Also, I would like to avoid another "just because it is nicer" module dependence (XTS->XEX->ECB).
> Last time (when XTS was reimplemented using ECB) we have many reports with initramfs
> missing ECB module preventing boot from AES-XTS encrypted root after kernel upgrade...
> Just saying. (Despite the last time it was keyring what broke encrypted boot ;-)
> 

Can't the "missing modules in initramfs" issue be solved by using a
MODULE_SOFTDEP()?  Actually, why isn't that being used for xts -> ecb already?

(There was also a bug where CONFIG_CRYPTO_XTS didn't select CONFIG_CRYPTO_ECB,
but that was simply a bug, which was fixed.)

Or "xts" and "xex" could go in the same kernel module xts.ko, which would make
this a non-issue.

Anyway, I agree that the partial block support, if added, should just be made
available under the name "xts", as people would expect.  It doesn't need a new
name.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
