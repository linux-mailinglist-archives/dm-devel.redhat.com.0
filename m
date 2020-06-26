Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 195EB20AB72
	for <lists+dm-devel@lfdr.de>; Fri, 26 Jun 2020 06:46:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593146791;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HmLDTSofwSnYX0ynKwXbL8EU/O54lpKiffTxXoFjXtM=;
	b=UtJ+ow6ueZQl5+ENEs4369H8fOElhclxsQ1nRtLArOrexOHGWSGuolzHycZV58mFUgpG78
	xWonu39jMUPhX5VMfUYGwa7244UW5mlTauSSKRDwPbMRpLoYZTFqmaIjEvUSsOG+BhEKpK
	J94aCgE9NFAcdHdF3bfzE0M+9FirKvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-nh9KOM8SPCqOnluNRidsDQ-1; Fri, 26 Jun 2020 00:46:28 -0400
X-MC-Unique: nh9KOM8SPCqOnluNRidsDQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD5F8800597;
	Fri, 26 Jun 2020 04:46:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B6027FEB5;
	Fri, 26 Jun 2020 04:46:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79A0618095FF;
	Fri, 26 Jun 2020 04:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05Q4joGJ031900 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 26 Jun 2020 00:45:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 861191011396; Fri, 26 Jun 2020 04:45:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 685F810016DA;
	Fri, 26 Jun 2020 04:45:47 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jogF4-0003af-KS; Fri, 26 Jun 2020 14:45:35 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Fri, 26 Jun 2020 14:45:34 +1000
Date: Fri, 26 Jun 2020 14:45:34 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200626044534.GA2870@gondor.apana.org.au>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, Zaibo Xu <xuzaibo@Huawei.com>,
	linux-kernel@vger.kernel.org, Wei Xu <xuwei5@hisilicon.com>,
	Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3] crypto: pass the flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 17, 2020 at 11:09:28AM -0400, Mikulas Patocka wrote:
>
> Index: linux-2.6/include/linux/crypto.h
> ===================================================================
> --- linux-2.6.orig/include/linux/crypto.h
> +++ linux-2.6/include/linux/crypto.h
> @@ -97,9 +97,18 @@
>  #define CRYPTO_ALG_OPTIONAL_KEY		0x00004000
>  
>  /*
> + * The driver may allocate memory during request processing, so it shouldn't be
> + * used in cases where memory allocation failures aren't acceptable, such as
> + * during block device encryption.
> + */
> +#define CRYPTO_ALG_ALLOCATES_MEMORY	0x00008000
> +
> +/*
>   * Don't trigger module loading
>   */
> -#define CRYPTO_NOLOAD			0x00008000
> +#define CRYPTO_NOLOAD			0x00010000
> +
> +#define CRYPTO_ALG_INHERITED_FLAGS	(CRYPTO_ALG_ASYNC | CRYPTO_ALG_ALLOCATES_MEMORY)

Any reason why you need to renumber NOLOAD? If not please keep
the existing values.

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

