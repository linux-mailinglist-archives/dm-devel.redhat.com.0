Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9DB201F89
	for <lists+dm-devel@lfdr.de>; Sat, 20 Jun 2020 03:50:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592617804;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k5M8j6tno+HcXoPpFx0HGpEBeGP8PAWskWuObF8LAX4=;
	b=hoOMWBMmbR/5quW9+OWNdW244SRz0xngipacpzQIqMqNIqz3eGKwen9XEO1iwOiIVCVj3P
	kmCAD9kn088WX4VTdi9+P2qMaKX22Vtma1zJ1G6mX9vynaB2jBx+QOI9vGzNhbM5nTlkJk
	AeLcjDRjF2OnKuEefxDVYPNCMwBk0l0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-JRMX3TD3POaqi3qypr1ycg-1; Fri, 19 Jun 2020 21:50:01 -0400
X-MC-Unique: JRMX3TD3POaqi3qypr1ycg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2C608018A5;
	Sat, 20 Jun 2020 01:49:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C2B7166B;
	Sat, 20 Jun 2020 01:49:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05D0F833BD;
	Sat, 20 Jun 2020 01:49:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05K1nO9d013239 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 21:49:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 168DD10336C0; Sat, 20 Jun 2020 01:49:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 11EAE1031F52
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 01:49:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1DFAD8316EB
	for <dm-devel@redhat.com>; Sat, 20 Jun 2020 01:49:22 +0000 (UTC)
Received: from fornost.hmeau.com (helcar.hmeau.com [216.24.177.18]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-301-jgWuH3RDPUqxpkNZ7eahOA-1; Fri, 19 Jun 2020 21:49:17 -0400
X-MC-Unique: jgWuH3RDPUqxpkNZ7eahOA-1
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jmSEH-0001pd-0w; Sat, 20 Jun 2020 11:23:34 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Sat, 20 Jun 2020 11:23:33 +1000
Date: Sat, 20 Jun 2020 11:23:33 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200620012332.GA25340@gondor.apana.org.au>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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
Content-Disposition: inline

On Fri, Jun 19, 2020 at 02:39:39PM -0400, Mikulas Patocka wrote:
>
> I'm looking at this and I'd like to know why does the crypto API fail in 
> hard-irq context and why does it work in tasklet context. What's the exact 
> reason behind this?

You're not supposed to do any real work in IRQ handlers.  All
the substantial work should be postponed to softirq context.

Why do you need to do work in hard IRQ context?

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

