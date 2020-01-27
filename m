Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1F04914AAA0
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jan 2020 20:39:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580153970;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Itg9wgn6He1vJmaWvFgKjBEyk1ucExuy5NMuGfFXe3c=;
	b=N52hcFInVg07Z1OmdsHS8EeKjX6+FYRIwK7YeRcm9NYTm7BQrINnon8wLk5/FuWdluEKdY
	ldPV4mojl/5vDG+sz9MmUj7LLnOEdFHQARQC4QMrbCaCVH8hILYAbKRGkdTC+tSF+cMe24
	nzsK6kp5ypm1jDwTA/EAhWTdJVXZVU8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-aRiGnQx0PCW15LgKD_-nSA-1; Mon, 27 Jan 2020 14:39:28 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 78527107ACCA;
	Mon, 27 Jan 2020 19:39:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8434A393B;
	Mon, 27 Jan 2020 19:39:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 07E9685779;
	Mon, 27 Jan 2020 19:39:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00RJdBrH016828 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jan 2020 14:39:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 913D610BE36C; Mon, 27 Jan 2020 19:39:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B9E710BE371
	for <dm-devel@redhat.com>; Mon, 27 Jan 2020 19:39:09 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E9DB805A87
	for <dm-devel@redhat.com>; Mon, 27 Jan 2020 19:39:09 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-11-L6xdFWo-NAO5lcqavF8VEg-1; Mon, 27 Jan 2020 14:39:07 -0500
Received: by mail-pl1-f194.google.com with SMTP id q13so4122236pls.1
	for <dm-devel@redhat.com>; Mon, 27 Jan 2020 11:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=wL2DenFfwzv9tqkfb30dy8DecNCbnJ/iC87Go+JzFAU=;
	b=YYzdRqs8C5oq2kIWSeX/Qfv16zJbWHENp/JWwvUfvPv40rczQftuTd5uwyeJ0zk/wo
	fLtxFodL71Xbcg1rJQpIA+P7nQ8HtC2+v9eBAPRV3q3W31c/e4s469y5NkrCfzqVXE54
	omtQQgo/8/CYtbAJ2yRyiK9REOkbWbGiamupRHWMt/j3Ez8ryeq0eonC1BQmTamjMXjZ
	RfZQKVaR60fc5bfbzz+LT1ZSNOmd5T29dZVrH1ENEOVh32jO/Yr3AVxGvqTAtiTdAqWO
	TSYwTI5i/SnaIaTr8v5k6KcBFItrPdn+rEpRxmV2Hmmviy8R0hScOrHovwEUVxoWjrAM
	kfkg==
X-Gm-Message-State: APjAAAUZTQlscZWOTwNXkTnQSM9C9iE9NKis711/3X4sW9X9UBIuCRk4
	xjcy1oyBmF+YSwhrddanfhL6Fg==
X-Google-Smtp-Source: APXvYqy7lgOUREckJf6S0ITGjHdH0mKxqYkv2EVTbTDR3MuuG718x6vgdL/bpge1IMTdbctl0JI0Gg==
X-Received: by 2002:a17:90a:ead3:: with SMTP id
	ev19mr286376pjb.80.1580153946321; 
	Mon, 27 Jan 2020 11:39:06 -0800 (PST)
Received: from ?IPv6:2620:10d:c081:1133::11c2? ([2620:10d:c090:180::dec1])
	by smtp.gmail.com with ESMTPSA id
	b24sm16548399pfo.55.2020.01.27.11.39.05
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 27 Jan 2020 11:39:05 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com> <20200123172816.GA31063@redhat.com>
	<81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
	<20200127193225.GA5065@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <988c930f-b4ee-6387-e1b4-6bfe7af9bcaf@kernel.dk>
Date: Mon, 27 Jan 2020 12:39:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200127193225.GA5065@redhat.com>
Content-Language: en-US
X-MC-Unique: L6xdFWo-NAO5lcqavF8VEg-1
X-MC-Unique: aRiGnQx0PCW15LgKD_-nSA-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-kernel@vger.kernel.org, Stefan Bader <stefan.bader@canonical.com>,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	Tyler Hicks <tyler.hicks@canonical.com>, Alasdair Kergon <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/1] blk/core: Gracefully handle unset
	make_request_fn
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/27/20 12:32 PM, Mike Snitzer wrote:
> On Thu, Jan 23 2020 at  1:52pm -0500,
> Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 1/23/20 10:28 AM, Mike Snitzer wrote:
>>> On Thu, Jan 23 2020 at  5:35am -0500,
>>> Mike Snitzer <snitzer@redhat.com> wrote:
>>>
>>>> On Thu, Jan 23 2020 at  4:17am -0500,
>>>> Stefan Bader <stefan.bader@canonical.com> wrote:
>>>>
>>>>> When device-mapper adapted for multi-queue functionality, they
>>>>> also re-organized the way the make-request function was set.
>>>>> Before, this happened when the device-mapper logical device was
>>>>> created. Now it is done once the mapping table gets loaded the
>>>>> first time (this also decides whether the block device is request
>>>>> or bio based).
>>>>>
>>>>> However in generic_make_request(), the request function gets used
>>>>> without further checks and this happens if one tries to mount such
>>>>> a partially set up device.
>>>>>
>>>>> This can easily be reproduced with the following steps:
>>>>>  - dmsetup create -n test
>>>>>  - mount /dev/dm-<#> /mnt
>>>>>
>>>>> This maybe is something which also should be fixed up in device-
>>>>> mapper.
>>>>
>>>> I'll look closer at other options.
>>>>
>>>>> But given there is already a check for an unset queue
>>>>> pointer and potentially there could be other drivers which do or
>>>>> might do the same, it sounds like a good move to add another check
>>>>> to generic_make_request_checks() and to bail out if the request
>>>>> function has not been set, yet.
>>>>>
>>>>> BugLink: https://bugs.launchpad.net/bugs/1860231
>>>>
>>>> >From that bug;
>>>> "The currently proposed fix introduces no chance of stability
>>>> regressions. There is a chance of a very small performance regression
>>>> since an additional pointer comparison is performed on each block layer
>>>> request but this is unlikely to be noticeable."
>>>>
>>>> This captures my immediate concern: slowing down everyone for this DM
>>>> edge-case isn't desirable.
>>>
>>> SO I had a look and there isn't anything easier than adding the proposed
>>> NULL check in generic_make_request_checks().  Given the many
>>> conditionals in that  function.. what's one more? ;)
>>>
>>> I looked at marking the queue frozen to prevent IO via
>>> blk_queue_enter()'s existing cheeck -- but that quickly felt like an
>>> abuse, especially in that there isn't a queue unfreeze for bio-based.
>>>
>>> Jens, I'll defer to you to judge this patch further.  If you're OK with
>>> it: cool.  If not, I'm open to suggestions for how to proceed.  
>>>
>>
>> It does kinda suck... The generic_make_request_checks() is a mess, and
>> this doesn't make it any better. Any reason why we can't solve this
>> two step setup in a clean fashion instead of patching around it like
>> this? Feels like a pretty bad hack, tbh.
> 
> I just staged the following DM fix:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.6&id=28a101d6b344f5a38d482a686d18b1205bc92333

I like that a lot more than the NULL check in the core.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

