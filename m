Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 84F68114455
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 17:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575561799;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F66Rryf6dVwvR8/51pQhuMCdbMuDn0UVffCnIbvIldw=;
	b=eOlWCLJ1vW8nte7lL9C9L1FKOm0fa5cyp8djmEnd1TQ1KVJvjeF7VFn50dGBPS7kGuY4Lf
	/G7AzZ5SHjQFf3W2KQ/lgWinrq2oycJIdOpMg3BMZga+n5RijedRYtk+5YI7ZpNxILb+1n
	kCf3vkwTQkmOwhzKWj7PNk3elVD0z34=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-ounJwBC9PKmrHo_GX05tyQ-1; Thu, 05 Dec 2019 11:03:16 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E6515102313A;
	Thu,  5 Dec 2019 16:03:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5AD600D1;
	Thu,  5 Dec 2019 16:03:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7043E65D23;
	Thu,  5 Dec 2019 16:03:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5G2roA023500 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 11:02:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3AE8A215AB19; Thu,  5 Dec 2019 16:02:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3579A215AB20
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 16:02:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13A2C10131C7
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 16:02:51 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-246-b9oqyKczPoSmWt7-rA1lSw-1; Thu, 05 Dec 2019 11:02:49 -0500
Received: by mail-lf1-f65.google.com with SMTP id n12so2902210lfe.3
	for <dm-devel@redhat.com>; Thu, 05 Dec 2019 08:02:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=T0JZuI98ru2gd+7jm8sXvEDwvEjmLO8q4SZFgL+62y4=;
	b=cg8xHqHtHANfJCtm1coT/lRpJYFKkKEwxGE8P9E8JXPu64PldRMpZB59LHJbrP2J0l
	cjypjLJ3ImHss34fEoslWgUSCHGEu4J34/dL6q0D+NzYuyuYHuZhyRTqnrDVPsMY9S6g
	1e3tgQLU8+Wii77qgpgPTrBG62wGiUKZKNgHUwt1sLzlGQJWdbcvmodoexZOGoBbizAJ
	zy1XXncPuq2FK2pyV2RSxU8OZAlW7ZAIylN/HzzmomfqgYjEIQ5RRmph0tWQjLULUfUS
	j95U4mLuNz6pjJqyaSc5HqselxXL8GemDVxydJ1QNwQrvPQxVbSpbNB41kdBVQlkGlE3
	DG2Q==
X-Gm-Message-State: APjAAAVzTmNYbBjlqGS6wcYn4Cz1fxxmAS34Xx/b1qPOpBMcie+R1oLs
	Odzb+lV014dLylm4mAwroTFWFw==
X-Google-Smtp-Source: APXvYqwJKg9Z+P9DoktvCHluwWvCOWPHmWJCRmDFTFiMafxJO3j102S2+dWOp77rVd8HGk16C3MAQQ==
X-Received: by 2002:ac2:43c7:: with SMTP id u7mr5624573lfl.71.1575561766970;
	Thu, 05 Dec 2019 08:02:46 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	n23sm5158677lfa.41.2019.12.05.08.02.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 08:02:46 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
	<a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
	<20191205154221.GA4792@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <56a62880-ce3f-6f94-a18e-3fcd7db6f286@arrikto.com>
Date: Thu, 5 Dec 2019 18:02:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191205154221.GA4792@redhat.com>
Content-Language: en-US
X-MC-Unique: b9oqyKczPoSmWt7-rA1lSw-1
X-MC-Unique: ounJwBC9PKmrHo_GX05tyQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Eric Wheeler <dm-devel@lists.ewheeler.net>, dm-devel@redhat.com,
	thornber@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] dm thin: Flush data device before
 committing metadata to avoid data corruption
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/5/19 5:42 PM, Mike Snitzer wrote:
> On Thu, Dec 05 2019 at 10:31am -0500,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 12/4/19 10:17 PM, Mike Snitzer wrote:
>>> On Wed, Dec 04 2019 at  2:58pm -0500,
>>> Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:
>>>
>>>> On Wed, 4 Dec 2019, Nikos Tsironis wrote:
>>>>
>>>>> The thin provisioning target maintains per thin device mappings that map
>>>>> virtual blocks to data blocks in the data device.
>>>>>
>>>>> When we write to a shared block, in case of internal snapshots, or
>>>>> provision a new block, in case of external snapshots, we copy the shared
>>>>> block to a new data block (COW), update the mapping for the relevant
>>>>> virtual block and then issue the write to the new data block.
>>>>>
>>>>> Suppose the data device has a volatile write-back cache and the
>>>>> following sequence of events occur:
>>>>
>>>> For those with NV caches, can the data disk flush be optional (maybe as a
>>>> table flag)?
>>>
>>> IIRC block core should avoid issuing the flush if not needed.  I'll have
>>> a closer look to verify as much.
>>>
>>
>> For devices without a volatile write-back cache block core strips off
>> the REQ_PREFLUSH and REQ_FUA bits from requests with a payload and
>> completes empty REQ_PREFLUSH requests before entering the driver.
>>
>> This happens in generic_make_request_checks():
>>
>> 		/*
>> 		 * Filter flush bio's early so that make_request based
>> 		 * drivers without flush support don't have to worry
>> 		 * about them.
>> 		 */
>> 		if (op_is_flush(bio->bi_opf) &&
>> 		    !test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
>> 		        bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
>> 		        if (!nr_sectors) {
>> 		                status = BLK_STS_OK;
>> 		                goto end_io;
>> 		        }
>> 		}
>>
>> If I am not mistaken, it all depends on whether the underlying device
>> reports the existence of a write back cache or not.
> 
> Yes, thanks for confirming my memory of the situation.
> 
>> You could check this by looking at /sys/block/<device>/queue/write_cache
>> If it says "write back" then flushes will be issued.
>>
>> In case the sysfs entry reports a "write back" cache for a device with a
>> non-volatile write cache, I think you can change the kernel's view of
>> the device by writing to this entry (you could also create a udev rule
>> for this).
>>
>> This way you can set the write cache as write through. This will
>> eliminate the cache flushes issued by the kernel, without altering the
>> device state (Documentation/block/queue-sysfs.rst).
> 
> Not delved into this aspect of Linux's capabilities but it strikes me as
> "dangerous" to twiddle device capabilities like this.  Best to fix
> driver to properly expose cache (or not, as the case may be).  It should
> also be noted that with DM; the capabilities are stac ked up at device
> creation time.  So any changes to the underlying devices will _not_ be
> reflected to the high level DM device.
> 

Yes, I agree completely. The queue-sysfs doc also mentions that it's not
safe to do that. I just mentioned it for completeness.

As far as DM is concerned, you are right. You would have to deactivate
and reactivate all DM devices for the change to propagate to upper
layers. That's why I mentioned udev, because that way the change will be
made to the lower level device when its queue is first created and it
will be properly propagated to upper layers.

But, again, I agree that this is not something safe to do and it's
better to make sure the driver properly exposes the cache capabilities,
as you said.

Nikos

> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

