Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id AABBC9263D
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 16:15:06 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9BBF53175283;
	Mon, 19 Aug 2019 14:15:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 71A9111C9B0;
	Mon, 19 Aug 2019 14:15:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C91CC24F32;
	Mon, 19 Aug 2019 14:14:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JEEVrx012413 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 10:14:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42C7B52CE; Mon, 19 Aug 2019 14:14:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3ADAF1C95A
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:14:28 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFCF66412F
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 14:14:27 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q12so8880418wrj.12
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 07:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wac/8K0PlB5YqvgpI9XB84WnEjzGgiNR49Px3uNmKW4=;
	b=XFkdapvjB9ydQEoU7RWQdtlXojOwik5hizdLU9r2m8gd/IMDBuB1WcWbX6GxKduW06
	eqfg/JzDDnFlhRAb3Zjg1PMHT/2+lIZDLxwtPzakUBcxeeih7FVPqv2b2dSq1hwIJ2qk
	IBMbtHQ4TCDt1a8B6opSINSLFpvToXarInaeq3ntBbVSmSMmAw+jz0Z1J6Q8opDqmOn2
	JCYj4LcgzpcebgU4w4n//XHtfjKUV/DwL+rFvZ/6La2TcOVHb59BvhcNvgMqWiiuLS7S
	bCUN0+cxlt5dQ+AP15mSrdAbsMRm9m3tpLEZCnAsihJhYy6R6f4XotpJfNYDS1d1ZHkI
	oICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wac/8K0PlB5YqvgpI9XB84WnEjzGgiNR49Px3uNmKW4=;
	b=pZvtsZ97VEvKfdcVZazLsjabmTGfUc7NlzLOOgLpfS2vQhpOem8tUOyOCVOMBpCIvN
	zqsiG+7VjLskFEzZ7JedLrXnLTkXTjTuvuKJ7uTdIj3pMQtb+5/uW2Znm1aqdh0cOqxy
	9GbuVVfLb9udvODoJmy7ojC6aoEMcRPRtbbxLaLExefhjTvXs7uq5ABJhfLsZ5bUDQHU
	z0zqQLtoWtFhuIz+R9FvDJrnq1OdEIgRmm9n6yNsiU2DTGpfcoYHaEMN2HL3m8oVsyPY
	QPkCMOt1uTObqhcKtnE+kg1gxA6ZXxb+b3gcOgPEjFYmmoyla4qDR8nIhEvnlZnFoFWW
	pdTA==
X-Gm-Message-State: APjAAAUR8Bdvt3E0dLWma+XTewvXd7P5Fbt5RxIJsPsJ+Q7wgPM54xwG
	HbjYv5/2pnLN4+51xr01uCA2p9zKzTUcopPGSRZhUg==
X-Google-Smtp-Source: APXvYqyBE/UN01L8CYsSaZNoiACjd0jezpOPjy9k/djrhLklovSa5FgtQ4n+jR3Kahaa/J3jbjg98BO3QOEQVhK/O3w=
X-Received: by 2002:a5d:5450:: with SMTP id w16mr14907929wrv.174.1566224066287;
	Mon, 19 Aug 2019 07:14:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
	<20190815192858.28125-2-ard.biesheuvel@linaro.org>
	<20190819063218.GA31821@gondor.apana.org.au>
In-Reply-To: <20190819063218.GA31821@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 19 Aug 2019 17:14:25 +0300
Message-ID: <CAKv+Gu9Zcaq5gygGtgmf5f4L6U6sBDd0CVAzrBydjiLDenyrag@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 19 Aug 2019 14:14:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 19 Aug 2019 14:14:27 +0000 (UTC) for IP:'209.85.221.67'
	DOMAIN:'mail-wr1-f67.google.com' HELO:'mail-wr1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.101  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.67 mail-wr1-f67.google.com 209.85.221.67
	mail-wr1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v12 1/4] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 19 Aug 2019 14:15:05 +0000 (UTC)

On Mon, 19 Aug 2019 at 09:32, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Thu, Aug 15, 2019 at 10:28:55PM +0300, Ard Biesheuvel wrote:
> >
> > +     /* Synchronous hash, e.g., "sha256" */
> > +     ictx->hash = crypto_alloc_shash(shash_name, 0, 0);
> > +     if (IS_ERR(ictx->hash)) {
> > +             err = PTR_ERR(ictx->hash);
> > +             goto out_drop_skcipher;
> > +     }
>
> Holding a reference to this algorithm for the life-time of the
> instance is not nice.  How about just doing a lookup as you were
> doing before with crypto_alg_mod_lookup and getting the cra_name
> from that?
>

OK, but it should be the cra_driver_name not the cra_name. Otherwise,
allocating essiv(cbc(aes),sha256-generic) may end up using a different
implementation of sha256, which would be bad.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
