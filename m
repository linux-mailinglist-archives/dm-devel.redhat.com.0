Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8C768271C6D
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 09:58:02 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-zTSEmA_FPAKCL5Qybjg8PQ-1; Mon, 21 Sep 2020 03:57:58 -0400
X-MC-Unique: zTSEmA_FPAKCL5Qybjg8PQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C371018F7F;
	Mon, 21 Sep 2020 07:57:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBC655577B;
	Mon, 21 Sep 2020 07:57:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B8448C7C9;
	Mon, 21 Sep 2020 07:57:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L64cIj005224 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 02:04:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A08F52024508; Mon, 21 Sep 2020 06:04:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C0962028E91
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 06:04:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0598101A540
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 06:04:31 +0000 (UTC)
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-531-cjANCfAmPgydIa7uHkdsOw-1; Mon, 21 Sep 2020 02:04:29 -0400
X-MC-Unique: cjANCfAmPgydIa7uHkdsOw-1
Received: by mail-vs1-f67.google.com with SMTP id e2so7404781vsr.7
	for <dm-devel@redhat.com>; Sun, 20 Sep 2020 23:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=gmSKhpFY4kTNF3DPRn/4uO6u6dZbhjoQaX0s9W7i2IM=;
	b=tUGCX74Xi6QcADHOkjgHg/gaFj0vZiwMoKNF0WSz29R1WfFUmYzHc4lxD0j0JIXufv
	O18qq7lP4pS07GBlm6SdNwSX2AumeA9tCCK++mTwhBG6KTfZYiZD9RMdqFcuXjmHbzlQ
	b4I48sIgBboch8PVkt0P4TbkRCiJw2ezlhUtq6R9ZVKvYIsJQLLniNIcP6fpLjuorvrP
	N2wJvy+IhoFf4BehCzUdNU3tp7gGDYFmt/ldLUaFz+mY8x9ZjU5ZiPt8L5jvu3DvQtuv
	/mEyTpzFIfuSqGqsCMkjL+VBcBSlYfsc6XYkTUrKHjLilNMAzfF9mjJDiqBqsBZq8B1+
	vyJw==
X-Gm-Message-State: AOAM531SX+k3aA9lbGXZmiYLA28B5KelOYHwlDd2t6x0IO3OaEBL11gH
	c4Jepaf2mE9X70XN9jqNxD/wFhRyeHwjfghQ0F6LhQ==
X-Google-Smtp-Source: ABdhPJzuk1/PiphSwuUvjP6+E5H+PEm5LcR5lGn9Fq1X93k9XatzTGELxhm95y0PWoUFN4sZmwm7EgBxD7/W71hG544=
X-Received: by 2002:a67:80d2:: with SMTP id b201mr26678854vsd.12.1600668268677;
	Sun, 20 Sep 2020 23:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200921010359.GO3027113@arch-chirva.localdomain>
In-Reply-To: <20200921010359.GO3027113@arch-chirva.localdomain>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 21 Sep 2020 11:34:17 +0530
Message-ID: <CA+G9fYtCg2KjdB2oBUDJ2DKAzUxq3u8ZnMY9Et-RG9Pnrmuf9w@mail.gmail.com>
To: Stuart Little <achirvasub@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08L64cIj005224
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 21 Sep 2020 03:57:37 -0400
Cc: Dave Jiang <dave.jiang@intel.com>, Mike Snitzer <snitzer@redhat.com>,
	linux-nvdimm@lists.01.org,
	Vishal Verma <vishal.l.verma@intel.com>, Jan Kara <jack@suse.cz>,
	kernel list <linux-kernel@vger.kernel.org>,
	linux- stable <stable@vger.kernel.org>, dm-devel@redhat.com,
	Adrian Huang <ahuang12@lenovo.com>, lkft-triage@lists.linaro.org,
	mpatocka@redhat.com, Dan Williams <dan.j.williams@intel.com>,
	Ira Weiny <ira.weiny@intel.com>
