Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A19DCE457C
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 10:21:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571991672;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=S9yaFKfxWbs+cSAWMPbsL2j5lQwNy4foYAFCW6SLoXo=;
	b=V22mhZwVnwrcPLkoqeeDe31T9nVs8pFjFYQ5ZyhkYZ5hxV5HXxiycERwLVImXYGSCm9t2r
	aUsr7l3/Ljhu1A/8WYQ/iQk1Po4nXf4ygRCrpKaNVS4h/iUHB/RB288DquxUl+q95pxHYK
	o/1/6J9HaZJLGYOcDKFUn9Ll3sST4UU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-1WY_TZnVOYKQoksvJfe51g-1; Fri, 25 Oct 2019 04:21:07 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 054E91005500;
	Fri, 25 Oct 2019 08:21:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8DF2F1001DC0;
	Fri, 25 Oct 2019 08:21:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 123D93FB45;
	Fri, 25 Oct 2019 08:21:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9P5HuAv009663 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 01:17:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C72260BF3; Fri, 25 Oct 2019 05:17:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3651F60BEC
	for <dm-devel@redhat.com>; Fri, 25 Oct 2019 05:17:53 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45544308A9E2
	for <dm-devel@redhat.com>; Fri, 25 Oct 2019 05:17:51 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 22so478988wms.3
	for <dm-devel@redhat.com>; Thu, 24 Oct 2019 22:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=ypC8lgM3/Rt15xyp/AJsV4lSDdXYCNqSiXTkBhWcg5k=;
	b=Rnt6zX++VNI8g/4lqlub7tK0dWrtpNoCiuwKG0G6t8c7V9g6HlcRF2n1p5COFUh9LA
	weIduxSevP++wPJH66OXFcr8Iw9GaABAFb3ALTIKmYVWG+rVVfimcjxIhE8rjUBTQjOM
	974o/ESHf2snv+YS0GWvH/VPdLMuOmlGe4BmJljoPl9LU1AnRaO2ULaoa8euIThun5qN
	l4nOB5Raxa9twOG/CjxUsARHjLmGbXYATWqM+VTA/PKX1k7G1qFgHpBvZUp9kDU4K8xL
	5jWQZxPgF6M078l8z+Kf7l9SwD9aqdlEpOPkZ/srK9RCPK1ZGsquZGWmskr785F04YO4
	na8g==
X-Gm-Message-State: APjAAAUM4+dBlvN2k9MTln1KvsuNh70zvpGPWISflAnabG41JH3zhYFa
	Y8pt5IZN7xm3QKvMOoYP6bjM4w==
X-Google-Smtp-Source: APXvYqyWsiwWn2sDNixvTP3mLXZXTjfr7CtNwsbNHer2Tux0Rrk3qMlkCwVEebMfiSMtZ0pG4ncoHw==
X-Received: by 2002:a1c:7406:: with SMTP id p6mr1689534wmc.64.1571980669907;
	Thu, 24 Oct 2019 22:17:49 -0700 (PDT)
Received: from localhost ([194.62.217.57]) by smtp.gmail.com with ESMTPSA id
	n11sm1032994wmd.26.2019.10.24.22.17.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 22:17:49 -0700 (PDT)
Date: Fri, 25 Oct 2019 07:17:48 +0200
From: Javier =?utf-8?B?R29uesOhbGV6?= <javier@javigon.com>
To: Damien Le Moal <damien.lemoal@wdc.com>
Message-ID: <20191025051748.2etv67wvb264mn3n@mpHalley>
References: <20191024065006.8684-1-damien.lemoal@wdc.com>
	<20191024065006.8684-3-damien.lemoal@wdc.com>
MIME-Version: 1.0
In-Reply-To: <20191024065006.8684-3-damien.lemoal@wdc.com>
User-Agent: NeoMutt/20180716
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 25 Oct 2019 05:17:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]);
	Fri, 25 Oct 2019 05:17:51 +0000 (UTC) for IP:'209.85.128.66'
	DOMAIN:'mail-wm1-f66.google.com' HELO:'mail-wm1-f66.google.com'
	FROM:'javier@javigon.com' RCPT:''
