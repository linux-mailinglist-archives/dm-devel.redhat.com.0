Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 438A3361B41
	for <lists+dm-devel@lfdr.de>; Fri, 16 Apr 2021 10:23:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-465-D-TKhlPzPcWzTTErrjljMA-1; Fri, 16 Apr 2021 04:23:02 -0400
X-MC-Unique: D-TKhlPzPcWzTTErrjljMA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9B63107ACE3;
	Fri, 16 Apr 2021 08:22:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E478710074E1;
	Fri, 16 Apr 2021 08:22:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ED0C21806D0F;
	Fri, 16 Apr 2021 08:22:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13F9M7kO024839 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Apr 2021 05:22:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B79E92182DAA; Thu, 15 Apr 2021 09:22:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B24B82180BD4
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 09:22:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B4ED8026D4
	for <dm-devel@redhat.com>; Thu, 15 Apr 2021 09:22:05 +0000 (UTC)
Received: from out30-44.freemail.mail.aliyun.com
	(out30-44.freemail.mail.aliyun.com [115.124.30.44]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-376-aBNAfOHvMaKCX_utuR2zqw-1;
	Thu, 15 Apr 2021 05:22:01 -0400
X-MC-Unique: aBNAfOHvMaKCX_utuR2zqw-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R471e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=7; SR=0;
	TI=SMTPD_---0UVdSSqP_1618478516
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UVdSSqP_1618478516) by smtp.aliyun-inc.com(127.0.0.1);
	Thu, 15 Apr 2021 17:21:56 +0800
To: Ming Lei <ming.lei@redhat.com>
References: <20210401021927.343727-1-ming.lei@redhat.com>
	<20210401021927.343727-12-ming.lei@redhat.com>
	<20210412093856.GA978201@infradead.org>
	<a6d46979-810e-bc53-bc19-8acd449e3718@linux.alibaba.com>
	<YHbQ/rZUPoTFUMDs@T590>
	<5f30059d-6650-8268-b681-d8567ac1c509@linux.alibaba.com>
	<YHfumsTKHuvPGp47@T590>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <0ceb3060-bce4-c39d-26cf-8c715ebbfd51@linux.alibaba.com>
