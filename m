Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 98593337C89
	for <lists+dm-devel@lfdr.de>; Thu, 11 Mar 2021 19:25:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1615487139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BAhAPDtWPs5NxYSATHAo0I9YW/7UDFPeKxHVJDlmpKw=;
	b=X+l0hpVlEui4poR8bL5ysHPG0P3AApgiO0zWcAzF3+0dq3E/0dMxktqxTFq7wzSc+eN6OO
	pkWvSlnWQWwb+SPBfPrvPqODwRgjPSXB5TzWimtewuBe88P4sdtUD+fo8lH7I+l5crbQLA
	RiaDLP3r3Bk/CL3gHO4EsZwADmjNcPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-GnSLzBwAO2aIjSzQA6h6Hw-1; Thu, 11 Mar 2021 13:25:36 -0500
X-MC-Unique: GnSLzBwAO2aIjSzQA6h6Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF9EF19067E1;
	Thu, 11 Mar 2021 18:25:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B759E610A8;
	Thu, 11 Mar 2021 18:25:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA73F57DC1;
	Thu, 11 Mar 2021 18:25:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12BIPBjH029435 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 13:25:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EB2C95D75F; Thu, 11 Mar 2021 18:25:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6BC5D6D7;
	Thu, 11 Mar 2021 18:25:08 +0000 (UTC)
Date: Thu, 11 Mar 2021 13:25:08 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Ignat Korchagin <ignat@cloudflare.com>
Message-ID: <20210311182507.GA28637@redhat.com>
References: <20210213111146.3080152-1-bigeasy@linutronix.de>
	<20210213111146.3080152-3-bigeasy@linutronix.de>
	<CALrw=nHhOST4udsCrExA7CVLWjWQyNLPau8jde6yq3FR7ONQMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALrw=nHhOST4udsCrExA7CVLWjWQyNLPau8jde6yq3FR7ONQMw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	device-mapper development <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/6] dm crypt: Handle DM_CRYPT_NO_*_WORKQUEUE
 more explicit.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 13 2021 at  9:31am -0500,
Ignat Korchagin <ignat@cloudflare.com> wrote:

> On Sat, Feb 13, 2021 at 11:11 AM Sebastian Andrzej Siewior
> <bigeasy@linutronix.de> wrote:
> >
> > By looking at the handling of DM_CRYPT_NO_*_WORKQUEUE in
> > kcryptd_queue_crypt() it appears that READ and WRITE requests might be
> > handled in the tasklet context as long as interrupts are disabled or it
> > is handled in hardirq context.
> >
> > The WRITE requests should always be fed in preemptible context. There
> > are other requirements in the write path which sleep or acquire a mutex.
> >
> > The READ requests should come from the storage driver, likely not in a
> > preemptible context. The source of the requests depends on the driver
> > and other factors like multiple queues in the block layer.
> 
> My personal opinion: I really don't like the guesswork and
> assumptions. If we want
> to remove the usage of in_*irq() and alike, we should propagate the execution
> context from the source. Storage drivers have this information and can
> pass it on to the device-mapper framework, which in turn can pass it
> on to dm modules.

I'm missing where DM core has the opportunity to convey this context in
a clean manner.

Any quick patch that shows the type of transform you'd like to see would
be appreciated.. doesn't need to be comprehensive, just enough for me or
others to carry through to completion.
 
> Assuming WRITE requests are always in preemptible context might break with the
> addition of some new type of obscure storage hardware.
> 
> In our testing we saw a lot of cases with SATA disks, where READ requests come
> from preemptible contexts, so probably don't want to pay (no matter how small)
> tasklet setup overhead, not to mention executing it in softirq, which
> is hard later to
> attribute to a specific process in metrics.
> 
> In other words, I think we should be providing support for this in the
> device-mapper
> framework itself, not start from individual modules.

I think your concerns are valid... it does seem like this patch is
assuming too much.

Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

