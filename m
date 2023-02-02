Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA6A68D159
	for <lists+dm-devel@lfdr.de>; Tue,  7 Feb 2023 09:17:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675757823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C1+b/kVbbrDsZElo7dwnzd/1qdymAPDMF7dnI79zF5I=;
	b=QoeNG1r4dPYwMkHECGOOMDr2+E2+a5TiI6BXUlx0bw9nPKkZDWIesrSPlloIlUqM9K3qRR
	s3NiAKHg5BLYC+ejSXDQ1gMqN7V/dl2RNxJ5i3gDt0SAFEL5rb+JpwtYlTojXkcNRTiZbC
	Ugi52fWvuBTVftSkWgZaUncBTuwv0iI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-Wt_iICTAObWWC8nJLZrx6Q-1; Tue, 07 Feb 2023 03:17:00 -0500
X-MC-Unique: Wt_iICTAObWWC8nJLZrx6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E0E1101A55E;
	Tue,  7 Feb 2023 08:16:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 75452400DFDB;
	Tue,  7 Feb 2023 08:16:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A662C19465A2;
	Tue,  7 Feb 2023 08:16:54 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id AFCDF1946589
 for <dm-devel@listman.corp.redhat.com>; Tue,  7 Feb 2023 08:16:52 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 93A1418EC5; Tue,  7 Feb 2023 08:16:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7B8440D9;
 Tue,  7 Feb 2023 08:16:52 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 3177GgcH004677; Tue, 7 Feb 2023 02:17:05 -0500
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 312G4Pap021968; Thu, 2 Feb 2023 11:04:25 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Thu, 2 Feb 2023 11:04:24 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Nathan Huckleberry <nhuck@google.com>
In-Reply-To: <20230202012348.885402-1-nhuck@google.com>
Message-ID: <alpine.LRH.2.21.2302021052580.21238@file01.intranet.prod.int.rdu2.redhat.com>
References: <20230202012348.885402-1-nhuck@google.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH] dm-verity: Remove WQ_UNBOUND.
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Mike Snitzer <snitzer@kernel.org>, linux-kernel@vger.kernel.org,
 Eric Biggers <ebiggers@kernel.org>, dm-devel@redhat.com,
 Sami Tolvanen <samitolvanen@google.com>, Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Wed, 1 Feb 2023, Nathan Huckleberry wrote:

> Setting WQ_UNBOUND increases scheduler latency on ARM64.  This is likely
> due to the asymmetric architecture of ARM64 processors.
> 
> I've been unable to reproduce the results that claim WQ_UNBOUND gives a
> performance boost on x86-64.
> 
> This flag is causing performance issues for multiple subsystems within
> Android.  Notably, the same slowdown exists for decompression with
> EROFS.
> 
> | open-prebuilt-camera  | WQ_UNBOUND | ~WQ_UNBOUND   |
> |-----------------------|------------|---------------|
> | verity wait time (us) | 11746      | 119 (-98%)    |
> | erofs wait time (us)  | 357805     | 174205 (-51%) |
> 
> | sha256 ramdisk random read | WQ_UNBOUND    | ~WQ_UNBOUND |
> |----------------------------|-----------=---|-------------|
> | arm64 (accelerated)        | bw=42.4MiB/s  | bw=212MiB/s |
> | arm64 (generic)            | bw=16.5MiB/s  | bw=48MiB/s  |
> | x86_64 (generic)           | bw=233MiB/s   | bw=230MiB/s |
> 
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Cc: Eric Biggers <ebiggers@kernel.org>
> Signed-off-by: Nathan Huckleberry <nhuck@google.com>
> ---
>  drivers/md/dm-verity-target.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/md/dm-verity-target.c b/drivers/md/dm-verity-target.c
> index ccf5b852fbf7..020fd2341025 100644
> --- a/drivers/md/dm-verity-target.c
> +++ b/drivers/md/dm-verity-target.c
> @@ -1399,8 +1399,8 @@ static int verity_ctr(struct dm_target *ti, unsigned argc, char **argv)
>  		goto bad;
>  	}
>  
> -	/* WQ_UNBOUND greatly improves performance when running on ramdisk */
> -	wq_flags = WQ_MEM_RECLAIM | WQ_UNBOUND;
> +	wq_flags = WQ_MEM_RECLAIM;
> +
>  	/*
>  	 * Using WQ_HIGHPRI improves throughput and completion latency by
>  	 * reducing wait times when reading from a dm-verity device.

Hi

If you remove WQ_UNBOUND, you should also change the last argument of 
alloc_workqueue from num_online_cpus() to either 0 or 1. Try both 0 and 1 
and tell us which performs better.

Mikulas
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

