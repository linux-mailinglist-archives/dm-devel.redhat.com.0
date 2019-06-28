Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 386345A33B
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jun 2019 20:13:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ABEE308213F;
	Fri, 28 Jun 2019 18:13:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE08B19C59;
	Fri, 28 Jun 2019 18:13:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 44B5A1806B16;
	Fri, 28 Jun 2019 18:12:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5SIAKjG018347 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 28 Jun 2019 14:10:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56A845D9CA; Fri, 28 Jun 2019 18:10:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 514E85DD64
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 18:10:18 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E5CD59440
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 18:10:06 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id e5so14420070iok.4
	for <dm-devel@redhat.com>; Fri, 28 Jun 2019 11:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QYWzxaXovWkgcEFlvE0Xp9fq1rOCMq8z72F52B44Ujo=;
	b=JBs2gM9vBb0OEheV98pM2TtHhfvao8WVFb/KDlJasoM8LrxPjvce9QWMr4CbXM7gsN
	/L3V4zTrpANLu5oYIMVWIdVAJowlk/NYmFQKAaV/e2Bf+pwR4xUWTHs7RBP+S+HeG1tI
	QFolz3Rspj+hz3yjnfHJU7Wyg17h+Y3/MyhsccFBT/OEV6oBC8OCcseyvzjGQ9PwVsYI
	OcbKxU7xN86B3Pc2D9rdZmX67/m/EViCsspr+LJz9irXDnwT5yxN+vjK3UX7dyAecF64
	V86SMKcf8MlKWmT9ZltVPhmW5fo4v1OQZDA/b4GsQEP6EvYa4XMveR2GSVS1uuTnFMDR
	JneQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QYWzxaXovWkgcEFlvE0Xp9fq1rOCMq8z72F52B44Ujo=;
	b=Y9Yx5ZsaGO506LrufIGXJnS1T2m1/NINMPQ2o58lamHLPRWT/lIuEeHDr4pZWcUa6c
	9TuoBVa796hJSXcHcKX9p4+rzGtSz9V77tY1O0svu/2mngY50vXiEGiNB6i5MLdplpjg
	AEN00KOQsgVcT/rxZcvET9PmLapD7WTClcFvnXHDg1LmDrAKS7zcEIRy3+KQ5QTYocAF
	O78NNRpudAiXqWPo2HPiOMU7Rv89BRUNsLqazdhmZKkBZ++sFgzHo4bRmEXHrjH9CuJA
	6TipD6cfAG7PpQ24k3s1Di4Tcw8sSJWll1pmyid6I9ezmxyBh4cUm8+uE9IIDZDRIwuo
	DIgA==
X-Gm-Message-State: APjAAAV/oaKiMBpxQ04YQ22TjjKmsOmanGcEG9OuIPglTRAGAUQR6vVF
	C48BuMviq2GSARtyuVUlvFo+kMsnfzfJD3DlXY0qIA==
X-Google-Smtp-Source: APXvYqx+NnMbClpJ2onsdNYXMm8sivmrFOPXnQEQXLACcIeC5bs6mQctMPqplE9EHAQBbs0DgHi+8Q5JrWxFZp49S78=
X-Received: by 2002:a5d:9d83:: with SMTP id 3mr11858580ion.65.1561745405295;
	Fri, 28 Jun 2019 11:10:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-3-ard.biesheuvel@linaro.org>
	<20190628180037.GC103946@gmail.com>
In-Reply-To: <20190628180037.GC103946@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 28 Jun 2019 20:09:54 +0200
Message-ID: <CAKv+Gu9=6uWSy2V4=7CVU6oqVUA0GFrjXHp48aiZ6sd_YQH-Uw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jun 2019 18:10:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Fri, 28 Jun 2019 18:10:06 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v6 2/7] fs: crypto: invoke crypto API for
	ESSIV handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Fri, 28 Jun 2019 18:13:31 +0000 (UTC)

On Fri, 28 Jun 2019 at 20:00, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 28, 2019 at 05:21:07PM +0200, Ard Biesheuvel wrote:
> > diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
> > index dcd91a3fbe49..f39667d4316a 100644
> > --- a/fs/crypto/keyinfo.c
> > +++ b/fs/crypto/keyinfo.c
> > @@ -13,14 +13,10 @@
> >  #include <linux/hashtable.h>
> >  #include <linux/scatterlist.h>
> >  #include <linux/ratelimit.h>
> > -#include <crypto/aes.h>
> >  #include <crypto/algapi.h>
> > -#include <crypto/sha.h>
> >  #include <crypto/skcipher.h>
> >  #include "fscrypt_private.h"
> >
> > -static struct crypto_shash *essiv_hash_tfm;
> > -
> >  /* Table of keys referenced by FS_POLICY_FLAG_DIRECT_KEY policies */
> >  static DEFINE_HASHTABLE(fscrypt_master_keys, 6); /* 6 bits = 64 buckets */
> >  static DEFINE_SPINLOCK(fscrypt_master_keys_lock);
> > @@ -144,10 +140,9 @@ static struct fscrypt_mode available_modes[] = {
> >       },
> >       [FS_ENCRYPTION_MODE_AES_128_CBC] = {
> >               .friendly_name = "AES-128-CBC",
> > -             .cipher_str = "cbc(aes)",
> > +             .cipher_str = "essiv(cbc(aes),aes,sha256)",
> >               .keysize = 16,
> > -             .ivsize = 16,
> > -             .needs_essiv = true,
> > +             .ivsize = 8,
> >       },
>
> Now that the essiv template takes the same size IV, the .ivsize here needs to be
> left as 16.
>

indeed. Thanks for spotting that.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
