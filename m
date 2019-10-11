Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id A0291D3E9B
	for <lists+dm-devel@lfdr.de>; Fri, 11 Oct 2019 13:39:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2759981DF7;
	Fri, 11 Oct 2019 11:39:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10E7C5447A;
	Fri, 11 Oct 2019 11:39:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B81318089C8;
	Fri, 11 Oct 2019 11:39:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9BBd8s9031410 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Oct 2019 07:39:09 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE35A60BF4; Fri, 11 Oct 2019 11:39:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E81BF60BE1
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 11:39:08 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F027154F5A
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 11:39:05 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y19so11555821wrd.3
	for <dm-devel@redhat.com>; Fri, 11 Oct 2019 04:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=5zOb9z5lIZj2TkuueDnAUe2Z7N1mrLDyGtAq1qlx2qM=;
	b=G6/ngLQVOGMDfB4RgYv6UPxsxHpjiKYM3U4bThaTRoxyMho6zrhnBLJXBNupUvpVPH
	cvG6zyaSW3TdfVNEH1MCsVDJx/unTp+m/3bxQ72kr/vW/yj+sZufKNWjvDCmaZDYvpg6
	ROA6J9iMPZ4mn/2gyYM8Ig2sfjETk39Fsa4mJPs+g/PvoaucCsoJXxagVB1cdaYqmqaj
	I6RhEhbBp5iJynEspknVYLZCJD5wFEavI0f+UQHua1KPbzmkiEk3E1HWFAOgIhHhfcyR
	McdVi6qoWJv+xJN+0eaqyEnUgbGJ7ineOXUqAGhsS6j997EQU+ZLdcBdIwAJDJ8qrbSE
	nwRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=5zOb9z5lIZj2TkuueDnAUe2Z7N1mrLDyGtAq1qlx2qM=;
	b=qv1HPDrVzOr/stnCE4sQjOxwzmbCVCU4U6leKmGMIO7fIRjkWtAzBNIsBD57A3Rzgn
	dLKewl6o+aJvLSoFGb5U+RQvaqAMJaE0gE8pvyDmb/TTy1edK8BmStVJ6K8FfoGJL2DU
	1F+rJcpUcw17RqaoC9TAMaPGbabUCtK2mnzLxkdc+vLHSYq091eVci7jqFpV5f3qDpzL
	fzHp1VnEpQSKvw56a/3JeqQFcvk2pyKYXi/0ZofUuqAr6IMykKyruiAFdT9zukScKPlK
	7/75tF2EqHoflsVhN8eMNpKejeOn+5fziLk7Dn8iUzsndWlYMLzr7wVjm7zFB5p0VInV
	VcSA==
X-Gm-Message-State: APjAAAVzJk9GxLZaVBepKDv/qmRAnqdxprflK/or4IXfZkdvKk286voS
	i5ykq94+6vL/jJwG9kRPJ42qIyUV/HM=
X-Google-Smtp-Source: APXvYqzGBv7+dHXaw1h+Bp95SL7xqTcCVl5vOvMVUl35rLwtVoYPx3osNentToaEMikbuadbVIJ3ug==
X-Received: by 2002:a05:6000:1252:: with SMTP id
	j18mr12885525wrx.160.1570793944549; 
	Fri, 11 Oct 2019 04:39:04 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id l7sm9468535wrv.77.2019.10.11.04.39.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 Oct 2019 04:39:03 -0700 (PDT)
To: Guruswamy Basavaiah <guru2018@gmail.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
	<d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
	<20191009160446.GA2284@redhat.com>
	<CAHSpA59T+JCR+_3ZCYShXa6GtQddAcaQE0OP5GWbSEG0qMAQOg@mail.gmail.com>
	<CAHSpA5_miJX74Th-_hinLr_q-sVR2G3M-_aS2c2fJBSr1eDnfg@mail.gmail.com>
	<ecf3c2cc-a0c0-ec34-7a74-8d715f774df9@arrikto.com>
	<CAHSpA5-wbyaNmnOMq+rTbuXh2eJ6y=iVjVR52OvmWLbLnUkTAw@mail.gmail.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <b8246b84-957d-1903-4ab0-3f4b940b779d@arrikto.com>
Date: Fri, 11 Oct 2019 14:39:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHSpA5-wbyaNmnOMq+rTbuXh2eJ6y=iVjVR52OvmWLbLnUkTAw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 11 Oct 2019 11:39:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Fri, 11 Oct 2019 11:39:06 +0000 (UTC) for IP:'209.85.221.68'
	DOMAIN:'mail-wr1-f68.google.com' HELO:'mail-wr1-f68.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.68 mail-wr1-f68.google.com 209.85.221.68
	mail-wr1-f68.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>, agk@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, iliastsi@arrikto.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 11 Oct 2019 11:39:55 +0000 (UTC)

On 10/11/19 1:17 PM, Guruswamy Basavaiah wrote:
> Hello Nikos,
>  Applied these patches and tested.
>  We still see hung_task_timeout back traces and the drbd Resync is blocked.
>  Attached the back trace, please let me know if you need any other information.
> 

Hi Guru,

Can you provide more information about your setup? The output of
'dmsetup table', 'dmsetup ls --tree' and the DRBD configuration would
help to get a better picture of your I/O stack.