X-RedHat-Spam-Score: 0.001  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_NONE) 209.85.128.66 mail-wm1-f66.google.com 209.85.128.66
	mail-wm1-f66.google.com <javier@javigon.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.41
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 04:20:32 -0400
Cc: Jens Axboe <axboe@kernel.dk>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-scsi@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/4] block: Simplify report zones execution
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 1WY_TZnVOYKQoksvJfe51g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gMjQuMTAuMjAxOSAxNTo1MCwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj5BbGwga2VybmVsIHVz
ZXJzIG9mIGJsa2Rldl9yZXBvcnRfem9uZXMoKSBhcyB3ZWxsIGFzIGFwcGxpY2F0aW9ucyB1c2UK
PnRocm91Z2ggaW9jdGwoQkxLWk9ORVJFUE9SVCkgZXhwZWN0IHRvIHBvdGVudGlhbGx5IGdldCBs
ZXNzIHpvbmUKPmRlc2NyaXB0b3JzIHRoYW4gcmVxdWVzdGVkLiBBcyBzdWNoLCB0aGUgdXNlIG9m
IHRoZSBpbnRlcm5hbCByZXBvcnQKPnpvbmVzIGNvbW1hbmQgZXhlY3V0aW9uIGxvb3AgaW1wbGVt
ZW50ZWQgYnkgYmxrX3JlcG9ydF96b25lcygpIGlzCj5ub3QgbmVjZXNzYXJ5IGFuZCBjYW4gZXZl
biBiZSBoYXJtZnVsIHRvIHBlcmZvcm1hbmNlIGJ5IGNhdXNpbmcgdGhlCj5leGVjdXRpb24gb2Yg
aW5lZmZpY2llbnQgc21hbGwgem9uZXMgcmVwb3J0IGNvbW1hbmQgdG8gc2VydmljZSB0aGUKPnJl
bWluZGVyIG9mIGEgcmVxdWVzdGVkIHpvbmUgYXJyYXkuCj4KPlRoaXMgcGF0Y2ggcmVtb3ZlcyBi
bGtfcmVwb3J0X3pvbmVzKCksIHNpbXBsaWZ5aW5nIHRoZSBjb2RlLiBBbHNvCj5yZW1vdmUgYSBu
b3cgaW5jb3JyZWN0IGNvbW1lbnQgaW4gZG1fYmxrX3JlcG9ydF96b25lcygpLgo+Cj5TaWduZWQt
b2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+LS0tCj4gYmxv
Y2svYmxrLXpvbmVkLmMgfCAzNCArKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4g
ZHJpdmVycy9tZC9kbS5jICAgfCAgNiAtLS0tLS0KPiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pCj4KPmRpZmYgLS1naXQgYS9ibG9jay9ibGstem9uZWQu
YyBiL2Jsb2NrL2Jsay16b25lZC5jCj5pbmRleCAyOTM4OTFiNzA2OGEuLjQzYmZkMWJlMDk4NSAx
MDA2NDQKPi0tLSBhL2Jsb2NrL2Jsay16b25lZC5jCj4rKysgYi9ibG9jay9ibGstem9uZWQuYwo+
QEAgLTExOSwzMSArMTE5LDYgQEAgc3RhdGljIGJvb2wgYmxrZGV2X3JlcG9ydF96b25lKHN0cnVj
dCBibG9ja19kZXZpY2UgKmJkZXYsIHN0cnVjdCBibGtfem9uZSAqcmVwKQo+IAlyZXR1cm4gdHJ1
ZTsKPiB9Cj4KPi1zdGF0aWMgaW50IGJsa19yZXBvcnRfem9uZXMoc3RydWN0IGdlbmRpc2sgKmRp
c2ssIHNlY3Rvcl90IHNlY3RvciwKPi0JCQkgICAgc3RydWN0IGJsa196b25lICp6b25lcywgdW5z
aWduZWQgaW50ICpucl96b25lcykKPi17Cj4tCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxID0gZGlz
ay0+cXVldWU7Cj4tCXVuc2lnbmVkIGludCB6ID0gMCwgbiwgbnJ6ID0gKm5yX3pvbmVzOwo+LQlz
ZWN0b3JfdCBjYXBhY2l0eSA9IGdldF9jYXBhY2l0eShkaXNrKTsKPi0JaW50IHJldDsKPi0KPi0J
d2hpbGUgKHogPCBucnogJiYgc2VjdG9yIDwgY2FwYWNpdHkpIHsKPi0JCW4gPSBucnogLSB6Owo+
LQkJcmV0ID0gZGlzay0+Zm9wcy0+cmVwb3J0X3pvbmVzKGRpc2ssIHNlY3RvciwgJnpvbmVzW3pd
LCAmbik7Cj4tCQlpZiAocmV0KQo+LQkJCXJldHVybiByZXQ7Cj4tCQlpZiAoIW4pCj4tCQkJYnJl
YWs7Cj4tCQlzZWN0b3IgKz0gYmxrX3F1ZXVlX3pvbmVfc2VjdG9ycyhxKSAqIG47Cj4tCQl6ICs9
IG47Cj4tCX0KPi0KPi0JV0FSTl9PTih6ID4gKm5yX3pvbmVzKTsKPi0JKm5yX3pvbmVzID0gejsK
Pi0KPi0JcmV0dXJuIDA7Cj4tfQo+LQo+IC8qKgo+ICAqIGJsa2Rldl9yZXBvcnRfem9uZXMgLSBH
ZXQgem9uZXMgaW5mb3JtYXRpb24KPiAgKiBAYmRldjoJVGFyZ2V0IGJsb2NrIGRldmljZQo+QEAg
LTE2NCw2ICsxMzksNyBAQCBpbnQgYmxrZGV2X3JlcG9ydF96b25lcyhzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2LCBzZWN0b3JfdCBzZWN0b3IsCj4gCQkJc3RydWN0IGJsa196b25lICp6b25lcywg
dW5zaWduZWQgaW50ICpucl96b25lcykKPiB7Cj4gCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxID0g
YmRldl9nZXRfcXVldWUoYmRldik7Cj4rCXN0cnVjdCBnZW5kaXNrICpkaXNrID0gYmRldi0+YmRf
ZGlzazsKPiAJdW5zaWduZWQgaW50IGksIG5yejsKPiAJaW50IHJldDsKPgo+QEAgLTE3NSw3ICsx
NTEsNyBAQCBpbnQgYmxrZGV2X3JlcG9ydF96b25lcyhzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2
LCBzZWN0b3JfdCBzZWN0b3IsCj4gCSAqIHJlcG9ydF96b25lcyBtZXRob2QuIElmIGl0IGRvZXMg
bm90IGhhdmUgb25lIGRlZmluZWQsIHRoZSBkZXZpY2UKPiAJICogZHJpdmVyIGhhcyBhIGJ1Zy4g
U28gd2FybiBhYm91dCB0aGF0Lgo+IAkgKi8KPi0JaWYgKFdBUk5fT05fT05DRSghYmRldi0+YmRf
ZGlzay0+Zm9wcy0+cmVwb3J0X3pvbmVzKSkKPisJaWYgKFdBUk5fT05fT05DRSghZGlzay0+Zm9w
cy0+cmVwb3J0X3pvbmVzKSkKPiAJCXJldHVybiAtRU9QTk9UU1VQUDsKPgo+IAlpZiAoISpucl96
b25lcyB8fCBzZWN0b3IgPj0gYmRldi0+YmRfcGFydC0+bnJfc2VjdHMpIHsKPkBAIC0xODUsOCAr
MTYxLDggQEAgaW50IGJsa2Rldl9yZXBvcnRfem9uZXMoc3RydWN0IGJsb2NrX2RldmljZSAqYmRl
diwgc2VjdG9yX3Qgc2VjdG9yLAo+Cj4gCW5yeiA9IG1pbigqbnJfem9uZXMsCj4gCQkgIF9fYmxr
ZGV2X25yX3pvbmVzKHEsIGJkZXYtPmJkX3BhcnQtPm5yX3NlY3RzIC0gc2VjdG9yKSk7Cj4tCXJl
dCA9IGJsa19yZXBvcnRfem9uZXMoYmRldi0+YmRfZGlzaywgZ2V0X3N0YXJ0X3NlY3QoYmRldikg
KyBzZWN0b3IsCj4tCQkJICAgICAgIHpvbmVzLCAmbnJ6KTsKPisJcmV0ID0gZGlzay0+Zm9wcy0+
cmVwb3J0X3pvbmVzKGRpc2ssIGdldF9zdGFydF9zZWN0KGJkZXYpICsgc2VjdG9yLAo+KwkJCQkg
ICAgICAgem9uZXMsICZucnopOwo+IAlpZiAocmV0KQo+IAkJcmV0dXJuIHJldDsKPgo+QEAgLTU1
Miw3ICs1MjgsNyBAQCBpbnQgYmxrX3JldmFsaWRhdGVfZGlza196b25lcyhzdHJ1Y3QgZ2VuZGlz
ayAqZGlzaykKPgo+IAl3aGlsZSAoeiA8IG5yX3pvbmVzKSB7Cj4gCQlucnogPSBtaW4obnJfem9u
ZXMgLSB6LCByZXBfbnJfem9uZXMpOwo+LQkJcmV0ID0gYmxrX3JlcG9ydF96b25lcyhkaXNrLCBz
ZWN0b3IsIHpvbmVzLCAmbnJ6KTsKPisJCXJldCA9IGRpc2stPmZvcHMtPnJlcG9ydF96b25lcyhk
aXNrLCBzZWN0b3IsIHpvbmVzLCAmbnJ6KTsKPiAJCWlmIChyZXQpCj4gCQkJZ290byBvdXQ7Cj4g
CQlpZiAoIW5yeikKPmRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLmMgYi9kcml2ZXJzL21kL2Rt
LmMKPmluZGV4IDFhNWUzMjhjNDQzYS4uNjQ3YWE1YjAyMzNiIDEwMDY0NAo+LS0tIGEvZHJpdmVy
cy9tZC9kbS5jCj4rKysgYi9kcml2ZXJzL21kL2RtLmMKPkBAIC00NzMsMTIgKzQ3Myw2IEBAIHN0
YXRpYyBpbnQgZG1fYmxrX3JlcG9ydF96b25lcyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgc2VjdG9y
X3Qgc2VjdG9yLAo+IAkJZ290byBvdXQ7Cj4gCX0KPgo+LQkvKgo+LQkgKiBibGtkZXZfcmVwb3J0
X3pvbmVzKCkgd2lsbCBsb29wIGFuZCBjYWxsIHRoaXMgYWdhaW4gdG8gY292ZXIgYWxsIHRoZQo+
LQkgKiB6b25lcyBvZiB0aGUgdGFyZ2V0LCBldmVudHVhbGx5IG1vdmluZyBvbiB0byB0aGUgbmV4
dCB0YXJnZXQuCj4tCSAqIFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gbG9vcCBoZXJlIHRyeWluZyB0
byBmaWxsIHRoZSBlbnRpcmUgYXJyYXkKPi0JICogb2Ygem9uZXMuCj4tCSAqLwo+IAlyZXQgPSB0
Z3QtPnR5cGUtPnJlcG9ydF96b25lcyh0Z3QsIHNlY3Rvciwgem9uZXMsIG5yX3pvbmVzKTsKPgo+
IG91dDoKPi0tIAo+Mi4yMS4wCj4KCkxvb2tzIGdvb2QgdG8gbWUuCgpSZXZpZXdlZC1ieTogSmF2
aWVyIEdvbnrDoWxleiA8amF2aWVyQGphdmlnb24uY29tPgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVs

