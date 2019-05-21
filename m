Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 832EB255FF
	for <lists+dm-devel@lfdr.de>; Tue, 21 May 2019 18:49:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2DC4B307D84D;
	Tue, 21 May 2019 16:48:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A2A716013C;
	Tue, 21 May 2019 16:48:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 784CD1806B11;
	Tue, 21 May 2019 16:48:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4LGlHZG008899 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 May 2019 12:47:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7DFF96014C; Tue, 21 May 2019 16:47:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77CD26013D
	for <dm-devel@redhat.com>; Tue, 21 May 2019 16:47:15 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8087B9B3D9
	for <dm-devel@redhat.com>; Tue, 21 May 2019 16:46:31 +0000 (UTC)
Received: from lass-mb.fritz.box (aftr-95-222-30-100.unity-media.net
	[95.222.30.100])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id 9992F20BA8;
	Tue, 21 May 2019 18:46:21 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
Date: Tue, 21 May 2019 18:46:20 +0200
Message-Id: <F170BB63-D9D7-4D08-9097-3C18815BE869@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
	<C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
	<3142764D-5944-4004-BC57-C89C89AC9ED9@bi-co.net>
To: dm-devel@redhat.com
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 21 May 2019 16:46:54 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Tue, 21 May 2019 16:46:54 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 134.119.3.22 voltaic.bi-co.net 134.119.3.22
	voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4LGlHZG008899
X-loop: dm-devel@redhat.com
Cc: Chris Murphy <lists@colorremedies.com>,
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 21 May 2019 16:49:20 +0000 (UTC)

