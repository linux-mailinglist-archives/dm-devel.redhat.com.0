Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 156AD114971
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 23:42:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575585760;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=alhuD3636ljlNavWnA025nK0irBa9XBNqnOPiDwlCH4=;
	b=DX4xYV+7u6pU0b/iPTavUk+2SwHUYxiP33hPaBurUq/sy3cHTvwrGONwa7a1VFM+lQECGY
	dpTvlp3v7CpTBuCPAfVZzO+uhqDvPyTfXrIrRqDaxvz2+hiLZL4TL743nXjdJBQquCFHo9
	q/2oTXiRVTZAu7Qp7aYyr/9k/Q6uOgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-bOP38nIoOoG8FAkYCNFkAQ-1; Thu, 05 Dec 2019 17:42:38 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7C9E31005514;
	Thu,  5 Dec 2019 22:42:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A09E1001281;
	Thu,  5 Dec 2019 22:42:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE3BF65D31;
	Thu,  5 Dec 2019 22:42:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5MgJXN022529 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 17:42:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 89CC12166B2E; Thu,  5 Dec 2019 22:42:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 84EB92166B2D
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 22:42:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A08C6802881
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 22:42:17 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-310-tqSjDonUMgablX1GQ-CqKQ-1; Thu, 05 Dec 2019 17:42:15 -0500
Received: by mail-lj1-f194.google.com with SMTP id c19so5405612lji.11
	for <dm-devel@redhat.com>; Thu, 05 Dec 2019 14:42:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=gV+n8xF4/31eNjVX5TfnUIVkbGFJXtmbk3QRcgKy58U=;
	b=TsCf1aEUjHAUidyR67p+aKnj0W5wNKW211VTEKj4gfVLt8GQNSbp00hfaN+fkXybFc
	5w48+zePBN+sNPGkQzJixTcVtoXMNWUYcUDq6vDsiDKno6CQsSGnyKSasJLdaghMcJSp
	EIiWGVI13yGNrJ4CKCmS1LEV6vca+rJr8FI+yEpbbuzN5c0iWH/XuyM9XfNNYK76wIH1
	/OFeLwrGQPjSz1YUaNUfsAYVpPO5jEXA6D2kmSz3zpVUhsYwNINicElgWlcX8dibstR4
	e4RxMBNzO8fa64QQePno3jI7/F7DKQ+K3+pAoe9G7btLXoUXrVXFQbhXjRRBSakxS5ex
	n6EA==
X-Gm-Message-State: APjAAAW0tSIAtWX950clgkWP86yQIF6T91/8kyLEMbPD6rfKeH1bFr2Y
	VNt8kt+rlHtnr/MdXkQ8GN2ivw==
X-Google-Smtp-Source: APXvYqyVk3m9MadFEKMkVBQfi1x2zbty4A9jO1ssxXE438W7p+hCl+ZLbBusLhbz3DOpnEFphJy+/Q==
X-Received: by 2002:a2e:94d5:: with SMTP id r21mr7088608ljh.33.1575585733423; 
	Thu, 05 Dec 2019 14:42:13 -0800 (PST)
Received: from [192.168.1.116] (130.43.113.55.dsl.dyn.forthnet.gr.
	[130.43.113.55]) by smtp.gmail.com with ESMTPSA id
	d24sm5517250lja.82.2019.12.05.14.42.12
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 14:42:12 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20191204140654.26214-1-ntsironis@arrikto.com>
	<20191204140654.26214-4-ntsironis@arrikto.com>
	<20191205194651.GC95063@lobo> <20191205200747.GA6447@redhat.com>
	<7f5b0f44-2d16-db40-6d16-08929d5bebfe@arrikto.com>
	<20191205220915.GA7024@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <09f5d4a1-1405-5304-105c-6140cdffa46b@arrikto.com>
