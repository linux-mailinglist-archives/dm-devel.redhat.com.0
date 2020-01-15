Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 29BDA13D6B3
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jan 2020 10:21:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579166517;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=poDw5gZVya/UH3/Y+KrZpqLSr3oTTlYRLMsFFZs60qo=;
	b=a6vTvsG7DKWZFflrmPMGUa0YfozaDFTlBwVyVIv4qt+21zYy74dLsszgMkgTy2auiRxjco
	5QuGOfaNTUwhd5WceFlQPut1tdI+cFI0o78Of8f6RMXv6TX4I3O2irPu9xMJIWNlMWe6kl
	ZObrXHeFXXzlPw+UhrsmsTWYa+H25Ss=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-bXBbIYeNM22n9hEvcwGXXQ-1; Thu, 16 Jan 2020 04:21:55 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7186318FE860;
	Thu, 16 Jan 2020 09:21:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE78F19C5B;
	Thu, 16 Jan 2020 09:21:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7145718089CD;
	Thu, 16 Jan 2020 09:21:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00FJmKa4029533 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 15 Jan 2020 14:48:20 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8A14E10B0728; Wed, 15 Jan 2020 19:48:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83CA710B072B
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 19:48:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 954B918AE953
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 19:48:18 +0000 (UTC)
Received: from gateway33.websitewelcome.com (gateway33.websitewelcome.com
	[192.185.146.78]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-22-pHGJ-HhYOfajN_uG-dpRCQ-1; Wed, 15 Jan 2020 14:48:16 -0500
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
	by gateway33.websitewelcome.com (Postfix) with ESMTP id C55F120CC93
	for <dm-devel@redhat.com>; Wed, 15 Jan 2020 13:48:13 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id roeDiDbqwHiO0roeDiBORe; Wed, 15 Jan 2020 13:48:13 -0600
X-Authority-Reason: nr=8
Received: from [196.157.145.80] (port=9794 helo=[192.168.100.109])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1iroeC-001RBU-O3; Wed, 15 Jan 2020 12:48:13 -0700
To: Mikulas Patocka <mpatocka@redhat.com>
References: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
	<d76f7245-034c-f225-00fe-f33c5e9abf1a@petasan.org>
	<alpine.LRH.2.02.2001021144450.18253@file01.intranet.prod.int.rdu2.redhat.com>
	<a858b409-d3d5-b439-5f15-563fb5316d2a@petasan.org>
	<alpine.LRH.2.02.2001140943090.15105@file01.intranet.prod.int.rdu2.redhat.com>
From: Maged Mokhtar <mmokhtar@petasan.org>
Message-ID: <62f81779-5a8a-6bf3-be31-5ecd9e9e8a72@petasan.org>
Date: Wed, 15 Jan 2020 21:48:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.02.2001140943090.15105@file01.intranet.prod.int.rdu2.redhat.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.145.80
X-Source-L: No
X-Exim-ID: 1iroeC-001RBU-O3
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.109]) [196.157.145.80]:9794
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 2
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: pHGJ-HhYOfajN_uG-dpRCQ-1
X-MC-Unique: bXBbIYeNM22n9hEvcwGXXQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 16 Jan 2020 04:21:22 -0500
Cc: dm-devel@redhat.com, Mike Snitzer <msnitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm writecache: SB remove seq_count
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit



On 14/01/2020 16:50, Mikulas Patocka wrote:
> 
> 
> On Mon, 13 Jan 2020, Maged Mokhtar wrote:
> 
>>
>>
>>> Hi
>>>
>>>
>>> On Thu, 2 Jan 2020, Maged Mokhtar wrote:
>>>
>>>> Any feedback on this patch please.
>>>
>>> This will definitely not work for persistent memory - it could corrupt
>>> data if a crash happens. The CPU can flush data in arbitrary order and it
>>> may happen that the seq count is flushed before the pertaining data.
>>>
>>> As for SSD mode - we could avoid updating the refcount in the superblock,
>>> but it wouldn't be much helpful.
>>>
>>> I.e. normally, commit is done this way:
>>> 1. submit data writes
>>> 2. submit metadata writes
>>> 3. flush disk cache
>>> 4. submit the write of superblock with increased seq_count
>>> 5. flush disk cache
>>>
>>> If we wanted to avoid writing the seq_count, we would need to change it
>>> to:
>>> 1. submit data writes
>>> 2. flush disk cache
>>> 3. submit metadata writes
>>> 4. flush disk cache
>>>
>>> - i.e. it sill needs two disk cache flushes per one commit request - and
>>> it is not much better than the existing solution.
>>>
>>> Mikulas
>>>
>>
>>
>> Hi Mikulas,
>>
>> I appreciate your review. For SSD mode, I see the advantages of SB writes for
>> handling crash recovery and agree with what you say. Note however that after a
>> crash a proper client should not assume the data is valid on a device, only at
>> the point it last issued a successful flush should the data be consistent,
> 
> Yes.
> 
>> after this it should not assume so. A filesystem/db should handle
>> journals/transaction at a higher level than the device. But again anything we
>> can do on the device/target to make things more consistent, the better, so i
>> agree there.
>>
>> There is also limit to what the current crash recovery code can do, as i
>> understand it if you have metadata already committed, their seq count is not
>> incremented for new io on the same blocks, the crash recovery code will
>> therefore not detect or recover cases where new data is written to existing 4k
>> blocks at the time of crash, some blocks will end up with new data, others
>> will not. Again this is my understanding so i could be wrong.
> 
> If the userspace writes some block, it is unspecified if the block will
> contain old data or new data after a crash. (the SCSI standard at some
> point even specified that the written block may contain arbitrary data -
> not just old or new).
> 
>> I think if crash consistency needs to be enhanced, it should take into account
>> that most consumer/non-enterprise SSDs do not offer power loss protection. For
> 
> Both SATA and SCSI standard have command that flushes the cache in the
> disk or SSD. If the SSD ignores this command, it is broken.
> 
>> many such devices power loss can corrupt data that is already written as they
>> commit data in larger chunks via a read/modify/erase/write cycle. It is
>> particularly bad for metadata as it could affect many data blocks. Maybe it
>> could be good to have metadata writes via transactions or journaling, dm-cache
>> and thin provisioning do something like this i think.
> 
> Both dm-cache and dm-writecache use the flush command to write the device
> cache.
> 
>> i also think your suggestion of:
>>> If we wanted to avoid writing the seq_count, we would need to change it
>>> to:
>>> 1. submit data writes
>>> 2. flush disk cache
>>> 3. submit metadata writes
>>> 4. flush disk cache
>>
>> could be better in terms of prolonging SSD lifetime, as currently the
>> superblock gets much higher write frequency.
> 
> The SSDs allocate new blocks with each write, so it doesn't matter that we
> write the same block multiple times. With real persistent memory, it may
> be an issue.
> 
>> /Maged
> 
> Mikulas
> 

Hi Mikulas,

If writing the superblock still does not provide full consistency for 
data written during a crash, then maybe is it really worth doing ?

On the other hand, i was suggesting there we would be a more robust 
metadata crash recovery, something along the lines of metadata 
transactions via dm-transaction-manager or some journaling of metadata, 
like your own implementation in dm-integrity. I was referring to 
consumer grade SSDs that may be subject of data corruption during power 
loss, this is not the same as not having flush support, maybe having 
more robust metadata writing will benefit these devices.

 > The SSDs allocate new blocks with each write, ..
Yes, but if the device does not have free blocks and/or the writer does 
not issue trim/discard i presume it will write on same block.

/Maged

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

