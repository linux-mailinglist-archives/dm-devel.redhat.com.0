Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B429ECC46F
	for <lists+dm-devel@lfdr.de>; Fri,  4 Oct 2019 22:51:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12B053082E24;
	Fri,  4 Oct 2019 20:51:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 656E119C4F;
	Fri,  4 Oct 2019 20:51:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8670D4E589;
	Fri,  4 Oct 2019 20:51:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x94KpPed015483 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 4 Oct 2019 16:51:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E00F01001B20; Fri,  4 Oct 2019 20:51:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA84F1001B13
	for <dm-devel@redhat.com>; Fri,  4 Oct 2019 20:51:23 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 93E64328E
	for <dm-devel@redhat.com>; Fri,  4 Oct 2019 20:51:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r5so8632540wrm.12
	for <dm-devel@redhat.com>; Fri, 04 Oct 2019 13:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=bOgzBroAT4yqBexsYeUyYH3l5b7V0DcJooVdGMWz+YU=;
	b=NKtYvFA3T0815OFPVfxdNblcY4EiDFgl9H1M1/r1fEZ7fTKlCaw1wnAGVC/KczmYmk
	7bvNMtpdkcssUOCV+GNUXAdXm/dWzUViX42NVsvfsA3jIrZgTRWCtijvN+IsKzo6DaaO
	AFmTz2PMeYw4Znohp6YTrJyxEpKNWvCwK2i8xJ5Y2wsDKG2APDsId37zG+H06VyGiSsl
	ZIMZgE/RGyZbIKLItVQwz6Ks2sv+WqgXZV0d1MqociIrClZsSDnd9GieE2UnxZVyWd4b
	hxE+T1YM8WopQN8tzQ+ssLa6OhGGh71AVYetOzWTVhu+ySI1TRoO1un3kssoVC1hRnYA
	h0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=bOgzBroAT4yqBexsYeUyYH3l5b7V0DcJooVdGMWz+YU=;
	b=uWVTCAr8udDw7OxY0uYeJXJQymB4Ih46Z98Trae/9EZNe01Reg1j7Nv1i4CqOZDYU9
	8KTZs8QfS4JEh03z354FxyiFcalnsUEotAUCNxrpOhCxg0YKeeBZu3ishgw+HjAaL4X4
	oxEwpdwvi0v6cXU22meO9QKsf7DQET1Zee/JHyY32N78ELqM6cpVyyY9eRtAPIMmQtlE
	nQZ8qRZIl/MdyLjewOR3q1WzfoO5pJTwEFJJqF0xmWwF/3dEKZtcSQBlzRL8Ma9XO/cS
	otL1GBpt3rQ4iFVjQoKU1Ch7MwbH6wLUStZ9yLSzgk6QH3ir/fOR6jUkso1SMP2kPB2p
	ZZ3A==
X-Gm-Message-State: APjAAAXXofkRgTzAUfn+OUBYTBA/CddKITd2TVxqUWU1v/yGzUEm3u4f
	87PbpVD4syTZ+OuKA0nlXqquk+o=
X-Google-Smtp-Source: APXvYqwzHwt2cfPRDceO+icykbilNeEeGm2J5/Qa6pj7fFHFK+01SI4HUji5v/2CXsdh//24JEHh1A==
X-Received: by 2002:a5d:494d:: with SMTP id r13mr13135039wrs.166.1570222280976;
	Fri, 04 Oct 2019 13:51:20 -0700 (PDT)
Received: from localhost (118.red-88-12-24.staticip.rima-tde.net.
	[88.12.24.118]) by smtp.gmail.com with ESMTPSA id
	r27sm16614557wrc.55.2019.10.04.13.51.20
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 04 Oct 2019 13:51:20 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: Brian Bunker <brian@purestorage.com>,
	device-mapper development <dm-devel@redhat.com>
References: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
Message-ID: <dd8cbe47-3dc8-4136-2e75-5c8694e6c412@gmail.com>
Date: Fri, 4 Oct 2019 22:51:19 +0200
MIME-Version: 1.0
In-Reply-To: <EF473529-CF81-4AE9-BD96-08624B59BA10@purestorage.com>
Content-Language: en-US
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 04 Oct 2019 20:51:22 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]);
	Fri, 04 Oct 2019 20:51:22 +0000 (UTC) for IP:'209.85.221.65'
	DOMAIN:'mail-wr1-f65.google.com' HELO:'mail-wr1-f65.google.com'
	FROM:'xose.vazquez@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.1  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.221.65 mail-wr1-f65.google.com 209.85.221.65
	mail-wr1-f65.google.com <xose.vazquez@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.29
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH] ALUA support for PURE FlashArray
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 04 Oct 2019 20:51:55 +0000 (UTC)

