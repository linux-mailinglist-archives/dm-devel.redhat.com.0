Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774060114
	for <lists+dm-devel@lfdr.de>; Fri,  5 Jul 2019 08:36:40 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0CEB78666F;
	Fri,  5 Jul 2019 06:36:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D2A480D81;
	Fri,  5 Jul 2019 06:36:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6287641F53;
	Fri,  5 Jul 2019 06:36:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x656aC84012622 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jul 2019 02:36:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 167A77E655; Fri,  5 Jul 2019 06:36:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 113397E65E
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 06:36:09 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C48883F40
	for <dm-devel@redhat.com>; Fri,  5 Jul 2019 06:36:00 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 207so7627654wma.1
	for <dm-devel@redhat.com>; Thu, 04 Jul 2019 23:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2OCBMk8z+QfRen/W6CulSDPkPOiGjYu90pG1vgqV+00=;
	b=UNvQtQ4AUmcYi/az3mwo721g5Wpc4pTlCuxBHHebt7UGH5e2mPVGw1Ge2jzAX4DHrV
	V7Pg84Oww4lQ8FZeJzS/4uxlz2EBStgdgWH6SxHpMyOKIFp+i23IOfUHNkEOSPlXIB5G
	+RyE/yN7DJwSWyR89XdcGQFbEXj5uGwrkscJCDrGKF2mLaUZCUYOuYwBRdv5Fb//rKXH
	KUkR1RFekNsC1DS3Uac59Eb0z4RHqNsOJ58jf0yxlvrIZ5piSV5+huApzbmsDZwp05eg
	ETypOYqT1h0idd5vPSflj7Ep5V7Shm1aEwCNghCPWk21PooBK5GnnrwDRD3cntEwBm1z
	CtPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2OCBMk8z+QfRen/W6CulSDPkPOiGjYu90pG1vgqV+00=;
	b=gsvSii2msQPvnD6KRAXxMyS7z1EGJjcDz/gTMdlfdtLizo9oOjvGHhR7/11Ac5C12F
	X+6O/qsyVqlXcsiY4KF0E3oZfY/wmnV9gX66dGrWmB2C8f8+oMJTOxcjrf5+BjpNkSW2
	GH0gkHDXQfs3VeB2IaoA+s1WFNFSHQSkD6A59V1qKDeIFw1AoErHhm3V7r90gA67jgvn
	9lME4LcS7HZ1higZ47Y8Aksny2tW2kt762QQl7ow3HzVSiZVGcU7ofcIVUG3tWbdk3iE
	CBgZJhQkgr/s/X+CnSFmdNTZq0ccOZn17mj2WDIxj+6BF1GQ5TGenNtLDQR6Qs0rXXPF
	12Wg==
X-Gm-Message-State: APjAAAVlbQea9coadjvXZtgYamI8vxaOFeAKjTbr3ApqV0OGgJxUyXC/
	Ko20gaQ1lzOKZeclEhcNvTwYMrkHGamAaPoxdXTSyaoA+rQ=
X-Google-Smtp-Source: APXvYqzRDSCd/ZBfF6c0dFdo08XvQFF7eRXe8X5mY2WZaVNr84/xpFMytKWXFtUvLo4KnkNo/B0phzmuo3eypTBDqis=
X-Received: by 2002:a05:600c:21d4:: with SMTP id
	x20mr1626256wmj.61.1562308559023; 
	Thu, 04 Jul 2019 23:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
In-Reply-To: <20190704183017.31570-1-ard.biesheuvel@linaro.org>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Fri, 5 Jul 2019 08:35:42 +0200
Message-ID: <CAKv+Gu83Z2U0JABYEVyJ0sW_onoUEM3BmGGzFg48b0Uc3SPQjg@mail.gmail.com>
To: "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
	<linux-crypto@vger.kernel.org>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Fri, 05 Jul 2019 06:36:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 05 Jul 2019 06:36:02 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ard.biesheuvel@linaro.org' RCPT:''
X-RedHat-Spam-Score: -0.09  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
	T_PDS_NO_HELO_DNS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ard.biesheuvel@linaro.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	device-mapper development <dm-devel@redhat.com>,
	Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v8 0/7] crypto: switch to crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 05 Jul 2019 06:36:38 +0000 (UTC)

