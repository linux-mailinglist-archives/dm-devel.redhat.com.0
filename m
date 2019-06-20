Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A3F4CB00
	for <lists+dm-devel@lfdr.de>; Thu, 20 Jun 2019 11:36:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9ACF5306E5FA;
	Thu, 20 Jun 2019 09:35:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA6D760FAB;
	Thu, 20 Jun 2019 09:35:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69FA5206D1;
	Thu, 20 Jun 2019 09:35:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5K9YYSr011293 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Jun 2019 05:34:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A8D0060477; Thu, 20 Jun 2019 09:34:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from deadmen.hmeau.com (ovpn-12-158.pek2.redhat.com [10.72.12.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F1C160166
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 09:34:32 +0000 (UTC)
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
	by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
	id 1hdtSg-0006zY-5v
	for <dm-devel@redhat.com>; Thu, 20 Jun 2019 17:34:30 +0800
Received: from herbert by gondobar with local (Exim 4.89)
	(envelope-from <herbert@gondor.apana.org.au>)
	id 1hdldl-0006f1-NM; Thu, 20 Jun 2019 09:13:25 +0800
Date: Thu, 20 Jun 2019 09:13:25 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20190620011325.phmxmeqnv2o3wqtr@gondor.apana.org.au>
References: <20190619162921.12509-1-ard.biesheuvel@linaro.org>
	<20190619162921.12509-2-ard.biesheuvel@linaro.org>
	<20190620010417.GA722@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190620010417.GA722@sol.localdomain>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>
Subject: Re: [dm-devel] [PATCH v3 1/6] crypto: essiv - create wrapper
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Thu, 20 Jun 2019 09:36:16 +0000 (UTC)

On Wed, Jun 19, 2019 at 06:04:17PM -0700, Eric Biggers wrote:
>
> > +#define ESSIV_IV_SIZE		sizeof(u64)	// IV size of the outer algo
> > +#define MAX_INNER_IV_SIZE	16		// max IV size of inner algo
> 
> Why does the outer algorithm declare a smaller IV size?  Shouldn't it just be
> the same as the inner algorithm's?

In general we allow outer algorithms to have distinct IV sizes
compared to the inner algorithm.  For example, rfc4106 has a
different IV size compared to gcm.

In this case, the outer IV size is the block number so that's
presumably why 64 bits is sufficient.  Do you forsee a case where
we need 128-bit block numbers?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
