Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0B7BB2F6564
	for <lists+dm-devel@lfdr.de>; Thu, 14 Jan 2021 17:07:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610640430;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S6nRzX74Yswkr0WH2sdd1Fp8FsHmJlTd5bE7lwKGI/Y=;
	b=AHbwpNAyoKc2rpBCsvTKc8LzvUnFw0A2uwKCAlD8hDDZohRgTATdbc3ksC/HX63T5oxNNj
	SKI/vHMWNNzkwtrK4KB7uIgevBEih52EGM7sk0TRy5ryzfAZlldS5ovL+7G8g9RYmM0PGr
	KacePRBejs/qVK9cUM+7dKklk1kytTs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-BwVzf3OyN6KPHChjdWsnBQ-1; Thu, 14 Jan 2021 11:07:06 -0500
X-MC-Unique: BwVzf3OyN6KPHChjdWsnBQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A35C806663;
	Thu, 14 Jan 2021 16:06:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 776B210016F7;
	Thu, 14 Jan 2021 16:06:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A21D84E58F;
	Thu, 14 Jan 2021 16:06:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10EG6XZ7004917 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 11:06:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1A06D5D739; Thu, 14 Jan 2021 16:06:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A286A5D734;
	Thu, 14 Jan 2021 16:06:29 +0000 (UTC)
Date: Thu, 14 Jan 2021 11:06:29 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20210114160628.GA26178@redhat.com>
References: <20201229085524.2795331-1-satyat@google.com>
	<20201229085524.2795331-3-satyat@google.com>
MIME-Version: 1.0
In-Reply-To: <20201229085524.2795331-3-satyat@google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Eric Biggers <ebiggers@google.com>,
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH v3 2/6] block: keyslot-manager: Introduce
 functions for device mapper support
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 29 2020 at  3:55am -0500,
Satya Tangirala <satyat@google.com> wrote:

> Introduce blk_ksm_update_capabilities() to update the capabilities of
> a keyslot manager (ksm) in-place. The pointer to a ksm in a device's
> request queue may not be easily replaced, because upper layers like
> the filesystem might access it (e.g. for programming keys/checking
> capabilities) at the same time the device wants to replace that
> request queue's ksm (and free the old ksm's memory). This function
> allows the device to update the capabilities of the ksm in its request
> queue directly.
> 
> Also introduce blk_ksm_is_superset() which checks whether one ksm's
> capabilities are a (not necessarily strict) superset of another ksm's.
> The blk-crypto framework requires that crypto capabilities that were
> advertised when a bio was created continue to be supported by the
> device until that bio is ended - in practice this probably means that
> a device's advertised crypto capabilities can *never* "shrink" (since
> there's no synchronization between bio creation and when a device may
> want to change its advertised capabilities) - so a previously
> advertised crypto capability must always continue to be supported.
> This function can be used to check that a new ksm is a valid
> replacement for an old ksm.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>
> ---
>  block/keyslot-manager.c         | 91 +++++++++++++++++++++++++++++++++
>  include/linux/keyslot-manager.h |  9 ++++
>  2 files changed, 100 insertions(+)
> 
> diff --git a/block/keyslot-manager.c b/block/keyslot-manager.c
> index ac7ce83a76e8..f13ab7410eca 100644
> --- a/block/keyslot-manager.c
> +++ b/block/keyslot-manager.c
> @@ -424,6 +424,97 @@ void blk_ksm_unregister(struct request_queue *q)
>  	q->ksm = NULL;
>  }
>  
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
> +
> +/**
> + * blk_ksm_is_superset() - Check if a KSM supports a superset of crypto modes
> + *			   and DUN bytes that another KSM supports. Here,
> + *			   "superset" refers to the mathematical meaning of the
> + *			   word - i.e. if two KSMs have the *same* capabilities,
> + *			   they *are* considered supersets of each other.
> + * @ksm_superset: The KSM that we want to verify is a superset
> + * @ksm_subset: The KSM that we want to verify is a subset
> + *
> + * Return: True if @ksm_superset supports a superset of the crypto modes and DUN
> + *	   bytes that @ksm_subset supports.
> + */
> +bool blk_ksm_is_superset(struct blk_keyslot_manager *ksm_superset,
> +			 struct blk_keyslot_manager *ksm_subset)
> +{
> +	int i;
> +
> +	if (!ksm_subset)
> +		return true;
> +
> +	if (!ksm_superset)
> +		return false;
> +
> +	for (i = 0; i < ARRAY_SIZE(ksm_superset->crypto_modes_supported); i++) {
> +		if (ksm_subset->crypto_modes_supported[i] &
> +		    (~ksm_superset->crypto_modes_supported[i])) {
> +			return false;
> +		}
> +	}
> +
> +	if (ksm_subset->max_dun_bytes_supported >
> +	    ksm_superset->max_dun_bytes_supported) {
> +		return false;
> +	}
> +
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_is_superset);
> +
> +/**
> + * blk_ksm_update_capabilities() - Update the restrictions of a KSM to those of
> + *				   another KSM
> + * @target_ksm: The KSM whose restrictions to update.
> + * @reference_ksm: The KSM to whose restrictions this function will update
> + *		   @target_ksm's restrictions to,
> + */
> +void blk_ksm_update_capabilities(struct blk_keyslot_manager *target_ksm,
> +				 struct blk_keyslot_manager *reference_ksm)
> +{
> +	memcpy(target_ksm->crypto_modes_supported,
> +	       reference_ksm->crypto_modes_supported,
> +	       sizeof(target_ksm->crypto_modes_supported));
> +
> +	target_ksm->max_dun_bytes_supported =
> +				reference_ksm->max_dun_bytes_supported;
> +}
> +EXPORT_SYMBOL_GPL(blk_ksm_update_capabilities);
> +

Given the patch header's preamble about FS possibly accessing/checking
the existing ksm: without any locking or other coordination how is
blk_ksm_update_capabilities() safe?

Please document any assumptions about the caller (e.g. DM) that enables
blk_ksm_update_capabilities() to be used safely.

Mike

>  /**
>   * blk_ksm_init_passthrough() - Init a passthrough keyslot manager
>   * @ksm: The keyslot manager to init
> diff --git a/include/linux/keyslot-manager.h b/include/linux/keyslot-manager.h
> index 323e15dd6fa7..164568f52be7 100644
> --- a/include/linux/keyslot-manager.h
> +++ b/include/linux/keyslot-manager.h
> @@ -103,6 +103,15 @@ void blk_ksm_reprogram_all_keys(struct blk_keyslot_manager *ksm);
>  
>  void blk_ksm_destroy(struct blk_keyslot_manager *ksm);
>  
> +void blk_ksm_intersect_modes(struct blk_keyslot_manager *parent,
> +			     const struct blk_keyslot_manager *child);
> +
>  void blk_ksm_init_passthrough(struct blk_keyslot_manager *ksm);
>  
> +bool blk_ksm_is_superset(struct blk_keyslot_manager *ksm_superset,
> +			 struct blk_keyslot_manager *ksm_subset);
> +
> +void blk_ksm_update_capabilities(struct blk_keyslot_manager *target_ksm,
> +				 struct blk_keyslot_manager *reference_ksm);
> +
>  #endif /* __LINUX_KEYSLOT_MANAGER_H */
> -- 
> 2.29.2.729.g45daf8777d-goog
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

