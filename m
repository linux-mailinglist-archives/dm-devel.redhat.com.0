Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3FA8D132EAC
	for <lists+dm-devel@lfdr.de>; Tue,  7 Jan 2020 19:48:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1578422934;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eHB5rxSh5acIep5/vn/3TmdvMovhHDW3c7aLYoXyI1E=;
	b=MuSo0eMPdi+J2Das4cFk+pQer7ALUTElE3L4abfpB5U+6LTLCdl0DmmhHsEI6+1JOKQYax
	ZdxG6/+fc98sINILpNrlWoPtARfNTXMEiFw1U+wlw5EFe1S5QC2Jaf0WmL1XyzkHHuy94m
	S0EN3AL1xwcdM4emlRaa5F2mO8m3juk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-NIH0japcOeydZAQvdFb2FA-1; Tue, 07 Jan 2020 13:48:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6E4B48C4A8E;
	Tue,  7 Jan 2020 18:48:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82F5B691AD;
	Tue,  7 Jan 2020 18:48:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F068E81C8B;
	Tue,  7 Jan 2020 18:48:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 007ImJpt018453 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Jan 2020 13:48:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D127F4D44; Tue,  7 Jan 2020 18:48:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47BCDF4994
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 18:48:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE84185A7A5
	for <dm-devel@redhat.com>; Tue,  7 Jan 2020 18:48:17 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69]) by
	relay.mimecast.com with ESMTP id us-mta-145-usfmFj70P9abuYr3xJ5bSQ-1;
	Tue, 07 Jan 2020 13:48:15 -0500
Received: from localhost (localhost [127.0.0.1])
	by mx.ewheeler.net (Postfix) with ESMTP id D0A54A0692;
	Tue,  7 Jan 2020 18:48:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at ewheeler.net
