Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 43FCB206BA7
	for <lists+dm-devel@lfdr.de>; Wed, 24 Jun 2020 07:28:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592976488;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ejz9rQrqQbv6xzbvfcO149QFH6JUPTagA7KLPnnIJPQ=;
	b=MGcCeH+ozrf4eb2LLSOll+Jru5TVsvuetiTax3hSFYd7dhEckIb0Q7cdYLivV+sKDGriNv
	BG8DUpyxRx5nP2EnRhfbDAONX/5uAaIEEM0FasT+SwIFIA5ivMw/dddtbaZAQVznG5ZOUa
	DWD1hWxN+boU12YBAljecJAE1KFxc9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-yL2CWYlePsSIZeqj2tcF-g-1; Wed, 24 Jun 2020 01:28:05 -0400
X-MC-Unique: yL2CWYlePsSIZeqj2tcF-g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5C20C7443;
	Wed, 24 Jun 2020 05:27:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F11CC5D9C5;
	Wed, 24 Jun 2020 05:27:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C6854833D9;
	Wed, 24 Jun 2020 05:27:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05O5Rnxd020331 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 24 Jun 2020 01:27:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A27EC215671E; Wed, 24 Jun 2020 05:27:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E1CE2156A59
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:27:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99821100FD81
	for <dm-devel@redhat.com>; Wed, 24 Jun 2020 05:27:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-3-1bsXZuFaOZ-HH-9iYPZkGA-1;
	Wed, 24 Jun 2020 01:27:42 -0400
X-MC-Unique: 1bsXZuFaOZ-HH-9iYPZkGA-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2DAE42072E;
	Wed, 24 Jun 2020 05:27:41 +0000 (UTC)
Date: Tue, 23 Jun 2020 22:27:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Message-ID: <20200624052739.GC844@sol.localdomain>
References: <20200619164132.1648-1-ignat@cloudflare.com>
	<20200619164132.1648-2-ignat@cloudflare.com>
	<20200624050452.GB844@sol.localdomain>
	<CY4PR04MB37515EB3C74CCAE2A006202FE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB37515EB3C74CCAE2A006202FE7950@CY4PR04MB3751.namprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: "snitzer@redhat.com" <snitzer@redhat.com>,
	"kernel-team@cloudflare.com" <kernel-team@cloudflare.com>,
	"dm-crypt@saout.de" <dm-crypt@saout.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Ignat Korchagin <ignat@cloudflare.com>, "agk@redhat.com" <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jun 24, 2020 at 05:21:24AM +0000, Damien Le Moal wrote:
> >> @@ -1458,13 +1459,18 @@ static void crypt_alloc_req_skcipher(struct crypt_config *cc,
> >>  
> >>  	skcipher_request_set_tfm(ctx->r.req, cc->cipher_tfm.tfms[key_index]);
> >>  
> >> -	/*
> >> -	 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> >> -	 * requests if driver request queue is full.
> >> -	 */
> >> -	skcipher_request_set_callback(ctx->r.req,
> >> -	    CRYPTO_TFM_REQ_MAY_BACKLOG,
> >> -	    kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> >> +	if (test_bit(DM_CRYPT_FORCE_INLINE, &cc->flags))
> >> +		/* make sure we zero important fields of the request */
> >> +		skcipher_request_set_callback(ctx->r.req,
> >> +	        0, NULL, NULL);
> >> +	else
> >> +		/*
> >> +		 * Use REQ_MAY_BACKLOG so a cipher driver internally backlogs
> >> +		 * requests if driver request queue is full.
> >> +		 */
> >> +		skcipher_request_set_callback(ctx->r.req,
> >> +	        CRYPTO_TFM_REQ_MAY_BACKLOG,
> >> +	        kcryptd_async_done, dmreq_of_req(cc, ctx->r.req));
> >>  }
> > 
> > This looks wrong.  Unless type=0 and mask=CRYPTO_ALG_ASYNC are passed to
> > crypto_alloc_skcipher(), the skcipher implementation can still be asynchronous,
> > in which case providing a callback is required.
> > 
> > Do you intend that the "force_inline" option forces the use of a synchronous
> > skcipher (alongside the other things it does)?  Or should it still allow
> > asynchronous ones?
> > 
> > We may not actually have a choice in that matter, since xts-aes-aesni has the
> > CRYPTO_ALG_ASYNC bit set (as I mentioned) despite being synchronous in most
> > cases; thus, the crypto API won't give you it if you ask for a synchronous
> > cipher.  So I think you still need to allow async skciphers?  That means a
> > callback is still always required.
> 
> Arg... So it means that some skciphers will not be OK at all for SMR writes. I
> was not aware of these differences (tested with aes-xts-plain64 only). The ugly
> way to support async ciphers would be to just wait inline for the crypto API to
> complete using a completion for instance. But that is very ugly. Back to
> brainstorming, and need to learn more about the crypto API...
> 

It's easy to wait for crypto API requests to complete if you need to --
just use crypto_wait_req().

We do this in fs/crypto/, for example.  (Not many people are using fscrypt with
crypto API based accelerators, so there hasn't yet been much need to support the
complexity of issuing multiple async crypto requests like dm-crypt supports.)

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

