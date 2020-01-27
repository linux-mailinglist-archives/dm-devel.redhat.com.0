Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 81C9514B0DD
	for <lists+dm-devel@lfdr.de>; Tue, 28 Jan 2020 09:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580200252;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZJNPCf8X1149dhz2la+sU9FDjFkaI2P8nPvdSyS4Zmo=;
	b=hqr3NENoh2pkgsFhgjb2dnMRjaI5T+uMXbmY5oO8Jn/Z6m1nB30/4U2IkRQ8cDM9NsJXdB
	Jo4mlal8pMwh3J0QwbtE2o68HN5gMgnsQHy4iM8O9boBfvLbNv9UY8eaGE/lGVe0DFao+U
	yudepWx9g3MlnOG6l68WgvkC7TBHFgc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-1l2zraLqPNWCoztWixsaow-1; Tue, 28 Jan 2020 03:30:50 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC25D800D53;
	Tue, 28 Jan 2020 08:30:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD6068703B;
	Tue, 28 Jan 2020 08:30:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9EF468579B;
	Tue, 28 Jan 2020 08:30:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00RA9a4Y019193 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jan 2020 05:09:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 937362166B2B; Mon, 27 Jan 2020 10:09:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FBFD2166B29
	for <dm-devel@redhat.com>; Mon, 27 Jan 2020 10:09:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D89185A79C
	for <dm-devel@redhat.com>; Mon, 27 Jan 2020 10:09:34 +0000 (UTC)
Received: from relay.sw.ru (relay.sw.ru [185.231.240.75]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-40-ApU7y5KfO92sOCPrMEOlsA-1;
	Mon, 27 Jan 2020 05:09:31 -0500
Received: from dhcp-172-16-24-104.sw.ru ([172.16.24.104])
	by relay.sw.ru with esmtp (Exim 4.92.3)
	(envelope-from <ktkhai@virtuozzo.com>)
	id 1iw1KG-0000ID-Aj; Mon, 27 Jan 2020 13:09:00 +0300
To: Bob Liu <bob.liu@oracle.com>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, martin.petersen@oracle.com,
	axboe@kernel.dk, agk@redhat.com, snitzer@redhat.com,
	dm-devel@redhat.com, song@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, Chaitanya.Kulkarni@wdc.com,
	darrick.wong@oracle.com, ming.lei@redhat.com, osandov@fb.com,
	jthumshirn@suse.de, minwoo.im.dev@gmail.com, damien.lemoal@wdc.com,
	andrea.parri@amarulasolutions.com, hare@suse.com, tj@kernel.org,
	ajay.joshi@wdc.com, sagi@grimberg.me, dsterba@suse.com,
	bvanassche@acm.org, dhowells@redhat.com, asml.silence@gmail.com
References: <157968992539.174869.7490844754165043549.stgit@localhost.localdomain>
	<157969068296.174869.13461609442947913096.stgit@localhost.localdomain>
	<8b77117b-1cc0-a379-2cdf-554a8060206c@oracle.com>
From: Kirill Tkhai <ktkhai@virtuozzo.com>
Message-ID: <b0e1cd11-da05-3a84-9c64-14375f61515d@virtuozzo.com>
Date: Mon, 27 Jan 2020 13:08:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <8b77117b-1cc0-a379-2cdf-554a8060206c@oracle.com>
Content-Language: en-US
X-MC-Unique: ApU7y5KfO92sOCPrMEOlsA-1
X-MC-Unique: 1l2zraLqPNWCoztWixsaow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00RA9a4Y019193
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Jan 2020 03:30:17 -0500
Subject: Re: [dm-devel] [PATCH v5 2/6] block: Pass op_flags into
 blk_queue_get_max_sectors()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 25.01.2020 05:37, Bob Liu wrote:
> On 1/22/20 6:58 PM, Kirill Tkhai wrote:
>> This preparation patch changes argument type, and now
>> the function takes full op_flags instead of just op code.
>>
>> Signed-off-by: Kirill Tkhai <ktkhai@virtuozzo.com>
>> ---
>>  block/blk-core.c       |    4 ++--
>>  include/linux/blkdev.h |    8 +++++---
>>  2 files changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/block/blk-core.c b/block/blk-core.c
>> index 50a5de025d5e..ac2634bcda1f 100644
>> --- a/block/blk-core.c
>> +++ b/block/blk-core.c
>> @@ -1250,10 +1250,10 @@ EXPORT_SYMBOL(submit_bio);
>>  static int blk_cloned_rq_check_limits(struct request_queue *q,
>>  				      struct request *rq)
>>  {
>> -	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, req_op(rq))) {
>> +	if (blk_rq_sectors(rq) > blk_queue_get_max_sectors(q, rq->cmd_flags)) {
>>  		printk(KERN_ERR "%s: over max size limit. (%u > %u)\n",
>>  			__func__, blk_rq_sectors(rq),
>> -			blk_queue_get_max_sectors(q, req_op(rq)));
>> +			blk_queue_get_max_sectors(q, rq->cmd_flags));
>>  		return -EIO;
>>  	}
>>  
>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>> index 0f1127d0b043..23a5850f35f6 100644
>> --- a/include/linux/blkdev.h
>> +++ b/include/linux/blkdev.h
>> @@ -989,8 +989,10 @@ static inline struct bio_vec req_bvec(struct request *rq)
>>  }
>>  
>>  static inline unsigned int blk_queue_get_max_sectors(struct request_queue *q,
>> -						     int op)
>> +						     unsigned int op_flags)
>>  {
>> +	int op = op_flags & REQ_OP_MASK;
>> +
> 
> Nitpick. int op = req_op(rq);
> 
> Anyway, looks good to me.
> Reviewed-by: Bob Liu <bob.liu@oracle.com>

Thanks, Bob. I'll merge this nitpick and your "Reviewed-by" at next resend.
It will be after merge window is closed, and new patches are welcomed.

>>  	if (unlikely(op == REQ_OP_DISCARD || op == REQ_OP_SECURE_ERASE))
>>  		return min(q->limits.max_discard_sectors,
>>  			   UINT_MAX >> SECTOR_SHIFT);
>> @@ -1029,10 +1031,10 @@ static inline unsigned int blk_rq_get_max_sectors(struct request *rq,
>>  	if (!q->limits.chunk_sectors ||
>>  	    req_op(rq) == REQ_OP_DISCARD ||
>>  	    req_op(rq) == REQ_OP_SECURE_ERASE)
>> -		return blk_queue_get_max_sectors(q, req_op(rq));
>> +		return blk_queue_get_max_sectors(q, rq->cmd_flags);
>>  
>>  	return min(blk_max_size_offset(q, offset),
>> -			blk_queue_get_max_sectors(q, req_op(rq)));
>> +			blk_queue_get_max_sectors(q, rq->cmd_flags));
>>  }
>>  
>>  static inline unsigned int blk_rq_count_bios(struct request *rq)
>>
>>
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

