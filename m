Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D482A8313C
	for <lists+dm-devel@lfdr.de>; Tue,  6 Aug 2019 14:18:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A8BFD3C92D;
	Tue,  6 Aug 2019 12:18:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86B705D6D0;
	Tue,  6 Aug 2019 12:18:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 712FD4E58A;
	Tue,  6 Aug 2019 12:18:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x76CHqep028074 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 6 Aug 2019 08:17:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2FB0360CCD; Tue,  6 Aug 2019 12:17:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AC0C60CC0
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 12:17:49 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C72DC7BDA8
	for <dm-devel@redhat.com>; Tue,  6 Aug 2019 12:17:48 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id s3so77945036wms.2
	for <dm-devel@redhat.com>; Tue, 06 Aug 2019 05:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=E45FnivbPqKcsfGpty7g0LI8JR/YbnVdWPgdzzyZ8l0=;
	b=zhsryLY5ezEpM2wJSrHlUJ2yOPeDDT8X9D/yM9kU0zwraM1GOWynxFvK+Rg9phJMna
	QSdb0HGiAdgRVHUC7oImVgjvA01Aq0eDYXKXZmHqruI/vKBdNW7/wmnKhNKgxI3LmE7K
	mDBL+nk01XdDrOj60gf/jAN5OICJJsLWbk04y4OUD2UrqtWux/6yyXoLl9AWWr91IA8V
	BdgvRikMKffqzrke0xFGSWNg2wNPGy3Dc7VyBc5qHMQE2YiFHDI/cjKtBWcX2uXVI4cY
	lL7uEc6SnT9fZZc9ZF3yUMFvSHZq5uOFbYvJzG4EJcsQA8R+PCQo8IejwfOuf58ge5e1
	k68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=E45FnivbPqKcsfGpty7g0LI8JR/YbnVdWPgdzzyZ8l0=;
	b=ZTuQfIHT30Ecj4V/k09UuqSf8PiL26ff+xuvpmjf3f9UBqbaW9CIVBidQsjUpldpIO
	iEkqJDoIjokwwkMIfkf1g3zxAqpyg6NDsXgKVjCcQq4Kk71nkaReyjvsKiin9LQK6uwd
	EEi3x3tjr0oRqO2YqDI0puwspE31tzs86YRwiMQyJMLho68JBxK/NR+GecAUvXO9SL6z
	jKx+JH+bIv4F3MG/Zuy9Eh9PWuiEfo37ZibrQLX7VZbO7WtFolZlKh79UmNcLLTaglkv
	FQ7QBFmKeK3z5WmnyfIS62KCsEo42e4KiA67aDCq2ZXnZg7S1zGTWsd1LrNjj7vnoPoj
	YZXw==
X-Gm-Message-State: APjAAAWPqj7nR/sm81I+ECk5gMHN/h4nK4R+C8wq+irkGHeQhsKFV/KV
	MWpCsbb5C5d92M3ZFiMJZ1in64MUXk3B7+VZvxJmpQ==
X-Google-Smtp-Source: APXvYqw4xhdMYu6PeQSd8jt0KIbWrrCarttfBeILCOrC7Z39wvCWaB+sg/8duCT9s57+m+mDn63caNW3QLYsl1clec8=
X-Received: by 2002:a1c:b706:: with SMTP id h6mr4506053wmf.119.1565093867280; 
	Tue, 06 Aug 2019 05:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190806080234.27998-1-ard.biesheuvel@linaro.org>
	<20190806080234.27998-3-ard.biesheuvel@linaro.org>
	<22f5bfd5-7563-b85b-925e-6d46e7584966@gmail.com>
In-Reply-To: <22f5bfd5-7563-b85b-925e-6d46e7584966@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Tue, 6 Aug 2019 15:17:36 +0300
Message-ID: <CAKv+Gu_LQwtM47njiksCJL2tMx_Zv8Paoegfkah--T6Mh55u3A@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 06 Aug 2019 12:17:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Tue, 06 Aug 2019 12:17:49 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Mike Snitzer <snitzer@redhat.com>,
	Eric Biggers <ebiggers@kernel.org>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, "Alasdair G. Kergon" <agk@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 2/2] md/dm-crypt - switch to AES library
	for EBOIV
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 06 Aug 2019 12:18:34 +0000 (UTC)

On Tue, 6 Aug 2019 at 13:43, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 06/08/2019 10:02, Ard Biesheuvel wrote:
> > The EBOIV IV mode reuses the same AES encryption key that is used for
> > encrypting the data, and uses it to perform a single block encryption
> > of the byte offset to produce the IV.
> >
> > Since table-based AES is known to be susceptible to known-plaintext
> > attacks on the key, and given that the same key is used to encrypt
> > the byte offset (which is known to an attacker), we should be
> > careful not to permit arbitrary instantiations where the allocated
> > AES cipher is provided by aes-generic or other table-based drivers
> > that are known to be time variant and thus susceptible to this kind
> > of attack.
> >
> > Instead, let's switch to the new AES library, which has a D-cache
> > footprint that is only 1/32th of the generic AES driver, and which
> > contains some mitigations to reduce the timing variance even further.
>
> NACK.
>
> We discussed here that we will not limit combinations inside dm-crypt.
> For generic crypto API, this policy should be different, but I really
> do not want these IVs to be visible outside of dm-crypt.
>
> Allowing arbitrary combinations of a cipher, mode, and IV is how dm-crypt
> works since the beginning, and I really do not see the reason to change it.
>
> This IV mode is intended to be used for accessing old BitLocker images,
> so I do not care about performance much.
>

Apologies for being blunt, but you are basically driving home the
point I made before about why the cipher API should become internal to
the crypto subsystem.

Even though EBOIV is explicitly only intended for accessing old
BitLocker images, you prioritize non-functional properties like API
symmetry and tradition over sound cryptographic engineering practice,
even after I pointed out to you that
a) the way EBOIV uses the same symmetric key for two different
purposes is a bad idea in general, and
b) table based AES in particular is a hazard for this mode, since the
way the IV is generated is susceptible to exactly the attack that
table based AES is most criticized for.

So if you insist on supporting EBOIV in combination with arbitrary
skciphers or AEADs (or AES on systems where crypto_alloc_cipher()
produces a table based AES driver), how do you intend to mitigate
these issues?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
