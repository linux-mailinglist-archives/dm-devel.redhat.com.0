Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B19533DE58
	for <lists+dm-devel@lfdr.de>; Tue, 16 Mar 2021 21:02:11 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-IQN36hJtMISXEepyIKwEOQ-1; Tue, 16 Mar 2021 16:02:07 -0400
X-MC-Unique: IQN36hJtMISXEepyIKwEOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 85EA781426D;
	Tue, 16 Mar 2021 20:02:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39AB510023B0;
	Tue, 16 Mar 2021 20:01:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A94BA85CC;
	Tue, 16 Mar 2021 20:01:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12G8qpi6005193 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Mar 2021 04:52:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8FBC32026980; Tue, 16 Mar 2021 08:52:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A0872026D48
	for <dm-devel@redhat.com>; Tue, 16 Mar 2021 08:52:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0FD38101A531
	for <dm-devel@redhat.com>; Tue, 16 Mar 2021 08:52:48 +0000 (UTC)
Received: from out30-42.freemail.mail.aliyun.com
	(out30-42.freemail.mail.aliyun.com [115.124.30.42]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-237-WPQGM5ckP-mjnPvkO509pA-1;
	Tue, 16 Mar 2021 04:52:43 -0400
X-MC-Unique: WPQGM5ckP-mjnPvkO509pA-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R141e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e01424;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
	TI=SMTPD_---0US7yKRe_1615884757
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0US7yKRe_1615884757) by smtp.aliyun-inc.com(127.0.0.1);
	Tue, 16 Mar 2021 16:52:37 +0800
To: Ming Lei <ming.lei@redhat.com>
References: <20210316031523.864506-1-ming.lei@redhat.com>
	<20210316031523.864506-9-ming.lei@redhat.com>
	<b4dce8c6-61dd-9524-0a55-41db63eb084d@linux.alibaba.com>
	<YFBbjY+oDpjIHI3P@T590>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <3848e80d-e7ad-9372-c96f-d32bfb9f0ae5@linux.alibaba.com>
Date: Tue, 16 Mar 2021 16:52:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YFBbjY+oDpjIHI3P@T590>
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
X-Mailman-Approved-At: Tue, 16 Mar 2021 16:01:36 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Christoph Hellwig <hch@lst.de>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [RFC PATCH 08/11] block: use per-task poll context
 to implement bio based io poll
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



