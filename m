Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A87442765C7
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 03:21:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600910484;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CNLDUeuhXyeM+Z+b9iWJpzRv2isfBIrHDYyP4aMsDsM=;
	b=Awsqk51HNR/Vyb7IP+etzDMFswMCEkUeFxi0YsN06FkPeCH8Wo3l7zUcHPxIcCMTTNUVDH
	2QLgwaZ5B4nvOFIQytPYy2vOgUWG3cilUo0wzRkIrfdD6RayYP1Dp2HZhF0XlaYeLhUvNv
	+dul17YQBGlj/sXW/zJUjbSiW2QTRc0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-8hR1ykMLMRu3Vs7FB44dRw-1; Wed, 23 Sep 2020 21:21:22 -0400
X-MC-Unique: 8hR1ykMLMRu3Vs7FB44dRw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CDB6800135;
	Thu, 24 Sep 2020 01:21:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E2915D990;
	Thu, 24 Sep 2020 01:21:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DEB17183D041;
	Thu, 24 Sep 2020 01:21:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O1L7mt001870 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 23 Sep 2020 21:21:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C0071002382; Thu, 24 Sep 2020 01:21:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3649810027AB;
	Thu, 24 Sep 2020 01:21:04 +0000 (UTC)
Date: Wed, 23 Sep 2020 21:21:03 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200924012103.GE10500@redhat.com>
References: <20200909234422.76194-1-satyat@google.com>
	<20200909234422.76194-3-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20200909234422.76194-3-satyat@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Sep 09 2020 at  7:44pm -0400,
Satya Tangirala <satyat@google.com> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> Update the device-mapper core to support exposing the inline crypto
> support of the underlying device(s) through the device-mapper device.
> 
> This works by creating a "passthrough keyslot manager" for the dm
> device, which declares support for encryption settings which all
> underlying devices support.  When a supported setting is used, the bio
> cloning code handles cloning the crypto context to the bios for all the
> underlying devices.  When an unsupported setting is used, the blk-crypto
> fallback is used as usual.
> 
> Crypto support on each underlying device is ignored unless the
> corresponding dm target opts into exposing it.  This is needed because
> for inline crypto to semantically operate on the original bio, the data
> must not be transformed by the dm target.  Thus, targets like dm-linear
> can expose crypto support of the underlying device, but targets like
> dm-crypt can't.  (dm-crypt could use inline crypto itself, though.)
> 
> When a key is evicted from the dm device, it is evicted from all
> underlying devices.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> Co-developed-by: Satya Tangirala <satyat@google.com>
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  block/blk-crypto.c              |  1 +
>  block/keyslot-manager.c         | 34 ++++++++++++
>  drivers/md/dm-core.h            |  4 ++
>  drivers/md/dm-table.c           | 52 +++++++++++++++++++
>  drivers/md/dm.c                 | 92 ++++++++++++++++++++++++++++++++-
>  include/linux/device-mapper.h   |  6 +++
>  include/linux/keyslot-manager.h |  7 +++
>  7 files changed, 195 insertions(+), 1 deletion(-)
> 
> diff --git a/block/blk-crypto.c b/block/blk-crypto.c
> index 2d5e60023b08..33555cf0e3e7 100644
> --- a/block/blk-crypto.c
> +++ b/block/blk-crypto.c
> @@ -402,3 +402,4 @@ int blk_crypto_evict_key(struct request_queue *q,
>  	 */
>  	return blk_crypto_fallback_evict_key(key);
>  }
> +EXPORT_SYMBOL_GPL(blk_crypto_evict_key);
> diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> index 60ac406d54b9..e0f776c38d8a 100644
> --- a/block/keyslot-manager.c
> +++ b/block/keyslot-manager.c
> @@ -416,6 +416,40 @@ void blk_ksm_unregister(struct request_queue *q)
>  {
>  	q->ksm = NULL;
>  }
> +EXPORT_SYMBOL_GPL(blk_ksm_unregister);
> +
> +/**
> + * blk_ksm_intersect_modes() - restrict supported modes by child device
> + * @parent: The keyslot manager for parent device
> + * @child: The keyslot manager for child device, or NULL
> + *
> + * Clear any crypto mode support bits in @parent that aren't set in @child.
> + * If @child is NULL, then all parent bits are cleared.
> + *
> + * Only use this when setting up the keyslot manager for a layered device,
> + * before it's been exposed yet.
> + */
> +void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
> +			     const struct blk_keyslot_manager *child)
> +{
> +	if (child) {
> +		unsigned int i;
> +
> +		parent->max_dun_bytes_supported =
> +			min(parent->max_dun_bytes_supported,
> +			    child->max_dun_bytes_supported);
> +		for (i = 0; i < ARRAY_SIZE(child->crypto_modes_supported);
> +		     i++) {
> +			parent->crypto_modes_supported[i] &=
> +				child->crypto_modes_supported[i];
> +		}
> +	} else {
> +		parent->max_dun_bytes_supported = 0;
> +		memset(parent->crypto_modes_supported, 0,
> +		       sizeof(parent->crypto_modes_supported));
> +	}
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_intersect_modes);
>  
>  /**
>   * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
> diff --git a/drivers/md/dm-core.h b/drivers/md/dm-core.h
> index c4ef1fceead6..4542050eebfc 100644
> --- a/drivers/md/dm-core.h
> +++ b/drivers/md/dm-core.h
> @@ -12,6 +12,7 @@
>  #include <linux/kthread.h>
>  #include <linux/ktime.h>
>  #include <linux/blk-mq.h>
> +#include <linux/keyslot-manager.h>
>  
>  #include <trace/events/block.h>
>  
> @@ -49,6 +50,9 @@ struct mapped_device {
>  
>  	int numa_node_id;
>  	struct request_queue *queue;
> +#ifdef CONFIG_BLK_INLINE_ENCRYPTION
> +	struct blk_keyslot_manager ksm;
> +#endif
>  
>  	atomic_t holders;
>  	atomic_t open_count;

Any reason you placed the ksm member where you did?

Looking at 'struct blk_keyslot_manager' I'm really hating adding that
bloat to every DM device for a feature that really won't see much broad
use (AFAIK).

Any chance you could allocate 'struct blk_keyslot_manager' as needed so
that most users of DM would only be carrying 1 extra pointer (set to
NULL)?

Thanks,
Mike

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

