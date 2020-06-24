Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 223A3209C0D
	for <lists+dm-devel@lfdr.de>; Thu, 25 Jun 2020 11:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593078007;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pzrtzAbv9BjVtODvfsYLSYACGWQyIn4u90TjeJlUngo=;
	b=hGAuhg3vmAhT00XPOfKH+UqGv7e3hHWvkto7C0FbfU2OojIuqI+Yn/D5YqR5yUCGySAO5A
	eDia/BVZqWf6nXf30k+YH/QPcQu4Ikce979oAXk3hebAP7izcXD+OfOo9pfsKl+lWomGbr
	hfvD5TFrAAnoq55DniCFkW5w5xZ0p8w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-3ZdGUwucPl6SCJ0HJ6oRoA-1; Thu, 25 Jun 2020 05:39:28 -0400
X-MC-Unique: 3ZdGUwucPl6SCJ0HJ6oRoA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4C3E419200C1;
	Thu, 25 Jun 2020 09:39:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AAA08891D8;
	Thu, 25 Jun 2020 09:39:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 090B41809554;
	Thu, 25 Jun 2020 09:39:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OH14MZ006521 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 13:01:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0B236F1030; Wed, 24 Jun 2020 17:01:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0496FF11DA
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 17:01:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CC41F188B2A5
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 17:01:00 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-369-6Jz41t_KOb2bJ_eMSOSJAw-1; Wed, 24 Jun 2020 13:00:58 -0400
X-MC-Unique: 6Jz41t_KOb2bJ_eMSOSJAw-1
Received: by mail-wm1-f66.google.com with SMTP id u26so4923628wmn.1
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 10:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=zzdtk8DulCgW8E9yPjMJMwgX0/d4dwgCrXDFpHfsYHM=;
	b=PkSX3t22FVjmj2n4r4oB571Llv14BAPGf+SqioLql2s9Z1/6yec9odsmPqBefryPDp
	GDQpkygeYdI7HKO1/P3qwProM3VdpwUcxeMgNrGfvJWb7k8xXiFeiS7/DBVGKw8mWNdO
	k54cJEgcpPmN2O0O3r9ruLLNOifRdQJYIP3TEa3969byk4dUWAUXxFdpNXO3EaFt0hN5
	kJgFhEIZ+x4HTiFwecxsjFy3y1ZN6jFJvEgvDL4x+i5Q/8oZ0IdnjXOgMn4/nfenMYXq
	RRgpA43iqPdx+V69fRZw7rM/gaHJMXQLJMTqgrLrMmvx0IR83/vR59L7lK9EPz3lwYHG
	+AOw==
X-Gm-Message-State: AOAM532kpap6xkUkZRAk/x7e+WKttkEq4uCA8ITcFa7kGpg/MF2UMZwN
	Jmx77jMQT45yaS9NPV1XvME+PY8GXXBtVHa8yP9mvA==
X-Google-Smtp-Source: ABdhPJx/+lRT2+hBd9KUPGRmFQSii8Z7C7Y2ImR7URuMi/+pppmPVDaua1f+kOHNlj3EjiwNboNV9qchU5FrvFlCTPc=
X-Received: by 2002:a1c:238d:: with SMTP id j135mr1374992wmj.46.1593018057039; 
	Wed, 24 Jun 2020 10:00:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
	<CALrw=nFduv_X83V1Dfz+bt4bZqT19OSi3q5f7umhty1-DQ2SPg@mail.gmail.com>
	<20200624162407.GB200774@gmail.com>