Cj4gQW0gMjAuMDUuMjAxOSB1bSAxMzozOCBzY2hyaWViIE1pY2hhZWwgTGHDnyA8YmV2YW5AYmkt
Y28ubmV0PjoKPiAKPj4gCj4+IEFtIDE5LjA1LjIwMTkgdW0gMjE6NTUgc2NocmllYiBNaWNoYWVs
IExhw58gPGJldmFuQGJpLWNvLm5ldD46Cj4+IAo+PiBDQydpbmcgZG0tZGV2ZWwsIGFzIHRoaXMg
c2VlbXMgdG8gYmUgYSBkbS1yZWxhdGVkIGlzc3VlLiBTaG9ydCBzdW1tYXJ5IGZvciBuZXcgcmVh
ZGVyczoKPj4gCj4+IE9uIExpbnV4IDUuMSAodGVzdGVkIHVwIHRvIDUuMS4zKSwgZnN0cmltIG1h
eSBkaXNjYXJkIHRvbyBtYW55IGJsb2NrcywgbGVhZGluZyB0byBkYXRhIGxvc3MuIEkgaGF2ZSB0
aGUgZm9sbG93aW5nIHN0b3JhZ2Ugc3RhY2s6Cj4+IAo+PiBidHJmcwo+PiBkbS1jcnlwdCAoTFVL
UykKPj4gTFZNIGxvZ2ljYWwgdm9sdW1lCj4+IExWTSBzaW5nbGUgcGh5c2ljYWwgdm9sdW1lCj4+
IE1CUiBwYXJ0aXRpb24KPj4gU2Ftc3VuZyA4MzAgU1NECj4+IAo+PiBUaGUgbWFwcGluZyBiZXR3
ZWVuIGxvZ2ljYWwgdm9sdW1lcyBhbmQgcGh5c2ljYWwgc2VnbWVudHMgaXMgYSBiaXQgbWl4ZWQg
dXAuIFNlZSBiZWxvdyBmb3IgdGhlIG91dHB1dCBmb3Ig4oCccHZkaXNwbGF5IC1t4oCdLiBXaGVu
IEkgaXNzdWUgZnN0cmltIG9uIHRoZSBtb3VudGVkIGJ0cmZzIHZvbHVtZSwgSSBnZXQgdGhlIGZv
bGxvd2luZyBrZXJuZWwgbWVzc2FnZXM6Cj4+IAo+PiBhdHRlbXB0IHRvIGFjY2VzcyBiZXlvbmQg
ZW5kIG9mIGRldmljZQo+PiBzZGExOiBydz0xNjM4Nywgd2FudD0yNTI3NTU4OTMsIGxpbWl0PTI1
MDA2NzYzMgo+PiBCVFJGUyB3YXJuaW5nIChkZXZpY2UgZG0tNSk6IGZhaWxlZCB0byB0cmltIDEg
ZGV2aWNlKHMpLCBsYXN0IGVycm9yIC01Cj4+IAo+PiBBdCB0aGUgc2FtZSB0aW1lLCBvdGhlciBs
b2dpY2FsIHZvbHVtZXMgb24gdGhlIHNhbWUgcGh5c2ljYWwgdm9sdW1lIGFyZSBkZXN0cm95ZWQu
IEFsc28gdGhlIGJ0cmZzIHZvbHVtZSBpdHNlbGYgbWF5IGJlIGRhbWFnZWQgKHRoaXMgc2VlbXMg
dG8gZGVwZW5kIG9uIHRoZSBhY3R1YWwgdXNhZ2UpLgo+PiAKPj4gSSBjYW4gZWFzaWx5IHJlcHJv
ZHVjZSB0aGlzIGlzc3VlIGxvY2FsbHkgYW5kIEnigJltIGN1cnJlbnRseSBiaXNlY3RpbmcuIFNv
IGZhciBJIGNvdWxkIG5hcnJvdyBkb3duIHRoZSByYW5nZSBvZiBjb21taXRzIHRvOgo+PiBHb29k
OiA5MmZmZjUzYjcxOTFjYWU1NjZiZTljYTY3NTIwNjk0MjZjN2Y4MjQxCj4+IEJhZDogMjI1NTU3
NDQ2ODU2NDQ4MDM5YTllNDk1ZGEzN2I3MmMyMDA3MWVmMgo+IAo+IEkgZmluaXNoZWQgYmlzZWN0
aW5nLiBIZXJl4oCZcyB0aGUgcmVzcG9uc2libGUgY29tbWl0Ogo+IAo+IGNvbW1pdCA2MTY5N2E2
YWJkMjRhY2JhOTQxMzU5YzYyNjhhOTRmNGFmZTRhNTNkCj4gQXV0aG9yOiBNaWtlIFNuaXR6ZXIg
PHNuaXR6ZXJAcmVkaGF0LmNvbT4KPiBEYXRlOiAgIEZyaSBKYW4gMTggMTQ6MTk6MjYgMjAxOSAt
MDUwMAo+IAo+ICAgIGRtOiBlbGltaW5hdGUgJ3NwbGl0X2Rpc2NhcmRfYmlvcycgZmxhZyBmcm9t
IERNIHRhcmdldCBpbnRlcmZhY2UKPiAKPiAgICBUaGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgRE0g
Y29yZSBzcGxpdCBkaXNjYXJkcyBvbiBiZWhhbGYgb2YgYSBETSB0YXJnZXQKPiAgICBub3cgdGhh
dCBibGtfcXVldWVfc3BsaXQoKSBoYW5kbGVzIHNwbGl0dGluZyBkaXNjYXJkcyBiYXNlZCBvbiB0
aGUKPiAgICBxdWV1ZV9saW1pdHMuICBBIERNIHRhcmdldCBqdXN0IG5lZWRzIHRvIHNldCBtYXhf
ZGlzY2FyZF9zZWN0b3JzLAo+ICAgIGRpc2NhcmRfZ3JhbnVsYXJpdHksIGV0YywgaW4gcXVldWVf
bGltaXRzLgo+IAo+ICAgIFNpZ25lZC1vZmYtYnk6IE1pa2UgU25pdHplciA8c25pdHplckByZWRo
YXQuY29tPgoKUmV2ZXJ0aW5nIHRoYXQgY29tbWl0IHNvbHZlcyB0aGUgaXNzdWUgZm9yIG1lIG9u
IExpbnV4IDUuMS4zLiBXb3VsZCB0aGF0IGJlIGFuIG9wdGlvbiB1bnRpbCB0aGUgcm9vdCBjYXVz
ZSBoYXMgYmVlbiBpZGVudGlmaWVkPyBJ4oCZZCByYXRoZXIgbm90IGxldCBtb3JlIHBlb3BsZSBy
dW4gaW50byB0aGlzIGlzc3VlLgoKQ2hlZXJzLApNaWNoYWVsCgoKPiBNYXliZSB0aGUgYXNzdW1w
dGlvbnMgdGFrZW4gaGVyZSAoIkEgRE0gdGFyZ2V0IGp1c3QgbmVlZHMgdG8gc2V0IG1heF9kaXNj
YXJkX3NlY3RvcnMsIGRpc2NhcmRfZ3JhbnVsYXJpdHksIGV0YywgaW4gcXVldWVfbGltaXRzLuKA
nSkgaXNu4oCZdCB2YWxpZCBpbiBteSBjYXNlPyBEb2VzIGFueW9uZSBoYXZlIGFuIGlkZWE/Cj4g
Cj4gCj4+IAo+PiBJbiB0aGlzIHJhbmdlIG9mIGNvbW1pdHMsIHRoZXJlIGFyZSBvbmx5IGRtLXJl
bGF0ZWQgY2hhbmdlcy4KPj4gCj4+IFNvIGZhciwgSSBoYXZlIG5vdCByZXByb2R1Y2VkIHRoZSBp
c3N1ZSB3aXRoIG90aGVyIGZpbGUgc3lzdGVtcyBvciBhIHNpbXBsaWZpZWQgc3RhY2suIEkgZmly
c3Qgd2FudCB0byBjb250aW51ZSBiaXNlY3RpbmcgYnV0IHRoaXMgbWF5IHRha2UgYW5vdGhlciBk
YXkuCj4+IAo+PiAKPj4+IEFtIDE4LjA1LjIwMTkgdW0gMTI6MjYgc2NocmllYiBRdSBXZW5ydW8g
PHF1d2VucnVvLmJ0cmZzQGdteC5jb20+Ogo+Pj4gT24gMjAxOS81LzE4IOS4i+WNiDU6MTgsIE1p
Y2hhZWwgTGHDnyB3cm90ZToKPj4+PiAKPj4+Pj4gQW0gMTguMDUuMjAxOSB1bSAwNjowOSBzY2hy
aWViIENocmlzIE11cnBoeSA8bGlzdHNAY29sb3JyZW1lZGllcy5jb20+Ogo+Pj4+PiAKPj4+Pj4g
T24gRnJpLCBNYXkgMTcsIDIwMTkgYXQgMTE6MzcgQU0gTWljaGFlbCBMYcOfIDxiZXZhbkBiaS1j
by5uZXQ+IHdyb3RlOgo+Pj4+Pj4gCj4+Pj4+PiAKPj4+Pj4+IEkgdHJpZWQgdG8gcmVwcm9kdWNl
IHRoaXMgaXNzdWU6IEkgcmVjcmVhdGVkIHRoZSBidHJmcyBmaWxlIHN5c3RlbSwgc2V0IHVwIGEg
bWluaW1hbCBzeXN0ZW0gYW5kIGlzc3VlZCBmc3RyaW0gYWdhaW4uIEl0IHByaW50ZWQgdGhlIGZv
bGxvd2luZyBlcnJvciBtZXNzYWdlOgo+Pj4+Pj4gCj4+Pj4+PiBmc3RyaW06IC86IEZJVFJJTSBp
b2N0bCBmYWlsZWQ6IElucHV0L291dHB1dCBlcnJvcgo+Pj4+PiAKPj4+Pj4gSHVoLiBBbnkga2Vy
bmVsIG1lc3NhZ2UgYXQgdGhlIHNhbWUgdGltZT8gSSB3b3VsZCBleHBlY3QgYW55IGZzdHJpbQo+
Pj4+PiB1c2VyIHNwYWNlIGVycm9yIG1lc3NhZ2UgdG8gYWxzbyBoYXZlIGEga2VybmVsIG1lc3Nh
Z2UuIEFueSBpL28gZXJyb3IKPj4+Pj4gc3VnZ2VzdHMgc29tZSBraW5kIG9mIHN0b3JhZ2Ugc3Rh
Y2sgZmFpbHVyZSAtIHdoaWNoIGNvdWxkIGJlIGhhcmR3YXJlCj4+Pj4+IG9yIHNvZnR3YXJlLCB5
b3UgY2FuJ3Qga25vdyB3aXRob3V0IHNlZWluZyB0aGUga2VybmVsIG1lc3NhZ2VzLgo+Pj4+IAo+
Pj4+IEkgbWlzc2VkIHRoYXQuIFRoZSBrZXJuZWwgbWVzc2FnZXMgYXJlOgo+Pj4+IAo+Pj4+IGF0
dGVtcHQgdG8gYWNjZXNzIGJleW9uZCBlbmQgb2YgZGV2aWNlCj4+Pj4gc2RhMTogcnc9MTYzODcs
IHdhbnQ9MjUyNzU1ODkzLCBsaW1pdD0yNTAwNjc2MzIKPj4+PiBCVFJGUyB3YXJuaW5nIChkZXZp
Y2UgZG0tNSk6IGZhaWxlZCB0byB0cmltIDEgZGV2aWNlKHMpLCBsYXN0IGVycm9yIC01Cj4+Pj4g
Cj4+Pj4gSGVyZSBhcmUgc29tZSBtb3JlIGluZm9ybWF0aW9uIG9uIHRoZSBwYXJ0aXRpb25zIGFu
ZCBMVk0gcGh5c2ljYWwgc2VnbWVudHM6Cj4+Pj4gCj4+Pj4gZmRpc2sgLWwgL2Rldi9zZGE6Cj4+
Pj4gCj4+Pj4gRGV2aWNlICAgICBCb290IFN0YXJ0ICAgICAgIEVuZCAgIFNlY3RvcnMgICBTaXpl
IElkIFR5cGUKPj4+PiAvZGV2L3NkYTEgICogICAgIDIwNDggMjUwMDY5Njc5IDI1MDA2NzYzMiAx
MTkuMkcgOGUgTGludXggTFZNCj4+Pj4gCj4+Pj4gcHZkaXNwbGF5IC1tOgo+Pj4+IAo+Pj4+IC0t
LSBQaHlzaWNhbCB2b2x1bWUgLS0tCj4+Pj4gUFYgTmFtZSAgICAgICAgICAgICAgIC9kZXYvc2Rh
MQo+Pj4+IFZHIE5hbWUgICAgICAgICAgICAgICB2Z19zeXN0ZW0KPj4+PiBQViBTaXplICAgICAg
ICAgICAgICAgMTE5LjI0IEdpQiAvIG5vdCB1c2FibGUgPDIyLjM0IE1pQgo+Pj4+IEFsbG9jYXRh
YmxlICAgICAgICAgICB5ZXMgKGJ1dCBmdWxsKQo+Pj4+IFBFIFNpemUgICAgICAgICAgICAgICAz
Mi4wMCBNaUIKPj4+PiBUb3RhbCBQRSAgICAgICAgICAgICAgMzgxNQo+Pj4+IEZyZWUgUEUgICAg
ICAgICAgICAgICAwCj4+Pj4gQWxsb2NhdGVkIFBFICAgICAgICAgIDM4MTUKPj4+PiBQViBVVUlE
ICAgICAgICAgICAgICAgbXFDTEZ5LWlEbnQtTmZkQy1sZlN2LU1hb3ItVjFJaC1SbEc4bFAKPj4+
PiAKPj4+PiAtLS0gUGh5c2ljYWwgU2VnbWVudHMgLS0tCj4+Pj4gUGh5c2ljYWwgZXh0ZW50IDAg
dG8gMTI0ODoKPj4+PiAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRyZnMKPj4+PiAg
TG9naWNhbCBleHRlbnRzCTIyMzEgdG8gMzQ3OQo+Pj4+IFBoeXNpY2FsIGV4dGVudCAxMjQ5IHRv
IDE3Mjg6Cj4+Pj4gIExvZ2ljYWwgdm9sdW1lCS9kZXYvdmdfc3lzdGVtL2J0cmZzCj4+Pj4gIExv
Z2ljYWwgZXh0ZW50cwk2NDAgdG8gMTExOQo+Pj4+IFBoeXNpY2FsIGV4dGVudCAxNzI5IHRvIDE3
NjA6Cj4+Pj4gIExvZ2ljYWwgdm9sdW1lCS9kZXYvdmdfc3lzdGVtL2dybWwtaW1hZ2VzCj4+Pj4g
IExvZ2ljYWwgZXh0ZW50cwkwIHRvIDMxCj4+Pj4gUGh5c2ljYWwgZXh0ZW50IDE3NjEgdG8gMjAx
NjoKPj4+PiAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vc3dhcAo+Pj4+ICBMb2dpY2Fs
IGV4dGVudHMJMCB0byAyNTUKPj4+PiBQaHlzaWNhbCBleHRlbnQgMjAxNyB0byAyMDQ3Ogo+Pj4+
ICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+Pj4+ICBMb2dpY2FsIGV4dGVu
dHMJMzQ4MCB0byAzNTEwCj4+Pj4gUGh5c2ljYWwgZXh0ZW50IDIwNDggdG8gMjY4NzoKPj4+PiAg
TG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRyZnMKPj4+PiAgTG9naWNhbCBleHRlbnRz
CTAgdG8gNjM5Cj4+Pj4gUGh5c2ljYWwgZXh0ZW50IDI2ODggdG8gMzAwNzoKPj4+PiAgTG9naWNh
bCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRyZnMKPj4+PiAgTG9naWNhbCBleHRlbnRzCTE5MTEg
dG8gMjIzMAo+Pj4+IFBoeXNpY2FsIGV4dGVudCAzMDA4IHRvIDMzMjA6Cj4+Pj4gIExvZ2ljYWwg
dm9sdW1lCS9kZXYvdmdfc3lzdGVtL2J0cmZzCj4+Pj4gIExvZ2ljYWwgZXh0ZW50cwkxMTIwIHRv
IDE0MzIKPj4+PiBQaHlzaWNhbCBleHRlbnQgMzMyMSB0byAzMzM2Ogo+Pj4+ICBMb2dpY2FsIHZv
bHVtZQkvZGV2L3ZnX3N5c3RlbS9ib290Cj4+Pj4gIExvZ2ljYWwgZXh0ZW50cwkwIHRvIDE1Cj4+
Pj4gUGh5c2ljYWwgZXh0ZW50IDMzMzcgdG8gMzgxNDoKPj4+PiAgTG9naWNhbCB2b2x1bWUJL2Rl
di92Z19zeXN0ZW0vYnRyZnMKPj4+PiAgTG9naWNhbCBleHRlbnRzCTE0MzMgdG8gMTkxMAo+Pj4+
IAo+Pj4+IAo+Pj4+IFdvdWxkIGJ0cmZzIGV2ZW4gYmUgYWJsZSB0byBhY2NpZGVudGFsbHkgdHJp
bSBwYXJ0cyBvZiBvdGhlciBMVnMgb3IgZG9lcyB0aGlzIGNsZWFybHkgaGludCB0b3dhcmRzIGEg
TFZNL2RtIGlzc3VlPwo+Pj4gCj4+PiBJIGNhbid0IHNwZWFrIHN1cmUsIGJ1dCAoYXQgbGVhc3Qg
Zm9yIGxhdGVzdCBrZXJuZWwpIGJ0cmZzIGhhcyBhIGxvdCBvZgo+Pj4gZXh0cmEgbW91bnQgdGlt
ZSBzZWxmIGNoZWNrLCBpbmNsdWRpbmcgY2h1bmsgc3RyaXBlIGNoZWNrIGFnYWluc3QKPj4+IHVu
ZGVybHlpbmcgZGV2aWNlLCB0aHVzIHRoZSBwb3NzaWJpbGl0eSBzaG91bGRuJ3QgYmUgdGhhdCBo
aWdoIGZvciBidHJmcy4KPj4gCj4+IEluZGVlZCwgYmlzZWN0aW5nIHRoZSBpc3N1ZSBsZWQgbWUg
dG8gYSByYW5nZSBvZiBjb21taXRzIHRoYXQgb25seSBjb250YWlucyBkbS1yZWxhdGVkIGFuZCBu
byBidHJmcy1yZWxhdGVkIGNoYW5nZXMuIFNvIEkgYXNzdW1lIHRoaXMgaXMgYSBidWcgaW4gZG0u
Cj4+IAo+Pj4+IElzIHRoZXJlIGFuIGVhc3kgd2F5IHRvIHNvbWVob3cgdHJhY2UgdGhlIHRyaW0g
dGhyb3VnaCB0aGUgZGlmZmVyZW50IGxheWVycyBzbyBvbmUgY2FuIHNlZSB3aGVyZSBpdCBnb2Vz
IHdyb25nPwo+Pj4gCj4+PiBTdXJlLCB5b3UgY291bGQgdXNlIGRtLWxvZy13cml0ZXMuCj4+PiBJ
dCB3aWxsIHJlY29yZCBhbGwgcmVhZC93cml0ZSAoaW5jbHVkaW5nIHRyaW0pIGZvciBsYXRlciBy
ZXBsYXkuCj4+PiAKPj4+IFNvIGluIHlvdXIgY2FzZSwgeW91IGNhbiBidWlsZCB0aGUgc3RvcmFn
ZSBzdGFjayBsaWtlOgo+Pj4gCj4+PiBCdHJmcwo+Pj4gPGRtLWxvZy13cml0ZXM+Cj4+PiBMVUtT
L2RtY3J5cHQKPj4+IExWTQo+Pj4gTUJSIHBhcnRpdGlvbgo+Pj4gU2Ftc3VuZyBTU0QKPj4+IAo+
Pj4gVGhlbiByZXBsYXkgdGhlIGxvZyAodXNpbmcgc3JjL2xvZy13cml0ZS9yZXBsYXktbG9nIGlu
IGZzdGVzdHMpIHdpdGgKPj4+IHZlcmJvc2Ugb3V0cHV0LCB5b3UgY2FuIHZlcmlmeSBldmVyeSB0
cmltIG9wZXJhdGlvbiBhZ2FpbnN0IHRoZSBkbWNyeXB0Cj4+PiBkZXZpY2Ugc2l6ZS4KPj4+IAo+
Pj4gSWYgYWxsIHRyaW0gYXJlIGZpbmUsIHRoZW4gbW92ZSB0aGUgZG0tbG9nLXdyaXRlcyBhIGxh
eWVyIGxvd2VyLCB1bnRpbAo+Pj4geW91IGZpbmQgd2hpY2ggbGF5ZXIgaXMgY2F1c2luZyB0aGUg
cHJvYmxlbS4KPj4gCj4+IFRoYXQgc291bmRzIGxpa2UgYSBwbGFuISBIb3dldmVyLCBJIGZpcnN0
IHdhbnQgdG8gY29udGludWUgYmlzZWN0aW5nIGFzIEkgYW0gYWZyYWlkIHRvIGxvc2UgbXkgcmVw
cm9kdWNlciBieSBjaGFuZ2luZyBwYXJ0cyBvZiBteSBzdG9yYWdlIHN0YWNrLgo+PiAKPj4gQ2hl
ZXJzLAo+PiBNaWNoYWVsCj4+IAo+Pj4gCj4+PiBUaGFua3MsCj4+PiBRdQo+Pj4+IAo+Pj4+IENo
ZWVycywKPj4+PiBNaWNoYWVsCj4+Pj4gCj4+Pj4gUFM6IEN1cnJlbnQgc3RhdGUgb2YgYmlzZWN0
aW9uOiBJdCBsb29rcyBsaWtlIHRoZSBlcnJvciB3YXMgaW50cm9kdWNlZCBzb21ld2hlcmUgYmV0
d2VlbiBiNWRkMGM2NThjMzFiNDY5Y2NmZjFiNjM3ZTUxMjQ4NTFlN2E0YTFjIGFuZCB2NS4xLgo+
PiAKPj4gCj4+IC0tCj4+IGRtLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkbS1kZXZlbEByZWRoYXQu
Y29tCj4+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAo+
IAo+IAo+IC0tCj4gZG0tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZG0tZGV2ZWxAcmVkaGF0LmNvbQo+
IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAoKCi0tCmRt
LWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhh
dC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==
