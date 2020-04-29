Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 250381BE7BC
	for <lists+dm-devel@lfdr.de>; Wed, 29 Apr 2020 21:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588189822;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FOqpop34CsDcd1+64gET3hBCywrGaBMwVFRlHY/CdtI=;
	b=Ur08LrCtNl7kjT23+lgrW6a7qZjUzex7xXLBdpOl2nxUAnH+LjpdtB1LEerofurUfjwGyx
	jU+a2cCPvcqhYj5c31AQBYudeoDL2xV5FkTbiAPG4QLDdpkpM7I7NNM8JF8HDtKk6bf0U6
	r8YY68OlcJR650V9Wu7TFhPDaCIN3jU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-cB4deMZPPk2ZSq2FFYd6kA-1; Wed, 29 Apr 2020 15:50:20 -0400
X-MC-Unique: cB4deMZPPk2ZSq2FFYd6kA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AA6F464;
	Wed, 29 Apr 2020 19:50:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4412B5D9C9;
	Wed, 29 Apr 2020 19:50:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5E4AE1809542;
	Wed, 29 Apr 2020 19:50:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03TJo4Ok007269 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 29 Apr 2020 15:50:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 59CA85D9F3; Wed, 29 Apr 2020 19:50:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [192.168.1.10] (unknown [10.40.193.136])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E4585D9E5;
	Wed, 29 Apr 2020 19:50:00 +0000 (UTC)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
References: <alpine.LRH.2.02.2004291225140.3914@file01.intranet.prod.int.rdu2.redhat.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <3af73377-592b-ba25-c562-636f20125d62@redhat.com>
Date: Wed, 29 Apr 2020 21:49:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2004291225140.3914@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-writecache: improve performance on
 Optane-based persistent memory
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
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 4/29/20 6:30 PM, Mikulas Patocka wrote:
> Hi
>
> This is the clflushopt patch for the next merge window.
>
> Mikulas
>
>
> From: Mikulas Patocka <mpatocka@redhat.com>
>
> When testing the dm-writecache target on a real Optane-based persistent
> memory, it turned out that explicit cache flushing using the clflushopt
> instruction performs better than non-temporal stores for block sizes 1k,
> 2k and 4k.
>
> This patch adds a new function memcpy_flushcache_optimized that tests if
> clflushopt is present - and if it is, we use it instead of
> memcpy_flushcache.
>
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
>
> ---
>   drivers/md/dm-writecache.c |   29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
>
> Index: linux-2.6/drivers/md/dm-writecache.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-writecache.c	2020-04-29 18:09:53.599999000 +0200
> +++ linux-2.6/drivers/md/dm-writecache.c	2020-04-29 18:22:36.139999000 +0200
> @@ -1137,6 +1137,33 @@ static int writecache_message(struct dm_
>   	return r;
>   }
>   
> +static void memcpy_flushcache_optimized(void *dest, void *source, size_t size)
> +{
> +	/*
> +	 * clufhsopt performs better with block size 1024, 2048, 4096
> +	 * non-temporal stores perform better with block size 512
> +	 *
> +	 * block size   512             1024            2048            4096
> +	 * movnti       496 MB/s        642 MB/s        725 MB/s        744 MB/s
> +	 * clflushopt   373 MB/s        688 MB/s        1.1 GB/s        1.2 GB/s
> +	 */
> +#ifdef CONFIG_X86
> +	if (static_cpu_has(X86_FEATURE_CLFLUSHOPT) &&
> +	    likely(boot_cpu_data.x86_clflush_size == 64) &&
> +	    likely(size >= 768)) {
> +		do {
> +			memcpy((void *)dest, (void *)source, 64);
> +			clflushopt((void *)dest);
> +			dest += 64;
> +			source += 64;
> +			size -= 64;
> +		} while (size >= 64);
> +		return;


Aren't memory barriers needed for ordering before and after the loop?

Heinz


> +	}
> +#endif
> +	memcpy_flushcache(dest, source, size);
> +}
> +
>   static void bio_copy_block(struct dm_writecache *wc, struct bio *bio, void *data)
>   {
>   	void *buf;
> @@ -1162,7 +1189,7 @@ static void bio_copy_block(struct dm_wri
>   			}
>   		} else {
>   			flush_dcache_page(bio_page(bio));
> -			memcpy_flushcache(data, buf, size);
> +			memcpy_flushcache_optimized(data, buf, size);
>   		}
>   
>   		bvec_kunmap_irq(buf, &flags);
>
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

