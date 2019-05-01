Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FE510C8C
	for <lists+dm-devel@lfdr.de>; Wed,  1 May 2019 20:01:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C433F83F3B;
	Wed,  1 May 2019 18:01:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADFE67D5A4;
	Wed,  1 May 2019 18:01:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4613241F3D;
	Wed,  1 May 2019 18:01:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x41I13wQ009815 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 May 2019 14:01:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B25256E6EA; Wed,  1 May 2019 18:01:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9A936E6E7
	for <dm-devel@redhat.com>; Wed,  1 May 2019 18:00:34 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56E6D81127
	for <dm-devel@redhat.com>; Wed,  1 May 2019 18:00:33 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id k189so10649158qkc.0
	for <dm-devel@redhat.com>; Wed, 01 May 2019 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=gpiccoli-net.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CWXi406PkzhQU+9UdGnKsnrqZujCyJ2gUC4Pfr8A1+A=;
	b=E4AVFO2viQI2seeFtKG1a35npNQJLByb3QSKM8xTCmV6rZIkU5talTQdbFHD6L+Ai5
	iMI79fe569b+GbG13w4ZC5bPyeiihS/5TfpSVdAgqzxvqaCs57CiHcv9AHjdCRNqZ/er
	6QMCNNa0wu9tDMC58k+KcmVEDl8PR6S643gnzDSxFvAQK4bt85r9gTnJvsQ5tTIGFC2k
	1C0T91MmVccS09qbJ85qJaGUrMaS1NYs7GvIhhF/6KxCOIcDpXeN4M2KYkdu+hWBGck1
	4AI1EYyGFjHBtaMuLdooJ0Tj8CBjnYtbJXowAH+lBhgVh/iUE5YXgXDGoVcmVT8v4eyM
	s/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CWXi406PkzhQU+9UdGnKsnrqZujCyJ2gUC4Pfr8A1+A=;
	b=BXGKdON/NVPYVxSRX65am3G6NLL6mkdB5XQKbYJM3/qFvXhqFNZu3bezCvroxVy/+L
	ODNlODn+V4inREFqKAHxW030Jsp7oW5KcdtePRI7hCnJk3EGxk7BGweLZLhablLhyt+4
	XFRmoy2gPilJYIK+kIdFMt491DvdlEOMqaOQls2mA3vn18HWyIZNQdODpEoXt7+ZkjgX
	14Qpu7NRS/3IWb95M0d71SnCZMiWO1G75iAAjqFbo/BTPkQ9waBNikK+EFSlCwbJfpmR
	Br4JUEK8aWEAH/na9Pt6tM3R0GK7wRTIhRpyV45k8c47H1k+rczumAip412FAJggBIj6
	yTOw==
X-Gm-Message-State: APjAAAWAJuj+9nT9Kq/UaumhHZlhOQARp4P/yS8bLUosHbOY7oOLY47F
	YstsNx9h20hRew9JDG03sm/Z4A==
X-Google-Smtp-Source: APXvYqyn3p7e1upCndsBMr8ZFBhc/gsxsqCbhHFN9BQhmLMJLdEn0d6o/DPEjXHUjE4fsWOCYqsLxQ==
X-Received: by 2002:ae9:ec07:: with SMTP id h7mr718472qkg.7.1556733632633;
	Wed, 01 May 2019 11:00:32 -0700 (PDT)
Received: from [192.168.1.10] (201-13-157-136.dial-up.telesp.net.br.
	[201.13.157.136]) by smtp.gmail.com with ESMTPSA id
	s68sm8337799qkb.16.2019.05.01.11.00.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 May 2019 11:00:31 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190418220448.7219-1-gpiccoli@canonical.com>
	<CAPhsuW4k5zz2pJBPL60VzjTcj6NTnhBh-RjvWASLcOxAk+yDEw@mail.gmail.com>
	<b39b96ea-2540-a407-2232-1af91e3e6658@canonical.com>
	<CAPhsuW65EW8JgjE8zknPQPXYcmDhX9LEhTKGb0KHywqKuZkUcA@mail.gmail.com>
From: "Guilherme G. Piccoli" <kernel@gpiccoli.net>
Message-ID: <2823f928-d0b6-9049-73ab-b2ce0ef5da83@gpiccoli.net>
Date: Wed, 1 May 2019 15:00:27 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW65EW8JgjE8zknPQPXYcmDhX9LEhTKGb0KHywqKuZkUcA@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 01 May 2019 18:00:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Wed, 01 May 2019 18:00:33 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'kernel@gpiccoli.net' RCPT:''
X-RedHat-Spam-Score: -0.011  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2) 209.85.222.196
	mail-qk1-f196.google.com 209.85.222.196
	mail-qk1-f196.google.com <kernel@gpiccoli.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@canonical.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	Jay Vosburgh <jay.vosburgh@canonical.com>, gavin.guo@canonical.com
Subject: Re: [dm-devel] [RFC] [PATCH V2 0/1] Introduce emergency raid0 stop
 for mounted arrays
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 01 May 2019 18:01:41 +0000 (UTC)

 > On 5/1/19 12:33 PM, Song Liu wrote:
>> [...]
>> Indeed, fsync returns -1 in this case.
>> Interestingly, when I do a "dd if=<some_file> of=<raid0_mount>" and try
>> to "sync -f <some_file>" and "sync", it succeeds and the file is
>> written, although corrupted.
> 
> I guess this is some issue with sync command, but I haven't got time
> to look into it. How about running dd with oflag=sync or oflag=direct?
> 

Hi Song, could be some problem with sync command; using either 
'oflag=direct' or 'oflag=sync' fails the dd command instantly when a 
member is removed.


>> Do you think this behavior is correct? In other devices, like a pure
>> SCSI disk or NVMe, the 'dd' write fails.
>> Also, what about the status of the raid0 array in mdadm - it shows as
>> "clean" even after the member is removed, should we change that?
> 
> I guess this is because the kernel hasn't detect the array is gone? In
> that case, I think reducing the latency would be useful for some use
> cases.
> 

Exactly! This is the main concern here, mdadm cannot stop the array 
since it's mounted, and there's no filesystem API to quickly shutdown 
the filesystem, hence it keeps "alive" for too long after the failure.

For instance, if we have a raid0 with 2 members and remove the 1st, it 
fails much quicker than if we remove the 2nd; the filesystem will 
"realize" the device is flaw quickly if we remove the 1st member, and 
goes to RO mode. Specially, xfs seems even faster than ext4 in noticing 
the failure.

Do you have any suggestion on how could we reduce this latency? And how 
about the status exhibited by mdadm, shall it move from 'clean' to 
something more meaningful in the failure case?

Thanks again,


Guilherme

> Thanks,
> Song
> 
>>
>>
>>> Also, could you please highlight changes from V1 (if more than
>>> just rebase)?
>>
>> No changes other than rebase. Worth mentioning here that a kernel bot
>> (and Julia Lawall) found an issue in my patch; I forgot a
>> "mutex_lock(&mddev->open_mutex);" in line 6053, which caused the first
>> caveat (hung mdadm and persistent device in /dev). Thanks for pointing
>> this silly mistake from me! in case this patch gets some traction, I'll
>> re-submit with that fixed.
>>
>> Cheers,
>>
>>
>> Guilherme
>>
>> [0] https://marc.info/?l=linux-block&m=155666385707413
>>
>>>
>>> Thanks,
>>> Song
>>>

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
