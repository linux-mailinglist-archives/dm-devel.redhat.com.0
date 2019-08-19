Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F1B91D29
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 08:33:05 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 071413082E20;
	Mon, 19 Aug 2019 06:33:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84F8A5DAA0;
	Mon, 19 Aug 2019 06:32:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9E1BF2551C;
	Mon, 19 Aug 2019 06:32:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7J6WV51020035 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 02:32:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E0C8858776; Mon, 19 Aug 2019 06:32:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-105.bne.redhat.com [10.64.54.105])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A7F8B58C95
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 06:32:28 +0000 (UTC)
Received: from gondolin.me.apana.org.au ([192.168.0.6]
	helo=gondolin.hengli.com.au)
	by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hzbDI-0007E9-Fk; Mon, 19 Aug 2019 16:32:20 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hzbDG-0008Jt-7T; Mon, 19 Aug 2019 16:32:18 +1000
Date: Mon, 19 Aug 2019 16:32:18 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190819063218.GA31821@gondor.apana.org.au>
References: <20190815192858.28125-1-ard.biesheuvel@linaro.org>
	<20190815192858.28125-2-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190815192858.28125-2-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Eric Biggers <ebiggers@google.com>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v12 1/4] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 19 Aug 2019 06:33:04 +0000 (UTC)

On Thu, Aug 15, 2019 at 10:28:55PM +0300, Ard Biesheuvel wrote:
>
> +	/* Synchronous hash, e.g., "sha256" */
> +	ictx->hash = crypto_alloc_shash(shash_name, 0, 0);
> +	if (IS_ERR(ictx->hash)) {
> +		err = PTR_ERR(ictx->hash);
> +		goto out_drop_skcipher;
> +	}

Holding a reference to this algorithm for the life-time of the
instance is not nice.  How about just doing a lookup as you were
doing before with crypto_alg_mod_lookup and getting the cra_name
from that?

Thanks,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
