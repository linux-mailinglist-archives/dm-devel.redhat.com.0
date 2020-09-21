Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC6F271C6E
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 09:58:03 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-qYW_BY6sP5yUbB80jZOZmQ-1; Mon, 21 Sep 2020 03:58:00 -0400
X-MC-Unique: qYW_BY6sP5yUbB80jZOZmQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76ED480EF8B;
	Mon, 21 Sep 2020 07:57:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A19469296;
	Mon, 21 Sep 2020 07:57:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EE1D78C7AD;
	Mon, 21 Sep 2020 07:57:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L5rOSd004463 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 01:53:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B318110F744; Mon, 21 Sep 2020 05:53:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16C74110F741
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 05:53:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AE3B718AE947
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 05:53:21 +0000 (UTC)
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-370-V2xaTKoUOfyA7QlPgtJWOQ-1; Mon, 21 Sep 2020 01:53:19 -0400
X-MC-Unique: V2xaTKoUOfyA7QlPgtJWOQ-1
Received: by mail-vk1-f194.google.com with SMTP id n193so3052882vkf.12
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 22:53:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qQETu0O7sG8ZefKb7lE9RduahRzUSqc+hLCB6hG+Fns=;
	b=gWvT9203z2XNQknZtb+FxSmRh4BCUiS5VFuRYk6zl6rTv+7YEF9hlHG2TAeW2r2c/q
	cEGSodo6GocARK5LkxU8M60oNqg0uTPKbrOqif4YL4KjVNw9ZbZkeKI72d2mi9EQTVAG
	13Rfp8/2uX/UPj2HNVejsKg+nvIpkCE9gnsW41dRyLRub7QqGC1TuLqcNjXFRl3lmmFS
	IZoO8A9NnzsX7f4tJ46Ed75tCCVAVsUtvbteYlrFJAeiqp9H4b3hz0BRwAD7QykkS5Ys
	IkYWq3j47pjq7IH03FOBflsxdQD1nA4GDXPXaha8yHiCeevJT7YaUJ2BO+eAuc32ORQU
	SjaQ==
X-Gm-Message-State: AOAM530OlBHtFkwyGSJ+9KUOxD+6oBMpe5+oRTYqqc6bbKzGjjVMZLWI
	PiT2lg33MDiP5jBojFqdWFhFl5bKzD/+JP/OtFFw321b7xrJzWU+
X-Google-Smtp-Source: ABdhPJxfjUjmTXeHKimVJajbEcb0o8D28ZqtxiFxWNHvdiioP34k/JSkTjw0hXFK+7mnxl/ASTwGwXilqixsBm5+sz8=
X-Received: by 2002:a1f:fec9:: with SMTP id l192mr17383064vki.21.1600667598769;
	Sun, 20 Sep 2020 22:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
In-Reply-To: <160040692945.25320.13233625491405115889.stgit@dwillia2-desk3.amr.corp.intel.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Sep 2020 11:23:07 +0530
Message-ID: <CA+G9fYud7x0TfTDNWHa_0hzYHNQyet-a2==gQzDaZKXywY1meg@mail.gmail.com>
To: Dan Williams <dan.j.williams@intel.com>, Jan Kara <jack@suse.cz>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08L5rOSd004463
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 21 Sep 2020 03:57:37 -0400
Cc: Mike Snitzer <snitzer@redhat.com>, linux-nvdimm@lists.01.org,
	open list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	mpatocka@redhat.com, Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel] [PATCH v2] dm: Call proper helper to determine dax
	support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAxOCBTZXAgMjAyMCBhdCAxMToxOCwgRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPgo+
