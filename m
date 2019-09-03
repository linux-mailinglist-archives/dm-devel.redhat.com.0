Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id C6265A77A4
	for <lists+dm-devel@lfdr.de>; Wed,  4 Sep 2019 01:42:03 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3B42D10C6973;
	Tue,  3 Sep 2019 23:42:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E05265D6D0;
	Tue,  3 Sep 2019 23:41:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 340ED24F30;
	Tue,  3 Sep 2019 23:41:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x83Nfc0q031396 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 3 Sep 2019 19:41:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54F8819D7A; Tue,  3 Sep 2019 23:41:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2696319D70;
	Tue,  3 Sep 2019 23:41:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x83NfY4u005636; 
	Tue, 3 Sep 2019 18:41:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x83NfXRh005635;
	Tue, 3 Sep 2019 18:41:33 -0500
Date: Tue, 3 Sep 2019 18:41:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Chongyun Wu <wu.chongyun@h3c.com>
Message-ID: <20190903234133.GR25414@octiron.msp.redhat.com>
References: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEB9978CF3252343BE3C67AC9F0086A378D9A799@H3CMLB12-EX.srv.huawei-3com.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Guozhonghua <guozhonghua@h3c.com>, Wangyong <wang.yongD@h3c.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	Changlimin <changlimin@h3c.com>, Zhangguanghui <zhang.guanghui@h3c.com>,
	"Martin Wilck \(mwilck@suse.com\)" <mwilck@suse.com>
