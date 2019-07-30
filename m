Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 655607BD3F
	for <lists+dm-devel@lfdr.de>; Wed, 31 Jul 2019 11:34:33 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 902268552A;
	Wed, 31 Jul 2019 09:34:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA2285C207;
	Wed, 31 Jul 2019 09:34:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E8436264CA;
	Wed, 31 Jul 2019 09:34:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6UCJF5Q025989 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Jul 2019 08:19:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AB73E60C79; Tue, 30 Jul 2019 12:19:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A657B60C6F
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 12:19:09 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07FFC3179173
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 12:19:09 +0000 (UTC)
Received: from mail-pg1-f197.google.com ([209.85.215.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsR5v-0004wH-GI
	for dm-devel@redhat.com; Tue, 30 Jul 2019 12:19:07 +0000
Received: by mail-pg1-f197.google.com with SMTP id m19so25994186pgv.7
	for <dm-devel@redhat.com>; Tue, 30 Jul 2019 05:19:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=duNeCgPARK5/DNYmXliLtl2PHvOx7FRmtH6Afr/ogZ8=;
	b=L55C154UiJSdey2H0EFuBNMmFEYk5dYyeBTHR68o9EKpWG3k4jcK+YkmgqP5B4PS1y
	NDqC1IRqAJ/XaipehtfWS+IvobMuweCV6Rqgz/yKvkv9L39RCADUaYYKC5rN+bkZXuQL
	avOP5Zs20s9VinZU94isGJzNwnkO2EHVBxuMQ0KmXxHzAjnzY/7Zjy/oh2fpkbFOlMY1
	BOt7IftWjAxk4euzH4WqCbpx3AgArsI7aeC2jcjTMyRHfYhGGzGO9UZJS6DZ9o3OInW2
	ENcKqBFeL1nxMrYVgYeb5nwU5BH0lywjOPOkzARVlClSoooRbXECMONxgrbZT6IY6FfL
	59Bg==
X-Gm-Message-State: APjAAAWB98aS+FfS+17wO1ZN9wa95QaKCeO5V9IGaBsC4VQ2WirHn5Hv
	3fP5JQZjDEw0f1qflC3FJDaVAN++XZXdsF81mHDkuexN8Vs+JNlc5/1b3oAEWLq28kljinw3Ijm
	f1fEMhb4jDQYkRlIqSneWm1s6riphSQ==
X-Received: by 2002:a62:1d8f:: with SMTP id
	d137mr42586382pfd.207.1564489145695; 
	Tue, 30 Jul 2019 05:19:05 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz3VqyZIP60VysathrWyL1Khg+ulJL5jfJ25tNxj1jx8o8wkADOY5OI0aR6Pr1uAwShW4fTiQ==
X-Received: by 2002:a62:1d8f:: with SMTP id
	d137mr42586372pfd.207.1564489145562; 
	Tue, 30 Jul 2019 05:19:05 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	e189sm45931655pgc.15.2019.07.30.05.18.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Jul 2019 05:19:04 -0700 (PDT)
To: Bob Liu <bob.liu@oracle.com>, linux-raid@vger.kernel.org
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
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
Message-ID: <000c20fe-3bcd-2dff-a5ab-9a294bdc7746@canonical.com>
Date: Tue, 30 Jul 2019 09:18:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.41]); Tue, 30 Jul 2019 12:19:09 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 30 Jul 2019 12:19:09 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 31 Jul 2019 05:34:14 -0400
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	dm-devel@redhat.com, songliubraving@fb.com, neilb@suse.com
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Wed, 31 Jul 2019 09:34:32 +0000 (UTC)

On 30/07/2019 03:20, Bob Liu wrote:
> [...]
>> + * broken
>> + *     RAID0-only: same as clean, but array is missing a member.
>> + *     It's useful because RAID0 mounted-arrays aren't stopped
>> + *     when a member is gone, so this state will at least alert
>> + *     the user that something is wrong.
> 
> 
> Curious why only raid0 has this issue? 
> 
> Thanks, -Bob

Hi Bob, I understand that all other levels have fault-tolerance logic,
while raid0 is just a "bypass" driver that selects the correct
underlying device to send the BIO and blindly sends it. It's known to be
a performance-only /lightweight solution whereas the other levels aim to
be reliable.

I've quickly tested raid5 and rai10, and see messages like this on
kernel log when removing a device (in raid5):

[35.764975] md/raid:md0: Disk failure on nvme1n1, disabling device.
md/raid:md0: Operation continuing on 1 devices.

The message seen in raid10 is basically the same. As a (cheap)
comparison of the complexity among levels, look that:

<...>/linux-mainline/drivers/md# cat raid5* | wc -l
14191

<...>/linux-mainline/drivers/md# cat raid10* | wc -l
5135

<...>/linux-mainline/drivers/md# cat raid0* | wc -l
820

Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
