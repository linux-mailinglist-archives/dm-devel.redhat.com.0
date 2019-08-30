Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E08A5186
	for <lists+dm-devel@lfdr.de>; Mon,  2 Sep 2019 10:26:41 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EDA2B18C8908;
	Mon,  2 Sep 2019 08:26:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50E9F6012C;
	Mon,  2 Sep 2019 08:26:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 71FD024F2F;
	Mon,  2 Sep 2019 08:26:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7UCmVTO019512 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 30 Aug 2019 08:48:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C657660CC0; Fri, 30 Aug 2019 12:48:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C04AE60C05
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 12:48:28 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 857C98B5FF0
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 12:48:27 +0000 (UTC)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i3gKH-0000Ub-N8
	for dm-devel@redhat.com; Fri, 30 Aug 2019 12:48:25 +0000
Received: by mail-pg1-f199.google.com with SMTP id q1so3918279pgt.2
	for <dm-devel@redhat.com>; Fri, 30 Aug 2019 05:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=3B311aOKf6/H7N61CF4bou7LUlCA79yh6nnh0SwNi/Q=;
	b=qcRF1cfLtuVfsABikPKs1iNVo1b6Drs4ohDWhqYGVAlsyGbqA97mhyTLi6Iv0Q1vIW
	l6S6/GkxOIT97K5w+ZFnFM6wtZgg064f/3lIC/3O3g9DhjxZA/R1Ylu8jXQ7d63+H7Pk
	UhoZ3ybOKFcqppNVpbRxMy5NjAuORYBhMELT1keW99Hk5TGNVAY0oNIXNp7DiSg3lCV8
	eDDZedTtnhTk7nuD88jKEr/PP5Fmv7XPzZddsnEqtqbKm113aaTr71X/RWN/AVfVtY0R
	3oWt9zghE5fRzeoqTRjpUghVKAjrkrSiNU2B2h1ZOlT9RX277on7Stiu/kmKDYeL3WPJ
	Q2Qw==
X-Gm-Message-State: APjAAAU8uU653e2vgWVcVg6gFegEnpoDYLyw5tGGKKMlarDWA905Ci9r
	qLis2tw8MhQmIH2cW+9Gx7zWXgIeJXNhWhBi653SYTzYdMybhmGdL3kHPapbMAJROmuJOva5Fki
	0bfkFiLCHmTE6ErflxCvCRAkGVRGa1g==
X-Received: by 2002:aa7:8b0f:: with SMTP id f15mr17989427pfd.235.1567169304542;
	Fri, 30 Aug 2019 05:48:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxH9FffgY03+3ukV083CL3t5W7RGoTCxctd0RJaul7GbYkOx6jLTZSFn1Wnh+ToobhMYKpIFg==
X-Received: by 2002:aa7:8b0f:: with SMTP id f15mr17989403pfd.235.1567169304280;
	Fri, 30 Aug 2019 05:48:24 -0700 (PDT)
Received: from [192.168.1.201] (200-158-227-228.dsl.telesp.net.br.
	[200.158.227.228]) by smtp.gmail.com with ESMTPSA id
	m13sm9765525pgn.57.2019.08.30.05.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Aug 2019 05:48:23 -0700 (PDT)
To: NeilBrown <neilb@suse.de>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<20190822161318.26236-2-gpiccoli@canonical.com>
	<87a7brf4or.fsf@notabene.neil.brown.name>
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
Message-ID: <1a215cee-cbbb-ec3a-937a-2bcfb8049fef@canonical.com>
Date: Fri, 30 Aug 2019 09:48:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87a7brf4or.fsf@notabene.neil.brown.name>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Fri, 30 Aug 2019 12:48:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Fri, 30 Aug 2019 12:48:27 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Sep 2019 04:26:12 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <songliubraving@fb.com>,
	jes.sorensen@gmail.com, liu.song.a23@gmail.com,
	linux-raid@vger.kernel.org, dm-devel@redhat.com,
	linux-block@vger.kernel.org, jay.vosburgh@canonical.com
Subject: Re: [dm-devel] [PATCH v3 2/2] mdadm: Introduce new array state
 'broken' for raid0/linear
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.70]); Mon, 02 Sep 2019 08:26:40 +0000 (UTC)

Thanks Neil! CCing Jes, also comments inline:


On 30/08/2019 05:17, NeilBrown wrote:
>> [...]
>> +	char arrayst[12] = { 0 }; /* no state is >10 chars currently */
> 
> Why do you have an array?  Why not just a "char *".
> Then all the "strncpy" below become simple pointer assignment.

OK, makes sense! I'll try to change it.


>> [...]  
>>  int WaitClean(char *dev, int verbose)
>>  {
>> @@ -1116,7 +1120,8 @@ int WaitClean(char *dev, int verbose)
>>  			rv = read(state_fd, buf, sizeof(buf));
>>  			if (rv < 0)
>>  				break;
>> -			if (sysfs_match_word(buf, clean_states) <= 4)
> 
> Arg.  That is horrible.  Who wrote that code???
> Oh, it was me.  And only 8 years ago.

rofl, happens!


> sysfs_match_word() should return a clear "didn't match" indicator, like
> "-1".
> 
> Ideally that should be fixed, but I cannot really expect you to do that.
> 
> Maybe make it
>    if (clean_states[sysfs_match_word(buf, clean_states)] != NULL)
>  ??
> or
>    if (sysfs_match_word(buf, clean_states) < ARRAY_SIZE(clean_states)-1)
> 
> Otherwise the patch looks ok.

OK, thanks for the review! I'll try to change that in V4 too.
cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
