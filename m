Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7802391F
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 16:01:46 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D56F43001822;
	Mon, 20 May 2019 14:00:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BD3B4647E;
	Mon, 20 May 2019 14:00:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 89C8D5B423;
	Mon, 20 May 2019 14:00:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KDx6mQ018651 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 09:59:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9573E17995; Mon, 20 May 2019 13:59:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 904A360BF3
	for <dm-devel@redhat.com>; Mon, 20 May 2019 13:59:04 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8934BC05E76E
	for <dm-devel@redhat.com>; Mon, 20 May 2019 13:58:28 +0000 (UTC)
Received: from [131.234.247.237] (unknown [131.234.247.237])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id 00B7120BA8;
	Mon, 20 May 2019 15:58:20 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <CAK-xaQYPs62v971zm1McXw_FGzDmh_vpz3KLEbxzkmrsSgTfXw@mail.gmail.com>
Date: Mon, 20 May 2019 15:58:20 +0200
Message-Id: <9D4ECE0B-C9DD-4BAD-A764-9DE2FF2A10C7@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<CAK-xaQYPs62v971zm1McXw_FGzDmh_vpz3KLEbxzkmrsSgTfXw@mail.gmail.com>
To: Andrea Gelmini <andrea.gelmini@gmail.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 20 May 2019 13:58:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Mon, 20 May 2019 13:58:49 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 134.119.3.22 voltaic.bi-co.net 134.119.3.22
	voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4KDx6mQ018651
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Chris Murphy <lists@colorremedies.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 20 May 2019 14:01:45 +0000 (UTC)

