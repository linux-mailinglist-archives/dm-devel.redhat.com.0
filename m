Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE26232CA
	for <lists+dm-devel@lfdr.de>; Mon, 20 May 2019 13:40:42 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7CEF0308621C;
	Mon, 20 May 2019 11:40:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 668B7F6E7;
	Mon, 20 May 2019 11:40:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3A3C95EC6B;
	Mon, 20 May 2019 11:39:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4KBd2vb019915 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 20 May 2019 07:39:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A998B2FC4B; Mon, 20 May 2019 11:39:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9ED9B7A41D
	for <dm-devel@redhat.com>; Mon, 20 May 2019 11:39:00 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0694285545
	for <dm-devel@redhat.com>; Mon, 20 May 2019 11:38:57 +0000 (UTC)
Received: from [131.234.247.237] (unknown [131.234.247.237])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id 5D938209BD;
	Mon, 20 May 2019 13:38:54 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
Date: Mon, 20 May 2019 13:38:53 +0200
Message-Id: <3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
To: dm-devel@redhat.com
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 20 May 2019 11:38:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]);
	Mon, 20 May 2019 11:38:57 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 134.119.3.22 voltaic.bi-co.net 134.119.3.22
	voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.28
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4KBd2vb019915
X-loop: dm-devel@redhat.com
Cc: Chris Murphy <lists@colorremedies.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>,
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 20 May 2019 11:40:41 +0000 (UTC)

