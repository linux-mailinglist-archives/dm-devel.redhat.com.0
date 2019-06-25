Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 419B4550D5
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 15:53:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07F77C04D2F7;
	Tue, 25 Jun 2019 13:53:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 326746012E;
	Tue, 25 Jun 2019 13:52:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E2A4B1806B18;
	Tue, 25 Jun 2019 13:51:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PB6kpK015655 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 07:06:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4205A10027BF; Tue, 25 Jun 2019 11:06:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BFEA100033E
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 11:06:44 +0000 (UTC)
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C026C3091851
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 11:06:36 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id v18so15802278ljh.6
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 04:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=hJ1vw1zo6Yo+NVBoQruROWjbHicMMrc+0Uq5a9tZI0E=;
	b=AtCxVJwKFF83GEQSiD5/UyKHSg1ExoYmFtw2Symdhw/wCQw8WfSqYsOwSLVDvVProW
	IA1d83IEb81JbfBdDvNgolRz4O+LVN1Tuw0/bfiu2tjVyk/Fm+r3ncH6VULwCoU/Cu+9
	VO/DYwctluU9QQP/bca/HYt093rIWYRomNl/lekwrJE9unOWVRpkuIcDBKLn0kr6Vnc8
	0S9nojlcDE+l3Q+K0UIe3UMEKlf8m1ndFqQq4BJEk18lmC2MRZgnZ/dpdL4pV4jMQHoY
	o258LxH0BHcR0hIAXDSxzwXYNXnCI3utaNv81DARxQqBKX1FmTWQZhDoWkJ3RZjIy+eB
	jMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=hJ1vw1zo6Yo+NVBoQruROWjbHicMMrc+0Uq5a9tZI0E=;
	b=AA7zb+XTq5TV1ZsHyxa5OBkH9ZQQ8QRXYnHnXHbS9hH/k0/HPME+nSNtbrEzYUDhdi
	Kf2P0dVr5rj24wg6RO9EhsA3dHZM285cmWg2iI6Sm6dl0wIQ8OBXefJ+/Rm+njzrldnP
	xOTaD3Z3UZjGaOFc56Qz9dqNXPShsQNxFhHxF++dSdBCrV0ReTCqDjcMuZUxdcAnVvQ7
	3Rfw7Jj1hJ0w2RaLiVLVh+U5lqZmmJfXM3sl/C/VXEfB6/Tb4mUueu73dQGYhOyfh1cU
	fDmRibm5NS11G7BWppYqhS8fTKK1YxT17rjH4Pvxcstq3VTVp2vK4+75ghB8M6Ene0Ya
	9Ftg==
X-Gm-Message-State: APjAAAUlah9T43ZoPcu5zJJab9DZiqrsVtoqxT0z5MtOAX6fR5XYraVg
	Y0BmLx9ifkQyyWbXpZhKL9eCnA==
X-Google-Smtp-Source: APXvYqyfuet2MP/Dnr9EfVjUh2ZWzHR3Uce4MeCK6uqHcizBWIFHMTfXvHhv+iCudLtIj5SIITGOjA==
X-Received: by 2002:a2e:8345:: with SMTP id l5mr15081292ljh.18.1561460795234; 
	Tue, 25 Jun 2019 04:06:35 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225]) by smtp.googlemail.com with ESMTPSA id
	h3sm2221123lja.93.2019.06.25.04.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 04:06:34 -0700 (PDT)
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
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <1aa6552c-ecf9-a168-df75-ec8c52ddbea6@lightnvm.io>
Date: Tue, 25 Jun 2019 13:06:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5816D471063D970DDCF9AEC7E7E60@BYAPR04MB5816.namprd04.prod.outlook.com>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Tue, 25 Jun 2019 11:06:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Tue, 25 Jun 2019 11:06:37 +0000 (UTC) for IP:'209.85.208.193'
	DOMAIN:'mail-lj1-f193.google.com'
	HELO:'mail-lj1-f193.google.com' FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.208.193 mail-lj1-f193.google.com 209.85.208.193
	mail-lj1-f193.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Tue, 25 Jun 2019 13:53:41 +0000 (UTC)

