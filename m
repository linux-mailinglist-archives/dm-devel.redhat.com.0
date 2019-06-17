Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D9A5B485BB
	for <lists+dm-devel@lfdr.de>; Mon, 17 Jun 2019 16:41:24 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F2BD430C0DCF;
	Mon, 17 Jun 2019 14:41:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9486E2E02F;
	Mon, 17 Jun 2019 14:40:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD5751833002;
	Mon, 17 Jun 2019 14:40:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5HEeI6U015209 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jun 2019 10:40:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0650F7DF58; Mon, 17 Jun 2019 14:40:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 011667DF57
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 14:40:15 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47B463086227
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 14:39:58 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so21798907iop.0
	for <dm-devel@redhat.com>; Mon, 17 Jun 2019 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Sv6MBkFuxNWS4Y7/ODJd1UzhH6pb23qCRtVaIHF/q+c=;
	b=RlgzUmgfx9yyf3BBvyHR0xyyMh+HYVVEyb+v0qWRWjZWwRwnft22o6i6RXitzgYxpt
	bM3fzgoVGnCZ8/KJSEsW0Gb32WP2cPFqMtVMP331n/L/EKo0nYYh/D2K1UFOsgA1ZCj3
	dcPtlokzdrTzbMOKnwurcUwqmR62ByudM9TcOJ3gSEdPjTbgXJQCkazD6LjYutdh+i5o
	RijbGxrM4qHBvHSocR6sbHd4ijRbwAUsQen7gjUB3Uv7A+SRQBZhejgBTXY7r194EFd0
	LeelsBjgL34ouhUOLzNzdusfidDaYD9kyzjC5wwUw1DhNVgHCq5BGmnFMV/sDSxwYfSS
	q7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Sv6MBkFuxNWS4Y7/ODJd1UzhH6pb23qCRtVaIHF/q+c=;
	b=kJH/1LvFG9M7mz241mya5rnTYanNLw2FJ3l+n24k3Wo0FD768fSkigWeLYfcVL6caL
	aZwtjPCX/GuDnk2bMf21z2o/lkfANCX06cV+WNy80D7OBeqtof6/XmZsH3cIstl9H96b
	IrJ77RsZtuiQgVcuflHbTjWIs76eRLXpaZ6EGTu2DIWWUJ9PFmFJphW7q2RWlEs9C61t
	PqakNsSaqtYZsQCzwfyRbg2L+ZKG52wQJY8YgkI2NdkIinb8JrmhaQusuUY19DLj0Ggm
	0yba+x+j+XQCALKuu3hd4XfOrcXIfo70KEznKgvFOqPaeiSNDnxVRTGuQBtrIH25surE
	4+JA==
X-Gm-Message-State: APjAAAWbcxzH+pnT8kf0h/pWUzEJ/qCEXkiDYfWNhkHWIoCMKeSnEmJK
	wleUJHl3QuxzZ1+uLRK+LXblbtnKO3/Yib3PgUIuwQ==
X-Google-Smtp-Source: APXvYqyYa6j6Ch8HnyOd5iu7uBxGZ09vXQaTQDB4sfKP+VxQ9J+WjmYVU2uD8/bsKEKMsda+BAlZYfs5I2M96mF0JRs=
X-Received: by 2002:a5e:820a:: with SMTP id l10mr16879074iom.283.1560782397535;
	Mon, 17 Jun 2019 07:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<20190616204419.GE923@sol.localdomain>
	<CAOtvUMf86_TGYLoAHWuRW0Jz2=cXbHHJnAsZhEvy6SpSp_xgOQ@mail.gmail.com>
	<CAKv+Gu_r_WXf2y=FVYHL-T8gFSV6e4TmGkLNJ-cw6UjK_s=A=g@mail.gmail.com>
	<8e58230a-cf0e-5a81-886b-6aa72a8e5265@gmail.com>
	<CAKv+Gu9sb0t6EC=MwVfqTw5TKtatK-c8k3ryNUhV8O0876NV7g@mail.gmail.com>
	<CAKv+Gu-LFShLW-Tt7hwBpni1vQRvv7k+L_bpP-wU86x88v+eRg@mail.gmail.com>
	<90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
In-Reply-To: <90214c3d-55ef-cc3a-3a04-f200d6f96cfd@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Mon, 17 Jun 2019 16:39:45 +0200
Message-ID: <CAKv+Gu82BLPWrX1UzUBLf7UB+qJT6ZPtkvJ2Sa9t28OpXArhnw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 14:39:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Mon, 17 Jun 2019 14:39:58 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.191  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE) 209.85.166.66 mail-io1-f66.google.com
	209.85.166.66 mail-io1-f66.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Eric Biggers <ebiggers@kernel.org>, Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Mon, 17 Jun 2019 14:41:23 +0000 (UTC)

On Mon, 17 Jun 2019 at 16:35, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 17/06/2019 15:59, Ard Biesheuvel wrote:
> >
> > So my main question/showstopper at the moment is: which modes do we
> > need to support for ESSIV? Only CBC? Any skcipher? Or both skciphers
> > and AEADs?
>
> Support, or cover by internal test? I think you nee to support everything
> what dmcrypt currently allows, if you want to port dmcrypt to new API.
>
> I know of many systems that use aes-xts-essiv:sha256 (it does not make sense
> much but people just use it).
>
> Some people use serpent and twofish, but we allow any cipher that fits...
>

Sure,  that is all fine

> For the start, run this
> https://gitlab.com/cryptsetup/cryptsetup/blob/master/tests/mode-test
>
> In other words, if you add some additional limit, we are breaking backward compatibility.
> (Despite the configuration is "wrong" from the security point of view.)
>

Yes, but breaking backward compatibility only happens if you break
something that is actually being *used*. So sure,
xts(aes)-essiv:sha256 makes no sense but people use it anyway. But is
that also true for, say, gcm(aes)-essiv:sha256 ?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
