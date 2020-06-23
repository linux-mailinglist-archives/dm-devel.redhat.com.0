Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DF03D205602
	for <lists+dm-devel@lfdr.de>; Tue, 23 Jun 2020 17:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592926460;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wWZacv5iyTizFf+vvuUok4df2Xp157g/ltWQYeiBD7s=;
	b=YN1MvlS0jVIW9kel/oOerlHTBMczwylEumTVYXj6vQlAnpGz7d/jWwLDsS8AljXVtP32zv
	F2YL3umU8EQpsk+cC0ZZLxcMO7Rt/+ieWxlVeUYn6WqaR7F5LoWtdjbgeA1PtyYWLvHqGV
	In7DhSCr98AFXnS+i52tOreK63/OeAA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-u1ekIGiHMRCzdwAprSaUTg-1; Tue, 23 Jun 2020 11:34:18 -0400
X-MC-Unique: u1ekIGiHMRCzdwAprSaUTg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D7198035A8;
	Tue, 23 Jun 2020 15:34:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D40B7166A;
	Tue, 23 Jun 2020 15:34:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB79D833D2;
	Tue, 23 Jun 2020 15:34:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05NFXux5021119 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 11:33:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D4D507CCD2; Tue, 23 Jun 2020 15:33:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B0597CCF9;
	Tue, 23 Jun 2020 15:33:53 +0000 (UTC)
Date: Tue, 23 Jun 2020 11:33:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
	Ignat Korchagin <ignat@cloudflare.com>
Message-ID: <20200623153352.GA19783@redhat.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
	<20200620012332.GA25340@gondor.apana.org.au>
MIME-Version: 1.0
In-Reply-To: <20200620012332.GA25340@gondor.apana.org.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: kernel-team@cloudflare.com, dm-crypt@saout.de, linux-kernel@vger.kernel.org,
	dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>,
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

On Fri, Jun 19 2020 at  9:23pm -0400,
Herbert Xu <herbert@gondor.apana.org.au> wrote:

> On Fri, Jun 19, 2020 at 02:39:39PM -0400, Mikulas Patocka wrote:
> >
> > I'm looking at this and I'd like to know why does the crypto API fail in 
> > hard-irq context and why does it work in tasklet context. What's the exact 
> > reason behind this?
> 
> You're not supposed to do any real work in IRQ handlers.  All
> the substantial work should be postponed to softirq context.
> 
> Why do you need to do work in hard IRQ context?

Ignat, think you may have missed Herbert's question?

My understanding is that you're doing work in hard IRQ context (via
tasklet) precisely to avoid overhead of putting to a workqueue?  Did
you try using a workqueue and it didn't work adequately?  If so, do you
have a handle on why that is?  E.g. was it due to increased latency? or
IO completion occurring on different cpus that submitted (are you
leaning heavily on blk-mq's ability to pin IO completion to same cpu as
IO was submitted?)

I'm fishing here but I'd just like to tease out the details for _why_
you need to do work from hard IRQ via tasklet so that I can potentially
defend it if needed.

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

