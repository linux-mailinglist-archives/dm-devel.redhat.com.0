Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA634B8DB
	for <lists+dm-devel@lfdr.de>; Wed, 19 Jun 2019 14:40:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78EDE3082128;
	Wed, 19 Jun 2019 12:39:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A16FB61090;
	Wed, 19 Jun 2019 12:39:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E655B1843501;
	Wed, 19 Jun 2019 12:38:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JCbZqS029362 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 08:37:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CA2392C8E3; Wed, 19 Jun 2019 12:37:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4262611B8
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 12:37:31 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F1B8307CDD1
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 12:37:10 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u19so37665944ior.9
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 05:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mgVxtVWZcVB028eaS05O6WDA2Si5Lt8jvgQG053v8G0=;
	b=T2L1mRC5K4CgcLXaSNPvZIX4o9VmWKKxbydy9xutoy2tJr618gUSuibD1lrMnlqLih
	70gXC/IinKSNu6f2LS36r6nve2/1yghvKjMEu3I4Bhn4N8LLv3DlAMah7xHbt1JFusGd
	Dtx2ZW+V7qLsconPkoImg3LaW/dWdJHA123HYc7b0L7Of6Li4eDix1gph6QeBNfZJRBX
	1eJBxmKSgxwaltZrC0VxK92+Uryd0dP6SxmG59cOBtCbeuX4HtR7LAwVr7pU9WmE+DSv
	5aylDkjRcmPOuLBnBlDGQPIKATsG2/HiyilgZj1bR/VFD214fChwwxALm4in9qFQju05
	UkFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mgVxtVWZcVB028eaS05O6WDA2Si5Lt8jvgQG053v8G0=;
	b=Yln1dV5XEfLhDIyWW7MHTACTppG9RNJXOXhlAQ0O6zf4fPYZmBe9TMGsnPG0l1MVHI
	fmlcWC9/iWbdwb1r+V3Pg3mFtn5amFAfFQunPttd8SwGewaVFu5dchyZpNzluleITrfp
	IrtxS02eYwv6LQjhdeJNmKm0wX99WgeB1vmo59muNQeZjOqV4Y5PIZ7/aMEp2brIB8Rz
	RN1yiekgy6UrDxCIxdGzztJq859tbjVn4Weq+/IvNXdgyZODnI0uifckRzxSIKYugklW
	6IU/XDOTAfWv4bE9IXIcwzOxHIiJqnWVeZTNxSCWP6JOCW/KzogzIygF6XTjMaa1440X
	xRAg==
X-Gm-Message-State: APjAAAX/phAfA57AUFLBOUjv6PurZxUFcOw/4cVlz2OimZEK2CpyHp/T
	m0RL8u4N1HHdUGYhF+mQUgAKhSWlimNStVXDdiNpZQ==
X-Google-Smtp-Source: APXvYqxMxKkPcl/yA9aguHRLzAnHjH3llgRx2DCNZ9zjDa/sKgKiBIZ7WxIzikao9ypX0z7ouAc5ukdn7ykrPxBiZ2U=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr10302944jar.2.1560947829635; 
	Wed, 19 Jun 2019 05:37:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190618212749.8995-1-ard.biesheuvel@linaro.org>
	<099346ee-af6e-a560-079d-3fb68fb4eeba@gmail.com>
	<CAKv+Gu9MTGSwZgaHyxJKwfiBQzqgNhTs5ue+TC1Ehte-+VBXqg@mail.gmail.com>
	<CAKv+Gu9q5qTgEeTLCW6ZM6Wu6RK559SjFhsgWis72_6-p6RrZA@mail.gmail.com>
	<f5de99dd-0b6a-9f7e-46b7-cd3c5ed3100e@gmail.com>
	<CAKv+Gu9NW2H-TDd66quKSUMpEWGwqEjN-vmf_zueo1tEJLa-xg@mail.gmail.com>
	<b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
In-Reply-To: <b5b013eb-9cab-4985-9c24-563cc57c140e@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 19 Jun 2019 14:36:57 +0200
Message-ID: <CAKv+Gu91RHpwE6XzdFYcsN77DRJ-4OsFRjxNAyKk92Q3q6dCYw@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 19 Jun 2019 12:37:10 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 19 Jun 2019 12:37:10 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.11  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE) 209.85.166.66 mail-io1-f66.google.com
	209.85.166.66 mail-io1-f66.google.com
	<ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 19 Jun 2019 12:40:21 +0000 (UTC)

On Wed, 19 Jun 2019 at 13:33, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 19/06/2019 13:16, Ard Biesheuvel wrote:
> >> Try
> >>   cryptsetup open --type plain -c null /dev/sdd test -q
> >> or
> >>   dmsetup create test --table " 0 417792 crypt cipher_null-ecb - 0 /dev/sdd 0"
> >>
> >> (or just run full cryptsetup testsuite)
> >>
> >
> > Is that your mode-test script?
> >
> > I saw some errors about the null cipher, but tbh, it looked completely
> > unrelated to me, so i skipped those for the moment. But now, it looks
> > like it is related after all.
>
> This was triggered by align-test, mode-test fails the same though.
>
> It is definitely related, I think you just changed the mode parsing in dm-crypt.
> (cipher null contains only one dash I guess).
>

On my unpatched 4.19 kernel, mode-test gives me

$ sudo ./mode-test
aes                            PLAIN:[table OK][status OK]
LUKS1:[table OK][status OK] CHECKSUM:[OK]
aes-plain                      PLAIN:[table OK][status OK]
LUKS1:[table OK][status OK] CHECKSUM:[OK]
null                           PLAIN:[table OK][status OK]
LUKS1:[table OK][status OK] CHECKSUM:[OK]
cipher_null                    PLAIN:[table FAIL]
 Expecting cipher_null-ecb got cipher_null-cbc-plain.
FAILED at line 64 ./mode-test

which is why I commented out those tests in the first place.

I can reproduce the crash after I re-enable them again, so I will need
to look into that. But something seems to be broken already.
Note that this is running on arm64 using a kconfig based on the Debian kernel.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
