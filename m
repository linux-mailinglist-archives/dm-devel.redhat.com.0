Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3C71C1148BD
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 22:34:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575581661;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=DCnTKETraugf2/RZLs64h1ZPSPHvuk5UoAXcKFnZGHU=;
	b=Efjh1tJ37naHrlVQzTSfvwotOiQBX7/VcNPYyjPHvPzOZuEhAUFymqSgFlM63HjmRX5Hi1
	E7I8TUJ9gJ1xQPYPETlAt57r0M3f5RI6DFNtuR/4/eJCYAY7eDumKPBsYJ+lCbyssOLVtC
	NeTUdTjbk6tjkuZMm3+1HJ1DxE7nTBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-k1EJAh3HMX6jJoJywrNDZw-1; Thu, 05 Dec 2019 16:34:16 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B1C2DB20;
	Thu,  5 Dec 2019 21:34:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 001616106B;
	Thu,  5 Dec 2019 21:34:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 04A3441F07;
	Thu,  5 Dec 2019 21:33:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5LXiDH019023 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 16:33:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B75F5101F0D4; Thu,  5 Dec 2019 21:33:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0A96101F0D7
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 21:33:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0362C801E7A
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 21:33:42 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-241-Ts-7B_j-MPOeb68DyiFH9A-1; Thu, 05 Dec 2019 16:33:37 -0500
Received: by mail-lj1-f195.google.com with SMTP id a13so5261670ljm.10
	for <dm-devel@redhat.com>; Thu, 05 Dec 2019 13:33:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=HmLCyhiMM+MyK+zjG6bdWzTrjn6Jve1KbWvurbTeOY8=;
	b=OFDSULz5yvag4u81OsN0k0SLbyc8gFXIN0Cf4HbywjA7gDNMpp+9KZJEUWJhsbH1VO
	NfNA3ZQBhZLGN372c8A05tOcSSKKtfnmghbh0tMDgsFBJ9tfQK6eQmuLM9IJLmWFEqBc
	cunX+XZAUWGHw3pSQRJlm6MA7S4HJ3f69EqJv5HRnVTf66PSvt9GFpHwTKITImvIvskU
	ynZ4qN4xnodpecoalzjDEBWURLP/ciQZrCVJyLk3IUVr6vuMGmJn1AGzfNjvHHYfFiYD
	1DGtswMSI+VR32qhp+FgicU7bv6VzLJI6qfImLOYdDTtZw3QaS0LRvd1c2+++uyyc4so
	zHvQ==
X-Gm-Message-State: APjAAAUHUu/hzW/hWIpaSTLC/DzkbojT23mlEj53UTQ7XJQMlOSXIhe+
	xngXpTXef0T4SP1PoNAWVqXSAw==
X-Google-Smtp-Source: APXvYqz1xVhxo8oBOjVFy5rQ5/5YJjiX3EXr+JhzwO83grogGUSdMSi0X0Lgfp6c7uoKjPszDSof1Q==
X-Received: by 2002:a2e:8646:: with SMTP id i6mr6842775ljj.122.1575581616195; 
	Thu, 05 Dec 2019 13:33:36 -0800 (PST)
Received: from [192.168.1.116] (130.43.113.55.dsl.dyn.forthnet.gr.
	[130.43.113.55])
	by smtp.gmail.com with ESMTPSA id d9sm2972797lja.73.2019.12.05.13.33.34
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 13:33:35 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<20191204140742.26273-2-ntsironis@arrikto.com>
	<20191205193157.GA95063@lobo>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <3ea785c5-5421-9fb3-5516-95cc42392c2b@arrikto.com>
Date: Thu, 5 Dec 2019 23:33:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205193157.GA95063@lobo>
Content-Language: en-US
X-MC-Unique: Ts-7B_j-MPOeb68DyiFH9A-1
X-MC-Unique: k1EJAh3HMX6jJoJywrNDZw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 1/2] dm thin metadata: Add support for a
 pre-commit callback
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

