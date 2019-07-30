Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7883F7BD43
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8B6674E4E6;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B73B5C21A;
	Wed, 31 Jul 2019 09:34:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E6E311800204;
	Wed, 31 Jul 2019 09:34:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UBhYLI019071 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 07:43:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4F94C5C21A; Tue, 30 Jul 2019 11:43:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A2685C1B4
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 11:43:30 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 125A4308FBA6
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 11:43:30 +0000 (UTC)
Received: from mail-pf1-f197.google.com ([209.85.210.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsQXQ-0001aA-4h
	for dm-devel@redhat.com; Tue, 30 Jul 2019 11:43:28 +0000
Received: by mail-pf1-f197.google.com with SMTP id i26so40582899pfo.22
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 04:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4KlUTmLKGdfGcyISyvot6nwpcs6RPe9hQLv7GSaByVg=;
	b=qTTHs5Le9k/PkkoBq54djAUybu5VejVuOh7/X/8hGWyLR7MFB19o8/eNndLJiFMKGl
	ugZQhU3jWUBQyBLsBDYcNKsvDySc+wFOWdpERkgh+TkHWb2csbRyiVBVfKv8Tz/hBUwH
	Xoj2Udv4+V4/yEdMRHAWipTD5Wnez4LF1U8YBD/X+1MbcefcxEpJNHc0w9gsxHO6Sfvp
	PonFLGGi45bWTutekwLP0G1NfOPrzTjWNCnXt3iSo214LcdKet929xTITBqLtQHmbe/7
	iKz5PI5zzwxI2kSVJc2ZnBk9tdzYuvtfbUaad5Rpyaoj/3c/Cl0J621uHLeLc8du/LB4
	MjeA==
X-Gm-Message-State: APjAAAUWd+SWgaCm9TsxcyRiHfgAv6VoTZF5gKld9gqafnXF/d/HB4+z
	bahdaaNEVSP4HGFCWTWjfDQG1DxGjTEpOFwdnBgZVNg22Qgb2nabxxr1CZdCwsUcoH8LJcGmpRV
	9x1cZB/h/SEbm81llOeru7t5edvYwHQ==
X-Received: by 2002:a17:90b:d8b:: with SMTP id
	bg11mr116845250pjb.30.1564487006913; 
	Tue, 30 Jul 2019 04:43:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyRl52zNy+T+lE1SC0yFNVABBNPatQQwwGO3yIZ8cF/begXpLwDZ8umDmsu9XwfWTGqFDNHDA==
X-Received: by 2002:a17:90b:d8b:: with SMTP id
	bg11mr116845234pjb.30.1564487006684; 
	Tue, 30 Jul 2019 04:43:26 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	s67sm66340537pjb.8.2019.07.30.04.43.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 04:43:25 -0700 (PDT)
To: NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<87wog0l6u2.fsf@notabene.neil.brown.name>
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
Openpgp: preference=signencrypt
Autocrypt: addr=gpiccoli@canonical.com; prefer-encrypt=mutual; keydata=
	mQENBFpVBxcBCADPNKmu2iNKLepiv8+Ssx7+fVR8lrL7cvakMNFPXsXk+f0Bgq9NazNKWJIn
	Qxpa1iEWTZcLS8ikjatHMECJJqWlt2YcjU5MGbH1mZh+bT3RxrJRhxONz5e5YILyNp7jX+Vh
	30rhj3J0vdrlIhPS8/bAt5tvTb3ceWEic9mWZMsosPavsKVcLIO6iZFlzXVu2WJ9cov8eQM/
	irIgzvmFEcRyiQ4K+XUhuA0ccGwgvoJv4/GWVPJFHfMX9+dat0Ev8HQEbN/mko/bUS4Wprdv
	7HR5tP9efSLucnsVzay0O6niZ61e5c97oUa9bdqHyApkCnGgKCpg7OZqLMM9Y3EcdMIJABEB
	AAG0LUd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5vbmljYWwuY29tPokBNwQT
	AQgAIQUCWmClvQIbAwULCQgHAgYVCAkKCwIEFgIDAQIeAQIXgAAKCRDOR5EF9K/7Gza3B/9d
	5yczvEwvlh6ksYq+juyuElLvNwMFuyMPsvMfP38UslU8S3lf+ETukN1S8XVdeq9yscwtsRW/
	4YoUwHinJGRovqy8gFlm3SAtjfdqysgJqUJwBmOtcsHkmvFXJmPPGVoH9rMCUr9s6VDPox8f
	q2W5M7XE9YpsfchS/0fMn+DenhQpV3W6pbLtuDvH/81GKrhxO8whSEkByZbbc+mqRhUSTdN3
	iMpRL0sULKPVYbVMbQEAnfJJ1LDkPqlTikAgt3peP7AaSpGs1e3pFzSEEW1VD2jIUmmDku0D
	LmTHRl4t9KpbU/H2/OPZkrm7809QovJGRAxjLLPcYOAP7DUeltveuQENBFpVBxcBCADbxD6J
	aNw/KgiSsbx5Sv8nNqO1ObTjhDR1wJw+02Bar9DGuFvx5/qs3ArSZkl8qX0X9Vhptk8rYnkn
	pfcrtPBYLoux8zmrGPA5vRgK2ItvSc0WN31YR/6nqnMfeC4CumFa/yLl26uzHJa5RYYQ47jg
	kZPehpc7IqEQ5IKy6cCKjgAkuvM1rDP1kWQ9noVhTUFr2SYVTT/WBHqUWorjhu57/OREo+Tl
	nxI1KrnmW0DbF52tYoHLt85dK10HQrV35OEFXuz0QPSNrYJT0CZHpUprkUxrupDgkM+2F5LI
	bIcaIQ4uDMWRyHpDbczQtmTke0x41AeIND3GUc+PQ4hWGp9XABEBAAGJAR8EGAEIAAkFAlpV
	BxcCGwwACgkQzkeRBfSv+xv1wwgAj39/45O3eHN5pK0XMyiRF4ihH9p1+8JVfBoSQw7AJ6oU
	1Hoa+sZnlag/l2GTjC8dfEGNoZd3aRxqfkTrpu2TcfT6jIAsxGjnu+fUCoRNZzmjvRziw3T8
	egSPz+GbNXrTXB8g/nc9mqHPPprOiVHDSK8aGoBqkQAPZDjUtRwVx112wtaQwArT2+bDbb/Y
	Yh6gTrYoRYHo6FuQl5YsHop/fmTahpTx11IMjuh6IJQ+lvdpdfYJ6hmAZ9kiVszDF6pGFVkY
	kHWtnE2Aa5qkxnA2HoFpqFifNWn5TyvJFpyqwVhVI8XYtXyVHub/WbXLWQwSJA4OHmqU8gDl
	X18zwLgdiQ==
Message-ID: <20348d5f-fa41-58f1-a7d8-2989233b97f1@canonical.com>
Date: Tue, 30 Jul 2019 08:43:13 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87wog0l6u2.fsf@notabene.neil.brown.name>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.43]); Tue, 30 Jul 2019 11:43:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]);
	Tue, 30 Jul 2019 11:43:30 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.43
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 05:34:14 -0400
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	songliubraving@fb.com, dm-devel@redhat.com, Neil F Brown <nfbrown@suse.com>
Subject: Re: [dm-devel] [PATCH 1/2] md/raid0: Introduce new array state
 'broken' for raid0
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Wed, 31 Jul 2019 09:34:34 +0000 (UTC)

