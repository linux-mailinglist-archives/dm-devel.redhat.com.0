Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E68476C063
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 19:28:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5932885550;
	Wed, 17 Jul 2019 17:28:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6153A1001DE3;
	Wed, 17 Jul 2019 17:28:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 105191800202;
	Wed, 17 Jul 2019 17:28:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HHSVGK028838 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 13:28:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2ACC218687; Wed, 17 Jul 2019 17:28:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 254F45E7AD
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 17:28:27 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C866930833BE
	for <dm-devel@redhat.com>; Wed, 17 Jul 2019 17:28:26 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 0DBBF21743;
	Wed, 17 Jul 2019 17:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563384506;
	bh=N+UJ7GLw1U0qClVIF6cFvFlLcWkWCzd2SdKdwTn5VpA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YE2wx4/JYyxfTYWWnmlWVt958TMYn6Zd2YSukcN8+ozrb3s30q6/tjIRem5IxCBFz
	16VDbFDJWCXDGSqRqcwWIGSd7GyixZQb4Ow1a7rTmi7v1g4INAHoAq2mGopZuIrOG3
	8Lv/qfkEpQfpvfDp+raa/I0/QqQ/wsFMMFuKNpRU=
Date: Wed, 17 Jul 2019 10:28:24 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Horia Geanta <horia.geanta@nxp.com>
Message-ID: <20190717172823.GA205944@gmail.com>
Mail-Followup-To: Horia Geanta <horia.geanta@nxp.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Wed, 17 Jul 2019 17:28:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Wed, 17 Jul 2019 17:28:26 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.302  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 17 Jul 2019 17:28:45 +0000 (UTC)

On Wed, Jul 17, 2019 at 05:09:31PM +0000, Horia Geanta wrote:
> On 7/17/2019 1:16 AM, Eric Biggers wrote:
> > Hi Horia,
> > 
> > On Tue, Jul 16, 2019 at 05:46:29PM +0000, Horia Geanta wrote:
> >> Hi,
> >>
> >> With fuzz testing enabled, I am seeing xts(aes) failures on caam drivers.
> >>
> >> Below are several failures, extracted from different runs:
> >>
> >> [    3.921654] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=40 klen=64"; expected_error=-22, cfg="random: inplace use_finup nosimd src_divs=[57.93%@+11, 37.18%@+164, <reimport>0.68%@+4, 0.50%@+305, 3.71%@alignmask+3975]" 
> >>
> >> [    3.726698] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=369 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@alignmask+584]" 
> >>
> >> [    3.741082] alg: skcipher: xts-aes-caam encryption unexpectedly succeeded on test vector "random: len=2801 klen=64"; expected_error=-22, cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+6] iv_offset=18"
> >>
> >> It looks like the problem is not in CAAM driver.
> >> More exactly, fuzz testing is generating random test vectors and running
> >> them through both SW generic (crypto/xts.c) and CAAM implementation:
> >> -SW generic implementation of xts(aes) does not support ciphertext stealing
> >> and throws -EINVAL when input is not a multiple of AES block size (16B)
> >> -caam has support for ciphertext stealing, and allows for any input size
> >> which results in "unexpectedly succeeded" error messages.
> >>
> >> Any suggestion how this should be fixed?
> >>
> >> Thanks,
> >> Horia
> > 
> > I don't think drivers should allow inputs the generic implementation doesn't,
> > since those inputs aren't tested by the crypto self-tests (so how do you know
> How about implementation adding static test vectors and using them to validate
> the standard feature set that's not supported by the generic implementation?
> 
> > it's even correct?), and people could accidentally rely on the driver-specific
> > behavior and then be unable to migrate to another platform or implementation.
> > 
> People could also *intentionally* rely on a driver offering an implementation
> that is closer to the spec / standard.
> 
> > So for now I recommend just updating the caam driver to return -EINVAL on XTS
> > inputs not evenly divisible by the block size.
> > 
> I was hoping for something more constructive...
> 
> > Of course, if there are actual use cases for XTS with ciphertext stealing in the
> > kernel, we could add it to all the other implementations too.  But I'm not aware
> > of any currently.  Don't all XTS users in the kernel pass whole blocks?
> > 
> That's my guess too.
> 
> What about user space relying on offloading and xts working
> according to the spec?
> 

Sure, AF_ALG users could expect ciphertext stealing to work.  I don't know of
any actual examples of people saying they want it, but it's possible.

My point is simply that we add this, we need to find a way to support it in all
implementations.  It's not helpful to add it to only one specific driver, as
then it's inconsistent and is untestable with the common tests.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
