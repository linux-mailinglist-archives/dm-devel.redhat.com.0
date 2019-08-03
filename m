Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1748051C
	for <lists+dm-devel@lfdr.de>; Sat,  3 Aug 2019 09:44:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0C07E30EA198;
	Sat,  3 Aug 2019 07:44:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 09D615C207;
	Sat,  3 Aug 2019 07:44:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B9E41800204;
	Sat,  3 Aug 2019 07:44:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x737axhe015116 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 3 Aug 2019 03:36:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C87CA5D9E5; Sat,  3 Aug 2019 07:36:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2A2E5D9E2
	for <dm-devel@redhat.com>; Sat,  3 Aug 2019 07:36:57 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 565FC2DE49
	for <dm-devel@redhat.com>; Sat,  3 Aug 2019 07:36:56 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id n9so54326269wrr.4
	for <dm-devel@redhat.com>; Sat, 03 Aug 2019 00:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=An8x8wOSPqi5lMEbM0lGEptSaInz+eauyvu67l7VMQM=;
	b=wHwlfmzW1gh05xb3up6bhuDJtGl0ShuJ+bdWBNfLCp8DXO31Zr2BqqUPa+yri2uW0B
	2NbWBjOxM9dD2xsI/5T4QaQOgfSP/zVVw8bufZc1RCE8cqc0CQVJBRDbYRIG1ejQvbXh
	CmOZAlrkyWY2qasVr2XuiB/WjK5Qf4HMSzcdNGi4/fgHfpSMoBXv/Jo3YyHkvhJYYuzX
	HnlmpmcjvwLRzPFGl+r26liiFYwXemWFIcuPkiRnxkXAHnqMeGcAPtc8yZ8gEWCa/Y/z
	FFN0yYy58LLG4e9Ig+qr8ZDCixGKyj3blLIEqHscyUXNsTZJBj/cc9DIhqTx6uC0WzDB
	mwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=An8x8wOSPqi5lMEbM0lGEptSaInz+eauyvu67l7VMQM=;
	b=Rs7yyW+eJsFR/PZEXfAP6X++OAvax11gX+6fOgOEGWIqpW5ArnFZREfbJ3BAhoSSVB
	CTCuI/A7eQD3/BGszRZK2mfKOsh46wABtUTANc1ZFMBCHaEPZNaDJxM/8ZkMRx6IktzD
	KjZhjffxCKXTYPOrPtILIcNeUEzTj7nlsVaP6ebJwr+IiHUeUBgdonHGWCAr8EqNv6dg
	0Br/p6N3FLajKOhysM5daDSCiQSvfEvVaLgVZNF+AlKhLsbbibF5ZO8hVWSHoVRgOO3A
	sNUOjjeT8VJJlibf8NOgS1eag0TGGY1k4m4HuCbbEgE1m1z09bJ+z0P25qq3Bgr2zlrb
	Sspw==
X-Gm-Message-State: APjAAAU8WEkqGKHftIsYDTaEJQ+lwO86lxbtqaNjrPECq3Vsk9iGbpC/
	Uz1UT+Sg1XijXpMZeD5/aXmbxkUM/mV09AP8wBNexw==
X-Google-Smtp-Source: APXvYqx3Ws7aJOrJvumZinbBKEWsyCeSAzY7R1Rd1jZRw8ZpwVXzm6F+XQGJUIbwVayBtHfpRZ1eWFoLdQNzR+/f+q0=
X-Received: by 2002:a5d:46cf:: with SMTP id g15mr14016374wrs.93.1564817814955; 
	Sat, 03 Aug 2019 00:36:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190704183017.31570-2-ard.biesheuvel@linaro.org>
	<20190726043117.GA654@gondor.apana.org.au>
	<CAKv+Gu_Pir7uU4h6GQfh2my2Fu-j2AGPLWNZKzc9_iG6n4xJNA@mail.gmail.com>
	<20190802035515.GA15758@gondor.apana.org.au>
In-Reply-To: <20190802035515.GA15758@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sat, 3 Aug 2019 10:36:44 +0300
Message-ID: <CAKv+Gu_a-tpc4+b4aopGZxHizkOgnqkFMCTzeF0uFo5iXXf24Q@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Sat, 03 Aug 2019 07:36:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Sat, 03 Aug 2019 07:36:56 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v8 1/7] crypto: essiv - create wrapper
	template for ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Sat, 03 Aug 2019 07:44:50 +0000 (UTC)

On Fri, 2 Aug 2019 at 06:55, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Fri, Jul 26, 2019 at 12:00:20PM +0300, Ard Biesheuvel wrote:
> >
> > For Y and Z, it is not straightforward either: since the crypto API
> > permits the use of driver names in addition to the plain CRA names,
> > we'd have to infer from the first parameter which cipher is being
> > used.
>
> We don't really permit that.  It might work but it is certainly not
> guaranteed to work.  The only thing we guarantee is that the
> algorithm name and the canonical driver name will work.  For example,
> with gcm you can either say gcm(aes) or gcm_base(drv_name1, drv_name2).
>
> Anything else is not supported.
>

Understood. But that is not the problem.

The problem is that we want to instantiate a cipher based on the
cipher algorithm that is encapsulated by the skcipher, and how that is
encoded in the name is not straightforward.

To use your GCM analogy: gcm_base(ctr-ppc-spe, ghash-generic) is a
supported aead identifier, but  there is nothing in the name that
identifies the skcipher as one that encapsulates AES.

> So I would envisage something similar for essiv where essiv just has
> U, X and Y (as you said that U and X are independent) while you can
> then have an essiv_base that spells everything out in detail.
>

That might be a useful enhancement by itself, but it does not fix the
issue above. The only way to instantiate the same cipher as the one
encapsulated by "cbc-ppc-spe" is to instantiate the latter, parse the
cipher name and pass it to crypto_alloc_cipher()

> Also, do we allow anything other than HMAC for X? If not then that
> should be encoded either into the name by dropping the hmac in the
> algorithm name and adding it through the driver name, or by checking
> for it in the template creation function.
>
> What I'd like to achieve is a state where we support only what is
> currently supported and no more.
>

Yeah, that makes sense. But we have h/w drivers that instantiate
authenc(X,Y) in its entirety, and passing those driver names is
something that is supported today, so we can't just remove that.

> > > Because this is legacy stuff, I don't want it to support any more
> > > than what is currently being supported by dm-crypt.
> > >
> > > Similary for the skcipher case, given
> > >
> > >         essiv(cbc(X),Y,Z)
> > >
> > > is it ever possible for X != Y? If not then we should just make the
> > > algorithm name essiv(X,Z).
> > >
> >
> > Same problem. We'd need to instantiate the skcipher and parse the cra_name.
> >
> > Perhaps we should introduce a crypto API call that infers the cra_name
> > from a cra_driver_name?
>
> You don't need to do that.  Just copy whatever gcm does in its
> creation function when you invoke it as gcm_base.
>
> Thanks,
> --
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
