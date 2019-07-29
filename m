Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D0ECA7A2A2
	for <lists+dm-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:52 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 260BB796E7;
	Tue, 30 Jul 2019 07:55:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA47E19C77;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64C7819724;
	Tue, 30 Jul 2019 07:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6TKRY7e027846 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Jul 2019 16:27:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2850160872; Mon, 29 Jul 2019 20:27:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2144160856
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:27:31 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5A60C060201
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 20:27:30 +0000 (UTC)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsCEy-0001c9-Sl
	for dm-devel@redhat.com; Mon, 29 Jul 2019 20:27:29 +0000
Received: by mail-pf1-f199.google.com with SMTP id x10so39217992pfa.23
	for <dm-devel@redhat.com>; Mon, 29 Jul 2019 13:27:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=MaekBACqSdm0Cv0kET0YVM5UjbEWf5Z7KHF+w2h47zE=;
	b=PBUbyz+CucFjEZhr/TnHFdNjuQvZ/whonLCLZWWnbJGi5v+yAPuGAg9XCm9e1WZq4O
	hL4bOnrosk0M949pAaPLrXTqGyIQI/5X7NRMI57zb/JYBdxZrLChzgIOP4Z3IVMjQpCi
	/NMErfoR6qnz58l4lNiXmweBwD+NSh4neZkBP3chAg8f+OIj4t7bxnKol7acTKsaWqQE
	bbz1eJtHY9bniYSU2XTdxtLyVPg1qOVcD/rIyg0ark8UrypnB5aL5Rw5w6GenUFQZUwD
	eI2IVYWekBxdADf+HJY+hEMfTveTN/QzEmdKGdx+5sfGO4fIIDJGo9fYXnOUTCjMJW2f
	oPlQ==
X-Gm-Message-State: APjAAAWDwO96tt0b59oYAXK18ailxRdu+4L+w0NKlYcVD1h5tBy27V2B
	wc1U599ytywg2t2xFdwPj4+XjJSGRN2ya1OAIra9mZ1IBy23P8o2b+sigrxkikzDNpjkE0TQl+G
	IhFHGQfeQ8I6IZSUqMosDHerq7WHgxg==
X-Received: by 2002:a63:5c15:: with SMTP id q21mr79513510pgb.199.1564432047546;
	Mon, 29 Jul 2019 13:27:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw4/pLh9DzTr1UAut9rnbFH5HGyR6rsm/IUS1OMP3fUvcNHL6cpZohM6eqwe61q/Bvb+ZovXw==
X-Received: by 2002:a63:5c15:: with SMTP id q21mr79513486pgb.199.1564432047257;
	Mon, 29 Jul 2019 13:27:27 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	q24sm56238914pjp.14.2019.07.29.13.27.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jul 2019 13:27:26 -0700 (PDT)
To: Roman Mamedov <rm@romanrm.net>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<20190730011850.2f19e140@natsu>
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
Message-ID: <053c88e1-06ec-0db1-de8f-68f63a3a1305@canonical.com>
Date: Mon, 29 Jul 2019 17:27:15 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190730011850.2f19e140@natsu>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.32]); Mon, 29 Jul 2019 20:27:30 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Mon, 29 Jul 2019 20:27:30 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Tue, 30 Jul 2019 07:55:50 +0000 (UTC)



On 29/07/2019 17:18, Roman Mamedov wrote:
> On Mon, 29 Jul 2019 16:33:59 -0300
> "Guilherme G. Piccoli" <gpiccoli@canonical.com> wrote:
> 
>> Currently md/raid0 is not provided with any mechanism to validate if
>> an array member got removed or failed. The driver keeps sending BIOs
>> regardless of the state of array members. This leads to the following
>> situation: if a raid0 array member is removed and the array is mounted,
>> some user writing to this array won't realize that errors are happening
>> unless they check kernel log or perform one fsync per written file.
>>
>> In other words, no -EIO is returned and writes (except direct ones) appear
>> normal. Meaning the user might think the wrote data is correctly stored in
>> the array, but instead garbage was written given that raid0 does stripping
>> (and so, it requires all its members to be working in order to not corrupt
>> data).
> 
> If that's correct, then this seems to be a critical weak point in cases when
> we have a RAID0 as a member device in RAID1/5/6/10 arrays.
> 

Hi Roman, I don't think this is usual setup. I understand that there are
RAID10 (also known as RAID 0+1) in which we can have like 4 devices, and
they pair in 2 sets of two disks using stripping, then these sets are
paired using mirroring. This is handled by raid10 driver however, so it
won't suffer for this issue.

I don't think it's common or even makes sense to back a raid1 with 2
pure raid0 devices.
Thanks for your comment!
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
