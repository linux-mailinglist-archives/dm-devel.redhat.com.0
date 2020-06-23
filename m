Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A9F8B207305
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 14:15:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593000938;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xtURCsqn1zQvDaGP3FninSpfryJz5X0mUANYqb0xB8Q=;
	b=Fc65RCk/UA3KuVZ307wpkiGx1a7OqL5c5nEneCs71U89lNQ8tWknA1WAyomaVVQQBWAvdd
	yPqam24UCc7L5orW9alsnJ+qBSTe5gGhYVN3IldFnXIy2uMHCoQhlUzQhd4kjRX+ZHXC/D
	JzZAAFZldsUtG1I4lAD+GV4MmaWYj5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-r_LozkT1Okyy6FT1L0j1-Q-1; Wed, 24 Jun 2020 08:15:36 -0400
X-MC-Unique: r_LozkT1Okyy6FT1L0j1-Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465828015F5;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95CD05C660;
	Wed, 24 Jun 2020 12:15:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E5BCE1809547;
	Wed, 24 Jun 2020 12:15:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05NGP0ut027034 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Jun 2020 12:25:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 42696B5514; Tue, 23 Jun 2020 16:25:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3CE97B5515
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 16:24:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71D27800830
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 16:24:57 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-219-g7j4raroPxmWjDIka_VzpQ-1; Tue, 23 Jun 2020 12:24:51 -0400
X-MC-Unique: g7j4raroPxmWjDIka_VzpQ-1
Received: by mail-wm1-f68.google.com with SMTP id o2so103968wmh.2
	for <dm-devel@redhat.com>; Tue, 23 Jun 2020 09:24:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=k367pPi484Y9kqFj9L898KRU1GSNFO6+EeCIEPfvBJY=;
	b=XYxKU12oXeuJ12BrHAs6DLX2YcD3gN5TpA7JZIq8RJKq6if186/I/mI4N6pu88c5yG
	LOnU3tH7Uc/06LOOTqwBw3rbwLSrHdjswu5avb1DmBltSwtoOvUBZ3R5CkA2DUpFInPv
	ruR5iCVlMfDdGVfE6dJgg5azmB7aXlNje2Kjr+KfbYFevpIghlvNGFvU5lo6Y3mUpWTw
	+dEIcNolbMLeF3chnSloIzF6OmjPz3W+Le86wct4flRLAHKzobhEs1+4m6aQESJKT6Zs
	JDTi2ThGzAqHE1dyG78+dqcJaWV0JMaOKLlnBcTjvyHvKhyTfhWwgyZjwujXPA3BQtED
	Sxkg==
X-Gm-Message-State: AOAM533V4bsj+u6Tcn77uPTL6YLalyI6Qa4MRiMnzb2TNuUig00FPDIv
	VZ4D/l4YGm0Fc8LTzF23Defmy+rNXKckepKXfIy1qQ==
X-Google-Smtp-Source: ABdhPJxvX3K+jnTtOtYx0HTHHZBqcuVZPcjvflAhi+vkNusR5T41ex8V/k8bAFtX3IXYIbFAnZJhiP73WUsfoL1YcAY=
X-Received: by 2002:a1c:49c1:: with SMTP id w184mr24245992wma.46.1592929490533;
	Tue, 23 Jun 2020 09:24:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619165548.GA24779@redhat.com>
	<alpine.LRH.2.02.2006191429060.23991@file01.intranet.prod.int.rdu2.redhat.com>
	<20200620012332.GA25340@gondor.apana.org.au>
	<20200623153352.GA19783@redhat.com>
In-Reply-To: <20200623153352.GA19783@redhat.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Tue, 23 Jun 2020 17:24:39 +0100
Message-ID: <CALrw=nEjCdg8BuTFT81+tCDtuxgwy05FKZAdvk3oq+pauW0nDA@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:15:13 -0400
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	kernel-team <kernel-team@cloudflare.com>, dm-crypt@saout.de,
	linux-kernel <linux-kernel@vger.kernel.org>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>,
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jun 23, 2020 at 4:34 PM Mike Snitzer <snitzer@redhat.com> wrote:
>
> On Fri, Jun 19 2020 at  9:23pm -0400,
> Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> > On Fri, Jun 19, 2020 at 02:39:39PM -0400, Mikulas Patocka wrote:
> > >
> > > I'm looking at this and I'd like to know why does the crypto API fail in
> > > hard-irq context and why does it work in tasklet context. What's the exact
> > > reason behind this?
> >
> > You're not supposed to do any real work in IRQ handlers.  All
> > the substantial work should be postponed to softirq context.
> >
> > Why do you need to do work in hard IRQ context?
>
> Ignat, think you may have missed Herbert's question?
>
> My understanding is that you're doing work in hard IRQ context (via
> tasklet) precisely to avoid overhead of putting to a workqueue?  Did
> you try using a workqueue and it didn't work adequately?  If so, do you
> have a handle on why that is?  E.g. was it due to increased latency? or
> IO completion occurring on different cpus that submitted (are you
> leaning heavily on blk-mq's ability to pin IO completion to same cpu as
> IO was submitted?)
>
> I'm fishing here but I'd just like to tease out the details for _why_
> you need to do work from hard IRQ via tasklet so that I can potentially
> defend it if needed.

I may be misunderstanding the terminology, but tasklets execute in
soft IRQ, don't they? What we care about is to execute the decryption
as fast as possible, but we can't do it in a hard IRQ context (that
is, the interrupt context where other interrupts are disabled). As far
as I understand, tasklets are executed right after the hard IRQ
context, but with interrupts enabled - which is the first safe-ish
place to do more lengthy processing without the risk of missing an
interrupt.

Workqueues instead of tasklets - is the way how it is mostly
implemented now. But that creates additional IO latency, most probably
due to the fact that we're introducing CPU scheduling latency into the
overall read IO latency. This is confirmed by the fact that our busier
production systems have much worse and more important - spiky and
unstable p99 read latency, which somewhat correlates to high CPU
scheduling latency reported by metrics.

So, by inlining crypto or using a tasklet we're effectively
prioritising IO encryption/decryption. What we want to avoid is mixing
unpredicted additional latency from an unrelated subsystem (CPU
scheduler), because our expectation is that the total latency should
be real HW io latency + crypto operation latency (which is usually
quite stable).

I hope this makes sense.

>
> Thanks,
> Mike
>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

