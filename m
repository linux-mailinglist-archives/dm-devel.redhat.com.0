Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A4BB533ADFF
	for <lists+dm-devel@lfdr.de>; Mon, 15 Mar 2021 09:56:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-IZzYC9iKNy20ZctC022rHg-1; Mon, 15 Mar 2021 04:55:56 -0400
X-MC-Unique: IZzYC9iKNy20ZctC022rHg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57AF88189CA;
	Mon, 15 Mar 2021 08:55:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A7A25D9DC;
	Mon, 15 Mar 2021 08:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BA35157DC1;
	Mon, 15 Mar 2021 08:55:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12C2QavU007886 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Mar 2021 21:26:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C1BA61032B2; Fri, 12 Mar 2021 02:26:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BC8021032A7
	for <dm-devel@redhat.com>; Fri, 12 Mar 2021 02:26:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DC4885A5AA
	for <dm-devel@redhat.com>; Fri, 12 Mar 2021 02:26:34 +0000 (UTC)
Received: from out30-131.freemail.mail.aliyun.com
	(out30-131.freemail.mail.aliyun.com [115.124.30.131]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-108-kHQlTXgJPSyHyTjJK65h-Q-1;
	Thu, 11 Mar 2021 21:26:30 -0500
X-MC-Unique: kHQlTXgJPSyHyTjJK65h-Q-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R371e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=8; SR=0;
	TI=SMTPD_---0URYCgK-_1615515984
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0URYCgK-_1615515984) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 12 Mar 2021 10:26:25 +0800
From: JeffleXu <jefflexu@linux.alibaba.com>
To: Mike Snitzer <snitzer@redhat.com>
References: <20210303115740.127001-1-jefflexu@linux.alibaba.com>
	<20210303115740.127001-11-jefflexu@linux.alibaba.com>
	<20210310231808.GD23410@redhat.com>
	<b6f0799a-1a11-3778-9b8a-702c3c103db5@linux.alibaba.com>
Message-ID: <99a31346-0720-d586-4e9f-ba6ee855f9b5@linux.alibaba.com>
Date: Fri, 12 Mar 2021 10:26:24 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b6f0799a-1a11-3778-9b8a-702c3c103db5@linux.alibaba.com>
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
X-Mailman-Approved-At: Mon, 15 Mar 2021 04:55:29 -0400
Cc: axboe@kernel.dk, caspar@linux.alibaba.com, linux-block@vger.kernel.org,
	joseph.qi@linux.alibaba.com, dm-devel@redhat.com,
	mpatocka@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v5 10/12] block: fastpath for bio-based
	polling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 3/11/21 2:36 PM, JeffleXu wrote:
> 
> 
> On 3/11/21 7:18 AM, Mike Snitzer wrote:
>> On Wed, Mar 03 2021 at  6:57am -0500,
>> Jeffle Xu <jefflexu@linux.alibaba.com> wrote:
>>
>>> Offer one fastpath for bio-based polling when bio submitted to dm
>>> device is not split.
>>>
>>> In this case, there will be only one bio submitted to only one polling
>>> hw queue of one underlying mq device, and thus we don't need to track
>>> all split bios or iterate through all polling hw queues. The pointer to
>>> the polling hw queue the bio submitted to is returned here as the
>>> returned cookie. In this case, the polling routine will call
>>> mq_ops->poll() directly with the hw queue converted from the input
>>> cookie.
>>>
>>> If the original bio submitted to dm device is split to multiple bios and
>>> thus submitted to multiple polling hw queues, the polling routine will
>>> fall back to iterating all hw queues (in polling mode) of all underlying
>>> mq devices.
>>>
>>> Signed-off-by: Jeffle Xu <jefflexu@linux.alibaba.com>
>>> ---
>>>  block/blk-core.c          | 73 +++++++++++++++++++++++++++++++++++++--
>>>  include/linux/blk_types.h | 66 +++++++++++++++++++++++++++++++++--
>>>  include/linux/types.h     |  2 +-
>>>  3 files changed, 135 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>> index 6d7d53030d7c..e5cd4ff08f5c 100644
>>> --- a/block/blk-core.c
>>> +++ b/block/blk-core.c
>>> @@ -947,14 +947,22 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>>>  {
>>>  	struct bio_list bio_list_on_stack[2];
>>>  	blk_qc_t ret = BLK_QC_T_NONE;
>>> +	struct request_queue *top_q;
>>> +	bool poll_on;
>>>  
>>>  	BUG_ON(bio->bi_next);
>>>  
>>>  	bio_list_init(&bio_list_on_stack[0]);
>>>  	current->bio_list = bio_list_on_stack;
>>>  
>>> +	top_q = bio->bi_bdev->bd_disk->queue;
>>> +	poll_on = test_bit(QUEUE_FLAG_POLL, &top_q->queue_flags) &&
>>> +		  (bio->bi_opf & REQ_HIPRI);
>>> +
>>>  	do {
>>> -		struct request_queue *q = bio->bi_bdev->bd_disk->queue;
>>> +		blk_qc_t cookie;
>>> +		struct block_device *bdev = bio->bi_bdev;
>>> +		struct request_queue *q = bdev->bd_disk->queue;
>>>  		struct bio_list lower, same;
>>>  
>>>  		if (unlikely(bio_queue_enter(bio) != 0))
>>> @@ -966,7 +974,23 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>>>  		bio_list_on_stack[1] = bio_list_on_stack[0];
>>>  		bio_list_init(&bio_list_on_stack[0]);
>>>  
>>> -		ret = __submit_bio(bio);
>>> +		cookie = __submit_bio(bio);
>>> +
>>> +		if (poll_on && blk_qc_t_valid(cookie)) {
>>> +			unsigned int queue_num = blk_qc_t_to_queue_num(cookie);
>>> +			unsigned int devt = bdev_whole(bdev)->bd_dev;
>>> +
>>> +			cookie = blk_qc_t_get_by_devt(devt, queue_num);
>>
>> The need to rebuild the cookie here is pretty awkward.  This
>> optimization living in block core may be worthwhile but the duality of
>> block core conditionally overriding the driver's returned cookie (that
>> is meant to be opaque to upper layer) is not great.
> 
> I agree that currently this design pattern has caused blk-core and dm
> being tightly coupled together. Maybe it's the most serous problem of
> this patchset, personally.
> 
> I can explain it though... Since the nature of the IO path of dm, dm
> itself doesn't know if the original bio be split to multiple split bios
> and thus submitted to multiple underlying devices or not. Currently I
> can only get this information in __submit_bio_noacct(), and that's why
> there's so much logic specific to dm is coupled with blk-core here.
> 

I didn't point out the most important part of that. dm can't get the
(really valid) cookie returned by mq. Suppose one dm device is built
upon one nvme, then dm_submit_bio() only remaps and the remapped bio is
actually *buffered* in the bio_list. In fact, he remapped bio is later
submitted in __submit_bio_noacct(). So dm doesn't know the cookie
(returned by underlying mq), while blk-core does.

dm could "predict" the cookie of following submitted IO to mq (dev_t and
index of hw queue), and return it (built by dev_t and hw queue index) in
advance, but this "prediction" is quite fragile, since the IO submitting
process could be migrated to another CPU, or the hw queue mapping of the
underlying mq device could change before __submit_bio_noacct() really
submits the IO.


-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