In-Reply-To: <20200624162407.GB200774@gmail.com>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 24 Jun 2020 18:00:45 +0100
Message-ID: <CALrw=nG-aduc2F0q=d1LXRG_mxJUSrE3xQHQDRQ_UbAx7TQeiQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 25 Jun 2020 05:38:56 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, kernel-team <kernel-team@cloudflare.com>,
	dm-crypt@saout.de, linux-kernel <linux-kernel@vger.kernel.org>,
	dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [dm-crypt] [RFC PATCH 1/1] Add DM_CRYPT_FORCE_INLINE
 flag to dm-crypt target
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 24, 2020 at 5:24 PM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Jun 24, 2020 at 09:24:07AM +0100, Ignat Korchagin wrote:
> > On Wed, Jun 24, 2020 at 6:04 AM Eric Biggers <ebiggers@kernel.org> wrote:
> > >
> > > On Fri, Jun 19, 2020 at 05:41:32PM +0100, Ignat Korchagin wrote:
> > > > Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
> > > > especially visible on busy systems with many processes/threads. Moreover, most
> > > > Crypto API implementaions are async, that is they offload crypto operations on
> > > > their own, so this dm-crypt offloading is excessive.
> > >
> > > This really should say "some Crypto API implementations are async" instead of
> > > "most Crypto API implementations are async".
> >
> > The most accurate would probably be: most hardware-accelerated Crypto
> > API implementations are async
> >
> > > Notably, the AES-NI implementation of AES-XTS is synchronous if you call it in a
> > > context where SIMD instructions are usable.  It's only asynchronous when SIMD is
> > > not usable.  (This seems to have been missed in your blog post.)
> >
> > No, it was not. This is exactly why we made xts-proxy Crypto API
> > module as a second patch. But it seems now it does not make a big
> > difference if a used Crypto API implementation is synchronous as well
> > (based on some benchmarks outlined in the cover letter to this patch).
> > I think the v2 of this patch will not require a synchronous Crypto
> > API. This is probably a right thing to do, as the "inline" flag should
> > control the way how dm-crypt itself handles requests, not how Crypto
> > API handles requests. If a user wants to ensure a particular
> > synchronous Crypto API implementation, they can already reconfigure
> > dm-crypt and specify the implementation with a "capi:" prefix in the
> > the dm table description.
>
> I think you're missing the point.  Although xts-aes-aesni has the
> CRYPTO_ALG_ASYNC bit set, the actual implementation processes the request
> synchronously if SIMD instructions are currently usable.  That's always the case
> in dm-crypt, as far as I can tell.  This algorithm has the ASYNC flag only
> because it's not synchronous when called in hardIRQ context.
>
> That's why your "xts-proxy" doesn't make a difference, and why it's misleading
> to suggest that the crypto API is doing its own queueing when you're primarily
> talking about xts-aes-aesni.  The crypto API definitely can do its own queueing,
> mainly with hardware drivers.  But it doesn't in this common and relevant case.

I think we're talking about the same things but from different points
of view. I would like to clarify that the whole post and this change
does not have the intention to focus on aesni (or any x86-specific
crypto optimizations). In fact it is quite the opposite: we want to
optimize the generic dm-crypt regardless of which crypto is used
(that's why I just used a NULL cipher in the cover letter). We also
have some arm64 machines [1] and I bet they would benefit here as
well. The important point my post tries to make is that the original
workqueue offloading in dm-crypt was added because the Crypto API was
synchronous back in the day and, exactly as you say, you may not be
able to use some hw-accelerated crypto in hard IRQ context as well as
doing non-hw crypto in hard IRQ context is a bad idea. Now, most
Crypto API are smart enough to figure out on their own if they should
process the request inline or offload it to a workqueue, so the
workarounds in the dm-crypt itself most likely are not needed. Though,
the generic Crypto API "cipher walk" function does refuse to "walk"
the buffers in hard IRQ context, so the "tasklet" functionality is
still required.

But from the dm-crypt perspective - it should not take into account if
a particular xts-aes-aesni implementation is MOSTLY synchronous -
those are details of the implementation of this particular cipher
dm-crypt has no visibility into. So it would be right to say in my
opinion if the cipher has the CRYPTO_ALG_ASYNC flag set - it can
offload the crypto request to a workqueue at any time. How often does
it do it - that's another story and probably should be reviewed
elsewhere, if it does it too often.

Ignat

[1]: https://blog.cloudflare.com/arm-takes-wing/

> - Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

