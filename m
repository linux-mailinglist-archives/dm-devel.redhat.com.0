Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3075620C9F7
	for <lists+dm-devel@lfdr.de>; Sun, 28 Jun 2020 21:47:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593373644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NFpqz2HvpKQbB6XFmCPyFjcj466EakFD58DNhoySato=;
	b=JZL6S9eFc1UI6AK1QDo0cMiMVdDlkcK3ZgiTei8Zm/xvsF36AS8e5nlOcYCAm0QQChpsD8
	J9S4I3uaMCFoBes/rz7lYYg6r80GPQvDH02t/3T2olPnIOpmsAu0rhP9tVE1An2dtGbyxG
	F26U/fB/sRC/BHs2l5X5kNVL6fkhWRY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-ZujGho4nOdiuiy8g17H_ZA-1; Sun, 28 Jun 2020 15:47:21 -0400
X-MC-Unique: ZujGho4nOdiuiy8g17H_ZA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11EC2802ED4;
	Sun, 28 Jun 2020 19:47:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 57C7760BEC;
	Sun, 28 Jun 2020 19:47:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AA08F1809547;
	Sun, 28 Jun 2020 19:47:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05SJksfP019302 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jun 2020 15:46:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ADB082156A3A; Sun, 28 Jun 2020 19:46:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7802157F23
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 19:46:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 19FE7800143
	for <dm-devel@redhat.com>; Sun, 28 Jun 2020 19:46:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-400-diuoF7XON62wDZYHFZy0VA-1;
	Sun, 28 Jun 2020 15:46:47 -0400
X-MC-Unique: diuoF7XON62wDZYHFZy0VA-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 966E620578;
	Sun, 28 Jun 2020 19:46:40 +0000 (UTC)
Date: Sun, 28 Jun 2020 12:46:39 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <20200628194639.GC11197@sol.localdomain>
References: <alpine.LRH.2.02.2006161052540.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006161101080.28052@file01.intranet.prod.int.rdu2.redhat.com>
	<20200616173620.GA207319@gmail.com>
	<alpine.LRH.2.02.2006171107220.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006171108440.18714@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626044534.GA2870@gondor.apana.org.au>
	<alpine.LRH.2.02.2006261109520.11899@file01.intranet.prod.int.rdu2.redhat.com>
	<alpine.LRH.2.02.2006261215480.13882@file01.intranet.prod.int.rdu2.redhat.com>
	<20200626164617.GA211634@gmail.com>
	<alpine.LRH.2.02.2006281501230.347@file01.intranet.prod.int.rdu2.redhat.com>
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2006281501230.347@file01.intranet.prod.int.rdu2.redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <msnitzer@redhat.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Zaibo Xu <xuzaibo@huawei.com>, linux-kernel@vger.kernel.org,
	Wei Xu <xuwei5@hisilicon.com>, dm-devel@redhat.com,
	George Cherian <gcherian@marvell.com>, linux-crypto@vger.kernel.org,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	"David S. Miller" <davem@davemloft.net>, Milan Broz <mbroz@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/3 v2] crypto: introduce the flag
 CRYPTO_ALG_ALLOCATES_MEMORY
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

On Sun, Jun 28, 2020 at 03:04:22PM -0400, Mikulas Patocka wrote:
> > > Index: linux-2.6/crypto/authenc.c
> > > ===================================================================
> > > --- linux-2.6.orig/crypto/authenc.c	2020-06-26 17:24:03.566417000 +0200
> > > +++ linux-2.6/crypto/authenc.c	2020-06-26 17:24:03.566417000 +0200
> > > @@ -388,7 +388,8 @@ static int crypto_authenc_create(struct
> > >  	if ((algt->type ^ CRYPTO_ALG_TYPE_AEAD) & algt->mask)
> > >  		return -EINVAL;
> > >  
> > > -	mask = crypto_requires_sync(algt->type, algt->mask);
> > > +	mask = crypto_requires_sync(algt->type, algt->mask) |
> > > +	       crypto_requires_nomem(algt->type, algt->mask);
> > 
> > As I suggested earlier, shouldn't there be a function that returns the mask for
> > all inherited flags, rather than handling each flag individually?
> 
> Yes - I've created crypto_requires_inherited for this purpose.

Since all callers pass in 'struct crypto_attr_type', a better helper might be:

static inline int crypto_algt_inherited_mask(struct crypto_attr_type *algt)
{
	return crypto_requires_off(algt->type, algt->mask,
				   CRYPTO_ALG_INHERITED_FLAGS);
}

> > > @@ -424,7 +425,7 @@ static int crypto_authenc_create(struct
> > >  		goto err_free_inst;
> > >  
> > >  	inst->alg.base.cra_flags = (auth_base->cra_flags |
> > > -				    enc->base.cra_flags) & CRYPTO_ALG_ASYNC;
> > > +			enc->base.cra_flags) & CRYPTO_ALG_INHERITED_FLAGS;
> > 
> > Strange indentation here.  Likewise in most of the other files.
> 
> I was told that the code should be 80-characters wide.

You could use:

	inst->alg.base.cra_flags =
		(auth_base->cra_flags | enc->base.cra_flags) &
		CRYPTO_ALG_INHERITED_FLAGS;

Just a suggestion, it's not a big deal...  Your indentation of the continuation
line just seems weird.

> > > --- linux-2.6.orig/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> > > +++ linux-2.6/crypto/xts.c	2020-06-26 17:24:03.566417000 +0200
> > > @@ -415,7 +415,7 @@ static int create(struct crypto_template
> > >  	} else
> > >  		goto err_free_inst;
> > >  
> > > -	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_ASYNC;
> > > +	inst->alg.base.cra_flags = alg->base.cra_flags & CRYPTO_ALG_INHERITED_FLAGS;
> > >  	inst->alg.base.cra_priority = alg->base.cra_priority;
> > >  	inst->alg.base.cra_blocksize = XTS_BLOCK_SIZE;
> > >  	inst->alg.base.cra_alignmask = alg->base.cra_alignmask |
> > 
> > Need to set the mask correctly in this file.
> 
> I don't know what do you mean.

I mean that the CRYPTO_ALG_ALLOCATES_MEMORY flag is not handled when the 'mask'
variable is assigned to earlier in this function.

It should use your new helper function, like all the other places in this patch.

- Eric

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