On 12/5/19 9:40 PM, Mike Snitzer wrote:
> On Wed, Dec 04 2019 at  9:07P -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> Add support for one pre-commit callback which is run right before the
>> metadata are committed.
>>
>> This allows the thin provisioning target to run a callback before the
>> metadata are committed and is required by the next commit.
>>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
>> ---
>>   drivers/md/dm-thin-metadata.c | 29 +++++++++++++++++++++++++++++
>>   drivers/md/dm-thin-metadata.h |  7 +++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/md/dm-thin-metadata.c b/drivers/md/dm-thin-metadata.c
>> index 4c68a7b93d5e..b88d6d701f5b 100644
>> --- a/drivers/md/dm-thin-metadata.c
>> +++ b/drivers/md/dm-thin-metadata.c
>> @@ -189,6 +189,15 @@ struct dm_pool_metadata {
>>   	sector_t data_block_size;
>>   
>>   	/*
>> +	 * Pre-commit callback.
>> +	 *
>> +	 * This allows the thin provisioning target to run a callback before
>> +	 * the metadata are committed.
>> +	 */
>> +	dm_pool_pre_commit_fn pre_commit_fn;
>> +	void *pre_commit_context;
>> +
>> +	/*
>>   	 * We reserve a section of the metadata for commit overhead.
>>   	 * All reported space does *not* include this.
>>   	 */
>> @@ -826,6 +835,14 @@ static int __commit_transaction(struct dm_pool_metadata *pmd)
>>   	if (unlikely(!pmd->in_service))
>>   		return 0;
>>   
>> +	if (pmd->pre_commit_fn) {
>> +		r = pmd->pre_commit_fn(pmd->pre_commit_context);
>> +		if (r < 0) {
>> +			DMERR("pre-commit callback failed");
>> +			return r;
>> +		}
>> +	}
>> +
>>   	r = __write_changed_details(pmd);
>>   	if (r < 0)
>>   		return r;
>> @@ -892,6 +909,8 @@ struct dm_pool_metadata *dm_pool_metadata_open(struct block_device *bdev,
>>   	pmd->in_service = false;
>>   	pmd->bdev = bdev;
>>   	pmd->data_block_size = data_block_size;
>> +	pmd->pre_commit_fn = NULL;
>> +	pmd->pre_commit_context = NULL;
>>   
>>   	r = __create_persistent_data_objects(pmd, format_device);
>>   	if (r) {
>> @@ -2044,6 +2063,16 @@ int dm_pool_register_metadata_threshold(struct dm_pool_metadata *pmd,
>>   	return r;
>>   }
>>   
>> +void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
>> +					  dm_pool_pre_commit_fn fn,
>> +					  void *context)
>> +{
>> +	pmd_write_lock_in_core(pmd);
>> +	pmd->pre_commit_fn = fn;
>> +	pmd->pre_commit_context = context;
>> +	pmd_write_unlock(pmd);
>> +}
>> +
>>   int dm_pool_metadata_set_needs_check(struct dm_pool_metadata *pmd)
>>   {
>>   	int r = -EINVAL;
>> diff --git a/drivers/md/dm-thin-metadata.h b/drivers/md/dm-thin-metadata.h
>> index f6be0d733c20..7ef56bd2a7e3 100644
>> --- a/drivers/md/dm-thin-metadata.h
>> +++ b/drivers/md/dm-thin-metadata.h
>> @@ -230,6 +230,13 @@ bool dm_pool_metadata_needs_check(struct dm_pool_metadata *pmd);
>>    */
>>   void dm_pool_issue_prefetches(struct dm_pool_metadata *pmd);
>>   
>> +/* Pre-commit callback */
>> +typedef int (*dm_pool_pre_commit_fn)(void *context);
>> +
>> +void dm_pool_register_pre_commit_callback(struct dm_pool_metadata *pmd,
>> +					  dm_pool_pre_commit_fn fn,
>> +					  void *context);
>> +
>>   /*----------------------------------------------------------------*/
>>   
>>   #endif
>> -- 
>> 2.11.0
>>
> 
> I have this incremental, not seeing need to avoid using blkdev_issue_flush
>

Ack,

Nikos.
  
> ---
>   drivers/md/dm-thin.c | 12 +-----------
>   1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index 9c9a323c0c30..255a52f7bbf0 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -3203,18 +3203,8 @@ static void metadata_low_callback(void *context)
>   static int metadata_pre_commit_callback(void *context)
>   {
>   	struct pool_c *pt = context;
> -	struct bio bio;
> -	int r;
> -
> -	bio_init(&bio, NULL, 0);
> -	bio_set_dev(&bio, pt->data_dev->bdev);
> -	bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
> -
> -	r = submit_bio_wait(&bio);
>   
> -	bio_uninit(&bio);
> -
> -	return r;
> +	return blkdev_issue_flush(pt->data_dev->bdev, GFP_NOIO, NULL);
>   }
>   
>   static sector_t get_dev_size(struct block_device *bdev)
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

