Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D8397B03DB
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 20:47:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D03E88A1C8B;
	Wed, 11 Sep 2019 18:47:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0FEE60852;
	Wed, 11 Sep 2019 18:47:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4F8704A460;
	Wed, 11 Sep 2019 18:47:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8BIl0iv021056 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 11 Sep 2019 14:47:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 874233DB2; Wed, 11 Sep 2019 18:47:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8079419C77
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 18:46:58 +0000 (UTC)
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98338300B916
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 18:46:56 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id n10so4766093wmj.0
	for <dm-devel@redhat.com>; Wed, 11 Sep 2019 11:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrikto-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=F1VQEQbUlehPYMDrwrNTFmrN1nMIWQX0CLUFAcGoyCE=;
	b=fuIL0jqxGSt5usBQ9DaAR9IGYeKXxiBebqXeuAgob4NKA5/X1UZ1yMKYkJv4WhwQTp
	Bz6BNakHOVmLTSOYLI9cF/UCnYxgZS5RbnMoIR9DMWg2JaChF0EcrwiDsaS63JE68Ktz
	Jwyobe1TWHBs/T6IAGFZG5p1kscbFKKgzSQPlSlSqjK8MK8HL9/QS5PF0tUjugUTvrxk
	CbY9Nhu8jBOTBNolFrBfZa+34gLBdxQyUKICkOmxbbXJeeBDcfPnNVpWWDwjeib5Jx6k
	0BsRxev3drR4ppLY4yUHw9gmjYk94GD0uJ0PCw0R/WrDzBIPGxv8yKi2EVe26Iw/Ge+q
	IU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=F1VQEQbUlehPYMDrwrNTFmrN1nMIWQX0CLUFAcGoyCE=;
	b=GroCPtVQNJHsASyGZjfFqaA2dRc9/VWK5CnM470AMxnJYmk839n//SKWdDXxVXUtbn
	cxlFxEoZOozKkZuB48xRDXSssdVaR41Fh600XxqwRo/Hp09Iuq6tNXyI/Va0fq2p8BHE
	0pb/HCzL+ZmGhryJATnsIWKrc8PI/FDpWY0HwM+MNNxZsXZv7Bzyr9naRuIMF2dlj/LD
	J1VoXiQORU0RzeLTev82df0ZrS1QR9Q9MfKM0YU2trHxbhEjkBV/jaMHC6zf3kPOD5ny
	oF/GVRTgKVkAFGn9ydauLDZFeWjUDM680UBh0IctX0v5feNmOYYcYgSwzdpDSWU6M5zL
	OfbQ==
X-Gm-Message-State: APjAAAVhSqcC7oWp/53rKzGCyDf/0s7UJkJL4eKTMZZXeqdTg7VaXoPQ
	VrpdqltAtNjjA2PvBgHAiEdpbe84nz0=
X-Google-Smtp-Source: APXvYqxCEnUtl5HDXhThkjYnR5uNDsGGEPV0oiGejp1aYFqdpo7PUuvt4OgQKzjKiwkXSvuszM6RkA==
X-Received: by 2002:a1c:2d11:: with SMTP id t17mr5238350wmt.147.1568227615203; 
	Wed, 11 Sep 2019 11:46:55 -0700 (PDT)
Received: from [192.168.1.103] (213.16.185.228.dsl.dyn.forthnet.gr.
	[213.16.185.228]) by smtp.gmail.com with ESMTPSA id
	r15sm3900695wmh.42.2019.09.11.11.46.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Sep 2019 11:46:54 -0700 (PDT)
To: Mike Snitzer <snitzer@redhat.com>, kbuild test robot <lkp@intel.com>
References: <201909120035.YsFPOauD%lkp@intel.com>
	<20190911182251.GA634@redhat.com>
From: Nikos Tsironis <ntsironis@arrikto.com>
Message-ID: <c35fcc93-91a2-20c2-da4c-9bbdee94e510@arrikto.com>
Date: Wed, 11 Sep 2019 21:46:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190911182251.GA634@redhat.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.49]);
	Wed, 11 Sep 2019 18:46:56 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Wed, 11 Sep 2019 18:46:56 +0000 (UTC) for IP:'209.85.128.65'
	DOMAIN:'mail-wm1-f65.google.com' HELO:'mail-wm1-f65.google.com'
	FROM:'ntsironis@arrikto.com' RCPT:''
X-RedHat-Spam-Score: -0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.128.65 mail-wm1-f65.google.com 209.85.128.65
	mail-wm1-f65.google.com <ntsironis@arrikto.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, kbuild-all@01.org,
	Ilias Tsitsimpis <iliastsi@arrikto.com>
Subject: Re: [dm-devel] [dm:for-next 29/30]
 drivers//md/dm-clone-target.c:563:14: error: implicit declaration of
 function 'vmalloc'; did you mean 'kmalloc'?
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Wed, 11 Sep 2019 18:47:34 +0000 (UTC)

On 9/11/19 9:22 PM, Mike Snitzer wrote:> 
> I resolved this and pushed new code, thanks!
> 

Hi Mike,

I just saw the report and was about to fix it, but I noticed you have
already fixed it. Thanks a lot.

I had forgotten to include the header file for vmalloc(), but I saw you
used kvmalloc(), which is even better.

I took a quick look at the diff and there are a few places that still
need fixing:

drivers/md/dm-clone-target.c:563: clone->ht = vmalloc(sz *sizeof(struct hash_table_bucket));
drivers/md/dm-clone-target.c:579: vfree(clone->ht);

