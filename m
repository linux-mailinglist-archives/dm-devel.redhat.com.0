Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D5558736
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 18:36:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DE2F8307D921;
	Thu, 27 Jun 2019 16:35:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70BD660856;
	Thu, 27 Jun 2019 16:35:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA7361806B1B;
	Thu, 27 Jun 2019 16:34:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RGWjL4003285 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 12:32:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0491F19723; Thu, 27 Jun 2019 16:32:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F154919C4F
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:32:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 072643001836
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:32:29 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 256742133F;
	Thu, 27 Jun 2019 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561653143;
	bh=l+tpA8pTSE7U2Xt092Cu2tDM10p0PpnM8sLMPlQKFsM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lUjg23UCBQQEqIOZnF8gvrMMj8kB7OF23AlJoJG1+1WZMSXu61OilQF2cqiaIDcff
	Gu6WhfcS4pR1m17ItBlI9zulFWiLYv7Pym6PrNQjANgtCjF3SEXBb21iQBj8bIl5gO
	dpyjyl71HNu2mF0UYpdRkLg0suGaUq742fuZz5WA=
Date: Thu, 27 Jun 2019 09:32:21 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190627163221.GC686@sol.localdomain>
References: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
	<20190626204047.32131-6-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626204047.32131-6-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Thu, 27 Jun 2019 16:32:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Thu, 27 Jun 2019 16:32:29 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v5 5/7] crypto: essiv - add test vector for
 essiv(cbc(aes), aes, sha256)
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 27 Jun 2019 16:36:50 +0000 (UTC)

On Wed, Jun 26, 2019 at 10:40:45PM +0200, Ard Biesheuvel wrote:
> Add a test vector for the ESSIV mode that is the most widely used,
> i.e., using cbc(aes) and sha256.
> 
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> ---
>  crypto/tcrypt.c  |   9 +
>  crypto/testmgr.c |   6 +
>  crypto/testmgr.h | 213 ++++++++++++++++++++
>  3 files changed, 228 insertions(+)

Shouldn't there be an authenc test vector too?  Otherwise there will be no way
to test the AEAD support in essiv.c using the crypto self-tests.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
