Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E15B9910E
	for <lists+dm-devel@lfdr.de>; Thu, 22 Aug 2019 12:39:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02F87106BB28;
	Thu, 22 Aug 2019 10:39:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C583060610;
	Thu, 22 Aug 2019 10:39:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1104A180BA9B;
	Thu, 22 Aug 2019 10:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7M8bnFg013183 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 04:37:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 91E4160610; Thu, 22 Aug 2019 08:37:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 097F260605;
	Thu, 22 Aug 2019 08:37:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13563882F5;
	Thu, 22 Aug 2019 08:37:40 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 407FD2342D;
	Thu, 22 Aug 2019 08:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566463059;
	bh=XE3xK9iG8Wy7wo/kPx8rxFjUegSzi/UaDRIOdgmeG7Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jhs218aNaLA4Bq8OPujJ/oKGM90+zjHunggojHGSt42VmXqMKgeNTPazw8Mmev1Je
	JwhDX50NdqNblLusEM/+477jQps0EsJvAhuJqHOEuGRyDPBMUO588mLhb49EyqUQu8
	uON7wCWTLLCkC28QdqMP+2McwTT40RKkfLdU2OOE=
Received: by mail-lj1-f178.google.com with SMTP id x3so4762543lji.5;
	Thu, 22 Aug 2019 01:37:39 -0700 (PDT)
X-Gm-Message-State: APjAAAV/zlv/gnw9B9rkr30ayzbfsp9gJxZT5EKcl49GcloJyoQcHEbr
	S0USKnKoi7siLGwLMl4JMcCk5t/Zh4+UY07/KAU=
X-Google-Smtp-Source: APXvYqxXD3xVQJzrJLwcWiHpcv+TEgK10V+ZrGUMTV7We6eP5yS2aPqV9SO+VlhvYHW+opZdR7L81464kePe1T4gEFc=
X-Received: by 2002:a2e:b4d4:: with SMTP id r20mr21412900ljm.5.1566463057314; 
	Thu, 22 Aug 2019 01:37:37 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190821064211epcas2p43ed73f4fd126bcc5b470c9136db6aabc@epcas2p4.samsung.com>
	<003d01d557eb$8f6ca210$ae45e630$@samsung.com>
In-Reply-To: <003d01d557eb$8f6ca210$ae45e630$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 22 Aug 2019 10:37:26 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdK3ZzQXjzPZLzu5q0HZsL1vohQ4UxYTONcWdtDbEe2ng@mail.gmail.com>
Message-ID: <CAJKOXPdK3ZzQXjzPZLzu5q0HZsL1vohQ4UxYTONcWdtDbEe2ng@mail.gmail.com>
To: "boojin.kim" <boojin.kim@samsung.com>
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 22 Aug 2019 08:37:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 22 Aug 2019 08:37:40 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'krzk@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<krzk@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 22 Aug 2019 06:38:34 -0400
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Mike Snitzer <snitzer@redhat.com>,
	dm-devel@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
	Alasdair Kergon <agk@redhat.com>, Eric Biggers <ebiggers@kernel.org>,
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jaehoon Chung <jh80.chung@samsung.com>,
	Kukjin Kim <kgene@kernel.org>, linux-ext4@vger.kernel.org,
	Chao Yu <chao@kernel.org>, linux-block@vger.kernel.org,
	linux-fscrypt@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jens Axboe <axboe@kernel.dk>, "Theodore Y. Ts'o" <tytso@mit.edu>,
	linux-mmc@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>
Subject: Re: [dm-devel] [PATCH 1/9] crypt: Add diskcipher
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.64]); Thu, 22 Aug 2019 10:39:03 +0000 (UTC)

