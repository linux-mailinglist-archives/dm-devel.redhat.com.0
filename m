Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D399491EFC
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:16 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1621E8980F3;
	Mon, 19 Aug 2019 08:34:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBA0B50;
	Mon, 19 Aug 2019 08:34:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6995224F30;
	Mon, 19 Aug 2019 08:34:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GDk0YO028581 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 09:46:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 12610179C3; Fri, 16 Aug 2019 13:46:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.44])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBE88F6D8
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:45:57 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1878030860BA
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:45:57 +0000 (UTC)
Received: from mail-qt1-f198.google.com ([209.85.160.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hycYF-0001bp-JI
	for dm-devel@redhat.com; Fri, 16 Aug 2019 13:45:55 +0000
Received: by mail-qt1-f198.google.com with SMTP id e22so5960264qtp.9
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 06:45:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=yQ7ZqGhNs6hoTT3VOscezDfSlNkxdejGDFgNpEXCUTQ=;
	b=Xt1F+YwDIAC8M/TFaaMj/dkywKfiF2/OOuapQjgK+WaJ3Q2FBO+36UYw5onYFKMW+y
	N92ypIUj/Hl11qooCbaMZ+Ce4FQ06CUE0a+vepltWGIkiC0fyCSP28RfX7E7Jdvjf5ge
	259WDQR/UVPphJz92C1Vpu93X02nK6ogqYK8Bt57tVUJ5/XtipRg1cgq0XN5vBZjeBf3
	P5zNXQeAhqE2NyyQqBvSqdgyUip8BjC36UAG7z5uPeAKv+M8oXfG51WVq1eqA2JBHTI1
	uY/cJLiyvtedc2PdxpfQPZ/v5FUiIwn0RbtH6TxLWiFlNjtUi6zr7ZDODd90PQctPxYk
	9Keg==
X-Gm-Message-State: APjAAAXZArvunMTVwLqYmyitT779wQjwWnyYHBnZF9C8Ej3ZAtsNStfX
	ENur8cQ0mdwj/fTbcn+l5IqSUVlFVJpe41j1rD5uSRO2QwqViiKAHaN90Wq1uqAskxW0W0orzMm
	tJyQ+JyAsxGxvrn88Sj/xC5vAkbzFQQ==
X-Received: by 2002:a05:620a:1456:: with SMTP id
	i22mr8551558qkl.272.1565963154824; 
	Fri, 16 Aug 2019 06:45:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw5gXfy/6A7axKULrd+X/hnmjkeHFTrxSIH2xhnbcphEt8DuTT36yrjtyewW/+PSg2DVsc4Hw==
X-Received: by 2002:a05:620a:1456:: with SMTP id
	i22mr8551542qkl.272.1565963154691; 
	Fri, 16 Aug 2019 06:45:54 -0700 (PDT)
Received: from [192.168.1.203] ([191.13.19.2])
	by smtp.gmail.com with ESMTPSA id
	u45sm2749604qta.13.2019.08.16.06.45.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Aug 2019 06:45:53 -0700 (PDT)
To: Song Liu <songliubraving@fb.com>
References: <20190729193359.11040-1-gpiccoli@canonical.com>
	<87zhkwl6ya.fsf@notabene.neil.brown.name>
	<6400083b-3cf3-cbc6-650a-c3ae6629b14c@canonical.com>
	<CAPhsuW69YrpHqBCOob2b5wzzWS9FM087sfe3iC0odX8kZWRwmA@mail.gmail.com>
	<CAPhsuW5zB=Kik4rq9YA-xBer7Z-h-23QV4WSCWe-jvhFgGc0Cw@mail.gmail.com>
	<9674ca8f-4325-3023-8a1d-39782103f55d@canonical.com>
	<72C166DF-3984-4330-8C60-BBDA07358771@fb.com>
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
Message-ID: <47eea35a-c932-66e6-159e-37936b8e60f6@canonical.com>
Date: Fri, 16 Aug 2019 10:45:48 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <72C166DF-3984-4330-8C60-BBDA07358771@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.44]); Fri, 16 Aug 2019 13:45:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]);
	Fri, 16 Aug 2019 13:45:57 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.44
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: Neil F Brown <nfbrown@suse.com>, Song Liu <liu.song.a23@gmail.com>,
	NeilBrown <neilb@suse.com>, linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]); Mon, 19 Aug 2019 08:34:15 +0000 (UTC)

On 01/08/2019 19:43, Song Liu wrote:
> 
> [...]
>> Hi Song, thanks for the feedback! After changing the patch and testing a
>> bit, it behaves exactly as you said, we got either valid data read from
>> the healthy devices or -EIO for the data tentatively read from the
>> failed/missing array members.
> 
> Thanks for testing this out. 
> 
>>
>> So, I'll resubmit with that change. Also, I've noticed clearing the
>> BROKEN flag seem unnecessary, if user stops the array in order to fix
>> the missing member, it'll require a re-assembly and the array is gonna
>> work again.
>>
>> Do you / Neil considers this fix relevant to md/linear too? If so, I can
>> also include that in the V2.
> 
> Yes, please also include fix for md/linear. 
> 
> Song
> 

V2 just sent:
lore.kernel.org/linux-block/20190816133441.29350-1-gpiccoli@canonical.com

Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
