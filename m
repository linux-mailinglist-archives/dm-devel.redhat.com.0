Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CD0D2810
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 13:38:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 964E181F18;
	Thu, 10 Oct 2019 11:38:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F6525C1B5;
	Thu, 10 Oct 2019 11:38:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A7EBE18089DC;
	Thu, 10 Oct 2019 11:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9ABcBol012674 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 07:38:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 440D86061E; Thu, 10 Oct 2019 11:38:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx22.extmail.prod.ext.phx2.redhat.com
	[10.5.110.63])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3EEF260A9F
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 11:38:08 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6BD0018CB903
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 11:38:07 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id m18so6423544wmc.1
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 04:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=zH51v+/VpKqWqMJT/iQCa90mMj5rtP16zBFhHDCPCd0=;
	b=UbTPNenKKZFOWHHIA+bBbuzWnGJ8/Pb8a9F1iEi+qCNjD4E76N0+qS0K4tc/0kDgB7
	vnnL2tOTLOsW9qPgO3qUtV19bnEy7KdZ4Otmx7Afolh2eE0h7tdd1WFNxMSgQdq3zoKw
	1iDsFp2QD7YNzlguzixftI3FKaNxYJf4K5jKOH4qIJ8bRX8sg5XOfAWX+r+7pN8vSz/+
	zOFfBnrv/WU9Re1xVlbD2fWDWORGad6aGNvjaV0zrzuSz1KbyAvT+w6tM0SnCQglkACc
	UhCsFAHr7UoC4VcpdVGTvHieR19YT68ox5rALonFY3OUGaeNhe2Srnb45zp4khoJRfWY
	XzGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=zH51v+/VpKqWqMJT/iQCa90mMj5rtP16zBFhHDCPCd0=;
	b=PGh4sIJSke8eQowJaQ9TESgLA4d4Q/CtX6YzjLgTkb8U9RADD0/pQSi203UFQPDOG/
	/M5tjyoDww9ypidFzMzycmhtVXEJMcPZBK4mQedqFz0+zTG0pInN5Dai4VjxQafaAScv
	nee6WYE6zncAXKVC83Ojgj9GR/LseES/VQvtEqWrucihb1eVd6XuzMOVGoqyKwjwq6m6
	nedK3YeOroDD/YaRcvxMdTwuP7EgJ2NdtqjYbhGPwHzazxtvoJ7QxqvLQZLaMcltlmmo
	6ANctkXzv/hq+4qJ4WoyMVraxqcFLkzxduGcThESf/WKLq2BeonI4imiZ6Lj8EFWn1Tc
	kDMw==
X-Gm-Message-State: APjAAAWayOgj/fJUs4eNnyaAj6kD2jkXlNLsBm+/NleqEg5ASqfAl4aO
	MLKgtlqj3VXzljDKcQ/YlH8eWC0yK4w=
X-Google-Smtp-Source: APXvYqy3soqHisVwA6EhwYYiGMxEnq2q+0wPyQy4ze5Xr5rLZV430ALlIgEaJtHmkX0db3GXv+zgTQ==
X-Received: by 2002:a7b:cc06:: with SMTP id f6mr6049656wmh.158.1570707485935; 
	Thu, 10 Oct 2019 04:38:05 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id p5sm7837615wmi.4.2019.10.10.04.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Oct 2019 04:38:05 -0700 (PDT)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
References: <alpine.LRH.2.02.1910020613070.973@file01.intranet.prod.int.rdu2.redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <546fde99-ad48-9b36-d21b-00f463b5a8fc@arrikto.com>
Date: Thu, 10 Oct 2019 14:38:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.1910020613070.973@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.63]);
	Thu, 10 Oct 2019 11:38:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]);
	Thu, 10 Oct 2019 11:38:07 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.63
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, guru2018@gmail.com
Subject: Re: [dm-devel] [PATCH 1/2] dm-snapshot: introduce
 account_start_copy and account_end_copy
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Thu, 10 Oct 2019 11:38:58 +0000 (UTC)

On 10/2/19 1:14 PM, Mikulas Patocka wrote:
> This is simple refactoring that moves code for modifying the semaphore
> cow_count into separate functions. It is needed by the following patch.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org	# v5.0+
> Fixes: 721b1d98fb51 ("dm snapshot: Fix excessive memory usage and workqueue stalls")
> 

Reviewed-by: Nikos Tsironis <ntsironis@arrikto.com>

> ---
>  drivers/md/dm-snap.c |   20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> Index: linux-2.6/drivers/md/dm-snap.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-snap.c	2019-10-01 15:19:20.000000000 +0200
> +++ linux-2.6/drivers/md/dm-snap.c	2019-10-01 15:23:10.000000000 +0200
> @@ -1512,6 +1512,16 @@ static void snapshot_dtr(struct dm_targe
>  	kfree(s);
>  }
>  
> +static void account_start_copy(struct dm_snapshot *s)
> +{
> +	down(&s->cow_count);
> +}
> +
> +static void account_end_copy(struct dm_snapshot *s)
> +{
> +	up(&s->cow_count);
> +}
> +
>  /*
>   * Flush a list of buffers.
>   */
> @@ -1732,7 +1742,7 @@ static void copy_callback(int read_err,
>  		rb_link_node(&pe->out_of_order_node, parent, p);
>  		rb_insert_color(&pe->out_of_order_node, &s->out_of_order_tree);
>  	}
> -	up(&s->cow_count);
> +	account_end_copy(s);
>  }
>  
>  /*
> @@ -1756,7 +1766,7 @@ static void start_copy(struct dm_snap_pe
>  	dest.count = src.count;
>  
>  	/* Hand over to kcopyd */
> -	down(&s->cow_count);
> +	account_start_copy(s);
>  	dm_kcopyd_copy(s->kcopyd_client, &src, 1, &dest, 0, copy_callback, pe);
>  }
>  
> @@ -1776,7 +1786,7 @@ static void start_full_bio(struct dm_sna
>  	pe->full_bio = bio;
>  	pe->full_bio_end_io = bio->bi_end_io;
>  
> -	down(&s->cow_count);
> +	account_start_copy(s);
>  	callback_data = dm_kcopyd_prepare_callback(s->kcopyd_client,
>  						   copy_callback, pe);
>  
> @@ -1866,7 +1876,7 @@ static void zero_callback(int read_err,
>  	struct bio *bio = context;
>  	struct dm_snapshot *s = bio->bi_private;
>  
> -	up(&s->cow_count);
> +	account_end_copy(s);
>  	bio->bi_status = write_err ? BLK_STS_IOERR : 0;
>  	bio_endio(bio);
>  }
> @@ -1880,7 +1890,7 @@ static void zero_exception(struct dm_sna
>  	dest.sector = bio->bi_iter.bi_sector;
>  	dest.count = s->store->chunk_size;
>  
> -	down(&s->cow_count);
> +	account_start_copy(s);
>  	WARN_ON_ONCE(bio->bi_private);
>  	bio->bi_private = s;
>  	dm_kcopyd_zero(s->kcopyd_client, 1, &dest, 0, zero_callback, bio);
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
