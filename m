Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A75509D2
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 13:32:31 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EC4BE308FED2;
	Mon, 24 Jun 2019 11:32:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1FD05C1B5;
	Mon, 24 Jun 2019 11:32:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6717F206D2;
	Mon, 24 Jun 2019 11:31:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5OBTnAg016640 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 07:29:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 715A66012D; Mon, 24 Jun 2019 11:29:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0AC8C600CD;
	Mon, 24 Jun 2019 11:29:47 +0000 (UTC)
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E99D2C058CA2;
	Mon, 24 Jun 2019 11:29:36 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id m24so848842ioo.2;
	Mon, 24 Jun 2019 04:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=RJ1Yh+LNMqhQVm8iOyR5qjv7kJ/RHGp5zLPw3SH83w0=;
	b=c5bvuZEpRfvUHl4jDj5BiXpkbrEsP/dd5P1W4whfmDtQbOf+JzvaxN/1dypuGL1Ejc
	6RfEQohvVr+yQcVirjt04wIbAB2ZFnWfjaOfs/G5rwg54sfue7TTjKQ1ZzuyoBcihDx0
	tll5BOZZ7RbpK6XKA8euv4Q9EnnXrg7lVPmAFV+Yw5gQwIbHAXtp/sMvTaCBUF3TGWHn
	86NyV93WEjF3FFDycLxtOJMsrEuL7pJZ/P7F5auJfgNBcyMroy/TMN65MXD/2XEPcv/g
	cbHk0S4v33U/iA4D/J4Ut2LkufQGC62sWCQBjhV6HKSTs/b9JUCPDPGcxW8Cp+R4NS8o
	rLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=RJ1Yh+LNMqhQVm8iOyR5qjv7kJ/RHGp5zLPw3SH83w0=;
	b=eGjAPbRFR7vvtQcMCjp8AWZvB5nTJ3Pq6/rfPPGKuA8L4SSTAEEeT4+ETmb89z86jX
	wt/vlzcCt0JIFvufr0Z3jCnyazW03vDXDihRd/t8QWGK4SWHJo3sS4owOziKhHUYbMQT
	sx5M1MPZbOndA8XF8en3GgfMVhaQhHEkFHkmW2zpS+amoIOIoJNuCnAzHj467pLxmXQ2
	ZEHN9ggQClEyOM8Zy14bc8TFoQuwP/I2Sy1UbPq9qe96h4GXMM9extFB2TKLuObjANO6
	YUHSDZiafdIxuvAwrf5JYzuNgCBCd90YtWX0+oo2F6ZeU28sit/s0EgBR9iI/x4UaLuv
	3SQw==
X-Gm-Message-State: APjAAAUe6VBcgB8tbxZtN2LVyvwcaYRc6aORhhNBn5V2FYyF1fj6Aab9
	AgGIpUPDOqP60xJepXWuDx0gwOTHC3baG/og/NNk9qLg4s0=
X-Google-Smtp-Source: APXvYqyNqLkm37oWU0s4SePn1ZjtwzpCVThCPNsZAScNZc1/NNox3Rh2sRlUaIwa+ZME3injCBsG7Fd6tq8NJgp2hbo=
X-Received: by 2002:a02:cc6c:: with SMTP id j12mr39052091jaq.102.1561375776134;
	Mon, 24 Jun 2019 04:29:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:9896:0:0:0:0:0 with HTTP; Mon, 24 Jun 2019 04:29:35
	-0700 (PDT)
In-Reply-To: <20190624092756.7769-5-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
	<20190624092756.7769-5-mwilck@suse.com>
From: Surachai Saiwong <buriram1601@gmail.com>
Date: Mon, 24 Jun 2019 18:29:35 +0700
Message-ID: <CAL1AwE-vVOW_AerLGfvCEMsH1Ga7a5LHSvFEV3sH-JziDR8DqQ@mail.gmail.com>
To: Martin Wilck <mwilck@suse.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 24 Jun 2019 11:29:37 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]);
	Mon, 24 Jun 2019 11:29:37 +0000 (UTC) for IP:'209.85.166.65'
	DOMAIN:'mail-io1-f65.google.com' HELO:'mail-io1-f65.google.com'
	FROM:'buriram1601@gmail.com' RCPT:''
X-RedHat-Spam-Score: 0.141  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 209.85.166.65 mail-io1-f65.google.com 209.85.166.65
	mail-io1-f65.google.com <buriram1601@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.32
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x5OBTnAg016640
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 04/30] libmultipath: fix
 -Wstringop-overflow warning in merge_words()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 24 Jun 2019 11:32:30 +0000 (UTC)