Cj4gQW0gMTkuMDUuMjAxOSB1bSAyMTo1NSBzY2hyaWViIE1pY2hhZWwgTGHDnyA8YmV2YW5AYmkt
Y28ubmV0PjoKPiAKPiBDQydpbmcgZG0tZGV2ZWwsIGFzIHRoaXMgc2VlbXMgdG8gYmUgYSBkbS1y
ZWxhdGVkIGlzc3VlLiBTaG9ydCBzdW1tYXJ5IGZvciBuZXcgcmVhZGVyczoKPiAKPiBPbiBMaW51
eCA1LjEgKHRlc3RlZCB1cCB0byA1LjEuMyksIGZzdHJpbSBtYXkgZGlzY2FyZCB0b28gbWFueSBi
bG9ja3MsIGxlYWRpbmcgdG8gZGF0YSBsb3NzLiBJIGhhdmUgdGhlIGZvbGxvd2luZyBzdG9yYWdl
IHN0YWNrOgo+IAo+IGJ0cmZzCj4gZG0tY3J5cHQgKExVS1MpCj4gTFZNIGxvZ2ljYWwgdm9sdW1l
Cj4gTFZNIHNpbmdsZSBwaHlzaWNhbCB2b2x1bWUKPiBNQlIgcGFydGl0aW9uCj4gU2Ftc3VuZyA4
MzAgU1NECj4gCj4gVGhlIG1hcHBpbmcgYmV0d2VlbiBsb2dpY2FsIHZvbHVtZXMgYW5kIHBoeXNp
Y2FsIHNlZ21lbnRzIGlzIGEgYml0IG1peGVkIHVwLiBTZWUgYmVsb3cgZm9yIHRoZSBvdXRwdXQg
Zm9yIOKAnHB2ZGlzcGxheSAtbeKAnS4gV2hlbiBJIGlzc3VlIGZzdHJpbSBvbiB0aGUgbW91bnRl
ZCBidHJmcyB2b2x1bWUsIEkgZ2V0IHRoZSBmb2xsb3dpbmcga2VybmVsIG1lc3NhZ2VzOgo+IAo+
IGF0dGVtcHQgdG8gYWNjZXNzIGJleW9uZCBlbmQgb2YgZGV2aWNlCj4gc2RhMTogcnc9MTYzODcs
IHdhbnQ9MjUyNzU1ODkzLCBsaW1pdD0yNTAwNjc2MzIKPiBCVFJGUyB3YXJuaW5nIChkZXZpY2Ug
ZG0tNSk6IGZhaWxlZCB0byB0cmltIDEgZGV2aWNlKHMpLCBsYXN0IGVycm9yIC01Cj4gCj4gQXQg
dGhlIHNhbWUgdGltZSwgb3RoZXIgbG9naWNhbCB2b2x1bWVzIG9uIHRoZSBzYW1lIHBoeXNpY2Fs
IHZvbHVtZSBhcmUgZGVzdHJveWVkLiBBbHNvIHRoZSBidHJmcyB2b2x1bWUgaXRzZWxmIG1heSBi
ZSBkYW1hZ2VkICh0aGlzIHNlZW1zIHRvIGRlcGVuZCBvbiB0aGUgYWN0dWFsIHVzYWdlKS4KPiAK
PiBJIGNhbiBlYXNpbHkgcmVwcm9kdWNlIHRoaXMgaXNzdWUgbG9jYWxseSBhbmQgSeKAmW0gY3Vy
cmVudGx5IGJpc2VjdGluZy4gU28gZmFyIEkgY291bGQgbmFycm93IGRvd24gdGhlIHJhbmdlIG9m
IGNvbW1pdHMgdG86Cj4gR29vZDogOTJmZmY1M2I3MTkxY2FlNTY2YmU5Y2E2NzUyMDY5NDI2Yzdm
ODI0MQo+IEJhZDogMjI1NTU3NDQ2ODU2NDQ4MDM5YTllNDk1ZGEzN2I3MmMyMDA3MWVmMgoKSSBm
aW5pc2hlZCBiaXNlY3RpbmcuIEhlcmXigJlzIHRoZSByZXNwb25zaWJsZSBjb21taXQ6Cgpjb21t
aXQgNjE2OTdhNmFiZDI0YWNiYTk0MTM1OWM2MjY4YTk0ZjRhZmU0YTUzZApBdXRob3I6IE1pa2Ug
U25pdHplciA8c25pdHplckByZWRoYXQuY29tPgpEYXRlOiAgIEZyaSBKYW4gMTggMTQ6MTk6MjYg
MjAxOSAtMDUwMAoKICAgIGRtOiBlbGltaW5hdGUgJ3NwbGl0X2Rpc2NhcmRfYmlvcycgZmxhZyBm
cm9tIERNIHRhcmdldCBpbnRlcmZhY2UKICAgIAogICAgVGhlcmUgaXMgbm8gbmVlZCB0byBoYXZl
IERNIGNvcmUgc3BsaXQgZGlzY2FyZHMgb24gYmVoYWxmIG9mIGEgRE0gdGFyZ2V0CiAgICBub3cg
dGhhdCBibGtfcXVldWVfc3BsaXQoKSBoYW5kbGVzIHNwbGl0dGluZyBkaXNjYXJkcyBiYXNlZCBv
biB0aGUKICAgIHF1ZXVlX2xpbWl0cy4gIEEgRE0gdGFyZ2V0IGp1c3QgbmVlZHMgdG8gc2V0IG1h
eF9kaXNjYXJkX3NlY3RvcnMsCiAgICBkaXNjYXJkX2dyYW51bGFyaXR5LCBldGMsIGluIHF1ZXVl
X2xpbWl0cy4KICAgIAogICAgU2lnbmVkLW9mZi1ieTogTWlrZSBTbml0emVyIDxzbml0emVyQHJl
ZGhhdC5jb20+CgpNYXliZSB0aGUgYXNzdW1wdGlvbnMgdGFrZW4gaGVyZSAoIkEgRE0gdGFyZ2V0
IGp1c3QgbmVlZHMgdG8gc2V0IG1heF9kaXNjYXJkX3NlY3RvcnMsIGRpc2NhcmRfZ3JhbnVsYXJp
dHksIGV0YywgaW4gcXVldWVfbGltaXRzLuKAnSkgaXNu4oCZdCB2YWxpZCBpbiBteSBjYXNlPyBE
b2VzIGFueW9uZSBoYXZlIGFuIGlkZWE/CgoKPiAKPiBJbiB0aGlzIHJhbmdlIG9mIGNvbW1pdHMs
IHRoZXJlIGFyZSBvbmx5IGRtLXJlbGF0ZWQgY2hhbmdlcy4KPiAKPiBTbyBmYXIsIEkgaGF2ZSBu
b3QgcmVwcm9kdWNlZCB0aGUgaXNzdWUgd2l0aCBvdGhlciBmaWxlIHN5c3RlbXMgb3IgYSBzaW1w
bGlmaWVkIHN0YWNrLiBJIGZpcnN0IHdhbnQgdG8gY29udGludWUgYmlzZWN0aW5nIGJ1dCB0aGlz
IG1heSB0YWtlIGFub3RoZXIgZGF5Lgo+IAo+IAo+PiBBbSAxOC4wNS4yMDE5IHVtIDEyOjI2IHNj
aHJpZWIgUXUgV2VucnVvIDxxdXdlbnJ1by5idHJmc0BnbXguY29tPjoKPj4gT24gMjAxOS81LzE4
IOS4i+WNiDU6MTgsIE1pY2hhZWwgTGHDnyB3cm90ZToKPj4+IAo+Pj4+IEFtIDE4LjA1LjIwMTkg
dW0gMDY6MDkgc2NocmllYiBDaHJpcyBNdXJwaHkgPGxpc3RzQGNvbG9ycmVtZWRpZXMuY29tPjoK
Pj4+PiAKPj4+PiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAxMTozNyBBTSBNaWNoYWVsIExhw58g
PGJldmFuQGJpLWNvLm5ldD4gd3JvdGU6Cj4+Pj4+IAo+Pj4+PiAKPj4+Pj4gSSB0cmllZCB0byBy
ZXByb2R1Y2UgdGhpcyBpc3N1ZTogSSByZWNyZWF0ZWQgdGhlIGJ0cmZzIGZpbGUgc3lzdGVtLCBz
ZXQgdXAgYSBtaW5pbWFsIHN5c3RlbSBhbmQgaXNzdWVkIGZzdHJpbSBhZ2Fpbi4gSXQgcHJpbnRl
ZCB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3NhZ2U6Cj4+Pj4+IAo+Pj4+PiBmc3RyaW06IC86IEZJ
VFJJTSBpb2N0bCBmYWlsZWQ6IElucHV0L291dHB1dCBlcnJvcgo+Pj4+IAo+Pj4+IEh1aC4gQW55
IGtlcm5lbCBtZXNzYWdlIGF0IHRoZSBzYW1lIHRpbWU/IEkgd291bGQgZXhwZWN0IGFueSBmc3Ry
aW0KPj4+PiB1c2VyIHNwYWNlIGVycm9yIG1lc3NhZ2UgdG8gYWxzbyBoYXZlIGEga2VybmVsIG1l
c3NhZ2UuIEFueSBpL28gZXJyb3IKPj4+PiBzdWdnZXN0cyBzb21lIGtpbmQgb2Ygc3RvcmFnZSBz
dGFjayBmYWlsdXJlIC0gd2hpY2ggY291bGQgYmUgaGFyZHdhcmUKPj4+PiBvciBzb2Z0d2FyZSwg
eW91IGNhbid0IGtub3cgd2l0aG91dCBzZWVpbmcgdGhlIGtlcm5lbCBtZXNzYWdlcy4KPj4+IAo+
Pj4gSSBtaXNzZWQgdGhhdC4gVGhlIGtlcm5lbCBtZXNzYWdlcyBhcmU6Cj4+PiAKPj4+IGF0dGVt
cHQgdG8gYWNjZXNzIGJleW9uZCBlbmQgb2YgZGV2aWNlCj4+PiBzZGExOiBydz0xNjM4Nywgd2Fu
dD0yNTI3NTU4OTMsIGxpbWl0PTI1MDA2NzYzMgo+Pj4gQlRSRlMgd2FybmluZyAoZGV2aWNlIGRt
LTUpOiBmYWlsZWQgdG8gdHJpbSAxIGRldmljZShzKSwgbGFzdCBlcnJvciAtNQo+Pj4gCj4+PiBI
ZXJlIGFyZSBzb21lIG1vcmUgaW5mb3JtYXRpb24gb24gdGhlIHBhcnRpdGlvbnMgYW5kIExWTSBw
aHlzaWNhbCBzZWdtZW50czoKPj4+IAo+Pj4gZmRpc2sgLWwgL2Rldi9zZGE6Cj4+PiAKPj4+IERl
dmljZSAgICAgQm9vdCBTdGFydCAgICAgICBFbmQgICBTZWN0b3JzICAgU2l6ZSBJZCBUeXBlCj4+
PiAvZGV2L3NkYTEgICogICAgIDIwNDggMjUwMDY5Njc5IDI1MDA2NzYzMiAxMTkuMkcgOGUgTGlu
dXggTFZNCj4+PiAKPj4+IHB2ZGlzcGxheSAtbToKPj4+IAo+Pj4gLS0tIFBoeXNpY2FsIHZvbHVt
ZSAtLS0KPj4+IFBWIE5hbWUgICAgICAgICAgICAgICAvZGV2L3NkYTEKPj4+IFZHIE5hbWUgICAg
ICAgICAgICAgICB2Z19zeXN0ZW0KPj4+IFBWIFNpemUgICAgICAgICAgICAgICAxMTkuMjQgR2lC
IC8gbm90IHVzYWJsZSA8MjIuMzQgTWlCCj4+PiBBbGxvY2F0YWJsZSAgICAgICAgICAgeWVzIChi
dXQgZnVsbCkKPj4+IFBFIFNpemUgICAgICAgICAgICAgICAzMi4wMCBNaUIKPj4+IFRvdGFsIFBF
ICAgICAgICAgICAgICAzODE1Cj4+PiBGcmVlIFBFICAgICAgICAgICAgICAgMAo+Pj4gQWxsb2Nh
dGVkIFBFICAgICAgICAgIDM4MTUKPj4+IFBWIFVVSUQgICAgICAgICAgICAgICBtcUNMRnktaURu
dC1OZmRDLWxmU3YtTWFvci1WMUloLVJsRzhsUAo+Pj4gCj4+PiAtLS0gUGh5c2ljYWwgU2VnbWVu
dHMgLS0tCj4+PiBQaHlzaWNhbCBleHRlbnQgMCB0byAxMjQ4Ogo+Pj4gICBMb2dpY2FsIHZvbHVt
ZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4gICBMb2dpY2FsIGV4dGVudHMJMjIzMSB0byAzNDc5
Cj4+PiBQaHlzaWNhbCBleHRlbnQgMTI0OSB0byAxNzI4Ogo+Pj4gICBMb2dpY2FsIHZvbHVtZQkv
ZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4gICBMb2dpY2FsIGV4dGVudHMJNjQwIHRvIDExMTkKPj4+
IFBoeXNpY2FsIGV4dGVudCAxNzI5IHRvIDE3NjA6Cj4+PiAgIExvZ2ljYWwgdm9sdW1lCS9kZXYv
dmdfc3lzdGVtL2dybWwtaW1hZ2VzCj4+PiAgIExvZ2ljYWwgZXh0ZW50cwkwIHRvIDMxCj4+PiBQ
aHlzaWNhbCBleHRlbnQgMTc2MSB0byAyMDE2Ogo+Pj4gICBMb2dpY2FsIHZvbHVtZQkvZGV2L3Zn
X3N5c3RlbS9zd2FwCj4+PiAgIExvZ2ljYWwgZXh0ZW50cwkwIHRvIDI1NQo+Pj4gUGh5c2ljYWwg
ZXh0ZW50IDIwMTcgdG8gMjA0NzoKPj4+ICAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0v
YnRyZnMKPj4+ICAgTG9naWNhbCBleHRlbnRzCTM0ODAgdG8gMzUxMAo+Pj4gUGh5c2ljYWwgZXh0
ZW50IDIwNDggdG8gMjY4NzoKPj4+ICAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRy
ZnMKPj4+ICAgTG9naWNhbCBleHRlbnRzCTAgdG8gNjM5Cj4+PiBQaHlzaWNhbCBleHRlbnQgMjY4
OCB0byAzMDA3Ogo+Pj4gICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4g
ICBMb2dpY2FsIGV4dGVudHMJMTkxMSB0byAyMjMwCj4+PiBQaHlzaWNhbCBleHRlbnQgMzAwOCB0
byAzMzIwOgo+Pj4gICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4gICBM
b2dpY2FsIGV4dGVudHMJMTEyMCB0byAxNDMyCj4+PiBQaHlzaWNhbCBleHRlbnQgMzMyMSB0byAz
MzM2Ogo+Pj4gICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9ib290Cj4+PiAgIExvZ2lj
YWwgZXh0ZW50cwkwIHRvIDE1Cj4+PiBQaHlzaWNhbCBleHRlbnQgMzMzNyB0byAzODE0Ogo+Pj4g
ICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4gICBMb2dpY2FsIGV4dGVu
dHMJMTQzMyB0byAxOTEwCj4+PiAKPj4+IAo+Pj4gV291bGQgYnRyZnMgZXZlbiBiZSBhYmxlIHRv
IGFjY2lkZW50YWxseSB0cmltIHBhcnRzIG9mIG90aGVyIExWcyBvciBkb2VzIHRoaXMgY2xlYXJs
eSBoaW50IHRvd2FyZHMgYSBMVk0vZG0gaXNzdWU/Cj4+IAo+PiBJIGNhbid0IHNwZWFrIHN1cmUs
IGJ1dCAoYXQgbGVhc3QgZm9yIGxhdGVzdCBrZXJuZWwpIGJ0cmZzIGhhcyBhIGxvdCBvZgo+PiBl
eHRyYSBtb3VudCB0aW1lIHNlbGYgY2hlY2ssIGluY2x1ZGluZyBjaHVuayBzdHJpcGUgY2hlY2sg
YWdhaW5zdAo+PiB1bmRlcmx5aW5nIGRldmljZSwgdGh1cyB0aGUgcG9zc2liaWxpdHkgc2hvdWxk
bid0IGJlIHRoYXQgaGlnaCBmb3IgYnRyZnMuCj4gCj4gSW5kZWVkLCBiaXNlY3RpbmcgdGhlIGlz
c3VlIGxlZCBtZSB0byBhIHJhbmdlIG9mIGNvbW1pdHMgdGhhdCBvbmx5IGNvbnRhaW5zIGRtLXJl
bGF0ZWQgYW5kIG5vIGJ0cmZzLXJlbGF0ZWQgY2hhbmdlcy4gU28gSSBhc3N1bWUgdGhpcyBpcyBh
IGJ1ZyBpbiBkbS4KPiAKPj4+IElzIHRoZXJlIGFuIGVhc3kgd2F5IHRvIHNvbWVob3cgdHJhY2Ug
dGhlIHRyaW0gdGhyb3VnaCB0aGUgZGlmZmVyZW50IGxheWVycyBzbyBvbmUgY2FuIHNlZSB3aGVy
ZSBpdCBnb2VzIHdyb25nPwo+PiAKPj4gU3VyZSwgeW91IGNvdWxkIHVzZSBkbS1sb2ctd3JpdGVz
Lgo+PiBJdCB3aWxsIHJlY29yZCBhbGwgcmVhZC93cml0ZSAoaW5jbHVkaW5nIHRyaW0pIGZvciBs
YXRlciByZXBsYXkuCj4+IAo+PiBTbyBpbiB5b3VyIGNhc2UsIHlvdSBjYW4gYnVpbGQgdGhlIHN0
b3JhZ2Ugc3RhY2sgbGlrZToKPj4gCj4+IEJ0cmZzCj4+IDxkbS1sb2ctd3JpdGVzPgo+PiBMVUtT
L2RtY3J5cHQKPj4gTFZNCj4+IE1CUiBwYXJ0aXRpb24KPj4gU2Ftc3VuZyBTU0QKPj4gCj4+IFRo
ZW4gcmVwbGF5IHRoZSBsb2cgKHVzaW5nIHNyYy9sb2ctd3JpdGUvcmVwbGF5LWxvZyBpbiBmc3Rl
c3RzKSB3aXRoCj4+IHZlcmJvc2Ugb3V0cHV0LCB5b3UgY2FuIHZlcmlmeSBldmVyeSB0cmltIG9w
ZXJhdGlvbiBhZ2FpbnN0IHRoZSBkbWNyeXB0Cj4+IGRldmljZSBzaXplLgo+PiAKPj4gSWYgYWxs
IHRyaW0gYXJlIGZpbmUsIHRoZW4gbW92ZSB0aGUgZG0tbG9nLXdyaXRlcyBhIGxheWVyIGxvd2Vy
LCB1bnRpbAo+PiB5b3UgZmluZCB3aGljaCBsYXllciBpcyBjYXVzaW5nIHRoZSBwcm9ibGVtLgo+
IAo+IFRoYXQgc291bmRzIGxpa2UgYSBwbGFuISBIb3dldmVyLCBJIGZpcnN0IHdhbnQgdG8gY29u
dGludWUgYmlzZWN0aW5nIGFzIEkgYW0gYWZyYWlkIHRvIGxvc2UgbXkgcmVwcm9kdWNlciBieSBj
aGFuZ2luZyBwYXJ0cyBvZiBteSBzdG9yYWdlIHN0YWNrLgo+IAo+IENoZWVycywKPiBNaWNoYWVs
Cj4gCj4+IAo+PiBUaGFua3MsCj4+IFF1Cj4+PiAKPj4+IENoZWVycywKPj4+IE1pY2hhZWwKPj4+
IAo+Pj4gUFM6IEN1cnJlbnQgc3RhdGUgb2YgYmlzZWN0aW9uOiBJdCBsb29rcyBsaWtlIHRoZSBl
cnJvciB3YXMgaW50cm9kdWNlZCBzb21ld2hlcmUgYmV0d2VlbiBiNWRkMGM2NThjMzFiNDY5Y2Nm
ZjFiNjM3ZTUxMjQ4NTFlN2E0YTFjIGFuZCB2NS4xLgo+IAo+IAo+IC0tCj4gZG0tZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gZG0tZGV2ZWxAcmVkaGF0LmNvbQo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20v
bWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1k
ZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==
