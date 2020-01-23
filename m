Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6A514712E
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jan 2020 19:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579805586;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8uiSOyeTxQnb/Tegk7OiJUoRWmYha29aiR36c2k3r+g=;
	b=iibFFnWALz09mLht+wj8Sb+JfwLrjz71sUnm1//lSaPWcLBcc6BQdVReXMlnvAPGdHGxk4
	4GWXcAU9+VrIYf+YOgYWpnXCBY0UIsm1tWnsmNAti6V9J0qxXZDNW/0B+pjNVWXc/vZNZx
	aC6lVeQs+hGr+mgx0dzZLB7bivfqqlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-LqQrh2szNE2uDbjhMZi2ig-1; Thu, 23 Jan 2020 13:53:03 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59F871902EA1;
	Thu, 23 Jan 2020 18:52:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9BE515DA89;
	Thu, 23 Jan 2020 18:52:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BE2F61803C32;
	Thu, 23 Jan 2020 18:52:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00NIqYI9025418 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 23 Jan 2020 13:52:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 330F82166B32; Thu, 23 Jan 2020 18:52:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F35F2166B30
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 18:52:32 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D593A802E77
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 18:52:31 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-231-XDfexCfwP-qt7JEZLm_eUg-1; Thu, 23 Jan 2020 13:52:29 -0500
Received: by mail-pf1-f194.google.com with SMTP id z16so1961453pfk.0
	for <dm-devel@redhat.com>; Thu, 23 Jan 2020 10:52:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/HIgWTybk6CC3JVz4nmT3PGzBcRGE/1gMLzKZ2iu2jY=;
	b=qTGWF13HqHgT0w7CIP+cUieT1x4gSLK+Nqb10p4V5eNpMEMn5kaptzeOkrBvADVaaz
	1QVH+4ukUnKBenZ4XYNMoXLYsUlN9bIqBq5GtN/ayHzNQTgvMVVOJY7aFIY8D31I4OvL
	1ZIZAWOpzgQUcCULJXoHpLINXmVerNLAiaboVMg0TBfyj7j3YDQWqK2lTcn2/ltcaDRj
	HlzMQh50Rsnh/BZWSSsNJSZFxiLRQ9k/vRnySGbbbOigGjt7qATzwgoa1uqcYG/CS30A
	lgMF1pphCmM20a3py+GTknbpZ9X0OWnYFMJAG47Ns7iAUWtvreKceSjGT7d1s5hMyYo5
	qAGg==
X-Gm-Message-State: APjAAAUoA/ebGb3OclrCeRJIbqdRnR8F4Zo3Xf/saQGv+OE96GP9IXnA
	YaMe0y+oGRNdnWyOuYKsXJHz7w==
X-Google-Smtp-Source: APXvYqwb0Dm759onHzJsHI0qaChii+UBFR/+cfwTXWHY+akNML1O7gnTFlmahTk/bilyqtYvVscuCQ==
X-Received: by 2002:aa7:9729:: with SMTP id k9mr8705251pfg.72.1579805548644;
	Thu, 23 Jan 2020 10:52:28 -0800 (PST)
Received: from ?IPv6:2600:380:4562:fb25:b980:6664:b71f:35b5?
	([2600:380:4562:fb25:b980:6664:b71f:35b5])
	by smtp.gmail.com with ESMTPSA id
	q25sm3396820pfg.41.2020.01.23.10.52.27
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Thu, 23 Jan 2020 10:52:28 -0800 (PST)
To: Mike Snitzer <snitzer@redhat.com>,
	Stefan Bader <stefan.bader@canonical.com>
References: <20200123091713.12623-1-stefan.bader@canonical.com>
	<20200123091713.12623-2-stefan.bader@canonical.com>
	<20200123103541.GA28102@redhat.com> <20200123172816.GA31063@redhat.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <81055166-37fb-ad65-6a53-11c22c626ab1@kernel.dk>
Date: Thu, 23 Jan 2020 11:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200123172816.GA31063@redhat.com>
Content-Language: en-US
X-MC-Unique: XDfexCfwP-qt7JEZLm_eUg-1
X-MC-Unique: LqQrh2szNE2uDbjhMZi2ig-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, Tyler Hicks <tyler.hicks@canonical.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Alasdair Kergon <agk@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1/23/20 10:28 AM, Mike Snitzer wrote:
> On Thu, Jan 23 2020 at  5:35am -0500,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
>> On Thu, Jan 23 2020 at  4:17am -0500,
>> Stefan Bader <stefan.bader@canonical.com> wrote:
>>
>>> When device-mapper adapted for multi-queue functionality, they
>>> also re-organized the way the make-request function was set.
>>> Before, this happened when the device-mapper logical device was
>>> created. Now it is done once the mapping table gets loaded the
>>> first time (this also decides whether the block device is request
>>> or bio based).
>>>
>>> However in generic_make_request(), the request function gets used
>>> without further checks and this happens if one tries to mount such
>>> a partially set up device.
>>>
>>> This can easily be reproduced with the following steps:
>>>  - dmsetup create -n test
>>>  - mount /dev/dm-<#> /mnt
>>>
>>> This maybe is something which also should be fixed up in device-
>>> mapper.
>>
>> I'll look closer at other options.
>>
>>> But given there is already a check for an unset queue
>>> pointer and potentially there could be other drivers which do or
>>> might do the same, it sounds like a good move to add another check
>>> to generic_make_request_checks() and to bail out if the request
>>> function has not been set, yet.
>>>
>>> BugLink: https://bugs.launchpad.net/bugs/1860231
>>
>> >From that bug;
>> "The currently proposed fix introduces no chance of stability
>> regressions. There is a chance of a very small performance regression
>> since an additional pointer comparison is performed on each block layer
>> request but this is unlikely to be noticeable."
>>
>> This captures my immediate concern: slowing down everyone for this DM
>> edge-case isn't desirable.
> 
> SO I had a look and there isn't anything easier than adding the proposed
> NULL check in generic_make_request_checks().  Given the many
> conditionals in that  function.. what's one more? ;)
> 
> I looked at marking the queue frozen to prevent IO via
> blk_queue_enter()'s existing cheeck -- but that quickly felt like an
> abuse, especially in that there isn't a queue unfreeze for bio-based.
> 
> Jens, I'll defer to you to judge this patch further.  If you're OK with
> it: cool.  If not, I'm open to suggestions for how to proceed.  
> 

It does kinda suck... The generic_make_request_checks() is a mess, and
this doesn't make it any better. Any reason why we can't solve this
two step setup in a clean fashion instead of patching around it like
this? Feels like a pretty bad hack, tbh.

-- 
Jens Axboe

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

