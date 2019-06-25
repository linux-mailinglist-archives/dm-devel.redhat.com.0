Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EB258D11
	for <lists+dm-devel@lfdr.de>; Thu, 27 Jun 2019 23:31:39 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D05F588313;
	Thu, 27 Jun 2019 21:31:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27543600CC;
	Thu, 27 Jun 2019 21:31:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6389D1806B1A;
	Thu, 27 Jun 2019 21:30:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PGsIC7015831 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 12:54:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E0835C237; Tue, 25 Jun 2019 16:54:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 085205C236
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 16:54:14 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B2AB9356DB
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 16:53:46 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id j29so13128096lfk.10
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 09:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=vHHgb54Q0BfAs8YIgZACGl/29xaSx7l4ApCtXBFbfN4=;
	b=OwjJ6MI5fFr6MREqqCFmqZIKon79e5NOLq/VxpW1LVnpQzj0dwCFqePPRTogYiBhby
	r32JOo+dOfsXvukpJTWY1IPSf31g8UoBj0ehc1OXlIgvPaVQdtmbCgqXqxJXGdfJuXai
	NEuh0A+ak/VC3phXrNBXTREO9w1J2GqhC5JV+wiQN07JDZufLRNe3QRfjXWWLgRewhH7
	wZQ5z0MVX0KejwbCkHRHUSEY8buIxdhhLa7A6gJEmRadxcoUvwpnIEkRvVvFjbFjAqwa
	TvSMAH4KS+K5mx5D/BITgHTL0G5zurhcROtdK7aR2X8CGaMYQR+wxSlzfC6RBou1+R/k
	b0sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=vHHgb54Q0BfAs8YIgZACGl/29xaSx7l4ApCtXBFbfN4=;
	b=ND0WC1xo22kLelSxxIXeLyaFIpraq0T68l5vca/UccgzvWzIK3iS8Oc0rApPB43VK7
	mauYkpKnkfcaO4T0FlOyN+s9KUjjfvHELw4z0QrCtXW7dmWWRxG6b0gw/lqCwTqMyqEu
	gq/bJw+7PKFPM93QrgJ7nI9Pc2+jphTz0ov7dKsh8DNmg0m914tP3O0XWgp1k4HhTMuQ
	EjjhXi5sPmurR0NDFMbtknnYSOap5BK2PKfTGxPU9Lf6BIfeqaQiC3ccLvXRyXsePxtq
	T1H2NBPTF1DsJDUxZ9/EMmKO1NigN+D4LPwjBKlY3857PWA0iHolqICbzEQhfS4o2Y8a
	t5dA==
X-Gm-Message-State: APjAAAXcXz67puBmwamu32E1XJbgeQFpPFYtL/rKw4hVNXiizJvwlC+O
	lTUZWrGrZ/UiZj1z51+ULrp22C8RWxvcrGotElm/6g==
X-Google-Smtp-Source: APXvYqx4NQnRORQnh6ff+Ahw2viJbUdzU4BvtAuyZw0wXevtQnU5aeLgOfwn81Z6lx4mhq2CtclLuDk/LYedTG6dyeU=
X-Received: by 2002:a19:22d8:: with SMTP id i207mr24053341lfi.97.1561481624939;
	Tue, 25 Jun 2019 09:53:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
	<cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
	<79ca395d-8019-9ec8-0c0b-194ca6d9eda0@acm.org>
	<BYAPR04MB5749977B2FFB5CDC8A254F5A86E30@BYAPR04MB5749.namprd04.prod.outlook.com>
