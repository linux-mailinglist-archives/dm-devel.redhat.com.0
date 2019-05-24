Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A56A2B134
	for <lists+dm-devel@lfdr.de>; Mon, 27 May 2019 11:19:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2228CF74AC;
	Mon, 27 May 2019 09:19:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B13960BF3;
	Mon, 27 May 2019 09:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2462E206D1;
	Mon, 27 May 2019 09:18:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4OF1Ssr017188 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 May 2019 11:01:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 311375B2ED; Fri, 24 May 2019 15:01:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx17.extmail.prod.ext.phx2.redhat.com
	[10.5.110.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C29845B2F5;
	Fri, 24 May 2019 15:01:21 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
	[209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B49E03004158;
	Fri, 24 May 2019 15:01:05 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id p18so8014761qkk.0;
	Fri, 24 May 2019 08:01:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6WYsWGoo7KnyaxFuZ/Yh2ndGF4aNWjzfm/GfB52cjhA=;
	b=oBOjwdRFqmOtpK2c2mK4gKl08o02MGDtw+wiGD952dgTPn+C2LAVQKCpG9x8XHfM6w
	Q1KVAjm6yeQxEhMCwZAFxZyC2kep0wlPSb+ANrCJdOgKtoIYorIhaHwJmk1lRHWduFtx
	crqWdwlMUY8NA6GEZupyBpzU3jYFqhcVAOT/zokUQxW7ZngCZ3rVgNk/rNg/Bae2DVrX
	LMRjXZhTM/pOhg6LoHkdwGfnikkwXNO158WT6uwA3TZ0WZHap1wbz6tE/CrCo5DoGzJF
	15K7/TgsYMOkVruZCrFn5RDp/4BjyLfDmd9HVjUB9I2Stis5GaiuECKd1a8YGjl1krNu
	IAXQ==
X-Gm-Message-State: APjAAAXJ4NUBm84eqHutpxrmgOucKLQs2Z4VHAZ01a+canvNVljBDU+8
	iiiVl/nR6GGFD4U52lhBsDOe6tYU0mARYrTMQhl/i+mxYx4=
X-Google-Smtp-Source: APXvYqxu0GSiJR70jmpkuZvq72awef6MIgh4RAEJVL2w0st/e9LariRPqUgkZ6I2jKxVfZfpabIkvvPkY+LLwmahUHY=
X-Received: by 2002:ac8:51c1:: with SMTP id d1mr578452qtn.204.1558710063995;
	Fri, 24 May 2019 08:01:03 -0700 (PDT)
MIME-Version: 1.0
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
	<F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
	<20190521190023.GA68070@glet> <20190521201226.GA23332@lobo>
In-Reply-To: <20190521201226.GA23332@lobo>
From: Andrea Gelmini <andrea.gelmini@linux.it>
Date: Fri, 24 May 2019 17:00:51 +0200
Message-ID: <CAK-xaQZ9PCLgzFw0-YJ=Yvou=t0k=Vv-9JY4n3=VD2s=NaYL4w@mail.gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 15:01:05 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]);
	Fri, 24 May 2019 15:01:05 +0000 (UTC) for IP:'209.85.222.196'
	DOMAIN:'mail-qk1-f196.google.com'
	HELO:'mail-qk1-f196.google.com' FROM:'andrea.gelmini@gmail.com'
	RCPT:''
X-RedHat-Spam-Score: -0.116  (FREEMAIL_FORGED_FROMDOMAIN, FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS, RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2, SPF_HELO_NONE,
	SPF_PASS) 209.85.222.196 mail-qk1-f196.google.com 209.85.222.196
	mail-qk1-f196.google.com <andrea.gelmini@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.46
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4OF1Ssr017188
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 27 May 2019 05:18:07 -0400
Cc: gregkh@linuxfoundation.org, =?UTF-8?B?TWljaGFlbCBMYcOf?= <bevan@bi-co.net>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>, dm-devel@redhat.com,
	Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Subject: Re: [dm-devel] fstrim discarding too many or wrong blocks on Linux
 5.1, leading to data loss
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Mon, 27 May 2019 09:19:23 +0000 (UTC)

