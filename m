Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5286A2FF2F5
	for <lists+dm-devel@lfdr.de>; Thu, 21 Jan 2021 19:12:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-S70Flx57OZKomvAv4NiSfQ-1; Thu, 21 Jan 2021 13:12:16 -0500
X-MC-Unique: S70Flx57OZKomvAv4NiSfQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD7BC15720;
	Thu, 21 Jan 2021 18:12:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8CF419CB1;
	Thu, 21 Jan 2021 18:12:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 06038180954D;
	Thu, 21 Jan 2021 18:12:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10LI9toe011044 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Jan 2021 13:09:56 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C11012026D3B; Thu, 21 Jan 2021 18:09:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC9B82026D35
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 18:09:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 443FD1875040
	for <dm-devel@redhat.com>; Thu, 21 Jan 2021 18:09:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-590-X8xMjWExM7StxW1v6Khn1Q-1;
	Thu, 21 Jan 2021 13:09:49 -0500
X-MC-Unique: X8xMjWExM7StxW1v6Khn1Q-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6C87B23A33;
	Thu, 21 Jan 2021 18:09:48 +0000 (UTC)
Received: by mail-oo1-f43.google.com with SMTP id x23so736965oop.1;
	Thu, 21 Jan 2021 10:09:48 -0800 (PST)
X-Gm-Message-State: AOAM530DIfzEn8oAccvnvzaP7H4d8+BaWnI/3NLr0fgoxHQ6bsa8VzSS
	mWQEqdLGRIh4RpDEmYL8P4tPicYeAEeBIpkjrJg=
X-Google-Smtp-Source: ABdhPJw5fb2aHkz6BhRzeg+V/F4VXHygRX671oXSlebgiiywcrltiwhlrYUoFJsxx0b0zBdsamVNJuX2yLqHr9oJ5ok=
X-Received: by 2002:a4a:bb86:: with SMTP id h6mr675631oop.13.1611252587755;
	Thu, 21 Jan 2021 10:09:47 -0800 (PST)
MIME-Version: 1.0
References: <20210121130733.1649-1-ardb@kernel.org>
	<20210121130733.1649-6-ardb@kernel.org>
	<YAnCbnnFCQkyBpUA@sol.localdomain>
In-Reply-To: <YAnCbnnFCQkyBpUA@sol.localdomain>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 21 Jan 2021 19:09:36 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEycOHSMQu2T1tdQrmapk+g0oQFDiWXDo0J0BKg4QgEuQ@mail.gmail.com>
Message-ID: <CAMj1kXEycOHSMQu2T1tdQrmapk+g0oQFDiWXDo0J0BKg4QgEuQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com,
	Milan Broz <gmazyland@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [PATCH 5/5] crypto: remove Salsa20 stream cipher
	algorithm
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, 21 Jan 2021 at 19:05, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Thu, Jan 21, 2021 at 02:07:33PM +0100, Ard Biesheuvel wrote:
> > Salsa20 is not used anywhere in the kernel, is not suitable for disk
> > encryption, and widely considered to have been superseded by ChaCha20.
> > So let's remove it.
> >
> > Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
> > ---
> >  Documentation/admin-guide/device-mapper/dm-integrity.rst |    4 +-
> >  crypto/Kconfig                                           |   12 -
> >  crypto/Makefile                                          |    1 -
> >  crypto/salsa20_generic.c                                 |  212 ----
> >  crypto/tcrypt.c                                          |   11 +-
> >  crypto/testmgr.c                                         |    6 -
> >  crypto/testmgr.h                                         | 1162 --------------------
> >  7 files changed, 3 insertions(+), 1405 deletions(-)
> >
> > diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > index 4e6f504474ac..d56112e2e354 100644
> > --- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > +++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
> > @@ -143,8 +143,8 @@ recalculate
> >  journal_crypt:algorithm(:key)        (the key is optional)
> >       Encrypt the journal using given algorithm to make sure that the
> >       attacker can't read the journal. You can use a block cipher here
> > -     (such as "cbc(aes)") or a stream cipher (for example "chacha20",
> > -     "salsa20" or "ctr(aes)").
> > +     (such as "cbc(aes)") or a stream cipher (for example "chacha20"
> > +     or "ctr(aes)").
>
> You should check with the dm-integrity maintainers how likely it is that people
> are using salsa20 with dm-integrity.  It's possible that people are using it,
> especially since the documentation says that dm-integrity can use a stream
> cipher and specifically gives salsa20 as an example.
>

Good point - cc'ed them now.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