MjU2Mi0wNi0yNCAxNjoyNyBHTVQrMDc6MDAsIE1hcnRpbiBXaWxjayA8bXdpbGNrQHN1c2UuY29t
PjoKPiBGaXhlcyB0aGUgZm9sbG93aW5nIHdhcm5pbmcgZnJvbSBnY2MgOToKPgo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSAvdXNyL2luY2x1ZGUvc3RyaW5nLmg6NDk0LAo+ICAgICAgICAgICAgICAg
ICAgZnJvbSBkbXBhcnNlci5jOjg6Cj4gSW4gZnVuY3Rpb24g4oCYc3RybmNweeKAmSwKPiAgICAg
aW5saW5lZCBmcm9tIOKAmG1lcmdlX3dvcmRz4oCZIGF0IGRtcGFyc2VyLmM6NDE6MjoKPiAvdXNy
L2luY2x1ZGUvYml0cy9zdHJpbmdfZm9ydGlmaWVkLmg6MTA2OjEwOiB3YXJuaW5nOiDigJhfX2J1
aWx0aW5fc3RybmNweeKAmQo+ICAgICAgICAgICAgICAgICAgc3BlY2lmaWVkIGJvdW5kIGRlcGVu
ZHMgb24gdGhlIGxlbmd0aCBvZiB0aGUgc291cmNlCj4gYXJndW1lbnQKPiAgICAgICAgICAgICAg
ICAgIFstV3N0cmluZ29wLW92ZXJmbG93PV0KPiAgIDEwNiB8ICAgcmV0dXJuIF9fYnVpbHRpbl9f
X3N0cm5jcHlfY2hrIChfX2Rlc3QsIF9fc3JjLCBfX2xlbiwgX19ib3MKPiAoX19kZXN0KSk7Cj4g
ICAgICAgfAo+IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+Cj4gZG1wYXJzZXIuYzogSW4gZnVuY3Rpb24g4oCYbWVyZ2Vfd29yZHPi
gJk6Cj4gZG1wYXJzZXIuYzo0MToxOTogbm90ZTogbGVuZ3RoIGNvbXB1dGVkIGhlcmUKPiAgICA0
MSB8ICBzdHJuY3B5KHAsIHdvcmQsIHN0cmxlbih3b3JkKSArIDEpOwo+ICAgICAgIHwgICAgICAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+Cj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJ0aW4gV2lsY2sg
PG13aWxja0BzdXNlLmNvbT4KPiAtLS0KPiAgbGlibXVsdGlwYXRoL2RtcGFyc2VyLmMgfCAxNSAr
KysrKystLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgOSBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWJtdWx0aXBhdGgvZG1wYXJzZXIuYyBiL2xpYm11
bHRpcGF0aC9kbXBhcnNlci5jCj4gaW5kZXggMDRmNjc1YzEuLmE4YjBiNzFhIDEwMDY0NAo+IC0t
LSBhL2xpYm11bHRpcGF0aC9kbXBhcnNlci5jCj4gKysrIGIvbGlibXVsdGlwYXRoL2RtcGFyc2Vy
LmMKPiBAQCAtMjEsMjQgKzIxLDIxIEBAIHN0YXRpYyBpbnQKPiAgbWVyZ2Vfd29yZHMoY2hhciAq
KmRzdCwgY2hhciAqd29yZCkKPiAgewo+ICAJY2hhciAqIHAgPSAqZHN0Owo+IC0JaW50IGxlbjsK
PiArCWludCBsZW4sIGRzdGxlbjsKPgo+IC0JbGVuID0gc3RybGVuKCpkc3QpICsgc3RybGVuKHdv
cmQpICsgMTsKPiAtCSpkc3QgPSBSRUFMTE9DKCpkc3QsIGxlbiArIDEpOwo+ICsJZHN0bGVuID0g
c3RybGVuKCpkc3QpOwo+ICsJbGVuID0gZHN0bGVuICsgc3RybGVuKHdvcmQpICsgMjsKPiArCSpk
c3QgPSBSRUFMTE9DKCpkc3QsIGxlbik7Cj4KPiAgCWlmICghKmRzdCkgewo+ICAJCWZyZWUocCk7
Cj4gIAkJcmV0dXJuIDE7Cj4gIAl9Cj4KPiAtCXAgPSAqZHN0Owo+IC0KPiAtCXdoaWxlICgqcCAh
PSAnXDAnKQo+IC0JCXArKzsKPiAtCj4gKwlwID0gKmRzdCArIGRzdGxlbjsKPiAgCSpwID0gJyAn
Owo+ICAJKytwOwo+IC0Jc3RybmNweShwLCB3b3JkLCBzdHJsZW4od29yZCkgKyAxKTsKPiArCXN0
cm5jcHkocCwgd29yZCwgbGVuIC0gZHN0bGVuIC0gMSk7Cj4KPiAgCXJldHVybiAwOwo+ICB9Cj4g
LS0KPiAyLjIxLjAKPgo+IC0tCj4gZG0tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZG0tZGV2ZWxAcmVk
aGF0LmNvbQo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZl
bAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93
d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