SGkgTWlrZSwKICAgSSdtIGRvaW5nIHNldHVwIHRvIHJlcGxpY2F0ZSBhbmQgdGVzdCB0aGUgY29u
ZGl0aW9uLiBJIHNlZSB5b3VyCnBhdGNoIGlzIGFscmVhZHkgaW4gdGhlIDUuMiBkZXYga2VybmVs
LgogICBJJ20gZ29pbmcgdG8gdHJ5IHdpdGggbGF0ZXN0IGdpdCwgYW5kIHNlZSB3aGF0IGhhcHBl
bnMuIEFueXdheSwKZG9uJ3QgeW91IHRoaXMgaXQgd291bGQgYmUgZ29vZAogICB0byBoYXZlIHRo
aXMgcGF0Y2ggKCA1MWI4NmY5YThkMWM0YmI0ZTM4NjJlZTRiNGM1ZjQ2MDcyZjc1MjBkICkKYW55
d2F5IGluIHRoZSA1LjEgc3RhYmxlIGJyYW5jaD8KClRoYW5rcyBhIGxvdCBmb3IgeW91ciB0aW1l
LApHZWxtYQoKSWwgZ2lvcm5vIG1hciAyMSBtYWcgMjAxOSBhbGxlIG9yZSAyMjoxMiBNaWtlIFNu
aXR6ZXIKPHNuaXR6ZXJAcmVkaGF0LmNvbT4gaGEgc2NyaXR0bzoKPgo+IE9uIFR1ZSwgTWF5IDIx
IDIwMTkgYXQgIDM6MDBwbSAtMDQwMCwKPiBBbmRyZWEgR2VsbWluaSA8YW5kcmVhLmdlbG1pbmlA
bGludXguaXQ+IHdyb3RlOgo+Cj4gPiBPbiBUdWUsIE1heSAyMSwgMjAxOSBhdCAwNjo0NjoyMFBN
ICswMjAwLCBNaWNoYWVsIExhw58gd3JvdGU6Cj4gPiA+ID4gSSBmaW5pc2hlZCBiaXNlY3Rpbmcu
IEhlcmXigJlzIHRoZSByZXNwb25zaWJsZSBjb21taXQ6Cj4gPiA+ID4KPiA+ID4gPiBjb21taXQg
NjE2OTdhNmFiZDI0YWNiYTk0MTM1OWM2MjY4YTk0ZjRhZmU0YTUzZAo+ID4gPiA+IEF1dGhvcjog
TWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhhdC5jb20+Cj4gPiA+ID4gRGF0ZTogICBGcmkgSmFu
IDE4IDE0OjE5OjI2IDIwMTkgLTA1MDAKPiA+ID4gPgo+ID4gPiA+ICAgIGRtOiBlbGltaW5hdGUg
J3NwbGl0X2Rpc2NhcmRfYmlvcycgZmxhZyBmcm9tIERNIHRhcmdldCBpbnRlcmZhY2UKPiA+ID4g
Pgo+ID4gPiA+ICAgIFRoZXJlIGlzIG5vIG5lZWQgdG8gaGF2ZSBETSBjb3JlIHNwbGl0IGRpc2Nh
cmRzIG9uIGJlaGFsZiBvZiBhIERNIHRhcmdldAo+ID4gPiA+ICAgIG5vdyB0aGF0IGJsa19xdWV1
ZV9zcGxpdCgpIGhhbmRsZXMgc3BsaXR0aW5nIGRpc2NhcmRzIGJhc2VkIG9uIHRoZQo+ID4gPiA+
ICAgIHF1ZXVlX2xpbWl0cy4gIEEgRE0gdGFyZ2V0IGp1c3QgbmVlZHMgdG8gc2V0IG1heF9kaXNj
YXJkX3NlY3RvcnMsCj4gPiA+ID4gICAgZGlzY2FyZF9ncmFudWxhcml0eSwgZXRjLCBpbiBxdWV1
ZV9saW1pdHMuCj4gPiA+ID4KPiA+ID4gPiAgICBTaWduZWQtb2ZmLWJ5OiBNaWtlIFNuaXR6ZXIg
PHNuaXR6ZXJAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gUmV2ZXJ0aW5nIHRoYXQgY29tbWl0IHNv
bHZlcyB0aGUgaXNzdWUgZm9yIG1lIG9uIExpbnV4IDUuMS4zLiBXb3VsZAo+ID4gdGhhdCBiZSBh
biBvcHRpb24gdW50aWwgdGhlIHJvb3QgY2F1c2UgaGFzIGJlZW4gaWRlbnRpZmllZD8gSeKAmWQg
cmF0aGVyCj4gPiBub3QgbGV0IG1vcmUgcGVvcGxlIHJ1biBpbnRvIHRoaXMgaXNzdWUuCj4gPgo+
ID4gVGhhbmtzIGEgbG90IE1pY2hhZWwsIGZvciB5b3VyIHRpbWUvd29yay4KPiA+Cj4gPiBUaGlz
IGtpbmQgb2YgYmlzZWN0aW5nIGFyZSB2ZXJ5IGJvcmluZyBhbmQgdGltZSBjb25zdW1pbmcuCj4g
Pgo+ID4gSSBDQzogYWxzbyB0aGUgcGF0Y2ggYXV0aG9yLgo+Cj4gVGhhbmtzIGZvciBjYydpbmcg
bWUsIHRoaXMgdGhyZWFkIGRpZG4ndCBjYXRjaCBteSBleWUuCj4KPiBTb3JyeSBmb3IgeW91ciB0
cm91Ymxlcy4gIENhbiB5b3UgcGxlYXNlIHRyeSB0aGlzIHBhdGNoPwo+Cj4gVGhhbmtzLAo+IE1p
a2UKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLmMgYi9kcml2ZXJzL21kL2RtLmMKPiBp
bmRleCAxZmIxMzMzZmVmZWMuLjk5NzM4NWMxY2E1NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21k
L2RtLmMKPiArKysgYi9kcml2ZXJzL21kL2RtLmMKPiBAQCAtMTQ2OSw3ICsxNDY5LDcgQEAgc3Rh
dGljIHVuc2lnbmVkIGdldF9udW1fd3JpdGVfemVyb2VzX2Jpb3Moc3RydWN0IGRtX3RhcmdldCAq
dGkpCj4gIHN0YXRpYyBpbnQgX19zZW5kX2NoYW5naW5nX2V4dGVudF9vbmx5KHN0cnVjdCBjbG9u
ZV9pbmZvICpjaSwgc3RydWN0IGRtX3RhcmdldCAqdGksCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbnVtX2Jpb3MpCj4gIHsKPiAtICAgICAgIHVuc2ln
bmVkIGxlbiA9IGNpLT5zZWN0b3JfY291bnQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsZW47Cj4KPiAg
ICAgICAgIC8qCj4gICAgICAgICAgKiBFdmVuIHRob3VnaCB0aGUgZGV2aWNlIGFkdmVydGlzZWQg
c3VwcG9ydCBmb3IgdGhpcyB0eXBlIG9mCj4gQEAgLTE0ODAsNiArMTQ4MCw4IEBAIHN0YXRpYyBp
bnQgX19zZW5kX2NoYW5naW5nX2V4dGVudF9vbmx5KHN0cnVjdCBjbG9uZV9pbmZvICpjaSwgc3Ry
dWN0IGRtX3RhcmdldCAqCj4gICAgICAgICBpZiAoIW51bV9iaW9zKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4KPiArICAgICAgIGxlbiA9IG1pbigoc2VjdG9yX3QpY2kt
PnNlY3Rvcl9jb3VudCwgbWF4X2lvX2xlbl90YXJnZXRfYm91bmRhcnkoY2ktPnNlY3RvciwgdGkp
KTsKPiArCj4gICAgICAgICBfX3NlbmRfZHVwbGljYXRlX2Jpb3MoY2ksIHRpLCBudW1fYmlvcywg
Jmxlbik7Cj4KPiAgICAgICAgIGNpLT5zZWN0b3IgKz0gbGVuOwo+CgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vZG0tZGV2ZWw=
