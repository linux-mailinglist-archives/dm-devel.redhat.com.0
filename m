Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 03907206B81
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 07:05:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592975121;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NoNCPWZaC2//9FtNY5s/l1olunk4GotUg0rx+K21O1w=;
	b=LyIP8P61FMEWStm9e4V7G6rvS6ceBflBarxsHN8hmgDwl8GQepUPiRzuqE00SHgBxTrKyE
	pYbMtf+iFkkLkRJDq11p9Zx7aFj84C6zSlawBaIEyKuVdd/XBSwFXri7ONGOIGDbt1l/tV
	DUcYBoDLYbN6iVgFEJ8JOM+wtucRUhM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-QawfP9l-NKKNdPC-jStwZw-1; Wed, 24 Jun 2020 01:05:19 -0400
X-MC-Unique: QawfP9l-NKKNdPC-jStwZw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F5FC800D5C;
	Wed, 24 Jun 2020 05:05:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8B0F60CD3;
	Wed, 24 Jun 2020 05:05:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 776D31809547;
	Wed, 24 Jun 2020 05:05:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O553Pb017114 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 01:05:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B32320182A4; Wed, 24 Jun 2020 05:05:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8683D2029F83
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:05:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AB812101A525
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:05:00 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-56-_YDusF35PzWDXC59tOVDyQ-1; 
	Wed, 24 Jun 2020 01:04:56 -0400
X-MC-Unique: _YDusF35PzWDXC59tOVDyQ-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 7C2D1206E2;
	Wed, 24 Jun 2020 05:04:54 +0000 (UTC)
Date: Tue, 23 Jun 2020 22:04:52 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Ignat Korchagin <ignat@cloudflare.com>
Message-ID: <20200624050452.GB844@sol.localdomain>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
MIME-Version: 1.0
In-Reply-To: <20200619164132.1648-2-ignat@cloudflare.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: snitzer@redhat.com, kernel-team@cloudflare.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com, agk@redhat.com
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

On Fri, Jun 19, 2020 at 05:41:32PM +0100, Ignat Korchagin wrote:
> Sometimes extra thread offloading imposed by dm-crypt hurts IO latency. This is
> especially visible on busy systems with many processes/threads. Moreover, most
> Crypto API implementaions are async, that is they offload crypto operations on
> their own, so this dm-crypt offloading is excessive.

This really should say "some Crypto API implementations are async" instead of
"most Crypto API implementations are async".

Notably, the AES-NI implementation of AES-XTS is synchronous if you call it in a
context where SIMD instructions are usable.  It's only asynchronous when SIMD is
not usable.  (This seems to have been missed in your blog post.)

> This adds a new flag, which directs dm-crypt not to offload crypto operations
> and process everything inline. For cases, where crypto operations cannot happen
> inline (hard interrupt context, for example the read path of the NVME driver),
> we offload the work to a tasklet rather than a workqueue.

This patch both removes some dm-crypt specific queueing, and changes decryption
to use softIRQ context instead of a workqueue.  It would be useful to know how
much of a difference the workqueue => softIRQ change makes by itself.  Such a
change could be useful for fscrypt as well.  (fscrypt uses a workqueue for
decryption, but besides that doesn't use any other queueing.)

> @@ -127,7 +128,7 @@ struct iv_elephant_private {
>   * and encrypts / decrypts at the same time.
>   */
>  enum flags { DM_CRYPT_SUSPENDED, DM_CRYPT_KEY_VALID,
> -	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD };
> +	     DM_CRYPT_SAME_CPU, DM_CRYPT_NO_OFFLOAD, DM_CRYPT_FORCE_INLINE = (sizeof(unsigned long) * 8 - 1) };

Assigning a specific enum value isn't necessary.

> @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
>  
>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
>  
> -	/*
> -	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> -	 * requests if driver request queue is full.
> -	 */
> -	skcipher_request_set_callback(ctx->r.req,
> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> -	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> +		/* make sure we zero important fields of the request */
> +		skcipher_request_set_callback(ctx->r.req,
> +	        0, NULL, NULL);
> +	else
> +		/*
> +		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> +		 * requests if driver request queue is full.
> +		 */
> +		skcipher_request_set_callback(ctx->r.req,
> +	        CRYPTO_TFM_REQ_MAY_BACKLOG,
> +	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
>  }

This looks wrong.  Unless type=0 and mask=CRYPTO_ALG_ASYNC are passed to
crypto_alloc_skcipher(), the skcipher implementation can still be asynchronous,
in which case providing a callback is required.

Do you intend that the "force_inline" option forces the use of a synchronous
skcipher (alongside the other things it does)?  Or should it still allow
asynchronous ones?

We may not actually have a choice in that matter, since xts-aes-aesni has the
CRYPTO_ALG_ASYNC bit set (as I mentioned) despite being synchronous in most
cases; thus, the crypto API won't give you it if you ask for a synchronous
cipher.  So I think you still need to allow async skciphers?  That means a
callback is still always required.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

