Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 192741F03BF
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:17:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402623;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oMigZNMFbr/TrZJtrMOiTWLljAbm+zV4egOFiARMgJU=;
	b=d45hRr3AEzI2pwJ1EcC7NMTdp50jbSyPr3E8tRU/4y7XMByW+GZwtnvD46XExbERhi94Ls
	Kwi22W1RdHJ44q1SoU/l2Ckzz2nwVmqBKb/euB0MOemUnH/kHlQ7GVNsxbJ429mWC9ay8+
	0RR3wrcZ/boSw2n12nu91CWClxg00gI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-m9M4uRB_Mze8rQ4uVhTyYw-1; Fri, 05 Jun 2020 20:15:28 -0400
X-MC-Unique: m9M4uRB_Mze8rQ4uVhTyYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 77ABA106B24D;
	Sat,  6 Jun 2020 00:15:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581795C6DE;
	Sat,  6 Jun 2020 00:15:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 199DF87420;
	Sat,  6 Jun 2020 00:15:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 054JEBRq006226 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 15:14:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 171E05F9DD; Thu,  4 Jun 2020 19:14:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B66555C1B0;
	Thu,  4 Jun 2020 19:14:02 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 054JE2vE003437; Thu, 4 Jun 2020 15:14:02 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 054JE2As003433; Thu, 4 Jun 2020 15:14:02 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 4 Jun 2020 15:14:02 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Eric Biggers <ebiggers@kernel.org>
In-Reply-To: <20200604190126.15735-1-ebiggers@kernel.org>
Message-ID: <alpine.LRH.2.02.2006041512500.3360@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200604190126.15735-1-ebiggers@kernel.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, stable@vger.kernel.org, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm crypt: avoid truncating the logical block
	size
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Thu, 4 Jun 2020, Eric Biggers wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> queue_limits::logical_block_size got changed from unsigned short to
> unsigned int, but it was forgotten to update crypt_io_hints() to use the
> new type.  Fix it.
> 
> Fixes: ad6bf88a6c19 ("block: fix an integer overflow in logical block size")
> Cc: stable@vger.kernel.org
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Mikulas Patocka <mpatocka@redhat.com>

> ---
>  drivers/md/dm-crypt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
> index 3df90daba89e..a1dcb8675484 100644
> --- a/drivers/md/dm-crypt.c
> +++ b/drivers/md/dm-crypt.c
> @@ -3274,7 +3274,7 @@ static void crypt_io_hints(struct dm_target *ti, struct queue_limits *limits)
>  	limits->max_segment_size = PAGE_SIZE;
>  
>  	limits->logical_block_size =
> -		max_t(unsigned short, limits->logical_block_size, cc->sector_size);
> +		max_t(unsigned, limits->logical_block_size, cc->sector_size);
>  	limits->physical_block_size =
>  		max_t(unsigned, limits->physical_block_size, cc->sector_size);
>  	limits->io_min = max_t(unsigned, limits->io_min, cc->sector_size);
> -- 
> 2.27.0.278.ge193c7cf3a9-goog
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

