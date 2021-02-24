Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7B5BA323799
	for <lists+dm-devel@lfdr.de>; Wed, 24 Feb 2021 07:59:13 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-Wq0qY9I6P1O7AfyMSWz7mQ-1; Wed, 24 Feb 2021 01:59:09 -0500
X-MC-Unique: Wq0qY9I6P1O7AfyMSWz7mQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1690835E21;
	Wed, 24 Feb 2021 06:59:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D587E669EB;
	Wed, 24 Feb 2021 06:59:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1E6418095CD;
	Wed, 24 Feb 2021 06:58:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11O1h5vF000654 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 23 Feb 2021 20:43:06 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 20526200BFD0; Wed, 24 Feb 2021 01:43:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A86B2166B2F
	for <dm-devel@redhat.com>; Wed, 24 Feb 2021 01:43:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB2A285A59D
	for <dm-devel@redhat.com>; Wed, 24 Feb 2021 01:43:02 +0000 (UTC)
Received: from out30-43.freemail.mail.aliyun.com
	(out30-43.freemail.mail.aliyun.com [115.124.30.43]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-162-p5XNQ6OCONu902HbRqtKDQ-1;
	Tue, 23 Feb 2021 20:42:59 -0500
X-MC-Unique: p5XNQ6OCONu902HbRqtKDQ-1
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R131e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=9; SR=0;
	TI=SMTPD_---0UPP9wNK_1614130975
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0UPP9wNK_1614130975) by smtp.aliyun-inc.com(127.0.0.1);
	Wed, 24 Feb 2021 09:42:55 +0800
To: Mikulas Patocka <mpatocka@redhat.com>
References: <20210208085243.82367-1-jefflexu@linux.alibaba.com>
	<20210208085243.82367-10-jefflexu@linux.alibaba.com>
	<alpine.LRH.2.02.2102190907560.10545@file01.intranet.prod.int.rdu2.redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <83c2ec7a-d000-d9cc-d54a-5e69c35c5eb9@linux.alibaba.com>
Date: Wed, 24 Feb 2021 09:42:55 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
	Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2102190907560.10545@file01.intranet.prod.int.rdu2.redhat.com>
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
X-Mailman-Approved-At: Wed, 24 Feb 2021 01:58:50 -0500
Cc: axboe@kernel.dk, snitzer@redhat.com, caspar@linux.alibaba.com, hch@lst.de,
	linux-block@vger.kernel.org, joseph.qi@linux.alibaba.com,
	dm-devel@redhat.com, io-uring@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 09/11] dm: support IO polling for
 bio-based dm device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2/19/21 10:17 PM, Mikulas Patocka wrote:
> 
> 
> On Mon, 8 Feb 2021, Jeffle Xu wrote:
> 
>> diff --git a/drivers/md/dm.c b/drivers/md/dm.c
>> index c2945c90745e..8423f1347bb8 100644
>> --- a/drivers/md/dm.c
>> +++ b/drivers/md/dm.c
>> @@ -1657,6 +1657,68 @@ static blk_qc_t dm_submit_bio(struct bio *bio)
>>  	return BLK_QC_T_NONE;
>>  }
>>  
>> +static int dm_poll_one_md(struct mapped_device *md);
>> +
>> +static int dm_poll_one_dev(struct dm_target *ti, struct dm_dev *dev,
>> +				sector_t start, sector_t len, void *data)
>> +{
>> +	int i, *count = data;
>> +	struct request_queue *q = bdev_get_queue(dev->bdev);
>> +	struct blk_mq_hw_ctx *hctx;
>> +
>> +	if (queue_is_mq(q)) {
>> +		if (!percpu_ref_tryget(&q->q_usage_counter))
>> +			return 0;
>> +
>> +		queue_for_each_poll_hw_ctx(q, hctx, i)
>> +			*count += blk_mq_poll_hctx(q, hctx);
>> +
>> +		percpu_ref_put(&q->q_usage_counter);
>> +	} else
>> +		*count += dm_poll_one_md(dev->bdev->bd_disk->private_data);
> 
> This is fragile, because in the future there may be other bio-based 
> drivers that support polling. You should check that "q" is really a device 
> mapper device before calling dm_poll_one_md on it.
> 

Sorry I missed this reply. Your advice matters, thanks.

-- 
Thanks,
Jeffle

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

