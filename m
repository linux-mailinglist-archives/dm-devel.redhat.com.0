Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC84550D6
	for <lists+dm-devel@lfdr.de>; Tue, 25 Jun 2019 15:53:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3ED563082AF2;
	Tue, 25 Jun 2019 13:53:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47560608BA;
	Tue, 25 Jun 2019 13:53:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C9851806B19;
	Tue, 25 Jun 2019 13:52:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5PAZLdM001293 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 25 Jun 2019 06:35:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 25DDD1001DFE; Tue, 25 Jun 2019 10:35:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx19.extmail.prod.ext.phx2.redhat.com
	[10.5.110.48])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 20D3A10013D9
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 10:35:18 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1B8E03078AD7
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 10:35:05 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id a25so12267693lfg.2
	for <dm-devel@redhat.com>; Tue, 25 Jun 2019 03:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=lightnvm-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=EGjfhIk5TSN9FaIfuigOm3JkqdiZdbnqlP1fTL53QW4=;
	b=KOe/7GGnb9guFoDqCfkS5NUn9D6GDW6anEPhkzSe4sb4u4e5wQeNrsV+R64/xpTuhl
	iD7V2xuwQjeDUzbRsYt4GUeVK8aenCJTNrAxhSFS/H67p5oyemMuW9iUadPHrnaduQ5E
	QZtGmJNZ43tCR3BKAqAYwxw9Z1vFM3bkyZknYFxHgYEHw338izNPCusYNFh8Dmu9CHLl
	I3bpWPCznu0PuIxo6HsejEClDHD9NjC7ovnOrvczsFmU2k5U0CqIYS/MiOyZGjpNBBDE
	5+vQLLFo+AeTwZpVBmCJqfOGp/Q++LuhMwNwjO5alq2BUMmVoXcpaOQESrx/69WsQZUU
	NNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=EGjfhIk5TSN9FaIfuigOm3JkqdiZdbnqlP1fTL53QW4=;
	b=PK7jSLLDQPlPZRh9lbZSyRJhPoE8lGU9/e4VgyEDFLTU9V0Q5mfo6NIGr9Odg1/XJ4
	6We9f15/QKvjuFofaNAL/xqmzarFDdTInKoXhZN1dV9mWbeg6PgslBsz0yDehw6h8sg7
	erYVPiVz7fEj4NvOU37/Q6fQA7zUknirPwA3FBQrW7BPLyPCVnYHajRojOU0WUOat4Xp
	tz83lSWDXJPEI/ojt2NKlsIj7eswSwfTT1nYtzIyoRSBGerPQeoWqsoTnznEgIl5yc70
	xZPiBkEcsGJDR2iiv7ms/tqtmboo9dpJX8Vn7U/E2vr3oe7W9kcewW9hJKUNV1Ya1XIm
	pyBQ==
X-Gm-Message-State: APjAAAU7hveycVaBpzUwOK5CgboUOAN5uqkxB9Jhax2lECK8n8Qen+7M
	uCYZ+xZNOejSfT5C5qAWDcQ0Rg==
X-Google-Smtp-Source: APXvYqwrNvD5m3v3LyKns+LBQyX4g8GF8KVIhTUjFGqgIDy4CqsHB0bpIJZ+Jvt3yL56+cH0RwtSvg==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr77759447lfl.1.1561458903508;
	Tue, 25 Jun 2019 03:35:03 -0700 (PDT)
Received: from [192.168.0.36] (2-111-91-225-cable.dk.customer.tdc.net.
	[2.111.91.225]) by smtp.googlemail.com with ESMTPSA id
	t21sm2214209ljg.60.2019.06.25.03.35.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jun 2019 03:35:02 -0700 (PDT)
To: Chaitanya Kulkarni <Chaitanya.Kulkarni@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>, "axboe@fb.com" <axboe@fb.com>,
	"hch@lst.de" <hch@lst.de>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>, Ajay Joshi <Ajay.Joshi@wdc.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>,
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>,
	"James.Bottomley@HansenPartnership.com"
	<James.Bottomley@HansenPartnership.com>, "agk@redhat.com" <agk@redhat.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
