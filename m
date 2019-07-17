Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A536BE77
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jul 2019 16:43:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 818D581DE3;
	Wed, 17 Jul 2019 14:43:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A762E60A35;
	Wed, 17 Jul 2019 14:43:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ECC284EBC8;
	Wed, 17 Jul 2019 14:43:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6HEfu5X003112 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jul 2019 10:41:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C108F19C70; Wed, 17 Jul 2019 14:41:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from o.ww.redhat.com (ovpn-117-178.ams2.redhat.com [10.36.117.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8855319C4F;
	Wed, 17 Jul 2019 14:41:50 +0000 (UTC)
To: Nikos Tsironis <ntsironis@arrikto.com>, snitzer@redhat.com, agk@redhat.com,
	dm-devel@redhat.com
References: <20190709141522.29606-1-ntsironis@arrikto.com>
	<20190709141522.29606-2-ntsironis@arrikto.com>
	<a6d47841-fcbc-50b2-724c-082be9e764d1@redhat.com>
	<e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
From: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <92afa0f6-90ac-7a3f-8d8a-78fa446fec73@redhat.com>
Date: Wed, 17 Jul 2019 16:41:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <e2b23d5c-0ef2-400b-9697-3fb7899ce3e2@arrikto.com>
Content-Language: en-MW
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: vkoukis@arrikto.com, iliastsi@arrikto.com
Subject: Re: [dm-devel] [RFC PATCH 1/1] dm: add clone target
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 17 Jul 2019 14:43:18 +0000 (UTC)

Hi Nikos,

thanks for elaborating on those details.

Hash table collisions, exception store entry commit overhead,
SSD cache flush issues etc. are all valid points relative to performance
and work set footprints in general.

Do you have any performance numbers for your solution vs.
a snapshot one showing the approach is actually superior in
in real configurations?

I'm asking this particularly in the context of your remark

"A write to a not yet hydrated region will be delayed until the 
corresponding
region has been hydrated and the hydration of the region starts 
immediately."

which'll cause a potentially large working set of delayed writes unless 
those
cover the whole eventually larger than 4K region.
How does your 'clone' target perform on such heavy write situations?

In general, performance and storage footprint test results based on the 
same set
of read/write tests including heavy loads with region size variations 
run on 'clone'
and 'snapshot' would help your point.

Heinz

On 7/10/19 8:45 PM, Nikos Tsironis wrote:
> On 7/10/19 12:28 AM, Heinz Mauelshagen wrote:
>> Hi Nikos,
>>
>> what is the crucial factor your target offers vs. resynchronizing such a
>> latency distinct
>> 2-legged mirror with a read-write snapshot (local, fast exception store)
>> on top, tearing the
>> mirror down keeping the local leg once fully in sync and merging the
>> snapshot back into it?
>>
>> Heinz
>>
> Hi Heinz,
>
> The most significant benefits of dm-clone over the solution you propose
> is significantly better performance, no need for extra COW space, no
> need to merge back a snapshot, and the ability to skip syncing the
> unused space of a file system.
>
> 1. In order to ensure snapshot consistency, dm-snapshot needs to
>     commit a completed exception, before signaling the completion of the
>     write that triggered it to upper layers.
>
>     The persistent exception store commits exceptions every time a
>     metadata area is filled or when there are no more exceptions
>     in-flight. For a 4K chunk size we have 256 exceptions per metadata
>     area, so the best case scenario is one commit per 256 writes. Here I
>     assume a write with size equal to the chunk size of dm-snapshot,
>     e.g., 4K, so there is no COW overhead, and that we write to new
>     chunks, so we need to allocate new exceptions.
>
>     Part of committing the metadata is flushing the cache of the
>     underlying device, if there is one. We have seen SSDs which can
>     sustain hundreds of thousands of random write IOPS, but they take up
>     to 8ms to flush their cache. In such a case, flushing the SSD cache
>     every few writes significantly degrades performance.
>
>     Moreover, dm-snapshot forces exceptions to complete in the order they
>     were allocated, to avoid snapshot space leak on crash (commit
>     230c83afdd9cd). This inserts further latency in exception completions
>     and thus user write completions.
>
>     On the other hand, when cloning a device we don't need to be so
>     strict and can rely on committing the metadata every time a FLUSH or
>     FUA bio is written, or periodically, like dm-thin and dm-cache do.
>
>     dm-clone does exactly that. When a region/chunk is cloned or
>     over-written by a write, we just set a bit in the relevant in-core
>     bitmap. The metadata are committed once every second or when we
>     receive a FLUSH or FUA bio.
>
>     This improves performance significantly and results in increased IOPS
>     and reduced latency, especially in cases where flushing the disk
>     cache is very expensive.
>
> 2. For large devices, e.g. multi terabyte disks, resynchronizing the
>     local leg can take a lot of time. If the application running over the
>     local device is write-heavy, dm-snapshot will end up allocating a
>     large number of exceptions. This increases the number of hash table
>     collisions and thus increases the time we need to do a hash table
>     lookup.
>
>     dm-snapshot needs to look up the exception hash tables in order to
>     service an I/O, so this increases latency and degrades performance.
>
>     On the other hand, dm-clone is just testing a bit to see if a region
>     is cloned or not and decides what to do based on that test.
>
> 3. With dm-clone there is no need to reserve extra COW space for
>     temporarily storing the written data, while the clone device is
>     syncing. Nor would one need to worry about monitoring and expanding
>     the COW device to prevent it from filling up.
>
> 4. With dm-clone there is no need to merge back potentially several
>     gigabytes once cloning/syncing completes. We also avoid the relevant
>     performance degradation incurred by the merging process. Writes just
>     go directly to the clone device.
>
> 5. dm-clone implements support for discards, so it can skip
>     cloning/syncing the relevant regions. In the case of a large block
>     device which contains a filesystem with empty space, e.g. a 2TB
>     device containing 500GB of useful data in a filesystem, this can
>     significantly reduce the time needed to sync/clone.
>
> This was a rather long email, but I hope it makes the significant
> benefits of dm-clone over using dm-snapshot, and our rationale behind
> the decision to implement a new target clearer.
>
> I would be more than happy to continue the conversation and focus on any
> other questions you may have.
>
> Thanks,
> Nikos

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