Also, is it possible to describe the test case you are running and
exactly what it does?

Thanks,
Nikos

>  In patch "0002-dm-snapshot-rework-COW-throttling-to-fix-deadlock.patch"
> I change "struct wait_queue_head" to "wait_queue_head_t" as i was
> getting compilation error with former one.
> 
> On Thu, 10 Oct 2019 at 17:33, Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>
>> On 10/10/19 9:34 AM, Guruswamy Basavaiah wrote:
>>> Hello,
>>> We use 4.4.184 in our builds and the patch fails to apply.
>>> Is it possible to give a patch for 4.4.x branch ?
>> Hi Guru,
>>
>> I attach the two patches fixing the deadlock rebased on the 4.4.x branch.
>>
>> Nikos
>>
>>>
>>> patching Logs.
>>> patching file drivers/md/dm-snap.c
>>> Hunk #1 succeeded at 19 (offset 1 line).
>>> Hunk #2 succeeded at 105 (offset -1 lines).
>>> Hunk #3 succeeded at 157 (offset -4 lines).
>>> Hunk #4 succeeded at 1206 (offset -120 lines).
>>> Hunk #5 FAILED at 1508.
>>> Hunk #6 succeeded at 1412 (offset -124 lines).
>>> Hunk #7 succeeded at 1425 (offset -124 lines).
>>> Hunk #8 FAILED at 1925.
>>> Hunk #9 succeeded at 1866 with fuzz 2 (offset -255 lines).
>>> Hunk #10 succeeded at 2202 (offset -294 lines).
>>> Hunk #11 succeeded at 2332 (offset -294 lines).
>>> 2 out of 11 hunks FAILED -- saving rejects to file drivers/md/dm-snap.c.rej
>>>
>>> Guru
>>>
>>> On Thu, 10 Oct 2019 at 01:33, Guruswamy Basavaiah <guru2018@gmail.com> wrote:
>>>>
>>>> Hello Mike,
>>>>  I will get the testing result before end of Thursday.
>>>> Guru
>>>>
>>>> On Wed, 9 Oct 2019 at 21:34, Mike Snitzer <snitzer@redhat.com> wrote:
>>>>>
>>>>> On Wed, Oct 09 2019 at 11:44am -0400,
>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>
>>>>>> On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
>>>>>>> Nikos Tsironis <ntsironis@arrikto.com> wrote:
>>>>>>>
>>>>>>>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
>>>>>>>>> Hello Nikos,
>>>>>>>>>  Yes, issue is consistently reproducible with us, in a particular
>>>>>>>>> set-up and test case.
>>>>>>>>>  I will get the access to set-up next week, will try to test and let
>>>>>>>>> you know the results before end of next week.
>>>>>>>>>
>>>>>>>>
>>>>>>>> That sounds great!
>>>>>>>>
>>>>>>>> Thanks a lot,
>>>>>>>> Nikos
>>>>>>>
>>>>>>> Hi Guru,
>>>>>>>
>>>>>>> Any chance you could try this fix that I've staged to send to Linus?
>>>>>>> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
>>>>>>>
>>>>>>> Shiort of that, Nikos: do you happen to have a test scenario that teases
>>>>>>> out this deadlock?
>>>>>>>
>>>>>>
>>>>>> Hi Mike,
>>>>>>
>>>>>> Yes,
>>>>>>
>>>>>> I created a 50G LV and took a snapshot of the same size:
>>>>>>
>>>>>>   lvcreate -n data-lv -L50G testvg
>>>>>>   lvcreate -n snap-lv -L50G -s testvg/data-lv
>>>>>>
>>>>>> Then I ran the following fio job:
>>>>>>
>>>>>> [global]
>>>>>> randrepeat=1
>>>>>> ioengine=libaio
>>>>>> bs=1M
>>>>>> size=6G
>>>>>> offset_increment=6G
>>>>>> numjobs=8
>>>>>> direct=1
>>>>>> iodepth=32
>>>>>> group_reporting
>>>>>> filename=/dev/testvg/data-lv
>>>>>>
>>>>>> [test]
>>>>>> rw=write
>>>>>> timeout=180
>>>>>>
>>>>>> , concurrently with the following script:
>>>>>>
>>>>>> lvcreate -n dummy-lv -L1G testvg
>>>>>>
>>>>>> while true
>>>>>> do
>>>>>>  lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
>>>>>>  lvremove -f testvg/dummy-snap
>>>>>> done
>>>>>>
>>>>>> This reproduced the deadlock for me. I also ran 'echo 30 >
>>>>>> /proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
>>>>>> timeout.
>>>>>>
>>>>>> Nikos.
>>>>>
>>>>> Very nice, well done.  Curious if you've tested with the fix I've staged
>>>>> (see above)?  If so, does it resolve the deadlock?  If you've had
>>>>> success I'd be happy to update the tags in the commit header to include
>>>>> your Tested-by before sending it to Linus.  Also, any review of the
>>>>> patch that you can do would be appreciated and with your formal
>>>>> Reviewed-by reply would be welcomed and folded in too.
>>>>>
>>>>> Mike
>>>>
>>>>
>>>>
>>>> --
>>>> Guruswamy Basavaiah
>>>
>>>
>>>
> 
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
