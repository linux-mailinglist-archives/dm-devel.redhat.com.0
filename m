Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F6E550D8
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 15:54:02 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6AE38308FEC4;
	Tue, 25 Jun 2019 13:53:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6A0608A5;
	Tue, 25 Jun 2019 13:53:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B273206D2;
	Tue, 25 Jun 2019 13:53:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PD4I9m019275 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 09:04:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 93B515D9DC; Tue, 25 Jun 2019 13:04:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DE295D9D3
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 13:04:16 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44393C04AC69
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 13:03:57 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v18so16172364ljh.6
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=ARK2prxRV/r8YkWxnnbALm6Pw85xxSzYq4sr4VIfIYM=;
	b=UkrW7PyHLM+UCjb9yNI25LpeVNz39xUL9IGQsHEnSehYh9reiTPFnLo9YPWm1VgUAc
	0iCj70AO4HDdbWbKWKBvit4BXpFxpcEmJdZgNglmsuoJpiC10Z+jxs47WMxyb1WCErIb
	FiKkEPSVJqpgSegB1A3nSFoIwkdDlBue8EQuXk4W+9hdJ6Xd4dofZmW9UCkfHjJXMrjv
	Rl2mK+FyUsa9j/j3NsMT2RIF/rou5i5LIu3ieZQNbeJR5r4vOIpeVXfdr0Nru4t6hS52
	RqELOSABdrgUuyBHfbFUkYMtJk9+xnk7Nd4WkJxmJMxYM+WQ0wlgaGE7cufyyBvINyWJ
	S9mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ARK2prxRV/r8YkWxnnbALm6Pw85xxSzYq4sr4VIfIYM=;
	b=XSegrFFKjJ3C6HucGueAU3kQTb8427tvTVcbcWOsQ/ELNRqWi071E/S0mN6MnuCRD+
	2AOkCtGio2SsDaOYwimBI4P2HJ/Z7Aosbrck4yf2O6N8QRTTXlHLlIj0qeq8iZDVsVhq
	dwKUd5A7s6VCXy5ESxlldNvBxqGCzQ+FaKjHI7cbA9eKiC7yhLLKUruJWF5eKpYEZ3tt
	2mhDCFUwnpnZehWmnJYcuGGRtCnOTNSBZFAstADwowM6QTVvDoIYCQi0ZliFHx51rAfV
	Hb6EdZ2lcnbMSWYY5H3bVNxvNDWpR5JcLHFeceSTf1Dywe66MQguo+bFsCeQHrIt5VPz
	E2iQ==
X-Gm-Message-State: APjAAAXcPOKPrLncOgrjRAbP/aIxg8YKEjBdTt5AQFbkYMtG9KIeLA0p
	t28G7285si8fNb7zy87tlCy6og==
X-Google-Smtp-Source: APXvYqxHO1flsaGt4P5qYTOlxVD2HC4muB9gcro4b9JaKCo31KcUlf6dWiReFri6tJtYcHieGpJY+w==
X-Received: by 2002:a2e:9e1a:: with SMTP id e26mr18452425ljk.158.1561467835635;
	Tue, 25 Jun 2019 06:03:55 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225]) by smtp.googlemail.com with ESMTPSA id
	x22sm1972057lfq.20.2019.06.25.06.03.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 06:03:54 -0700 (PDT)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, "axboe@fb.com" <axboe@fb.com>,
	"hch@lst.de" <hch@lst.de>, Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-3-mb@lightnvm.io>
	<BYAPR04MB5816D471063D970DDCF9AEC7E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
	<1aa6552c-ecf9-a168-df75-ec8c52ddbea6@lightnvm.io>
	<BYAPR04MB581665C81B89838BC022BF7BE7E30@BYAPR04MB5816.namprd04.prod.outlook.com>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <f70736f5-4edf-c925-d22a-a3238761da90@lightnvm.io>
Date: Tue, 25 Jun 2019 15:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB581665C81B89838BC022BF7BE7E30@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 25 Jun 2019 13:03:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Tue, 25 Jun 2019 13:03:57 +0000 (UTC) for IP:'209.85.208.195'
	DOMAIN:'mail-lj1-f195.google.com'
	HELO:'mail-lj1-f195.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.195 mail-lj1-f195.google.com 209.85.208.195
	mail-lj1-f195.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 09:50:33 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
Subject: Re: [dm-devel] [PATCH 2/4] null_blk: add zone open, close,
	and finish support
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Tue, 25 Jun 2019 13:54:00 +0000 (UTC)