Subject: Re: [dm-devel] [PATCH] multipathd: "san_path_err" failure
 optimization
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Tue, 03 Sep 2019 23:42:02 +0000 (UTC)

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMTI6Mjg6MTRQTSArMDAwMCwgQ2hvbmd5dW4gV3Ugd3Jv
dGU6Cj4gSGkgTWFydGluIGFuZCBCZW4sCj4gCj4gQ2xvdWQgeW91IGhlbHAgdG8gdmlldyBiZWxv
dyBwYXRjaCwgdGhhbmtzLgo+IAo+IEZyb20gYTcxMjZlMzNlN2VmZjhhOTg1NjAwYjQxYjE3MjNl
ZTY2YjE4MzU4NiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBDaG9uZ3l1biBXdSA8
d3UuY2hvbmd5dW5AaDNjLmNvbT4KPiBEYXRlOiBUdWUsIDI3IEF1ZyAyMDE5IDEwOjIzOjUwICsw
ODAwCj4gU3ViamVjdDogW1BBVENIXSBtdWx0aXBhdGhkOiAic2FuX3BhdGhfZXJyIiBmYWlsdXJl
IG9wdGltaXphdGlvbgo+IAo+IExldCBzYW5fcGF0aF9lcnJfcmVjb3ZlcnlfdGltZSBwYXRoIHVu
c3RhYmxlIGNhbiBiZQo+IGRldGVjdGVkIGFuZCBub3QgcmVpbnN0YXRlIGl0IHVudGlsIHRoaXMg
cGF0aCBrZWVwIHVwIGluCj4gc2FuX3BhdGhfZXJyX3JlY292ZXJ5X3RpbWUuIEl0IHdpbGwgZml4
IGhlYXZ5IElPIGRlbGF5Cj4gY2F1c2VkIGJ5IHBhcnRzIG9mIHBhdGhzIHN0YXRlIHNoYWt5IGlu
IG11bHRpcGF0aCBkZXZpY2UuCj4gCj4gVGVzdCBhbmQgcmVzdWx0Ogo+IFJ1biB1cCBldGgxIDMw
cyBhbmQgZG93biBldGgxIDMwcyB3aXRoIDEwMCBsb29wcyBzY3JpcHQgdG8KPiBtYWtlIHNvbWUg
cGF0aHMgc2hha3kgaW4gZWFjaCBtdWx0aXBhdGggZGV2aWNlcy4KPiBVc2luZyBiZWxvdyBtdWx0
aXBhdGguY29uZiBjb25maWd1cmUgaW4gZGVmYXVsdHMgc2VjdGlvbjoKPiAgICAgc2FuX3BhdGhf
ZXJyX3JlY292ZXJ5X3RpbWUgMzAKPiAgICAgc2FuX3BhdGhfZXJyX3RocmVzaG9sZCAyCj4gICAg
IHNhbl9wYXRoX2Vycl9mb3JnZXRfcmF0ZSA2Cj4gQWZ0ZXIgdGVzdCwgbm90IGZvdW5kIGFueSBJ
TyBkZWxheSBsb2dzIGV4Y2VwdCBzZXZlcmFsIGxvZ3MgaW4gdGhlIHZlcnkKPiBiZWdpbm5pbmcg
d2hpY2ggYmVmb3JlIHNhbl9wYXRoX2VyciBmaWx0ZXIgc2hha3kgcGF0aCB3b3JrcyAuCj4gSWYg
d2l0aG91dCBhYm92ZSBjb25maWcgYW5kIHRoaXMgcGF0Y2ggdGhlcmUgd2lsbCBiZSBsb3RzIG9m
IElPIGRlbGF5Cj4gaW4gc3lzbG9nIGFuZCBzb21lIHBhdGhzIHN0YXRlIGNoYW5nZSBmcm9tIHVw
IHRvIGRvd24gYWdhaW4gYW5kIGFnYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENob25neXVuIFd1
IDx3dS5jaG9uZ3l1bkBoM2MuY29tPgoKUmV2aWV3ZWQtYnk6IEJlbmphbWluIE1hcnppbnNraSA8
Ym1hcnppbnNAcmVkaGF0LmNvbT4KCj4gLS0tCj4gIG11bHRpcGF0aGQvbWFpbi5jIHwgMTcgKysr
KysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKykKPiAKPiBk
aWZmIC0tZ2l0IGEvbXVsdGlwYXRoZC9tYWluLmMgYi9tdWx0aXBhdGhkL21haW4uYwo+IGluZGV4
IDdhNWNkMTEuLjhhY2QwODAgMTAwNjQ0Cj4gLS0tIGEvbXVsdGlwYXRoZC9tYWluLmMKPiArKysg
Yi9tdWx0aXBhdGhkL21haW4uYwo+IEBAIC0xODk3LDYgKzE4OTcsMTggQEAgc3RhdGljIGludCBj
aGVja19wYXRoX3JlaW5zdGF0ZV9zdGF0ZShzdHJ1Y3QgcGF0aCAqIHBwKSB7Cj4gIAkJCWNvbmRs
b2coMiwgIiVzIDogcmVpbnN0YXRpbmcgcGF0aCBlYXJseSIsIHBwLT5kZXYpOwo+ICAJCQlnb3Rv
IHJlaW5zdGF0ZV9wYXRoOwo+ICAJCX0KPiArCj4gKwkJLyogSWYgcGF0aCBiZWNhbWUgZmFpbGVk
IGFnYWluIG9yIGNvbnRpbnVlIGZhaWxlZCwgc2hvdWxkIHJlc2V0Cj4gKwkJICogcGF0aCBzYW5f
cGF0aF9lcnJfZm9yZ2V0X3JhdGUgYW5kIHBhdGggZGlzX3JlaW5zdGF0ZV90aW1lIHRvCj4gKwkJ
ICogc3RhcnQgYSBuZXcgc3RhYmxlIGNoZWNrLiAKPiArCQkgKi8KPiArCQlpZiAoKHBwLT5zdGF0
ZSAhPSBQQVRIX1VQKSAmJiAocHAtPnN0YXRlICE9IFBBVEhfR0hPU1QpICYmCj4gKwkJCShwcC0+
c3RhdGUgIT0gUEFUSF9ERUxBWUVEKSkgewo+ICsJCQlwcC0+c2FuX3BhdGhfZXJyX2ZvcmdldF9y
YXRlID0KPiArCQkJCXBwLT5tcHAtPnNhbl9wYXRoX2Vycl9mb3JnZXRfcmF0ZTsKPiArCQkJcHAt
PmRpc19yZWluc3RhdGVfdGltZSA9IGN1cnJfdGltZS50dl9zZWM7Cj4gKwkJfQo+ICsKPiAgCQlp
ZiAoKGN1cnJfdGltZS50dl9zZWMgLSBwcC0+ZGlzX3JlaW5zdGF0ZV90aW1lICkgPiBwcC0+bXBw
LT5zYW5fcGF0aF9lcnJfcmVjb3ZlcnlfdGltZSkgewo+ICAJCQljb25kbG9nKDIsIiVzIDogcmVp
bnN0YXRlIHRoZSBwYXRoIGFmdGVyIGVyciByZWNvdmVyeSB0aW1lIiwgcHAtPmRldik7Cj4gIAkJ
CWdvdG8gcmVpbnN0YXRlX3BhdGg7Cj4gQEAgLTIxMDYsNiArMjExOCwxMSBAQCBjaGVja19wYXRo
IChzdHJ1Y3QgdmVjdG9ycyAqIHZlY3MsIHN0cnVjdCBwYXRoICogcHAsIGludCB0aWNrcykKPiAg
CQkJY2hlY2tfcGF0aF9yZWluc3RhdGVfc3RhdGUocHApKSB7Cj4gIAkJcHAtPnN0YXRlID0gUEFU
SF9ERUxBWUVEOwo+ICAJCXJldHVybiAxOwo+ICsJfSBlbHNlIGlmICgobmV3c3RhdGUgIT0gUEFU
SF9VUCAmJiBuZXdzdGF0ZSAhPSBQQVRIX0dIT1NUKSAmJgo+ICsJCQkocHAtPnN0YXRlID09IFBB
VEhfREVMQVlFRCkpIHsKPiArCQkvKiBJZiBwYXRoIHN0YXRlIGJlY29tZSBmYWlsZWQgYWdhaW4g
Y2FuY2VsIHBhdGggZGVsYXkgc3RhdGUgKi8KPiArCQlwcC0+c3RhdGUgPSBuZXdzdGF0ZTsKPiAr
CQlyZXR1cm4gMTsKPiAgCX0KPiAgCj4gIAlpZiAoKG5ld3N0YXRlID09IFBBVEhfVVAgfHwgbmV3
c3RhdGUgPT0gUEFUSF9HSE9TVCkgJiYKPiAtLSAKPiAKPiBCZXN0IFJlZ2FyZHPvvIwKPiBDaG9u
Z3l1biBXdQo+IAoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20K
aHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs
