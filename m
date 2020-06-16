Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 423631FBD53
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 19:50:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592329855;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=e2rTBw3Y81gdpaLlEbaf/ZrQ9qM+Fdloir89tQrQcTo=;
	b=E7khvHPn7qpAW9KZPUaDSx94tW9T5JBdsG9ePxLZaSR/1YiykOFwvzbb41cfvJ2uMsVaZI
	pvQZ1+IZXnOpxzQU1pCwZK1hxtma/t5G4dUDR9/yRElblGwts15lc5uTgzQvdxY6Pb74ga
	lg+LNd6mggu+WM9x3uFlzPuNoV2zd6g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-EGdblMd3MHq9Z9phYQmLJA-1; Tue, 16 Jun 2020 13:50:52 -0400
X-MC-Unique: EGdblMd3MHq9Z9phYQmLJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4DFEB18FF663;
	Tue, 16 Jun 2020 17:50:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8E6E5C1BD;
	Tue, 16 Jun 2020 17:50:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 09AF3833C6;
	Tue, 16 Jun 2020 17:50:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GHoYdi015548 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 13:50:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7C2A5AF79A; Tue, 16 Jun 2020 17:50:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77F08951C0
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:50:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2688C8007B1
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 17:50:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-254-ZW9UjcktOhGATRBe4mJ9-Q-1;
	Tue, 16 Jun 2020 13:50:26 -0400
X-MC-Unique: ZW9UjcktOhGATRBe4mJ9-Q-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6636120739;
	Tue, 16 Jun 2020 17:50:24 +0000 (UTC)
Date: Tue, 16 Jun 2020 10:50:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200616175022.GD207319@gmail.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
	<alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161102250.28052@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006161102250.28052@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	linux-crypto@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] crypto: fix the drivers that don't
 respect CRYPTO_TFM_REQ_MAY_SLEEP
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

On Tue, Jun 16, 2020 at 11:02:50AM -0400, Mikulas Patocka wrote:
> Fix the crypto drivers that don't respect CRYPTO_TFM_REQ_MAY_SLEEP. If
> CRYPTO_TFM_REQ_MAY_SLEEP is not set, the driver must not do allocation
> that sleeps.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

I think you need to split this up per driver with a proper explanation and a
"Fixes:" tag for each driver.

Also, these bugs should have been detected by the crypto self-tests already,
since they test having preemption disabled and CRYPTO_TFM_REQ_MAY_SLEEP cleared.
Can you double check whether these are all valid fixes?  One thing to watch out
for is that CRYPTO_TFM_REQ_MAY_SLEEP only applies to the function call like
crypto_skcipher_encrypt() itself.  If the implementation is asynchronous and the
request gets processed in the background (i.e. if crypto_skcipher_encrypt()
returns -EINPROGRESS), the background work doesn't have to honor
CRYPTO_TFM_REQ_MAY_SLEEP.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

