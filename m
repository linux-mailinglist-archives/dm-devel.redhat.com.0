Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BE48E47E1B
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 11:15:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13D1BC056899;
	Mon, 17 Jun 2019 09:15:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FC39F2E0;
	Mon, 17 Jun 2019 09:15:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99117206D1;
	Mon, 17 Jun 2019 09:15:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5H9FOS9016809 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 05:15:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54552101E69C; Mon, 17 Jun 2019 09:15:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FB3110246F3
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 09:15:21 +0000 (UTC)
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 89FBD223875
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 09:15:13 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k20so19497859ios.10
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=BBlAq8Hgbk1PhfyJUI7i/pP6QgmDuBb0PZdu9I+mRE8=;
	b=WYpWGUjmF/b5U2DhXFfHaq8D+8s5go2/jFOJkLk2uW4kq/Fv7IjgWsCIoP43Tynt7H
	2blO6czII4FOD+tpOnQXimX+P037O7oXWstll/m5VLtgOnz5kU/beNS0K5g4+DUssMf8
	v127qxFMTsWiy5evx4nnTswUoRAa8OusVmK004aPXfXLNTQ29ioi4+qt3LdgKW5v7Adt
	CrF2/V2eQnw6tmt8vvq7hN31gUyYz8pwsXZajaxSBLTYz5WfRkyePZV4qr+pLxZWYGlC
	dBDm8qNvcoQd4zGwUNIu2drZ6m41Tg2gN6jU6vUjKCRfjbvfnQhz8dfskKQb57+eBbpc
	tY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=BBlAq8Hgbk1PhfyJUI7i/pP6QgmDuBb0PZdu9I+mRE8=;
	b=nRXm/O1ixfvHexlqZHqmxw+GA83xzRP4vogrLD4Fv6rM4Er2Fw5oPus2FYKza8czGd
	LWza137wGjyYi6zMY93hEz9gt+0EX+iqy3dvbEqqTUUE2x8tDXAYZNoLfK60qODHH685
	YD6JYnTKfDRkOTGlt/KoTjyiRs5+Q3uZShy44WleDejhcy13Wa8lWDDv41jiEDHdJJ0W
	Tum9LJDhF5a/PRt82E9LkZNzGVXIimItP5+JYIhWssvyYot85B+sVo/EqB7+jnffs0xy
	cRo5hG/hZ+5N5yw3lCi+xW5SZAwLidqDbFQfhyUjHgF2n0Fo8qCHlkiQnkYfT8wuOPug
	gDzg==
X-Gm-Message-State: APjAAAVhoT2tlW3KpJ8XGmRiC9D/A4JfDHPk+QfK5KtBLMl4LJjCakDP
	KLtEawvQlyqYRJJF2JL4CPJYQp2Ac6BBhxWNeCTDyA==
X-Google-Smtp-Source: APXvYqxHcte7o9+S4aNU6gOiMoSXJgqAwijNG58b3jo5O5B7NSygezT1xkWpPBvKULdZoH6xNXgeQQY7neDGSv8dDwY=
X-Received: by 2002:a02:3308:: with SMTP id c8mr14821917jae.103.1560762912862; 
	Mon, 17 Jun 2019 02:15:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
In-Reply-To: <CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 11:15:01 +0200
Message-ID: <CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
To: Gilad Ben-Yossef <gilad@benyossef.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 17 Jun 2019 09:15:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Mon, 17 Jun 2019 09:15:13 +0000 (UTC) for IP:'209.85.166.67'
	DOMAIN:'mail-io1-f67.google.com' HELO:'mail-io1-f67.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.67 mail-io1-f67.google.com 209.85.166.67
	mail-io1-f67.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	linux-fscrypt@vger.kernel.org,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [RFC PATCH 0/3] crypto: switch to shash for ESSIV
	generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Mon, 17 Jun 2019 09:15:49 +0000 (UTC)

On Mon, 17 Jun 2019 at 10:52, Gilad Ben-Yossef <gilad@benyossef.com> wrote:
>
> On Sun, Jun 16, 2019 at 11:44 PM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > [+Cc dm-devel and linux-fscrypt]
> >
> > On Fri, Jun 14, 2019 at 10:34:01AM +0200, Ard Biesheuvel wrote:
> > > This series is presented as an RFC for a couple of reasons:
> > > - it is only build tested
> > > - it is unclear whether this is the right way to move away from the use of
> > >   bare ciphers in non-crypto code
> > > - we haven't really discussed whether moving away from the use of bare ciphers
> > >   in non-crypto code is a goal we agree on
> > >
> > > This series creates an ESSIV shash template that takes a (cipher,hash) tuple,
> > > where the digest size of the hash must be a valid key length for the cipher.
> > > The setkey() operation takes the hash of the input key, and sets into the
> > > cipher as the encryption key. Digest operations accept input up to the
> > > block size of the cipher, and perform a single block encryption operation to
> > > produce the ESSIV output.
> ...
> > I agree that moving away from bare block ciphers is generally a good idea.  For
> > fscrypt I'm fine with moving ESSIV into the crypto API, though I'm not sure a
> > shash template is the best approach.  Did you also consider making it a skcipher
> > template so that users can do e.g. "essiv(cbc(aes),sha256,aes)"?  That would
> > simplify things much more on the fscrypt side, since then all the ESSIV-related
> > code would go away entirely except for changing the string "cbc(aes)" to
> > "essiv(cbc(aes),sha256,aes)".
>
> I will also add that going the skcipher route rather than shash will
> allow hardware tfm providers like CryptoCell that can do the ESSIV
> part in hardware implement that as a single API call and/or hardware
> invocation flow.
> For those system that benefit from hardware providers this can be beneficial.
>

Ah yes, thanks for reminding me. There was some debate in the past
about this, but I don't remember the details.

I think implementing essiv() as a skcipher template is indeed going to
be the best approach, I will look into that.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