In-Reply-To: <BYAPR04MB5749977B2FFB5CDC8A254F5A86E30@BYAPR04MB5749.namprd04.prod.outlook.com>
From: =?UTF-8?Q?Matias_Bj=C3=B8rling?= <mb@lightnvm.io>
Date: Tue, 25 Jun 2019 18:53:34 +0200
Message-ID: <CAOA7RkP83-6PgsKxzoa3i0bY7RW1R3Jh2zhLkywKsYJSnA3AMw@mail.gmail.com>
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 25 Jun 2019 16:53:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Tue, 25 Jun 2019 16:53:52 +0000 (UTC) for IP:'209.85.167.65'
	DOMAIN:'mail-lf1-f65.google.com' HELO:'mail-lf1-f65.google.com'
	FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: 0.202  (DKIM_INVALID, DKIM_SIGNED, SPF_HELO_NONE,
	SPF_NONE) 209.85.167.65 mail-lf1-f65.google.com
	209.85.167.65 mail-lf1-f65.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5PGsIC7015831
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 27 Jun 2019 17:29:46 -0400
Cc: "James.Bottomley@HansenPartnership.com"
	<James.Bottomley@hansenpartnership.com>,
	Damien Le Moal <Damien.LeMoal@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"axboe@fb.com" <axboe@fb.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	"hch@lst.de" <hch@lst.de>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] block: add zone open,
	close and finish support
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Thu, 27 Jun 2019 21:31:37 +0000 (UTC)

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgNjo1MSBQTSBDaGFpdGFueWEgS3Vsa2FybmkKPENoYWl0
YW55YS5LdWxrYXJuaUB3ZGMuY29tPiB3cm90ZToKPgo+IE9uIDA2LzI1LzIwMTkgMDg6NTYgQU0s
IEJhcnQgVmFuIEFzc2NoZSB3cm90ZToKPiA+IE9uIDYvMjUvMTkgMzozNSBBTSwgTWF0aWFzIEJq
w7hybGluZyB3cm90ZToKPiA+PiBPbiA2LzI1LzE5IDEyOjI3IEFNLCBDaGFpdGFueWEgS3Vsa2Fy
bmkgd3JvdGU6Cj4gPj4+IE9uIDYvMjQvMTkgMTI6NDMgUE0sIEJhcnQgVmFuIEFzc2NoZSB3cm90
ZToKPiA+Pj4+IHN0YXRpYyBpbmxpbmUgYm9vbCBvcF9pc193cml0ZSh1bnNpZ25lZCBpbnQgb3Ap
Cj4gPj4+PiB7Cj4gPj4+PiAgICAgIHJldHVybiAob3AgJiAxKTsKPiA+Pj4+IH0KPiA+Pj4+Cj4g
Pj4+Cj4gPj4KPiA+PiBUaGUgem9uZSBtZ210IGNvbW1hbmRzIGFyZSBuZWl0aGVyIHdyaXRlIG5v
ciByZWFkcyBjb21tYW5kcy4gSSBndWVzcywKPiA+PiBvbmUgY291bGQgY2hhcmFjdGVyaXplIHRo
ZW0gYXMgd3JpdGUgY29tbWFuZHMsIGJ1dCB0aGV5IGRvbid0IHdyaXRlIGFueQo+ID4+IGRhdGEs
IHRoZXkgdXBkYXRlIGEgc3RhdGUgb2YgYSB6b25lIG9uIGEgZHJpdmUuIE9uZSBzaG91bGQga2Vl
cCBpdCBhcwo+ID4+IGlzPyBhbmQgbWFrZSBzdXJlIHRoZSB6b25lIG1nbXQgY29tbWFuZHMgZG9u
J3QgZ2V0IGNhdGVnb3JpemVkIGFzIGVpdGhlcgo+ID4+IHJlYWQvd3JpdGUuCj4gPgo+ID4gU2lu
Y2UgdGhlIG9wZW4sIGNsb3NlIGFuZCBmaW5pc2ggb3BlcmF0aW9ucyBzdXBwb3J0IG1vZGlmeWlu
ZyB6b25lIGRhdGEKPiA+IEkgcHJvcG9zZSB0byBjaGFyYWN0ZXJpemUgdGhlc2UgYXMgd3JpdGUg
Y29tbWFuZHMuIEhvdyBhYm91dCB0aGUKPiA+IGZvbGxvd2luZyBhZGRpdGlvbmFsIGNoYW5nZXM6
Cj4gPiAtIE1ha2UgYmlvX2NoZWNrX3JvKCkgcmVmdXNlIG9wZW4vY2xvc2UvZmx1c2gvcmVzZXQg
em9uZSBvcGVyYXRpb25zIGZvcgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIF4KPiBTaW5jZSBmaW5pc2ggYWxzbyBsaXN0ZWQgYWJvdmUgd2hpY2ggc3VwcG9ydHMg
bW9kaWZ5aW5nIGRhdGEgZG8gd2UgbmVlZAo+IHRvIGFkZCBmaW5pc2ggaGVyZSB3aXRoIGZsdXNo
IGluIGFib3ZlIGxpbmUgPwo+Cj4gPiByZWFkLW9ubHkgcGFydGl0aW9ucyAoc2VlIGFsc28gY29t
bWl0IGEzMmUyMzZlYjkzZSAoIlBhcnRpYWxseSByZXZlcnQKPiA+ICJibG9jazogZmFpbCBvcF9p
c193cml0ZSgpIHJlcXVlc3RzIHRvIHJlYWQtb25seSBwYXJ0aXRpb25zIiIpICMgdjQuMTgpLgo+
ID4gLSBJbiBzdWJtaXRfYmlvKCksIGNoYW5nZSBvcF9pc193cml0ZShiaW9fb3AoYmlvKSkgPyAi
V1JJVEUiIDogIlJFQUQiCj4gPiBpbnRvIHNvbWV0aGluZyB0aGF0IHVzZXMgYmxrX29wX3N0cigp
Lgo+IEdvb2QgaWRlYSwgSSd2ZSBhIHBhdGNoIGZvciBibGtfb3Bfc3RyKCkgYW5kIGRlYnVnZnMg
anVzdCB3YWl0aW5nIGZvcgo+IHRoaXMgdG8gbWVyZ2UuIERvZXMgaXQgbWFrZSBzZW5zZSB0byBh
ZGQgdGhhdCBwYXRjaCBpbiB0aGlzIHNlcmllcyA/CgpTaGlwIGl0IG9mZiBzZXBhcmF0ZWx5LiBZ
b3VyIHBhdGNoZXMgY2FuIGdvIGluIGZpcnN0LgoKPiA+IC0gQWRkIG9wZW4vY2xvc2UvZmx1c2gg
em9uZSBzdXBwb3J0IGJlIGFkZGVkIGluIGJsa19wYXJ0aXRpb25fcmVtYXAoKS4KPiBzYW1lIGhl
cmUgZm9yIGZpbmlzaCA/Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IEJhcnQuCj4gPgo+CgotLQpk
bS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
