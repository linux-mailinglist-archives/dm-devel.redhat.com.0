Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3CB327BE77
	for <lists+dm-devel@lfdr.de>; Tue, 29 Sep 2020 09:55:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-bEIPDjDfMZ6t3ngPov7Pfg-1; Tue, 29 Sep 2020 03:55:29 -0400
X-MC-Unique: bEIPDjDfMZ6t3ngPov7Pfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0A0D186DD20;
	Tue, 29 Sep 2020 07:55:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E6497EB74;
	Tue, 29 Sep 2020 07:55:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 464E344A59;
	Tue, 29 Sep 2020 07:55:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08T48LdV006998 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 29 Sep 2020 00:08:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 50D462166BD9; Tue, 29 Sep 2020 04:08:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B8E52166BA3
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 04:08:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E8C86811E79
	for <dm-devel@redhat.com>; Tue, 29 Sep 2020 04:08:18 +0000 (UTC)
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-358-1iyEHYgYN7Gf9mQXVwVQDw-1;
	Tue, 29 Sep 2020 00:08:14 -0400
X-MC-Unique: 1iyEHYgYN7Gf9mQXVwVQDw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04423;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=5; SR=0;
	TI=SMTPD_---0UAS.o2m_1601352487
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UAS.o2m_1601352487) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 29 Sep 2020 12:08:07 +0800
To: Mike Snitzer <snitzer@redhat.com>
References: <20200927120435.44118-1-jefflexu@linux.alibaba.com>
	<20200928160322.GA23320@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <2f6f1882-0519-22fc-a11c-645b721ac731@linux.alibaba.com>
Date: Tue, 29 Sep 2020 12:08:07 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200928160322.GA23320@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 29 Sep 2020 03:54:59 -0400
Cc: linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, ming.lei@redhat.com
Subject: Re: [dm-devel] dm: fix imposition of queue_limits in dm_wq_work()
	thread
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"

I see. Thanks.

On 9/29/20 12:03 AM, Mike Snitzer wrote:
> On Sun, Sep 27 2020 at  8:04am -0400,
> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>
>> Hi Mike, would you mind further expalin why bio processed by dm_wq_work()
>> always gets a previous ->submit_bio. Considering the following call graph:
>>
>> ->submit_bio, that is, dm_submit_bio
>>    DMF_BLOCK_IO_FOR_SUSPEND set, thus queue_io()
>>
>> then worker thread dm_wq_work()
>>    dm_process_bio  // at this point. the input bio is the original bio
>>                       submitted to dm device
>>
>> Please let me know if I missed something.
>>
>> Thanks.
>> Jeffle
> In general you have a valid point, that blk_queue_split() won't have
> been done for the suspended device case, but blk_queue_split() cannot be
> used if not in ->submit_bio -- IIUC you cannot just do it from a worker
> thread and hope to have proper submission order (depth first) as
> provided by __submit_bio_noacct().  Because this IO will be submitted
> from worker you could have multiple threads allocating from the
> q->bio_split mempool at the same time.
>
> All said, I'm not quite sure how to address this report.  But I'll keep
> at it and see what I can come up with.
>
> Thanks,
> Mike
>
>> Original commit log:
>> dm_process_bio() can be called by dm_wq_work(), and if the currently
>> processing bio is the very beginning bio submitted to the dm device,
>> that is it has not been handled by previous ->submit_bio, then we also
>> need to impose the queue_limits when it's in thread (dm_wq_work()).
>>
>> Fixes: cf9c37865557 ("dm: fix comment in dm_process_bio()")
>> Fixes: 568c73a355e0 ("dm: update dm_process_bio() to split bio if in ->make_request_fn()")
>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>> ---
>>   drivers/md/dm.c | 16 ++++++----------
>>   1 file changed, 6 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>> index 6ed05ca65a0f..54471c75ddef 100644
>> --- a/drivers/md/dm.c
>> +++ b/drivers/md/dm.c
>> @@ -1744,17 +1744,13 @@ static blk_qc_t dm_process_bio(struct mapped_device *md,
>>   	}
>>   
>>   	/*
>> -	 * If in ->submit_bio we need to use blk_queue_split(), otherwise
>> -	 * queue_limits for abnormal requests (e.g. discard, writesame, etc)
>> -	 * won't be imposed.
>> -	 * If called from dm_wq_work() for deferred bio processing, bio
>> -	 * was already handled by following code with previous ->submit_bio.
>> +	 * Call blk_queue_split() so that queue_limits for abnormal requests
>> +	 * (e.g. discard, writesame, etc) are ensured to be imposed, while
>> +	 * it's not needed for regular IO, since regular IO will be split by
>> +	 * following __split_and_process_bio.
>>   	 */
>> -	if (current->bio_list) {
>> -		if (is_abnormal_io(bio))
>> -			blk_queue_split(&bio);
>> -		/* regular IO is split by __split_and_process_bio */
>> -	}
>> +	if (is_abnormal_io(bio))
>> +		blk_queue_split(&bio);
>>   
>>   	if (dm_get_md_type(md) == DM_TYPE_NVME_BIO_BASED)
>>   		return __process_bio(md, map, bio, ti);
>> -- 
>> 2.27.0
>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

