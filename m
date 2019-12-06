Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4686D1155BA
	for <lists+dm-devel@lfdr.de>; Fri,  6 Dec 2019 17:48:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575650883;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Vxm04iWKkHgkeoCbgSn9lOz0TJedu84Y/WJAAo7Jj5k=;
	b=T5zN8ssOVsCJnkbwx9w/Ad8xjGNW1zYJ7eUYR6n+FgkNjiJ4p+Ky/A4eY8auQEahQT2gVK
	rYHHUIQbTABVXYrtA3bRbX+jzUY1NsLpLiPGKuKC1pQv9cODayaZy/3ZQEg6VdeCGu4XKf
	W7yE9NiGk+l8EjgvUU/UYUXBa59A4eE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-josl5R5xOP-j8IfmSieuyQ-1; Fri, 06 Dec 2019 11:48:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1EF39800EBF;
	Fri,  6 Dec 2019 16:47:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8AD3560BF4;
	Fri,  6 Dec 2019 16:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1ADBA65D1F;
	Fri,  6 Dec 2019 16:47:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6GkUuq027281 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 11:46:30 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4D5AF8FB24; Fri,  6 Dec 2019 16:46:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47C60113F7A
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 16:46:28 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73F938C4404
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 16:46:28 +0000 (UTC)
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-358--c7fbFOxOR-EcwjsRlxVWg-1; Fri, 06 Dec 2019 11:46:26 -0500
Received: by mail-lj1-f196.google.com with SMTP id k8so8340629ljh.5
	for <dm-devel@redhat.com>; Fri, 06 Dec 2019 08:46:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=izOB5AIz6WphOslyBMvyyaqhXesn0Bg3zFNTawmCdpY=;
	b=in6N1CjPCqjKv/MZBgpI4PueNY4avfOQuFk2+/eOpfNUkxsoqt7i8L1Cd5lTc07a3l
	KQzUW9jNRapxngLxxR8bFpuN6fwiXCydKy+Jxkyo98hW9lrrZ1p/1jMPkzxi5YKFP1jr
	4SGBEiJVRummhdyw+H6zGtobW83jHYUNRyH3dFRwj4uqMAL8wfMhAPloX+zot8hqVA7w
	aF7CzaGej656GEJWtYmaXNyOaQFeP3164/Cfxmq375PsC6+Ap6ujlKAgNx+sNpKsXXSq
	n7P9aBZgmeA59OoFjuHWvABuY1mmqNynJc0XQp3qedKAt8E5Z3vvM1EegE+xGD+puycR
	r48g==
X-Gm-Message-State: APjAAAX6a27pbUAfSugq4ieOaR29Oqo9wZ6rDJhqlAesvl7puIs//052
	pK2DYRsbqdjdkvQY0mvmTFWHIQ==
X-Google-Smtp-Source: APXvYqzD6EoBOJ3WtweATqZvDSRyVY54tse5+P1RR2s2zHvQ6qt3u7MEq5Q65+aPWQAsCFCIoUNVDA==
X-Received: by 2002:a2e:810d:: with SMTP id d13mr6598580ljg.113.1575650785218; 
	Fri, 06 Dec 2019 08:46:25 -0800 (PST)
Received: from [192.168.1.116] (130.43.113.55.dsl.dyn.forthnet.gr.
	[130.43.113.55]) by smtp.gmail.com with ESMTPSA id
	m10sm7011810lfa.46.2019.12.06.08.46.23
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Dec 2019 08:46:24 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20191204140654.26214-1-ntsironis@arrikto.com>
	<20191204140654.26214-4-ntsironis@arrikto.com>
	<20191205194651.GC95063@lobo> <20191205200747.GA6447@redhat.com>
	<7f5b0f44-2d16-db40-6d16-08929d5bebfe@arrikto.com>
	<20191205220915.GA7024@redhat.com>
	<09f5d4a1-1405-5304-105c-6140cdffa46b@arrikto.com>
	<20191206162117.GB3090@lobo>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <757e014f-46c9-1175-2b57-aebcd3b6e31f@arrikto.com>
