Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B038D3338B
	for <lists+dm-devel@lfdr.de>; Mon,  3 Jun 2019 17:30:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 88A8A85543;
	Mon,  3 Jun 2019 15:29:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 835105C219;
	Mon,  3 Jun 2019 15:29:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03DF2206D2;
	Mon,  3 Jun 2019 15:29:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x53FSQAP008635 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 3 Jun 2019 11:28:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id B7E6560FD5; Mon,  3 Jun 2019 15:28:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B2DCC60C68
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 15:28:24 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 27DB43107B33
	for <dm-devel@redhat.com>; Mon,  3 Jun 2019 15:28:02 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id g135so8471749wme.4
	for <dm-devel@redhat.com>; Mon, 03 Jun 2019 08:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=A1ufjvxRdc7Cru2M3ms/p30DZmTIrSBtDMiTsY6SmKE=;
	b=Ps8CRJonJ0/l32LJ9+J2r3cV43exQ250bn72XLzx51rb5+YPFgdBUmwpFeNJz67Bz2
	xLQF3VTBB2MURrbp0ONUQOCejQ4HV1WDmI1vFYiAXysOSLZZ9gxnBu8Rvks8hOgOcJow
	xl15mQZY4eXPqRMDd4oG4AvJaLR8CyOV1DeXbggrPUmSrWuUqKYPy4SicCUGEJGi+Kfy
	8I0SLXq+Fb9DzpmkVVn9vrcLPbDxHmZbc2P1f5PLO/hQP9Q4xVznrNNTKbeUyvjvGlIl
	Ov+VvjOFXGwCxavbiC1Y/j/YEGcAk7ZnacwA6WXyabRepQytPojxFvUNiJHxyGqEooJq
	Dn3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=A1ufjvxRdc7Cru2M3ms/p30DZmTIrSBtDMiTsY6SmKE=;
	b=npZ5o7EECXNc8utdMW7uSZYimWoHikHdAygEQ5vyxyy81iu1lm6fI3zMEw+UNK3FZI
	gurIhXDiMEC8Y1lT1oxArIVWJoNC98oECLSXiQKjiOqK/Tmqq+nYbNKksF04coFjPjXJ
	5e2SDmHx4nZRTdfUszFmJtl7m4hJJ7utEy4Wp8We/Pkdp9OB76zBVqwmgSl1NcPQWZml
	idXwhw5a4wepJSMPYjyTX6EOxr6N1PSJ8WRQx+aUn3/9EnnI99sVzgcCiKWqeVcybU0F
	kp12qElzAiDbdxV+xqJbs9XyigTYyaXK9IbC0tJ1QNw+jFiOIMLq8E1l8GzFAGISFuzs
	4+Mw==
X-Gm-Message-State: APjAAAV8CpXk9YHMhCmDBlq9oUcvqDI2NTpbdPTfsF4aoX6olqd5iluQ
	gPrNA25kI8gVI1REYZNDnSGMeKb5rUs=
X-Google-Smtp-Source: APXvYqykGUDyMbvFup1Zyb+kHFpDa4DIImmyrvcKhTC4VG/qepPdwHIGcKgSTi73zDHLQX70mLe7pw==
X-Received: by 2002:a1c:a6d1:: with SMTP id
	p200mr14851966wme.169.1559575680731; 
	Mon, 03 Jun 2019 08:28:00 -0700 (PDT)
Received: from [10.94.250.119] ([31.177.62.212])
	by smtp.gmail.com with ESMTPSA id b5sm5155987wru.69.2019.06.03.08.27.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Jun 2019 08:28:00 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>
References: <20190603134017.9323-1-ntsironis@arrikto.com>
	<20190603140808.GA21955@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <2ebd6f6f-cad4-898d-0fb7-48a05ab36a66@arrikto.com>
Date: Mon, 3 Jun 2019 18:27:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190603140808.GA21955@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 15:28:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 15:28:07 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.01  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, ejt@redhat.com, agk@redhat.com
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Mon, 03 Jun 2019 15:30:41 +0000 (UTC)

