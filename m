Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7616C9D5
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jul 2019 09:16:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CCE193022466;
	Thu, 18 Jul 2019 07:16:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 493455C205;
	Thu, 18 Jul 2019 07:16:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6E3361800206;
	Thu, 18 Jul 2019 07:16:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6I7FuQw032619 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jul 2019 03:15:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D3E281001B2C; Thu, 18 Jul 2019 07:15:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CED391001947
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:15:54 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6B07959440
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 07:15:53 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v15so24461793wml.0
	for <dm-devel@redhat.com>; Thu, 18 Jul 2019 00:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IyU7RhLs3nexL5XSfrBFHZGbJqE/bFU1qysLbSwPyVo=;
	b=yMWCjmgPhjd+LDHLWy0TfNvmI5s6jQSyQ+ScEsq8JcS355xU1N2kHOoUB29Dl18W13
	kD69QetMlfdNdf7hrDns9OJkf6dHuA2uz0TCEFNKMsTTNB5w/cL+sdwVWAqfeNrLMM3U
	F++1McxJgSCI92IqJvfAqg/wSPOFHVLIGz1ugoyp6r5NRESd/tLRW0saZ6qg977spLjD
	cx0LcdoNrUUJw0KSjhCEGd0lyEErzRDZszGb28DmpcWzaJ9ltznhSSfK+AhN0aRb+ziX
	thgs5PMArqzIKuezFcmyLItpmpcBWSsioskwSQuHXP23o5iWrrBx1zbD5TuTeDmAVrmL
	6e7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IyU7RhLs3nexL5XSfrBFHZGbJqE/bFU1qysLbSwPyVo=;
	b=O96qEq7ID+jBlfdUhYl6JJgiUHGBSDoAhgLK2SXOQFsH5iADcE7bj2VUrLPE0p3kH6
	cJmu9UlnuhmGmo+DgXA1On9Y93McjmY8seP2UN1fLU6f4PZ6ra2FhMsYxBil27My3AaB
	6BsllNLZSwAZYz8KYGs1DmLAR4NpKTLhVq/NQBNI0i6CUAUY+gcusCJs+xyqb5CxvrpC
	mB/NAJEQerMliiGR2HcR9xhcbyN7ahdiaUUHOCeiu1Xt/XTVTkOAPyPHCN8/az+Pi4ry
	CbAoXEP6Y/mHFZJ6bYtQoA5B3KV5Y6HlymIJeeWWXNolFH/RgoJwL6efkleb9AYkASG0
	UmJA==
X-Gm-Message-State: APjAAAVAHn6cPR+tvwvFPwjsG/Fl0i1fWKcFqmSQcqYJXeoJ6/44OsMC
	JUoqVr1qAGn6GTuB08s3s8HOGKBDrDR8pgYzTcPOZw==
X-Google-Smtp-Source: APXvYqx0U4XKWFnfxvhfk4eFFQ7yQE5LtpnCH6zwJdvkYVmJ7Z+Jl6fTN7vccxs/8QWAGmCUgRsOc7JTTlkQ34GnwRQ=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr37237828wmj.61.1563434151974; 
	Thu, 18 Jul 2019 00:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR0402MB34858E4EF0ACA7CDB446FF5798CE0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190716221639.GA44406@gmail.com>
	<VI1PR0402MB34857BBB18C2BB8CBA2DEC7198C90@VI1PR0402MB3485.eurprd04.prod.outlook.com>
	<20190717172823.GA205944@gmail.com>
	<CAKv+Gu__offPaWvyURJr8v56ig58q-Deo16QhP26EJ32uf5m3w@mail.gmail.com>
	<20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
In-Reply-To: <20190718065223.4xaefcwjoxvujntw@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 18 Jul 2019 09:15:39 +0200
Message-ID: <CAKv+Gu9-EWNpJ9viSsjhYRdOZb=7a=Mpddmyt8SLEq9aFtawjg@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jul 2019 07:15:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Thu, 18 Jul 2019 07:15:53 +0000 (UTC) for IP:'209.85.128.44'
	DOMAIN:'mail-wm1-f44.google.com' HELO:'mail-wm1-f44.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.44 mail-wm1-f44.google.com 209.85.128.44
	mail-wm1-f44.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 18 Jul 2019 07:16:13 +0000 (UTC)

On Thu, 18 Jul 2019 at 08:52, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Jul 17, 2019 at 08:08:27PM +0200, Ard Biesheuvel wrote:
> >
> > Since the kernel does not support CTS for XTS any way, and since no
> > AF_ALG users can portably rely on this, I agree with Eric that the
> > only sensible way to address this is to disable this functionality in
> > the driver.
>
> But the whole point of XTS is that it supports sizes that are
> not multiples of the block size.  So implementing it without
> supporting ciphertext stealing is just wrong.
>
> So let's fix the generic implementation rather than breaking
> the caam driver.
>

Not just the generic implementation: there are numerous synchronous
and asynchronous implementations of xts(aes) in the kernel that would
have to be fixed, while there are no in-kernel users that actually
rely on CTS. Also, in the cbc case, we support CTS by wrapping it into
another template, i.e., cts(cbc(aes)).

So retroactively redefining what xts(...) means seems like a bad idea
to me. If we want to support XTS ciphertext stealing for the benefit
of userland, let's do so via the existing cts template, and add
support for wrapping XTS to it.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
