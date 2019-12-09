Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 41610116EE6
	for <lists+dm-devel@lfdr.de>; Mon,  9 Dec 2019 15:25:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575901551;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gP1yj9Go7ivoiXkons+Z8HIyXAIX1pvOk8n4reJDUKQ=;
	b=dMSFy/pLg6rur0BQgO8xeooonPwCgHsXBvNuaB4iLUBimbkucNMVs2anZEFhwjpFvJoIdx
	FechpQh+Qr6qcv29k2U7PsatKJh0mF7vJF61pn1GNsLOE5UNJvTlN361R2laPkDx6kBv6+
	julNGsxemVuXL9tyJjxlZ/tYd3/TNPA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-NPTulDT-O_aDFgaQR5RcMw-1; Mon, 09 Dec 2019 09:25:49 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B644107ACC5;
	Mon,  9 Dec 2019 14:25:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 578C55C219;
	Mon,  9 Dec 2019 14:25:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 60ADC83554;
	Mon,  9 Dec 2019 14:25:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB9EPLhY029981 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Dec 2019 09:25:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D13CD2166B27; Mon,  9 Dec 2019 14:25:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCEB62166B29
	for <dm-devel@redhat.com>; Mon,  9 Dec 2019 14:25:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 488CC1011E1E
	for <dm-devel@redhat.com>; Mon,  9 Dec 2019 14:25:19 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-322-ctiWKUOeMxS7UHfhMa8ztg-1; Mon, 09 Dec 2019 09:25:16 -0500
Received: by mail-lf1-f67.google.com with SMTP id v201so10821079lfa.11
	for <dm-devel@redhat.com>; Mon, 09 Dec 2019 06:25:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Py2UqoP3KnmCzV6WGsfJ9wFBNBSyy+4/VoycDCnZ74c=;
	b=BicbN/X/Igwcox6GnJAz5Gbt/4wg2MaBtL6QLvOFcYTEIPFkQyHowIlsx1dFTKZuMS
	kXxIBXojvVWuqU1lbk1FoIpaNx2Sln32JttGTbfABqlfnhkKEU6zUecPN0bWhSPjD1Gi
	oJ9xTE0uEBK6CrpUxMgiTJvEoUzL8/87vXeCcRpP2iQ2Md8mJLG1U1vqOE82MV5q6foF
	v4Hz1oyzf2dLTLSNHHJyooXOCcY6J1ysGu7gXFEV7zIPhbov5/XDPar4B0jRUGCIUQF2
	qjX6AcxHd5rCkBmeFncvQXhXS3Z/cGdg/B1HhdarLQy3htyAKf3lLWShCxFMv4y+YGJ1
	l8kg==
X-Gm-Message-State: APjAAAVN86PLA+HLUZn7alfI9VYiO8Ik9XYMXaRedS/u/oxTPkeRP3fZ
	e7GhA+uWzGXkFOPGhB2ZIloghw==
X-Google-Smtp-Source: APXvYqxQEYk/KUHqWorIKMosv9btKJUP7w8gQxECNt6IYLFEbrQqx4b3NSQmyeKquILr22apCxmXtg==
X-Received: by 2002:a19:4f54:: with SMTP id a20mr15965697lfk.39.1575901514438; 
	Mon, 09 Dec 2019 06:25:14 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	a15sm6891253lfi.60.2019.12.09.06.25.13
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 09 Dec 2019 06:25:13 -0800 (PST)
To: Eric Wheeler <dm-devel@lists.ewheeler.net>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
	<a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
	<alpine.LRH.2.11.1912052227130.11561@mx.ewheeler.net>
	<d5000bac-208b-a9d3-1990-4517d72b2965@arrikto.com>
	<alpine.LRH.2.11.1912061953560.11561@mx.ewheeler.net>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <130e52a1-ba9a-e77b-aedd-87e5985c32bd@arrikto.com>