Date: Fri, 6 Dec 2019 00:42:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205220915.GA7024@redhat.com>
Content-Language: en-US
X-MC-Unique: tqSjDonUMgablX1GQ-CqKQ-1
X-MC-Unique: bOP38nIoOoG8FAkYCNFkAQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/6/19 12:09 AM, Mike Snitzer wrote:
> On Thu, Dec 05 2019 at  4:49pm -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 12/5/19 10:07 PM, Mike Snitzer wrote:
>>> On Thu, Dec 05 2019 at  2:46pm -0500,
>>> Mike Snitzer <snitzer@redhat.com> wrote:
>>>
>>>> On Wed, Dec 04 2019 at  9:06P -0500,
>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>
>>>>> dm-clone maintains an on-disk bitmap which records which regions are
>>>>> valid in the destination device, i.e., which regions have already been
>>>>> hydrated, or have been written to directly, via user I/O.
>>>>>
>>>>> Setting a bit in the on-disk bitmap meas the corresponding region is
>>>>> valid in the destination device and we redirect all I/O regarding it to
>>>>> the destination device.
>>>>>
>>>>> Suppose the destination device has a volatile write-back cache and the
>>>>> following sequence of events occur:
>>>>>
>>>>> 1. A region gets hydrated, either through the background hydration or
>>>>>     because it was written to directly, via user I/O.
>>>>>
>>>>> 2. The commit timeout expires and we commit the metadata, marking that
>>>>>     region as valid in the destination device.
>>>>>
>>>>> 3. The system crashes and the destination device's cache has not been
>>>>>     flushed, meaning the region's data are lost.
>>>>>
>>>>> The next time we read that region we read it from the destination
>>>>> device, since the metadata have been successfully committed, but the
>>>>> data are lost due to the crash, so we read garbage instead of the old
>>>>> data.
>>>>>
>>>>> This has several implications:
>>>>>
>>>>> 1. In case of background hydration or of writes with size smaller than
>>>>>     the region size (which means we first copy the whole region and then
>>>>>     issue the smaller write), we corrupt data that the user never
>>>>>     touched.
>>>>>
>>>>> 2. In case of writes with size equal to the device's logical block size,
>>>>>     we fail to provide atomic sector writes. When the system recovers the
>>>>>     user will read garbage from the sector instead of the old data or the
>>>>>     new data.
>>>>>
>>>>> 3. In case of writes without the FUA flag set, after the system
>>>>>     recovers, the written sectors will contain garbage instead of a
>>>>>     random mix of sectors containing either old data or new data, thus we
>>>>>     fail again to provide atomic sector writes.
>>>>>
>>>>> 4. Even when the user flushes the dm-clone device, because we first
>>>>>     commit the metadata and then pass down the flush, the same risk for
>>>>>     corruption exists (if the system crashes after the metadata have been
>>>>>     committed but before the flush is passed down).
>>>>>
>>>>> The only case which is unaffected is that of writes with size equal to
>>>>> the region size and with the FUA flag set. But, because FUA writes
>>>>> trigger metadata commits, this case can trigger the corruption
>>>>> indirectly.
>>>>>
>>>>> To solve this and avoid the potential data corruption we flush the
>>>>> destination device **before** committing the metadata.
>>>>>
>>>>> This ensures that any freshly hydrated regions, for which we commit the
>>>>> metadata, are properly written to non-volatile storage and won't be lost
>>>>> in case of a crash.
>>>>>
>>>>> Fixes: 7431b7835f55 ("dm: add clone target")
>>>>> Cc: stable@vger.kernel.org # v5.4+
>>>>> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
>>>>> ---
>>>>>   drivers/md/dm-clone-target.c | 46 ++++++++++++++++++++++++++++++++++++++------
>>>>>   1 file changed, 40 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/drivers/md/dm-clone-target.c b/drivers/md/dm-clone-target.c
>>>>> index 613c913c296c..d1e1b5b56b1b 100644
>>>>> --- a/drivers/md/dm-clone-target.c
>>>>> +++ b/drivers/md/dm-clone-target.c
>>>>> @@ -86,6 +86,12 @@ struct clone {
>>>>>   	struct dm_clone_metadata *cmd;
>>>>> +	/*
>>>>> +	 * bio used to flush the destination device, before committing the
>>>>> +	 * metadata.
>>>>> +	 */
>>>>> +	struct bio flush_bio;
>>>>> +
>>>>>   	/* Region hydration hash table */
>>>>>   	struct hash_table_bucket *ht;
>>>>> @@ -1108,10 +1114,13 @@ static bool need_commit_due_to_time(struct clone *clone)
>>>>>   /*
>>>>>    * A non-zero return indicates read-only or fail mode.
>>>>>    */
>>>>> -static int commit_metadata(struct clone *clone)
>>>>> +static int commit_metadata(struct clone *clone, bool *dest_dev_flushed)
>>>>>   {
>>>>>   	int r = 0;
>>>>> +	if (dest_dev_flushed)
>>>>> +		*dest_dev_flushed = false;
>>>>> +
>>>>>   	mutex_lock(&clone->commit_lock);
>>>>>   	if (!dm_clone_changed_this_transaction(clone->cmd))
>>>>> @@ -1128,6 +1137,19 @@ static int commit_metadata(struct clone *clone)
>>>>>   		goto out;
>>>>>   	}
>>>>> +	bio_reset(&clone->flush_bio);
>>>>> +	bio_set_dev(&clone->flush_bio, clone->dest_dev->bdev);
>>>>> +	clone->flush_bio.bi_opf = REQ_OP_WRITE | REQ_PREFLUSH;
>>>>> +
>>>>> +	r = submit_bio_wait(&clone->flush_bio);
>>>>> +	if (unlikely(r)) {
>>>>> +		__metadata_operation_failed(clone, "flush destination device", r);
>>>>> +		goto out;
>>>>> +	}
>>>>> +
>>>>> +	if (dest_dev_flushed)
>>>>> +		*dest_dev_flushed = true;
>>>>> +
>>>>>   	r = dm_clone_metadata_commit(clone->cmd);
>>>>>   	if (unlikely(r)) {
>>>>>   		__metadata_operation_failed(clone, "dm_clone_metadata_commit", r);
>>>>> @@ -1199,6 +1221,7 @@ static void process_deferred_bios(struct clone *clone)
>>>>>   static void process_deferred_flush_bios(struct clone *clone)
>>>>>   {
>>>>>   	struct bio *bio;
>>>>> +	bool dest_dev_flushed;
>>>>>   	struct bio_list bios = BIO_EMPTY_LIST;
>>>>>   	struct bio_list bio_completions = BIO_EMPTY_LIST;
>>>>> @@ -1218,7 +1241,7 @@ static void process_deferred_flush_bios(struct clone *clone)
>>>>>   	    !(dm_clone_changed_this_transaction(clone->cmd) && need_commit_due_to_time(clone)))
>>>>>   		return;
>>>>> -	if (commit_metadata(clone)) {
>>>>> +	if (commit_metadata(clone, &dest_dev_flushed)) {
>>>>>   		bio_list_merge(&bios, &bio_completions);
>>>>>   		while ((bio = bio_list_pop(&bios)))
>>>>> @@ -1232,8 +1255,17 @@ static void process_deferred_flush_bios(struct clone *clone)
>>>>>   	while ((bio = bio_list_pop(&bio_completions)))
>>>>>   		bio_endio(bio);
>>>>> -	while ((bio = bio_list_pop(&bios)))
>>>>> -		generic_make_request(bio);
>>>>> +	while ((bio = bio_list_pop(&bios))) {
>>>>> +		if ((bio->bi_opf & REQ_PREFLUSH) && dest_dev_flushed) {
>>>>> +			/* We just flushed the destination device as part of
>>>>> +			 * the metadata commit, so there is no reason to send
>>>>> +			 * another flush.
>>>>> +			 */
>>>>> +			bio_endio(bio);
>>>>> +		} else {
>>>>> +			generic_make_request(bio);
>>>>> +		}
>>>>> +	}
>>>>>   }
>>>>>   static void do_worker(struct work_struct *work)
>>>>> @@ -1405,7 +1437,7 @@ static void clone_status(struct dm_target *ti, status_type_t type,
>>>>>   		/* Commit to ensure statistics aren't out-of-date */
>>>>>   		if (!(status_flags & DM_STATUS_NOFLUSH_FLAG) && !dm_suspended(ti))
>>>>> -			(void) commit_metadata(clone);
>>>>> +			(void) commit_metadata(clone, NULL);
>>>>>   		r = dm_clone_get_free_metadata_block_count(clone->cmd, &nr_free_metadata_blocks);
>>>>> @@ -1839,6 +1871,7 @@ static int clone_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>>>>>   	bio_list_init(&clone->deferred_flush_completions);
>>>>>   	clone->hydration_offset = 0;
>>>>>   	atomic_set(&clone->hydrations_in_flight, 0);
>>>>> +	bio_init(&clone->flush_bio, NULL, 0);
>>>>>   	clone->wq = alloc_workqueue("dm-" DM_MSG_PREFIX, WQ_MEM_RECLAIM, 0);
>>>>>   	if (!clone->wq) {
>>>>> @@ -1912,6 +1945,7 @@ static void clone_dtr(struct dm_target *ti)
>>>>>   	struct clone *clone = ti->private;
>>>>>   	mutex_destroy(&clone->commit_lock);
>>>>> +	bio_uninit(&clone->flush_bio);
>>>>>   	for (i = 0; i < clone->nr_ctr_args; i++)
>>>>>   		kfree(clone->ctr_args[i]);
>>>>> @@ -1966,7 +2000,7 @@ static void clone_postsuspend(struct dm_target *ti)
>>>>>   	wait_event(clone->hydration_stopped, !atomic_read(&clone->hydrations_in_flight));
>>>>>   	flush_workqueue(clone->wq);
>>>>> -	(void) commit_metadata(clone);
>>>>> +	(void) commit_metadata(clone, NULL);
>>>>>   }
>>>>>   static void clone_resume(struct dm_target *ti)
>>>>> -- 
>>>>> 2.11.0
>>>>>
>>>>
>>>>
>>>> Like the dm-thin patch I replied to, would rather avoid open-coding
>>>> blkdev_issue_flush (also I check !bio_has_data), here is incremental:
>>>
>>> Sorry for the noise relative to !bio_has_data check.. we don't need it.
>>> DM core will split flush from data (see dec_pending()'s  REQ_PREFLUSH
>>> check).
>>>
>>
>> It's OK. I know this, that's why I didn't put the !bio_has_data check in
>> the first place.
>>
>>> I'm dropping the extra !bio_has_data() checks from the incrementals I
>>> did; will review again and push out to linux-next.. still have time to
>>> change if you fundamentally disagree with using blkdev_issue_flush()
>>>
>>
>> For dm-clone, I didn't use blkdev_issue_flush() to avoid allocating and
>> freeing a new bio every time we commit the metadata. I haven't measured
>> the allocation/freeing overhead and probably it won't be huge, but still
>> I would like to avoid it, if you don't mind.
> 
> That's fine, I've restored your code.
>   
>> For dm-thin, indeed, there is not much to gain by not using
>> blkdev_issue_flush(), since we still allocate a new bio, indirectly, in
>> the stack.
> 
> But thinp obviously could if there is actual benefit to avoiding this
> flush bio allocation, via blkdev_issue_flush, every commit.
> 

Yes, we could do the flush in thinp exactly the same way we do it in
dm-clone. Add a struct bio field in struct pool_c and use that in the
callback.

It would work since the callback is called holding a write lock on
pmd->root_lock, so it's executed only by a single thread at a time.

I didn't go for it in my implementation, because I didn't like having to
make that assumption in the callback, i.e., that it's executed under a
lock and so it's safe to have the bio in struct pool_c.

In hindsight, maybe this was a bad call, since it's technically feasible
to do it this way and we could just add a comment stating that the
callback is executed atomically.

If you want I can send a new follow-on patch tomorrow implementing the
flush in thinp the same way it's implemented in dm-clone.

Nikos

> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