References: <20190621130711.21986-1-mb@lightnvm.io>
	<20190621130711.21986-2-mb@lightnvm.io>
	<ee5764fb-473a-f118-eaac-95478d885f6f@acm.org>
	<BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
From: =?UTF-8?Q?Matias_Bj=c3=b8rling?= <mb@lightnvm.io>
Message-ID: <cce08df0-0b4d-833d-64ce-f9b81f7ad7ca@lightnvm.io>
Date: Tue, 25 Jun 2019 12:35:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <BYAPR04MB5749CEFBB45EA34BD3345CD686E00@BYAPR04MB5749.namprd04.prod.outlook.com>
Content-Language: en-GB
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 25 Jun 2019 10:35:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]);
	Tue, 25 Jun 2019 10:35:05 +0000 (UTC) for IP:'209.85.167.67'
	DOMAIN:'mail-lf1-f67.google.com' HELO:'mail-lf1-f67.google.com'
	FROM:'mb@lightnvm.io' RCPT:''
X-RedHat-Spam-Score: -0.009  (DKIM_SIGNED, DKIM_VALID, RCVD_IN_DNSWL_NONE,
	SPF_NONE) 209.85.167.67 mail-lf1-f67.google.com
	209.85.167.67 mail-lf1-f67.google.com <mb@lightnvm.io>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.48
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 25 Jun 2019 09:50:33 -0400
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
	Matias Bjorling <Matias.Bjorling@wdc.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Tue, 25 Jun 2019 13:53:41 +0000 (UTC)

