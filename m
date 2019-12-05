Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 2374B11439A
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 16:32:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575559952;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=THyuNjYVoAYdHGW6kpnf7Ux/eB4JRvY4pvMfmQT2Xqs=;
	b=LjhrRvgg3aEXML+S+3KwVBj99WgaYBCVHtmRTGmLoIKo4fpIX9wOq9qTkwqhmOdYC0eesZ
	b83z3EOnALuSwe1m0JPFu6OsHDLfH1xcj0VbS3NG9IiooQn6Y+LXYoKS165X3Hz2cFRcjQ
	HfUL+CRCFWezoIs50LL01ZTe89j12wA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-sHFmunc7P5m1qSoR5FANeA-1; Thu, 05 Dec 2019 10:32:30 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A418B107ACE3;
	Thu,  5 Dec 2019 15:32:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E19F19C7F;
	Thu,  5 Dec 2019 15:32:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6314165D1E;
	Thu,  5 Dec 2019 15:32:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5FVlrT022020 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 10:31:47 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1F8FB20316E9; Thu,  5 Dec 2019 15:31:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 19CB620316E8
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 15:31:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBF7780209B
	for <dm-devel@redhat.com>; Thu,  5 Dec 2019 15:31:44 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-139-F7i4r_2LMteYss-yVvhV3w-1; Thu, 05 Dec 2019 10:31:43 -0500
Received: by mail-lf1-f68.google.com with SMTP id 9so2792228lfq.10
	for <dm-devel@redhat.com>; Thu, 05 Dec 2019 07:31:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Oyd1ORglGXNbhTMd80tH7HzxkogRFj9vCkSyrSedPIs=;
	b=eX2CHxHi0PmBKAX7csSrsDtaEm+fjVc/HToVFIyEoJaN9uoutQA2v+ZQjXQA+72nuN
	NNxBeLawwkPMrbWcgqTKfQ2Ro1/exDHLZco6nxaY5gQJIIEY/CMmkUV8BO/foSp2jXoZ
	8VhnTQCdxS6cdE/tCJJk5Tc0Fj2YmHUpWUONdDXHreX+vZjIDH/jmaU6O/g1YdwTEKle
	3NP+K8lIwAmqg3J6CdC0CrDExXofTA4ZdtVdbdn/WP/YjpXSo/txzLcWLDHOk0kN1xwf
	cjEBC1LohYufmTEMImkyCZaGBC8h7xO+yoUsi8Zi1cJsmPzYVzXJRamI/qMhHuqEnfjR
	Wt8Q==
X-Gm-Message-State: APjAAAV5ca2QzHVIH5Vi1HspqqOzCpth7N9UBu0uBxDzgAFfGWtf498y
	Blw0v5df3cmPin/yLaeODHWwYvCN2Jc=
X-Google-Smtp-Source: APXvYqxfsvt/nKq+hO+a9sdl/k7OAypeVHbx5g5UydG6ZflvYghVxfbRWa8dU9Lkiza0EekIoCd2aA==
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr5530540lfp.96.1575559901351;
	Thu, 05 Dec 2019 07:31:41 -0800 (PST)
Received: from [10.94.250.133] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id 22sm5863635ljw.9.2019.12.05.07.31.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 05 Dec 2019 07:31:40 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>,
	Eric Wheeler <dm-devel@lists.ewheeler.net>
References: <20191204140742.26273-1-ntsironis@arrikto.com>
	<alpine.LRH.2.11.1912041907490.11561@mx.ewheeler.net>
	<20191204201710.GA31432@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <a60f1571-fff1-8be8-5537-f604747b39c9@arrikto.com>
Date: Thu, 5 Dec 2019 17:31:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191204201710.GA31432@redhat.com>
Content-Language: en-US
X-MC-Unique: F7i4r_2LMteYss-yVvhV3w-1
X-MC-Unique: sHFmunc7P5m1qSoR5FANeA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, thornber@redhat.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

On 12/4/19 10:17 PM, Mike Snitzer wrote:
> On Wed, Dec 04 2019 at  2:58pm -0500,
> Eric Wheeler <dm-devel@lists.ewheeler.net> wrote:
> 
>> On Wed, 4 Dec 2019, Nikos Tsironis wrote:
>>
>>> The thin provisioning target maintains per thin device mappings that map
>>> virtual blocks to data blocks in the data device.
>>>
>>> When we write to a shared block, in case of internal snapshots, or
>>> provision a new block, in case of external snapshots, we copy the shared
>>> block to a new data block (COW), update the mapping for the relevant
>>> virtual block and then issue the write to the new data block.
>>>
>>> Suppose the data device has a volatile write-back cache and the
>>> following sequence of events occur:
>>
>> For those with NV caches, can the data disk flush be optional (maybe as a
>> table flag)?
> 
> IIRC block core should avoid issuing the flush if not needed.  I'll have
> a closer look to verify as much.
> 

For devices without a volatile write-back cache block core strips off
the REQ_PREFLUSH and REQ_FUA bits from requests with a payload and
completes empty REQ_PREFLUSH requests before entering the driver.

This happens in generic_make_request_checks():

		/*
		 * Filter flush bio's early so that make_request based
		 * drivers without flush support don't have to worry
		 * about them.
		 */
		if (op_is_flush(bio->bi_opf) &&
		    !test_bit(QUEUE_FLAG_WC, &q->queue_flags)) {
		        bio->bi_opf &= ~(REQ_PREFLUSH | REQ_FUA);
		        if (!nr_sectors) {
		                status = BLK_STS_OK;
		                goto end_io;
		        }
		}

If I am not mistaken, it all depends on whether the underlying device
reports the existence of a write back cache or not.

You could check this by looking at /sys/block/<device>/queue/write_cache
If it says "write back" then flushes will be issued.

In case the sysfs entry reports a "write back" cache for a device with a
non-volatile write cache, I think you can change the kernel's view of
the device by writing to this entry (you could also create a udev rule
for this).

This way you can set the write cache as write through. This will
eliminate the cache flushes issued by the kernel, without altering the
device state (Documentation/block/queue-sysfs.rst).

Nikos

> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

