Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A736C9EE
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 09:29:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E780300CB0B;
	Thu, 18 Jul 2019 07:29:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EF1B5C553;
	Thu, 18 Jul 2019 07:29:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DFDBE4E58F;
	Thu, 18 Jul 2019 07:29:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I7SJB6002570 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 03:28:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C696660C4C; Thu, 18 Jul 2019 07:28:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFE5360C44
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:28:17 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 52209300CB25
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:28:16 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id r1so27449987wrl.7
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 00:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=zllCHY/cRVRmhrsSL2iE9WJ0AIohaFe+eHpEOu+sQFU=;
	b=DIY9XY4hX0T14cuJ8OXQjvqwvkd8HuXVjCn8+rlK9CzCPUk7Z2b9cQCkW050Iw+bU3
	vzsaPfEoTSeO6wjM8un9rUwFoJQg6XOcDGUMF6e2S7S0OHJVV5qVVl6IrSZbp+PM/qWF
	K5ZQGoj8N1RHbS4JLMDLW3PCncnpUjzLBMTlO0VSNquypJAHwbRAnWdedaIrbkrEp/Fn
	+shvmAqjwoOYk8T81uHzdFlQ9YHyTodFR+bomNzRarWRE99eoj2xS5rNnM+DicYvBy+F
	u+cEWVtXyuCSFvcNE3PSdP/+ahNIQpZiWjkIjH4126nhKXJi20AxH03Rk6qz4HepOBvI
	J84A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zllCHY/cRVRmhrsSL2iE9WJ0AIohaFe+eHpEOu+sQFU=;
	b=qljg5arset8V5DkBfw7xUAPcDsBuFP3Ylv2jtyAcoBmEOXlOuIo+ulQwfLYf7F4v9x
	qBpXP0vEILvQgc/45H6jPNT/Md4zZJ06hEVCBNUJ0rlZRtEEfLu3l4VoqHjBFQQsiTvo
	x+jiB5XhWjklAosx9xS3TjNSirx31PG/HRLReA7ughWJunUQBIMB5To8Ce651Av/bAaT
	Fgkx951q74v18oZqSllINyAoldx9bUKoDm0BFOhgs8K8jj6oPjcxgnCG3FyHDuCCrBO5
	0lqoYxvDOtvbvm5e6d+9+KDJJuiDiF4KZ+z1gZ6chNRt3nwF/ALex1XT7tW3msFzhMQh
	M+RQ==
X-Gm-Message-State: APjAAAXEJbB1c6svbGiNZ5vxMVYNGFjxNDtHGnnZakHg6oN1GgxdSLKC
	19d+41kKz2Jp8VFLoKLFcFhYN5XtRvAklOZX8scgfy+TMU9baA==
X-Google-Smtp-Source: APXvYqz2KeADeEBZzbaWHI9EeYR4xSsmdE03VIrqg0AqBBcAwB+aC1wb3gUSXW1Tue7fJA098aG2FYk0jpQIXxnujZ8=
X-Received: by 2002:adf:e8c2:: with SMTP id k2mr33687652wrn.198.1563434894890; 
	Thu, 18 Jul 2019 00:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
	<CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
	<20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
In-Reply-To: <20190718072154.m2umem24x4grbf6w@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 18 Jul 2019 09:28:03 +0200
Message-ID: <CAKv+Gu_CVBKUkb19yPPHJp3HcnAgxRn834yfKHcuUD5A69786g@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Thu, 18 Jul 2019 07:28:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Thu, 18 Jul 2019 07:28:16 +0000 (UTC) for IP:'209.85.221.43'
	DOMAIN:'mail-wr1-f43.google.com' HELO:'mail-wr1-f43.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.43 mail-wr1-f43.google.com 209.85.221.43
	mail-wr1-f43.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Thu, 18 Jul 2019 07:29:20 +0000 (UTC)

On Thu, 18 Jul 2019 at 09:22, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Jul 18, 2019 at 09:15:39AM +0200, Ard Biesheuvel wrote:
> >
> > Not just the generic implementation: there are numerous synchronous
> > and asynchronous implementations of xts(aes) in the kernel that would
> > have to be fixed, while there are no in-kernel users that actually
> > rely on CTS. Also, in the cbc case, we support CTS by wrapping it into
> > another template, i.e., cts(cbc(aes)).
> >
> > So retroactively redefining what xts(...) means seems like a bad idea
> > to me. If we want to support XTS ciphertext stealing for the benefit
> > of userland, let's do so via the existing cts template, and add
> > support for wrapping XTS to it.
>
> XTS without stealing should be renamed as XEX.  Sure you can then
> wrap it inside cts to form xts but the end result needs to be called
> xts.
>

If we were adding XTS to the kernel today, then I would agree with
you. But xts() has an established meaning now, and I don't think it
makes sense to update all implementations for a theoretical use case,
given that no portable userland code can rely on the correct semantics
today, since CAAM is the only one that implements them correctly.

In any case, I won't have time to fix the ARM or arm64 implementations
(or review the changes if someone else steps up) until the end of
September.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
