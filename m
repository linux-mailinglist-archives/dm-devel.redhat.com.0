Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4607121059B
	for <lists+dm-devel@lfdr.de>; Wed,  1 Jul 2020 09:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593590389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3MbbwmGWvs1kAyZEzIJRTPHUPjy4WqnrZhYV5cB9eR0=;
	b=SyR/0ggdJy0ZoBQ033SAoVnI9NJQeKaNc6iar/+g8PMlOTH0r7Pxk11LJEseuQq1PCvOsE
	sNwejavl8EFWjU3CkCPGMC5Vfyc3V7aQwylfrvIkbgnWrCAEw0gA6wEM0BXU5KrRUpuSzS
	7vD2C53g2q/QbIRv8ykmOzuRQL8ph3k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-V9WmWRFvPyiIJLzHmJUHVQ-1; Wed, 01 Jul 2020 03:59:47 -0400
X-MC-Unique: V9WmWRFvPyiIJLzHmJUHVQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB803805720;
	Wed,  1 Jul 2020 07:59:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF9C95C1D0;
	Wed,  1 Jul 2020 07:59:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D2CDE6C9C4;
	Wed,  1 Jul 2020 07:59:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0617xB6F027097 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 03:59:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 912F11084297; Wed,  1 Jul 2020 07:59:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 496281084183;
	Wed,  1 Jul 2020 07:59:11 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 0617xAeH006741; Wed, 1 Jul 2020 03:59:10 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 0617xAZM006738; Wed, 1 Jul 2020 03:59:10 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 1 Jul 2020 03:59:10 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200701045217.121126-1-ebiggers@kernel.org>
Message-ID: <alpine.LRH.2.02.2007010358390.6597@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200701045217.121126-1-ebiggers@kernel.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, linux-crypto@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 0/6] crypto: add CRYPTO_ALG_ALLOCATES_MEMORY
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Thanks for cleaning this up.

Mikulas


On Tue, 30 Jun 2020, Eric Biggers wrote:

