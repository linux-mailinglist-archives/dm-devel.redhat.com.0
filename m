Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 0A297260B0F
	for <lists+dm-devel@lfdr.de>; Tue,  8 Sep 2020 08:39:52 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-x7pG-mMONfeGJDgdJSvFmQ-1; Tue, 08 Sep 2020 02:39:47 -0400
X-MC-Unique: x7pG-mMONfeGJDgdJSvFmQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30FD1801FDC;
	Tue,  8 Sep 2020 06:39:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE1A41002D52;
	Tue,  8 Sep 2020 06:39:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 01E6918199CD;
	Tue,  8 Sep 2020 06:39:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0877eDQH010008 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 7 Sep 2020 03:40:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36C7133225; Mon,  7 Sep 2020 07:40:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3134033250
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 07:40:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D4CBA185A78B
	for <dm-devel@redhat.com>; Mon,  7 Sep 2020 07:40:10 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-33-HoDKpV3RPZOlno6SL8sWyg-1; Mon, 07 Sep 2020 03:40:07 -0400
X-MC-Unique: HoDKpV3RPZOlno6SL8sWyg-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 49C84B6DC479BDDA8B6A;
	Mon,  7 Sep 2020 15:39:59 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.253) by DGGEMS411-HUB.china.huawei.com
	(10.3.19.211) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 7 Sep 2020 15:39:54 +0800
To: Coly Li <colyli@suse.de>
References: <20200821020345.3358-1-thunder.leizhen@huawei.com>
	<b4643e74-aad9-385f-01f2-f8e48ba4dbef@suse.de>
	<ad100923-e479-faf0-f749-ac8e4cf87899@huawei.com>
	<8aa638b7-6cfd-bf3d-8015-fbe59f28f31f@suse.de>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <c2f8cf50-d9f7-df19-40eb-0543e6208c0d@huawei.com>
Date: Mon, 7 Sep 2020 15:39:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8aa638b7-6cfd-bf3d-8015-fbe59f28f31f@suse.de>
X-Originating-IP: [10.174.177.253]
X-CFilter-Loop: Reflected
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
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 08 Sep 2020 02:37:34 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi, Jens Axboe, Alasdair Kergon, Mike Snitzer:
  What's your opinion?


On 2020/8/21 15:05, Coly Li wrote:
> On 2020/8/21 14:48, Leizhen (ThunderTown) wrote:
>>
>>
>> On 8/21/2020 12:11 PM, Coly Li wrote:
>>> On 2020/8/21 10:03, Zhen Lei wrote:
>>>> There are too many PAGE_SECTORS definitions, and all of them are the
>>>> same. It looks a bit of a mess. So why not move it into <linux/blkdev.h>,
>>>> to achieve a basic and unique definition.
>>>>
>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>
>>>
>>> A lazy question about page size > 4KB: currently in bcache code the
>>> sector size is assumed to be 512 sectors, if kernel page > 4KB, it is
>>> possible that PAGE_SECTORS in bcache will be a number > 8 ?
>>
>> Sorry, I don't fully understand your question. I known that the sector size
>> can be 512 or 4K, and the PAGE_SIZE can be 4K or 64K. So even if sector size
>> is 4K, isn't it greater than 8 for 64K pages?
>>
>> I'm not sure if the question you're asking is the one Matthew Wilcox has
>> answered before:
>> https://www.spinics.net/lists/raid/msg64345.html
> 
> Thank you for the above information. Currently bcache code assumes
> sector size is always 512 bytes, you may see how many "<< 9" or ">> 9"
> are used. Therefore I doubt whether current code may stably work on e.g.
> 4Kn SSDs (this is only doubt because I don't have such SSD).
> 
> Anyway your patch is fine to me. This change to bcache doesn't make
> thins worse or better, maybe it can be helpful to trigger my above
> suspicious early if people do have this kind of problem on 4Kn sector SSDs.
> 
> For the bcache part of this patch, you may add,
> Acked-by: Coly Li <colyli@suse.de>
> 
> Thanks.
> 
> Coly Li
> 
>>>> ---
>>>>  drivers/block/brd.c           | 1 -
>>>>  drivers/block/null_blk_main.c | 1 -
>>>>  drivers/md/bcache/util.h      | 2 --
>>>>  include/linux/blkdev.h        | 5 +++--
>>>>  include/linux/device-mapper.h | 1 -
>>>>  5 files changed, 3 insertions(+), 7 deletions(-)
>>>>
>>>
>>> [snipped]
>>>
>>>> diff --git a/drivers/md/bcache/util.h b/drivers/md/bcache/util.h
>>>> index c029f7443190805..55196e0f37c32c6 100644
>>>> --- a/drivers/md/bcache/util.h
>>>> +++ b/drivers/md/bcache/util.h
>>>> @@ -15,8 +15,6 @@
>>>>  
>>>>  #include "closure.h"
>>>>  
>>>> -#define PAGE_SECTORS		(PAGE_SIZE / 512)
>>>> -
>>>>  struct closure;
>>>>  
>>>>  #ifdef CONFIG_BCACHE_DEBUG
>>>> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
>>>> index bb5636cc17b91a7..b068dfc5f2ef0ab 100644
>>>> --- a/include/linux/blkdev.h
>>>> +++ b/include/linux/blkdev.h
>>>> @@ -949,11 +949,12 @@ static inline struct request_queue *bdev_get_queue(struct block_device *bdev)
>>>>   * multiple of 512 bytes. Hence these two constants.
>>>>   */
>>>>  #ifndef SECTOR_SHIFT
>>>> -#define SECTOR_SHIFT 9
>>>> +#define SECTOR_SHIFT		9
>>>>  #endif
>>>>  #ifndef SECTOR_SIZE
>>>> -#define SECTOR_SIZE (1 << SECTOR_SHIFT)
>>>> +#define SECTOR_SIZE		(1 << SECTOR_SHIFT)
>>>>  #endif
>>>> +#define PAGE_SECTORS		(PAGE_SIZE / SECTOR_SIZE)
>>>>  
>>>>  /*
>>>>   * blk_rq_pos()			: the current sector
>>> [snipped]
>>>
>>>
>>
> 
> 
> .
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

