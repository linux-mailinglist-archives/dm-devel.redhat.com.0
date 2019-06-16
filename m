Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F84C47691
	for <lists+dm-devel@lfdr.de>; Sun, 16 Jun 2019 21:14:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C7A3B46233;
	Sun, 16 Jun 2019 19:14:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E21718506;
	Sun, 16 Jun 2019 19:14:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8CCC31806B15;
	Sun, 16 Jun 2019 19:13:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5GJDSOk002118 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 16 Jun 2019 15:13:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A459BA55; Sun, 16 Jun 2019 19:13:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5521F60C18
	for <dm-devel@redhat.com>; Sun, 16 Jun 2019 19:13:24 +0000 (UTC)
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E755C04BE32
	for <dm-devel@redhat.com>; Sun, 16 Jun 2019 19:13:13 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id k8so16733240iot.1
	for <dm-devel@redhat.com>; Sun, 16 Jun 2019 12:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=saUshM2iv2FhtdSgUUkXIgTrskoGJu0Ya5EbuRmU4C8=;
	b=AVFyW+HOIC/dDzrlp6oyi565VgYUCIlE1FrmGeeEWn/+HOG49dqLCMEGLSNsBA7tRr
	jaRXDJaL+cFwGxkDv3+sb4bPFcnLic922GupQ5/bglCOFB0kH7x7ZibqhqjV2gKUkiJf
	HjxVM95nwDns58YfY7DlKQMfwihX2fmB8J8iug8VHeK/XOP0i3pn46BhipxHQ9rSSTDU
	5R+D5sN1CnYMiIHkoqkM47R9qJc63gKC9rUvP+Ql5JnYVr0dcsHCoteTcvdBRk8uaRa4
	rhYJYEFLjb3vTrChcI5CzYUM/jpP4NGgef2G+RZoHZOsVGoDNCekvUWRENwsEz1vOnI+
	gxTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=saUshM2iv2FhtdSgUUkXIgTrskoGJu0Ya5EbuRmU4C8=;
	b=hDV2Qx/xCJ/cF5jC+8ST3nx9BtMR42LP0soQoodpTe7rbu5yA+gh0fY/WrivwmHelp
	KW65gsqHqI/OHC6gaFN4QUyTVxnej2MYg6KniGgmZwhEsXsImKp1gmFEpAOaA8YTf5LF
	x6/4b4c/rnSBhcpVS0lt7edXqqD3zQc+KcG8QCoSwRw+SJzQE2Xxd71M/qYxeC/h1Ypc
	Oqi4sgxCxGKdZZ6dPhk23AIoJMR6gbORTF2MGJiGTe2lDn653HEi7FVkAD+qOqy6XbLO
	C0ODot+B7CukpQKlcfERFJYnLPrs17b2PXeYeokOS5iI3/ZiWMHrY98JedyNV/59tFLN
	4B9A==
X-Gm-Message-State: APjAAAVkhtw4QptfMDUe4VTvlaQrO/v/ajNrk0e2ZaDrgKcdrBi/VEBN
	WS+GCH7lVazztqloNM9hjPHXqqi/iSNpGLOKbl12LQ==
X-Google-Smtp-Source: APXvYqzdRuBylfGxZV2fAUINljLY0ZoCJUaBkiU4gjdAJj4xQb7wKXFKBT192juh48giR7xMv6l0L1lcojs8nIkwvHM=
X-Received: by 2002:a5e:820a:: with SMTP id l10mr12989202iom.283.1560712392550;
	Sun, 16 Jun 2019 12:13:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190614083404.20514-1-ard.biesheuvel@linaro.org>
	<9cd635ec-970b-bd1b-59f4-1a07395e69a0@gmail.com>
In-Reply-To: <9cd635ec-970b-bd1b-59f4-1a07395e69a0@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Sun, 16 Jun 2019 21:13:01 +0200
Message-ID: <CAKv+Gu88tYOmO=8mi7yP2oj=x_SOB_o7D9jo6v_3xfbUxY2R1A@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Sun, 16 Jun 2019 19:13:13 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sun, 16 Jun 2019 19:13:13 +0000 (UTC) for IP:'209.85.166.68'
	DOMAIN:'mail-io1-f68.google.com' HELO:'mail-io1-f68.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: 0.189  (DKIM_INVALID, DKIM_SIGNED, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.166.68 mail-io1-f68.google.com 209.85.166.68
	mail-io1-f68.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	device-mapper development <dm-devel@redhat.com>,
	Eric Biggers <ebiggers@google.com>,
	"open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Sun, 16 Jun 2019 19:14:14 +0000 (UTC)

On Sat, 15 Jun 2019 at 20:19, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 14/06/2019 10:34, Ard Biesheuvel wrote:
> > This series is presented as an RFC for a couple of reasons:
> > - it is only build tested
> > - it is unclear whether this is the right way to move away from the use of
> >   bare ciphers in non-crypto code
> > - we haven't really discussed whether moving away from the use of bare ciphers
> >   in non-crypto code is a goal we agree on
> >
> > This series creates an ESSIV shash template that takes a (cipher,hash) tuple,
> > where the digest size of the hash must be a valid key length for the cipher.
> > The setkey() operation takes the hash of the input key, and sets into the
> > cipher as the encryption key. Digest operations accept input up to the
> > block size of the cipher, and perform a single block encryption operation to
> > produce the ESSIV output.
> >
> > This matches what both users of ESSIV in the kernel do, and so it is proposed
> > as a replacement for those, in patches #2 and #3.
> >
> > As for the discussion: the code is untested, so it is presented for discussion
> > only. I'd like to understand whether we agree that phasing out the bare cipher
> > interface from non-crypto code is a good idea, and whether this approach is
> > suitable for fscrypt and dm-crypt.
>
> If you want some discussion, it would be very helpful if you cc device-mapper list
> to reach dm-crypt developers. Please add at least dm-devel list.
>
> Just a few comments:
>
>  - ESSIV is useful only for CBC mode. I wish we move to some better mode
> in the future instead of cementing CBC use... But if it helps people
> to actually use unpredictable IV for CBC, it is the right approach.
> (yes, I know XTS has own problems as well... but IMO that should be the default
> for sector/fs-block encryption these days :)
>

I agree that XTS should be preferred. But for some reason, the
kernel's XTS implementation does not support ciphertext stealing (as
opposed to, e.g., OpenSSL), and so CBC ended up being used for
encrypting the filenames in fscrypt.

I am trying to serve both customers with the same solution here,
regardless of whether it is the recommended approach or not.

> - I do not think there is a problem if ESSIV moves to crypto API,
> but there it is presented as a hash... It is really just an IV generator.
>

True. But we don't have the proper abstractions to make this
distinction, and so a shash is currently the best match.

> > - wiring up some essiv(x,y) combinations into the testing framework. I wonder
> >   if anything other than essiv(aes,sha256) makes sense.
>
> In cryptsetup testsuite, we test serpent and twofish ciphers at least, but in
> reality, essiv(aes,sha256) is the most used combination.
> If it makes sense, I can run some tests with dm-crypt and this patchset.
>

OK, that is helpful, thanks. Mind if I ping you once we reach a state
where we need to test for correctness? At the moment, this is still
mostly a discussion piece.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