T24gNi8yNi8xOSA3OjM3IFBNLCBCcmlhbiBCdW5rZXIgd3JvdGU6Cgo+IEl0IGhhcyBiZWVuIHNv
bWUgdGltZSBzaW5jZSB3ZSB1cGRhdGVkIG91ciBQVVJFIEZsYXNoQXJyYXkgY29uZmlndXJhdGlv
bi4gVGhlCj4gTGludXggdmVuZG9ycyB0aGF0IHdlIGhhZCBiZWVuIHNlZWluZyBpbiB0aGUgZmll
bGQgd2VyZSB1c2luZyB2ZXJ5IG9sZCB2ZXJzaW9ucwo+IG9mIG11bHRpcGF0aC10b29scywgc28g
d2UgaGF2ZW7igJl0IG5lZWRlZCB0byBjaGFuZ2UgYW55dGhpbmcgZm9yIHNvbWUgdGltZS4gV2l0
aAo+IHRoZSByZWxlYXNlIG9mIFJIRUw4LCBzb21lIG9mIG91ciBlYXJsaWVyIHZhbHVlcyBoYXZl
IGJlZW4gbG9zdCBieSB1cHN0cmVhbQo+IGNoYW5nZXMuIAoKUmVzZW5kIGl0LCB3aXRoIENDOiBD
aHJpc3RvcGhlIFZhcm9xdWkgPGNocmlzdG9waGUudmFyb3F1aUBvcGVuc3ZjLmNvbT4KCj4gSW4g
YWRkaXRpb24gd2UgaGF2ZSBvdXIgQWN0aXZlIENsdXN0ZXIgZmVhdHVyZSB3aGljaCBsZXZlcmFn
ZXMgQUxVQSBzaW5jZSBvdXIKPiBsYXN0IHBhdGNoLiBUaGUgQUxVQSBjb25mZ3VyYXRpb24gd2ls
bCB3b3JrIGZvciBhbGwgRmxhc2hBcnJheXMgd2l0aCBvciB3aXRob3V0Cj4gQWN0aXZlIENsdXN0
ZXIuCj4gCj4gV2UgYXJlIGNoYW5naW5nIDMgdGhpbmdzLgo+IAo+IDEuIEFMVUEgc3VwcG9ydAo+
Cj4gMi4gRmFzdCBmYWlsIHRpbWVvdXQgZnJvbSB0aGUgZGVmYXVsdCBvZiA1IHNlY29uZHMgdG8g
MTAgc2Vjb25kcyAoV2UgbmVlZCB0aGlzCj4gZm9yIG91ciBGQyBOUElWIHBvcnQgbWlncmF0aW9u
KS4KPgo+IDMuIE1heGltdW0gc2VjdG9yIHNpemUgb2YgNE1CLiBTb21lIExpbnV4IHZlbmRvcnMg
ZG9u4oCZdCBob25vciB0aGUgYmxvY2sgbGltaXRzCj4gVlBEIHBhZ2Ugb2YgSU5RVUlSWSkuCiA+
Cj4gZGlmZiAtLWdpdCBhL2xpYm11bHRpcGF0aC9od3RhYmxlLmMgYi9saWJtdWx0aXBhdGgvaHd0
YWJsZS5jCj4gaW5kZXggMWQ5NjQzMzMuLjM3ZTk3ZjYwIDEwMDY0NAo+IC0tLSBhL2xpYm11bHRp
cGF0aC9od3RhYmxlLmMKPiArKysgYi9saWJtdWx0aXBhdGgvaHd0YWJsZS5jCj4gQEAgLTEwMjQs
NyArMTAyNCwxMiBAQCBzdGF0aWMgc3RydWN0IGh3ZW50cnkgZGVmYXVsdF9od1tdID0gewo+ICAg
ICAgICAgICAgICAgICAvKiBGbGFzaEFycmF5ICovCj4gICAgICAgICAgICAgICAgIC52ZW5kb3Ig
ICAgICAgID0gIlBVUkUiLAo+ICAgICAgICAgICAgICAgICAucHJvZHVjdCAgICAgICA9ICJGbGFz
aEFycmF5IiwKPiAtICAgICAgICAgICAgICAgLnBncG9saWN5ICAgICAgPSBNVUxUSUJVUywKPiAr
ICAgICAgICAgICAgICAgLnBncG9saWN5ICAgICAgPSBHUk9VUF9CWV9QUklPLAo+ICsgICAgICAg
ICAgICAgICAucGdmYWlsYmFjayAgICA9IC1GQUlMQkFDS19JTU1FRElBVEUsCj4gKyAgICAgICAg
ICAgICAgIC5od2hhbmRsZXIgICAgID0gIjEgYWx1YSIsCj4gKyAgICAgICAgICAgICAgIC5wcmlv
X25hbWUgICAgID0gUFJJT19BTFVBLAo+ICsgICAgICAgICAgICAgICAuZmFzdF9pb19mYWlsICA9
IDEwLAo+ICsgICAgICAgICAgICAgICAubWF4X3NlY3RvcnNfa2IgPSA0MDk2LAoKLS0KZG0tZGV2
ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNv
bS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