Subject: Re: [dm-devel]
	=?utf-8?q?PROBLEM=3A_5=2E9=2E0-rc6_fails_to_compile_du?=
	=?utf-8?b?ZSB0byAncmVkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkn?=
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMSBTZXAgMjAyMCBhdCAwNjozNCwgU3R1YXJ0IExpdHRsZSA8YWNoaXJ2YXN1YkBn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gSSBhbSB0cnlpbmcgdG8gY29tcGlsZSBmb3IgYW4geDg2XzY0
IG1hY2hpbmUgKEludGVsKFIpIENvcmUoVE0pIGk3LTc1MDBVIENQVSBAIDIuNzBHSHopLiBUaGUg
Y29uZmlnIGZpbGUgSSBhbSBjdXJyZW50bHkgdXNpbmcgaXMgYXQKPgo+IGh0dHBzOi8vdGVybWJp
bi5jb20veGluNwo+Cj4gVGhlIGJ1aWxkIGZvciA1LjkuMC1yYzYgZmFpbHMgd2l0aCB0aGUgZm9s
bG93aW5nIGVycm9yczoKPgoKYXJtIGFuZCBtaXBzIGFsbG1vZGNvbmZpZyBidWlsZCBicmVha3Mg
ZHVlIHRvIHRoaXMgZXJyb3IuCgo+Cj4gZHJpdmVycy9kYXgvc3VwZXIuYzozMjU6NjogZXJyb3I6
IHJlZGVmaW5pdGlvbiBvZiDigJhkYXhfc3VwcG9ydGVk4oCZCj4gICAzMjUgfCBib29sIGRheF9z
dXBwb3J0ZWQoc3RydWN0IGRheF9kZXZpY2UgKmRheF9kZXYsIHN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYsCj4gICAgICAgfCAgICAgIF5+fn5+fn5+fn5+fn4KPiBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gZHJpdmVycy9kYXgvc3VwZXIuYzoxNjoKPiAuL2luY2x1ZGUvbGludXgvZGF4Lmg6MTYyOjIw
OiBub3RlOiBwcmV2aW91cyBkZWZpbml0aW9uIG9mIOKAmGRheF9zdXBwb3J0ZWTigJkgd2FzIGhl
cmUKPiAgIDE2MiB8IHN0YXRpYyBpbmxpbmUgYm9vbCBkYXhfc3VwcG9ydGVkKHN0cnVjdCBkYXhf
ZGV2aWNlICpkYXhfZGV2LAo+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+
fn4KPiAgIENDICAgICAgbGliL21lbXJlZ2lvbi5vCj4gICBDQyBbTV0gIGRyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX3ZyYW1faGVscGVyLm8KPiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6MjgzOiBkcml2ZXJzL2RheC9zdXBlci5vXSBFcnJvciAxCj4gbWFrZVsxXTogKioqIFtz
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjUwMDogZHJpdmVycy9kYXhdIEVycm9yIDIKPiBtYWtlWzFd
OiAqKiogV2FpdGluZyBmb3IgdW5maW5pc2hlZCBqb2JzLi4uLgo+Cj4gLS0tIGVuZCAtLS0KPgo+
IFRoYXQncyBlYXJsaWVyIG9uLCBhbmQgdGhlbiBsYXRlciwgYXQgdGhlIGVuZCBvZiB0aGUgKGZh
aWxlZCkgYnVpbGQ6Cj4KPiBtYWtlOiAqKiogW01ha2VmaWxlOjE3ODQ6IGRyaXZlcnNdIEVycm9y
IDIKPgo+IFRoZSBmdWxsIGJ1aWxkIGxvZyBpcyBhdAo+Cj4gaHR0cHM6Ly90ZXJtYmluLmNvbS9p
aHhqCj4KPiBidXQgSSBkbyBub3Qgc2VlIGFueXRoaW5nIGVsc2UgYW1pc3MuIDUuOS4wLXJjNSBi
dWlsdCBmaW5lIGxhc3Qgd2Vlay4KClJlcG9ydGVkLWJ5OiBOYXJlc2ggS2FtYm9qdSA8bmFyZXNo
LmthbWJvanVAbGluYXJvLm9yZz4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWw=

