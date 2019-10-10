Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F791D2899
	for <lists+dm-devel@lfdr.de>; Thu, 10 Oct 2019 14:01:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4BF2E19D369;
	Thu, 10 Oct 2019 12:01:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5433C5C1B5;
	Thu, 10 Oct 2019 12:01:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5A73E1800B74;
	Thu, 10 Oct 2019 12:01:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9ABwfg6013710 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Oct 2019 07:58:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A10F15D6A5; Thu, 10 Oct 2019 11:58:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C3255D6B2
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 11:58:39 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5455A8666C
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 11:58:38 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n14so7508504wrw.9
	for <dm-devel@redhat.com>; Thu, 10 Oct 2019 04:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Vw4ZemhMEHzNiJRH5ehF24YIERgLowdKx3PNQ2qhS0k=;
	b=KusmTnO9RQDgsfjppAZkO6eg9nhEeumolpkI6NhHatwDkuDLZpISgalCfkbxCbkoa2
	h27c1bAP49DuxdRZ3iGS5et3uDFbm+0+cXaPqmxa8vEeZyPbbcKrA4hT6uDCmHoBnmuP
	+BglNxm2mQqNI0hERN8DSu0jyIAiY5FucBMrlJqjPyRKsTDUPJNvOLYQu8WFdWp4nina
	b2+NEN2/hNKaowGAXMe8Ybgez2vRcpi4R90lAl4rsySDo5RBsGG74WIlHj9FqDhe/3NJ
	n8gN11cZ02u8NqgOYjDmsWtwssjfDNpiv+K7ih0Lm08tzpOp+aop2m9VJnNlEEvpy3tJ
	8BKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Vw4ZemhMEHzNiJRH5ehF24YIERgLowdKx3PNQ2qhS0k=;
	b=ONfQvO7iUny6QnKP/BOe7XfQ2xqSkLbB7LDeMArRxkmkwuumATLMzqNUXkoBo36flQ
	W8Mkoq+bMcZb5sKeQOqP3qLAkehBfgpx88uVLwM99tuc0FXu3n0y5O/p0D1XQfOKn0YM
	AxxChWRxXsI6ApwAdMP6+JHvtUOPt5LwJCjcq/68iV4MecWTI3cMGlt1Any2pDMurTiM
	DGpnDDuymRTPsMi6fWy5ZhU09UIsdqWX+H0E+FtmMCRB6bQWcVbD574kStHZ7lGehh1N
	drMwXvwULyOwGnZhIImD10IQBQXQfcItyrdtZOOW2GF8LPcda48aWTL74Z3YRh0MatdQ
	42Wg==
X-Gm-Message-State: APjAAAWwoYv5y16D03VW/LlBIjq2sov/A8VlBbpKzDqUtdxBeNvyjPXy
	1CTcROxaD3l18xndO+4fiDRETw==
X-Google-Smtp-Source: APXvYqyo+Ybd7o1CxR/ifvy2alW1Y2wgNlYxBZF1kEkEEFtdj4XW7yCtITDaX8Q7GUMFlGNtuZ8HTg==
X-Received: by 2002:a5d:6408:: with SMTP id z8mr8005101wru.108.1570708717059; 
	Thu, 10 Oct 2019 04:58:37 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	h63sm8984581wmf.15.2019.10.10.04.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 Oct 2019 04:58:36 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
	<d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
	<20191009160446.GA2284@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <eaf08505-40a1-0419-ad28-5504ab9ab355@arrikto.com>
Date: Thu, 10 Oct 2019 14:58:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009160446.GA2284@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 10 Oct 2019 11:58:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]);
	Thu, 10 Oct 2019 11:58:38 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.26
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, iliastsi@arrikto.com, agk@redhat.com,
	Guruswamy Basavaiah <guru2018@gmail.com>
Subject: Re: [dm-devel] Fix "dm kcopyd: Fix bug causing workqueue stalls"
 causes dead lock
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Thu, 10 Oct 2019 12:01:50 +0000 (UTC)

On 10/9/19 7:04 PM, Mike Snitzer wrote:
> On Wed, Oct 09 2019 at 11:44am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>
>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
>>>>> Hello Nikos,
>>>>>  Yes, issue is consistently reproducible with us, in a particular
>>>>> set-up and test case.
>>>>>  I will get the access to set-up next week, will try to test and let
>>>>> you know the results before end of next week.
>>>>>
>>>>
>>>> That sounds great!
>>>>
>>>> Thanks a lot,
>>>> Nikos
>>>
>>> Hi Guru,
>>>
>>> Any chance you could try this fix that I've staged to send to Linus?
>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
>>>
>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
>>> out this deadlock?
>>>
>>
>> Hi Mike,
>>
>> Yes,
>>
>> I created a 50G LV and took a snapshot of the same size:
>>
>>   lvcreate -n data-lv -L50G testvg
>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
>>
>> Then I ran the following fio job:
>>
>> [global]
>> randrepeat=1
>> ioengine=libaio
>> bs=1M
>> size=6G
>> offset_increment=6G
>> numjobs=8
>> direct=1
>> iodepth=32
>> group_reporting
>> filename=/dev/testvg/data-lv
>>
>> [test]
>> rw=write
>> timeout=180
>>
>> , concurrently with the following script:
>>
>> lvcreate -n dummy-lv -L1G testvg
>>
>> while true
>> do
>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
>>  lvremove -f testvg/dummy-snap
>> done
>>
>> This reproduced the deadlock for me. I also ran 'echo 30 >
>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
>> timeout.
>>
>> Nikos.
> 
> Very nice, well done.  Curious if you've tested with the fix I've staged
> (see above)?  If so, does it resolve the deadlock?  If you've had
> success I'd be happy to update the tags in the commit header to include
> your Tested-by before sending it to Linus.  Also, any review of the
> patch that you can do would be appreciated and with your formal
> Reviewed-by reply would be welcomed and folded in too.
> 

Yes, I have tested the staged fix. I forgot to mention it in my previous
mail.

I ran the test for the default 'snapshot_cow_threshold' value of 2048
and I also ran it for a value of 1, to stress it a little more.

In both cases everything went fine, the deadlock was gone.

Nikos

> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
