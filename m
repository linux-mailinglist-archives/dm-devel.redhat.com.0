Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5A258762
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 18:42:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 82FF4A6DEF;
	Thu, 27 Jun 2019 16:41:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4950D5C1B4;
	Thu, 27 Jun 2019 16:41:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B2CCF206D2;
	Thu, 27 Jun 2019 16:41:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5RGfAxN017905 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 27 Jun 2019 12:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDFB65C231; Thu, 27 Jun 2019 16:41:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7AA25C3FD
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:41:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A78B288306
	for <dm-devel@redhat.com>; Thu, 27 Jun 2019 16:40:52 +0000 (UTC)
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
	[24.5.143.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id EBA42208E3;
	Thu, 27 Jun 2019 16:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1561653647;
	bh=nNVG+IDzbIeEVq65elRdqny10jN+YiugKfrEYScPmbQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QkP9iRzla7wMEKlyWi2QYrAjIKvPg/6kpeDLXNvdvMxFCo8b272C5ZX5KlfYar2Av
	vllgmGG/Bh1qu/jloayliKN8fU2IgkKVj6sIow+Fh/cnwZkbkX/GvwFwDjl7+a3nBt
	UF+kV2Wlo6WEhFL6O8oZF3F6/M7wJlOBv3jcT7aw=
Date: Thu, 27 Jun 2019 09:40:45 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Message-ID: <20190627164045.GE686@sol.localdomain>
References: <20190626204047.32131-1-ard.biesheuvel@linaro.org>
	<20190626204047.32131-8-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626204047.32131-8-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 27 Jun 2019 16:40:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 27 Jun 2019 16:40:52 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'ebiggers@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.1  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE) 198.145.29.99 mail.kernel.org 198.145.29.99
	mail.kernel.org <ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-fscrypt@vger.kernel.org,
	Gilad Ben-Yossef <gilad@benyossef.com>, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, Milan Broz <gmazyland@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [dm-devel] [PATCH v5 7/7] crypto: arm64/aes - implement
 accelerated ESSIV/CBC mode
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Thu, 27 Jun 2019 16:42:03 +0000 (UTC)

On Wed, Jun 26, 2019 at 10:40:47PM +0200, Ard Biesheuvel wrote:
> Add an accelerated version of the 'essiv(cbc(aes),aes,sha256'
> skcipher, which is used by fscrypt, and in some cases, by dm-crypt.
> This avoids a separate call into the AES cipher for every invocation.

This technically should say "in some cases by fscrypt and dm-crypt", since as
we've discussed previously, most of the time this is not what fscrypt uses.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