IERNIHdhcyBjYWxsaW5nIGdlbmVyaWNfZnNkYXhfc3VwcG9ydGVkKCkgdG8gZGV0ZXJtaW5lIHdo
ZXRoZXIgYSBkZXZpY2UKPiByZWZlcmVuY2VkIGluIHRoZSBETSB0YWJsZSBzdXBwb3J0cyBEQVgu
IEhvd2V2ZXIgdGhpcyBpcyBhIGhlbHBlciBmb3IgImxlYWYiIGRldmljZSBkcml2ZXJzIHNvIHRo
YXQKPiB0aGV5IGRvbid0IGhhdmUgdG8gZHVwbGljYXRlIGNvbW1vbiBnZW5lcmljIGNoZWNrcy4g
SGlnaCBsZXZlbCBjb2RlCj4gc2hvdWxkIGNhbGwgZGF4X3N1cHBvcnRlZCgpIGhlbHBlciB3aGlj
aCB0aGF0IGNhbGxzIGludG8gYXBwcm9wcmlhdGUKPiBoZWxwZXIgZm9yIHRoZSBwYXJ0aWN1bGFy
IGRldmljZS4gVGhpcyBwcm9ibGVtIG1hbmlmZXN0ZWQgaXRzZWxmIGFzCj4ga2VybmVsIG1lc3Nh
Z2VzOgo+Cj4gZG0tMzogZXJyb3I6IGRheCBhY2Nlc3MgZmFpbGVkICgtOTUpCj4KPiB3aGVuIGx2
bTItdGVzdHN1aXRlIHJ1biBpbiBjYXNlcyB3aGVyZSBhIERNIGRldmljZSB3YXMgc3RhY2tlZCBv
biB0b3Agb2YKPiBhbm90aGVyIERNIGRldmljZS4KPgo+IEZpeGVzOiA3YmY3ZWFjOGQ2NDggKCJk
YXg6IEFycmFuZ2UgZm9yIGRheF9zdXBwb3J0ZWQgY2hlY2sgdG8gc3BhbiBtdWx0aXBsZSBkZXZp
Y2VzIikKPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Cj4gVGVzdGVkLWJ5OiBBZHJpYW4g
SHVhbmcgPGFodWFuZzEyQGxlbm92by5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSmFuIEthcmEgPGph
Y2tAc3VzZS5jej4KPiBBY2tlZC1ieTogTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+
Cj4gLS0tCj4gQ2hhbmdlcyBzaW5jZSB2MSBbMV06Cj4gLSBBZGQgbWlzc2luZyBkYXhfcmVhZF9s
b2NrKCkgYXJvdW5kIGRheF9zdXBwb3J0ZWQoKQo+Cj4gWzFdOiBodHRwOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMDA5MTYxNTE0NDUuNDUwLTEtamFja0BzdXNlLmN6Cj4KPiAgZHJpdmVycy9kYXgv
c3VwZXIuYyAgIHwgICAgNCArKysrCj4gIGRyaXZlcnMvbWQvZG0tdGFibGUuYyB8ICAgMTAgKysr
KysrKy0tLQo+ICBpbmNsdWRlL2xpbnV4L2RheC5oICAgfCAgIDExICsrKysrKysrKy0tCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2RheC9zdXBlci5jIGIvZHJpdmVycy9kYXgvc3VwZXIuYwo+IGluZGV4
IGU1NzY3YzgzZWEyMy4uYjYyODRjNWNhZTBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZGF4L3N1
cGVyLmMKPiArKysgYi9kcml2ZXJzL2RheC9zdXBlci5jCj4gQEAgLTMyNSwxMSArMzI1LDE1IEBA
IEVYUE9SVF9TWU1CT0xfR1BMKGRheF9kaXJlY3RfYWNjZXNzKTsKPiAgYm9vbCBkYXhfc3VwcG9y
dGVkKHN0cnVjdCBkYXhfZGV2aWNlICpkYXhfZGV2LCBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpiZGV2
LAo+ICAgICAgICAgICAgICAgICBpbnQgYmxvY2tzaXplLCBzZWN0b3JfdCBzdGFydCwgc2VjdG9y
X3QgbGVuKQo+ICB7Cj4gKyAgICAgICBpZiAoIWRheF9kZXYpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiBmYWxzZTsKPiArCj4gICAgICAgICBpZiAoIWRheF9hbGl2ZShkYXhfZGV2KSkKPiAgICAg
ICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+Cj4gICAgICAgICByZXR1cm4gZGF4X2Rldi0+b3Bz
LT5kYXhfc3VwcG9ydGVkKGRheF9kZXYsIGJkZXYsIGJsb2Nrc2l6ZSwgc3RhcnQsIGxlbik7Cj4g
IH0KPiArRVhQT1JUX1NZTUJPTF9HUEwoZGF4X3N1cHBvcnRlZCk7Cgphcm0gYnVpbGQgZXJyb3Ig
d2hpbGUgYnVpbGRpbmcgd2l0aCBhbGxtb2Rjb25maWcuCgouLi9kcml2ZXJzL2RheC9zdXBlci5j
OjMyNTo2OiBlcnJvcjogcmVkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkKICAzMjUg
fCBib29sIGRheF9zdXBwb3J0ZWQoc3RydWN0IGRheF9kZXZpY2UgKmRheF9kZXYsIHN0cnVjdApi
bG9ja19kZXZpY2UgKmJkZXYsCiAgICAgIHwgICAgICBefn5+fn5+fn5+fn5+CkluIGZpbGUgaW5j
bHVkZWQgZnJvbSAuLi9kcml2ZXJzL2RheC9zdXBlci5jOjE2OgouLi9pbmNsdWRlL2xpbnV4L2Rh
eC5oOjE2MjoyMDogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZgrigJhkYXhfc3VwcG9ydGVk
4oCZIHdhcyBoZXJlCiAgMTYyIHwgc3RhdGljIGlubGluZSBib29sIGRheF9zdXBwb3J0ZWQoc3Ry
dWN0IGRheF9kZXZpY2UgKmRheF9kZXYsCiAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+fn5+
fn5+fn5+fn4KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI4MzogZHJp
dmVycy9kYXgvc3VwZXIub10gRXJyb3IgMQoKUmVwb3J0ZWQtYnk6IE5hcmVzaCBLYW1ib2p1IDxu
YXJlc2gua2FtYm9qdUBsaW5hcm8ub3JnPgoKUmVmOgpodHRwczovL2J1aWxkcy50dXhidWlsZC5j
b20vSU82OTBqRlFEcDBxUDl6RnVXQnFwQS9idWlsZC5sb2cKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

