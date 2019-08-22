Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9E9AF96
	for <lists+dm-devel@lfdr.de>; Fri, 23 Aug 2019 14:35:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A1F8364042;
	Fri, 23 Aug 2019 12:35:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0949E60467;
	Fri, 23 Aug 2019 12:35:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7423B1802220;
	Fri, 23 Aug 2019 12:35:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7MFZfrx028926 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 22 Aug 2019 11:35:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A52311001B17; Thu, 22 Aug 2019 15:35:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F7081001925
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 15:35:39 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com
	[91.189.89.112]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 86ED58553F
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 15:35:38 +0000 (UTC)
Received: from mail-qk1-f199.google.com ([209.85.222.199])
	by youngberry.canonical.com with esmtps
	(TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim 4.76)
	(envelope-from <gpiccoli@canonical.com>) id 1i0p7g-0004Df-Ve
	for dm-devel@redhat.com; Thu, 22 Aug 2019 15:35:37 +0000
Received: by mail-qk1-f199.google.com with SMTP id s23so6217951qkg.1
	for <dm-devel@redhat.com>; Thu, 22 Aug 2019 08:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=M5EnEAL/bRHik5jIOYUY0D3cuVp93WL25phV5a6tTNk=;
	b=rBQy+3ejvy2/xah1GmuOk1tNp1zHBs/DNTnwzQYAakbRAPYpC3cmqZs5qHLzM/kb+C
	ng2dl10ratL+1itA0xUV3aHfCYH9/YR73+0kDdvtMo1DiM93VDJOWFN2RGEzzPVZT9jr
	COdSI+YkrIfzQGLHpnHdXayuJDnUKkt+yMZHHvL/wz/taqYhLuw8xocUH4ruwDM/SIjr
	vCEDXvDwyale+UDRmKe7pdNkoBU0dg4XuZNx57OTkg1nVgQ5vdH/71eoqyTMUedrD0Pj
	T04kdMt854rpZRy9+AQkcDkN5HXB5UQk/Z29a4QInHNB6O3dRHBNQz8iebgg1VIrnMYU
	d6Kw==
X-Gm-Message-State: APjAAAWslZBvt7gW3xf0LREuL6dmmMRqMWmyo7HDnskt4dQjLUP9S/4U
	PMT3jOkC+t2kudg00NSoQ1tlG9pWMTCKWuc9V+3lYn6OlDpo77g6YHcRGKx4bfiTTMWGSzNlBu2
	zVzEIpwU3Vfy5lEOUCk1pa6Q7PC5lLA==
X-Received: by 2002:ae9:f441:: with SMTP id z1mr36860734qkl.211.1566488136231; 
	Thu, 22 Aug 2019 08:35:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxGzdLjvFv92ssETOIZN4joGmP6jTkywjUBlxfV0PqGlqrsA2O7elyclc9RFTHookRnGHw+RA==
X-Received: by 2002:ae9:f441:: with SMTP id z1mr36860714qkl.211.1566488136021; 
	Thu, 22 Aug 2019 08:35:36 -0700 (PDT)
Received: from [192.168.1.75] ([191.13.61.137])
	by smtp.gmail.com with ESMTPSA id
	w1sm11867390qte.36.2019.08.22.08.35.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 Aug 2019 08:35:35 -0700 (PDT)
To: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, linux-raid@vger.kernel.org
References: <20190816134059.29751-1-gpiccoli@canonical.com>
	<ca2096ca-8cb2-468f-89d4-24cd059b8a6b@cloud.ionos.com>
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
Message-ID: <51d10dea-4148-6a2c-8e70-7cc977ce1def@canonical.com>
Date: Thu, 22 Aug 2019 12:35:31 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ca2096ca-8cb2-468f-89d4-24cd059b8a6b@cloud.ionos.com>
Content-Language: en-US
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.28]); Thu, 22 Aug 2019 15:35:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Thu, 22 Aug 2019 15:35:38 +0000 (UTC) for IP:'91.189.89.112'
	DOMAIN:'youngberry.canonical.com'
	HELO:'youngberry.canonical.com' FROM:'gpiccoli@canonical.com'
	RCPT:''
X-RedHat-Spam-Score: -4.998  (RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_NONE) 91.189.89.112 youngberry.canonical.com
	91.189.89.112 youngberry.canonical.com <gpiccoli@canonical.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 23 Aug 2019 08:34:47 -0400
Cc: linux-block@vger.kernel.org, jay.vosburgh@canonical.com,
	dm-devel@redhat.com, Song Liu <songliubraving@fb.com>,
	NeilBrown <neilb@suse.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Fri, 23 Aug 2019 12:35:10 +0000 (UTC)

