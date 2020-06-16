Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC251FB54C
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jun 2020 17:01:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592319704;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CzF7VyBQUUbwXtEP7eWlnYZf2ibpV19yeHIsLT3nTwk=;
	b=QWMcVc36EzA+atNpfLJ0ufH5Y7CyDE89yhPPyNsf5mmbo71btt3/ajMUIcKOd0M8ZExXpx
	xVkjxHBNjL7LQRH29gOImefPEAytUBr4+PXTLP7KofmRCVzwAQw2yCtRqkL6wAL7eeZm+N
	HIYVsR+I4BrsFJMXCR7PW0oG0Wr53jM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-ahS7Wz2tOqK1LcLacyt6BA-1; Tue, 16 Jun 2020 11:01:41 -0400
X-MC-Unique: ahS7Wz2tOqK1LcLacyt6BA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D559134002;
	Tue, 16 Jun 2020 15:01:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7D15D9DA;
	Tue, 16 Jun 2020 15:01:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1314E1809547;
	Tue, 16 Jun 2020 15:01:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GF150P026097 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 11:01:05 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CC1A5867F4; Tue, 16 Jun 2020 15:01:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC5547FE95;
	Tue, 16 Jun 2020 15:01:01 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05GF11mo028805; Tue, 16 Jun 2020 11:01:01 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05GF10rb028801; Tue, 16 Jun 2020 11:01:01 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 16 Jun 2020 11:01:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <20200610121106.GA23137@gondor.apana.org.au>
Message-ID: <alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006091259250.30590@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610010450.GA6449@gondor.apana.org.au>
	<alpine.LRH.2.02.2006100756270.27811@file01.intranet.prod.int.rdu2.redhat.com>
	<20200610121106.GA23137@gondor.apana.org.au>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, linux-crypto@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] crypto API and GFP_ATOMIC
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 10 Jun 2020, Herbert Xu wrote:

> On Wed, Jun 10, 2020 at 08:02:23AM -0400, Mikulas Patocka wrote:
> >
> > Yes, fixing the drivers would be the best - but you can hardly find any 
> > person who has all the crypto hardware and who is willing to rewrite all 
> > the drivers for it.
> 
> We don't have to rewrite them straight away.  We could mark the
> known broken ones (or the known working ones) and then dm-crypt
> can allocate only those using the types/mask to crypto_alloc.
> 
> Cheers,

I triaged the drivers in drivers/crypto and unfortunatelly, most of them 
do memory allocation in the encryption routine. Some of the do GFP_KERNEL 
allocation even in the absence of CRYPTO_TFM_REQ_MAY_SLEEP.

I'm sending the patches:

The first patch adds a new flag CRYPTO_ALG_ALLOCATES_MEMORY.

The second patch passes CRYPTO_ALG_ALLOCATES_MEMORY through the crypto API 
stack (please check it - I am not an expert in this area).

The third patch sets CRYPTO_ALG_ALLOCATES_MEMORY on drivers that allocate 
memory in the encrypt/decrypt routine.

The fourth patch fixes the drivers that use GFP_KERNEL in non-blocking 
context.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