> This series introduces a flag that algorithms can set to indicate that
> they allocate memory during processing of typical inputs, and thus
> shouldn't be used in cases like dm-crypt where memory allocation
> failures aren't acceptable.
> 
> Compared to Mikulas's patches, I've made the following improvements:
> 
> - Tried to clearly document the semantics of
>   CRYPTO_ALG_ALLOCATES_MEMORY.  This includes documenting the usage
>   constraints, since there are actually lots of cases that were
>   overlooked where algorithms can still allocate memory in some edge
>   cases where inputs are misaligned, fragemented, etc.  E.g. see
>   crypto/skcipher.c and crypto/ahash.c.  Mikulas, please let me know if
>   there are any concerns for dm-crypt.
> 
> - Moved the common mechanism for inheriting flags to its own patch.
> 
> - crypto_grab_spawn() now handles propagating CRYPTO_ALG_INHERITED_FLAGS
>   to the new template instance.
> 
> - Inherit the flags in various places that were missed.
> 
> - Other cleanups.
> 
> Note: Mikulas's patch "crypto: set the flag CRYPTO_ALG_ALLOCATES_MEMORY"
> still needs to be checked for cases where the flag no longer needs to be
> set due to the usage constraints I documented.
> 
> Eric Biggers (4):
>   crypto: geniv - remove unneeded arguments from aead_geniv_alloc()
>   crypto: algapi - use common mechanism for inheriting flags
>   crypto: algapi - introduce the flag CRYPTO_ALG_ALLOCATES_MEMORY
>   crypto: algapi - remove crypto_check_attr_type()
> 
> Mikulas Patocka (2):
>   crypto: set the flag CRYPTO_ALG_ALLOCATES_MEMORY
>   dm-crypt: don't use drivers that have CRYPTO_ALG_ALLOCATES_MEMORY
> 
>  crypto/adiantum.c                             |   4 +-
>  crypto/algapi.c                               |  17 +--
>  crypto/authenc.c                              |   4 +-
>  crypto/authencesn.c                           |   4 +-
>  crypto/ccm.c                                  |  23 ++--
>  crypto/chacha20poly1305.c                     |   4 +-
>  crypto/cmac.c                                 |  15 ++-
>  crypto/cryptd.c                               |  59 ++++-----
>  crypto/ctr.c                                  |   8 +-
>  crypto/cts.c                                  |   3 +-
>  crypto/echainiv.c                             |   2 +-
>  crypto/essiv.c                                |  11 +-
>  crypto/gcm.c                                  |  10 +-
>  crypto/geniv.c                                |   9 +-
>  crypto/hmac.c                                 |  15 ++-
>  crypto/lrw.c                                  |   3 +-
>  crypto/pcrypt.c                               |  14 +--
>  crypto/rsa-pkcs1pad.c                         |   3 +-
>  crypto/seqiv.c                                |   2 +-
>  crypto/simd.c                                 |   6 +-
>  crypto/skcipher.c                             |   3 +-
>  crypto/vmac.c                                 |  15 ++-
>  crypto/xcbc.c                                 |  15 ++-
>  crypto/xts.c                                  |   3 +-
>  .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c |  12 +-
>  .../crypto/allwinner/sun8i-ss/sun8i-ss-core.c |  12 +-
>  drivers/crypto/amlogic/amlogic-gxl-core.c     |   6 +-
>  drivers/crypto/axis/artpec6_crypto.c          |  20 ++-
>  drivers/crypto/bcm/cipher.c                   |  72 ++++++++---
>  drivers/crypto/caam/caamalg.c                 |   6 +-
>  drivers/crypto/caam/caamalg_qi.c              |   6 +-
>  drivers/crypto/caam/caamalg_qi2.c             |   8 +-
>  drivers/crypto/caam/caamhash.c                |   2 +-
>  drivers/crypto/cavium/cpt/cptvf_algs.c        |  18 ++-
>  drivers/crypto/cavium/nitrox/nitrox_aead.c    |   4 +-
>  .../crypto/cavium/nitrox/nitrox_skcipher.c    |  16 +--
>  drivers/crypto/ccp/ccp-crypto-aes-cmac.c      |   1 +
>  drivers/crypto/ccp/ccp-crypto-aes-galois.c    |   1 +
>  drivers/crypto/ccp/ccp-crypto-aes-xts.c       |   1 +
>  drivers/crypto/ccp/ccp-crypto-aes.c           |   2 +
>  drivers/crypto/ccp/ccp-crypto-des3.c          |   1 +
>  drivers/crypto/ccp/ccp-crypto-sha.c           |   1 +
>  drivers/crypto/chelsio/chcr_algo.c            |   7 +-
>  drivers/crypto/hisilicon/sec/sec_algs.c       |  24 ++--
>  drivers/crypto/hisilicon/sec2/sec_crypto.c    |   4 +-
>  .../crypto/inside-secure/safexcel_cipher.c    |  47 +++++++
>  drivers/crypto/inside-secure/safexcel_hash.c  |  18 +++
>  drivers/crypto/ixp4xx_crypto.c                |   6 +-
>  drivers/crypto/marvell/cesa/cipher.c          |  18 ++-
>  drivers/crypto/marvell/cesa/hash.c            |   6 +
>  .../crypto/marvell/octeontx/otx_cptvf_algs.c  |  30 ++---
>  drivers/crypto/n2_core.c                      |   3 +-
>  drivers/crypto/picoxcell_crypto.c             |  17 ++-
>  drivers/crypto/qat/qat_common/qat_algs.c      |  12 +-
>  drivers/crypto/qce/skcipher.c                 |   1 +
>  drivers/crypto/talitos.c                      | 117 ++++++++++++------
>  drivers/crypto/virtio/virtio_crypto_algs.c    |   3 +-
>  drivers/crypto/xilinx/zynqmp-aes-gcm.c        |   1 +
>  drivers/md/dm-crypt.c                         |  17 ++-
>  include/crypto/algapi.h                       |  23 +++-
>  include/crypto/internal/geniv.h               |   2 +-
>  include/linux/crypto.h                        |  32 +++++
>  62 files changed, 550 insertions(+), 279 deletions(-)
> 
> -- 
> 2.27.0
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

