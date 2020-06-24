Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3213A2068FC
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 02:23:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592958232;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4c37/VY2+nB0RdeJTV4LGR4rN12/3ZJm7riX8PpN20U=;
	b=S2X2PVdvknU6NbFaIAZrZqDEM46uGk6igtO2kFB9bBeKoXagUFs5Sxa/mgXQVx4Svca+kJ
	tpwcKTU/shPBnA1BCx9P3FV+2/HZ9vTg3vjcDDHOHvFiOvCzsMJNVZkCBLGWjYIIdORTzU
	n66ReI6k0a5MeiVMJ8kW3/yg+oZPpMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-ECR0bz3nP6O5YHBEH3F96A-1; Tue, 23 Jun 2020 20:23:50 -0400
X-MC-Unique: ECR0bz3nP6O5YHBEH3F96A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4874819057D8;
	Wed, 24 Jun 2020 00:23:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 705425C1D4;
	Wed, 24 Jun 2020 00:23:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 10C7A833C6;
	Wed, 24 Jun 2020 00:23:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O0NHvN017487 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 20:23:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 67AE07933D; Wed, 24 Jun 2020 00:23:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from fornost.hmeau.com (vpn2-54-19.bne.redhat.com [10.64.54.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2384079333;
	Wed, 24 Jun 2020 00:23:07 +0000 (UTC)
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
	by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
	id 1jntBt-0007UK-4q; Wed, 24 Jun 2020 10:23:02 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
	Wed, 24 Jun 2020 10:23:01 +1000
Date: Wed, 24 Jun 2020 10:23:01 +1000
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ignat Korchagin <ignat@cloudflare.com>
Message-ID: <20200624002301.GB12716@gondor.apana.org.au>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
	<20200620012332.GA25340@gondor.apana.org.au>
	<20200623153352.GA19783@redhat.com>
	<CALrw=nEjCdg8BuTFT81+tCDtuxgwy05FKZAdvk3oq+pauW0nDA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALrw=nEjCdg8BuTFT81+tCDtuxgwy05FKZAdvk3oq+pauW0nDA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, kernel-team <kernel-team@cloudflare.com>,
	dm-crypt@saout.de, linux-kernel <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tue, Jun 23, 2020 at 05:24:39PM +0100, Ignat Korchagin wrote:
> 
> I may be misunderstanding the terminology, but tasklets execute in
> soft IRQ, don't they? What we care about is to execute the decryption
> as fast as possible, but we can't do it in a hard IRQ context (that
> is, the interrupt context where other interrupts are disabled). As far
> as I understand, tasklets are executed right after the hard IRQ
> context, but with interrupts enabled - which is the first safe-ish
> place to do more lengthy processing without the risk of missing an
> interrupt.

Yes you are absolutely right.  In general high-performance work
should be carried out in softirq context.  That's how the networking
stack works for example.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

