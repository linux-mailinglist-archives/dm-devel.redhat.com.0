Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F14686AAA3
	for <lists+dm-devel@lfdr.de>; Tue, 16 Jul 2019 16:33:23 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53A34C06511A;
	Tue, 16 Jul 2019 14:33:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E42260BEE;
	Tue, 16 Jul 2019 14:33:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D17FD1800202;
	Tue, 16 Jul 2019 14:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6GEX9bo009655 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jul 2019 10:33:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C89775E7A5; Tue, 16 Jul 2019 14:33:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C373D5DAAC
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 14:33:07 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 257898553F
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 14:33:06 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id n9so21281882wru.0
	for <dm-devel@redhat.com>; Tue, 16 Jul 2019 07:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=cbpJVy9l7kCvrjN4mBQCf0NWRguHWlP40dzbe/G758w=;
	b=obRQyHeswAOuaRqpY+ThO/hwL0ieukbAlMQzvWnb7fauQyg/PlOaOYnH73xVIuuEl+
	ukhXjONECO5EdKjM6lJohLpcvg4aKam1Rbjur2zkKwQAjarrwkMxG1iIV3iF8yKSecxR
	eigFsQAmuoP28LXRBCbEYVDeNxylLc5d3pA3QotKjWh2DoRZJJUzElE6AQQmDsj2emjg
	D7MtR/jUyBfAG2ERstTU9HgA0kYjGCgYmVlysTKlT2RIrFZJzvl41n2RTZX/NUA94vqy
	+pzEMWkN4Rg9ruL+MvNF6LjzZ43gooNmN20ss5CVV4JOyKjrn2T7C332YZ5MBb/Ox/IY
	z9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cbpJVy9l7kCvrjN4mBQCf0NWRguHWlP40dzbe/G758w=;
	b=HlA1N9+tLZAbsgQt5mWDeweaTiqFOuIpCu6McMlleLFpfdk/Wi6cOYvOVQel4KpcTh
	KAUfyM/SS+iy4fQnqkXMBf7mqfG3jkhFDs1APsocIYdHSzZbss28b7sSm2hPzHasdR1x
	DZtshhc3v2pXcoz0NBLFOLpSwQX7oqpU1/eja1GUoP7gDiLh++hCByloJ0qGPW+84Zrp
	GC1ar+YYFWfotbdweeKMm72Ffw0V2TF5mqIxfSQmfviVP1EOVxLnlPberJR6T7UBFt37
	KNzVewc+UHrYCJdfri0AGZVTt7gFhmqnoTi0jpcTqS/INya/SNhCF9KxSOUexrRJES+9
	/Snw==
X-Gm-Message-State: APjAAAWcAGR9k1ttvkg8WrnB08NSYdlYP3NBBbzcKxBSp4/fvBDUR7GY
	FjvcmWDnM09GD/7gGWiv/IQLRBcX+kE=
X-Google-Smtp-Source: APXvYqy7ehQzVpP6fgAF/1w7dPtoEwUVRrHzUiHtCfmN383fUwT9IJjsYFSGVNwUfJ90jL5b8XBPZg==
X-Received: by 2002:a5d:5308:: with SMTP id e8mr35747140wrv.219.1563287584753; 
	Tue, 16 Jul 2019 07:33:04 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	x20sm42824369wrg.10.2019.07.16.07.33.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Jul 2019 07:33:04 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
	<b6cdb071-f8d3-7c09-c938-71689ceb1c95@arrikto.com>
	<20190715182221.GB15315@redhat.com>
	<54f185d8-5cf7-b617-1dfe-418da7643004@arrikto.com>
	<20190716141150.GA17023@redhat.com> <20190716141415.GB17023@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <8201d449-d765-8151-6dc2-2176290596b0@arrikto.com>
Date: Tue, 16 Jul 2019 17:33:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190716141415.GB17023@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 16 Jul 2019 14:33:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Tue, 16 Jul 2019 14:33:06 +0000 (UTC) for IP:'209.85.221.46'
	DOMAIN:'mail-wr1-f46.google.com' HELO:'mail-wr1-f46.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: 0  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.46 mail-wr1-f46.google.com 209.85.221.46
	mail-wr1-f46.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com
Subject: Re: [dm-devel] dm kcopyd: Increase sub-job size to 512KiB
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 16 Jul 2019 14:33:22 +0000 (UTC)

On 7/16/19 5:14 PM, Mike Snitzer wrote:
> On Tue, Jul 16 2019 at 10:11am -0400,
> Mike Snitzer <snitzer@redhat.com> wrote:
> 
>> On Tue, Jul 16 2019 at  9:59am -0400,
>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>
>>> On 7/15/19 9:22 PM, Mike Snitzer wrote:
>>>> On Fri, Jul 12 2019 at  9:45am -0400,
>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>
>>>>> Hi Mike,
>>>>>
>>>>> A kind reminder about this patch. Do you require any changes or will you
>>>>> merge it as is?
>>>>
>>>> I think we need changes to expose knob(s) to tune this value on a global
>>>> _and_ device level via sysfs.  E.g.:
>>>>
>>>> 1) dm_mod module param for global
>>>> 2) but also allow a per-device override, like:
>>>>    echo 512 > /sys/block/dm-X/dm/kcopyd_subjob_size
>>>>
>>>
>>> Hi Mike,
>>>
>>> Thanks for your feedback. I agree, this sounds like the best thing to do.
>>>
>>>> 1 is super easy and is a start.  Layering in 2 is a bit more involved.
>>>
>>> Maybe I could help with (2). We could discuss about it and how you think
>>> it's best to do it and then I could proceed with an implementation.
>>>
>>> Please let me know what you think.
>>>
>>>>
>>>> In hindsight (given how risk-averse I am on changing the default) I
>>>> should've kept the default 128 but allowed override with modparam
>>>> dm_mod.kcopyd_subjob_size=1024
>>>>
>>>> Would this be an OK first step?
>>>
>>> Yes, this would be great.
>>>
>>>>
>>>> If so, we're still in the 5.3 merge window, I'll see what I can do.
>>>
>>> Shall I proceed with a patch adding the dm_mod.kcopyd_subjob_size
>>> modparam?
>>
>> Sure.  And it could be that we won't need 2.
>>
>> Ideally the default would work for every setup.  Less knobs the better.
>> But as a stop-gap I think we need to expose a knob that allows override.
>>
>> Thinking further, I don't think changing the default to 512K is too
>> risky (famous last words).  So please just update your original patch to
>> include the modparam so that users can get the old 64K back if needed.
>>
>> BTW, the param name should probably be "kcopyd_subjob_size_kb" to
>> reflect the value is KB.
> 
> One other thing: not sure what the max should be on this
> modparam.. maybe 1024K?

I think 1024K is a reasonable maximum value.

I will add the "kcopyd_subjob_size_kb" modparam and send a second
version of the patch.

Thanks,
Nikos

> 
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