Cj4gQW0gMjAuMDUuMjAxOSB1bSAxNTo1MyBzY2hyaWViIEFuZHJlYSBHZWxtaW5pIDxhbmRyZWEu
Z2VsbWluaUBnbWFpbC5jb20+Ogo+IAo+IEhhZCBzYW1lIGlzc3VlIG9uIGEgc2ltaWxhciAod2Vs
bCwgIHF1aXRlIGV4YWN0bHkgc2FtZSBzZXR1cCksIG9uIGEgbWFjaGluZSBpbiBwcm9kdWN0aW9u
Lgo+IEJ1dCBJdCBJcyBtb3JlIHRoYW4gNCB0ZXJhIG9mIGRhdGEsIHNvIGluIHRoZSBlbmQgSSBy
ZS1kZCB0aGUgaW1hZ2UgYW5kIHJlc3RhcnRlZCwgc3RpY2tpbmcgdG8gNS4wLnkgYnJhbmNoIG5l
dmVyIGhhZCBwcm9ibGVtLgo+IEkgd2FzIGFibGUgdG8gcmVwbGljYXRlIGl0LiBTU0QgU2Ftc3Vu
ZywgbW9yZSByZWNlbnQgdmVyc2lvbi4KPiBOb3Qgd2l0aCBidHJmcyBidXQgZXh0NCwgYnkgdGhl
IHdheS4KClRoYW5rcyBmb3IgdGhlIGluZm8sIHRoYXQgZWxpbWluYXRlcyBvbmUgdmFyaWFibGUu
IFNvIHlvdSBhbHNvIHVzZWQgZG0tY3J5cHQgb24gdG9wIG9mIExWTT8KCkNoZWVycywKTWljaGFl
bAoKPiBJIHNhdyB0aGUgZGlzY2FyZCBvZiBiaWcgaW5pdGlhbCBwYXJ0IG9mIGx2bSBwYXJ0aXRp
b24uIEkgY2FuJ3QgZmluZCBzdXBlcmJsb2NrcyBDb3B5IGluIHRoZSBGaXJzdCBoYWxmLCBidXQg
dG9yd2FyZHMgdGhlIGVuZCBvZiBsb2dpY2FsIHZvbHVtZS4KPiAKPiBTb3JyeSwgaSBjYW4ndCBw
bGF5IHdpdGggSXQgYWdhaW4sIGJ1dCBpIGhhdmUgdGhlIHdob2xlICg0IHRlcmEpIGRkIGltYWdl
IHdpdGggdGhlIGJ1Zy4KPiAKPiAKPiBDaWFvLAo+IEdlbG1hCj4gCj4gSWwgbHVuIDIwIG1hZyAy
MDE5LCAwMjozOCBNaWNoYWVsIExhw58gPGJldmFuQGJpLWNvLm5ldD4gaGEgc2NyaXR0bzoKPiBD
QydpbmcgZG0tZGV2ZWwsIGFzIHRoaXMgc2VlbXMgdG8gYmUgYSBkbS1yZWxhdGVkIGlzc3VlLiBT
aG9ydCBzdW1tYXJ5IGZvciBuZXcgcmVhZGVyczoKPiAKPiBPbiBMaW51eCA1LjEgKHRlc3RlZCB1
cCB0byA1LjEuMyksIGZzdHJpbSBtYXkgZGlzY2FyZCB0b28gbWFueSBibG9ja3MsIGxlYWRpbmcg
dG8gZGF0YSBsb3NzLiBJIGhhdmUgdGhlIGZvbGxvd2luZyBzdG9yYWdlIHN0YWNrOgo+IAo+IGJ0
cmZzCj4gZG0tY3J5cHQgKExVS1MpCj4gTFZNIGxvZ2ljYWwgdm9sdW1lCj4gTFZNIHNpbmdsZSBw
aHlzaWNhbCB2b2x1bWUKPiBNQlIgcGFydGl0aW9uCj4gU2Ftc3VuZyA4MzAgU1NECj4gCj4gVGhl
IG1hcHBpbmcgYmV0d2VlbiBsb2dpY2FsIHZvbHVtZXMgYW5kIHBoeXNpY2FsIHNlZ21lbnRzIGlz
IGEgYml0IG1peGVkIHVwLiBTZWUgYmVsb3cgZm9yIHRoZSBvdXRwdXQgZm9yIOKAnHB2ZGlzcGxh
eSAtbeKAnS4gV2hlbiBJIGlzc3VlIGZzdHJpbSBvbiB0aGUgbW91bnRlZCBidHJmcyB2b2x1bWUs
IEkgZ2V0IHRoZSBmb2xsb3dpbmcga2VybmVsIG1lc3NhZ2VzOgo+IAo+IGF0dGVtcHQgdG8gYWNj
ZXNzIGJleW9uZCBlbmQgb2YgZGV2aWNlCj4gc2RhMTogcnc9MTYzODcsIHdhbnQ9MjUyNzU1ODkz
LCBsaW1pdD0yNTAwNjc2MzIKPiBCVFJGUyB3YXJuaW5nIChkZXZpY2UgZG0tNSk6IGZhaWxlZCB0
byB0cmltIDEgZGV2aWNlKHMpLCBsYXN0IGVycm9yIC01Cj4gCj4gQXQgdGhlIHNhbWUgdGltZSwg
b3RoZXIgbG9naWNhbCB2b2x1bWVzIG9uIHRoZSBzYW1lIHBoeXNpY2FsIHZvbHVtZSBhcmUgZGVz
dHJveWVkLiBBbHNvIHRoZSBidHJmcyB2b2x1bWUgaXRzZWxmIG1heSBiZSBkYW1hZ2VkICh0aGlz
IHNlZW1zIHRvIGRlcGVuZCBvbiB0aGUgYWN0dWFsIHVzYWdlKS4KPiAKPiBJIGNhbiBlYXNpbHkg
cmVwcm9kdWNlIHRoaXMgaXNzdWUgbG9jYWxseSBhbmQgSeKAmW0gY3VycmVudGx5IGJpc2VjdGlu
Zy4gU28gZmFyIEkgY291bGQgbmFycm93IGRvd24gdGhlIHJhbmdlIG9mIGNvbW1pdHMgdG86Cj4g
R29vZDogOTJmZmY1M2I3MTkxY2FlNTY2YmU5Y2E2NzUyMDY5NDI2YzdmODI0MQo+IEJhZDogMjI1
NTU3NDQ2ODU2NDQ4MDM5YTllNDk1ZGEzN2I3MmMyMDA3MWVmMgo+IAo+IEluIHRoaXMgcmFuZ2Ug
b2YgY29tbWl0cywgdGhlcmUgYXJlIG9ubHkgZG0tcmVsYXRlZCBjaGFuZ2VzLgo+IAo+IFNvIGZh
ciwgSSBoYXZlIG5vdCByZXByb2R1Y2VkIHRoZSBpc3N1ZSB3aXRoIG90aGVyIGZpbGUgc3lzdGVt
cyBvciBhIHNpbXBsaWZpZWQgc3RhY2suIEkgZmlyc3Qgd2FudCB0byBjb250aW51ZSBiaXNlY3Rp
bmcgYnV0IHRoaXMgbWF5IHRha2UgYW5vdGhlciBkYXkuCj4gCj4gCj4gPiBBbSAxOC4wNS4yMDE5
IHVtIDEyOjI2IHNjaHJpZWIgUXUgV2VucnVvIDxxdXdlbnJ1by5idHJmc0BnbXguY29tPjoKPiA+
IE9uIDIwMTkvNS8xOCDkuIvljYg1OjE4LCBNaWNoYWVsIExhw58gd3JvdGU6Cj4gPj4gCj4gPj4+
IEFtIDE4LjA1LjIwMTkgdW0gMDY6MDkgc2NocmllYiBDaHJpcyBNdXJwaHkgPGxpc3RzQGNvbG9y
cmVtZWRpZXMuY29tPjoKPiA+Pj4gCj4gPj4+IE9uIEZyaSwgTWF5IDE3LCAyMDE5IGF0IDExOjM3
IEFNIE1pY2hhZWwgTGHDnyA8YmV2YW5AYmktY28ubmV0PiB3cm90ZToKPiA+Pj4+IAo+ID4+Pj4g
Cj4gPj4+PiBJIHRyaWVkIHRvIHJlcHJvZHVjZSB0aGlzIGlzc3VlOiBJIHJlY3JlYXRlZCB0aGUg
YnRyZnMgZmlsZSBzeXN0ZW0sIHNldCB1cCBhIG1pbmltYWwgc3lzdGVtIGFuZCBpc3N1ZWQgZnN0
cmltIGFnYWluLiBJdCBwcmludGVkIHRoZSBmb2xsb3dpbmcgZXJyb3IgbWVzc2FnZToKPiA+Pj4+
IAo+ID4+Pj4gZnN0cmltOiAvOiBGSVRSSU0gaW9jdGwgZmFpbGVkOiBJbnB1dC9vdXRwdXQgZXJy
b3IKPiA+Pj4gCj4gPj4+IEh1aC4gQW55IGtlcm5lbCBtZXNzYWdlIGF0IHRoZSBzYW1lIHRpbWU/
IEkgd291bGQgZXhwZWN0IGFueSBmc3RyaW0KPiA+Pj4gdXNlciBzcGFjZSBlcnJvciBtZXNzYWdl
IHRvIGFsc28gaGF2ZSBhIGtlcm5lbCBtZXNzYWdlLiBBbnkgaS9vIGVycm9yCj4gPj4+IHN1Z2dl
c3RzIHNvbWUga2luZCBvZiBzdG9yYWdlIHN0YWNrIGZhaWx1cmUgLSB3aGljaCBjb3VsZCBiZSBo
YXJkd2FyZQo+ID4+PiBvciBzb2Z0d2FyZSwgeW91IGNhbid0IGtub3cgd2l0aG91dCBzZWVpbmcg
dGhlIGtlcm5lbCBtZXNzYWdlcy4KPiA+PiAKPiA+PiBJIG1pc3NlZCB0aGF0LiBUaGUga2VybmVs
IG1lc3NhZ2VzIGFyZToKPiA+PiAKPiA+PiBhdHRlbXB0IHRvIGFjY2VzcyBiZXlvbmQgZW5kIG9m
IGRldmljZQo+ID4+IHNkYTE6IHJ3PTE2Mzg3LCB3YW50PTI1Mjc1NTg5MywgbGltaXQ9MjUwMDY3
NjMyCj4gPj4gQlRSRlMgd2FybmluZyAoZGV2aWNlIGRtLTUpOiBmYWlsZWQgdG8gdHJpbSAxIGRl
dmljZShzKSwgbGFzdCBlcnJvciAtNQo+ID4+IAo+ID4+IEhlcmUgYXJlIHNvbWUgbW9yZSBpbmZv
cm1hdGlvbiBvbiB0aGUgcGFydGl0aW9ucyBhbmQgTFZNIHBoeXNpY2FsIHNlZ21lbnRzOgo+ID4+
IAo+ID4+IGZkaXNrIC1sIC9kZXYvc2RhOgo+ID4+IAo+ID4+IERldmljZSAgICAgQm9vdCBTdGFy
dCAgICAgICBFbmQgICBTZWN0b3JzICAgU2l6ZSBJZCBUeXBlCj4gPj4gL2Rldi9zZGExICAqICAg
ICAyMDQ4IDI1MDA2OTY3OSAyNTAwNjc2MzIgMTE5LjJHIDhlIExpbnV4IExWTQo+ID4+IAo+ID4+
IHB2ZGlzcGxheSAtbToKPiA+PiAKPiA+PiAgLS0tIFBoeXNpY2FsIHZvbHVtZSAtLS0KPiA+PiAg
UFYgTmFtZSAgICAgICAgICAgICAgIC9kZXYvc2RhMQo+ID4+ICBWRyBOYW1lICAgICAgICAgICAg
ICAgdmdfc3lzdGVtCj4gPj4gIFBWIFNpemUgICAgICAgICAgICAgICAxMTkuMjQgR2lCIC8gbm90
IHVzYWJsZSA8MjIuMzQgTWlCCj4gPj4gIEFsbG9jYXRhYmxlICAgICAgICAgICB5ZXMgKGJ1dCBm
dWxsKQo+ID4+ICBQRSBTaXplICAgICAgICAgICAgICAgMzIuMDAgTWlCCj4gPj4gIFRvdGFsIFBF
ICAgICAgICAgICAgICAzODE1Cj4gPj4gIEZyZWUgUEUgICAgICAgICAgICAgICAwCj4gPj4gIEFs
bG9jYXRlZCBQRSAgICAgICAgICAzODE1Cj4gPj4gIFBWIFVVSUQgICAgICAgICAgICAgICBtcUNM
RnktaURudC1OZmRDLWxmU3YtTWFvci1WMUloLVJsRzhsUAo+ID4+IAo+ID4+ICAtLS0gUGh5c2lj
YWwgU2VnbWVudHMgLS0tCj4gPj4gIFBoeXNpY2FsIGV4dGVudCAwIHRvIDEyNDg6Cj4gPj4gICAg
TG9naWNhbCB2b2x1bWUgICAgL2Rldi92Z19zeXN0ZW0vYnRyZnMKPiA+PiAgICBMb2dpY2FsIGV4
dGVudHMgICAyMjMxIHRvIDM0NzkKPiA+PiAgUGh5c2ljYWwgZXh0ZW50IDEyNDkgdG8gMTcyODoK
PiA+PiAgICBMb2dpY2FsIHZvbHVtZSAgICAvZGV2L3ZnX3N5c3RlbS9idHJmcwo+ID4+ICAgIExv
Z2ljYWwgZXh0ZW50cyAgIDY0MCB0byAxMTE5Cj4gPj4gIFBoeXNpY2FsIGV4dGVudCAxNzI5IHRv
IDE3NjA6Cj4gPj4gICAgTG9naWNhbCB2b2x1bWUgICAgL2Rldi92Z19zeXN0ZW0vZ3JtbC1pbWFn
ZXMKPiA+PiAgICBMb2dpY2FsIGV4dGVudHMgICAwIHRvIDMxCj4gPj4gIFBoeXNpY2FsIGV4dGVu
dCAxNzYxIHRvIDIwMTY6Cj4gPj4gICAgTG9naWNhbCB2b2x1bWUgICAgL2Rldi92Z19zeXN0ZW0v
c3dhcAo+ID4+ICAgIExvZ2ljYWwgZXh0ZW50cyAgIDAgdG8gMjU1Cj4gPj4gIFBoeXNpY2FsIGV4
dGVudCAyMDE3IHRvIDIwNDc6Cj4gPj4gICAgTG9naWNhbCB2b2x1bWUgICAgL2Rldi92Z19zeXN0
ZW0vYnRyZnMKPiA+PiAgICBMb2dpY2FsIGV4dGVudHMgICAzNDgwIHRvIDM1MTAKPiA+PiAgUGh5
c2ljYWwgZXh0ZW50IDIwNDggdG8gMjY4NzoKPiA+PiAgICBMb2dpY2FsIHZvbHVtZSAgICAvZGV2
L3ZnX3N5c3RlbS9idHJmcwo+ID4+ICAgIExvZ2ljYWwgZXh0ZW50cyAgIDAgdG8gNjM5Cj4gPj4g
IFBoeXNpY2FsIGV4dGVudCAyNjg4IHRvIDMwMDc6Cj4gPj4gICAgTG9naWNhbCB2b2x1bWUgICAg
L2Rldi92Z19zeXN0ZW0vYnRyZnMKPiA+PiAgICBMb2dpY2FsIGV4dGVudHMgICAxOTExIHRvIDIy
MzAKPiA+PiAgUGh5c2ljYWwgZXh0ZW50IDMwMDggdG8gMzMyMDoKPiA+PiAgICBMb2dpY2FsIHZv
bHVtZSAgICAvZGV2L3ZnX3N5c3RlbS9idHJmcwo+ID4+ICAgIExvZ2ljYWwgZXh0ZW50cyAgIDEx
MjAgdG8gMTQzMgo+ID4+ICBQaHlzaWNhbCBleHRlbnQgMzMyMSB0byAzMzM2Ogo+ID4+ICAgIExv
Z2ljYWwgdm9sdW1lICAgIC9kZXYvdmdfc3lzdGVtL2Jvb3QKPiA+PiAgICBMb2dpY2FsIGV4dGVu
dHMgICAwIHRvIDE1Cj4gPj4gIFBoeXNpY2FsIGV4dGVudCAzMzM3IHRvIDM4MTQ6Cj4gPj4gICAg
TG9naWNhbCB2b2x1bWUgICAgL2Rldi92Z19zeXN0ZW0vYnRyZnMKPiA+PiAgICBMb2dpY2FsIGV4
dGVudHMgICAxNDMzIHRvIDE5MTAKPiA+PiAKPiA+PiAKPiA+PiBXb3VsZCBidHJmcyBldmVuIGJl
IGFibGUgdG8gYWNjaWRlbnRhbGx5IHRyaW0gcGFydHMgb2Ygb3RoZXIgTFZzIG9yIGRvZXMgdGhp
cyBjbGVhcmx5IGhpbnQgdG93YXJkcyBhIExWTS9kbSBpc3N1ZT8KPiA+IAo+ID4gSSBjYW4ndCBz
cGVhayBzdXJlLCBidXQgKGF0IGxlYXN0IGZvciBsYXRlc3Qga2VybmVsKSBidHJmcyBoYXMgYSBs
b3Qgb2YKPiA+IGV4dHJhIG1vdW50IHRpbWUgc2VsZiBjaGVjaywgaW5jbHVkaW5nIGNodW5rIHN0
cmlwZSBjaGVjayBhZ2FpbnN0Cj4gPiB1bmRlcmx5aW5nIGRldmljZSwgdGh1cyB0aGUgcG9zc2li
aWxpdHkgc2hvdWxkbid0IGJlIHRoYXQgaGlnaCBmb3IgYnRyZnMuCj4gCj4gSW5kZWVkLCBiaXNl
Y3RpbmcgdGhlIGlzc3VlIGxlZCBtZSB0byBhIHJhbmdlIG9mIGNvbW1pdHMgdGhhdCBvbmx5IGNv
bnRhaW5zIGRtLXJlbGF0ZWQgYW5kIG5vIGJ0cmZzLXJlbGF0ZWQgY2hhbmdlcy4gU28gSSBhc3N1
bWUgdGhpcyBpcyBhIGJ1ZyBpbiBkbS4KPiAKPiA+PiBJcyB0aGVyZSBhbiBlYXN5IHdheSB0byBz
b21laG93IHRyYWNlIHRoZSB0cmltIHRocm91Z2ggdGhlIGRpZmZlcmVudCBsYXllcnMgc28gb25l
IGNhbiBzZWUgd2hlcmUgaXQgZ29lcyB3cm9uZz8KPiA+IAo+ID4gU3VyZSwgeW91IGNvdWxkIHVz
ZSBkbS1sb2ctd3JpdGVzLgo+ID4gSXQgd2lsbCByZWNvcmQgYWxsIHJlYWQvd3JpdGUgKGluY2x1
ZGluZyB0cmltKSBmb3IgbGF0ZXIgcmVwbGF5Lgo+ID4gCj4gPiBTbyBpbiB5b3VyIGNhc2UsIHlv
dSBjYW4gYnVpbGQgdGhlIHN0b3JhZ2Ugc3RhY2sgbGlrZToKPiA+IAo+ID4gQnRyZnMKPiA+IDxk
bS1sb2ctd3JpdGVzPgo+ID4gTFVLUy9kbWNyeXB0Cj4gPiBMVk0KPiA+IE1CUiBwYXJ0aXRpb24K
PiA+IFNhbXN1bmcgU1NECj4gPiAKPiA+IFRoZW4gcmVwbGF5IHRoZSBsb2cgKHVzaW5nIHNyYy9s
b2ctd3JpdGUvcmVwbGF5LWxvZyBpbiBmc3Rlc3RzKSB3aXRoCj4gPiB2ZXJib3NlIG91dHB1dCwg
eW91IGNhbiB2ZXJpZnkgZXZlcnkgdHJpbSBvcGVyYXRpb24gYWdhaW5zdCB0aGUgZG1jcnlwdAo+
ID4gZGV2aWNlIHNpemUuCj4gPiAKPiA+IElmIGFsbCB0cmltIGFyZSBmaW5lLCB0aGVuIG1vdmUg
dGhlIGRtLWxvZy13cml0ZXMgYSBsYXllciBsb3dlciwgdW50aWwKPiA+IHlvdSBmaW5kIHdoaWNo
IGxheWVyIGlzIGNhdXNpbmcgdGhlIHByb2JsZW0uCj4gCj4gVGhhdCBzb3VuZHMgbGlrZSBhIHBs
YW4hIEhvd2V2ZXIsIEkgZmlyc3Qgd2FudCB0byBjb250aW51ZSBiaXNlY3RpbmcgYXMgSSBhbSBh
ZnJhaWQgdG8gbG9zZSBteSByZXByb2R1Y2VyIGJ5IGNoYW5naW5nIHBhcnRzIG9mIG15IHN0b3Jh
Z2Ugc3RhY2suCj4gCj4gQ2hlZXJzLAo+IE1pY2hhZWwKPiAKPiA+IAo+ID4gVGhhbmtzLAo+ID4g
UXUKPiA+PiAKPiA+PiBDaGVlcnMsCj4gPj4gTWljaGFlbAo+ID4+IAo+ID4+IFBTOiBDdXJyZW50
IHN0YXRlIG9mIGJpc2VjdGlvbjogSXQgbG9va3MgbGlrZSB0aGUgZXJyb3Igd2FzIGludHJvZHVj
ZWQgc29tZXdoZXJlIGJldHdlZW4gYjVkZDBjNjU4YzMxYjQ2OWNjZmYxYjYzN2U1MTI0ODUxZTdh
NGExYyBhbmQgdjUuMS4KPiAKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
