Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5DB4E0D8
	for <lists+dm-devel@lfdr.de>; Fri, 21 Jun 2019 09:08:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 05975356F8;
	Fri, 21 Jun 2019 07:07:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD3F5D9D2;
	Fri, 21 Jun 2019 07:07:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CAA351806B19;
	Fri, 21 Jun 2019 07:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5L76ncs005449 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Jun 2019 03:06:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C66B45D71D; Fri, 21 Jun 2019 07:06:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1B815B683
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 07:06:47 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 51DAD30842D1
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 07:06:38 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id i10so1627215iol.13
	for <dm-devel@redhat.com>; Fri, 21 Jun 2019 00:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=M+ipu44bRUM/fC2jb/sLHPlE7YLX58quUWlKDNfCZgo=;
	b=xrfqfzE36e7CEm7bA18IJhpxy273utoadSKj3s++FOJM88tNE2GFyT5oj4zrUMcMV+
	dzK9INeaOjY4nIlRbawaFnt9Bkhn+WU8rEOSi1GtjNFHGXxitO+uzNCvsmmrwpIGSI9B
	Z4QcNQzmwr3H21SMGcIZKkBdJDYIHmT66iuppXGKlRsO9xL/Z151AlKIxv99kpYTEZKH
	n3ITIF6nkFPX7zxnmkKqL7hk+7LjLoWr359Z0zeyh22McgUKWk3B3lP65L0uLV+Jkdxu
	sEjedU3TfLQjQ/4XLYlP39mDNfu0CF9OLRwoXeRky2pGslk9fe9jOB37fI+QkgPJcUys
	JIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=M+ipu44bRUM/fC2jb/sLHPlE7YLX58quUWlKDNfCZgo=;
	b=tQUk6kk5WWfXOXHShQGCOQobIfvfXkFOMxmhP4GAfEP4zowSdfu0t3lmMMATty1s/Z
	dg5026k4nkbnT4ztID7o/iZvtjGV86rGM3it2coYAfnVyrSSGUcNY+rXQ8LqQAp/Ldbd
	jIFHOuIbsAOVxjupkxObOzNREnYWv2l2TxBdAGMaDJrLd1ciseFhl15LvLqdU01lw9xg
	1vHmeKAH4hDN9ZjjmHemQvWNTjTaF1/NT/NpVqHZygDx8L7i2ucUqDDlqUmgiQm78fxy
	S9u5U3hAGxlgD3KFSi7cuCyqNkJL9pycs4CV2UReImBdr/tLc/u1TR64Co6O7awh4MWF
	gClA==
X-Gm-Message-State: APjAAAWkb2V9UiAUu9zyfBjQGFoo/TFGXgALBwYfl19QakoL2kFg9VLF
	SwxUdJaJ5O84KTvpseAHYb72GwDjSOeKxxBD0Cc/cg==
X-Google-Smtp-Source: APXvYqwDFrY41dQ7KWWg8abbd4ymKKguSu8Q/QL1WMr5Z+rXtSQTafy2FrDJqQ7NOxKIenuKOrtN7EdnmxQjwAi8yRE=
X-Received: by 2002:a02:5a89:: with SMTP id
	v131mr19144017jaa.130.1561100792521; 
	Fri, 21 Jun 2019 00:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
	<CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
	<075cddec-1603-4a23-17c4-c766b4bd9086@gmail.com>
	<6a45dfa5-e383-d8a3-ebf1-abdc43c95ebd@gmail.com>
	<CAKv+Gu-ZETNJh2VzUkpbQUmYv6Zqb7nVj91bxuxKoNAJwgON=w@mail.gmail.com>
	<b635b78d-cfe8-3fa4-d9b2-6cf4185dac71@gmail.com>
In-Reply-To: <b635b78d-cfe8-3fa4-d9b2-6cf4185dac71@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 21 Jun 2019 09:06:20 +0200
Message-ID: <CAKv+Gu-uRUFv1+yEqNdM1KpJSwic2oGF=CYPU6Sebf3eXwruMQ@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 21 Jun 2019 07:06:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 21 Jun 2019 07:06:38 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.111  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH v3 0/6] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Fri, 21 Jun 2019 07:08:04 +0000 (UTC)

On Fri, 21 Jun 2019 at 09:01, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 20/06/2019 15:52, Ard Biesheuvel wrote:
> >>>> Does this include configurations that combine authenc with essiv?
> >>>
> >>> Hm, seems that we are missing these in luks2-integrity-test. I'll add them there.
> >>>
> >>> I also used this older test
> >>> https://gitlab.com/omos/dm-crypt-test-scripts/blob/master/root/test_dmintegrity.sh
> >>>
> >>> (just aes-gcm-random need to be commented out, we never supported this format, it was
> >>> written for some devel version)
> >>>
> >>> But seems ESSIV is there tested only without AEAD composition...
> >>>
> >>> So yes, this AEAD part need more testing.
> >>
> >> And unfortunately it does not work - it returns EIO on sectors where it should not be data corruption.
> >>
> >> I added few lines with length-preserving mode with ESSIV + AEAD, please could you run luks2-integrity-test
> >> in cryptsetup upstream?
> >>
> >> This patch adds the tests:
> >> https://gitlab.com/cryptsetup/cryptsetup/commit/4c74ff5e5ae328cb61b44bf99f98d08ffee3366a
> >>
> >> It is ok on mainline kernel, fails with the patchset:
> >>
> >> # ./luks2-integrity-test
> >> [aes-cbc-essiv:sha256:hmac-sha256:128:512][FORMAT][ACTIVATE]sha256sum: /dev/mapper/dmi_test: Input/output error
> >> [FAIL]
> >>  Expecting ee501705a084cd0ab6f4a28014bcf62b8bfa3434de00b82743c50b3abf06232c got .
> >>
> >> FAILED backtrace:
> >> 77 ./luks2-integrity-test
> >> 112 intformat ./luks2-integrity-test
> >> 127 main ./luks2-integrity-test
> >>
> >
> > OK, I will investigate.
> >
> > I did my testing in a VM using a volume that was created using a
> > distro kernel, and mounted and used it using a kernel with these
> > changes applied.
> >
> > Likewise, if I take a working key.img and mode-test.img, i can mount
> > it and use it on the system running these patches.
> >
> > I noticed that this test uses algif_skcipher not algif_aead when it
> > formats the volume, and so I wonder if the way userland creates the
> > image is affected by this?
>
> Not sure if I understand the question, but I do not think userspace even touch data area here
> (except direct-io wiping after the format, but it does not read it back).
>
> It only encrypts keyslots - and here we cannot use AEAD (in fact it is already
> authenticated by a LUKS digest).
>
> So if the data area uses AEAD (or composition of length-preserving mode and
> some authentication tag like HMAC), we fallback to non-AEAD for keyslot encryption.
>
> In short, to test it, you need to activate device (that works ok with your patches)
> and *access* the data, testing LUKS format and just keyslot access will never use AEAD.
>
> So init the data by direct-io writes, and try to read them back (with dd).
>
> For testing data on dm-integrity (or dm-crypt with AEAD encryption stacked oved dm-integrity)
> I used small utility, maybe it could be useful https://github.com/mbroz/dm_int_tools
>

Thanks.

It appears that my code generates the wrong authentication tags on
encryption, but on decryption it works fine.
I'll keep digging ...

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
