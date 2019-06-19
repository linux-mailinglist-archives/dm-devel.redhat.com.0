Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5584B984
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 15:14:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 61509AC2D9;
	Wed, 19 Jun 2019 13:14:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262D660DDF;
	Wed, 19 Jun 2019 13:14:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F2A5206D2;
	Wed, 19 Jun 2019 13:14:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JDDlw3006123 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 09:13:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC7BD5D71A; Wed, 19 Jun 2019 13:13:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C73615D719
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 13:13:45 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D7C2281E05
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 13:13:26 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id h6so38052085ioh.3
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 06:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VSWvIHqoIGtDBhRJ6HSvvihcZCQQtqciIVVRqtR6+BA=;
	b=RgUtRygRSD2cNeIMgRGdHzRGhna+FOMtEp0dVmSrLw6CirMvKMu8x9fYR4mMrl8wkN
	Qp7rlV9j5497pjDNd/A0NjfrooPJbpw6GjSs45K7m4Js73642UaWS7ghFLMAPT/Sm5D9
	G1FvS6H2OJQyeoKCl3+Q+C/JQn/UIrp3JoQIu9MXrBA5Per0q0SbUYoDTn9t+C4kqeSR
	8MI/gF7tuNmtJiM4FY5p8/5f8bMAgDfftBpt0dbsMH3o5eUhuyfdeaNixXfVuFb0HpVQ
	f7mJzJzJ/9V/VvE6XzZmFpioBvsIk4thwXXCjOp0ZfuRvl8t1dFNfEjOEDbDe3sjxNAH
	KK4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VSWvIHqoIGtDBhRJ6HSvvihcZCQQtqciIVVRqtR6+BA=;
	b=pRlyPRhA6rFSe428QUdYvE2iA3Kka81NoHpziNi0lAQzLxjsgKN9tAq8sskd7B7bIT
	0kqMZUw5f1D7gEB6y/Gj4LmAZp7dnagsOsxjg8XVGl0cYYbu1d4oa4xEc2UN8a7+yRFK
	th48qzfIJGEAtdlRsD8e58Mb3WVd8cj/y9mVoOfFNBId5xd74GfcSjzaWYeSWqaBLL3X
	P6OYMpS4dE1jDEfq3TAO1lHCumaI+K9TkspnDbS/tJha130ihPNT2szTPUcTMaCEiUoX
	vsjD59FC4oPeUebPj8lHB0dTnTxYRv/uo9o5CuM6Li9CvYe+rmX837wBeC8OmbND4TuS
	XQcw==
X-Gm-Message-State: APjAAAXH+MStCqBw5gOg4QoRhaNrkEVxk6D/mDbVUgo4a4A8cwgOqyj0
	+io9XyS9l1Cc21Ktf2Rb/JaTNqFRbG5zQteM4q1z5w==
X-Google-Smtp-Source: APXvYqz+pOItGZbGiNHRhqyz++922QvC8MssSGlz2NJpvXErZ5LXO1kqo3KJpbBQwUzbiKLnVgNVJKyCVfnMVF+5k+c=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr10491946jar.2.1560950006153; 
	Wed, 19 Jun 2019 06:13:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
	<f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
	<CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
	<b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
	<CAKv+Gu91RHpwE6XzdFYcsN77DRJ-4OsFRjxNAyKk92Q3q6dCYw@mail.gmail.com>
	<CAKv+Gu_XFbB9TTjMO+=QmZ40H1LV5DB57-zeUEb9dN3yNyia=w@mail.gmail.com>
In-Reply-To: <CAKv+Gu_XFbB9TTjMO+=QmZ40H1LV5DB57-zeUEb9dN3yNyia=w@mail.gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 15:13:15 +0200
Message-ID: <CAKv+Gu8bkTbEL+BAk4OoNpaPyJFvnOQS7pgdQj7By+F2MbdO7w@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 19 Jun 2019 13:13:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 19 Jun 2019 13:13:27 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.19  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v2 0/4] crypto: switch to crypto API for
	ESSIV generation
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 19 Jun 2019 13:14:55 +0000 (UTC)

On Wed, 19 Jun 2019 at 14:49, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> On Wed, 19 Jun 2019 at 14:36, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
> >
> > On Wed, 19 Jun 2019 at 13:33, Milan Broz <gmazyland@gmail.com> wrote:
> > >
> > > On 19/06/2019 13:16, Ard Biesheuvel wrote:
> > > >> Try
> > > >>   cryptsetup open --type plain -c null /dev/sdd test -q
> > > >> or
> > > >>   dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"
> > > >>
> > > >> (or just run full cryptsetup testsuite)
> > > >>
> > > >
> > > > Is that your mode-test script?
> > > >
> > > > I saw some errors about the null cipher, but tbh, it looked completely
> > > > unrelated to me, so i skipped those for the moment. But now, it looks
> > > > like it is related after all.
> > >
> > > This was triggered by align-test, mode-test fails the same though.
> > >
> > > It is definitely related, I think you just changed the mode parsing in dm-crypt.
> > > (cipher null contains only one dash I guess).
> > >
> >
> > On my unpatched 4.19 kernel, mode-test gives me
> >
> > $ sudo ./mode-test
> > aes                            PLAIN:[table OK][status OK]
> > LUKS1:[table OK][status OK] CHECKSUM:[OK]
> > aes-plain                      PLAIN:[table OK][status OK]
> > LUKS1:[table OK][status OK] CHECKSUM:[OK]
> > null                           PLAIN:[table OK][status OK]
> > LUKS1:[table OK][status OK] CHECKSUM:[OK]
> > cipher_null                    PLAIN:[table FAIL]
> >  Expecting cipher_null-ecb got cipher_null-cbc-plain.
> > FAILED at line 64 ./mode-test
> >
> > which is why I commented out those tests in the first place.
> >
> > I can reproduce the crash after I re-enable them again, so I will need
> > to look into that. But something seems to be broken already.
> > Note that this is running on arm64 using a kconfig based on the Debian kernel.
>
> Actually, could this be an issue with cryptsetup being out of date? On
> another arm64 system with a more recent distro, it works fine

This should fix the crash you are seeing

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index 89efd7d249fd..12d28880ec34 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2357,7 +2357,7 @@ static int crypt_ctr_cipher_old(struct dm_target
*ti, char *cipher_in, char *key
        if (!cipher_api)
                goto bad_mem;

-       if (!strcmp(*ivmode, "essiv")) {
+       if (*ivmode && !strcmp(*ivmode, "essiv")) {
                if (!*ivopts) {
                        ti->error = "Digest algorithm missing for ESSIV mode";
                        return -EINVAL;

Apologies for the sloppiness - this is a check that I had added and
then removed again, given that *ivmode was assigned unconditionally,
but i didn't realize tmp could be NULL.

With these two changes applied, mode-test successfully runs to completion.

Can you recommend another test suite I could run?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
