Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D93FE4CD47
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 13:56:37 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 17BFA30BC679;
	Thu, 20 Jun 2019 11:56:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C95CC5D962;
	Thu, 20 Jun 2019 11:55:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B633F1806B15;
	Thu, 20 Jun 2019 11:55:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5KBt73J004411 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 07:55:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DF81C60A97; Thu, 20 Jun 2019 11:55:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5B18608A7
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:55:04 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88C3C3086226
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 11:54:52 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id u13so27053iop.0
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 04:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=4FkvkHqvLzWMKuGvT5HlaO0Xon8bDR4AOszW3W1UHPo=;
	b=jTiFaEM9AYBwT28O0vAOO7Z7siXf9GEq7+nLTrbhQ2hEID45J8EPizhLrPLP9OM4Pd
	dXL379acSYeNBalCGwcRtG4oARuGiWuVIE73jiO3g//w6zC1d4U0HDeTdlii6zx2KJoh
	Clu3iIDV1Sntl0k6P66Me1BQvof01u566vGV70zufviAFRPSs/pIJ27CTI4iJTrI52Yr
	5avyeuBOjWdKi4iPY/Z8yilIVT2KIdWY8WQEPxAjPrRDvdH/ZlPyCG5lO76H+z8JYPFu
	brnOJTFCCwIsSPLvAT+ViL0i1BLLfZYcbS7TC5Zen/4dTbT+T2auNCe0QzQNL2DqGlMe
	WOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=4FkvkHqvLzWMKuGvT5HlaO0Xon8bDR4AOszW3W1UHPo=;
	b=GyJuUeEi5DlsxJETVsJzS5+7QiMmJxlDSG6VahKsENOTscts2hkOGTdGBxOTfsbKS2
	7WLajfA5Ow7onknwTQZKMqlLaWRnQ20+bPvCImvn3QcwEdpIbP76Mr6jbUrTZD0+UOv5
	wXo9cfhz8hrEphRsiYUMnCFxczQ0zXfHf7941zDGxvtXBHitrx4+qfAVVLnJ7TXPTMME
	N4nHEPG7NQo5ikDoREVytrRu+t4lOy4u9vLqW2i7VPNBY/99QZouglHVEotKSaKYPwEq
	9HgSmGM4KbGMdk9KhxgmxkJU3Zy69DR3cKr7Sa7I7JACVT0VJErzXhk4qTBNlIHqRu4t
	4VHQ==
X-Gm-Message-State: APjAAAV+BoGwIgol6bs9RNEPCzDtFd5WZ5lqcxfxtOnRlysQquvnqJjD
	A6AGPHwj2ntBBrRtX0dq96ePAIScxYk2bU83KVjxdB0rlr+G8A==
X-Google-Smtp-Source: APXvYqw41BwTZDw+7K8vCUqvfiWkTc0lVlvd8y2KFmszNzNT+AGGvfrs0VaISa+owA/muxopKidLO5it/7mQm3yNgGU=
X-Received: by 2002:a02:ce37:: with SMTP id v23mr17448241jar.2.1561031691895; 
	Thu, 20 Jun 2019 04:54:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
In-Reply-To: <459f5760-3a1c-719d-2b44-824ba6283dd7@gmail.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Thu, 20 Jun 2019 13:54:40 +0200
Message-ID: <CAKv+Gu9jk8KxWykTcKeh6k0HUb47wgx7iZYuwwN8AUyErFLXxA@mail.gmail.com>
To: Milan Broz <gmazyland@gmail.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 20 Jun 2019 11:54:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 20 Jun 2019 11:54:52 +0000 (UTC) for IP:'209.85.166.66'
	DOMAIN:'mail-io1-f66.google.com' HELO:'mail-io1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.108  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_NONE) 209.85.166.66 mail-io1-f66.google.com 209.85.166.66
	mail-io1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Thu, 20 Jun 2019 11:56:36 +0000 (UTC)

On Thu, 20 Jun 2019 at 13:22, Milan Broz <gmazyland@gmail.com> wrote:
>
> On 19/06/2019 18:29, Ard Biesheuvel wrote:
> > This series creates an ESSIV template that produces a skcipher or AEAD
> > transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> > (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> > encapsulated sync or async skcipher/aead by passing through all operations,
> > while using the cipher/shash pair to transform the input IV into an ESSIV
> > output IV.
> >
> > This matches what both users of ESSIV in the kernel do, and so it is proposed
> > as a replacement for those, in patches #2 and #4.
> >
> > This code has been tested using the fscrypt test suggested by Eric
> > (generic/549), as well as the mode-test script suggested by Milan for
> > the dm-crypt case. I also tested the aead case in a virtual machine,
> > but it definitely needs some wider testing from the dm-crypt experts.
> >
> > Changes since v2:
> > - fixed a couple of bugs that snuck in after I'd done the bulk of my
> >   testing
> > - some cosmetic tweaks to the ESSIV template skcipher setkey function
> >   to align it with the aead one
> > - add a test case for essiv(cbc(aes),aes,sha256)
> > - add an accelerated implementation for arm64 that combines the IV
> >   derivation and the actual en/decryption in a single asm routine
>
> I run tests for the whole patchset, including some older scripts and seems
> it works for dm-crypt now.
>

Thanks Milan, that is really helpful.

Does this include configurations that combine authenc with essiv?

> For the new CRYPTO_ESSIV option - dm-crypt must unconditionally
> select it (we rely on all IV generators availability in userspace),
> but that's already done in patch 4.
>

Indeed.

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
