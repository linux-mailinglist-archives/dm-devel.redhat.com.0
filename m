Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F15F186FF
	for <lists+dm-devel@lfdr.de>; Thu,  9 May 2019 10:47:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32BA43007431;
	Thu,  9 May 2019 08:47:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E93B88917;
	Thu,  9 May 2019 08:47:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0B77918089CB;
	Thu,  9 May 2019 08:46:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x47LpoF9031509 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 May 2019 17:51:50 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 724916013B; Tue,  7 May 2019 21:51:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BD9C6013A
	for <dm-devel@redhat.com>; Tue,  7 May 2019 21:51:48 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 40CF2307D850
	for <dm-devel@redhat.com>; Tue,  7 May 2019 21:51:47 +0000 (UTC)
Received: from mail-qk1-f200.google.com ([209.85.222.200])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hO801-0007QX-Bc
	for dm-devel@redhat.com; Tue, 07 May 2019 21:51:45 +0000
Received: by mail-qk1-f200.google.com with SMTP id u65so19629894qkd.17
	for <dm-devel@redhat.com>; Tue, 07 May 2019 14:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ABxz2zyv5bmpxAzqyzrtcoqu224yUlyjNfm0bz0RUYo=;
	b=Y08b1NZRD8v4Fr8rv/j3S+irYxsnDWaUTQgIWwuQfFBdA9ait4cpMr0Sb0K8MIiHKW
	ul+OT4lbLZlwGkthFClJwBc0f4VksCuNdKZtId1bMiVKcathtEFFLByhTKTIrDL8rzcz
	4IZz8GxIl60imssROMCxlI2qqP+m28LeHpl542C7Fnz9rPZrSEwZ0leKQHxnSIcc2mvJ
	JBhXU9UYSnw/E6gEahFH6YFyC+14kx4kEa5f2qApMmz2Ecbsg6tyXj/sNPFWavO/g5WM
	2haAt4BZXFbQuvBVWuBsl7iSiMI1gMgP1PH6w8M+5+orDA+2Iax+BzpaK15uTL+jdExg
	72WQ==
X-Gm-Message-State: APjAAAXJdP6eLVCZsuICMXsQz0i7mVaeEe0Pg6ec8CusLHBSHXaEB7rB
	6y73Duz80etpygAY4IhgQuHAMBOITLV0Lon7qQweL6SphVhYEaQgBd/dZOsjWjln/iZ3bJMFHc6
	6BbfGV+cVTvhUlGt/IhLApd59k0mZOg==
X-Received: by 2002:ac8:8c4:: with SMTP id y4mr568112qth.334.1557265904498;
	Tue, 07 May 2019 14:51:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxqmyA8mbiqIMGA6UVYNcKNbJyCt+/9kos8Zg0GnTOlwY7lwTrsVbbrcPB3iSk/BlNaK4k9rQ==
X-Received: by 2002:ac8:8c4:: with SMTP id y4mr568099qth.334.1557265904325;
	Tue, 07 May 2019 14:51:44 -0700 (PDT)
Received: from [192.168.1.205] (201-92-248-20.dsl.telesp.net.br.
	[201.92.248.20]) by smtp.gmail.com with ESMTPSA id
	d41sm2961824qta.22.2019.05.07.14.51.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 May 2019 14:51:43 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190430223722.20845-1-gpiccoli@canonical.com>
	<20190430223722.20845-2-gpiccoli@canonical.com>
	<CAPhsuW4SeUhNOJJkEf9wcLjbbc9qX0=C8zqbyCtC7Q8fdL91hw@mail.gmail.com>
	<c8721ba3-5d38-7906-5049-e2b16e967ecf@canonical.com>
	<CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
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
Message-ID: <21d2ab66-4295-6b69-ef85-d798f3406fbd@canonical.com>
Date: Tue, 7 May 2019 18:51:36 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW6ahmkUhCgns=9WHPXSvYefB0Gmr1oB7gdZiD86sKyHFg@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Tue, 07 May 2019 21:51:47 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 07 May 2019 21:51:47 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -5 (RCVD_IN_DNSWL_HI) 91.189.89.112
	youngberry.canonical.com 91.189.89.112 youngberry.canonical.com
	<gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 May 2019 04:46:45 -0400
Cc: axboe@kernel.dk, linux-raid <linux-raid@vger.kernel.org>,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	kernel@gpiccoli.net, stable@vger.kernel.org,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Jay Vosburgh <jay.vosburgh@canonical.com>,
	Gavin Guo <gavin.guo@canonical.com>
Subject: Re: [dm-devel] [PATCH 2/2] md/raid0: Do not bypass blocking queue
 entered for raid0 bios
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Thu, 09 May 2019 08:47:37 +0000 (UTC)

On 06/05/2019 18:07, Song Liu wrote:
>> [...]
>> I understand this could in theory affects all the RAID levels, but in
>> practice I don't think it'll happen. RAID0 is the only "blind" mode of
>> RAID, in the sense it's the only one that doesn't care at all with
>> failures. In fact, this was the origin of my other thread [0], regarding
>> the change of raid0's behavior in error cases..because it currently does
>> not care with members being removed and rely only in filesystem failures
>> (after submitting many BIOs to the removed device).
>>
>> That said, in this change I've only took care of raid0, since in my
>> understanding the other levels won't submit BIOs to dead devices; we can
>> experiment that to see if it's true.
> 
> Could you please run a quick test with raid5? I am wondering whether
> some race condition could get us into similar crash. If we cannot easily
> trigger the bug, we can process with this version.
> 
> Thanks,
> Song

Hi Song, I've tested both RAID5 (with 3 disks, removing one at a time),
and also RAID 1 (2 disks, also removing one at a time); no issues
observed in kernel 5.1. We can see one interesting message in kernel
log: "super_written gets error=10", which corresponds to md detecting
the error (bi_status == BLK_STS_IOERROR) and instantly failing the
write, making FS read-only.

So, I think really the issue happens only in RAID0, which writes
"blindly" to its components.
Let me know your thoughts - thanks again for your input!

Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