Date: Mon, 9 Dec 2019 16:25:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.11.1912061953560.11561@mx.ewheeler.net>
Content-Language: en-US
X-MC-Unique: ctiWKUOeMxS7UHfhMa8ztg-1
X-MC-Unique: NPTulDT-O_aDFgaQR5RcMw-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/6/19 10:06 PM, Eric Wheeler wrote:
> On Fri, 6 Dec 2019, Nikos Tsironis wrote:
>> On 12/6/19 12:34 AM, Eric Wheeler wrote:
>>> On Thu, 5 Dec 2019, Nikos Tsironis wrote:
>>>> On 12/4/19 10:17 PM, Mike Snitzer wrote:
>>>>> On Wed, Dec 04 2019 at  2:58pm -0500,
>>>>> Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:
>>>>>
>>>>>> On Wed, 4 Dec 2019, Nikos Tsironis wrote:
>>>>>>
>>>>>>> The thin provisioning target maintains per thin device mappings that
>>>>>>> map
>>>>>>> virtual blocks to data blocks in the data device.
>>>>>>>
>>>>>>> When we write to a shared block, in case of internal snapshots, or
>>>>>>> provision a new block, in case of external snapshots, we copy the
>>>>>>> shared
>>>>>>> block to a new data block (COW), update the mapping for the relevant
>>>>>>> virtual block and then issue the write to the new data block.
>>>>>>>
>>>>>>> Suppose the data device has a volatile write-back cache and the
>>>>>>> following sequence of events occur:
>>>>>>
>>>>>> For those with NV caches, can the data disk flush be optional (maybe
>>>>>> as a
>>>>>> table flag)?
>>>>>
>>>>> IIRC block core should avoid issuing the flush if not needed.  I'll have
>>>>> a closer look to verify as much.
>>>>>
>>>>
>>>> For devices without a volatile write-back cache block core strips off
>>>> the REQ_PREFLUSH and REQ_FUA bits from requests with a payload and
>>>> completes empty REQ_PREFLUSH requests before entering the driver.
>>>>
>>>> This happens in generic_make_request_checks():
>>>>
>>>>    /*
>>>>     * Filter flush bio's early so that make_request based
>>>>     * drivers without flush support don't have to worry
>>>>     * about them.
>>>>     */
>>>>    if (op_is_flush(bio->bi_opf) &&
>>>>        !test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
>>>>            bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
>>>>            if (!nr_sectors) {
>>>>                    status = BLK_STS_OK;
>>>>                    goto end_io;
>>>>            }
>>>>    }
>>>>
>>>> If I am not mistaken, it all depends on whether the underlying device
>>>> reports the existence of a write back cache or not.
>>>>
>>>> You could check this by looking at /sys/block/<device>/queue/write_cache
>>>> If it says "write back" then flushes will be issued.
>>>>
>>>> In case the sysfs entry reports a "write back" cache for a device with a
>>>> non-volatile write cache, I think you can change the kernel's view of
>>>> the device by writing to this entry (you could also create a udev rule
>>>> for this).
>>>>
>>>> This way you can set the write cache as write through. This will
>>>> eliminate the cache flushes issued by the kernel, without altering the
>>>> device state (Documentation/block/queue-sysfs.rst).
>>>
>>> Interesting, I'll remember that. I think this is a documentation bug, isn't
>>> this backwards:
>>>   'This means that it might not be safe to toggle the setting from
>>>   "write back" to "write through", since that will also eliminate
>>>   cache flushes issued by the kernel.'
>>>   [https://www.kernel.org/doc/Documentation/block/queue-sysfs.rst]
>>>
>>>
>>
>> If a device has a volatile cache then the write_cache sysfs entry will
>> be "write back" and we have to issue flushes to the device. In all other
>> cases write_cache will be "write through".
> 
> Forgive my misunderstanding, but if I have a RAID controller with a cache
> and BBU with the RAID volume set to write-back mode in the controller, are
> you saying that the sysfs entry should show "write through"? I had always
> understood that it was safe to disable flushes with a non-volatile cache
> and a non-volatile cache is called a write-back cache.
> 

 From the device perspective, a non-volatile cache operating in
write-back mode is indeed called a write-back cache.

But, from the OS perspective, a non-volatile cache (whether it operates
in write-back or write-through mode), for all intents and purposes, is
equivalent to a write-through cache: when the device acknowledges a
write it's guaranteed that the written data won't be lost in case of
power loss.

So, in the case of a controller with a BBU and/or a non-volatile cache,
you don't care what the device does internally. All that matters is that
acked writes won't be lost in case of power failure.

I believe that the sysfs entry reports exactly that. Whether the kernel
should treat the device as having a volatile write-back cache, so we
have to issue flushes to ensure the data are properly persisted, or as
having no cache or a write-through cache, so flushes are not necessary.

> It is strange to me that this terminology in the kernel would be backwards
> from how it is expressed in a RAID controller. Incidentally, I have an
> Avago MegaRAID 9460 with 2 volumes. The first volume (sda) is in
> write-back mode and the second volume is write-through. In both cases
> sysfs reports "write through":
> 
> [root@hv1-he ~]# cat /sys/block/sda/queue/write_cache
> write through
> [root@hv1-he ~]# cat /sys/block/sdb/queue/write_cache
> write through
> 
> This is running 4.19.75, so we can at least say that the 9460 does not
> support proper representation of the VD cache mode in sysfs, but which is
> correct? Should it not be that the sysfs entry reports the same cache mode
> of the RAID controller?
> 

My guess is that the controller reports to the kernel that it has a
write-through cache (or no cache at all) on purpose, to avoid
unnecessary flushes. Since it can ensure the persistence of acked writes
with other means, e.g., a BBU unit, as far as the kernel is concerned
the device can be treated as one with a write-through cache.

Moreover, I think that MegaRAID controllers, in the default write back
mode, automatically switch the write policy to write-through if the BBU
is low, has failed or is being charged.

So, I think it makes sense to report to the kernel that the device has a
write-through cache, even though internally the device operates the
cache in write-back mode.

Nikos

> -Eric
> 
>>
>> It's not safe to toggle write_cache from "write back" to "write through"
>> because this stops the kernel from sending flushes to the device, but
>> the device will continue caching the writes. So, in case something goes
>> wrong, you might lose your writes or end up with some kind of
>> corruption.
>>
>>> How does this work with stacking blockdevs?  Does it inherit from the
>>> lower-level dev? If an upper-level is misconfigured, would a writeback at
>>> higher levels would clear the flush for lower levels?
>>>
>>
>> As Mike already mentioned in another reply to this thread, the device
>> capabilities are stacked up when each device is created and are
>> inherited from component devices.
>>
>> The logic for device stacking is implemented in various functions in
>> block/blk-settings.c (blk_set_stacking_limits(), blk_stack_limits(),
>> etc.), which are used also by DM core in dm-table.c to set the
>> capabilities of DM devices.
>>
>> If an upper layer device reports a "write back" cache then flushes will
>> be issued to it by the kernel, no matter what the capabilities of the
>> underlying devices are.
>>
>> Normally an upper layer device would report a "write back" cache if at
>> least one underlying device supports flushes. But, some DM devices
>> report a "write back" cache irrespective of the underlying devices,
>> e.g., dm-thin, dm-clone, dm-cache. This is required so they can flush
>> their own metadata. They then pass the flush request down to the
>> underlying device and rely on block core to do the right thing. Either
>> actually send the flush to the device, if it has a volatile cache, or
>> complete it immediately.
>>
>> Nikos
>>
>>> --
>>> Eric Wheeler
>>>
>>>
>>>
>>>> Nikos
>>>>
>>>>> Mike
>>>>>
>>>>
>>
>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

