Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id DB0F2207307
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 14:15:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593000939;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FmdpWxD8HoVZcPid5AbyBt8rY3n8z52qdJ922G2/rK0=;
	b=bY1YQRG68s/ZYDJrB2hy2wMVl4pAu4UT80YUcWF/IQmaMBIQEKqnwthscSEUNQZhArcTAq
	AsQE88hkG7b3j6W2+7O1Gei/VwojK9X4ZmTQew+ZTG42vySPA3/+/zSfV3tzODD6omWCYq
	TRpbkDJLfdhWDLsnT9Aq+JPM8AQZDfg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-RejhI6DEMlyvJmSDNUA8UA-1; Wed, 24 Jun 2020 08:15:37 -0400
X-MC-Unique: RejhI6DEMlyvJmSDNUA8UA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1FC710059A1;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90B7E8926C;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 501601809547;
	Wed, 24 Jun 2020 12:15:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O8OQHs007204 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 04:24:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7F19410CD934; Wed, 24 Jun 2020 08:24:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7AA5310CD92F
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 08:24:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C12E58007D1
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 08:24:21 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-346-gwmpfPDZPTK7p5LnFa1wMQ-1; Wed, 24 Jun 2020 04:24:19 -0400
X-MC-Unique: gwmpfPDZPTK7p5LnFa1wMQ-1
Received: by mail-wr1-f66.google.com with SMTP id q5so1361384wru.6
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 01:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZKUQqWYXss6UwsektNBxaUWSfkOypOmk+SBkux4cMko=;
	b=abDpWzB3RY7En9nFhOwcteWm91NOhFduE5mhK8yr91T8bC/d6hBVPFHvngtl+bmiMo
	Z3GgBn2SKnHDZ01HEIB8Z0b29zwKtSTaicUSTghpCwRXZHfyLT/JeikSG5jwy3Dw9QSy
	xS4uWoM8swycmhHc/tDv/tMDw8bAP6u7IQnW8VOSGkKU3e70eMv6CEkYqYk72+jC5tfo
	74EsZ1oNnVy8phXAHwyYcURzPmyTR5tamc1HvXoa2uhmloJwEo2wqk7BzxLTSB6okKnB
	hs/4xtbKfKlBKL+qDeFU8Mkdmv/VUd0tPFbSuc0WeKrn8lvJMMzTAqDW7Jz+ONVIZINZ
	ml7A==
X-Gm-Message-State: AOAM532G4QokdSRl9CUL2f6tLqSSm50BbqMXm9HJTz5+rRwMby3zrV8F
	4ujYkr5q/1e8rpF0fvWB1gBaFqGY0H9tCQZwlrwWRkolhMU=
X-Google-Smtp-Source: ABdhPJyKC3fB2hgjwO4U2iyPJhYP+1AXJWpKVX8yrLAoKxRHvzRgYg1hcxJiDkHh3RVaaIs2U2agEDv6018f1mhKK5Y=
X-Received: by 2002:a5d:4992:: with SMTP id r18mr3963401wrq.323.1592987058129; 
	Wed, 24 Jun 2020 01:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
In-Reply-To: <20200624050452.GB844@sol.localdomain>
From: Ignat Korchagin <ignat@cloudflare.com>
Date: Wed, 24 Jun 2020 09:24:07 +0100
Message-ID: <CALrw=nFduv_X83V1Dfz+bt4bZqT19OSi3q5f7umhty1-DQ2SPg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:15:13 -0400
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

On Wed, Jun 24, 2020 at 6:04 AM Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Fri, Jun 19, 2020 at 05:41:32PM +0100, Ignat Korchagin wrote:
> > Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
> > especially visible on busy systems with many processes/threads. Moreover, most
> > Crypto API implementaions are async, that is they offload crypto operations on
> > their own, so this dm-crypt offloading is excessive.
>
> This really should say "some Crypto API implementations are async" instead of
> "most Crypto API implementations are async".

The most accurate would probably be: most hardware-accelerated Crypto
API implementations are async

> Notably, the AES-NI implementation of AES-XTS is synchronous if you call it in a
> context where SIMD instructions are usable.  It's only asynchronous when SIMD is
> not usable.  (This seems to have been missed in your blog post.)

No, it was not. This is exactly why we made xts-proxy Crypto API
module as a second patch. But it seems now it does not make a big
difference if a used Crypto API implementation is synchronous as well
(based on some benchmarks outlined in the cover letter to this patch).
I think the v2 of this patch will not require a synchronous Crypto
API. This is probably a right thing to do, as the "inline" flag should
control the way how dm-crypt itself handles requests, not how Crypto
API handles requests. If a user wants to ensure a particular
synchronous Crypto API implementation, they can already reconfigure
dm-crypt and specify the implementation with a "capi:" prefix in the
the dm table description.

> > This adds a new flag, which directs dm-crypt not to offload crypto operations
> > and process everything inline. For cases, where crypto operations cannot happen
> > inline (hard interrupt context, for example the read path of the NVME driver),
> > we offload the work to a tasklet rather than a workqueue.
>
> This patch both removes some dm-crypt specific queueing, and changes decryption
> to use softIRQ context instead of a workqueue.  It would be useful to know how
> much of a difference the workqueue => softIRQ change makes by itself.  Such a
> change could be useful for fscrypt as well.  (fscrypt uses a workqueue for
> decryption, but besides that doesn't use any other queueing.)
>
> > @@ -127,7 +128,7 @@ struct iv_elephant_private {
> >   * and encrypts / decrypts at the same time.
> >   */
> >  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
> > -          DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
> > +          DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD, DM_CRYPT_FORCE_INLINE = (sizeof(unsigned long) * 8 - 1) };
>
> Assigning a specific enum value isn't necessary.

Yes, this is a leftover from our "internal" patch which I wanted to
make "future proof" in case future iterations of dm-crypt will add
some flags to avoid flag collisions. Will remove in v2.

>
> > @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
> >
> >       skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
> >
> > -     /*
> > -      * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> > -      * requests if driver request queue is full.
> > -      */
> > -     skcipher_request_set_callback(ctx->r.req,
> > -         CRYPTO_TFM_REQ_MAY_BACKLOG,
> > -         kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> > +     if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> > +             /* make sure we zero important fields of the request */
> > +             skcipher_request_set_callback(ctx->r.req,
> > +             0, NULL, NULL);
> > +     else
> > +             /*
> > +              * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> > +              * requests if driver request queue is full.
> > +              */
> > +             skcipher_request_set_callback(ctx->r.req,
> > +             CRYPTO_TFM_REQ_MAY_BACKLOG,
> > +             kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> >  }
>
> This looks wrong.  Unless type=0 and mask=CRYPTO_ALG_ASYNC are passed to
> crypto_alloc_skcipher(), the skcipher implementation can still be asynchronous,
> in which case providing a callback is required.
>
> Do you intend that the "force_inline" option forces the use of a synchronous
> skcipher (alongside the other things it does)?  Or should it still allow
> asynchronous ones?

As mentioned above, I don't think we should require synchronous crypto
with the "force_inline" flag anymore. Although we may remove
CRYPTO_TFM_REQ_MAY_BACKLOG with the inline flag.

> We may not actually have a choice in that matter, since xts-aes-aesni has the
> CRYPTO_ALG_ASYNC bit set (as I mentioned) despite being synchronous in most
> cases; thus, the crypto API won't give you it if you ask for a synchronous
> cipher.  So I think you still need to allow async skciphers?  That means a
> callback is still always required.
>
> - Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

