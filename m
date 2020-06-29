Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 54EF520CEC9
	for <lists+dm-devel@lfdr.de>; Mon, 29 Jun 2020 15:17:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593436662;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=66c9zC0rViueakQQcCVKZoq5q5hU12ezlI5CEK62njg=;
	b=g0LPFJD8BfJ59r/RMVFgCPeMwh4l4bQ3rdl+Y3HBlIDZ+MuebsRwUF5+LP+71ZrGkASRhs
	ZQ1Hdwtv1yQAOX3ayHGmGhcSzcPKpq6fn0jrrms7LUxpsgb6HdO9IjCfksq2FyhJ+N9x2W
	MHYiRdTJJCMKZOGRx15hNGqnuRQclRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-92-qRt3HmOXP3W0UvYqMkmO9A-1; Mon, 29 Jun 2020 09:17:38 -0400
X-MC-Unique: qRt3HmOXP3W0UvYqMkmO9A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFB00107ACCA;
	Mon, 29 Jun 2020 13:17:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1192160BEC;
	Mon, 29 Jun 2020 13:17:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0648E1809547;
	Mon, 29 Jun 2020 13:17:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05TDHEwo008573 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jun 2020 09:17:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 344882B4A5; Mon, 29 Jun 2020 13:17:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 062BD2B47C;
	Mon, 29 Jun 2020 13:17:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05TDH9li012066; Mon, 29 Jun 2020 09:17:09 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05TDH8JV012062; Mon, 29 Jun 2020 09:17:08 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 29 Jun 2020 09:17:08 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200628200022.GE11197@sol.localdomain>
Message-ID: <alpine.LRH.2.02.2006290905340.11293@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<20200626170039.GB211634@gmail.com>
	<alpine.LRH.2.02.2006281505530.347@file01.intranet.prod.int.rdu2.redhat.com>
	<20200628200022.GE11197@sol.localdomain>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v2] crypto: introduce the flag
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sun, 28 Jun 2020, Eric Biggers wrote:

> On Sun, Jun 28, 2020 at 03:07:49PM -0400, Mikulas Patocka wrote:
> > > 
> > > cryptd_create_skcipher(), cryptd_create_hash(), cryptd_create_aead(), and
> > > crypto_rfc4309_create() are also missing setting the mask.
> > > 
> > > pcrypt_create_aead() is missing both setting the mask and inheriting the flags.
> > 
> > I added CRYPTO_ALG_ALLOCATES_MEMORY there.
> 
> I don't see where the cryptd request processing functions allocate memory.
> 
> It seems that cryptd should just inherit the flag, like most other templates.
> 
> Likewise for pcrypt.
> 
> And also likewise for rfc4309.
> 
> Where are you seeing the memory allocations that would require
> CRYPTO_ALG_ALLOCATES_MEMORY to always be enabled for these?
> 
> - Eric

This was some misunderstanding. You said "cryptd_create_skcipher ... is 
missing both setting the mask and inheriting the flags.", so I understood 
it so that it should inherit CRYPTO_ALG_INHERITED_FLAGS and set 
CRYPTO_ALG_ALLOCATES_MEMORY unconditionally.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