T24gNi8yNS8xOSAxMjoyNyBBTSwgQ2hhaXRhbnlhIEt1bGthcm5pIHdyb3RlOgo+IE9uIDYvMjQv
MTkgMTI6NDMgUE0sIEJhcnQgVmFuIEFzc2NoZSB3cm90ZToKPj4gT24gNi8yMS8xOSA2OjA3IEFN
LCBNYXRpYXMgQmrDuHJsaW5nIHdyb3RlOgo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
YmxrX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oCj4+PiBpbmRleCA5NTIwMmY4
MDY3NmMuLjA2N2VmOTI0MjI3NSAxMDA2NDQKPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvYmxrX3R5
cGVzLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvYmxrX3R5cGVzLmgKPj4+IEBAIC0yODQsMTMg
KzI4NCwyMCBAQCBlbnVtIHJlcV9vcGYgewo+Pj4gICAgIAlSRVFfT1BfRElTQ0FSRAkJPSAzLAo+
Pj4gICAgIAkvKiBzZWN1cmVseSBlcmFzZSBzZWN0b3JzICovCj4+PiAgICAgCVJFUV9PUF9TRUNV
UkVfRVJBU0UJPSA1LAo+Pj4gLQkvKiByZXNldCBhIHpvbmUgd3JpdGUgcG9pbnRlciAqLwo+Pj4g
LQlSRVFfT1BfWk9ORV9SRVNFVAk9IDYsCj4+PiAgICAgCS8qIHdyaXRlIHRoZSBzYW1lIHNlY3Rv
ciBtYW55IHRpbWVzICovCj4+PiAgICAgCVJFUV9PUF9XUklURV9TQU1FCT0gNywKPj4+ICAgICAJ
Lyogd3JpdGUgdGhlIHplcm8gZmlsbGVkIHNlY3RvciBtYW55IHRpbWVzICovCj4+PiAgICAgCVJF
UV9PUF9XUklURV9aRVJPRVMJPSA5LAo+Pj4gICAgIAo+Pj4gKwkvKiByZXNldCBhIHpvbmUgd3Jp
dGUgcG9pbnRlciAqLwo+Pj4gKwlSRVFfT1BfWk9ORV9SRVNFVAk9IDE2LAo+Pj4gKwkvKiBPcGVu
IHpvbmUocykgKi8KPj4+ICsJUkVRX09QX1pPTkVfT1BFTgk9IDE3LAo+Pj4gKwkvKiBDbG9zZSB6
b25lKHMpICovCj4+PiArCVJFUV9PUF9aT05FX0NMT1NFCT0gMTgsCj4+PiArCS8qIEZpbmlzaCB6
b25lKHMpICovCj4+PiArCVJFUV9PUF9aT05FX0ZJTklTSAk9IDE5LAo+Pj4gKwo+Pj4gICAgIAkv
KiBTQ1NJIHBhc3N0aHJvdWdoIHVzaW5nIHN0cnVjdCBzY3NpX3JlcXVlc3QgKi8KPj4+ICAgICAJ
UkVRX09QX1NDU0lfSU4JCT0gMzIsCj4+PiAgICAgCVJFUV9PUF9TQ1NJX09VVAkJPSAzMywKPj4+
IEBAIC0zNzUsNiArMzgyLDIyIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBiaW9fc2V0X29wX2F0dHJz
KHN0cnVjdCBiaW8gKmJpbywgdW5zaWduZWQgb3AsCj4+PiAgICAgCWJpby0+Ymlfb3BmID0gb3Ag
fCBvcF9mbGFnczsKPj4+ICAgICB9Cj4+Cj4+IEFyZSB0aGUgbmV3IG9wZXJhdGlvbiB0eXBlcyBl
dmVyIHBhc3NlZCB0byBvcF9pc193cml0ZSgpPyBUaGUgZGVmaW5pdGlvbgo+PiBvZiB0aGF0IGZ1
bmN0aW9uIGlzIGFzIGZvbGxvd3M6Cj4+Cj4gTWF5IGJlIHdlIHNob3VsZCBjaGFuZ2UgbnVtYmVy
aW5nIHNpbmNlIGJsa3RyYWNlIGFsc28gcmVsaWVzIG9uIHRoZQo+IGhhdmluZyBvbl9pc193cml0
ZSgpIHdpdGhvdXQgbG9va2luZyBhdCB0aGUgcnFfb3BzKCkuCj4gCj4gMTk3ICAqIERhdGEgZGly
ZWN0aW9uIGJpdCBsb29rdXAKPiAgICAxOTggICovCj4gICAgMTk5IHN0YXRpYyBjb25zdCB1MzIg
ZGRpcl9hY3RbMl0gPSB7IEJMS19UQ19BQ1QoQkxLX1RDX1JFQUQpLAo+ICAgIDIwMCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBCTEtfVENfQUNUKEJMS19UQ19XUklURSkgfTsgIDwt
LS0tCj4gICAgMjAxCj4gICAgMjAyICNkZWZpbmUgQkxLX1RDX1JBSEVBRCAgICAgICAgICAgQkxL
X1RDX0FIRUFECj4gICAgMjAzICNkZWZpbmUgQkxLX1RDX1BSRUZMVVNIICAgICAgICAgQkxLX1RD
X0ZMVVNICj4gICAgMjA0Cj4gICAgMjA1IC8qIFRoZSBpbG9nMigpIGNhbGxzIGZhbGwgb3V0IGJl
Y2F1c2UgdGhleSdyZSBjb25zdGFudCAqLwo+ICAgIDIwNiAjZGVmaW5lIE1BU0tfVENfQklUKHJ3
LCBfX25hbWUpICgocncgJiBSRVFfICMjIF9fbmFtZSkgPDwgXAo+ICAgIDIwNyAgICAgICAgICAg
KGlsb2cyKEJMS19UQ18gIyMgX19uYW1lKSArIEJMS19UQ19TSElGVCAtIF9fUkVRXyAjIwo+IF9f
bmFtZSkpCj4gICAgMjA4Cj4gICAgMjA5IC8qCj4gICAgMjEwICAqIFRoZSB3b3JrZXIgZm9yIHRo
ZSB2YXJpb3VzIGJsa19hZGRfdHJhY2UqKCkgdHlwZXMuIEZpbGxzIG91dCBhCj4gICAgMjExICAq
IGJsa19pb190cmFjZSBzdHJ1Y3R1cmUgYW5kIHBsYWNlcyBpdCBpbiBhIHBlci1jcHUgc3ViYnVm
ZmVyLgo+ICAgIDIxMiAgKi8KPiAgICAyMTMgc3RhdGljIHZvaWQgX19ibGtfYWRkX3RyYWNlKHN0
cnVjdCBibGtfdHJhY2UgKmJ0LCBzZWN0b3JfdCBzZWN0b3IsCj4gaW50IGJ5dGVzLAo+ICAgIDIx
NCAgICAgICAgICAgICAgICAgICAgICBpbnQgb3AsIGludCBvcF9mbGFncywgdTMyIHdoYXQsIGlu
dCBlcnJvciwKPiBpbnQgcGR1X2xlbiwKPiAgICAyMTUgICAgICAgICAgICAgICAgICAgICAgdm9p
ZCAqcGR1X2RhdGEsIHVuaW9uIGtlcm5mc19ub2RlX2lkICpjZ2lkKQo+ICAgIDIxNiB7Cj4gICAg
MjE3ICAgICAgICAgc3RydWN0IHRhc2tfc3RydWN0ICp0c2sgPSBjdXJyZW50Owo+ICAgIDIxOCAg
ICAgICAgIHN0cnVjdCByaW5nX2J1ZmZlcl9ldmVudCAqZXZlbnQgPSBOVUxMOwo+ICAgIDIxOSAg
ICAgICAgIHN0cnVjdCByaW5nX2J1ZmZlciAqYnVmZmVyID0gTlVMTDsKPiAgICAyMjAgICAgICAg
ICBzdHJ1Y3QgYmxrX2lvX3RyYWNlICp0Owo+ICAgIDIyMSAgICAgICAgIHVuc2lnbmVkIGxvbmcg
ZmxhZ3MgPSAwOwo+ICAgIDIyMiAgICAgICAgIHVuc2lnbmVkIGxvbmcgKnNlcXVlbmNlOwo+ICAg
IDIyMyAgICAgICAgIHBpZF90IHBpZDsKPiAgICAyMjQgICAgICAgICBpbnQgY3B1LCBwYyA9IDA7
Cj4gICAgMjI1ICAgICAgICAgYm9vbCBibGtfdHJhY2VyID0gYmxrX3RyYWNlcl9lbmFibGVkOwo+
ICAgIDIyNiAgICAgICAgIHNzaXplX3QgY2dpZF9sZW4gPSBjZ2lkID8gc2l6ZW9mKCpjZ2lkKSA6
IDA7Cj4gICAgMjI3Cj4gICAgMjI4ICAgICAgICAgaWYgKHVubGlrZWx5KGJ0LT50cmFjZV9zdGF0
ZSAhPSBCbGt0cmFjZV9ydW5uaW5nICYmCj4gIWJsa190cmFjZXIpKQo+ICAgIDIyOSAgICAgICAg
ICAgICAgICAgcmV0dXJuOwo+ICAgIDIzMAo+ICAgIDIzMSAgICAgICAgIHdoYXQgfD0gZGRpcl9h
Y3Rbb3BfaXNfd3JpdGUob3ApID8gV1JJVEUgOiBSRUFEXTsgIDwtLS0KPiAKPiAKPj4gc3RhdGlj
IGlubGluZSBib29sIG9wX2lzX3dyaXRlKHVuc2lnbmVkIGludCBvcCkKPj4gewo+PiAJcmV0dXJu
IChvcCAmIDEpOwo+PiB9Cj4+Cj4gCgpUaGUgem9uZSBtZ210IGNvbW1hbmRzIGFyZSBuZWl0aGVy
IHdyaXRlIG5vciByZWFkcyBjb21tYW5kcy4gSSBndWVzcywgCm9uZSBjb3VsZCBjaGFyYWN0ZXJp
emUgdGhlbSBhcyB3cml0ZSBjb21tYW5kcywgYnV0IHRoZXkgZG9uJ3Qgd3JpdGUgYW55IApkYXRh
LCB0aGV5IHVwZGF0ZSBhIHN0YXRlIG9mIGEgem9uZSBvbiBhIGRyaXZlLiBPbmUgc2hvdWxkIGtl
ZXAgaXQgYXMgCmlzPyBhbmQgbWFrZSBzdXJlIHRoZSB6b25lIG1nbXQgY29tbWFuZHMgZG9uJ3Qg
Z2V0IGNhdGVnb3JpemVkIGFzIGVpdGhlciAKcmVhZC93cml0ZS4KCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==
