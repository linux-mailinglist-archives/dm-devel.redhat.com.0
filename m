Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 33DD2146C5
	for <lists+dm-devel@lfdr.de>; Mon,  6 May 2019 10:50:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13F9D30833A5;
	Mon,  6 May 2019 08:50:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A34B60C44;
	Mon,  6 May 2019 08:50:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 762493FB11;
	Mon,  6 May 2019 08:49:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3UMfOco017708 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 30 Apr 2019 18:41:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAA3C78DD4; Tue, 30 Apr 2019 22:41:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx20.extmail.prod.ext.phx2.redhat.com
	[10.5.110.49])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C537C6E714
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:41:22 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A1CD308FECF
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 22:41:21 +0000 (UTC)
Received: from mail-qk1-f197.google.com ([209.85.222.197])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hLbR9-0000O7-VW
	for dm-devel@redhat.com; Tue, 30 Apr 2019 22:41:20 +0000
Received: by mail-qk1-f197.google.com with SMTP id b67so13245209qkc.11
	for <dm-devel@redhat.com>; Tue, 30 Apr 2019 15:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=BNuNywNm3nYV5TRhn28+hTsGtHkLiVwZcTZZouyHt4g=;
	b=AdnMGe2Hg+3z/ZVKSJVoyIqyMoLStaypAX1YW2CqzbXmhcM8Xooy3MeYfSOqNvyvx6
	xxs6Kc81ZC1Dj2YGwVwH/TTp2LTbTj8DdMe8NvyGktqDtAzymkBX+5r0NmhH3ZdYskZg
	i084et57S9ijS55VXPfPPvSWGcozHGr8hLl3lvSIrVnk0hkz5uR3oI2xfmFhWTsDJ2sd
	WTm11qR3DOGphqAu+/ExXRaPpWRBQwlLvZLgQ2mrPQz7AqZFicNVNJOZXU3tx9z003Pn
	4hcBucRnS4Xyzq9he5Pun93K2apawf7CSaZ55D3qIp2EXbyrdwZEf1hZMZV3tY4/bkmi
	GKIA==
X-Gm-Message-State: APjAAAVVlA3ZTOBSsON614Zv+qwhGYxYiki7NOMtD06BW6ZgOhYtDv8E
	TQpIHBTTiAQWSXYo6Pade4y/ys5Xryx63SOGHuEkdUwHl/Q0tMWBT1UDIqCqtvVC3xBz5hCdfRr
	iWhnj0pK+Nmi4H9kAudIk27lIGgOpFA==
X-Received: by 2002:ac8:352f:: with SMTP id y44mr31084100qtb.130.1556664079005;
	Tue, 30 Apr 2019 15:41:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySp93LhP+mvPSQT1QyiKl5ZSHs1A52qRRiJ0rIyZm1NyCtfU5TBHrXwypsgBA0n7j+OqPs4w==
X-Received: by 2002:ac8:352f:: with SMTP id y44mr31084081qtb.130.1556664078788;
	Tue, 30 Apr 2019 15:41:18 -0700 (PDT)
Received: from [192.168.1.201] (201-13-157-136.dial-up.telesp.net.br.
	[201.13.157.136]) by smtp.gmail.com with ESMTPSA id
	m60sm20407664qte.81.2019.04.30.15.41.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 15:41:18 -0700 (PDT)
To: Song Liu <liu.song.a23@gmail.com>
References: <20190418220448.7219-1-gpiccoli@canonical.com>
	<CAPhsuW4k5zz2pJBPL60VzjTcj6NTnhBh-RjvWASLcOxAk+yDEw@mail.gmail.com>
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
Message-ID: <b39b96ea-2540-a407-2232-1af91e3e6658@canonical.com>
Date: Tue, 30 Apr 2019 19:41:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAPhsuW4k5zz2pJBPL60VzjTcj6NTnhBh-RjvWASLcOxAk+yDEw@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.49]); Tue, 30 Apr 2019 22:41:21 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]);
	Tue, 30 Apr 2019 22:41:21 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -5 (RCVD_IN_DNSWL_HI) 91.189.89.112
	youngberry.canonical.com 91.189.89.112 youngberry.canonical.com
	<gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.49
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 06 May 2019 04:49:36 -0400
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, kernel@gpiccoli.net,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>,
	jay.vosburgh@canonical.com, gavin.guo@canonical.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 06 May 2019 08:50:15 +0000 (UTC)

> On 19/04/2019 14:08, Song Liu wrote:
> [...]
> I read through the discussion in V1, and I would agree with Neil that
> current behavior is reasonable.
> 
> For the following example:
> 
> fd = open("file", "w");
> write(fd, buf, size);
> ret = fsync(fd);
> 
> If "size" is big enough, the write is not expected to be atomic for
> md or other drives. If we remove the underlining block device
> after write() and before fsync(), the file could get corrupted. This
> is the same for md or NVMe/SCSI drives.
> 
> The application need to check "ret" from fsync(), the data is safe
> only when fsync() returns 0.
> 
> Does this make sense?
> 

Hi Song, thanks for your quick response, and sorry for my delay.
I've noticed after v4.18 kernel started to crash when we remove one
raid0 member while writing, so I was investigating this
before perform your test (in fact, found 2 issues [0]), hence my delay.

Your test does make sense; in fact I've tested your scenario with the
following code (with the patches from [0]):
https://pastebin.ubuntu.com/p/cyqpDqpM7x/

Indeed, fsync returns -1 in this case.
Interestingly, when I do a "dd if=<some_file> of=<raid0_mount>" and try
to "sync -f <some_file>" and "sync", it succeeds and the file is
written, although corrupted.

Do you think this behavior is correct? In other devices, like a pure
SCSI disk or NVMe, the 'dd' write fails.
Also, what about the status of the raid0 array in mdadm - it shows as
"clean" even after the member is removed, should we change that?


> Also, could you please highlight changes from V1 (if more than
> just rebase)?

No changes other than rebase. Worth mentioning here that a kernel bot
(and Julia Lawall) found an issue in my patch; I forgot a
"mutex_lock(&mddev->open_mutex);" in line 6053, which caused the first
caveat (hung mdadm and persistent device in /dev). Thanks for pointing
this silly mistake from me! in case this patch gets some traction, I'll
re-submit with that fixed.

Cheers,


Guilherme

[0] https://marc.info/?l=linux-block&m=155666385707413

> 
> Thanks,
> Song
> 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
