Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE555A8DF
	for <lists+dm-devel@lfdr.de>; Sat, 29 Jun 2019 06:24:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B6B0E3087931;
	Sat, 29 Jun 2019 04:24:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E209B5F709;
	Sat, 29 Jun 2019 04:24:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D043354D3C;
	Sat, 29 Jun 2019 04:23:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5T4NWEI005121 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 29 Jun 2019 00:23:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C19816013A; Sat, 29 Jun 2019 04:23:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD79F6012E
	for <dm-devel@redhat.com>; Sat, 29 Jun 2019 04:23:30 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E12FC307D857
	for <dm-devel@redhat.com>; Sat, 29 Jun 2019 04:23:29 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id F25192075B;
	Sat, 29 Jun 2019 04:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561782209;
	bh=kchn9D/FW0dGX0nsdGW46YTiR7OJr5RoQU52OTiuq7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CX52vsnQ4OaG7F+noCD7HDM1S/hy4zm5rwp5cRCLn9DLlWBv2ARDS8AOl/YyRtT2h
	HVIMyZD5wck8MNPQHsjeh4pLdxik0OC6AZqFir7DDQ6dlyUt0qI+TOyr1Hj3Vd/KHQ
	I0ACgCXD4F6Ic+ZnkT8CTTCMp02OV4UDC6kENkY4=
Date: Fri, 28 Jun 2019 21:23:27 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190629042327.GB886@sol.localdomain>
References: <20190628152112.914-1-ard.biesheuvel@linaro.org>
	<20190628152112.914-2-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190628152112.914-2-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 29 Jun 2019 04:23:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sat, 29 Jun 2019 04:23:30 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v6 1/7] crypto: essiv - create wrapper
 template for ESSIV generation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Sat, 29 Jun 2019 04:24:12 +0000 (UTC)

On Fri, Jun 28, 2019 at 05:21:06PM +0200, Ard Biesheuvel wrote:
> Implement a template that wraps a (skcipher,cipher,shash) or
> (aead,cipher,shash) tuple so that we can consolidate the ESSIV handling
> in fscrypt and dm-crypt and move it into the crypto API. This will result
> in better test coverage, and will allow future changes to make the bare
> cipher interface internal to the crypto subsystem, in order to increase
> robustness of the API against misuse.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  crypto/Kconfig  |   4 +
>  crypto/Makefile |   1 +
>  crypto/essiv.c  | 640 ++++++++++++++++++++
>  3 files changed, 645 insertions(+)
> 
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 3d056e7da65f..1aa47087c1a2 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1917,6 +1917,10 @@ config CRYPTO_STATS
>  config CRYPTO_HASH_INFO
>  	bool
>  
> +config CRYPTO_ESSIV
> +	tristate
> +	select CRYPTO_AUTHENC
> +

One more request: can you make this symbol explicitly selectable, with prompt
string and help text?

As discussed earlier, to reduce bloat I don't really want FS_ENCRYPTION to
select this.  So the user will need a way to select CRYPTO_ESSIV if they need
it.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