On 3/16/21 3:17 PM, Ming Lei wrote:
> On Tue, Mar 16, 2021 at 02:46:08PM +0800, JeffleXu wrote:
>> It is a giant progress to gather all split bios that need to be polled
>> in a per-task queue. Still some comments below.
>>
>>
>> On 3/16/21 11:15 AM, Ming Lei wrote:
>>> Currently bio based IO poll needs to poll all hw queue blindly, this way
>>> is very inefficient, and the big reason is that we can't pass bio
>>> submission result to io poll task.
>>>
>>> In IO submission context, store associated underlying bios into the
>>> submission queue and save 'cookie' poll data in bio->bi_iter.bi_private_data,
>>> and return current->pid to caller of submit_bio() for any DM or bio based
>>> driver's IO, which is submitted from FS.
>>>
>>> In IO poll context, the passed cookie tells us the PID of submission
>>> context, and we can find the bio from that submission context. Moving
>>> bio from submission queue to poll queue of the poll context, and keep
>>> polling until these bios are ended. Remove bio from poll queue if the
>>> bio is ended. Add BIO_DONE and BIO_END_BY_POLL for such purpose.
>>>
>>> Usually submission shares context with io poll. The per-task poll context
>>> is just like stack variable, and it is cheap to move data between the two
>>> per-task queues.
>>>
>>> Signed-off-by: Ming Lei <ming.lei@redhat.com>
>>> ---
>>>  block/bio.c               |   5 ++
>>>  block/blk-core.c          |  74 +++++++++++++++++-
>>>  block/blk-mq.c            | 156 +++++++++++++++++++++++++++++++++++++-
>>>  include/linux/blk_types.h |   3 +
>>>  4 files changed, 235 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/block/bio.c b/block/bio.c
>>> index a1c4d2900c7a..bcf5eca0e8e3 100644
>>> --- a/block/bio.c
>>> +++ b/block/bio.c
>>> @@ -1402,6 +1402,11 @@ static inline bool bio_remaining_done(struct bio *bio)
>>>   **/
>>>  void bio_endio(struct bio *bio)
>>>  {
>>> +	/* BIO_END_BY_POLL has to be set before calling submit_bio */
>>> +	if (bio_flagged(bio, BIO_END_BY_POLL)) {
>>> +		bio_set_flag(bio, BIO_DONE);
>>> +		return;
>>> +	}
>>>  again:
>>>  	if (!bio_remaining_done(bio))
>>>  		return;
>>> diff --git a/block/blk-core.c b/block/blk-core.c
>>> index a082bbc856fb..970b23fa2e6e 100644
>>> --- a/block/blk-core.c
>>> +++ b/block/blk-core.c
>>> @@ -854,6 +854,40 @@ static inline void blk_bio_poll_preprocess(struct request_queue *q,
>>>  		bio->bi_opf |= REQ_TAG;
>>>  }
>>>  
>>> +static bool blk_bio_poll_prep_submit(struct io_context *ioc, struct bio *bio)
>>> +{
>>> +	struct blk_bio_poll_data data = {
>>> +		.bio	=	bio,
>>> +	};
>>> +	struct blk_bio_poll_ctx *pc = ioc->data;
>>> +	unsigned int queued;
>>> +
>>> +	/* lock is required if there is more than one writer */
>>> +	if (unlikely(atomic_read(&ioc->nr_tasks) > 1)) {
>>> +		spin_lock(&pc->lock);
>>> +		queued = kfifo_put(&pc->sq, data);
>>> +		spin_unlock(&pc->lock);
>>> +	} else {
>>> +		queued = kfifo_put(&pc->sq, data);
>>> +	}
>>> +
>>> +	/*
>>> +	 * Now the bio is added per-task fifo, mark it as END_BY_POLL,
>>> +	 * so we can save cookie into this bio after submit_bio().
>>> +	 */
>>> +	if (queued)
>>> +		bio_set_flag(bio, BIO_END_BY_POLL);
>>> +	else
>>> +		bio->bi_opf &= ~(REQ_HIPRI | REQ_TAG);
>>> +
>>> +	return queued;
>>> +}
>>
>> The size of kfifo is limited, and it seems that once the sq of kfifio is
>> full, REQ_HIPRI flag is cleared and the corresponding bio is actually
>> enqueued into the default hw queue, which is IRQ driven.
> 
> Yeah, this patch starts with 64 queue depth, and we can increase it to
> 128, which should cover most of cases.

It seems that the queue depth of kfifo will affect the performance as I
did a fast test.



Test Result:

BLK_BIO_POLL_SQ_SZ | iodepth | IOPS
------------------ | ------- | ----
64                 | 128     | 301k (IRQ) -> 340k (iopoll)
64                 | 16      | 304k (IRQ) -> 392k (iopoll)
128                | 128     | 204k (IRQ) -> 317k (iopoll)
256                | 128     | 241k (IRQ) -> 391k (iopoll)

It seems that BLK_BIO_POLL_SQ_SZ need to be increased accordingly when
iodepth is quite large. But I don't know why the performance in IRQ mode
decreases when BLK_BIO_POLL_SQ_SZ is increased.





Test Environment:
nvme.poll_queues = 1,
dmsetup create testdev --table '0 2097152 linear /dev/nvme0n1 0',

```
$cat fio.conf
[global]
name=iouring-sqpoll-iopoll-1
ioengine=io_uring
iodepth=128
numjobs=1
thread
rw=randread
direct=1
#hipri=1
bs=4k
runtime=10
time_based
group_reporting
randrepeat=0
cpus_allowed=44

[device]
filename=/dev/mapper/testdev
```



> 
>>
>>
>>> +
>>> +static void blk_bio_poll_post_submit(struct bio *bio, blk_qc_t cookie)
>>> +{
>>> +	bio->bi_iter.bi_private_data = cookie;
>>> +}
>>> +
>>>  static noinline_for_stack bool submit_bio_checks(struct bio *bio)
>>>  {
>>>  	struct block_device *bdev = bio->bi_bdev;
>>> @@ -1008,7 +1042,7 @@ static blk_qc_t __submit_bio(struct bio *bio)
>>>   * bio_list_on_stack[1] contains bios that were submitted before the current
>>>   *	->submit_bio_bio, but that haven't been processed yet.
>>>   */
>>> -static blk_qc_t __submit_bio_noacct(struct bio *bio)
>>> +static blk_qc_t __submit_bio_noacct_int(struct bio *bio, struct io_context *ioc)
>>>  {
>>>  	struct bio_list bio_list_on_stack[2];
>>>  	blk_qc_t ret = BLK_QC_T_NONE;
>>> @@ -1031,7 +1065,16 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>>>  		bio_list_on_stack[1] = bio_list_on_stack[0];
>>>  		bio_list_init(&bio_list_on_stack[0]);
>>>  
>>> -		ret = __submit_bio(bio);
>>> +		if (ioc && queue_is_mq(q) &&
>>> +				(bio->bi_opf & (REQ_HIPRI | REQ_TAG))) {
>>> +			bool queued = blk_bio_poll_prep_submit(ioc, bio);
>>> +
>>> +			ret = __submit_bio(bio);
>>> +			if (queued)
>>> +				blk_bio_poll_post_submit(bio, ret);
>>> +		} else {
>>> +			ret = __submit_bio(bio);
>>> +		}
>>>  
>>>  		/*
>>>  		 * Sort new bios into those for a lower level and those for the
>>> @@ -1057,6 +1100,33 @@ static blk_qc_t __submit_bio_noacct(struct bio *bio)
>>>  	return ret;
>>>  }
>>>  
>>> +static inline blk_qc_t __submit_bio_noacct_poll(struct bio *bio,
>>> +		struct io_context *ioc)
>>> +{
>>> +	struct blk_bio_poll_ctx *pc = ioc->data;
>>> +	int entries = kfifo_len(&pc->sq);
>>> +
>>> +	__submit_bio_noacct_int(bio, ioc);
>>> +
>>> +	/* bio submissions queued to per-task poll context */
>>> +	if (kfifo_len(&pc->sq) > entries)
>>> +		return current->pid;
>>> +
>>> +	/* swapper's pid is 0, but it can't submit poll IO for us */
>>> +	return 0;
>>> +}
>>> +
>>> +static inline blk_qc_t __submit_bio_noacct(struct bio *bio)
>>> +{
>>> +	struct io_context *ioc = current->io_context;
>>> +
>>> +	if (ioc && ioc->data && (bio->bi_opf & REQ_HIPRI))
>>> +		return __submit_bio_noacct_poll(bio, ioc);
>>> +
>>> +	return __submit_bio_noacct_int(bio, NULL);
>>> +}
>>> +
>>> +
>>>  static blk_qc_t __submit_bio_noacct_mq(struct bio *bio)
>>>  {
>>>  	struct bio_list bio_list[2] = { };
>>> diff --git a/block/blk-mq.c b/block/blk-mq.c
>>> index 03f59915fe2c..4e6f1467d303 100644
>>> --- a/block/blk-mq.c
>>> +++ b/block/blk-mq.c
>>> @@ -3865,14 +3865,168 @@ static inline int blk_mq_poll_hctx(struct request_queue *q,
>>>  	return ret;
>>>  }
>>>  
>>> +static blk_qc_t bio_get_poll_cookie(struct bio *bio)
>>> +{
>>> +	return bio->bi_iter.bi_private_data;
>>> +}
>>> +
>>> +static int blk_mq_poll_io(struct bio *bio)
>>> +{
>>> +	struct request_queue *q = bio->bi_bdev->bd_disk->queue;
>>> +	blk_qc_t cookie = bio_get_poll_cookie(bio);
>>> +	int ret = 0;
>>> +
>>> +	if (!bio_flagged(bio, BIO_DONE) && blk_qc_t_valid(cookie)) {
>>> +		struct blk_mq_hw_ctx *hctx =
>>> +			q->queue_hw_ctx[blk_qc_t_to_queue_num(cookie)];
>>> +
>>> +		ret += blk_mq_poll_hctx(q, hctx);
>>> +	}
>>> +	return ret;
>>> +}
>>> +
>>> +static int blk_bio_poll_and_end_io(struct request_queue *q,
>>> +		struct blk_bio_poll_ctx *poll_ctx)
>>> +{
>>> +	struct blk_bio_poll_data *poll_data = &poll_ctx->pq[0];
>>> +	int ret = 0;
>>> +	int i;
>>> +
>>> +	for (i = 0; i < BLK_BIO_POLL_PQ_SZ; i++) {
>>> +		struct bio *bio = poll_data[i].bio;
>>> +
>>> +		if (!bio)
>>> +			continue;
>>> +
>>> +		ret += blk_mq_poll_io(bio);
>>> +		if (bio_flagged(bio, BIO_DONE)) {
>>> +			poll_data[i].bio = NULL;
>>> +
>>> +			/* clear BIO_END_BY_POLL and end me really */
>>> +			bio_clear_flag(bio, BIO_END_BY_POLL);
>>> +			bio_endio(bio);
>>> +		}
>>> +	}
>>> +	return ret;
>>> +}
>>
>> When there are multiple threads polling, saying thread A and thread B,
>> then there's one bio which should be polled by thread A (the pid is
>> passed to thread A), while it's actually completed by thread B. In this
>> case, when the bio is completed by thread B, the bio is not really
>> completed and one extra blk_poll() still needs to be called.
> 
> When this happens, the dm bio can't be completed, and the associated
> kiocb can't be completed too, io_uring or other poll code context will
> keep calling blk_poll() by passing thread A's pid until this dm bio is
> done, since the dm bio is submitted from thread A.
> 
> 
> Thanks, 
> Ming
> 

-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