On 29/07/2019 21:11, NeilBrown wrote:
> [...]
>> -	else {
>> +
>> +		if ((mddev->pers->level == 0) &&
> 
> Don't test if ->level is 0.  Instead, test if ->is_missing_dev is not
> NULL.
> 
> NeilBrown

Hi Neil, thanks for the feedback. I'll change that in a potential V2,
(if the patches are likely to be accepted), good idea.
Cheers,


Guilherme


> 
> 
>> +		   ((st == clean) || (st == broken))) {
>> +			if (mddev->pers->is_missing_dev(mddev))
>> +				st = broken;
>> +			else
>> +				st = clean;
>> +		}
>> +	} else {
>>  		if (list_empty(&mddev->disks) &&
>>  		    mddev->raid_disks == 0 &&
>>  		    mddev->dev_sectors == 0)
>> @@ -4315,6 +4329,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
>>  		break;
>>  	case write_pending:
>>  	case active_idle:
>> +	case broken:
>>  		/* these cannot be set */
>>  		break;
>>  	}
>> diff --git a/drivers/md/md.h b/drivers/md/md.h
>> index 41552e615c4c..e7b42b75701a 100644
>> --- a/drivers/md/md.h
>> +++ b/drivers/md/md.h
>> @@ -590,6 +590,8 @@ struct md_personality
>>  	int (*congested)(struct mddev *mddev, int bits);
>>  	/* Changes the consistency policy of an active array. */
>>  	int (*change_consistency_policy)(struct mddev *mddev, const char *buf);
>> +	/* Check if there is any missing/failed members - RAID0 only for now. */
>> +	bool (*is_missing_dev)(struct mddev *mddev);
>>  };
>>  
>>  struct md_sysfs_entry {
>> diff --git a/drivers/md/raid0.c b/drivers/md/raid0.c
>> index 58a9cc5193bf..79618a6ae31a 100644
>> --- a/drivers/md/raid0.c
>> +++ b/drivers/md/raid0.c
>> @@ -455,6 +455,31 @@ static inline int is_io_in_chunk_boundary(struct mddev *mddev,
>>  	}
>>  }
>>  
>> +bool raid0_is_missing_dev(struct mddev *mddev)
>> +{
>> +	struct md_rdev *rdev;
>> +	static int already_missing;
>> +	int def_disks, work_disks = 0;
>> +	struct r0conf *conf = mddev->private;
>> +
>> +	def_disks = conf->strip_zone[0].nb_dev;
>> +	rdev_for_each(rdev, mddev)
>> +		if (rdev->bdev->bd_disk->flags & GENHD_FL_UP)
>> +			work_disks++;
>> +
>> +	if (unlikely(def_disks - work_disks)) {
>> +		if (!already_missing) {
>> +			already_missing = 1;
>> +			pr_warn("md: %s: raid0 array has %d missing/failed members\n",
>> +				mdname(mddev), (def_disks - work_disks));
>> +		}
>> +		return true;
>> +	}
>> +
>> +	already_missing = 0;
>> +	return false;
>> +}
>> +
>>  static void raid0_handle_discard(struct mddev *mddev, struct bio *bio)
>>  {
>>  	struct r0conf *conf = mddev->private;
>> @@ -789,6 +814,7 @@ static struct md_personality raid0_personality=
>>  	.takeover	= raid0_takeover,
>>  	.quiesce	= raid0_quiesce,
>>  	.congested	= raid0_congested,
>> +	.is_missing_dev	= raid0_is_missing_dev,
>>  };
>>  
>>  static int __init raid0_init (void)
>> -- 
>> 2.22.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