Received: from mx.ewheeler.net ([127.0.0.1])
	by localhost (mx.ewheeler.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QR2IEJIFYrx1; Tue,  7 Jan 2020 18:47:38 +0000 (UTC)
Received: from mx.ewheeler.net (mx.ewheeler.net [173.205.220.69])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx.ewheeler.net (Postfix) with ESMTPSA id EA247A0633;
	Tue,  7 Jan 2020 18:47:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx.ewheeler.net EA247A0633
Date: Tue, 7 Jan 2020 18:47:36 +0000 (UTC)
From: Eric Wheeler <dm-devel@lists.ewheeler.net>
X-X-Sender: lists@mx.ewheeler.net
To: Joe Thornber <thornber@redhat.com>
In-Reply-To: <20200107122825.qr7o5d6dpwa6kv62@reti>
Message-ID: <alpine.LRH.2.11.2001071845350.2074@mx.ewheeler.net>
References: <alpine.LRH.2.11.1909251814220.15810@mx.ewheeler.net>
	<alpine.LRH.2.11.1912201829300.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912270137420.26683@mx.ewheeler.net>
	<alpine.LRH.2.11.1912271946380.26683@mx.ewheeler.net>
	<20200107103546.asf4tmlfdmk6xsub@reti>
	<20200107104627.plviq37qhok2igt4@reti>
	<20200107122825.qr7o5d6dpwa6kv62@reti>
User-Agent: Alpine 2.11 (LRH 23 2013-08-11)
MIME-Version: 1.0
X-MC-Unique: usfmFj70P9abuYr3xJ5bSQ-1
X-MC-Unique: NIH0japcOeydZAQvdFb2FA-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 007ImJpt018453
X-loop: dm-devel@redhat.com
Cc: Mike Snitzer <snitzer@redhat.com>, markus.schade@gmail.com,
	dm-devel@redhat.com, LVM2 development <lvm-devel@redhat.com>,
	linux-block@vger.kernel.org, ejt@redhat.com, joe.thornber@gmail.com
Subject: Re: [dm-devel] [lvm-devel] kernel BUG at
 drivers/md/persistent-data/dm-space-map-disk.c:178
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 7 Jan 2020, Joe Thornber wrote:

> On Tue, Jan 07, 2020 at 10:46:27AM +0000, Joe Thornber wrote:
> > I'll get a patch to you later today.
> 
> Eric,
> 
> Patch below.  I've run it through a bunch of tests in the dm test suite.  But
> obviously I have never hit your issue.  Will do more testing today.


Thank you Joe, I'll apply the patch and pull out the spinlock.  

I'm not familiar with how sync IO prevents a spinlock.  Can you give a 
brief explaination or point me at documentation?

--
Eric Wheeler



> 
> - Joe
> 
> 
> 
> Author: Joe Thornber <ejt@redhat.com>
> Date:   Tue Jan 7 11:58:42 2020 +0000
> 
>     [dm-thin, dm-cache] Fix bug in space-maps.
>     
>     The space-maps track the reference counts for disk blocks.  There are variants
>     for tracking metadata blocks, and data blocks.
>     
>     We implement transactionality by never touching blocks from the previous
>     transaction, so we can rollback in the event of a crash.
>     
>     When allocating a new block we need to ensure the block is free (has reference
>     count of 0) in both the current and previous transaction.  Prior to this patch we
>     were doing this by searching for a free block in the previous transaction, and
>     relying on a 'begin' counter to track where the last allocation in the current
>     transaction was.  This 'begin' field was not being updated in all code paths (eg,
>     increment of a data block reference count due to breaking sharing of a neighbour
>     block in the same btree leaf).
>     
>     This patch keeps the 'begin' field, but now it's just a hint to speed up the search.
>     Instead we search the current transaction for a free block, and then double check
>     it's free in the old transaction.  Much simpler.
> 
> diff --git a/drivers/md/persistent-data/dm-space-map-common.c b/drivers/md/persistent-data/dm-space-map-common.c
> index bd68f6fef694..b4983e4022e6 100644
> --- a/drivers/md/persistent-data/dm-space-map-common.c
> +++ b/drivers/md/persistent-data/dm-space-map-common.c
> @@ -380,6 +380,34 @@ int sm_ll_find_free_block(struct ll_disk *ll, dm_block_t begin,
>  	return -ENOSPC;
>  }
>  
> +int sm_ll_find_common_free_block(struct ll_disk *old_ll, struct ll_disk *new_ll,
> +	                         dm_block_t begin, dm_block_t end, dm_block_t *b)
> +{
> +	int r;
> +	uint32_t count;
> +
> +	do {
> +		r = sm_ll_find_free_block(new_ll, begin, new_ll->nr_blocks, b);
> +		if (r)
> +			break;
> +
> +		/* double check this block wasn't used in the old transaction */
> +		if (*b >= old_ll->nr_blocks)
> +			count = 0;
> +
> +		else {
> +			r = sm_ll_lookup(old_ll, *b, &count);
> +			if (r)
> +				break;
> +
> +			if (count)
> +				begin = *b + 1;
> +		}
> +	} while (count);
> +
> +	return r;
> +}
> +
>  static int sm_ll_mutate(struct ll_disk *ll, dm_block_t b,
>  			int (*mutator)(void *context, uint32_t old, uint32_t *new),
>  			void *context, enum allocation_event *ev)
> diff --git a/drivers/md/persistent-data/dm-space-map-common.h b/drivers/md/persistent-data/dm-space-map-common.h
> index b3078d5eda0c..8de63ce39bdd 100644
> --- a/drivers/md/persistent-data/dm-space-map-common.h
> +++ b/drivers/md/persistent-data/dm-space-map-common.h
> @@ -109,6 +109,8 @@ int sm_ll_lookup_bitmap(struct ll_disk *ll, dm_block_t b, uint32_t *result);
>  int sm_ll_lookup(struct ll_disk *ll, dm_block_t b, uint32_t *result);
>  int sm_ll_find_free_block(struct ll_disk *ll, dm_block_t begin,
>  			  dm_block_t end, dm_block_t *result);
> +int sm_ll_find_common_free_block(struct ll_disk *old_ll, struct ll_disk *new_ll,
> +	                         dm_block_t begin, dm_block_t end, dm_block_t *result);
>  int sm_ll_insert(struct ll_disk *ll, dm_block_t b, uint32_t ref_count, enum allocation_event *ev);
>  int sm_ll_inc(struct ll_disk *ll, dm_block_t b, enum allocation_event *ev);
>  int sm_ll_dec(struct ll_disk *ll, dm_block_t b, enum allocation_event *ev);
> diff --git a/drivers/md/persistent-data/dm-space-map-disk.c b/drivers/md/persistent-data/dm-space-map-disk.c
> index 32adf6b4a9c7..bf4c5e2ccb6f 100644
> --- a/drivers/md/persistent-data/dm-space-map-disk.c
> +++ b/drivers/md/persistent-data/dm-space-map-disk.c
> @@ -167,8 +167,10 @@ static int sm_disk_new_block(struct dm_space_map *sm, dm_block_t *b)
>  	enum allocation_event ev;
>  	struct sm_disk *smd = container_of(sm, struct sm_disk, sm);
>  
> -	/* FIXME: we should loop round a couple of times */
> -	r = sm_ll_find_free_block(&smd->old_ll, smd->begin, smd->old_ll.nr_blocks, b);
> +	/*
> +	 * Any block we allocate has to be free in both the old and current ll.
> +	 */
> +	r = sm_ll_find_common_free_block(&smd->old_ll, &smd->ll, smd->begin, smd->ll.nr_blocks, b);
>  	if (r)
>  		return r;
>  
> diff --git a/drivers/md/persistent-data/dm-space-map-metadata.c b/drivers/md/persistent-data/dm-space-map-metadata.c
> index 25328582cc48..9e3c64ec2026 100644
> --- a/drivers/md/persistent-data/dm-space-map-metadata.c
> +++ b/drivers/md/persistent-data/dm-space-map-metadata.c
> @@ -448,7 +448,10 @@ static int sm_metadata_new_block_(struct dm_space_map *sm, dm_block_t *b)
>  	enum allocation_event ev;
>  	struct sm_metadata *smm = container_of(sm, struct sm_metadata, sm);
>  
> -	r = sm_ll_find_free_block(&smm->old_ll, smm->begin, smm->old_ll.nr_blocks, b);
> +	/*
> +	 * Any block we allocate has to be free in both the old and current ll.
> +	 */
> +	r = sm_ll_find_common_free_block(&smm->old_ll, &smm->ll, smm->begin, smm->ll.nr_blocks, b);
>  	if (r)
>  		return r;
>  
> 
> --
> dm-devel mailing list
> dm-devel@redhat.com
> https://www.redhat.com/mailman/listinfo/dm-devel
> 
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