Also, the allocation of cmd->region_map is done with kvmalloc(), but the
deallocation is still done with vfree():

drivers/md/dm-clone-metadata.c:597: vfree(cmd->region_map);

I will be away from keyboard for the rest of the day, but I will take a
closer look at the diff tomorrow and I will send a new version fixing
these and any other issues I might find.

Thanks,
Nikos.

> On Wed, Sep 11 2019 at 12:03pm -0400,
> kbuild test robot <lkp@intel.com> wrote:
> 
>> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/device-mapper/linux-dm.git for-next
>> head:   509818079bf1fefff4ed02d6a1b994e20efc0480
>> commit: 1529a543debdf75fb26e7ecd732da0cc36f78a36 [29/30] dm: add clone target
>> config: sparc64-allmodconfig (attached as .config)
>> compiler: sparc64-linux-gcc (GCC) 7.4.0
>> reproduce:
>>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>         chmod +x ~/bin/make.cross
>>         git checkout 1529a543debdf75fb26e7ecd732da0cc36f78a36
>>         # save the attached .config to linux build tree
>>         GCC_VERSION=7.4.0 make.cross ARCH=sparc64 
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kbuild test robot <lkp@intel.com>
>>
>> All error/warnings (new ones prefixed by >>):
>>
>>    drivers//md/dm-clone-target.c: In function 'hash_table_init':
>>>> drivers//md/dm-clone-target.c:563:14: error: implicit declaration of function 'vmalloc'; did you mean 'kmalloc'? [-Werror=implicit-function-declaration]
>>      clone->ht = vmalloc(sz * sizeof(struct hash_table_bucket));
>>                  ^~~~~~~
>>                  kmalloc
>>>> drivers//md/dm-clone-target.c:563:12: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>>      clone->ht = vmalloc(sz * sizeof(struct hash_table_bucket));
>>                ^
>>    drivers//md/dm-clone-target.c: In function 'hash_table_exit':
>>>> drivers//md/dm-clone-target.c:579:2: error: implicit declaration of function 'vfree'; did you mean 'kfree'? [-Werror=implicit-function-declaration]
>>      vfree(clone->ht);
>>      ^~~~~
>>      kfree
>>    cc1: some warnings being treated as errors
>> --
>>    drivers//md/dm-clone-metadata.c: In function 'dirty_map_init':
>>>> drivers//md/dm-clone-metadata.c:466:28: error: implicit declaration of function 'vzalloc'; did you mean 'kvzalloc'? [-Werror=implicit-function-declaration]
>>      md->dmap[0].dirty_words = vzalloc(bitmap_size(md->nr_words));
>>                                ^~~~~~~
>>                                kvzalloc
>>>> drivers//md/dm-clone-metadata.c:466:26: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>>      md->dmap[0].dirty_words = vzalloc(bitmap_size(md->nr_words));
>>                              ^
>>    drivers//md/dm-clone-metadata.c:474:26: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>>      md->dmap[1].dirty_words = vzalloc(bitmap_size(md->nr_words));
>>                              ^
>>>> drivers//md/dm-clone-metadata.c:478:3: error: implicit declaration of function 'vfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
>>       vfree(md->dmap[0].dirty_words);
>>       ^~~~~
>>       kvfree
>>    drivers//md/dm-clone-metadata.c: In function 'dm_clone_metadata_open':
>>>> drivers//md/dm-clone-metadata.c:553:19: error: implicit declaration of function 'vmalloc'; did you mean 'kvmalloc'? [-Werror=implicit-function-declaration]
>>      md->region_map = vmalloc(bitmap_size(md->nr_regions));
>>                       ^~~~~~~
>>                       kvmalloc
>>    drivers//md/dm-clone-metadata.c:553:17: warning: assignment makes pointer from integer without a cast [-Wint-conversion]
>>      md->region_map = vmalloc(bitmap_size(md->nr_regions));
>>                     ^
>>    cc1: some warnings being treated as errors
>>
>> vim +563 drivers//md/dm-clone-target.c
>>
>>    549	
>>    550	#define bucket_lock_irqsave(bucket, flags) \
>>    551		spin_lock_irqsave(&(bucket)->lock, flags)
>>    552	
>>    553	#define bucket_unlock_irqrestore(bucket, flags) \
>>    554		spin_unlock_irqrestore(&(bucket)->lock, flags)
>>    555	
>>    556	static int hash_table_init(struct clone *clone)
>>    557	{
>>    558		unsigned int i, sz;
>>    559		struct hash_table_bucket *bucket;
>>    560	
>>    561		sz = 1 << HASH_TABLE_BITS;
>>    562	
>>  > 563		clone->ht = vmalloc(sz * sizeof(struct hash_table_bucket));
>>    564		if (!clone->ht)
>>    565			return -ENOMEM;
>>    566	
>>    567		for (i = 0; i < sz; i++) {
>>    568			bucket = clone->ht + i;
>>    569	
>>    570			INIT_HLIST_HEAD(&bucket->head);
>>    571			spin_lock_init(&bucket->lock);
>>    572		}
>>    573	
>>    574		return 0;
>>    575	}
>>    576	
>>    577	static void hash_table_exit(struct clone *clone)
>>    578	{
>>  > 579		vfree(clone->ht);
>>    580	}
>>    581	
>>
>> ---
>> 0-DAY kernel test infrastructure                Open Source Technology Center
>> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
