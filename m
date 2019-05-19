Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E2410228A8
	for <lists+dm-devel@lfdr.de>; Sun, 19 May 2019 21:55:56 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 22E07307D91F;
	Sun, 19 May 2019 19:55:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 719975C22E;
	Sun, 19 May 2019 19:55:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D4E82C589;
	Sun, 19 May 2019 19:55:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4JJtCsF031264 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 19 May 2019 15:55:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D33DC5DA34; Sun, 19 May 2019 19:55:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD33829ADB
	for <dm-devel@redhat.com>; Sun, 19 May 2019 19:55:08 +0000 (UTC)
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E89D959442
	for <dm-devel@redhat.com>; Sun, 19 May 2019 19:55:05 +0000 (UTC)
Received: from lass-mb.fritz.box (aftr-95-222-30-100.unity-media.net
	[95.222.30.100])
	by voltaic.bi-co.net (Postfix) with ESMTPSA id 5336D21449;
	Sun, 19 May 2019 21:55:03 +0200 (CEST)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
From: =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
Date: Sun, 19 May 2019 21:55:02 +0200
Message-Id: <C1CD4646-E75D-4AAF-9CD6-B3AC32495FD3@bi-co.net>
References: <297da4cbe20235080205719805b08810@bi-co.net>
	<CAJCQCtR-uo9fgs66pBMEoYX_xAye=O-L8kiMwyAdFjPS5T4+CA@mail.gmail.com>
	<8C31D41C-9608-4A65-B543-8ABCC0B907A0@bi-co.net>
	<CAJCQCtTZWXUgUDh8vn0BFeEbAdKToDSVYYw4Q0bt0rECQr9nxQ@mail.gmail.com>
	<AD966642-1043-468D-BABF-8FC9AF514D36@bi-co.net>
	<158a3491-e4d2-d905-7f58-11a15bddcd70@gmx.com>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>
X-Greylist: Sender passed SPF test, ACL 242 matched, not delayed by
	milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sun, 19 May 2019 19:55:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]);
	Sun, 19 May 2019 19:55:06 +0000 (UTC) for IP:'134.119.3.22'
	DOMAIN:'voltaic.bi-co.net' HELO:'voltaic.bi-co.net'
	FROM:'bevan@bi-co.net' RCPT:''
X-RedHat-Spam-Score: 0  (SPF_HELO_NONE,
	SPF_PASS) 134.119.3.22 voltaic.bi-co.net 134.119.3.22
	voltaic.bi-co.net <bevan@bi-co.net>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.39
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id x4JJtCsF031264
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Chris Murphy <lists@colorremedies.com>,
	Btrfs BTRFS <linux-btrfs@vger.kernel.org>
Subject: [dm-devel] fstrim discarding too many or wrong blocks on Linux 5.1,
 leading to data loss
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Sun, 19 May 2019 19:55:55 +0000 (UTC)