On 6/3/19 5:08 PM, Mike Snitzer wrote:
> On Mon, Jun 03 2019 at  9:40am -0400,
> Nikos Tsironis <ntsironis@arrikto.com> wrote:
> 
>> Currently, kcopyd has a sub-job size of 64KiB and a maximum number of 8
>> sub-jobs. As a result, for any kcopyd job, we have a maximum of 512KiB
>> of I/O in flight.
>>
>> This upper limit to the amount of in-flight I/O under-utilizes fast
>> devices and results in decreased throughput, e.g., when writing to a
>> snapshotted thin LV with I/O size less than the pool's block size (so
>> COW is performed using kcopyd).
>>
>> Increase kcopyd's sub-job size to 512KiB, so we have a maximum of 4MiB
>> of I/O in flight for each kcopyd job. This results in an up to 96%
>> improvement of bandwidth when writing to a snapshotted thin LV, with I/O
>> sizes less than the pool's block size.
>>
>> We evaluate the performance impact of the change by running the
>> snap_breaking_throughput benchmark, from the device mapper test suite
>> [1].
>>
>> The benchmark:
>>
>>   1. Creates a 1G thin LV
>>   2. Provisions the thin LV
>>   3. Takes a snapshot of the thin LV
>>   4. Writes to the thin LV with:
>>
>>       dd if=/dev/zero of=/dev/vg/thin_lv oflag=direct bs=<I/O size>
>>
>> Running this benchmark with various thin pool block sizes and dd I/O
>> sizes (all combinations triggering the use of kcopyd) we get the
>> following results:
>>
>> +-----------------+-------------+------------------+-----------------+
>> | Pool block size | dd I/O size | BW before (MB/s) | BW after (MB/s) |
>> +-----------------+-------------+------------------+-----------------+
>> |       1 MB      |      256 KB |       242        |       280       |
>> |       1 MB      |      512 KB |       238        |       295       |
>> |                 |             |                  |                 |
>> |       2 MB      |      256 KB |       238        |       354       |
>> |       2 MB      |      512 KB |       241        |       380       |
>> |       2 MB      |        1 MB |       245        |       394       |
>> |                 |             |                  |                 |
>> |       4 MB      |      256 KB |       248        |       412       |
>> |       4 MB      |      512 KB |       234        |       432       |
>> |       4 MB      |        1 MB |       251        |       474       |
>> |       4 MB      |        2 MB |       257        |       504       |
>> |                 |             |                  |                 |
>> |       8 MB      |      256 KB |       239        |       420       |
>> |       8 MB      |      512 KB |       256        |       431       |
>> |       8 MB      |        1 MB |       264        |       467       |
>> |       8 MB      |        2 MB |       264        |       502       |
>> |       8 MB      |        4 MB |       281        |       537       |
>> +-----------------+-------------+------------------+-----------------+
>>
>> [1] https://github.com/jthornber/device-mapper-test-suite
>>
>> Signed-off-by: Nikos Tsironis <ntsironis@arrikto.com>
>> ---
>>  drivers/md/dm-kcopyd.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/md/dm-kcopyd.c b/drivers/md/dm-kcopyd.c
>> index 671c24332802..db0a7d1e33b7 100644
>> --- a/drivers/md/dm-kcopyd.c
>> +++ b/drivers/md/dm-kcopyd.c
>> @@ -28,7 +28,7 @@
>>  
>>  #include "dm-core.h"
>>  
>> -#define SUB_JOB_SIZE	128
>> +#define SUB_JOB_SIZE	1024
>>  #define SPLIT_COUNT	8
>>  #define MIN_JOBS	8
>>  #define RESERVE_PAGES	(DIV_ROUND_UP(SUB_JOB_SIZE << SECTOR_SHIFT, PAGE_SIZE))
>> -- 
>> 2.11.0
>>
> 
> Thanks for the patch, clearly we're leaving considerable performance on
> the table.  But I'm left wondering whether we should preserve the 64K
> default but allow targets to override the sub-job size at kcopyd client
> create time?
> 
Hi Mike,

We could do that, but then I think we should also expose kcopyd's
sub-job size as a per-target module parameter. Targets don't know about
the performance characteristics of the underlying storage, so they are
not in place to make a better decision about the sub-job size. So, we
should probably leave the decision to the system administrator.

> Or do you feel that all slower storage wouldn't be adversely impacted by
> this sub-job size increase from 64K to 512K?
> 
Intuitively, increasing the request size will increase the request
latency and thus result in worse interactive performance. But, copy
bandwidth should be unaffected.

Moreover, the change affects targets, e.g., dm-thin, when we use a block
size greater than 512KiB, which therefore increases the amount of data
we COW when writing to a shared block. But COW, with large block sizes,
will result in increased latency despite this change.

Thanks,
Nikos

> Mike
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