T24gMjIvMDgvMjAxOSAwNTo0OSwgR3VvcWluZyBKaWFuZyB3cm90ZToKPiBIaSwKCkhpIEd1b3Fp
bmcsIHRoYW5rcyBmb3IgdGhlIHJldmlldyEKCgo+IAo+IE9uIDgvMTYvMTkgMzo0MCBQTSwgR3Vp
bGhlcm1lIEcuIFBpY2NvbGkgd3JvdGU6Cj4+ICtzdGF0aWMgYm9vbCBsaW5lYXJfaXNfbWlzc2lu
Z19kZXYoc3RydWN0IG1kZGV2ICptZGRldikKPj4gK3sKPj4gK8KgwqDCoCBzdHJ1Y3QgbWRfcmRl
diAqcmRldjsKPj4gK8KgwqDCoCBzdGF0aWMgaW50IGFscmVhZHlfbWlzc2luZzsKPj4gK8KgwqDC
oCBpbnQgZGVmX2Rpc2tzLCB3b3JrX2Rpc2tzID0gMDsKPj4gKwo+PiArwqDCoMKgIGRlZl9kaXNr
cyA9IG1kZGV2LT5yYWlkX2Rpc2tzOwo+PiArwqDCoMKgIHJkZXZfZm9yX2VhY2gocmRldiwgbWRk
ZXYpCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAocmRldi0+YmRldi0+YmRfZGlzay0+ZmxhZ3MgJiBH
RU5IRF9GTF9VUCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgd29ya19kaXNrcysrOwo+PiAr
Cj4+ICvCoMKgwqAgaWYgKHVubGlrZWx5KGRlZl9kaXNrcyAtIHdvcmtfZGlza3MpKSB7Cj4gCj4g
SWYgbXkgdW5kZXJzdGFuZGluZyBpcyBjb3JyZWN0LCBhZnRlciBlbnRlciB0aGUgYnJhbmNoLAo+
IAo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGFscmVhZHlfbWlzc2luZyA8IChkZWZfZGlza3MgLSB3
b3JrX2Rpc2tzKSkgewo+IAo+IHRoZSBhYm92ZSBpcyBhbHdheXMgdHJ1ZSBzaW5jZSBhbHJlYWR5
X21pc3Npbmcgc2hvdWxkIGJlICcwJywgcmlnaHQ/Cj4gSWYgc28sIG1heWJlIHRoZSBhYm92ZSBj
aGVja2luZyBpcyBwb2ludGxlc3MuCgpUaGUgdmFyaWFibGUgJ2FscmVhZHlfbWlzc2luZycgaXMg
c3RhdGljLCBzbyBpbmRlZWQgaXQgc3RhcnRzIHdpdGggMC4KV2hlbiB0aGVyZSBhcmUgbWlzc2lu
ZyBkaXNrcywgd2UnbGwgZW50ZXIgdGhlICdpZihkZWZfZGlza3MgLQp3b3JrX2Rpc2tzKScgYW5k
IGluZGVlZCBwcmludCB0aGUgbWVzc2FnZS4gQnV0IG5vdGljZSB3ZSdsbCBzZXQKJ2FscmVhZHlf
bWlzc2luZyA9IGRlZl9kaXNrcyAtIHdvcmtfZGlza3MnLCBzbyB3ZSB3b24ndCBlbnRlciB0aGUg
aWYgYW5kCnByaW50IHRoZSBtZXNzYWdlIGFueW1vcmUgX3VubGVzc18gYSBuZXcgbWVtYmVyIGlz
IHJlbW92ZWQgYW5kCidhbHJlYWR5X21pc3NpbmcnIGdldHMgdW5iYWxhbmNlZCB3aXRoIHJlZ2Fy
ZHMgdG8gJ2RlZl9kaXNrcyAtIHdvcmtfZGlza3MnLgoKVGhlIGlkZWEgYmVoaW5kIGl0IGlzIHRv
IHNob3cgYSBzaW5nbGUgbWVzc2FnZSB3aGVuZXZlciBhIG5ldyBtZW1iZXIgaXMKcmVtb3ZlZC4g
VGhlIHVzZSBvZiBhIHN0YXRpYyB2YXJpYWJsZSBhbGxvd3MgdXMgdG8gZG8gdGhhdC4KCk5ldmVy
dGhlbGVzcywgdGhpcyBwYXRoIHdpbGwgYmUgZHJvcHBlZCBpbiB0aGUgVjMgdGhhdCBpcyByZWFk
eSB0byBiZSBzZW50LgpDaGVlcnMsCgoKR3VpbGhlcm1lCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxp
c3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlz
dGluZm8vZG0tZGV2ZWw=