T24gNi8yNS8xOSAyOjM2IFBNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDE5LzA2LzI1
IDIwOjA2LCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+PiBPbiA2LzIyLzE5IDM6MDIgQU0sIERh
bWllbiBMZSBNb2FsIHdyb3RlOgo+Pj4gT24gMjAxOS8wNi8yMSAyMjowNywgTWF0aWFzIEJqw7hy
bGluZyB3cm90ZToKPj4+PiBGcm9tOiBBamF5IEpvc2hpIDxhamF5Lmpvc2hpQHdkYy5jb20+Cj4+
Pj4KPj4+PiBJbXBsZW1lbnQgUkVRX09QX1pPTkVfT1BFTiwgUkVRX09QX1pPTkVfQ0xPU0UgYW5k
IFJFUV9PUF9aT05FX0ZJTklTSAo+Pj4+IHN1cHBvcnQgdG8gYWxsb3cgZXhwbGljaXQgY29udHJv
bCBvZiB6b25lIHN0YXRlcy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFqYXkgSm9zaGkgPGFq
YXkuam9zaGlAd2RjLmNvbT4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBNYXRpYXMgQmrDuHJsaW5nIDxt
YXRpYXMuYmpvcmxpbmdAd2RjLmNvbT4KPj4+PiAtLS0KPj4+PiAgICBkcml2ZXJzL2Jsb2NrL251
bGxfYmxrLmggICAgICAgfCAgNCArKy0tCj4+Pj4gICAgZHJpdmVycy9ibG9jay9udWxsX2Jsa19t
YWluLmMgIHwgMTMgKysrKysrKysrKy0tLQo+Pj4+ICAgIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtf
em9uZWQuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLQo+Pj4+ICAgIDMg
ZmlsZXMgY2hhbmdlZCwgNDIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmggYi9kcml2ZXJzL2Jsb2NrL251
bGxfYmxrLmgKPj4+PiBpbmRleCAzNGIyMmQ2NTIzYmEuLjYyZWY2NWNiMGYzZSAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmgKPj4+PiArKysgYi9kcml2ZXJzL2Jsb2Nr
L251bGxfYmxrLmgKPj4+PiBAQCAtOTMsNyArOTMsNyBAQCBpbnQgbnVsbF96b25lX3JlcG9ydChz
dHJ1Y3QgZ2VuZGlzayAqZGlzaywgc2VjdG9yX3Qgc2VjdG9yLAo+Pj4+ICAgIAkJICAgICBnZnBf
dCBnZnBfbWFzayk7Cj4+Pj4gICAgdm9pZCBudWxsX3pvbmVfd3JpdGUoc3RydWN0IG51bGxiX2Nt
ZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IsCj4+Pj4gICAgCQkJdW5zaWduZWQgaW50IG5yX3NlY3Rv
cnMpOwo+Pj4+IC12b2lkIG51bGxfem9uZV9yZXNldChzdHJ1Y3QgbnVsbGJfY21kICpjbWQsIHNl
Y3Rvcl90IHNlY3Rvcik7Cj4+Pj4gK3ZvaWQgbnVsbF96b25lX21nbXRfb3Aoc3RydWN0IG51bGxi
X2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpOwo+Pj4+ICAgICNlbHNlCj4+Pj4gICAgc3RhdGlj
IGlubGluZSBpbnQgbnVsbF96b25lX2luaXQoc3RydWN0IG51bGxiX2RldmljZSAqZGV2KQo+Pj4+
ICAgIHsKPj4+PiBAQCAtMTExLDYgKzExMSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBudWxsX3pv
bmVfd3JpdGUoc3RydWN0IG51bGxiX2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IsCj4+Pj4gICAg
CQkJCSAgIHVuc2lnbmVkIGludCBucl9zZWN0b3JzKQo+Pj4+ICAgIHsKPj4+PiAgICB9Cj4+Pj4g
LXN0YXRpYyBpbmxpbmUgdm9pZCBudWxsX3pvbmVfcmVzZXQoc3RydWN0IG51bGxiX2NtZCAqY21k
LCBzZWN0b3JfdCBzZWN0b3IpIHt9Cj4+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBudWxsX3pvbmVf
bWdtdF9vcChzdHJ1Y3QgbnVsbGJfY21kICpjbWQsIHNlY3Rvcl90IHNlY3Rvcikge30KPj4+PiAg
ICAjZW5kaWYgLyogQ09ORklHX0JMS19ERVZfWk9ORUQgKi8KPj4+PiAgICAjZW5kaWYgLyogX19O
VUxMX0JMS19IICovCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFp
bi5jIGIvZHJpdmVycy9ibG9jay9udWxsX2Jsa19tYWluLmMKPj4+PiBpbmRleCA0NDdkNjM1Yzc5
YTIuLjUwNThmYjk4MGM5YyAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxr
X21haW4uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFpbi5jCj4+Pj4gQEAg
LTEyMDksMTAgKzEyMDksMTcgQEAgc3RhdGljIGJsa19zdGF0dXNfdCBudWxsX2hhbmRsZV9jbWQo
c3RydWN0IG51bGxiX2NtZCAqY21kKQo+Pj4+ICAgIAkJCW5yX3NlY3RvcnMgPSBibGtfcnFfc2Vj
dG9ycyhjbWQtPnJxKTsKPj4+PiAgICAJCX0KPj4+PiAgICAKPj4+PiAtCQlpZiAob3AgPT0gUkVR
X09QX1dSSVRFKQo+Pj4+ICsJCXN3aXRjaCAob3ApIHsKPj4+PiArCQljYXNlIFJFUV9PUF9XUklU
RToKPj4+PiAgICAJCQludWxsX3pvbmVfd3JpdGUoY21kLCBzZWN0b3IsIG5yX3NlY3RvcnMpOwo+
Pj4+IC0JCWVsc2UgaWYgKG9wID09IFJFUV9PUF9aT05FX1JFU0VUKQo+Pj4+IC0JCQludWxsX3pv
bmVfcmVzZXQoY21kLCBzZWN0b3IpOwo+Pj4+ICsJCQlicmVhazsKPj4+PiArCQljYXNlIFJFUV9P
UF9aT05FX1JFU0VUOgo+Pj4+ICsJCWNhc2UgUkVRX09QX1pPTkVfT1BFTjoKPj4+PiArCQljYXNl
IFJFUV9PUF9aT05FX0NMT1NFOgo+Pj4+ICsJCWNhc2UgUkVRX09QX1pPTkVfRklOSVNIOgo+Pj4+
ICsJCQludWxsX3pvbmVfbWdtdF9vcChjbWQsIHNlY3Rvcik7Cj4+Pj4gKwkJCWJyZWFrOwo+Pj4+
ICsJCX0KPj4+PiAgICAJfQo+Pj4+ICAgIG91dDoKPj4+PiAgICAJLyogQ29tcGxldGUgSU8gYnkg
aW5saW5lLCBzb2Z0aXJxIG9yIHRpbWVyICovCj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYmxv
Y2svbnVsbF9ibGtfem9uZWQuYyBiL2RyaXZlcnMvYmxvY2svbnVsbF9ibGtfem9uZWQuYwo+Pj4+
IGluZGV4IGZjYTBjOTdmZjFhYS4uNDdkOTU2YjJlMTQ4IDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZl
cnMvYmxvY2svbnVsbF9ibGtfem9uZWQuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvYmxvY2svbnVsbF9i
bGtfem9uZWQuYwo+Pj4+IEBAIC0xMjEsMTcgKzEyMSw0NCBAQCB2b2lkIG51bGxfem9uZV93cml0
ZShzdHJ1Y3QgbnVsbGJfY21kICpjbWQsIHNlY3Rvcl90IHNlY3RvciwKPj4+PiAgICAJfQo+Pj4+
ICAgIH0KPj4+PiAgICAKPj4+PiAtdm9pZCBudWxsX3pvbmVfcmVzZXQoc3RydWN0IG51bGxiX2Nt
ZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpCj4+Pj4gK3ZvaWQgbnVsbF96b25lX21nbXRfb3Aoc3Ry
dWN0IG51bGxiX2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpCj4+Pj4gICAgewo+Pj4+ICAgIAlz
dHJ1Y3QgbnVsbGJfZGV2aWNlICpkZXYgPSBjbWQtPm5xLT5kZXY7Cj4+Pj4gICAgCXVuc2lnbmVk
IGludCB6bm8gPSBudWxsX3pvbmVfbm8oZGV2LCBzZWN0b3IpOwo+Pj4+ICAgIAlzdHJ1Y3QgYmxr
X3pvbmUgKnpvbmUgPSAmZGV2LT56b25lc1t6bm9dOwo+Pj4+ICsJZW51bSByZXFfb3BmIG9wID0g
cmVxX29wKGNtZC0+cnEpOwo+Pj4+ICAgIAo+Pj4+ICAgIAlpZiAoem9uZS0+dHlwZSA9PSBCTEtf
Wk9ORV9UWVBFX0NPTlZFTlRJT05BTCkgewo+Pj4+ICAgIAkJY21kLT5lcnJvciA9IEJMS19TVFNf
SU9FUlI7Cj4+Pj4gICAgCQlyZXR1cm47Cj4+Pj4gICAgCX0KPj4+PiAgICAKPj4+PiAtCXpvbmUt
PmNvbmQgPSBCTEtfWk9ORV9DT05EX0VNUFRZOwo+Pj4+IC0Jem9uZS0+d3AgPSB6b25lLT5zdGFy
dDsKPj4+PiArCXN3aXRjaCAob3ApIHsKPj4+PiArCWNhc2UgUkVRX09QX1pPTkVfUkVTRVQ6Cj4+
Pj4gKwkJem9uZS0+Y29uZCA9IEJMS19aT05FX0NPTkRfRU1QVFk7Cj4+Pj4gKwkJem9uZS0+d3Ag
PSB6b25lLT5zdGFydDsKPj4+PiArCQlyZXR1cm47Cj4+Pj4gKwljYXNlIFJFUV9PUF9aT05FX09Q
RU46Cj4+Pj4gKwkJaWYgKHpvbmUtPmNvbmQgPT0gQkxLX1pPTkVfQ09ORF9GVUxMKSB7Cj4+Pj4g
KwkJCWNtZC0+ZXJyb3IgPSBCTEtfU1RTX0lPRVJSOwo+Pj4+ICsJCQlyZXR1cm47Cj4+Pj4gKwkJ
fQo+Pj4+ICsJCXpvbmUtPmNvbmQgPSBCTEtfWk9ORV9DT05EX0VYUF9PUEVOOwo+Pj4KPj4+Cj4+
PiBXaXRoIFpCQywgb3BlbiBvZiBhIGZ1bGwgem9uZSBpcyBhICJub3AiLiBObyBlcnJvci4gU28g
SSB3b3VsZCByYXRoZXIgaGF2ZSB0aGlzIGFzOgo+Pj4KPj4+IAkJaWYgKHpvbmUtPmNvbmQgIT0g
QkxLX1pPTkVfQ09ORF9GVUxMKQo+Pj4gCQkJem9uZS0+Y29uZCA9IEJMS19aT05FX0NPTkRfRVhQ
X09QRU47Cj4+PiAJCQo+PiBJcyB0aGlzIG9ubHkgWkJDPyBJIGNhbid0IGZpbmQgYSByZWZlcmVu
Y2UgdG8gaXQgaW4gWkFDLiBJIHRoaW5rIGl0Cj4+IHNob3VsZCBmYWlsLiBPbmUgaXMgdHJ5aW5n
IHRvIG9wZW4gYSB6b25lIHRoYXQgaXMgZnVsbCwgb25lIGNhbid0IG9wZW4KPj4gaXQgYWdhaW4u
IEl0J3MgZG9uZSBmb3IgdGhpcyByb3VuZC4KPiAKPiBQYWdlIDUyLzUzLCBzZWN0aW9uIDUuMi42
LjMuMjoKPiAKPiBJZiB0aGUgT1BFTiBBTEwgYml0IGlzIGNsZWFyZWQgdG8gemVybyBhbmQgdGhl
IHpvbmUgc3BlY2lmaWVkIGJ5IHRoZSBaT05FIElECj4gZmllbGQgKHNlZSA1LjIuNC4zLjMpIGlz
IGluIFpvbmUgQ29uZGl0aW9uOgo+IGEpIEVNUFRZLCBJTVBMSUNJVExZIE9QRU5FRCwgb3IgQ0xP
U0VELCB0aGVuIHRoZSBkZXZpY2Ugc2hhbGwgcHJvY2VzcyBhbgo+IEV4cGxpY2l0bHkgT3BlbiBa
b25lIGZ1bmN0aW9uCj4gKHNlZSA0LjYuMy40LjEwKSBmb3IgdGhlIHpvbmUgc3BlY2lmaWVkIGJ5
IHRoZSBaT05FIElEIGZpZWxkOwo+IGIpIEVYUExJQ0lUTFkgT1BFTkVEIG9yIEZVTEwsIHRoZW4g
dGhlIGRldmljZSBzaGFsbDoKPiAJQSkgbm90IGNoYW5nZSB0aGUgem9uZSdzIHN0YXRlOyBhbmQK
PiAJQikgcmV0dXJuIHN1Y2Nlc3NmdWwgY29tbWFuZCBjb21wbGV0aW9uOwo+IAo+Pj4KPj4+PiAr
CQlyZXR1cm47Cj4+Pj4gKwljYXNlIFJFUV9PUF9aT05FX0NMT1NFOgo+Pj4+ICsJCWlmICh6b25l
LT5jb25kID09IEJMS19aT05FX0NPTkRfRlVMTCkgewo+Pj4+ICsJCQljbWQtPmVycm9yID0gQkxL
X1NUU19JT0VSUjsKPj4+PiArCQkJcmV0dXJuOwo+Pj4+ICsJCX0KPj4+PiArCQl6b25lLT5jb25k
ID0gQkxLX1pPTkVfQ09ORF9DTE9TRUQ7Cj4+Pgo+Pj4gU2FtIGFzIGZvciBvcGVuLiBDbG9zaW5n
IGEgZnVsbCB6b25lIG9uIFpCQyBpcyBhIG5vcC4KPj4KPj4gSSB0aGluayB0aGlzIHNob3VsZCBj
YXVzZSBlcnJvci4KPiAKPiBTZWUgWkFCL1pBQyBjbG9zZSBjb21tYW5kIGRlc2NyaXB0aW9uLiBT
YW1lIHRleHQgYXMgYWJvdmUsIGFsbW9zdC4gTm90IGFuIGVycm9yLgo+IEl0IGlzIGEgbm9wLiBa
QUMgcGFnZSA0OCwgc2VjdGlvbiA1LjIuNC4zLjI6Cj4gCj4gSWYgdGhlIENMT1NFIEFMTCBiaXQg
aXMgY2xlYXJlZCB0byB6ZXJvIGFuZCB0aGUgem9uZSBzcGVjaWZpZWQgYnkgdGhlIFpPTkUgSUQK
PiBmaWVsZCAoc2VlIDUuMi40LjMuMykgaXMgaW4gWm9uZSBDb25kaXRpb246Cj4gYSkgSU1QTElD
SVRMWSBPUEVORUQsIG9yIEVYUExJQ0lUTFkgT1BFTkVELCB0aGVuIHRoZSBkZXZpY2Ugc2hhbGwg
cHJvY2VzcyBhCj4gQ2xvc2UgWm9uZSBmdW5jdGlvbgo+IChzZWUgNC42LjMuNC4xMSkgZm9yIHRo
ZSB6b25lIHNwZWNpZmllZCBieSB0aGUgWk9ORSBJRCBmaWVsZDsKPiBiKSBFTVBUWSwgQ0xPU0VE
LCBvciBGVUxMLCB0aGVuIHRoZSBkZXZpY2Ugc2hhbGw6Cj4gCUEpIG5vdCBjaGFuZ2UgdGhlIHpv
bmUncyBzdGF0ZTsgYW5kCj4gCUIpIHJldHVybiBzdWNjZXNzZnVsIGNvbW1hbmQgY29tcGxldGlv
bjsKPiAKPj4KPj4gQW5kIHRoZSBjb2RlIGFib3ZlIHdvdWxkCj4+PiBhbHNvIHNldCBhbiBlbXB0
eSB6b25lIHRvIGNsb3NlZC4gRmluYWxseSwgaWYgdGhlIHpvbmUgaXMgb3BlbiBidXQgbm90aGlu
ZyB3YXMKPj4+IHdyaXR0ZW4gdG8gaXQsIGl0IG11c3QgYmUgcmV0dXJuZWQgdG8gZW1wdHkgY29u
ZGl0aW9uLCBub3QgY2xvc2VkLgo+Pgo+PiBPbmx5IG9uIGEgcmVzZXQgZXZlbnQgcmlnaHQ/IElu
IGdlbmVyYWwsIGlmIEkgZG8gYSBleHBsLiBvcGVuLCBjbG9zZSBpdCwKPj4gaXQgc2hvdWxkIG5v
dCBnbyB0byBlbXB0eS4KPiAKPiBTZWUgdGhlIHpvbmUgc3RhdGUgbWFjaGluZS4gSXQgZG9lcyBy
ZXR1cm4gdG8gZW1wdHkgZnJvbSBleHBsIG9wZW4gaWYgbm90aGluZwo+IHdhcyB3cml0dGVuLCB0
aGF0IGlzLCBpZiB0aGUgV1AgaXMgc3RpbGwgYXQgem9uZSBzdGFydC4gVGhpcyB0ZXh0IGlzIGlu
IFpBQwo+IHNlY3Rpb24gNC42LjMuNC4xMSBhcyBub3RlZCBhYm92ZToKPiAKPiBGb3IgdGhlIHNw
ZWNpZmllZCB6b25lLCB0aGUgWm9uZSBDb25kaXRpb24gc3RhdGUgbWFjaGluZSBwcm9jZXNzaW5n
IG9mIHRoaXMKPiBmdW5jdGlvbiAoZS5nLiwgYXMgc2hvd24gaW4gdGhlIFpDMjogSW1wbGljaXRf
T3BlbiBzdGF0ZSAoc2VlIDQuNi4zLjQuMykpCj4gcmVzdWx0cyBpbiB0aGUgWm9uZSBDb25kaXRp
b24gZm9yIHRoZSBzcGVjaWZpZWQgem9uZSBiZWNvbWluZzoKPiBhKSBFTVBUWSwgaWYgdGhlIHdy
aXRlIHBvaW50ZXIgaW5kaWNhdGVzIHRoZSBsb3dlc3QgTEJBIGluIHRoZSB6b25lIGFuZCBOb24K
PiBTZXF1ZW50aWFsIFdyaXRlIFJlc291cmNlcyBBY3RpdmUgaXMgZmFsc2U7IG9yCj4gYikgQ0xP
U0VELCBpZiB0aGUgd3JpdGUgcG9pbnRlciBkb2VzIG5vdCBpbmRpY2F0ZSB0aGUgbG93ZXN0IExC
QSBpbiB0aGUgem9uZSBvcgo+IE5vbi1TZXF1ZW50aWFsIFdyaXRlIFJlc291cmNlcyBBY3RpdmUg
aXMgdHJ1ZS4KPiAKClNjaG9vbGVkISBUaGF0IGlzIHdoYXQgb25lIGdldHMgZnJvbSBoYXZpbmcg
dGhlIHNwZWMgaW4gcGFwZXIgZm9ybSBvbiAKdGhlIHRhYmxlIDspCgo+Pgo+PiBTbyBzb21ldGhp
bmcKPj4+IGxpa2UgdGhpcyBpcyBuZWVkZWQuCj4+Pgo+Pj4gCQlzd2l0Y2ggKHpvbmUtPmNvbmQp
IHsKPj4+IAkJY2FzZSBCTEtfWk9ORV9DT05EX0ZVTEw6Cj4+PiAJCWNhc2UgQkxLX1pPTkVfQ09O
RF9FTVBUWToKPj4+IAkJCWJyZWFrOwo+Pj4gCQljYXNlIEJMS19aT05FX0NPTkRfRVhQX09QRU46
Cj4+PiAJCQlpZiAoem9uZS0+d3AgPT0gem9uZS0+c3RhcnQpIHsKPj4+IAkJCQl6b25lLT5jb25k
ID0gQkxLX1pPTkVfQ09ORF9FTVBUWTsKPj4+IAkJCQlicmVhazsKPj4+IAkJCX0KPj4+IAkJLyog
ZmFsbHRocm91Z2ggKi8KPj4+IAkJZGVmYXVsdDoKPj4+IAkJCXpvbmUtPmNvbmQgPSBCTEtfWk9O
RV9DT05EX0NMT1NFRDsKPj4+IAkJfQo+Pj4KPj4+PiArCQlyZXR1cm47Cj4+Pj4gKwljYXNlIFJF
UV9PUF9aT05FX0ZJTklTSDoKPj4+PiArCQl6b25lLT5jb25kID0gQkxLX1pPTkVfQ09ORF9GVUxM
Owo+Pj4+ICsJCXpvbmUtPndwID0gem9uZS0+c3RhcnQgKyB6b25lLT5sZW47Cj4+Pj4gKwkJcmV0
dXJuOwo+Pj4+ICsJZGVmYXVsdDoKPj4+PiArCQkvKiBJbnZhbGlkIHpvbmUgY29uZGl0aW9uICov
Cj4+Pj4gKwkJY21kLT5lcnJvciA9IEJMS19TVFNfSU9FUlI7Cj4+Pj4gKwkJcmV0dXJuOwo+Pj4+
ICsJfQo+Pj4+ICAgIH0KPj4+Pgo+Pj4KPj4+Cj4+Cj4+Cj4gCj4gCgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vZG0tZGV2ZWw=
