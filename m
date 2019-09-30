Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 91729C2EB0
	for <lists+dm-devel@lfdr.de>; Tue,  1 Oct 2019 10:15:26 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6765A30917AF;
	Tue,  1 Oct 2019 08:15:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3475F60166;
	Tue,  1 Oct 2019 08:15:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C7ED4E58A;
	Tue,  1 Oct 2019 08:15:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8UJeNjh004105 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Sep 2019 15:40:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5EE1E19C7F; Mon, 30 Sep 2019 19:40:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5920519C58
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 19:40:21 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2891210C0943
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 19:40:20 +0000 (UTC)
Received: from mail-pf1-f200.google.com ([209.85.210.200])
	by youngberry.canonical.com with esmtps
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
	(envelope-from <gpiccoli@canonical.com>) id 1iF1Ws-00057e-Nw
	for dm-devel@redhat.com; Mon, 30 Sep 2019 19:40:18 +0000
Received: by mail-pf1-f200.google.com with SMTP id a1so8568558pfn.1
	for <dm-devel@redhat.com>; Mon, 30 Sep 2019 12:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=09P9hryk4X9pxrU6lU1eu8xnMAXUu4sGNFiOeA8zkAc=;
	b=GlpqzuLcMEGSgppuzzguCKxD4bZ+DkX+3HgkZca8BbmOl3FFqXPfnzC28qJF1x85Nu
	VOSUMvRPWKQ7M57911mHjpfSGMZlAbCfr1ZqyIzOrJr8JLJO07x3JKDaqygkJfRQftIe
	MQBESx4vUFrtJDU0rUNgdWC7UFW1jO/m5QDG417DUQ80KVGepiTFjxvbfx8FVXpSMFmY
	xHDkP8Hf3bnSAhQvqG4qXsJ7P7B/vJkv+WGZciynfQG8U6wLhCmAzsZhdcIPv0sOnXAK
	NsZ5ytN+NcsCBXMGV3t/BOe9PwQ881kqepEdkyVpcS96ugrKXkkpnvZBRRTln7FZV3np
	k6mQ==
X-Gm-Message-State: APjAAAXwnovohKktZHpiw+by3I35VCQFv2skFh+fkHEWxIAF3VCTsKI6
	KxiqFs2fOw94AHLspuw+4nM9wd/hb31f7oQ2q+YDZMk8aYE7XW5rqpqm7GCTwnWQJpV4GDC7Xff
	H2s1LVHjEy0aB5xtWrCSYbu0WEYOXZw==
X-Received: by 2002:a17:90a:264a:: with SMTP id
	l68mr1039497pje.74.1569872417342; 
	Mon, 30 Sep 2019 12:40:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwZ8h4rNs89cKWhr/JmybSS+4c+v6Mw1oFylzJu67DnGjq96+R4Zln+w1cF96kir99q9ot53A==
X-Received: by 2002:a17:90a:264a:: with SMTP id
	l68mr1039458pje.74.1569872416994; 
	Mon, 30 Sep 2019 12:40:16 -0700 (PDT)
Received: from [192.168.1.75] (201-0-39-188.dsl.telesp.net.br. [201.0.39.188])
	by smtp.gmail.com with ESMTPSA id
	o60sm373324pje.21.2019.09.30.12.40.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 30 Sep 2019 12:40:15 -0700 (PDT)
To: Jes Sorensen <jes.sorensen@gmail.com>, linux-raid@vger.kernel.org
References: <20190903194901.13524-1-gpiccoli@canonical.com>
	<20190903194901.13524-2-gpiccoli@canonical.com>
	<608284db-7b82-6545-74bf-7a9f1d578c2f@gmail.com>
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
Message-ID: <a7796eb4-f28f-9360-2ad2-a76d472c2e4c@canonical.com>
Date: Mon, 30 Sep 2019 16:40:05 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <608284db-7b82-6545-74bf-7a9f1d578c2f@gmail.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Mon, 30 Sep 2019 19:40:20 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Mon, 30 Sep 2019 19:40:20 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 01 Oct 2019 04:14:27 -0400
Cc: nfbrown@suse.com, Song Liu <songliubraving@fb.com>, liu.song.a23@gmail.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	jay.vosburgh@canonical.com
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 01 Oct 2019 08:15:25 +0000 (UTC)

T24gMzAvMDkvMjAxOSAxNjozNiwgSmVzIFNvcmVuc2VuIHdyb3RlOgo+IFsuLi5dCj4gQXBwbGll
ZCB0aGFua3MhCj4gCj4gSSBmaXhlZCB1cCBvbmUgbWlub3Igbml0IHJhdGhlciB0aGFuIGhhdmlu
ZyB0byBkbyB0aGUgbWVycnktZ28tcm91bmQgYnkKPiBlbWFpbCBvbmUgbW9yZSB0aW1lOgo+IAo+
PiBkaWZmIC0tZ2l0IGEvTW9uaXRvci5jIGIvTW9uaXRvci5jCj4+IGluZGV4IDAzNjEwM2YuLmNm
MDYxMGIgMTAwNjQ0Cj4+IC0tLSBhL01vbml0b3IuYwo+PiArKysgYi9Nb25pdG9yLmMKPiBbc25p
cF0KPiAKPj4gQEAgLTExMTYsNyArMTExOSw4IEBAIGludCBXYWl0Q2xlYW4oY2hhciAqZGV2LCBp
bnQgdmVyYm9zZSkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnYgPSByZWFkKHN0YXRl
X2ZkLCBidWYsIHNpemVvZihidWYpKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHJ2IDwgMCkKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHN5c2ZzX21hdGNoX3dvcmQoYnVmLCBjbGVhbl9z
dGF0ZXMpIDw9IDQpCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzeXNmc19tYXRjaF93
b3JkKGJ1ZiwgY2xlYW5fc3RhdGVzKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IDwgKGludClBUlJBWV9TSVpFKGNsZWFuX3N0YXRlcyktMSkKPiAKPiBJIG1vdmVkIHRoZSA8IHVw
IHRvIHRoZSBjb3JyZWN0IGxpbmUgd2hlcmUgaXQgYmVsb25ncywgYW5kIGFkZGVkIHNwYWNlcwo+
ICIpIC0gMSkiCj4gCj4gQ2hlZXJzLAo+IEplcwoKClRoYW5rcyBhIGxvdCBKZXMsIG11Y2ggYXBw
cmVjaWF0ZWQhCkNoZWVycywKCgpHdWlsaGVybWUKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApk
bS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kbS1kZXZlbA==
