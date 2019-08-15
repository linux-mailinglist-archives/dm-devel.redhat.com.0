Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AD68E44A
	for <lists+dm-devel@lfdr.de>; Thu, 15 Aug 2019 07:00:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 39FB8306F4AA;
	Thu, 15 Aug 2019 05:00:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 186501000182;
	Thu, 15 Aug 2019 05:00:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CBE01C8A;
	Thu, 15 Aug 2019 05:00:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7F4xnr3018576 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Aug 2019 00:59:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 923C245D1; Thu, 15 Aug 2019 04:59:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CB1627C2E
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 04:59:47 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B2EB2A09CA
	for <dm-devel@redhat.com>; Thu, 15 Aug 2019 04:59:46 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z23so264149wmf.2
	for <dm-devel@redhat.com>; Wed, 14 Aug 2019 21:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y7r3GrsKm+2UK/xPfP/njs6YmgftMt6txBYE2dN+ouo=;
	b=biAYEOQhtytUlyJpOiXnvcSnR1/7WJ1nuhw+ACmwN7VWYcOabJ+0N6FwIk+o7Z3R3v
	/TEYgrwFC18O2PnT7sb7CH0ANCHfPu3fyUT4Xc/N7V4dugNfHi64+T6++WE5I/kizwdG
	hcbcqWE06u9C2S34QcPjTlULJhF8uf1GDy5a6x3OhpYWTAofcZDvl+6Y827E3vgb6gJL
	kchw4gC/kygPZNUJCJyTrwH+VJn0bVBQfnpgWxaDGoEThwbVXHyqyRNZbtc7sO2g3ToK
	QZzuyIjJJO4VgggVBgCnSTJEqhFD2LF5lE37dhFxSioDmydW/euBlOLxgFQrzdmsyLy9
	QfXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y7r3GrsKm+2UK/xPfP/njs6YmgftMt6txBYE2dN+ouo=;
	b=g+v+tWaA3lL4LQD+lIlMe7q5DRGPF7WGHR/4qxb/AlU91Sb6jHn8Qd4B/eqMpy8/11
	jo4gd7bF3SiOBNPMEBZ8DDaCssaAZcuzVa4M9Qk0FpC1vqG1470DLMMYwej0FrjpJOwd
	Wya2I910b8W7nMROr8Kp1lvh5CG2xOhgcU94hYn4rGkkhXovYkoiOfNMh08w63ZIHWT3
	SitAS01jKL8D2wu/LXJWtqgxg9AXxA/NTE/yiqMIDawcj47hEYCx41aYuGVRdKURpiBk
	2CyqDFRNLL35niNKp/GIVJgyzD9IohO5uQiLKqnRC5nfjVMn9UUJFSy7bjh7CdCqUyU0
	wykQ==
X-Gm-Message-State: APjAAAV3h4DLdrGakqBpzAkOUZFe9YSirDcK/j07JcVyA2sPyY402B+m
	ojWsEJjQPpVUKNczTUM6JqyyPs0J0dVadD+ylGtS5g==
X-Google-Smtp-Source: APXvYqxGcPdaMer0ONFG2I2gsJ4PSUhsr7GYEUw376kmI/NVQmX1WUdUJmFOqfEcyjlzXmrI51RmTQ21n7xDGi0W5Z4=
X-Received: by 2002:a7b:c21a:: with SMTP id x26mr635593wmi.61.1565845185178;
	Wed, 14 Aug 2019 21:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190814163746.3525-1-ard.biesheuvel@linaro.org>
	<20190814163746.3525-2-ard.biesheuvel@linaro.org>
	<20190815023734.GB23782@gondor.apana.org.au>
In-Reply-To: <20190815023734.GB23782@gondor.apana.org.au>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 15 Aug 2019 07:59:34 +0300
Message-ID: <CAKv+Gu_maif=kZk-HRMx7pP=ths1vuTgcu4kFpzz0tCkO2+DFA@mail.gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Thu, 15 Aug 2019 04:59:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 15 Aug 2019 04:59:46 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v11 1/4] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 15 Aug 2019 05:00:15 +0000 (UTC)

On Thu, 15 Aug 2019 at 05:37, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Wed, Aug 14, 2019 at 07:37:43PM +0300, Ard Biesheuvel wrote:
> >
> > +     /* Block cipher, e.g., "aes" */
> > +     crypto_set_spawn(&ictx->essiv_cipher_spawn, inst);
> > +     err = crypto_grab_spawn(&ictx->essiv_cipher_spawn, essiv_cipher_name,
> > +                             CRYPTO_ALG_TYPE_CIPHER, CRYPTO_ALG_TYPE_MASK);
> > +     if (err)
> > +             goto out_drop_skcipher;
> > +     essiv_cipher_alg = ictx->essiv_cipher_spawn.alg;
> > +
> > +     /* Synchronous hash, e.g., "sha256" */
> > +     _hash_alg = crypto_alg_mod_lookup(shash_name,
> > +                                       CRYPTO_ALG_TYPE_SHASH,
> > +                                       CRYPTO_ALG_TYPE_MASK);
> > +     if (IS_ERR(_hash_alg)) {
> > +             err = PTR_ERR(_hash_alg);
> > +             goto out_drop_essiv_cipher;
> > +     }
> > +     hash_alg = __crypto_shash_alg(_hash_alg);
> > +     err = crypto_init_shash_spawn(&ictx->hash_spawn, hash_alg, inst);
> > +     if (err)
> > +             goto out_put_hash;
>
> I wouldn't use spawns for these two algorithms.  The point of
> spawns is mainly to serve as a notification channel so we can
> tear down the top-level instance when a better underlying spawn
> implementation is added to the system.
>
> For these two algorithms, we don't really care about their performance
> to do such a tear-down since they only operate on small pieces of
> data.
>
> Therefore just keep things simple and allocate them in the tfm
> init function.
>

So how do I ensure that the cipher and shash are actually loaded at
create() time, and that they are still loaded at TFM init time?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
