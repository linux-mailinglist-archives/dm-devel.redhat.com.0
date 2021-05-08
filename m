Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8080437717D
	for <lists+dm-devel@lfdr.de>; Sat,  8 May 2021 13:45:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-y5aMRmh2Pdq0hbHGIY7tgg-1; Sat, 08 May 2021 07:45:01 -0400
X-MC-Unique: y5aMRmh2Pdq0hbHGIY7tgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F5DC8005AD;
	Sat,  8 May 2021 11:44:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC2005D740;
	Sat,  8 May 2021 11:44:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 431871800BB0;
	Sat,  8 May 2021 11:44:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 148BiISq020927 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 8 May 2021 07:44:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 95D34165440; Sat,  8 May 2021 11:44:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F8C21CBD0
	for <dm-devel@redhat.com>; Sat,  8 May 2021 11:44:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D6B180B913
	for <dm-devel@redhat.com>; Sat,  8 May 2021 11:44:16 +0000 (UTC)
Received: from isrv.corpit.ru (isrv.corpit.ru [86.62.121.231]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-568-WgCaJi3yPWOdbV3l6BlX9A-1;
	Sat, 08 May 2021 07:44:11 -0400
X-MC-Unique: WgCaJi3yPWOdbV3l6BlX9A-1
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4668840010;
	Sat,  8 May 2021 14:44:08 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id 8E7F170;
	Sat,  8 May 2021 14:44:08 +0300 (MSK)
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
References: <alpine.LRH.2.02.2105071133280.25058@file01.intranet.prod.int.rdu2.redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <cabbc7ad-f387-ad5a-644e-47681d3a7926@msgid.tls.msk.ru>
Date: Sat, 8 May 2021 14:44:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2105071133280.25058@file01.intranet.prod.int.rdu2.redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] dm-snasphot: fix a crash if we have an
 origin with no snapshots
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

07.05.2021 18:38, Mikulas Patocka wrote:
> If we have an origin target with no snapshots, o->split_boundary is set to 0.
> This causes BUG at block/bio.c:1474
> 
> This patch fixes the bug - if there are no snapshots, split_boundary is set
> to 0x80000000U.
> 
> Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
> Cc: stable@vger.kernel.org
> Reported-by: Michael Tokarev <mjt@tls.msk.ru>

Tested-by: Michael Tokarev <mjt@tls.msk.ru>

This eliminates the crash, and now things seem to work fine.
Thank you!

/mjt


> Index: linux-2.6/drivers/md/dm-snap.c
> ===================================================================
> --- linux-2.6.orig/drivers/md/dm-snap.c
> +++ linux-2.6/drivers/md/dm-snap.c
> @@ -854,12 +854,11 @@ static int dm_add_exception(void *contex
>   static uint32_t __minimum_chunk_size(struct origin *o)
>   {
>   	struct dm_snapshot *snap;
> -	unsigned chunk_size = 0;
> +	unsigned chunk_size = 0x80000000U;
>   
>   	if (o)
>   		list_for_each_entry(snap, &o->snapshots, list)
> -			chunk_size = min_not_zero(chunk_size,
> -						  snap->store->chunk_size);
> +			chunk_size = min(chunk_size, snap->store->chunk_size);
>   
>   	return (uint32_t) chunk_size;
>   }
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

