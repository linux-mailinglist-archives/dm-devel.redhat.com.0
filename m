Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8CE1FBD41
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 19:44:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=2Wc4l7O74NcAjuwX0G9ItSp7PB0gfYnBk2ZuwnKJZGY=;
	b=RwKmFLMhSztQezm/3YsVL4sqM0OCH4LJWpc5E3t8TMvabgPSCSxQ+VHK7+qI3CyoPUzEic
	W30IWwxAI0ZIf0SGOPOOTAVOpmvKI9ukdfGZnebH+oEMWaJqpwKmmmnsbwByLWPT93vl1U
	MmkGu3pcdwoQIoqiFzv4wjs3U8nPEwM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-PaefVmvFOqmNnKMdo_LZbg-1; Tue, 16 Jun 2020 13:44:00 -0400
X-MC-Unique: PaefVmvFOqmNnKMdo_LZbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 612C68035D2;
	Tue, 16 Jun 2020 17:43:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 922175C1BD;
	Tue, 16 Jun 2020 17:43:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E4E11809547;
	Tue, 16 Jun 2020 17:43:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHhn2j013832 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:43:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B18E12026E1C; Tue, 16 Jun 2020 17:43:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD7582026E04
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:43:46 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BC9488007A4
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:43:46 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-436-TtqULEpdP3SyHv6kbkIeWQ-1;
	Tue, 16 Jun 2020 13:43:44 -0400
X-MC-Unique: TtqULEpdP3SyHv6kbkIeWQ-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B0839214D8;
	Tue, 16 Jun 2020 17:43:41 +0000 (UTC)
Date: Tue, 16 Jun 2020 10:43:40 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200616174340.GC207319@gmail.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161102020.28052@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006161102020.28052@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 3/4] crypto: set the flag
 CRYPTO_ALG_ALLOCATES_MEMORY
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 16, 2020 at 11:02:20AM -0400, Mikulas Patocka wrote:
> Set the flag CRYPTO_ALG_ALLOCATES_MEMORY in the crypto drivers that
> allocate memory.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> 
> ---
>  drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c |    8 +-
>  drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c |    8 +-
>  drivers/crypto/amlogic/amlogic-gxl-core.c         |    4 -
>  drivers/crypto/axis/artpec6_crypto.c              |   20 +++--
>  drivers/crypto/bcm/cipher.c                       |   38 +++++-----
>  drivers/crypto/caam/caamalg.c                     |    4 -
>  drivers/crypto/caam/caamalg_qi.c                  |    4 -
>  drivers/crypto/caam/caamalg_qi2.c                 |    6 -
>  drivers/crypto/caam/caamhash.c                    |    2 
>  drivers/crypto/cavium/cpt/cptvf_algs.c            |   12 +--
>  drivers/crypto/cavium/nitrox/nitrox_aead.c        |    4 -
>  drivers/crypto/cavium/nitrox/nitrox_skcipher.c    |   16 ++--
>  drivers/crypto/ccp/ccp-crypto-aes-cmac.c          |    1 
>  drivers/crypto/ccp/ccp-crypto-aes-galois.c        |    1 
>  drivers/crypto/ccp/ccp-crypto-aes-xts.c           |    1 
>  drivers/crypto/ccp/ccp-crypto-aes.c               |    2 
>  drivers/crypto/ccp/ccp-crypto-des3.c              |    1 
>  drivers/crypto/ccp/ccp-crypto-sha.c               |    1 
>  drivers/crypto/chelsio/chcr_algo.c                |    6 -
>  drivers/crypto/hisilicon/sec/sec_algs.c           |   16 ++--
>  drivers/crypto/hisilicon/sec2/sec_crypto.c        |    4 -
>  drivers/crypto/inside-secure/safexcel_cipher.c    |   47 +++++++++++++
>  drivers/crypto/inside-secure/safexcel_hash.c      |   18 +++++
>  drivers/crypto/ixp4xx_crypto.c                    |    6 +
>  drivers/crypto/marvell/cesa/cipher.c              |   12 +--
>  drivers/crypto/marvell/cesa/hash.c                |    6 +
>  drivers/crypto/marvell/octeontx/otx_cptvf_algs.c  |   30 ++++----
>  drivers/crypto/n2_core.c                          |    2 
>  drivers/crypto/picoxcell_crypto.c                 |   17 ++++
>  drivers/crypto/qat/qat_common/qat_algs.c          |   12 +--
>  drivers/crypto/qce/sha.c                          |    2 
>  drivers/crypto/qce/skcipher.c                     |    1 
>  drivers/crypto/talitos.c                          |   78 +++++++++++-----------
>  drivers/crypto/virtio/virtio_crypto_algs.c        |    2 
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c            |    1 
>  35 files changed, 248 insertions(+), 145 deletions(-)

It would be helpful if there was a pointer to where the memory allocation
happens in each driver.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

