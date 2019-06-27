Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C2C58754
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 18:41:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1C6E8550BB;
	Thu, 27 Jun 2019 16:41:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FD886012D;
	Thu, 27 Jun 2019 16:40:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 34999206D1;
	Thu, 27 Jun 2019 16:40:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RGdpWj015944 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 12:39:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 73D15608CA; Thu, 27 Jun 2019 16:39:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.42])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E903608C1
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:39:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24738308620B
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:39:41 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 690152146E;
	Thu, 27 Jun 2019 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561653580;
	bh=fnhL5XMcFhypArWy/fUX1Dvznt3/2i/Ai/n6WqTzdNE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Za0iuVbFK6Fac/03nrT+yjWpU0UY61Yfwf6C0tkVzOV2o0ISWKoYUF3XJmYIqKCxv
	fQfybbnnIVGCWdi2pWYjKVB91K2Fg4WWS9kt/vnYeZX1PCYdTFrwbJ7F/1elpejVqR
	EnJouM6X811U7f29xeb6CTVRSjVPAygobnNcghdQ=
Date: Thu, 27 Jun 2019 09:39:38 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190627163938.GD686@sol.localdomain>
References: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
	<20190626204047.32131-3-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626204047.32131-3-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 27 Jun 2019 16:39:41 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]);
	Thu, 27 Jun 2019 16:39:41 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.42
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v5 2/7] fs: crypto: invoke crypto API for
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 27 Jun 2019 16:41:14 +0000 (UTC)

On Wed, Jun 26, 2019 at 10:40:42PM +0200, Ard Biesheuvel wrote:
> diff --git a/fs/crypto/keyinfo.c b/fs/crypto/keyinfo.c
> index dcd91a3fbe49..82c7eb86ca00 100644
> --- a/fs/crypto/keyinfo.c
> +++ b/fs/crypto/keyinfo.c
> @@ -19,8 +19,6 @@
>  #include <crypto/skcipher.h>
>  #include "fscrypt_private.h"

Can you remove the includes that become unused as a result of this patch?

#include <crypto/aes.h>
#include <crypto/sha.h>

> @@ -495,7 +412,6 @@ static void put_crypt_info(struct fscrypt_info *ci)
>  		put_master_key(ci->ci_master_key);
>  	} else {
>  		crypto_free_skcipher(ci->ci_ctfm);
> -		crypto_free_cipher(ci->ci_essiv_tfm);
>  	}
>  	kmem_cache_free(fscrypt_info_cachep, ci);

Nit: should remove the curly braces here.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
