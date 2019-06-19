Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BED9E4C3D8
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 00:46:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D34A181F01;
	Wed, 19 Jun 2019 22:46:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A470C608A5;
	Wed, 19 Jun 2019 22:46:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA7A9206D1;
	Wed, 19 Jun 2019 22:46:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5JMk7Va021347 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Jun 2019 18:46:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D91A5C21E; Wed, 19 Jun 2019 22:46:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 594B95C207
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 22:46:05 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 749743B46B
	for <dm-devel@redhat.com>; Wed, 19 Jun 2019 22:45:57 +0000 (UTC)
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6012A2085A;
	Wed, 19 Jun 2019 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560984352;
	bh=3qUrUVlZN3408V1zM+36w2+cVHhWM0gqh7CfNIECHj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tjy3ZTw2p83PAsbpLWyyaSKRrO7J8UvuBAO+MPoMfhGqDUVMroleoXoMb9gpwrwza
	8T/fWiWXDKLTObrrazTge+m2tBb8WfQikRSAK72mCzw42oWz1HhgXJRwFGHvk4M0H8
	ibiN/arbEjCVQQqwYGQSxc6jGgAlP20gaFASLXHg=
Date: Wed, 19 Jun 2019 15:45:51 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190619224550.GD33328@gmail.com>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-3-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619162921.12509-3-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 19 Jun 2019 22:45:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Wed, 19 Jun 2019 22:45:57 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -1.308  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, FSL_HELO_FAKE, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 2/6] fs: crypto: invoke crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 19 Jun 2019 22:46:21 +0000 (UTC)

On Wed, Jun 19, 2019 at 06:29:17PM +0200, Ard Biesheuvel wrote:
> Instead of open coding the calculations for ESSIV handling, use a
> ESSIV skcipher which does all of this under the hood.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  fs/crypto/Kconfig           |  1 +
>  fs/crypto/crypto.c          |  5 --
>  fs/crypto/fscrypt_private.h |  9 --
>  fs/crypto/keyinfo.c         | 88 +-------------------
>  4 files changed, 3 insertions(+), 100 deletions(-)
> 
> diff --git a/fs/crypto/Kconfig b/fs/crypto/Kconfig
> index 24ed99e2eca0..b0292da8613c 100644
> --- a/fs/crypto/Kconfig
> +++ b/fs/crypto/Kconfig
> @@ -5,6 +5,7 @@ config FS_ENCRYPTION
>  	select CRYPTO_AES
>  	select CRYPTO_CBC
>  	select CRYPTO_ECB
> +	select CRYPTO_ESSIV
>  	select CRYPTO_XTS
>  	select CRYPTO_CTS
>  	select CRYPTO_SHA256

Selecting CRYPTO_ESSIV is fine for now, but I'd really like to de-bloat the
dependencies of FS_ENCRYPTION (probably in a separate patch) by removing
CRYPTO_ESSIV and CRYPTO_SHA256 and documenting in the encryption modes section
of Documentation/filesystems/fscrypt.rst that people need to select them
themselves if they want to use AES-128-CBC.  I already took that approach when I
added Adiantum support, so we don't force all fscrypt users to build Adiantum,
ChaCha, Poly1305, etc. into their kernels.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