Date: Fri, 6 Dec 2019 18:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191206162117.GB3090@lobo>
Content-Language: en-US
X-MC-Unique: -c7fbFOxOR-EcwjsRlxVWg-1
X-MC-Unique: josl5R5xOP-j8IfmSieuyQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, dm-devel@redhat.com, agk@redhat.com,
	iliastsi@arrikto.com
Subject: Re: [dm-devel] [PATCH 3/3] dm clone: Flush destination device
 before committing metadata
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
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/6/19 6:21 PM, Mike Snitzer wrote:
> On Thu, Dec 05 2019 at  5:42P -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 12/6/19 12:09 AM, Mike Snitzer wrote:
>>> On Thu, Dec 05 2019 at  4:49pm -0500,
>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>
>>>> For dm-thin, indeed, there is not much to gain by not using
>>>> blkdev_issue_flush(), since we still allocate a new bio, indirectly, in
>>>> the stack.
>>>
>>> But thinp obviously could if there is actual benefit to avoiding this
>>> flush bio allocation, via blkdev_issue_flush, every commit.
>>>
>>
>> Yes, we could do the flush in thinp exactly the same way we do it in
>> dm-clone. Add a struct bio field in struct pool_c and use that in the
>> callback.
>>
>> It would work since the callback is called holding a write lock on
>> pmd->root_lock, so it's executed only by a single thread at a time.
>>
>> I didn't go for it in my implementation, because I didn't like having to
>> make that assumption in the callback, i.e., that it's executed under a
>> lock and so it's safe to have the bio in struct pool_c.
>>
>> In hindsight, maybe this was a bad call, since it's technically feasible
>> to do it this way and we could just add a comment stating that the
>> callback is executed atomically.
>>
>> If you want I can send a new follow-on patch tomorrow implementing the
>> flush in thinp the same way it's implemented in dm-clone.
> 
> I took care of it, here is the incremental:
> 

Awesome, thanks!
  
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index 73d191ddbb9f..57626c27a54b 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -328,6 +328,7 @@ struct pool_c {
>   	dm_block_t low_water_blocks;
>   	struct pool_features requested_pf; /* Features requested during table load */
>   	struct pool_features adjusted_pf;  /* Features used after adjusting for constituent devices */
> +	struct bio flush_bio;
>   };
>   
>   /*
> @@ -3123,6 +3124,7 @@ static void pool_dtr(struct dm_target *ti)
>   	__pool_dec(pt->pool);
>   	dm_put_device(ti, pt->metadata_dev);
>   	dm_put_device(ti, pt->data_dev);
> +	bio_uninit(&pt->flush_bio);
>   	kfree(pt);
>   
>   	mutex_unlock(&dm_thin_pool_table.mutex);
> @@ -3202,8 +3204,13 @@ static void metadata_low_callback(void *context)
>   static int metadata_pre_commit_callback(void *context)
>   {
>   	struct pool_c *pt = context;
> +	struct bio *flush_bio = &pt->flush_bio;
>   
> -	return blkdev_issue_flush(pt->data_dev->bdev, GFP_NOIO, NULL);
> +	bio_reset(flush_bio);
> +	bio_set_dev(flush_bio, pt->data_dev->bdev);
> +	flush_bio->bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
> +
> +	return submit_bio_wait(flush_bio);
>   }
>   
>   static sector_t get_dev_size(struct block_device *bdev)
> @@ -3374,6 +3381,7 @@ static int pool_ctr(struct dm_target *ti, unsigned argc, char **argv)
>   	pt->data_dev = data_dev;
>   	pt->low_water_blocks = low_water_blocks;
>   	pt->adjusted_pf = pt->requested_pf = pf;
> +	bio_init(&pt->flush_bio, NULL, 0);
>   	ti->num_flush_bios = 1;
>   
>   	/*
> 

Looks good,

Thanks Nikos

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

