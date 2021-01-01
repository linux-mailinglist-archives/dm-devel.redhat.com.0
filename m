Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0A8732E836E
	for <lists+dm-devel@lfdr.de>; Fri,  1 Jan 2021 11:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1609495351;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UWzqm9n+kjYpbQdIV9g/fn+ywbAtULLty+mVrwKPwC0=;
	b=f9LoSUH5WuSetszCPbhBe2ZaW3Zci1dgwbzf3Uru+r8NOqxYAprddr+7KwBf+sTGH8pkqE
	8sj337DT6DSYP06W5LR/mF7MUXHmT5+1dzSesPQ59jokxqwXUKMRAcP/JM6zAEOoAE4WgH
	STzpNc1TrEuamE5tozHmoW6WDrb70Eg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-ErOMiSFlOWKgYABua80XTQ-1; Fri, 01 Jan 2021 05:02:28 -0500
X-MC-Unique: ErOMiSFlOWKgYABua80XTQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91D02107ACE6;
	Fri,  1 Jan 2021 10:02:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBDD360BF3;
	Fri,  1 Jan 2021 10:02:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B51857683;
	Fri,  1 Jan 2021 10:02:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 101A0beM022917 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 05:00:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 98AB719714; Fri,  1 Jan 2021 10:00:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D1BF31971E;
	Fri,  1 Jan 2021 10:00:20 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 101A0KA1031760; Fri, 1 Jan 2021 05:00:20 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 101A0IkO031756; Fri, 1 Jan 2021 05:00:18 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Fri, 1 Jan 2021 05:00:18 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Ignat Korchagin <ignat@cloudflare.com>
In-Reply-To: <20201230214520.154793-2-ignat@cloudflare.com>
Message-ID: <alpine.LRH.2.02.2101010450460.31009@file01.intranet.prod.int.rdu2.redhat.com>
References: <20201230214520.154793-1-ignat@cloudflare.com>
	<20201230214520.154793-2-ignat@cloudflare.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Damien.LeMoal@wdc.com, herbert@gondor.apana.org.au, snitzer@redhat.com,
	kernel-team@cloudflare.com, dm-crypt@saout.de,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	nobuto.murata@canonical.com, ebiggers@kernel.org, clm@fb.com,
	dm-devel@redhat.com, linux-btrfs@vger.kernel.org,
	dsterba@suse.com, josef@toxicpanda.com,
	mail@maciej.szmigiero.name, agk@redhat.com
Subject: Re: [dm-devel] [PATCH v2 1/2] dm crypt: use GFP_ATOMIC when
 allocating crypto requests from softirq
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 30 Dec 2020, Ignat Korchagin wrote:

> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 53791138d78b..e4fd690c70e1 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -1539,7 +1549,10 @@ static blk_status_t crypt_convert(struct crypt_config *cc,
>  
>  	while (ctx->iter_in.bi_size && ctx->iter_out.bi_size) {
>  
> -		crypt_alloc_req(cc, ctx);
> +		r = crypt_alloc_req(cc, ctx);
> +		if (r)
> +			return BLK_STS_RESOURCE;
> +
>  		atomic_inc(&ctx->cc_pending);
>  
>  		if (crypt_integrity_aead(cc))
> -- 
> 2.20.1

I'm not quite convinced that returning BLK_STS_RESOURCE will help. The 
block layer will convert this value back to -ENOMEM and return it to the 
caller, resulting in an I/O error.

Note that GFP_ATOMIC allocations may fail anytime and you must handle 
allocation failure gracefully - i.e. process the request without any 
error.

An acceptable solution would be to punt the request to a workqueue and do 
GFP_NOIO allocation from the workqueue. Or add the request to some list 
and process the list when some other request completes.

You should write a test that simulates allocation failure and verify that 
the kernel handles it gracefully without any I/O error.

Mikulas

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

