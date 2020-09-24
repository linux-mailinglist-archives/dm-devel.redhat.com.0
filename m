Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 631F9276BF9
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 10:31:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-JlzwN-oJNAenGhlEWJv5gw-1; Thu, 24 Sep 2020 04:31:34 -0400
X-MC-Unique: JlzwN-oJNAenGhlEWJv5gw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E80B427FE;
	Thu, 24 Sep 2020 08:31:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF71A55777;
	Thu, 24 Sep 2020 08:31:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A61B78C7A7;
	Thu, 24 Sep 2020 08:31:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O7mOME010280 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 03:48:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D85061108E7; Thu, 24 Sep 2020 07:48:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D008B1108E4
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:48:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A8F13858290
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 07:48:18 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-129-_Tnrzl3UMh6pY8cKtrvKBA-1; Thu, 24 Sep 2020 03:48:16 -0400
X-MC-Unique: _Tnrzl3UMh6pY8cKtrvKBA-1
Received: by mail-pf1-f196.google.com with SMTP id o20so1367003pfp.11
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 00:48:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=tK+cnu137uKn+/oEzjr3wNwYrT9PGTUO1Zz9Fsslk94=;
	b=bnLnoup9sijSDYXUcG1y7E4NMBvPdNsVw94pR/OuMXXi+4wVvlvEUWZaGmbGvkgtDi
	VJrtXTSZTkGyj7Dm8TMosyOD268m7UBeWnodXoUMvBcWVjIxVLYyiCFqvSXNoTUFjudN
	3u2+n/+ZGFC8s0W502coWF702qdGsoJmpCeV1iI7DNHibdsNQPV3mqDt2gKcOMXmCCU+
	VLoM99cxc1YEQGbIpXEQP3UhHEdNRd5SVDGqu9LrAZBeqbBPJjcyg7Ep7cOm6LiM3AYM
	7HaLBfP52soQEbPDb0Z8yUnqDqFvuLFROv3FxSdALLLy5nXbdo5mTOlxoYWMidVchJHT
	NsjQ==
X-Gm-Message-State: AOAM531A2g49hECCQfBHUkV3xA1bRCyxjny7Jm+71Gis4Y5yfx8HPAXW
	xS4dri0wOa6iV7yrU9uy5kD9Ww==
X-Google-Smtp-Source: ABdhPJzZ9dlXrvCeps8DBV2ed64Pll2vOIuQNZbqGrIU+/FbJUTMQILoJxC1DNy9TOSVXvj2nO5H4g==
X-Received: by 2002:a62:4ed6:0:b029:142:2501:35ec with SMTP id
	c205-20020a624ed60000b0290142250135ecmr3557932pfb.76.1600933694696;
	Thu, 24 Sep 2020 00:48:14 -0700 (PDT)
Received: from google.com (124.190.199.35.bc.googleusercontent.com.
	[35.199.190.124]) by smtp.gmail.com with ESMTPSA id
	w206sm1892054pfc.1.2020.09.24.00.48.13
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Sep 2020 00:48:14 -0700 (PDT)
Date: Thu, 24 Sep 2020 07:48:10 +0000
From: Satya Tangirala <satyat@google.com>
To: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20200924074810.GB1894729@google.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
	<20200924012103.GE10500@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200924012103.GE10500@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 24 Sep 2020 04:31:06 -0400
Cc: Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@google.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 2/3] dm: add support for passing through
 inline crypto support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 23, 2020 at 09:21:03PM -0400, Mike Snitzer wrote:
