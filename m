Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id AE289115406
	for <lists+dm-devel@lfdr.de>; Fri,  6 Dec 2019 16:14:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575645286;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i5YupUHSlyY0hWSdtED5ceWn1BhPVM1Q6sPGxieNPgk=;
	b=ZubXqqr8y7YspQMk12XDdRNky1/Mz43Z7BJJZewQqiYWwpliBZ2ko9fR3wfoikNbNmvAnz
	jVfDx/38ziYNteefaj8UheNlpKf8rbqMVtJABJHWZLnxAxE1I6trI1L6x9qli1HOy+xsym
	qVgujUq548T7vZfsx63DiQ06P4g3yHo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-193-duQ_zKq-P8OyFsJjpyS7OA-1; Fri, 06 Dec 2019 10:14:44 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E9A3DB20;
	Fri,  6 Dec 2019 15:14:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0BD81CB;
	Fri,  6 Dec 2019 15:14:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23AD718034EA;
	Fri,  6 Dec 2019 15:14:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6FEILg020042 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 10:14:18 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7AAFF2063203; Fri,  6 Dec 2019 15:14:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 760622026D69
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 15:14:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1D2198001FC
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 15:14:16 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-290-aiM_L9ISPxmf2jrDy4VWQg-1; Fri, 06 Dec 2019 10:14:14 -0500
Received: by mail-lj1-f193.google.com with SMTP id z17so7967748ljk.13
	for <dm-devel@redhat.com>; Fri, 06 Dec 2019 07:14:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tBvkWIKIwp5ewy4A+/ckiBdxYSx3YRiAr+gmZSCZ6EI=;
	b=Wit9tvekWV4btDvZKsOumYYNMTknOJ/h7kkTw1G0eGvDjJ2RDNoH+PGpqpkK+209m+
	pdqKFN096InRJh8aYu8Z8eV6uoLBOkjjCTqRSKCHdt3PHe580k2ZnSxyeT1o8A4VTM5j
	0sLBlolWeGae+iYlZtuFrsp/S3EN3IlbchH+iv0CIyk9kVgU593SvbXKnpnOh+ScB5Y2
	CHvTTiRAYa5XVooED4p3/rxaiDVOPbHPz6etoAiKRrvwsyrv9TZ65cLv9aZMTNUKVhHB
	819gx2xUxnukUCNn9RjZOJqCskrrK/CZu4/O1NKWriwu9VvzY5NxGHYODuvjRg1CnCri
	xLkA==
X-Gm-Message-State: APjAAAVJbV0yq0bdLIxyQIacb1DXBcIYleXzq7d3F7muajmtO34cNwOh
	n5dbIiOcwLcl2INL6Jx7f0YH3A==
X-Google-Smtp-Source: APXvYqzVFst/T4LqWP4Rr2IhMFL7HFRBZEvfdEcZWieiTsSnULfhPS4rQ60Vr5CaeoG55SEhJOEYeA==
X-Received: by 2002:a2e:93c9:: with SMTP id p9mr2624787ljh.136.1575645252828; 
	Fri, 06 Dec 2019 07:14:12 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id m15sm7037459ljg.4.2019.12.06.07.14.11
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Dec 2019 07:14:12 -0800 (PST)
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
	<a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
	<alpine.LRH.2.11.1912052227130.11561@mx.ewheeler.net>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <d5000bac-208b-a9d3-1990-4517d72b2965@arrikto.com>
Date: Fri, 6 Dec 2019 17:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912052227130.11561@mx.ewheeler.net>
Content-Language: en-US
X-MC-Unique: aiM_L9ISPxmf2jrDy4VWQg-1
X-MC-Unique: duQ_zKq-P8OyFsJjpyS7OA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/6/19 12:34 AM, Eric Wheeler wrote:
> On Thu, 5 Dec 2019, Nikos Tsironis wrote:
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
>>
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
> Interesting, I'll remember that. I think this is a documentation bug, isn't this backwards:
> 	'This means that it might not be safe to toggle the setting from
> 	"write back" to "write through", since that will also eliminate
> 	cache flushes issued by the kernel.'
> 	[https://www.kernel.org/doc/Documentation/block/queue-sysfs.rst]
> 
> 

If a device has a volatile cache then the write_cache sysfs entry will
be "write back" and we have to issue flushes to the device. In all other
cases write_cache will be "write through".

It's not safe to toggle write_cache from "write back" to "write through"
because this stops the kernel from sending flushes to the device, but
the device will continue caching the writes. So, in case something goes
wrong, you might lose your writes or end up with some kind of
corruption.

> How does this work with stacking blockdevs?  Does it inherit from the
> lower-level dev? If an upper-level is misconfigured, would a writeback at
> higher levels would clear the flush for lower levels?
> 

As Mike already mentioned in another reply to this thread, the device
capabilities are stacked up when each device is created and are
inherited from component devices.

The logic for device stacking is implemented in various functions in
block/blk-settings.c (blk_set_stacking_limits(), blk_stack_limits(),
etc.), which are used also by DM core in dm-table.c to set the
capabilities of DM devices.

If an upper layer device reports a "write back" cache then flushes will
be issued to it by the kernel, no matter what the capabilities of the
underlying devices are.

Normally an upper layer device would report a "write back" cache if at
least one underlying device supports flushes. But, some DM devices
report a "write back" cache irrespective of the underlying devices,
e.g., dm-thin, dm-clone, dm-cache. This is required so they can flush
their own metadata. They then pass the flush request down to the
underlying device and rely on block core to do the right thing. Either
actually send the flush to the device, if it has a volatile cache, or
complete it immediately.

Nikos

> --
> Eric Wheeler
> 
> 
> 
>> Nikos
>>
>>> Mike
>>>
>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

