Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 64980D1333
	for <lists+dm-devel@lfdr.de>; Wed,  9 Oct 2019 17:45:47 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B55C1300D1C2;
	Wed,  9 Oct 2019 15:45:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C101F1001B11;
	Wed,  9 Oct 2019 15:45:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 99D9D1808878;
	Wed,  9 Oct 2019 15:45:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x99Fj0BM011530 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 9 Oct 2019 11:45:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB22E5D9E2; Wed,  9 Oct 2019 15:45:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D41F65DA8C
	for <dm-devel@redhat.com>; Wed,  9 Oct 2019 15:44:56 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2EF0EA44AE1
	for <dm-devel@redhat.com>; Wed,  9 Oct 2019 15:44:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id y19so3630996wrd.3
	for <dm-devel@redhat.com>; Wed, 09 Oct 2019 08:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=i49ojg1kQAlc+RHKIu1WGirQNbzjw0fAjvS8zzCyUoQ=;
	b=ZE3xDApmEVPNpcn1k53kCLblj8mG6kOR4Cm/WLOiDYxt1FEcLCaQugNh+UMrisN5J4
	1ulAtKluwyfROoXzr9cQFvMDpkomTQWc+DNcr239qefEE2XXMK8lIXwzOQiEwspbY8LM
	tmaYHUCAKT08EPJiell4oVc8nSCoWnyswPWFMo11A6aNSG5Vlu5i9lIHpfKZMpqbNq1/
	m+JiYaywJa+Z9qxvho+O1QrkCEWVfNLA4tZK/zPgbaUZ1Gx7xCvzln//hpxlNG448xe1
	tnsh9vQHjISmmVXlIfa7Sy9ik7UKI3gTK71B++Je42l6hJfgdjjdpPdVNujCwngoTzoF
	C91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i49ojg1kQAlc+RHKIu1WGirQNbzjw0fAjvS8zzCyUoQ=;
	b=luY16474EMycKjC2ZYceIJbsu8POu5JcJZ/AQlJSO6lxJitb3DmCqDew7AigrlSuLQ
	uyr9pJaueI3Vbs75Dfs0Hd/zoBGpGiEViCSaozVLAj2KJLFKomn7HR62AkCH4ZyiFGi2
	a0NKPmIRF92V3lIuLGLT+XAmErW35NwwHn4oXadmex7Yn9QXxSwaxQrvh+SvxozaXQ9o
	7FbFEkyaGw7TCS+pyHylQifB05dUg0uqLV4hmT0IKAEgH+XVgDT8OXfOKbjklpVmeQ15
	O1D7ypK6Gts9QYwMWI/uLm4MvxpHDehz3L8FehaEniU6Y+IvK9DkuCzsJ4x1onYX5mcb
	Wfcg==
X-Gm-Message-State: APjAAAVgYiu4Vp9nG7/o2PM85/6/QqTe2+TRvHfOIvji289Dbi7Pdhci
	7JKBeb3+h/ZWn3dwApVey3COJA==
X-Google-Smtp-Source: APXvYqwfzTMuBzYeLlvXqHd+hIr99iovYf4ZZ7CaghqqsWAugiwUWmXDag3P40ps615Mo4/HfugppA==
X-Received: by 2002:adf:db47:: with SMTP id f7mr3711452wrj.348.1570635891843; 
	Wed, 09 Oct 2019 08:44:51 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id
	q15sm4244928wrg.65.2019.10.09.08.44.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Oct 2019 08:44:51 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, Guruswamy Basavaiah <guru2018@gmail.com>
References: <CAHSpA58dehDfou0ogCYnkziBt4oU5yo1SGHLhJb7vFKy9HhJPQ@mail.gmail.com>
	<db9a2b56-244b-1285-208c-14944f559f36@arrikto.com>
	<CAHSpA58H_Vuhub6Eqqmi2QZ2g4AAUX8KCCUMzMvyc87hDaVDKg@mail.gmail.com>
	<1b2b06a1-0b68-c265-e211-48273f26efaf@arrikto.com>
	<CAHSpA59rG7qhEDjtUUTNv5evyWHS_iTL0o8utRCr9MQvMDsEgw@mail.gmail.com>
	<e15bb4d9-d19b-f954-f71d-2985dd6e455a@arrikto.com>
	<20191009141308.GA1670@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <d6aaebd8-ed3e-2e6a-14ea-33bf023ee4bb@arrikto.com>
Date: Wed, 9 Oct 2019 18:44:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009141308.GA1670@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.68]);
	Wed, 09 Oct 2019 15:44:53 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Wed, 09 Oct 2019 15:44:53 +0000 (UTC) for IP:'209.85.221.66'
	DOMAIN:'mail-wr1-f66.google.com' HELO:'mail-wr1-f66.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.221.66 mail-wr1-f66.google.com 209.85.221.66
	mail-wr1-f66.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, iliastsi@arrikto.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Wed, 09 Oct 2019 15:45:45 +0000 (UTC)

On 10/9/19 5:13 PM, Mike Snitzer wrote:> On Tue, Oct 01 2019 at  8:43am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> On 10/1/19 3:27 PM, Guruswamy Basavaiah wrote:
>>> Hello Nikos,
>>>  Yes, issue is consistently reproducible with us, in a particular
>>> set-up and test case.
>>>  I will get the access to set-up next week, will try to test and let
>>> you know the results before end of next week.
>>>
>>
>> That sounds great!
>>
>> Thanks a lot,
>> Nikos
> 
> Hi Guru,
> 
> Any chance you could try this fix that I've staged to send to Linus?
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git/commit/?h=dm-5.4&id=633b1613b2a49304743c18314bb6e6465c21fd8a
> 
> Shiort of that, Nikos: do you happen to have a test scenario that teases
> out this deadlock?
> 

Hi Mike,

Yes,

I created a 50G LV and took a snapshot of the same size:

  lvcreate -n data-lv -L50G testvg
  lvcreate -n snap-lv -L50G -s testvg/data-lv

Then I ran the following fio job:

[global]
randrepeat=1
ioengine=libaio
bs=1M
size=6G
offset_increment=6G
numjobs=8
direct=1
iodepth=32
group_reporting
filename=/dev/testvg/data-lv

[test]
rw=write
timeout=180

, concurrently with the following script:

lvcreate -n dummy-lv -L1G testvg

while true
do
 lvcreate -n dummy-snap -L1M -s testvg/dummy-lv
 lvremove -f testvg/dummy-snap
done

This reproduced the deadlock for me. I also ran 'echo 30 >
/proc/sys/kernel/hung_task_timeout_secs', to reduce the hung task
timeout.

Nikos.

> Thanks,
> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
