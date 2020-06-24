Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFEA207902
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 18:25:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593015899;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BMqG1dZ8s3Uft0eIvNGYApCKEiMqYSvrgXKrQ+tPrVY=;
	b=WT14zLWysd4P/6/DrksX+W9BfXRFq/2YBLdGyaT44ljAd7hCGmHXVbMGF36CnhP/9lDxf1
	EEbDr7QwUphM3UQbsehKAAOVeOeLHTjZiqiTpUgsdkeyu36eg1yThVez0Sfy0gOVHxA8fK
	qBZRsJHQcbat8rPzYvtjh3UKVEkjox4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-tPlQ0iLjMMmzNA1VmSEKug-1; Wed, 24 Jun 2020 12:24:56 -0400
X-MC-Unique: tPlQ0iLjMMmzNA1VmSEKug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10717108BD0F;
	Wed, 24 Jun 2020 16:24:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CFA360F8A;
	Wed, 24 Jun 2020 16:24:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9B3361809542;
	Wed, 24 Jun 2020 16:24:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05OGOI5f003135 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 12:24:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9501D217B438; Wed, 24 Jun 2020 16:24:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E68C217B43D
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 16:24:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 269A28007A4
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 16:24:16 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-215-JKeDE4jaPKCtC86Y_kOTcg-1;
	Wed, 24 Jun 2020 12:24:10 -0400
X-MC-Unique: JKeDE4jaPKCtC86Y_kOTcg-1
Received: from gmail.com (unknown [104.132.1.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id CE7D520823;
	Wed, 24 Jun 2020 16:24:08 +0000 (UTC)
Date: Wed, 24 Jun 2020 09:24:07 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ignat Korchagin <ignat@cloudflare.com>
Message-ID: <20200624162407.GB200774@gmail.com>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
	<CALrw=nFduv_X83V1Dfz+bt4bZqT19OSi3q5f7umhty1-DQ2SPg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALrw=nFduv_X83V1Dfz+bt4bZqT19OSi3q5f7umhty1-DQ2SPg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 24, 2020 at 09:24:07AM +0100, Ignat Korchagin wrote:
> On Wed, Jun 24, 2020 at 6:04 AM Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > On Fri, Jun 19, 2020 at 05:41:32PM +0100, Ignat Korchagin wrote:
> > > Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
> > > especially visible on busy systems with many processes/threads. Moreover, most
> > > Crypto API implementaions are async, that is they offload crypto operations on
> > > their own, so this dm-crypt offloading is excessive.
> >
> > This really should say "some Crypto API implementations are async" instead of
> > "most Crypto API implementations are async".
> 
> The most accurate would probably be: most hardware-accelerated Crypto
> API implementations are async
> 
> > Notably, the AES-NI implementation of AES-XTS is synchronous if you call it in a
> > context where SIMD instructions are usable.  It's only asynchronous when SIMD is
> > not usable.  (This seems to have been missed in your blog post.)
> 
> No, it was not. This is exactly why we made xts-proxy Crypto API
> module as a second patch. But it seems now it does not make a big
> difference if a used Crypto API implementation is synchronous as well
> (based on some benchmarks outlined in the cover letter to this patch).
> I think the v2 of this patch will not require a synchronous Crypto
> API. This is probably a right thing to do, as the "inline" flag should
> control the way how dm-crypt itself handles requests, not how Crypto
> API handles requests. If a user wants to ensure a particular
> synchronous Crypto API implementation, they can already reconfigure
> dm-crypt and specify the implementation with a "capi:" prefix in the
> the dm table description.

I think you're missing the point.  Although xts-aes-aesni has the
CRYPTO_ALG_ASYNC bit set, the actual implementation processes the request
synchronously if SIMD instructions are currently usable.  That's always the case
in dm-crypt, as far as I can tell.  This algorithm has the ASYNC flag only
because it's not synchronous when called in hardIRQ context.

That's why your "xts-proxy" doesn't make a difference, and why it's misleading
to suggest that the crypto API is doing its own queueing when you're primarily
talking about xts-aes-aesni.  The crypto API definitely can do its own queueing,
mainly with hardware drivers.  But it doesn't in this common and relevant case.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

