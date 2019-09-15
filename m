Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCB7B3679
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 10:38:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7763610C0939;
	Mon, 16 Sep 2019 08:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E276E5D9DC;
	Mon, 16 Sep 2019 08:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 27EAA4E58A;
	Mon, 16 Sep 2019 08:38:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8FJdQBS016100 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 15 Sep 2019 15:39:26 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 326E45B681; Sun, 15 Sep 2019 19:39:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C95F5D772
	for <dm-devel@redhat.com>; Sun, 15 Sep 2019 19:39:23 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0AC7307D960
	for <dm-devel@redhat.com>; Sun, 15 Sep 2019 19:39:22 +0000 (UTC)
Received: from mail-qt1-f197.google.com ([209.85.160.197])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <gpiccoli@canonical.com>) id 1i9aMj-0003WY-2q
	for dm-devel@redhat.com; Sun, 15 Sep 2019 19:39:21 +0000
Received: by mail-qt1-f197.google.com with SMTP id n59so38544264qtd.8
	for <dm-devel@redhat.com>; Sun, 15 Sep 2019 12:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=jFGCIfzQsU5xnbkAwOQ/cWsVPPngjr/o/8PhxsMzzrI=;
	b=iV7u7afSgFyq8ibsi54le183c07yp8K0OnhvHCrkX08OmylTTVrBUx1kS6gPFHZeLW
	Q5iLtD7CH0Jqj2Sed7hPsmU97WZ5fr2H4K4Vf2R1PLQyI3l1Br7xkqMtGzcf5Fc2CK6g
	SmtSaa1xZthfpSlWDNFmXbbcMBjEKUvt6FIaN40DXMq6moOjqpzvhaZL2lvWQ/TB8TZn
	RMTLMSfrMtC1w02cE2gEBWbaU/k0OxpsmJuZ4yVp00hhfiY1P9xOVOXlogS7glQsbxiE
	8ziyozbUR7ThvD92Q0qxT+Adupyq0JjdqyJcleZyF8WwINJbWG/gS1qOj/H9tv1Q0jmL
	cRMg==
X-Gm-Message-State: APjAAAWhhijAut2egi/mw//NgqCJOVOw/MNTupEGdKAK0XTnTiOJ6iII
	1U0FZrWClzFVOHOPhcgDolidIkg5yaOqI73kc/teKo7ycNK/yzKJXlHJR20qNdC5ArAeD6NX0hv
	V4VnEviQwTafH2jR7XMV+3QahCR0P4Q==
X-Received: by 2002:ac8:36b7:: with SMTP id a52mr14358114qtc.181.1568576360321;
	Sun, 15 Sep 2019 12:39:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwwyo50DPpAitPmFw2d2/Jnhl2dHtjT1HtTBsLwqq5BMzRsdx7D4p/nHvvIEbElTyONxI06rw==
X-Received: by 2002:ac8:36b7:: with SMTP id a52mr14358098qtc.181.1568576360149;
	Sun, 15 Sep 2019 12:39:20 -0700 (PDT)
Received: from [192.168.0.239] ([177.183.163.179])
	by smtp.gmail.com with ESMTPSA id
	w131sm3088195qka.85.2019.09.15.12.39.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Sep 2019 12:39:19 -0700 (PDT)
To: Jes Sorensen <jsorensen@fb.com>,
	"jes.sorensen@gmail.com" <jes.sorensen@gmail.com>
References: <20190903194901.13524-1-gpiccoli@canonical.com>
	<20190903194901.13524-2-gpiccoli@canonical.com>
	<A0D1B6AB-50CF-4B38-8452-A4E18AFDC8EB@fb.com>
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
Message-ID: <5a17d353-3d47-d994-d462-cbe1e9d75778@canonical.com>
Date: Sun, 15 Sep 2019 16:39:11 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <A0D1B6AB-50CF-4B38-8452-A4E18AFDC8EB@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.48]); Sun, 15 Sep 2019 19:39:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Sun, 15 Sep 2019 19:39:23 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Sep 2019 04:38:17 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <songliubraving@fb.com>, "nfbrown@suse.com" <nfbrown@suse.com>,
	"liu.song.a23@gmail.com" <liu.song.a23@gmail.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"jay.vosburgh@canonical.com" <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v4 2/2] mdadm: Introduce new array state
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Mon, 16 Sep 2019 08:38:42 +0000 (UTC)

On 04/09/2019 12:51, Song Liu wrote:
> [...] 
>>
>> Cc: Jes Sorensen <jes.sorensen@gmail.com>
>> Cc: NeilBrown <neilb@suse.de>
>> Cc: Song Liu <songliubraving@fb.com>
>> Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
> 
> Acked-by: Song Liu <songliubraving@fb.com>
> 
> Jes, does this look good?
> 
> Thanks,
> Song
> 

Jes, do you have any comment about this patch? It'd be good having this
code merged before the 5.4 kernel windows ends, since the kernel
counterpart is ready to get merged (it's on Jens' tree).

Thanks in advance,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