> On Wed, Sep 09 2020 at  7:44pm -0400,
> Satya Tangirala <satyat@google.com> wrote:
> 
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Update the device-mapper core to support exposing the inline crypto
> > support of the underlying device(s) through the device-mapper device.
> > 
> > This works by creating a "passthrough keyslot manager" for the dm
> > device, which declares support for encryption settings which all
> > underlying devices support.  When a supported setting is used, the bio
> > cloning code handles cloning the crypto context to the bios for all the
> > underlying devices.  When an unsupported setting is used, the blk-crypto
> > fallback is used as usual.
> > 
> > Crypto support on each underlying device is ignored unless the
> > corresponding dm target opts into exposing it.  This is needed because
> > for inline crypto to semantically operate on the original bio, the data
> > must not be transformed by the dm target.  Thus, targets like dm-linear
> > can expose crypto support of the underlying device, but targets like
> > dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)
> > 
> > When a key is evicted from the dm device, it is evicted from all
> > underlying devices.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Co-developed-by: Satya Tangirala <satyat@google.com>
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> > ---
> >  block/blk-crypto.c              |  1 +
> >  block/keyslot-manager.c         | 34 ++++++++++++
> >  drivers/md/dm-core.h            |  4 ++
> >  drivers/md/dm-table.c           | 52 +++++++++++++++++++
> >  drivers/md/dm.c                 | 92 ++++++++++++++++++++++++++++++++-
> >  include/linux/device-mapper.h   |  6 +++
> >  include/linux/keyslot-manager.h |  7 +++
> >  7 files changed, 195 insertions(+), 1 deletion(-)
> > 
> > diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> > index 2d5e60023b08..33555cf0e3e7 100644
> > --- a/block/blk-crypto.c
> > +++ b/block/blk-crypto.c
> > @@ -402,3 +402,4 @@ int blk_crypto_evict_key(struct request_queue *q,
> >  	 */
> >  	return blk_crypto_fallback_evict_key(key);
> >  }
> > +EXPORT_SYMBOL_GPL(blk_crypto_evict_key);
> > diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> > index 60ac406d54b9..e0f776c38d8a 100644
> > --- a/block/keyslot-manager.c
> > +++ b/block/keyslot-manager.c
> > @@ -416,6 +416,40 @@ void blk_ksm_unregister(struct request_queue *q)
> >  {
> >  	q->ksm = NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(blk_ksm_unregister);
> > +
> > +/**
> > + * blk_ksm_intersect_modes() - restrict supported modes by child device
> > + * @parent: The keyslot manager for parent device
> > + * @child: The keyslot manager for child device, or NULL
> > + *
> > + * Clear any crypto mode support bits in @parent that aren't set in @child.
> > + * If @child is NULL, then all parent bits are cleared.
> > + *
> > + * Only use this when setting up the keyslot manager for a layered device,
> > + * before it's been exposed yet.
> > + */
> > +void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
> > +			     const struct blk_keyslot_manager *child)
> > +{
> > +	if (child) {
> > +		unsigned int i;
> > +
> > +		parent->max_dun_bytes_supported =
> > +			min(parent->max_dun_bytes_supported,
> > +			    child->max_dun_bytes_supported);
> > +		for (i = 0; i < ARRAY_SIZE(child->crypto_modes_supported);
> > +		     i++) {
> > +			parent->crypto_modes_supported[i] &=
> > +				child->crypto_modes_supported[i];
> > +		}
> > +	} else {
> > +		parent->max_dun_bytes_supported = 0;
> > +		memset(parent->crypto_modes_supported, 0,
> > +		       sizeof(parent->crypto_modes_supported));
> > +	}
> > +}
> > +EXPORT_SYMBOL_GPL(blk_ksm_intersect_modes);
> >  
> >  /**
> >   * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
> > diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> > index c4ef1fceead6..4542050eebfc 100644
> > --- a/drivers/md/dm-core.h
> > +++ b/drivers/md/dm-core.h
> > @@ -12,6 +12,7 @@
> >  #include <linux/kthread.h>
> >  #include <linux/ktime.h>
> >  #include <linux/blk-mq.h>
> > +#include <linux/keyslot-manager.h>
> >  
> >  #include <trace/events/block.h>
> >  
> > @@ -49,6 +50,9 @@ struct mapped_device {
> >  
> >  	int numa_node_id;
> >  	struct request_queue *queue;
> > +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> > +	struct blk_keyslot_manager ksm;
> > +#endif
> >  
> >  	atomic_t holders;
> >  	atomic_t open_count;
> 
> Any reason you placed the ksm member where you did?
As in, any reason why it's placed right after the struct request_queue
*queue? The ksm is going to be set up in the request_queue and is a part
of the request_queue is some sense, so it seemed reasonable to me to
group them together....but I don't think there's any reason it *has* to
be there, if you think it should be put elsewhere (or maybe I'm
misunderstanding your question :) ).
> 
> Looking at 'struct blk_keyslot_manager' I'm really hating adding that
> bloat to every DM device for a feature that really won't see much broad
> use (AFAIK).
> 
> Any chance you could allocate 'struct blk_keyslot_manager' as needed so
> that most users of DM would only be carrying 1 extra pointer (set to
> NULL)?
> 
> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

