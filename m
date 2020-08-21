Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E1F324CE74
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 09:06:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-g0zTT4OBN5-5EpjEoKnztQ-1; Fri, 21 Aug 2020 03:06:29 -0400
X-MC-Unique: g0zTT4OBN5-5EpjEoKnztQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DED9981F038;
	Fri, 21 Aug 2020 07:06:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 627507AEC7;
	Fri, 21 Aug 2020 07:06:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4A45D180B656;
	Fri, 21 Aug 2020 07:06:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07L75pco017969 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 03:05:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8DA22F5564; Fri, 21 Aug 2020 07:05:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88D73F51BF
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 07:05:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DDAA101A571
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 07:05:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-498-6Nt4St8eOVyNVPgy9e1myA-1;
	Fri, 21 Aug 2020 03:05:44 -0400
X-MC-Unique: 6Nt4St8eOVyNVPgy9e1myA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 482CFACC6;
	Fri, 21 Aug 2020 07:06:10 +0000 (UTC)
To: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
References: <20200821020345.3358-1-thunder.leizhen@huawei.com>
	<b4643e74-aad9-385f-01f2-f8e48ba4dbef@suse.de>
	<ad100923-e479-faf0-f749-ac8e4cf87899@huawei.com>
From: Coly Li <colyli@suse.de>
Autocrypt: addr=colyli@suse.de; keydata=
	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
Message-ID: <8aa638b7-6cfd-bf3d-8015-fbe59f28f31f@suse.de>
Date: Fri, 21 Aug 2020 15:05:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ad100923-e479-faf0-f749-ac8e4cf87899@huawei.com>
Content-Language: en-US
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Mimecast-Bulk-Signature: yes
X-Mimecast-Spam-Signature: bulk
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07L75pco017969
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>, dm-devel <dm-devel@redhat.com>,
	linux-bcache <linux-bcache@vger.kernel.org>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] block: move the PAGE_SECTORS definition
 into <linux/blkdev.h>
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2020/8/21 14:48, Leizhen (ThunderTown) wrote:
> 
> 
> On 8/21/2020 12:11 PM, Coly Li wrote:
>> On 2020/8/21 10:03, Zhen Lei wrote:
>>> There are too many PAGE_SECTORS definitions, and all of them are the
>>> same. It looks a bit of a mess. So why not move it into <linux/blkdev.h>,
>>> to achieve a basic and unique definition.
>>>
>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>
>>
>> A lazy question about page size > 4KB: currently in bcache code the
>> sector size is assumed to be 512 sectors, if kernel page > 4KB, it is
>> possible that PAGE_SECTORS in bcache will be a number > 8 ?
> 
> Sorry, I don't fully understand your question. I known that the sector size
> can be 512 or 4K, and the PAGE_SIZE can be 4K or 64K. So even if sector size
> is 4K, isn't it greater than 8 for 64K pages?
> 
> I'm not sure if the question you're asking is the one Matthew Wilcox has
> answered before:
> https://www.spinics.net/lists/raid/msg64345.html

Thank you for the above information. Currently bcache code assumes
sector size is always 512 bytes, you may see how many "<< 9" or ">> 9"
are used. Therefore I doubt whether current code may stably work on e.g.
4Kn SSDs (this is only doubt because I don't have such SSD).

Anyway your patch is fine to me. This change to bcache doesn't make
thins worse or better, maybe it can be helpful to trigger my above
suspicious early if people do have this kind of problem on 4Kn sector SSDs.

For the bcache part of this patch, you may add,
Acked-by: Coly Li <colyli@suse.de>

Thanks.

Coly Li

>>> ---
>>>  drivers/block/brd.c           | 1 -
>>>  drivers/block/null_blk_main.c | 1 -
>>>  drivers/md/bcache/util.h      | 2 --
>>>  include/linux/blkdev.h        | 5 +++--
>>>  include/linux/device-mapper.h | 1 -
>>>  5 files changed, 3 insertions(+), 7 deletions(-)
>>>
>>
>> [snipped]
>>
>>> diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
>>> index c029f7443190805..55196e0f37c32c6 100644
>>> --- a/drivers/md/bcache/util.h
>>> +++ b/drivers/md/bcache/util.h
>>> @@ -15,8 +15,6 @@
>>>  
>>>  #include "closure.h"
>>>  
>>> -#define PAGE_SECTORS		(PAGE_SIZE / 512)
>>> -
>>>  struct closure;
>>>  
>>>  #ifdef CONFIG_BCACHE_DEBUG
>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>> index bb5636cc17b91a7..b068dfc5f2ef0ab 100644
>>> --- a/include/linux/blkdev.h
>>> +++ b/include/linux/blkdev.h
>>> @@ -949,11 +949,12 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
>>>   * multiple of 512 bytes. Hence these two constants.
>>>   */
>>>  #ifndef SECTOR_SHIFT
>>> -#define SECTOR_SHIFT 9
>>> +#define SECTOR_SHIFT		9
>>>  #endif
>>>  #ifndef SECTOR_SIZE
>>> -#define SECTOR_SIZE (1 << SECTOR_SHIFT)
>>> +#define SECTOR_SIZE		(1 << SECTOR_SHIFT)
>>>  #endif
>>> +#define PAGE_SECTORS		(PAGE_SIZE / SECTOR_SIZE)
>>>  
>>>  /*
>>>   * blk_rq_pos()			: the current sector
>> [snipped]
>>
>>
> 


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

