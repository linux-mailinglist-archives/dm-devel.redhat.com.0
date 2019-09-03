Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1E8A7E6B
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:29 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1AE2A7F752;
	Wed,  4 Sep 2019 08:53:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7556600CD;
	Wed,  4 Sep 2019 08:53:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AE3B32551D;
	Wed,  4 Sep 2019 08:53:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83Jrcgo025096 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 15:53:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1C9011001B02; Tue,  3 Sep 2019 19:53:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx27.extmail.prod.ext.phx2.redhat.com
	[10.5.110.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 172771001B00
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:53:35 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DC30875222
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 19:53:34 +0000 (UTC)
Received: from mail-pf1-f199.google.com ([209.85.210.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i5Ers-0005Tg-ON
	for dm-devel@redhat.com; Tue, 03 Sep 2019 19:53:32 +0000
Received: by mail-pf1-f199.google.com with SMTP id z13so11807140pfr.15
	for <dm-devel@redhat.com>; Tue, 03 Sep 2019 12:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:cc:references:to:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=m4/iGFxysoqiJX5l6xY9vaEh4ZOwU9TUKtScGeLuxk4=;
	b=sciFHMUgJpvk1SJaBg7PGLgsEyIK+78NaRB6rudDJYhNFZ2qXzu5T/jjTkV2+y6MAv
	sXV1BejvBnlcMM4s0fwm7rMpz04ORWBifByLwa/SQtCYHqxEXpdBIjY7WUp3vVtckyey
	zUp5Uj5w/kkios4ALTM7oieqvrxCd/BAMeGTunTkMLjv0XYh5phWP9rXB/mY5NOOH3+5
	QfCCJ/k4kd1QV8+EuJ6PL2MjzqN2K3GoGVrX2sWQnnUPjJTCdPpj+WRms4QlNAtf9lEl
	PGVRaZ2hjiNKlJBuEn9FKZbyMiwJJ9Af9iiXOEwq15X4YTwKYpKXq7lINvjuQn9kg0yP
	L2oQ==
X-Gm-Message-State: APjAAAWQU3wnC9lrfIttir7sNjgx9VGijbiG7Yv1M6I3VHStCUK+UFb5
	yZ2V9IgAPInw0uszFHvelSL/bjoaSGW2ERlVfqzHrXBNGzeppM/giJRiU8MUsRbdplR4egyZhZN
	aaW9JEcVBs3MoOUKMRwz6NeQLdLykgA==
X-Received: by 2002:a17:90a:c086:: with SMTP id
	o6mr1041226pjs.24.1567540411619; 
	Tue, 03 Sep 2019 12:53:31 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwiwXv/UYVHujb2Lh/xxxZ5lvm9Dvm2/i4Zu0bum67gm5u4ULLDhXn+dzw+u/pQGQ1xWX4NCw==
X-Received: by 2002:a17:90a:c086:: with SMTP id
	o6mr1041217pjs.24.1567540411500; 
	Tue, 03 Sep 2019 12:53:31 -0700 (PDT)
Received: from [192.168.1.203] (201-93-37-171.dial-up.telesp.net.br.
	[201.93.37.171]) by smtp.gmail.com with ESMTPSA id
	d20sm24787555pfq.88.2019.09.03.12.53.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 12:53:30 -0700 (PDT)
From: "Guilherme G. Piccoli" <gpiccoli@canonical.com>
References: <20190822161318.26236-1-gpiccoli@canonical.com>
	<73C4747E-7A9E-4833-8393-B6A06C935DBE@fb.com>
	<8163258e-839c-e0b8-fc4b-74c94c9dae1d@canonical.com>
	<F0E716F8-76EC-4315-933D-A547B52F1D27@fb.com>
	<5D68FEBC.9060709@youngman.org.uk>
	<CAHD1Q_ypdBKhYRVLrg_kf4L8LdXk8rgiiSQjtmoC=jyRv5M5jQ@mail.gmail.com>
To: Wols Lists <antlists@youngman.org.uk>,
	linux-raid <linux-raid@vger.kernel.org>
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
Message-ID: <8a55b0b6-25a9-d76b-1a6a-8aaed8bde8a7@canonical.com>
Date: Tue, 3 Sep 2019 16:53:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHD1Q_ypdBKhYRVLrg_kf4L8LdXk8rgiiSQjtmoC=jyRv5M5jQ@mail.gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.68]); Tue, 03 Sep 2019 19:53:34 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.68]);
	Tue, 03 Sep 2019 19:53:34 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.68
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: Song Liu <songliubraving@fb.com>, Song Liu <liu.song.a23@gmail.com>,
	NeilBrown <neilb@suse.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v3 1/2] md raid0/linear: Mark array as
 'broken' and fail BIOs if a member is gone
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.71]); Wed, 04 Sep 2019 08:53:27 +0000 (UTC)

On 30/08/2019 08:25, Guilherme Piccoli wrote:
> Thanks a lot for all the suggestions Song, Neil and Wol - I'll
> implement them and resubmit
> (hopefully) Monday.
> 
> Cheers,
> 
> 
> Guilherme
> 

V4 sent:
https://lore.kernel.org/linux-block/20190903194901.13524-1-gpiccoli@canonical.com/T/#t

Wols, in order to reduce code size and for clarity, I've kept the helper
as "is_mddev_broken()" - thanks for the suggestion anyway!
Cheers,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
