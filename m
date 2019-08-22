Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E19D9AF9E
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 46B7F7BDAE;
	Fri, 23 Aug 2019 12:35:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 205E76E710;
	Fri, 23 Aug 2019 12:35:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AF669180BA9A;
	Fri, 23 Aug 2019 12:35:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7MGIpCO031029 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 12:18:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC8945D713; Thu, 22 Aug 2019 16:18:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D69C45D6A7
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 16:18:49 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13A9C4E938
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 16:18:48 +0000 (UTC)
Received: from mail-qk1-f198.google.com ([209.85.222.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i0pms-0000YV-Fr
	for dm-devel@redhat.com; Thu, 22 Aug 2019 16:18:10 +0000
Received: by mail-qk1-f198.google.com with SMTP id q62so6356994qkd.3
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 09:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8QrTJ5W9qm7UW8vRx30IPgmXV1thh8eTl373s/Dfifs=;
	b=XoTfRXmZto68fUQLPQWE2M8ZsTCpZbUQIcrCwfVPW0txDsyrNUXvKN1F5MbQr0QIZY
	rfx1LXRCbfEMyEDgwoqBG7pjlQb/UG8XwPSVSR58yRyatDK0G/zyABxp+m9pX6YhRbu3
	SjKN6fAkO6KO8LBqXTEGtwYLFu/WF4FsDZxctjNn2qukRVCdkPvhNVxKGxMM0rPbDjeZ
	8l5B5wRivv7C4s5Rj2Zd5Ra2RiBPlYc0uEe5i36nXM8LfwoxERhMZoM2b+lk9Mh3NdED
	KXCTpwWvXzItchJ+KzTGry2ZXWlTpYFnPXLDNa33zFHjyEfUkwdnsCYw2xZihrtEYY0F
	rriQ==
X-Gm-Message-State: APjAAAUejCLna007mxtvcNnlPGXQKZOJ5451+8I7Te6efmtaglkuOnWn
	mkoui2dAr3+b322a8KObf+SL/wecuDfCW/JdNbeMScDz1WxmEF2Ehsujv70v3HZvUcgWztG9c8I
	Gl+01prM4IgFVQaHRVNBZ+Qscdtslmw==
X-Received: by 2002:a05:620a:15f1:: with SMTP id
	p17mr21710481qkm.246.1566490689736; 
	Thu, 22 Aug 2019 09:18:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCnBPyl9YSdmpehF6GV9WrxDVxb/9qvN8HdNkJRmJmIsQvRet5zkEAJP94OUz2/BcrsKHQ3Q==
X-Received: by 2002:a05:620a:15f1:: with SMTP id
	p17mr21710461qkm.246.1566490689616; 
	Thu, 22 Aug 2019 09:18:09 -0700 (PDT)
Received: from [192.168.1.75] ([191.13.61.137])
	by smtp.gmail.com with ESMTPSA id k16sm51099qki.119.2019.08.22.09.18.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Aug 2019 09:18:08 -0700 (PDT)
To: linux-raid@vger.kernel.org
References: <20190816133441.29350-1-gpiccoli@canonical.com>
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
Message-ID: <9356da3b-d5b3-24d2-d109-3ea5916f717a@canonical.com>
Date: Thu, 22 Aug 2019 13:18:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816133441.29350-1-gpiccoli@canonical.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.38]); Thu, 22 Aug 2019 16:18:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]);
	Thu, 22 Aug 2019 16:18:48 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.38
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	dm-devel@redhat.com, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>
Subject: Re: [dm-devel] [PATCH v2] md raid0/linear: Fail BIOs if their
 underlying block device is gone
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Fri, 23 Aug 2019 12:35:18 +0000 (UTC)

V3 just sent:
lore.kernel.org/linux-block/20190822161318.26236-1-gpiccoli@canonical.com

The code was merged with the 'broken' state patch.
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