On Wed, 21 Aug 2019 at 08:42, boojin.kim <boojin.kim@samsung.com> wrote:
>
> Diskcipher supports cryptographic operations of inline crypto engines like
> FMP. Inline crypto engine refers to hardware and solutions implemented
> to encrypt data stored in storage device.
>
> When encrypting using the FMP, Additional control is required
> to carry and maintain the crypto information between
> the encryption user(fscrypt, DM-crypt) and FMP driver.
> Diskcipher provides this control.
>
> Diskcipher is a symmetric key cipher in linux crypto API to support FMP.
> FMP are registered with the cihper algorithm that uses diskcipher.
>
> Diskcipher has three major steps.
> The first step is to assign a cipher and set the key.
> The second step is to pass the cipher through the BIO to the storage
> driver.
> The third step is to get the cipher from BIO and request a crypt
> to FMP algorithm.
>
> In the first step, encryption users such as fscrypt or dm-crypt
> allocate/release a diskcipher and set key into the diskcipher.
> Diskcipher provides allocate(), free(), and setkey() that are similar
> to existing ciphers.
>
> In the second step, BIO is used to pass the diskcipher to the storage
> driver.
> The BIO submitters such as ext4, f2fs and DM-crypt set diskcipher to BIO.
> Diskcipher provides the set () API for this.
>
> In the third step, the storage driver extracts the diskcipher from the BIO
> and requests the actual encryption behavior to inline crypto engine driver.
> Diskcipher provides get() and crypt() APIs for this.
>
> Cc: Herbert Xu <herbert@gondor.apana.org.au>
> Cc: David S. Miller <davem@davemloft.net>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> ---
>  crypto/Kconfig              |   9 ++
>  crypto/Makefile             |   1 +
>  crypto/diskcipher.c         | 349
> ++++++++++++++++++++++++++++++++++++++++++++
>  crypto/testmgr.c            | 157 ++++++++++++++++++++
>  include/crypto/diskcipher.h | 245 +++++++++++++++++++++++++++++++
>  include/linux/crypto.h      |   1 +
>  6 files changed, 762 insertions(+)
>  create mode 100644 crypto/diskcipher.c
>  create mode 100644 include/crypto/diskcipher.h
>
> diff --git a/crypto/Kconfig b/crypto/Kconfig
> index 455a335..382d43a 100644
> --- a/crypto/Kconfig
> +++ b/crypto/Kconfig
> @@ -1636,6 +1636,15 @@ config CRYPTO_TWOFISH_AVX_X86_64
>           See also:
>           <http://www.schneier.com/twofish.html>
>
> +config CRYPTO_DISKCIPHER
> +       bool "Diskcipher support"
> +       default n
> +       help
> +         Disk cipher algorithm
> +
> +         This cipher supports the crypt operation of the block host device
> +         that has inline crypto engine.
> +
>  comment "Compression"
>
>  config CRYPTO_DEFLATE
> diff --git a/crypto/Makefile b/crypto/Makefile
> index 0d2cdd5..71df76a 100644
> --- a/crypto/Makefile
> +++ b/crypto/Makefile
> @@ -165,6 +165,7 @@ obj-$(CONFIG_CRYPTO_USER_API_AEAD) += algif_aead.o
>  obj-$(CONFIG_CRYPTO_ZSTD) += zstd.o
>  obj-$(CONFIG_CRYPTO_OFB) += ofb.o
>  obj-$(CONFIG_CRYPTO_ECC) += ecc.o
> +obj-$(CONFIG_CRYPTO_DISKCIPHER) += diskcipher.o
>
>  ecdh_generic-y += ecdh.o
>  ecdh_generic-y += ecdh_helper.o
> diff --git a/crypto/diskcipher.c b/crypto/diskcipher.c
> new file mode 100644
> index 0000000..ffe95a5
> --- /dev/null
> +++ b/crypto/diskcipher.c
> @@ -0,0 +1,349 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2017 Samsung Electronics Co., Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/blkdev.h>
> +#include <linux/errno.h>
> +#include <linux/module.h>
> +#include <linux/seq_file.h>
> +#include <linux/string.h>
> +#include <linux/crypto.h>
> +#include <crypto/algapi.h>
> +#include <crypto/diskcipher.h>
> +#include <linux/delay.h>
> +#include <linux/mm_types.h>
> +#include <linux/fs.h>
> +#include <linux/fscrypt.h>
> +
> +#include "internal.h"
> +
> +static int crypto_diskcipher_check(struct bio *bio)
> +{
> +       struct crypto_diskcipher *ci = NULL;
> +       struct inode *inode = NULL;
> +       struct page *page = NULL;
> +
> +       if (!bio) {
> +               pr_err("%s: doesn't exist bio\n", __func__);
> +               return 0;
> +       }
> +
> +       /* enc without fscrypt */
> +       ci = bio->bi_aux_private;
> +       if (!ci->inode)
> +               return 0;
> +       if (ci->algo == 0)
> +               return 0;
> +
> +       page = bio->bi_io_vec[0].bv_page;
> +       if (!page || PageAnon(page) || !page->mapping ||
> !page->mapping->host)

Your patch looks corrupted - wrapped by mailer. The easiest way
usually is to use git format-patch and git send-email - then you do
not have to worry about formatting etc.

Best regards,
Krzysztof

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
