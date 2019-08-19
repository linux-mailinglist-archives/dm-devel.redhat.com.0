Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C312895A0C
	for <lists+dm-devel@lfdr.de>; Tue, 20 Aug 2019 10:44:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EA3623090FD3;
	Tue, 20 Aug 2019 08:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 547615FCA6;
	Tue, 20 Aug 2019 08:44:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C57D018005B9;
	Tue, 20 Aug 2019 08:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7JJBafK023453 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Aug 2019 15:11:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C5CA1DC; Mon, 19 Aug 2019 19:11:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 67A611DA
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 19:11:33 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 218A93082B5A
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 19:11:33 +0000 (UTC)
Received: from mail-pl1-f198.google.com ([209.85.214.198])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1hzn3z-0004bD-Gx
	for dm-devel@redhat.com; Mon, 19 Aug 2019 19:11:31 +0000
Received: by mail-pl1-f198.google.com with SMTP id c14so2544569plo.12
	for <dm-devel@redhat.com>; Mon, 19 Aug 2019 12:11:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=/ySB6YO3oF918LqImPkt1biBidhOND2V5EhnMg++S00=;
	b=pJxaprSsGthypxpkewwLSX79FKXFfXZ2eL6JBi/6UtE/ZoqJkvIyBOIMyzyhHoHHBt
	lW9pXEqCEezucr8SYibvSCNJEQ+tR7vnIcMoNTKJtUnExft9Yj+OLXPbXAeNbHSi+8LG
	RZO3SntSY5U69NzSma8POU9s2slLFOmjJtjGZiM8oj3bpl6u8yUkFedFOIc92ppLepO4
	Dml4Rbz+2kU9nHlc5ENg27+BHtBAv5oQ5WGW2QHgAIhG0teWhWA/x9H9pHklP4LhwScI
	JSnaCJZH7bNXsd8KGtTpmNuiG/bP1SE/qaf26hXdNaufcN2uA1Ue7wgh+jDUuzFzUOuM
	mYjQ==
X-Gm-Message-State: APjAAAWJKOJtCIC4iJptL8tEGFcX/VYr3XLlhBmsREHFUvfFL3z9VcCz
	CIgMG30uDApHtMWRIuB9turlkvgyn9ncvHYQWT3VCYQDP6HLJZCbFB2M5JQBLAtqZidONj9tGuW
	I9ih7twwe2UOPVR+X5fjN2u3yErhG4w==
X-Received: by 2002:a17:902:461:: with SMTP id
	88mr22927480ple.296.1566241890274; 
	Mon, 19 Aug 2019 12:11:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzNEpRGwYs6DWGIGDDRFL2S18tMDGGxhnrBNm+6nd3jyDBZ1FXzsMTaP2clZai7ya03x177uA==
X-Received: by 2002:a17:902:461:: with SMTP id
	88mr22927463ple.296.1566241890108; 
	Mon, 19 Aug 2019 12:11:30 -0700 (PDT)
Received: from [192.168.1.75] ([191.13.19.2]) by smtp.gmail.com with ESMTPSA id
	a15sm20256729pfg.102.2019.08.19.12.11.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Aug 2019 12:11:29 -0700 (PDT)
To: Song Liu <songliubraving@fb.com>
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<CAPhsuW7aGze5p9DgNAe=KakJGXTNqRZpNCtvi8nKxzS2MPXrNQ@mail.gmail.com>
	<1f16110b-b798-806f-638b-57bbbedfea49@canonical.com>
	<1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
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
Message-ID: <4c95f76c-dfbc-150c-2950-d34521d1e39d@canonical.com>
Date: Mon, 19 Aug 2019 16:11:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1725F15D-7CA2-4B8D-949A-4D8078D53AA9@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.45]); Mon, 19 Aug 2019 19:11:33 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Mon, 19 Aug 2019 19:11:33 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Aug 2019 04:43:46 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Song Liu <liu.song.a23@gmail.com>, NeilBrown <neilb@suse.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Jay Vosburgh <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v2 1/2] md raid0/linear: Introduce new array
 state 'broken'
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Tue, 20 Aug 2019 08:44:10 +0000 (UTC)

On 19/08/2019 15:57, Song Liu wrote:
>[...] 
> 
> I was thinking, if we can set MD_BROKEN when the device fails, we can 
> just test MD_BROKEN in array_state_show() (instead of iterating through 
> all devices). 
> 
> Would this work?
> 
> Thanks,
> Song
> 

This could work, but will require some refactors; it'll simplify the
check for a healthy array (no need for is_missing_dev() function) but
will complicate the criteria to clear MD_BROKEN and the detection of
more members failing (we would stop the detection after the 1st failure
if we only test MD_BROKEN).

We will always need to test the GENHD_FL_UP in some code path, to be
able to show users device recovered from a failure.
Where do you suggest to test this flag?

Thanks,


Guilherme

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
