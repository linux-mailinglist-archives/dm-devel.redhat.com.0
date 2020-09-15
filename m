Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09CB826AEF8
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 22:55:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600203317;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=M4hfFKfExdibNwHrJnQAhdiGYtuZeHKa/xd85zJZO2o=;
	b=UzEoPzzREMTks5GZBIcvnAcV4+eqSUa51CjMuX6sUl2aVqFxLU2WS0sz/JCXaf5KbIcJs7
	WQvlkDNPyN6Gxce4ZIshvwNTHbi7PHpVWc1q3KM+OfaaDwA5Xr3eVMezhx2qDddxMpkW0Y
	Wx1gwddKxHNQ+XZxTsvXInigxEiApa0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-RMbRSsmGNr-lDnqroE8Niw-1; Tue, 15 Sep 2020 16:55:13 -0400
X-MC-Unique: RMbRSsmGNr-lDnqroE8Niw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 36BCB802B7B;
	Tue, 15 Sep 2020 20:55:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 94C6860BE2;
	Tue, 15 Sep 2020 20:55:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C7531183D023;
	Tue, 15 Sep 2020 20:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FKsh7R025361 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 16:54:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E51585DE1D; Tue, 15 Sep 2020 20:54:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1F9F5DE19;
	Tue, 15 Sep 2020 20:54:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08FKsdYR006040; 
	Tue, 15 Sep 2020 15:54:39 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08FKscpN006039;
	Tue, 15 Sep 2020 15:54:38 -0500
Date: Tue, 15 Sep 2020 15:54:38 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: mwilck@suse.com
Message-ID: <20200915205438.GR11108@octiron.msp.redhat.com>
References: <20200910195611.8439-1-mwilck@suse.com>
MIME-Version: 1.0
In-Reply-To: <20200910195611.8439-1-mwilck@suse.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com,
	Zhiqiang Liu <liuzhiqiang26@huawei.com>, linfeilong@huawei.com
Subject: Re: [dm-devel] [PATCH v2] libmultipath: setup_map(): don't break
 multipath attributes
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Sep 10, 2020 at 09:56:11PM +0200, mwilck@suse.com wrote:
> From: Martin Wilck <mwilck@suse.com>
> 
> setup_map() is called both for new maps (e.g. from coalesce_paths())
> and existing maps (e.g. from reload_map(), resize_map()). In the former
> case, the map will be removed from global data structures, so incomplete
> initialization is not an issue. But In the latter case, removal isn't
> generally possible. We expect that mpp->features, mpp->hwhandler,
> mpp->selector have been initialized and are are non-NULL. We must make sure
> not to break this assumption because of an error in this setup_map()
> invocation. As these properties aren't likely to change during an update
> operation, saving and restoring them is better than leaving the map
> improperly initialized.
> 
Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
> Signed-off-by: Martin Wilck <mwilck@suse.com>
> ---
> 
> v1->v2: forgot to remove the call to free_multipath_attributes().
> 
> This is supposed to be applied on top of lixiaokeng's patch
> "libmultipath: check whether mpp->features is NUll in setup_map".
> 
>  libmultipath/configure.c | 29 +++++++++++++++++++++++++----
>  libmultipath/util.h      |  7 +++++++
>  2 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/libmultipath/configure.c b/libmultipath/configure.c
> index 5d5d941..8fd12df 100644
> --- a/libmultipath/configure.c
> +++ b/libmultipath/configure.c
> @@ -298,6 +298,7 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
>  	struct pathgroup * pgp;
>  	struct config *conf;
>  	int i, n_paths, marginal_pathgroups;
> +	char *save_attr;
>  
>  	/*
>  	 * don't bother if devmap size is unknown
> @@ -307,10 +308,6 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
>  		return 1;
>  	}
>  
> -	/*
> -	 * free features, selector, and hwhandler properties if they are being reused
> -	 */
> -	free_multipath_attributes(mpp);
>  	if (mpp->disable_queueing && VECTOR_SIZE(mpp->paths) != 0)
>  		mpp->disable_queueing = 0;
>  
> @@ -328,11 +325,35 @@ int setup_map(struct multipath *mpp, char *params, int params_size,
>  
>  	select_pgfailback(conf, mpp);
>  	select_pgpolicy(conf, mpp);
> +
> +	/*
> +	 * If setup_map() is called from e.g. from reload_map() or resize_map(),
> +	 * make sure that we don't corrupt attributes.
> +	 */
> +	save_attr = steal_ptr(mpp->selector);
>  	select_selector(conf, mpp);
> +	if (!mpp->selector)
> +		mpp->selector = save_attr;
> +	else
> +		free(save_attr);
> +
>  	select_no_path_retry(conf, mpp);
>  	select_retain_hwhandler(conf, mpp);
> +
> +	save_attr = steal_ptr(mpp->features);
>  	select_features(conf, mpp);
> +	if (!mpp->features)
> +		mpp->features = save_attr;
> +	else
> +		free(save_attr);
> +
> +	save_attr = steal_ptr(mpp->hwhandler);
>  	select_hwhandler(conf, mpp);
> +	if (!mpp->hwhandler)
> +		mpp->hwhandler = save_attr;
> +	else
> +		free(save_attr);
> +
>  	select_rr_weight(conf, mpp);
>  	select_minio(conf, mpp);
>  	select_mode(conf, mpp);
> diff --git a/libmultipath/util.h b/libmultipath/util.h
> index 52aa559..045bbee 100644
> --- a/libmultipath/util.h
> +++ b/libmultipath/util.h
> @@ -110,4 +110,11 @@ static inline void clear_bit_in_bitfield(unsigned int bit, struct bitfield *bf)
>  	bf->bits[bit / bits_per_slot] &= ~(1ULL << (bit % bits_per_slot));
>  }
>  
> +#define steal_ptr(x)		       \
> +	({			       \
> +		void *___p = x;	       \
> +		x = NULL;	       \
> +		___p;		       \
> +	})
> +
>  #endif /* _UTIL_H */
> -- 
> 2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

