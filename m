Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id DE99B91EFF
	for <lists+dm-devel@lfdr.de>; Mon, 19 Aug 2019 10:34:19 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EBFA3175285;
	Mon, 19 Aug 2019 08:34:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75BD950;
	Mon, 19 Aug 2019 08:34:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CD84180BA9B;
	Mon, 19 Aug 2019 08:34:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7GDmUJr028646 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Aug 2019 09:48:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 28A0F7DA55; Fri, 16 Aug 2019 13:48:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 22EF57DA51
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:48:27 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3313B3084031
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 13:48:27 +0000 (UTC)
Received: from mail-qk1-f199.google.com ([209.85.222.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hycaf-0001r5-LX
	for dm-devel@redhat.com; Fri, 16 Aug 2019 13:48:25 +0000
Received: by mail-qk1-f199.google.com with SMTP id j81so5300271qke.23
	for <dm-devel@redhat.com>; Fri, 16 Aug 2019 06:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=79d/sdbXYtwwOa4n/jMG+dfgVY7Mn4hMqbid0OI3YuY=;
	b=S05ucA48K7E+wB/J5VDXrkiEueo+btdYYeA7o7/JtWuwOSOZ2yAZiwrTnbyDgmrb26
	NAcUFWrzY5IRmiKVLyzC2xfXqsmKud8NY1ULSPg1BN8zFk+9xy/cbtKhNTcuHtz+rMB9
	YVWVniRloirydpTWH8FJFpYV4j6EG4X18K2SWNx11syZwkjq+ZOAe3JoolHuhD8tfB7Z
	4qNSdMGYZNEV/rzfaun5QajvSzouRRkAwvsqAIX7EmUdoMzpZMkh/Bsp2cN1LdD2EOvz
	PAuEUnb0FirZz/WrO1LOcgVT7ooMxBm8bQT2UzjHXKGkMm/WN/+Co/g7HCZDY2a2Bamz
	+ccg==
X-Gm-Message-State: APjAAAXBbZxU49gWSYUUAkMWzBcqeBoMzGktRIB2qB7yF48O6aTa0QQ2
	STULHOK7Dj8QLzdNjgUL/qGIGmms3H886NIt6EwB2KmHrJUGB64OpqskIzS+xa01czZ+h2IpHAE
	tHCAyu+3oP83Dfx94JNHzh3TcMjwGRQ==
X-Received: by 2002:ac8:5053:: with SMTP id h19mr8734965qtm.196.1565963304914; 
	Fri, 16 Aug 2019 06:48:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy+eQMJ4sK3OxMayt6beDeiCE3aW7VAeep53Nvc9Y39FVuY4gVpby6z0uWwsqhOuvJf18sOxw==
X-Received: by 2002:ac8:5053:: with SMTP id h19mr8734946qtm.196.1565963304788; 
	Fri, 16 Aug 2019 06:48:24 -0700 (PDT)
Received: from [192.168.1.203] ([191.13.19.2])
	by smtp.gmail.com with ESMTPSA id
	e15sm2185377qtr.51.2019.08.16.06.48.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Aug 2019 06:48:24 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To: Song Liu <liu.song.a23@gmail.com>
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<CAPhsuW5n9TCZjVT3QnFhHkbfPTvh7ifFiNXypOHouL5ByZS7+w@mail.gmail.com>
	<037ef0ef-1a34-f522-6b31-e388906a87fa@canonical.com>
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
Message-ID: <5c63662a-2cea-bcd7-9f09-b09a68a156c4@canonical.com>
Date: Fri, 16 Aug 2019 10:48:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <037ef0ef-1a34-f522-6b31-e388906a87fa@canonical.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Fri, 16 Aug 2019 13:48:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 16 Aug 2019 13:48:27 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 19 Aug 2019 04:33:53 -0400
Cc: linux-block@vger.kernel.org, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>, dm-devel@redhat.com,
	Jay Vosburgh <jay.vosburgh@canonical.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 19 Aug 2019 08:34:18 +0000 (UTC)

V2 just sent:
lore.kernel.org/linux-block/20190816134059.29751-1-gpiccoli@canonical.com

Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