Q0MnaW5nIGRtLWRldmVsLCBhcyB0aGlzIHNlZW1zIHRvIGJlIGEgZG0tcmVsYXRlZCBpc3N1ZS4g
U2hvcnQgc3VtbWFyeSBmb3IgbmV3IHJlYWRlcnM6CgpPbiBMaW51eCA1LjEgKHRlc3RlZCB1cCB0
byA1LjEuMyksIGZzdHJpbSBtYXkgZGlzY2FyZCB0b28gbWFueSBibG9ja3MsIGxlYWRpbmcgdG8g
ZGF0YSBsb3NzLiBJIGhhdmUgdGhlIGZvbGxvd2luZyBzdG9yYWdlIHN0YWNrOgoKYnRyZnMKZG0t
Y3J5cHQgKExVS1MpCkxWTSBsb2dpY2FsIHZvbHVtZQpMVk0gc2luZ2xlIHBoeXNpY2FsIHZvbHVt
ZQpNQlIgcGFydGl0aW9uClNhbXN1bmcgODMwIFNTRAoKVGhlIG1hcHBpbmcgYmV0d2VlbiBsb2dp
Y2FsIHZvbHVtZXMgYW5kIHBoeXNpY2FsIHNlZ21lbnRzIGlzIGEgYml0IG1peGVkIHVwLiBTZWUg
YmVsb3cgZm9yIHRoZSBvdXRwdXQgZm9yIOKAnHB2ZGlzcGxheSAtbeKAnS4gV2hlbiBJIGlzc3Vl
IGZzdHJpbSBvbiB0aGUgbW91bnRlZCBidHJmcyB2b2x1bWUsIEkgZ2V0IHRoZSBmb2xsb3dpbmcg
a2VybmVsIG1lc3NhZ2VzOgoKYXR0ZW1wdCB0byBhY2Nlc3MgYmV5b25kIGVuZCBvZiBkZXZpY2UK
c2RhMTogcnc9MTYzODcsIHdhbnQ9MjUyNzU1ODkzLCBsaW1pdD0yNTAwNjc2MzIKQlRSRlMgd2Fy
bmluZyAoZGV2aWNlIGRtLTUpOiBmYWlsZWQgdG8gdHJpbSAxIGRldmljZShzKSwgbGFzdCBlcnJv
ciAtNQoKQXQgdGhlIHNhbWUgdGltZSwgb3RoZXIgbG9naWNhbCB2b2x1bWVzIG9uIHRoZSBzYW1l
IHBoeXNpY2FsIHZvbHVtZSBhcmUgZGVzdHJveWVkLiBBbHNvIHRoZSBidHJmcyB2b2x1bWUgaXRz
ZWxmIG1heSBiZSBkYW1hZ2VkICh0aGlzIHNlZW1zIHRvIGRlcGVuZCBvbiB0aGUgYWN0dWFsIHVz
YWdlKS4KCkkgY2FuIGVhc2lseSByZXByb2R1Y2UgdGhpcyBpc3N1ZSBsb2NhbGx5IGFuZCBJ4oCZ
bSBjdXJyZW50bHkgYmlzZWN0aW5nLiBTbyBmYXIgSSBjb3VsZCBuYXJyb3cgZG93biB0aGUgcmFu
Z2Ugb2YgY29tbWl0cyB0bzoKR29vZDogOTJmZmY1M2I3MTkxY2FlNTY2YmU5Y2E2NzUyMDY5NDI2
YzdmODI0MQpCYWQ6IDIyNTU1NzQ0Njg1NjQ0ODAzOWE5ZTQ5NWRhMzdiNzJjMjAwNzFlZjIKCklu
IHRoaXMgcmFuZ2Ugb2YgY29tbWl0cywgdGhlcmUgYXJlIG9ubHkgZG0tcmVsYXRlZCBjaGFuZ2Vz
LgoKU28gZmFyLCBJIGhhdmUgbm90IHJlcHJvZHVjZWQgdGhlIGlzc3VlIHdpdGggb3RoZXIgZmls
ZSBzeXN0ZW1zIG9yIGEgc2ltcGxpZmllZCBzdGFjay4gSSBmaXJzdCB3YW50IHRvIGNvbnRpbnVl
IGJpc2VjdGluZyBidXQgdGhpcyBtYXkgdGFrZSBhbm90aGVyIGRheS4KCgo+IEFtIDE4LjA1LjIw
MTkgdW0gMTI6MjYgc2NocmllYiBRdSBXZW5ydW8gPHF1d2VucnVvLmJ0cmZzQGdteC5jb20+Ogo+
IE9uIDIwMTkvNS8xOCDkuIvljYg1OjE4LCBNaWNoYWVsIExhw58gd3JvdGU6Cj4+IAo+Pj4gQW0g
MTguMDUuMjAxOSB1bSAwNjowOSBzY2hyaWViIENocmlzIE11cnBoeSA8bGlzdHNAY29sb3JyZW1l
ZGllcy5jb20+Ogo+Pj4gCj4+PiBPbiBGcmksIE1heSAxNywgMjAxOSBhdCAxMTozNyBBTSBNaWNo
YWVsIExhw58gPGJldmFuQGJpLWNvLm5ldD4gd3JvdGU6Cj4+Pj4gCj4+Pj4gCj4+Pj4gSSB0cmll
ZCB0byByZXByb2R1Y2UgdGhpcyBpc3N1ZTogSSByZWNyZWF0ZWQgdGhlIGJ0cmZzIGZpbGUgc3lz
dGVtLCBzZXQgdXAgYSBtaW5pbWFsIHN5c3RlbSBhbmQgaXNzdWVkIGZzdHJpbSBhZ2Fpbi4gSXQg
cHJpbnRlZCB0aGUgZm9sbG93aW5nIGVycm9yIG1lc3NhZ2U6Cj4+Pj4gCj4+Pj4gZnN0cmltOiAv
OiBGSVRSSU0gaW9jdGwgZmFpbGVkOiBJbnB1dC9vdXRwdXQgZXJyb3IKPj4+IAo+Pj4gSHVoLiBB
bnkga2VybmVsIG1lc3NhZ2UgYXQgdGhlIHNhbWUgdGltZT8gSSB3b3VsZCBleHBlY3QgYW55IGZz
dHJpbQo+Pj4gdXNlciBzcGFjZSBlcnJvciBtZXNzYWdlIHRvIGFsc28gaGF2ZSBhIGtlcm5lbCBt
ZXNzYWdlLiBBbnkgaS9vIGVycm9yCj4+PiBzdWdnZXN0cyBzb21lIGtpbmQgb2Ygc3RvcmFnZSBz
dGFjayBmYWlsdXJlIC0gd2hpY2ggY291bGQgYmUgaGFyZHdhcmUKPj4+IG9yIHNvZnR3YXJlLCB5
b3UgY2FuJ3Qga25vdyB3aXRob3V0IHNlZWluZyB0aGUga2VybmVsIG1lc3NhZ2VzLgo+PiAKPj4g
SSBtaXNzZWQgdGhhdC4gVGhlIGtlcm5lbCBtZXNzYWdlcyBhcmU6Cj4+IAo+PiBhdHRlbXB0IHRv
IGFjY2VzcyBiZXlvbmQgZW5kIG9mIGRldmljZQo+PiBzZGExOiBydz0xNjM4Nywgd2FudD0yNTI3
NTU4OTMsIGxpbWl0PTI1MDA2NzYzMgo+PiBCVFJGUyB3YXJuaW5nIChkZXZpY2UgZG0tNSk6IGZh
aWxlZCB0byB0cmltIDEgZGV2aWNlKHMpLCBsYXN0IGVycm9yIC01Cj4+IAo+PiBIZXJlIGFyZSBz
b21lIG1vcmUgaW5mb3JtYXRpb24gb24gdGhlIHBhcnRpdGlvbnMgYW5kIExWTSBwaHlzaWNhbCBz
ZWdtZW50czoKPj4gCj4+IGZkaXNrIC1sIC9kZXYvc2RhOgo+PiAKPj4gRGV2aWNlICAgICBCb290
IFN0YXJ0ICAgICAgIEVuZCAgIFNlY3RvcnMgICBTaXplIElkIFR5cGUKPj4gL2Rldi9zZGExICAq
ICAgICAyMDQ4IDI1MDA2OTY3OSAyNTAwNjc2MzIgMTE5LjJHIDhlIExpbnV4IExWTQo+PiAKPj4g
cHZkaXNwbGF5IC1tOgo+PiAKPj4gIC0tLSBQaHlzaWNhbCB2b2x1bWUgLS0tCj4+ICBQViBOYW1l
ICAgICAgICAgICAgICAgL2Rldi9zZGExCj4+ICBWRyBOYW1lICAgICAgICAgICAgICAgdmdfc3lz
dGVtCj4+ICBQViBTaXplICAgICAgICAgICAgICAgMTE5LjI0IEdpQiAvIG5vdCB1c2FibGUgPDIy
LjM0IE1pQgo+PiAgQWxsb2NhdGFibGUgICAgICAgICAgIHllcyAoYnV0IGZ1bGwpCj4+ICBQRSBT
aXplICAgICAgICAgICAgICAgMzIuMDAgTWlCCj4+ICBUb3RhbCBQRSAgICAgICAgICAgICAgMzgx
NQo+PiAgRnJlZSBQRSAgICAgICAgICAgICAgIDAKPj4gIEFsbG9jYXRlZCBQRSAgICAgICAgICAz
ODE1Cj4+ICBQViBVVUlEICAgICAgICAgICAgICAgbXFDTEZ5LWlEbnQtTmZkQy1sZlN2LU1hb3It
VjFJaC1SbEc4bFAKPj4gCj4+ICAtLS0gUGh5c2ljYWwgU2VnbWVudHMgLS0tCj4+ICBQaHlzaWNh
bCBleHRlbnQgMCB0byAxMjQ4Ogo+PiAgICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9i
dHJmcwo+PiAgICBMb2dpY2FsIGV4dGVudHMJMjIzMSB0byAzNDc5Cj4+ICBQaHlzaWNhbCBleHRl
bnQgMTI0OSB0byAxNzI4Ogo+PiAgICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJm
cwo+PiAgICBMb2dpY2FsIGV4dGVudHMJNjQwIHRvIDExMTkKPj4gIFBoeXNpY2FsIGV4dGVudCAx
NzI5IHRvIDE3NjA6Cj4+ICAgIExvZ2ljYWwgdm9sdW1lCS9kZXYvdmdfc3lzdGVtL2dybWwtaW1h
Z2VzCj4+ICAgIExvZ2ljYWwgZXh0ZW50cwkwIHRvIDMxCj4+ICBQaHlzaWNhbCBleHRlbnQgMTc2
MSB0byAyMDE2Ogo+PiAgICBMb2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9zd2FwCj4+ICAg
IExvZ2ljYWwgZXh0ZW50cwkwIHRvIDI1NQo+PiAgUGh5c2ljYWwgZXh0ZW50IDIwMTcgdG8gMjA0
NzoKPj4gICAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRyZnMKPj4gICAgTG9naWNh
bCBleHRlbnRzCTM0ODAgdG8gMzUxMAo+PiAgUGh5c2ljYWwgZXh0ZW50IDIwNDggdG8gMjY4NzoK
Pj4gICAgTG9naWNhbCB2b2x1bWUJL2Rldi92Z19zeXN0ZW0vYnRyZnMKPj4gICAgTG9naWNhbCBl
eHRlbnRzCTAgdG8gNjM5Cj4+ICBQaHlzaWNhbCBleHRlbnQgMjY4OCB0byAzMDA3Ogo+PiAgICBM
b2dpY2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+PiAgICBMb2dpY2FsIGV4dGVudHMJ
MTkxMSB0byAyMjMwCj4+ICBQaHlzaWNhbCBleHRlbnQgMzAwOCB0byAzMzIwOgo+PiAgICBMb2dp
Y2FsIHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9idHJmcwo+PiAgICBMb2dpY2FsIGV4dGVudHMJMTEy
MCB0byAxNDMyCj4+ICBQaHlzaWNhbCBleHRlbnQgMzMyMSB0byAzMzM2Ogo+PiAgICBMb2dpY2Fs
IHZvbHVtZQkvZGV2L3ZnX3N5c3RlbS9ib290Cj4+ICAgIExvZ2ljYWwgZXh0ZW50cwkwIHRvIDE1
Cj4+ICBQaHlzaWNhbCBleHRlbnQgMzMzNyB0byAzODE0Ogo+PiAgICBMb2dpY2FsIHZvbHVtZQkv
ZGV2L3ZnX3N5c3RlbS9idHJmcwo+PiAgICBMb2dpY2FsIGV4dGVudHMJMTQzMyB0byAxOTEwCj4+
IAo+PiAKPj4gV291bGQgYnRyZnMgZXZlbiBiZSBhYmxlIHRvIGFjY2lkZW50YWxseSB0cmltIHBh
cnRzIG9mIG90aGVyIExWcyBvciBkb2VzIHRoaXMgY2xlYXJseSBoaW50IHRvd2FyZHMgYSBMVk0v
ZG0gaXNzdWU/Cj4gCj4gSSBjYW4ndCBzcGVhayBzdXJlLCBidXQgKGF0IGxlYXN0IGZvciBsYXRl
c3Qga2VybmVsKSBidHJmcyBoYXMgYSBsb3Qgb2YKPiBleHRyYSBtb3VudCB0aW1lIHNlbGYgY2hl
Y2ssIGluY2x1ZGluZyBjaHVuayBzdHJpcGUgY2hlY2sgYWdhaW5zdAo+IHVuZGVybHlpbmcgZGV2
aWNlLCB0aHVzIHRoZSBwb3NzaWJpbGl0eSBzaG91bGRuJ3QgYmUgdGhhdCBoaWdoIGZvciBidHJm
cy4KCkluZGVlZCwgYmlzZWN0aW5nIHRoZSBpc3N1ZSBsZWQgbWUgdG8gYSByYW5nZSBvZiBjb21t
aXRzIHRoYXQgb25seSBjb250YWlucyBkbS1yZWxhdGVkIGFuZCBubyBidHJmcy1yZWxhdGVkIGNo
YW5nZXMuIFNvIEkgYXNzdW1lIHRoaXMgaXMgYSBidWcgaW4gZG0uCgo+PiBJcyB0aGVyZSBhbiBl
YXN5IHdheSB0byBzb21laG93IHRyYWNlIHRoZSB0cmltIHRocm91Z2ggdGhlIGRpZmZlcmVudCBs
YXllcnMgc28gb25lIGNhbiBzZWUgd2hlcmUgaXQgZ29lcyB3cm9uZz8KPiAKPiBTdXJlLCB5b3Ug
Y291bGQgdXNlIGRtLWxvZy13cml0ZXMuCj4gSXQgd2lsbCByZWNvcmQgYWxsIHJlYWQvd3JpdGUg
KGluY2x1ZGluZyB0cmltKSBmb3IgbGF0ZXIgcmVwbGF5Lgo+IAo+IFNvIGluIHlvdXIgY2FzZSwg
eW91IGNhbiBidWlsZCB0aGUgc3RvcmFnZSBzdGFjayBsaWtlOgo+IAo+IEJ0cmZzCj4gPGRtLWxv
Zy13cml0ZXM+Cj4gTFVLUy9kbWNyeXB0Cj4gTFZNCj4gTUJSIHBhcnRpdGlvbgo+IFNhbXN1bmcg
U1NECj4gCj4gVGhlbiByZXBsYXkgdGhlIGxvZyAodXNpbmcgc3JjL2xvZy13cml0ZS9yZXBsYXkt
bG9nIGluIGZzdGVzdHMpIHdpdGgKPiB2ZXJib3NlIG91dHB1dCwgeW91IGNhbiB2ZXJpZnkgZXZl
cnkgdHJpbSBvcGVyYXRpb24gYWdhaW5zdCB0aGUgZG1jcnlwdAo+IGRldmljZSBzaXplLgo+IAo+
IElmIGFsbCB0cmltIGFyZSBmaW5lLCB0aGVuIG1vdmUgdGhlIGRtLWxvZy13cml0ZXMgYSBsYXll
ciBsb3dlciwgdW50aWwKPiB5b3UgZmluZCB3aGljaCBsYXllciBpcyBjYXVzaW5nIHRoZSBwcm9i
bGVtLgoKVGhhdCBzb3VuZHMgbGlrZSBhIHBsYW4hIEhvd2V2ZXIsIEkgZmlyc3Qgd2FudCB0byBj
b250aW51ZSBiaXNlY3RpbmcgYXMgSSBhbSBhZnJhaWQgdG8gbG9zZSBteSByZXByb2R1Y2VyIGJ5
IGNoYW5naW5nIHBhcnRzIG9mIG15IHN0b3JhZ2Ugc3RhY2suCgpDaGVlcnMsCk1pY2hhZWwKCj4g
Cj4gVGhhbmtzLAo+IFF1Cj4+IAo+PiBDaGVlcnMsCj4+IE1pY2hhZWwKPj4gCj4+IFBTOiBDdXJy
ZW50IHN0YXRlIG9mIGJpc2VjdGlvbjogSXQgbG9va3MgbGlrZSB0aGUgZXJyb3Igd2FzIGludHJv
ZHVjZWQgc29tZXdoZXJlIGJldHdlZW4gYjVkZDBjNjU4YzMxYjQ2OWNjZmYxYjYzN2U1MTI0ODUx
ZTdhNGExYyBhbmQgdjUuMS4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
