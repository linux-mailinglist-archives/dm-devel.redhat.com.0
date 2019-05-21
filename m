Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F46725912
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 22:38:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C503130001EB;
	Tue, 21 May 2019 20:37:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 903F81001E82;
	Tue, 21 May 2019 20:37:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 87BAA206D2;
	Tue, 21 May 2019 20:37:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LK0lXu011513 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 16:00:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D34EA5E7DC; Tue, 21 May 2019 20:00:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EE0E5ED2B;
	Tue, 21 May 2019 20:00:41 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AF1033087926;
	Tue, 21 May 2019 20:00:02 +0000 (UTC)
Received: from lass-mb.fritz.box (aftr-95-222-30-100.unity-media.net
	[95.222.30.100])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id 253CB20BA8;
	Tue, 21 May 2019 21:59:51 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <20190521190023.GA68070@glet>
Date: Tue, 21 May 2019 21:59:50 +0200
Message-Id: <6E217E83-E4FB-489F-BF23-1EA71E20C939@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
	<F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
	<20190521190023.GA68070@glet>
To: Andrea Gelmini <andrea.gelmini@linux.it>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 21 May 2019 20:00:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Tue, 21 May 2019 20:00:28 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: -0.001 (SPF_PASS) 134.119.3.22 voltaic.bi-co.net
	134.119.3.22 voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4LK0lXu011513
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mike Snitzer <snitzer@redhat.com>,
	Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>,
	Qu Wenruo <quwenruo.btrfs@gmx.com>
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Tue, 21 May 2019 20:38:10 +0000 (UTC)

Cj4gQW0gMjEuMDUuMjAxOSB1bSAyMTowMCBzY2hyaWViIEFuZHJlYSBHZWxtaW5pIDxhbmRyZWEu
Z2VsbWluaUBsaW51eC5pdD46Cj4gCj4gT24gVHVlLCBNYXkgMjEsIDIwMTkgYXQgMDY6NDY6MjBQ
TSArMDIwMCwgTWljaGFlbCBMYcOfIHdyb3RlOgo+Pj4gSSBmaW5pc2hlZCBiaXNlY3RpbmcuIEhl
cmXigJlzIHRoZSByZXNwb25zaWJsZSBjb21taXQ6Cj4+PiAKPj4+IGNvbW1pdCA2MTY5N2E2YWJk
MjRhY2JhOTQxMzU5YzYyNjhhOTRmNGFmZTRhNTNkCj4+PiBBdXRob3I6IE1pa2UgU25pdHplciA8
c25pdHplckByZWRoYXQuY29tPgo+Pj4gRGF0ZTogICBGcmkgSmFuIDE4IDE0OjE5OjI2IDIwMTkg
LTA1MDAKPj4+IAo+Pj4gICBkbTogZWxpbWluYXRlICdzcGxpdF9kaXNjYXJkX2Jpb3MnIGZsYWcg
ZnJvbSBETSB0YXJnZXQgaW50ZXJmYWNlCj4+PiAKPj4+ICAgVGhlcmUgaXMgbm8gbmVlZCB0byBo
YXZlIERNIGNvcmUgc3BsaXQgZGlzY2FyZHMgb24gYmVoYWxmIG9mIGEgRE0gdGFyZ2V0Cj4+PiAg
IG5vdyB0aGF0IGJsa19xdWV1ZV9zcGxpdCgpIGhhbmRsZXMgc3BsaXR0aW5nIGRpc2NhcmRzIGJh
c2VkIG9uIHRoZQo+Pj4gICBxdWV1ZV9saW1pdHMuICBBIERNIHRhcmdldCBqdXN0IG5lZWRzIHRv
IHNldCBtYXhfZGlzY2FyZF9zZWN0b3JzLAo+Pj4gICBkaXNjYXJkX2dyYW51bGFyaXR5LCBldGMs
IGluIHF1ZXVlX2xpbWl0cy4KPj4+IAo+Pj4gICBTaWduZWQtb2ZmLWJ5OiBNaWtlIFNuaXR6ZXIg
PHNuaXR6ZXJAcmVkaGF0LmNvbT4KPj4gCj4+IFJldmVydGluZyB0aGF0IGNvbW1pdCBzb2x2ZXMg
dGhlIGlzc3VlIGZvciBtZSBvbiBMaW51eCA1LjEuMy4gV291bGQgdGhhdCBiZSBhbiBvcHRpb24g
dW50aWwgdGhlIHJvb3QgY2F1c2UgaGFzIGJlZW4gaWRlbnRpZmllZD8gSeKAmWQgcmF0aGVyIG5v
dCBsZXQgbW9yZSBwZW9wbGUgcnVuIGludG8gdGhpcyBpc3N1ZS4KPiAKPiBUaGFua3MgYSBsb3Qg
TWljaGFlbCwgZm9yIHlvdXIgdGltZS93b3JrLgo+IAo+IFRoaXMga2luZCBvZiBiaXNlY3Rpbmcg
YXJlIHZlcnkgYm9yaW5nIGFuZCB0aW1lIGNvbnN1bWluZy4KCkkganVzdCBzZW50IGEgcGF0Y2gg
dG8gZG0tZGV2ZWwgd2hpY2ggZml4ZXMgdGhlIGlzc3VlIGZvciBtZS4gTWF5YmUgeW91IGNhbiB0
ZXN0IHRoYXQgaW4geW91ciBlbnZpcm9ubWVudD8KCkNoZWVycywKTWljaGFlbAoKUFM6IFNvcnJ5
IGlmIHRoZSBwYXRjaCB3YXMgc2VudCBtdWx0aXBsZSB0aW1lcy4gSSBoYWQgc29tZSBpc3N1ZXMg
d2l0aCBnaXQgc2VuZC1lbWFpbC4KCj4gSSBDQzogYWxzbyB0aGUgcGF0Y2ggYXV0aG9yLgo+IAo+
IFRoYW5rcyBhZ2FpbiwKPiBBbmRyZWEKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=