On Thu, 4 Jul 2019 at 20:30, Ard Biesheuvel <ard.biesheuvel@linaro.org> wrote:
>
> This series creates an ESSIV template that produces a skcipher or AEAD
> transform based on a tuple of the form '<skcipher>,<cipher>,<shash>'
> (or '<aead>,<cipher>,<shash>' for the AEAD case). It exposes the
> encapsulated sync or async skcipher/aead by passing through all operations,
> while using the cipher/shash pair to transform the input IV into an ESSIV
> output IV.
>
> This matches what both users of ESSIV in the kernel do, and so it is proposed
> as a replacement for those, in patches #2 and #4.
>
> Note to the maintainer: patches #2 .. #4 are against other subsystems, and
> so it might make sense to take only the crypto patches (#1, #5, and optionally
> #6 and #7) now, and allow the other subsystem maintainers to take the other
> patches at their leisure during the next cycle.
>

Please disregard #6 and #7 for now - the IV handling is busted after
the rebase to cryptodev/master. #1 and #5 should be fine though

Since I am obviously unsuccessful in cranking out these patches
without bugs in time before my leave, I am going to stop trying, and I
will get back to this work when I return from my leave, around the end
of September.


> This code has been tested using the fscrypt test suggested by Eric
> (generic/549 *), as well as the mode-test scripts suggested by Milan for
> the dm-crypt case. I also tested the aead case in a virtual machine,
> but it definitely needs some wider testing from the dm-crypt experts.
>
> * due to sloppiness on my part, the fscrypt change was actually broken
>   since I switched back to using full size IVs in the ESSIV template.
>   This time, I fixed this, and reran the test in question and it passed.
>
> The consensus appears to be that it would be useful if the crypto API
> encapsulates the handling of multiple subsequent blocks that are
> encrypted using a 64-bit LE counter as IV, and makes it the duty of
> the algo to increment the counter between blocks. However, this is
> equally suitable for non-ESSIV transforms (or even more so), and so
> this is left as a future enhancement to  be applied on top.
>
> Changes since v7:
> - rebase onto cryptodev/master
> - drop change to ivsize in #2
> - add Milan's R-b's
>
> Changes since v6:
> - make CRYPTO_ESSIV user selectable so we can opt out of selecting it even
>   if FS_ENCRYPTION (which cannot be built as a module) is enabled
> - move a comment along with the code it referred to (#3), not that this change
>   and removing some redundant braces makes the diff look totally different
> - add Milan's R-b to #3 and #4
>
> Changes since v5:
> - drop redundant #includes and drop some unneeded braces (#2)
> - add test case for essiv(authenc(hmac(sha256),cbc(aes)),aes,sha256)
> - make ESSIV driver deal with assoc data that is described by more than two
>   scatterlist entries - this only happens when the extended tests are being
>   performed, so don't optimize for it
> - clarify that both fscrypt and dm-crypt only use ESSIV in special cases (#7)
>
> Changes since v4:
> - make the ESSIV template IV size equal the IV size of the encapsulated
>   cipher - defining it as 8 bytes was needlessly restrictive, and also
>   complicated the code for no reason
> - add a missing kfree() spotted by Smatch
> - add additional algo length name checks when constructing the essiv()
>   cipher name
> - reinstate the 'essiv' IV generation implementation in dm-crypt, but
>   make its generation function identical to plain64le (and drop the other
>   methods)
> - fix a bug in the arm64 CE/NEON code
> - simplify the arm64 code by reusing more of the existing CBC implementation
>   (patch #6 is new to this series and was added for this reason)
>
> Changes since v3:
> - address various review comments from Eric on patch #1
> - use Kconfig's 'imply' instead of 'select' to permit CRYPTO_ESSIV to be
>   enabled as a module or disabled entirely even if fscrypt is compiled in (#2)
> - fix an issue in the AEAD encrypt path caused by the IV being clobbered by
>   the inner skcipher before the hmac was being calculated
>
> Changes since v2:
> - fixed a couple of bugs that snuck in after I'd done the bulk of my
>   testing
> - some cosmetic tweaks to the ESSIV template skcipher setkey function
>   to align it with the aead one
> - add a test case for essiv(cbc(aes),aes,sha256)
> - add an accelerated implementation for arm64 that combines the IV
>   derivation and the actual en/decryption in a single asm routine
>
> Scroll down for tcrypt speed test result comparing the essiv template
> with the asm implementation. Bare cbc(aes) tests included for reference
> as well. Taken on a 2GHz Cortex-A57 (AMD Seattle)
>
> Code can be found here
> https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=essiv-v8
>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: Eric Biggers <ebiggers@google.com>
> Cc: dm-devel@redhat.com
> Cc: linux-fscrypt@vger.kernel.org
> Cc: Gilad Ben-Yossef <gilad@benyossef.com>
> Cc: Milan Broz <gmazyland@gmail.com>
>
> Ard Biesheuvel (7):
>   crypto: essiv - create wrapper template for ESSIV generation
>   fs: crypto: invoke crypto API for ESSIV handling
>   md: dm-crypt: infer ESSIV block cipher from cipher string directly
>   md: dm-crypt: switch to ESSIV crypto API template
>   crypto: essiv - add test vector for essiv(cbc(aes),aes,sha256)
>   crypto: arm64/aes-cts-cbc - factor out CBC en/decryption of a walk
>   crypto: arm64/aes - implement accelerated ESSIV/CBC mode
>
>  arch/arm64/crypto/aes-glue.c  | 205 +++++--
>  arch/arm64/crypto/aes-modes.S |  29 +-
>  crypto/Kconfig                |  28 +
>  crypto/Makefile               |   1 +
>  crypto/essiv.c                | 640 ++++++++++++++++++++
>  crypto/tcrypt.c               |   9 +
>  crypto/testmgr.c              |  14 +
>  crypto/testmgr.h              | 497 +++++++++++++++
>  drivers/md/Kconfig            |   1 +
>  drivers/md/dm-crypt.c         | 235 ++-----
>  fs/crypto/Kconfig             |   1 +
>  fs/crypto/crypto.c            |   5 -
>  fs/crypto/fscrypt_private.h   |   9 -
>  fs/crypto/keyinfo.c           |  93 +--
>  14 files changed, 1435 insertions(+), 332 deletions(-)
>  create mode 100644 crypto/essiv.c
>
> --
> 2.17.1
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
