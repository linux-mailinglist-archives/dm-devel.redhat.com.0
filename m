Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 82C3C8A77F
	for <lists+dm-devel@lfdr.de>; Mon, 12 Aug 2019 21:48:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 29C4130832DC;
	Mon, 12 Aug 2019 19:48:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CBB77D4FB;
	Mon, 12 Aug 2019 19:48:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 26A5C18005A0;
	Mon, 12 Aug 2019 19:48:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7CJlrwB003465 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 12 Aug 2019 15:47:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 419DA69FA4; Mon, 12 Aug 2019 19:47:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE8B6A220
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 19:47:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 75C4930872DD
	for <dm-devel@redhat.com>; Mon, 12 Aug 2019 19:47:50 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B68CF20673;
	Mon, 12 Aug 2019 19:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1565639270;
	bh=Zgcv9Y+g56/ZxetdBFWjYeuHHvXTFUfMebwhbWEKpuk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R36a4/a+uKT4oeMzzX/A5Vq6DXEIF9CDlf5YcRM8XN4mVGC/QNVGiqkrRgihb00Eh
	tWE8R2cuph5e80yr6EMTd1Ft23diFJeocaahe/2GObNzU7CLWE19dAdFdtWbV931dY
	WQUdf7XQ63EnnR1wT53YJvnYGAn15fBThZnphx/8=
Date: Mon, 12 Aug 2019 12:47:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190812194747.GB131059@gmail.com>
Mail-Followup-To: Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>, dm-devel@redhat.com,
	linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>,
	Milan Broz <gmazyland@gmail.com>
References: <20190812145324.27090-1-ard.biesheuvel@linaro.org>
	<20190812145324.27090-3-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190812145324.27090-3-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 12 Aug 2019 19:47:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 12 Aug 2019 19:47:50 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.802  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v10 2/7] fs: crypto: invoke crypto API for
	ESSIV handling
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 12 Aug 2019 19:48:10 +0000 (UTC)

On Mon, Aug 12, 2019 at 05:53:19PM +0300, Ard Biesheuvel wrote:
> Instead of open coding the calculations for ESSIV handling, use a
> ESSIV skcipher which does all of this under the hood.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

This looks fine (except for one comment below), but this heavily conflicts with
the fscrypt patches planned for v5.4.  So I suggest moving this to the end of
the series and having Herbert take only 1-6, and I'll apply this one to the
fscrypt tree later.

Thanks!

> ---
>  fs/crypto/Kconfig           |  1 +
>  fs/crypto/crypto.c          |  5 --
>  fs/crypto/fscrypt_private.h |  9 --
>  fs/crypto/keyinfo.c         | 92 +-------------------
>  4 files changed, 4 insertions(+), 103 deletions(-)
> 
> diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> index 5fdf24877c17..6f3d59b880b7 100644
> --- a/fs/crypto/Kconfig
> +++ b/fs/crypto/Kconfig
> @@ -5,6 +5,7 @@ config FS_ENCRYPTION
>  	select CRYPTO_AES
>  	select CRYPTO_CBC
>  	select CRYPTO_ECB
> +	select CRYPTO_ESSIV
>  	select CRYPTO_XTS
>  	select CRYPTO_CTS
>  	select KEYS

In v5.3 I removed the 'select CRYPTO_SHA256', so now ESSIV shouldn't be selected
here either.  Instead we should just update the documentation:

diff --git a/Documentation/filesystems/fscrypt.rst b/Documentation/filesystems/fscrypt.rst
index 82efa41b0e6c02..a1e2ab12a99943 100644
--- a/Documentation/filesystems/fscrypt.rst
+++ b/Documentation/filesystems/fscrypt.rst
@@ -193,7 +193,8 @@ If unsure, you should use the (AES-256-XTS, AES-256-CTS-CBC) pair.
 AES-128-CBC was added only for low-powered embedded devices with
 crypto accelerators such as CAAM or CESA that do not support XTS.  To
 use AES-128-CBC, CONFIG_CRYPTO_SHA256 (or another SHA-256
-implementation) must be enabled so that ESSIV can be used.
+implementation) and CONFIG_CRYPTO_ESSIV must be enabled so that ESSIV
+can be used.
 
 Adiantum is a (primarily) stream cipher-based mode that is fast even
 on CPUs without dedicated crypto instructions.  It's also a true

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