T24gNi8yMi8xOSAzOjAyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDE5LzA2LzIx
IDIyOjA3LCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+PiBGcm9tOiBBamF5IEpvc2hpIDxhamF5
Lmpvc2hpQHdkYy5jb20+Cj4+Cj4+IEltcGxlbWVudCBSRVFfT1BfWk9ORV9PUEVOLCBSRVFfT1Bf
Wk9ORV9DTE9TRSBhbmQgUkVRX09QX1pPTkVfRklOSVNICj4+IHN1cHBvcnQgdG8gYWxsb3cgZXhw
bGljaXQgY29udHJvbCBvZiB6b25lIHN0YXRlcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWpheSBK
b3NoaSA8YWpheS5qb3NoaUB3ZGMuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBNYXRpYXMgQmrDuHJs
aW5nIDxtYXRpYXMuYmpvcmxpbmdAd2RjLmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy9ibG9jay9u
dWxsX2Jsay5oICAgICAgIHwgIDQgKystLQo+PiAgIGRyaXZlcnMvYmxvY2svbnVsbF9ibGtfbWFp
bi5jICB8IDEzICsrKysrKysrKystLS0KPj4gICBkcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVk
LmMgfCAzMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0KPj4gICAzIGZpbGVzIGNo
YW5nZWQsIDQyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmggYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmgKPj4g
aW5kZXggMzRiMjJkNjUyM2JhLi42MmVmNjVjYjBmM2UgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMv
YmxvY2svbnVsbF9ibGsuaAo+PiArKysgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrLmgKPj4gQEAg
LTkzLDcgKzkzLDcgQEAgaW50IG51bGxfem9uZV9yZXBvcnQoc3RydWN0IGdlbmRpc2sgKmRpc2ss
IHNlY3Rvcl90IHNlY3RvciwKPj4gICAJCSAgICAgZ2ZwX3QgZ2ZwX21hc2spOwo+PiAgIHZvaWQg
bnVsbF96b25lX3dyaXRlKHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yLAo+
PiAgIAkJCXVuc2lnbmVkIGludCBucl9zZWN0b3JzKTsKPj4gLXZvaWQgbnVsbF96b25lX3Jlc2V0
KHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yKTsKPj4gK3ZvaWQgbnVsbF96
b25lX21nbXRfb3Aoc3RydWN0IG51bGxiX2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpOwo+PiAg
ICNlbHNlCj4+ICAgc3RhdGljIGlubGluZSBpbnQgbnVsbF96b25lX2luaXQoc3RydWN0IG51bGxi
X2RldmljZSAqZGV2KQo+PiAgIHsKPj4gQEAgLTExMSw2ICsxMTEsNiBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgbnVsbF96b25lX3dyaXRlKHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qgc2Vj
dG9yLAo+PiAgIAkJCQkgICB1bnNpZ25lZCBpbnQgbnJfc2VjdG9ycykKPj4gICB7Cj4+ICAgfQo+
PiAtc3RhdGljIGlubGluZSB2b2lkIG51bGxfem9uZV9yZXNldChzdHJ1Y3QgbnVsbGJfY21kICpj
bWQsIHNlY3Rvcl90IHNlY3Rvcikge30KPj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBudWxsX3pvbmVf
bWdtdF9vcChzdHJ1Y3QgbnVsbGJfY21kICpjbWQsIHNlY3Rvcl90IHNlY3Rvcikge30KPj4gICAj
ZW5kaWYgLyogQ09ORklHX0JMS19ERVZfWk9ORUQgKi8KPj4gICAjZW5kaWYgLyogX19OVUxMX0JM
S19IICovCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX21haW4uYyBiL2Ry
aXZlcnMvYmxvY2svbnVsbF9ibGtfbWFpbi5jCj4+IGluZGV4IDQ0N2Q2MzVjNzlhMi4uNTA1OGZi
OTgwYzljIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX21haW4uYwo+PiAr
KysgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX21haW4uYwo+PiBAQCAtMTIwOSwxMCArMTIwOSwx
NyBAQCBzdGF0aWMgYmxrX3N0YXR1c190IG51bGxfaGFuZGxlX2NtZChzdHJ1Y3QgbnVsbGJfY21k
ICpjbWQpCj4+ICAgCQkJbnJfc2VjdG9ycyA9IGJsa19ycV9zZWN0b3JzKGNtZC0+cnEpOwo+PiAg
IAkJfQo+PiAgIAo+PiAtCQlpZiAob3AgPT0gUkVRX09QX1dSSVRFKQo+PiArCQlzd2l0Y2ggKG9w
KSB7Cj4+ICsJCWNhc2UgUkVRX09QX1dSSVRFOgo+PiAgIAkJCW51bGxfem9uZV93cml0ZShjbWQs
IHNlY3RvciwgbnJfc2VjdG9ycyk7Cj4+IC0JCWVsc2UgaWYgKG9wID09IFJFUV9PUF9aT05FX1JF
U0VUKQo+PiAtCQkJbnVsbF96b25lX3Jlc2V0KGNtZCwgc2VjdG9yKTsKPj4gKwkJCWJyZWFrOwo+
PiArCQljYXNlIFJFUV9PUF9aT05FX1JFU0VUOgo+PiArCQljYXNlIFJFUV9PUF9aT05FX09QRU46
Cj4+ICsJCWNhc2UgUkVRX09QX1pPTkVfQ0xPU0U6Cj4+ICsJCWNhc2UgUkVRX09QX1pPTkVfRklO
SVNIOgo+PiArCQkJbnVsbF96b25lX21nbXRfb3AoY21kLCBzZWN0b3IpOwo+PiArCQkJYnJlYWs7
Cj4+ICsJCX0KPj4gICAJfQo+PiAgIG91dDoKPj4gICAJLyogQ29tcGxldGUgSU8gYnkgaW5saW5l
LCBzb2Z0aXJxIG9yIHRpbWVyICovCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Jsb2NrL251bGxf
YmxrX3pvbmVkLmMgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVkLmMKPj4gaW5kZXggZmNh
MGM5N2ZmMWFhLi40N2Q5NTZiMmUxNDggMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYmxvY2svbnVs
bF9ibGtfem9uZWQuYwo+PiArKysgYi9kcml2ZXJzL2Jsb2NrL251bGxfYmxrX3pvbmVkLmMKPj4g
QEAgLTEyMSwxNyArMTIxLDQ0IEBAIHZvaWQgbnVsbF96b25lX3dyaXRlKHN0cnVjdCBudWxsYl9j
bWQgKmNtZCwgc2VjdG9yX3Qgc2VjdG9yLAo+PiAgIAl9Cj4+ICAgfQo+PiAgIAo+PiAtdm9pZCBu
dWxsX3pvbmVfcmVzZXQoc3RydWN0IG51bGxiX2NtZCAqY21kLCBzZWN0b3JfdCBzZWN0b3IpCj4+
ICt2b2lkIG51bGxfem9uZV9tZ210X29wKHN0cnVjdCBudWxsYl9jbWQgKmNtZCwgc2VjdG9yX3Qg
c2VjdG9yKQo+PiAgIHsKPj4gICAJc3RydWN0IG51bGxiX2RldmljZSAqZGV2ID0gY21kLT5ucS0+
ZGV2Owo+PiAgIAl1bnNpZ25lZCBpbnQgem5vID0gbnVsbF96b25lX25vKGRldiwgc2VjdG9yKTsK
Pj4gICAJc3RydWN0IGJsa196b25lICp6b25lID0gJmRldi0+em9uZXNbem5vXTsKPj4gKwllbnVt
IHJlcV9vcGYgb3AgPSByZXFfb3AoY21kLT5ycSk7Cj4+ICAgCj4+ICAgCWlmICh6b25lLT50eXBl
ID09IEJMS19aT05FX1RZUEVfQ09OVkVOVElPTkFMKSB7Cj4+ICAgCQljbWQtPmVycm9yID0gQkxL
X1NUU19JT0VSUjsKPj4gICAJCXJldHVybjsKPj4gICAJfQo+PiAgIAo+PiAtCXpvbmUtPmNvbmQg
PSBCTEtfWk9ORV9DT05EX0VNUFRZOwo+PiAtCXpvbmUtPndwID0gem9uZS0+c3RhcnQ7Cj4+ICsJ
c3dpdGNoIChvcCkgewo+PiArCWNhc2UgUkVRX09QX1pPTkVfUkVTRVQ6Cj4+ICsJCXpvbmUtPmNv
bmQgPSBCTEtfWk9ORV9DT05EX0VNUFRZOwo+PiArCQl6b25lLT53cCA9IHpvbmUtPnN0YXJ0Owo+
PiArCQlyZXR1cm47Cj4+ICsJY2FzZSBSRVFfT1BfWk9ORV9PUEVOOgo+PiArCQlpZiAoem9uZS0+
Y29uZCA9PSBCTEtfWk9ORV9DT05EX0ZVTEwpIHsKPj4gKwkJCWNtZC0+ZXJyb3IgPSBCTEtfU1RT
X0lPRVJSOwo+PiArCQkJcmV0dXJuOwo+PiArCQl9Cj4+ICsJCXpvbmUtPmNvbmQgPSBCTEtfWk9O
RV9DT05EX0VYUF9PUEVOOwo+IAo+IAo+IFdpdGggWkJDLCBvcGVuIG9mIGEgZnVsbCB6b25lIGlz
IGEgIm5vcCIuIE5vIGVycm9yLiBTbyBJIHdvdWxkIHJhdGhlciBoYXZlIHRoaXMgYXM6Cj4gCj4g
CQlpZiAoem9uZS0+Y29uZCAhPSBCTEtfWk9ORV9DT05EX0ZVTEwpCj4gCQkJem9uZS0+Y29uZCA9
IEJMS19aT05FX0NPTkRfRVhQX09QRU47Cj4gCQkKSXMgdGhpcyBvbmx5IFpCQz8gSSBjYW4ndCBm
aW5kIGEgcmVmZXJlbmNlIHRvIGl0IGluIFpBQy4gSSB0aGluayBpdCAKc2hvdWxkIGZhaWwuIE9u
ZSBpcyB0cnlpbmcgdG8gb3BlbiBhIHpvbmUgdGhhdCBpcyBmdWxsLCBvbmUgY2FuJ3Qgb3BlbiAK
aXQgYWdhaW4uIEl0J3MgZG9uZSBmb3IgdGhpcyByb3VuZC4KPiAKPj4gKwkJcmV0dXJuOwo+PiAr
CWNhc2UgUkVRX09QX1pPTkVfQ0xPU0U6Cj4+ICsJCWlmICh6b25lLT5jb25kID09IEJMS19aT05F
X0NPTkRfRlVMTCkgewo+PiArCQkJY21kLT5lcnJvciA9IEJMS19TVFNfSU9FUlI7Cj4+ICsJCQly
ZXR1cm47Cj4+ICsJCX0KPj4gKwkJem9uZS0+Y29uZCA9IEJMS19aT05FX0NPTkRfQ0xPU0VEOwo+
IAo+IFNhbSBhcyBmb3Igb3Blbi4gQ2xvc2luZyBhIGZ1bGwgem9uZSBvbiBaQkMgaXMgYSBub3Au
IAoKSSB0aGluayB0aGlzIHNob3VsZCBjYXVzZSBlcnJvci4KCkFuZCB0aGUgY29kZSBhYm92ZSB3
b3VsZAo+IGFsc28gc2V0IGFuIGVtcHR5IHpvbmUgdG8gY2xvc2VkLiBGaW5hbGx5LCBpZiB0aGUg
em9uZSBpcyBvcGVuIGJ1dCBub3RoaW5nIHdhcwo+IHdyaXR0ZW4gdG8gaXQsIGl0IG11c3QgYmUg
cmV0dXJuZWQgdG8gZW1wdHkgY29uZGl0aW9uLCBub3QgY2xvc2VkLiAKCk9ubHkgb24gYSByZXNl
dCBldmVudCByaWdodD8gSW4gZ2VuZXJhbCwgaWYgSSBkbyBhIGV4cGwuIG9wZW4sIGNsb3NlIGl0
LCAKaXQgc2hvdWxkIG5vdCBnbyB0byBlbXB0eS4KClNvIHNvbWV0aGluZwo+IGxpa2UgdGhpcyBp
cyBuZWVkZWQuCj4gCj4gCQlzd2l0Y2ggKHpvbmUtPmNvbmQpIHsKPiAJCWNhc2UgQkxLX1pPTkVf
Q09ORF9GVUxMOgo+IAkJY2FzZSBCTEtfWk9ORV9DT05EX0VNUFRZOgo+IAkJCWJyZWFrOwo+IAkJ
Y2FzZSBCTEtfWk9ORV9DT05EX0VYUF9PUEVOOgo+IAkJCWlmICh6b25lLT53cCA9PSB6b25lLT5z
dGFydCkgewo+IAkJCQl6b25lLT5jb25kID0gQkxLX1pPTkVfQ09ORF9FTVBUWTsKPiAJCQkJYnJl
YWs7Cj4gCQkJfQo+IAkJLyogZmFsbHRocm91Z2ggKi8KPiAJCWRlZmF1bHQ6Cj4gCQkJem9uZS0+
Y29uZCA9IEJMS19aT05FX0NPTkRfQ0xPU0VEOwo+IAkJfQo+IAo+PiArCQlyZXR1cm47Cj4+ICsJ
Y2FzZSBSRVFfT1BfWk9ORV9GSU5JU0g6Cj4+ICsJCXpvbmUtPmNvbmQgPSBCTEtfWk9ORV9DT05E
X0ZVTEw7Cj4+ICsJCXpvbmUtPndwID0gem9uZS0+c3RhcnQgKyB6b25lLT5sZW47Cj4+ICsJCXJl
dHVybjsKPj4gKwlkZWZhdWx0Ogo+PiArCQkvKiBJbnZhbGlkIHpvbmUgY29uZGl0aW9uICovCj4+
ICsJCWNtZC0+ZXJyb3IgPSBCTEtfU1RTX0lPRVJSOwo+PiArCQlyZXR1cm47Cj4+ICsJfQo+PiAg
IH0KPj4KPiAKPiAKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