Date: Thu, 15 Apr 2021 17:21:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YHfumsTKHuvPGp47@T590>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 16 Apr 2021 04:21:18 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>,
	Christoph Hellwig <hch@infradead.org>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH V5 11/12] block: add poll_capable method to
 support bio-based IO polling
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 4/15/21 3:43 PM, Ming Lei wrote:
> On Thu, Apr 15, 2021 at 09:34:36AM +0800, JeffleXu wrote:
>>
>>
>> On 4/14/21 7:24 PM, Ming Lei wrote:
>>> On Wed, Apr 14, 2021 at 04:38:25PM +0800, JeffleXu wrote:
>>>>
>>>>
>>>> On 4/12/21 5:38 PM, Christoph Hellwig wrote:
>>>>> On Thu, Apr 01, 2021 at 10:19:26AM +0800, Ming Lei wrote:
>>>>>> From: Jeffle Xu <jefflexu@linux.alibaba.com>
>>>>>>
>>>>>> This method can be used to check if bio-based device supports IO polling
>>>>>> or not. For mq devices, checking for hw queue in polling mode is
>>>>>> adequate, while the sanity check shall be implementation specific for
>>>>>> bio-based devices. For example, dm device needs to check if all
>>>>>> underlying devices are capable of IO polling.
>>>>>>
>>>>>> Though bio-based device may have done the sanity check during the
>>>>>> device initialization phase, cacheing the result of this sanity check
>>>>>> (such as by cacheing in the queue_flags) may not work. Because for dm
>>>>>> devices, users could change the state of the underlying devices through
>>>>>> '/sys/block/<dev>/io_poll', bypassing the dm device above. In this case,
>>>>>> the cached result of the very beginning sanity check could be
>>>>>> out-of-date. Thus the sanity check needs to be done every time 'io_poll'
>>>>>> is to be modified.
>>>>>
>>>>> I really don't think thi should be a method, and I really do dislike
>>>>> how we have all this "if (is_mq)" junk.  Why can't we have a flag on
>>>>> the gendisk that signals if the device can support polling that
>>>>> is autoamtically set for blk-mq and as-needed by bio based drivers?
>>>>
>>>> That would consume one more bit of queue->queue_flags.
>>>>
>>>> Besides, DM/MD is somehow special here that when one of the underlying
>>>> devices is disabled polling through '/sys/block/<dev>/io_poll',
>>>> currently there's no mechanism notifying the above MD/DM to clear the
>>>> previously set queue_flags. Thus the outdated queue_flags still
>>>> indicates this DM/MD is capable of polling, while in fact one of the
>>>> underlying device has been disabled for polling.
>>>
>>> Right, just like there isn't queue limit progagation.
>>>
>>> Another blocker could be that bio based queue doesn't support queue
>>> freezing.
>>
>> Do you mean the queue freezing is called in the following code snippet?
>>
>> ```
>> static ssize_t queue_poll_store(struct request_queue *q, const char
>> *page, size_t count)
>> {
>> 	...
>> 	if (poll_on) {
>> 		blk_queue_flag_set(QUEUE_FLAG_POLL, q);
>> 	} else {
>> 		blk_mq_freeze_queue(q);
>> 		blk_queue_flag_clear(QUEUE_FLAG_POLL, q);
>> 		blk_mq_unfreeze_queue(q);
>> 	}
>> ```
> 
> Yes, if it is a bio based queue. Or bio queued queue(DM, MD or others) may
> use freeze_queue to do similar thing.
> 
>>
>> And I can't understand how bio-based queue doesn't support queue freezing.
>>
>> ```
>> submit_bio_noacct
>> 	__submit_bio_noacct
>> 		bio_queue_enter
>> ```
>>
>> Every time submitting a bio, bio_queue_enter() will be called, and once
>> the queue has been frozen, bio_queue_enter() will wait there until the
>> queue is unfrozen.
> 
> Not like blk-mq, the refcount is just grabbed during submission for bio based
> queue. 

Could you please explain it more detailed ....


I will research a bit and see if we can extend freeze queue for
> covering bio based queue. One trouble is that bio is ended before
> freeing request.
> 
>>
>>>
>>>>
>>>> Mike had ever suggested that we can trust the queue_flag, and clear the
>>>> outdated queue_flags when later the IO submission or polling routine
>>>> finally finds that the device is not capable of polling. Currently
>>>> submit_bio_checks() will silently clear the REQ_HIPRI flag and still
>>>> submit the bio when the device is actually not capable of polling. To
>>>> fix the issue, could we break the submission and return an error code in
>>>> submit_bio_checks() if the device is not capable of polling when
>>>> submitting HIPRI bio?
>>>
>>> I think we may just leave it alone, if underlying queue becomes not pollable,
>>> the bio still can be submitted & completed via IRQ, just not efficient enough.
>>
>> Yes it still works. I agree if there's no better solution...
>>
>> And what about the issue Christoph originally concerned? Do we use one
>> more flag bit indicating if the queue capable of polling, or the
>> poll_capable() method way?
> 
> Just wondering why we can't use QUEUE_FLAG_POLL simply? If user wants to
> enable it, let's do it for them. And bio driver can start with default poll
> state by checking underlying queues.
> 

Consider the following scenario: QUEUE_FLAG_POLL is set after
initialization, indicating the device capable of polling; then polling
is turned off by '/sys/block/<dev>/io_poll', thus QUEUE_FLAG_POLL is
cleared.

So we have to implement two semantics:
1. a flag indicating whether the device is **capable** of polling or
not; (adding another flag bit, or calling poll_capable() every time
polling is to be turned on)
2. a flag indicating whether polling is currently **turned on** or not
(i.e., QUEUE_FLAG_POLL)



-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

