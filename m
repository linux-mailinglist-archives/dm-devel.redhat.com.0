Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A657F61A
	for <lists+dm-devel@lfdr.de>; Fri,  2 Aug 2019 13:40:45 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3526F2F8BE1;
	Fri,  2 Aug 2019 11:40:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03DED1001947;
	Fri,  2 Aug 2019 11:40:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97CD41800204;
	Fri,  2 Aug 2019 11:40:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x6VD4fix014941 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 31 Jul 2019 09:04:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D45495C207; Wed, 31 Jul 2019 13:04:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE2C65C205
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 13:04:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F45D6E78C
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 13:04:38 +0000 (UTC)
Received: from mail-pf1-f198.google.com ([209.85.210.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hsoHU-0004Zs-Uw
	for dm-devel@redhat.com; Wed, 31 Jul 2019 13:04:37 +0000
Received: by mail-pf1-f198.google.com with SMTP id r142so43141533pfc.2
	for <dm-devel@redhat.com>; Wed, 31 Jul 2019 06:04:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ZVJqYCt6y7kDQk5e4VajzmV5IXeiBUBYB5EIHeYIrC0=;
	b=IbZBgb6+ekVOP9KMosvXCct7/Pkmhg92ANr6YAvOmTukwn0YNzMcnmDiZoC73qr8Wn
	p9ku/wna9GcIBFYWPtrsaQr96HNchYOgZsD1dNZw55gZi270VC6vlryKolLPypYJcY5D
	TSYzOBX7aKjlGxP+5p8nqOWDRGrmXG/+yDGi1i8y+MPCrx2eHYINN6vMOEXQ6XnMR9bW
	Mtwfh1AK1HJ6mr9vLTrVcJxtk8Opr2cAhlA9wp22QxraLJZu0OefluG4ECGg5t81eDWG
	OErBNoWDsxyP+ppeCqbQ4lECGgPnmfJrwv36NIG68ELFw3UjWrVKTR1SYbkizd0cfQLg
	44lA==
X-Gm-Message-State: APjAAAXMt3J7QT36EUEr+yKBQ3JffLV0tMLKASND7+cFvY9SJroGYtI+
	8xvY5nDBgCubbUh0bL0F0OxnyEb1a0VsgymUss+8FY5GLWEvtgkDL1DZ+s1RP+yWCU+5nNvy7hX
	jaRgO9y6TyjXYCVa4WHjZBgi/T9jMXg==
X-Received: by 2002:a17:902:b591:: with SMTP id
	a17mr39314902pls.96.1564578275201; 
	Wed, 31 Jul 2019 06:04:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwR1CH6m9mU2cXXtekQvrfWE11ZuQqjWDIftLSWs2cw2Yuy7o81N8NFr/tfEfOAEV580sOfRw==
X-Received: by 2002:a17:902:b591:: with SMTP id
	a17mr39314886pls.96.1564578275053; 
	Wed, 31 Jul 2019 06:04:35 -0700 (PDT)
Received: from [192.168.1.202] ([152.254.214.186])
	by smtp.gmail.com with ESMTPSA id
	b126sm103400673pfa.126.2019.07.31.06.04.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 31 Jul 2019 06:04:34 -0700 (PDT)
To: NeilBrown <neilb@suse.com>, Bob Liu <bob.liu@oracle.com>,
	linux-raid@vger.kernel.org
References: <20190729203135.12934-1-gpiccoli@canonical.com>
	<20190729203135.12934-2-gpiccoli@canonical.com>
	<d730c417-a328-3df3-1e31-32b6df48b6ad@oracle.com>
	<87ftmnkpxi.fsf@notabene.neil.brown.name>
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
Message-ID: <9dd836f8-7358-834f-8d29-cd0db717d01b@canonical.com>
Date: Wed, 31 Jul 2019 10:04:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ftmnkpxi.fsf@notabene.neil.brown.name>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.25]); Wed, 31 Jul 2019 13:04:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]);
	Wed, 31 Jul 2019 13:04:38 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.83 on 10.5.110.25
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 02 Aug 2019 07:39:28 -0400
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 02 Aug 2019 11:40:43 +0000 (UTC)

On 30/07/2019 21:28, NeilBrown wrote:
> On Tue, Jul 30 2019, Bob Liu wrote:
>>
>>
>> Curious why only raid0 has this issue? 
> 
> Actually, it isn't only raid0.  'linear' has the same issue.
> Probably the fix for raid0 should be applied to linear too.
> 
> NeilBrown
> 

Thanks Neil, it makes sense! I didn't considered "linear" and indeed,
after some testing, it reacts exactly as raid0/stripping.

In case this patch gets good acceptance I can certainly include
md/linear in that!
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
