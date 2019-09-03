Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 93778A7E6E
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 10:53:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5D8F2026F;
	Wed,  4 Sep 2019 08:53:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 778C85DA21;
	Wed,  4 Sep 2019 08:53:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 127161800B74;
	Wed,  4 Sep 2019 08:53:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83MKE5g029215 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 18:20:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 173B45DAAE; Tue,  3 Sep 2019 22:20:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx28.extmail.prod.ext.phx2.redhat.com
	[10.5.110.69])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 123735DAAD
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 22:20:11 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E1AB98A1C82
	for <dm-devel@redhat.com>; Tue,  3 Sep 2019 22:20:10 +0000 (UTC)
Received: from mail-qt1-f199.google.com ([209.85.160.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i5H9l-0002ku-B9
	for dm-devel@redhat.com; Tue, 03 Sep 2019 22:20:09 +0000
Received: by mail-qt1-f199.google.com with SMTP id x11so20560575qtm.11
	for <dm-devel@redhat.com>; Tue, 03 Sep 2019 15:20:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=u0k3XnaaOH+YvkPPo0BqIKxocTRXrQHC0zFyGWZv4eg=;
	b=DdaivxCBpf8dhHgMScOtcgoMxkGwM8tHtNmZ6yShLSERLcm3lMhiPLLEIoyRw4qR9+
	ZX0r34rvMKsbvpdiMuMYehErMALhJvZqrjUHJOtyXzu0dfwJABcTCShaFCR/XQh8lF6a
	yMuGY1/FLjDHU/1hedom4dhVtAtRas29vV18eln9DtNhKPH8T81Hsr0LYK7AVbGazNSL
	Ht8bfAIoxVAkYMdfpTz2chFK6ODVfexDGFqDOPi0WUXGVtE1m3aQkHEknrhC0mcq3gOV
	PFFPoAqFuDinIs4qgNIxHWi4n7e9jciZXnpkwTQDOyj4VFi1Ebyz7DM3xk1VuGK6rr46
	xxIA==
X-Gm-Message-State: APjAAAUSh6oegiBWmQifkqBiOVKwLknj9yVPeHTcvV9YASmk4xMBCEP0
	XB3R5pcaELArTkXxB2j+tEMXzF7DzOvn4vg8Z1SqzHRBbpH8a+RpfnquGzamcX8p4fpUzJWELsw
	dgsnAB3N5A1fcYbKiVUbsx+KPxOxckg==
X-Received: by 2002:a37:4a8d:: with SMTP id
	x135mr35319759qka.472.1567549208183; 
	Tue, 03 Sep 2019 15:20:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxu1D2zYJ06nd5yZW9zEhNaIRg1S5Xyi0L1I8Gx7RslRfRbxnXGaaDntVnwvIFQ9lx3oP6aXw==
X-Received: by 2002:a37:4a8d:: with SMTP id
	x135mr35319746qka.472.1567549208041; 
	Tue, 03 Sep 2019 15:20:08 -0700 (PDT)
Received: from [192.168.1.203] (201-93-37-171.dial-up.telesp.net.br.
	[201.93.37.171]) by smtp.gmail.com with ESMTPSA id
	r19sm10188022qte.63.2019.09.03.15.20.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 15:20:07 -0700 (PDT)
To: Song Liu <songliubraving@fb.com>
References: <20190903194901.13524-1-gpiccoli@canonical.com>
	<E393EAA5-6A9D-464A-A70E-56A258559712@fb.com>
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
Message-ID: <cfb3d90f-ff93-7ddd-9178-7542cab3b17b@canonical.com>
Date: Tue, 3 Sep 2019 19:20:02 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <E393EAA5-6A9D-464A-A70E-56A258559712@fb.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.69]); Tue, 03 Sep 2019 22:20:11 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]);
	Tue, 03 Sep 2019 22:20:11 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.69
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 04 Sep 2019 04:53:21 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"jes.sorensen@gmail.com" <jes.sorensen@gmail.com>,
	"nfbrown@suse.com" <nfbrown@suse.com>,
	"liu.song.a23@gmail.com" <liu.song.a23@gmail.com>,
	linux-raid <linux-raid@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"jay.vosburgh@canonical.com" <jay.vosburgh@canonical.com>
Subject: Re: [dm-devel] [PATCH v4 1/2] md raid0/linear: Mark array as
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Wed, 04 Sep 2019 08:53:30 +0000 (UTC)

On 03/09/2019 18:56, Song Liu wrote:
> [...] 
> Applied to md-next. 
> 
> Thanks!
> 

Thanks a lot Song!
How can we get the mdadm counterpart applied?

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
