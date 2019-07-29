Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B289B7A2A6
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0296A30860C6;
	Tue, 30 Jul 2019 07:55:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C68D06013A;
	Tue, 30 Jul 2019 07:55:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 69713180BA99;
	Tue, 30 Jul 2019 07:55:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKoBWC030974 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:50:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 341CC60922; Mon, 29 Jul 2019 20:50:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2CA608A5
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:50:08 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7DEF258
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:50:07 +0000 (UTC)
Received: from mail-pl1-f200.google.com ([209.85.214.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsCas-0002q3-04
	for dm-devel@redhat.com; Mon, 29 Jul 2019 20:50:06 +0000
Received: by mail-pl1-f200.google.com with SMTP id j12so33796479pll.14
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 13:50:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=+XMk/43ITQRym8v4Qdx3eFC21tUKiobsXb5aceQcHUs=;
	b=M/BOXVvAeEnKQtAQ82BbZc1wgF+e0diEgbEw8c/iZtcyAKc13GJ201t5NTjXWp5BZD
	SblMBdC23cn0Ayh2jt0TNCHxjWPU++UeBlsBNqoKB8dC95Vf0xGdHDf2cZOyLSDkmU1L
	4g+w6VvtIs7OJ2m5s+zjx0Mpi1XFZBlFBXqMFY4f9ABamj3i0dOzldVG5yIdctxSNQvm
	LMOHGhU+ihfKKNJRoZf8gEKcSsoj+kwZDQJY44x1xYChxHyPOED2YMBXYb29SkfKdcyo
	ne9WAsMfV0eF4gqFppQJnqbKeVn8KAmPOPosTrfvbsNOyd7gnEVgSgBskwO906klMLiu
	n/aA==
X-Gm-Message-State: APjAAAXSaVLDRiGVMn+PwCub59ptGaI4y076+ZeapTqWfIMhD85cK4J0
	7OSqdDew1PU+H56+zSdl4f+deACYGHhV6AwB3UZqURBM6Za0IrFm74SnWFptY5WUV6s2jJPNder
	Z/70pPT9bW6iImrK40T/ABfiyNA2n/Q==
X-Received: by 2002:a17:902:4124:: with SMTP id
	e33mr105442008pld.6.1564433404786; 
	Mon, 29 Jul 2019 13:50:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaUg3ADJPjfnAjCJyPt9dLggL/fkXvIF9JUqX9bu89XttSG2+HLu5IvXqgA8k8lD4EPCAhPA==
X-Received: by 2002:a17:902:4124:: with SMTP id
	e33mr105441989pld.6.1564433404363; 
	Mon, 29 Jul 2019 13:50:04 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	v184sm58410396pgd.34.2019.07.29.13.49.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jul 2019 13:50:03 -0700 (PDT)
To: Roman Mamedov <rm@romanrm.net>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<20190730011850.2f19e140@natsu>
	<053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
	<20190730013655.229020ea@natsu>
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
Message-ID: <ac032580-d2cb-5616-1101-46993b14466e@canonical.com>
Date: Mon, 29 Jul 2019 17:49:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730013655.229020ea@natsu>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.29]); Mon, 29 Jul 2019 20:50:07 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Mon, 29 Jul 2019 20:50:07 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 30 Jul 2019 03:55:28 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>, linux-raid@vger.kernel.org,
	dm-devel@redhat.com, jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH] md/raid0: Fail BIOs if their underlying
 block device is gone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Tue, 30 Jul 2019 07:55:55 +0000 (UTC)

On 29/07/2019 17:36, Roman Mamedov wrote:
> On Mon, 29 Jul 2019 17:27:15 -0300
> "Guilherme G. Piccoli" <gpiccoli@canonical.com> wrote:
> 
>> Hi Roman, I don't think this is usual setup. I understand that there are
>> RAID10 (also known as RAID 0+1) in which we can have like 4 devices, and
>> they pair in 2 sets of two disks using stripping, then these sets are
>> paired using mirroring. This is handled by raid10 driver however, so it
>> won't suffer for this issue.
>>
>> I don't think it's common or even makes sense to back a raid1 with 2
>> pure raid0 devices.
> 
> It might be not a usual setup, but it is a nice possibility that you get with
> MD. If for the moment you don't have drives of the needed size, but have
> smaller drives. E.g.:
> 
> - had a 2x1TB RAID1;
> - one disk fails;
> - no 1TB disks at hand;
> - but lots of 500GB disks;
> - let's make a 2x500GB RAID0 and have that stand in for the missing 1TB
> member for the time being;
> 
> Or here's for a detailed rationale of a more permanent scenario:
> https://louwrentius.com/building-a-raid-6-array-of-mixed-drives.html
> 

Oh, that's nice to know, thanks for the clarification Roman.
I wasn't aware this was more or less common.

Anyway, I agree with you: in this case, it's a weak point of raid0 to be
so slow to react in case of failures in one member. I hope this patch
helps to alleviate the issue.
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
