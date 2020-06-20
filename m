Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 069FD202633
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jun 2020 21:37:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592681842;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hRe8bUHO8DpKSO+tTH2pB0OFMz5ewn9dgHKpfXj9LR4=;
	b=PuNEqXj8cytBGfwN+adPj5mEdkIJ2q2zMpYe6D+UMaGlnrWTsc14l2u2ijnOSbs2CcAlh+
	0/zAbYiWAYLNnCeToYZ6om295i14MPUAYTGj40uGoxE4gvlH/xq9QF1Dbhh3yHkpfzBZp6
	/WHpiQqA1HTaJzjIZpJvy91aVnoaLsc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-LFadGMxdO3egzU9IdWZFMg-1; Sat, 20 Jun 2020 15:37:20 -0400
X-MC-Unique: LFadGMxdO3egzU9IdWZFMg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C2C30107ACF2;
	Sat, 20 Jun 2020 19:37:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 14E2671661;
	Sat, 20 Jun 2020 19:37:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 61922833CE;
	Sat, 20 Jun 2020 19:36:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05KJaT8j017433 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 20 Jun 2020 15:36:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 729BB5BAD2; Sat, 20 Jun 2020 19:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A32A05BAD5;
	Sat, 20 Jun 2020 19:36:23 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 05KJaNfQ025067; Sat, 20 Jun 2020 15:36:23 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 05KJaMP8025063; Sat, 20 Jun 2020 15:36:22 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 20 Jun 2020 15:36:21 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Herbert Xu <herbert@gondor.apana.org.au>
In-Reply-To: <20200620012332.GA25340@gondor.apana.org.au>
Message-ID: <alpine.LRH.2.02.2006201535280.24999@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
	<20200620012332.GA25340@gondor.apana.org.au>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, kernel-team@cloudflare.com,
	dm-crypt@saout.de, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Ignat Korchagin <ignat@cloudflare.com>,
	"David S. Miller" <davem@davemloft.net>, agk@redhat.com
Subject: Re: [dm-devel] [RFC PATCH 0/1] dm-crypt excessive overhead
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Sat, 20 Jun 2020, Herbert Xu wrote:

> On Fri, Jun 19, 2020 at 02:39:39PM -0400, Mikulas Patocka wrote:
> >
> > I'm looking at this and I'd like to know why does the crypto API fail in 
> > hard-irq context and why does it work in tasklet context. What's the exact 
> > reason behind this?
> 
> You're not supposed to do any real work in IRQ handlers.  All
> the substantial work should be postponed to softirq context.

I see.

BTW - should it also warn if it is running in a process context with 
interrupts disabled?

Mikulas

> Why do you need to do work in hard IRQ context?
> 
> Cheers,
> -- 
> Email: Herbert Xu <herbert@gondor.apana.org.au>
> Home Page: http://gondor.apana.org.au/~herbert/
> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

