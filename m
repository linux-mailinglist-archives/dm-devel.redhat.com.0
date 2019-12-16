Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E4EE912192B
	for <lists+dm-devel@lfdr.de>; Mon, 16 Dec 2019 19:51:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1576522270;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ebfn8h9RUAyCFKt8c5UiuHsYm6CfnJ+4riBDBKK+zXw=;
	b=Ya6Guzf5Bx9bNxT+tXTddd8dwVPrNQkzCJiMkSAHNl+JU0oYD4RonHhtLO2qqfwAU0I1sX
	nMeP9HGPBAQAgLCSakwDdE2YwCyu6B8KCjKc55CXDje4poCvp5RkqtgFWN43efiT+4YMB2
	1CsSMcrVT/BEku49KWxDYutM+XlxZEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-V6rpcfd-NcKUXrdxVMrLQQ-1; Mon, 16 Dec 2019 13:51:09 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 709F01800D7B;
	Mon, 16 Dec 2019 18:51:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC553381;
	Mon, 16 Dec 2019 18:50:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AF5B18089C8;
	Mon, 16 Dec 2019 18:50:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xBGIoZmW019391 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 16 Dec 2019 13:50:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 88A06A4845; Mon, 16 Dec 2019 18:50:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 82818AF992
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 18:50:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7541D101D22D
	for <dm-devel@redhat.com>; Mon, 16 Dec 2019 18:50:33 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-254-DcZdiS8pP7uMYSGsJ9JM7A-1;
	Mon, 16 Dec 2019 13:50:29 -0500
Received: from gmail.com (unknown [104.132.1.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 65FB420665;
	Mon, 16 Dec 2019 18:50:27 +0000 (UTC)
Date: Mon, 16 Dec 2019 10:50:26 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: =?utf-8?B?eGlhbnJvbmcuemhvdSjlkajlhYjojaMp?= <xianrong.zhou@transsion.com>
Message-ID: <20191216185025.GF139479@gmail.com>
References: <727b9e9279a546beb2ae63a18eae6ab0@transsion.com>
MIME-Version: 1.0
In-Reply-To: <727b9e9279a546beb2ae63a18eae6ab0@transsion.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-MC-Unique: DcZdiS8pP7uMYSGsJ9JM7A-1
X-MC-Unique: V6rpcfd-NcKUXrdxVMrLQQ-1
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xBGIoZmW019391
X-loop: dm-devel@redhat.com
Cc: =?utf-8?B?d2VpbWluLm1hbyjmr5vljavmsJEp?= <weimin.mao@transsion.com>,
	=?utf-8?B?aGFpemhvdS5zb25nKOWui+a1t+iInyk=?= <haizhou.song@transsion.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>,
	=?utf-8?B?d2FuYmluLndhbmco5rGq5LiH5paMKQ==?= <wanbin.wang@transsion.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?utf-8?B?eXVhbmppb25nLmdhbyjpq5jmuIrngq8p?= <yuanjiong.gao@transsion.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	=?utf-8?B?cnV4aWFuLmZlbmco5Yav5YSS5ai0KQ==?=
	<ruxian.feng@transsion.com>, "agk@redhat.com" <agk@redhat.com>
Subject: Re: [dm-devel] [PATCH] dm-verity: unnecessary data blocks that need
 not read hash blocks
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gTW9uLCBEZWMgMTYsIDIwMTkgYXQgMDI6MDI6MzNBTSArMDAwMCwgeGlhbnJvbmcuemhvdSjl
kajlhYjojaMpIHdyb3RlOgo+IGhleSBFcmljOgo+IAo+IE9uIFdlZCwgRGVjIDExLCAyMDE5IGF0
IDExOjMyOjQwQU0gKzA4MDAsIHpob3UgeGlhbnJvbmcgd3JvdGU6Cj4gPiBGcm9tOiAieGlhbnJv
bmcuemhvdSIgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9uLmNvbT4KPiA+IAo+ID4gSWYgY2hlY2tf
YXRfbW9zdF9vbmNlIGVuYWJsZWQsIGp1c3QgbGlrZSB2ZXJpdHkgd29yayB0aGUgcHJlZmV0Y2hp
bmcgCj4gPiB3b3JrIHNob3VsZCBjaGVjayBmb3IgZGF0YSBibG9jayBiaXRtYXAgZmlyc3RseSBi
ZWZvcmUgcmVhZGluZyBoYXNoIAo+ID4gYmxvY2sgYXMgd2VsbC4gU2tpcCBiaXQtc2V0IGRhdGEg
YmxvY2tzIGZyb20gYm90aCBlbmRzIG9mIGRhdGEgYmxvY2sgCj4gPiByYW5nZSBieSB0ZXN0aW5n
IHRoZSB2YWxpZGF0ZWQgYml0bWFwLiBUaGlzIGNhbiByZWR1Y2UgdGhlIGFtb3VudHMgb2YgCj4g
PiBkYXRhIGJsb2NrcyB3aGljaCBuZWVkIHRvIHJlYWQgaGFzaCBibG9ja3MuCj4gPiAKPiA+IExh
dW5jaGluZyA5MSBhcHBzIGV2ZXJ5IDE1cyBhbmQgcmVwZWF0IDIxIHJvdW5kcyBvbiBBbmRyb2lk
IFEuCj4gPiBJbiBwcmVmZXRjaGluZyB3b3JrIHdlIGNhbiBsZXQgb25seSAyNjAyLzM2MDMxMiA9
IDAuNzIlIGRhdGEgYmxvY2tzIAo+ID4gcmVhbGx5IG5lZWQgdG8gcmVhZCBoYXNoIGJsb2Nrcy4K
PiA+IAo+ID4gQnV0IHRoZSByZWR1Y2VkIGRhdGEgYmxvY2tzIHJhbmdlIHdvdWxkIGJlIGVubGFy
Z2VkIGFnYWluIGJ5IAo+ID4gZG1fdmVyaXR5X3ByZWZldGNoX2NsdXN0ZXIgbGF0ZXIuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IHhpYW5yb25nLnpob3UgPHhpYW5yb25nLnpob3VAdHJhbnNzaW9u
LmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IHl1YW5qaW9uZy5nYW8gPHl1YW5qaW9uZy5nYW9AdHJh
bnNzaW9uLmNvbT4KPiA+IFRlc3RlZC1ieTogcnV4aWFuLmZlbmcgPHJ1eGlhbi5mZW5nQHRyYW5z
c2lvbi5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYyB8IDE2
ICsrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMgCj4gPiBi
L2RyaXZlcnMvbWQvZG0tdmVyaXR5LXRhcmdldC5jIGluZGV4IDRmYjMzZTc1NjJjNS4uN2I4ZWI3
NTRjMGI2IAo+ID4gMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQu
Ywo+ID4gKysrIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMKPiA+IEBAIC01ODEsNiAr
NTgxLDIyIEBAIHN0YXRpYyB2b2lkIHZlcml0eV9wcmVmZXRjaF9pbyhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCj4gPiAgCXN0cnVjdCBkbV92ZXJpdHkgKnYgPSBwdy0+djsKPiA+ICAJaW50IGk7
Cj4gPiAgCj4gPiArCWlmICh2LT52YWxpZGF0ZWRfYmxvY2tzKSB7Cj4gPiArCQl3aGlsZSAocHct
Pm5fYmxvY2tzKSB7Cj4gPiArCQkJaWYgKHVubGlrZWx5KCF0ZXN0X2JpdChwdy0+YmxvY2ssIHYt
PnZhbGlkYXRlZF9ibG9ja3MpKSkKPiA+ICsJCQkJYnJlYWs7Cj4gPiArCQkJcHctPmJsb2NrKys7
Cj4gPiArCQkJcHctPm5fYmxvY2tzLS07Cj4gPiArCQl9Cj4gPiArCQl3aGlsZSAocHctPm5fYmxv
Y2tzKSB7Cj4gPiArCQkJaWYgKHVubGlrZWx5KCF0ZXN0X2JpdChwdy0+YmxvY2sgKyBwdy0+bl9i
bG9ja3MgLSAxLAo+ID4gKwkJCQl2LT52YWxpZGF0ZWRfYmxvY2tzKSkpCj4gPiArCQkJCWJyZWFr
Owo+ID4gKwkJCXB3LT5uX2Jsb2Nrcy0tOwo+ID4gKwkJfQo+ID4gKwkJaWYgKCFwdy0+bl9ibG9j
a3MpCj4gPiArCQkJcmV0dXJuOwo+ID4gKwl9Cj4gCj4gVGhpcyBpcyBhIGdvb2QgaWRlYSwgYnV0
IHNob3VsZG4ndCB0aGlzIGxvZ2ljIGdvIGluIHZlcml0eV9zdWJtaXRfcHJlZmV0Y2goKQo+IHBy
aW9yIHRvIHRoZSBzdHJ1Y3QgZG1fdmVyaXR5X3ByZWZldGNoX3dvcmsgYmVpbmcgYWxsb2NhdGVk
PyAgVGhlbiBpZiBubwo+IHByZWZlY2hpbmcgaXMgbmVlZGVkLCBhbGxvY2F0aW5nIGFuZCBzY2hl
ZHVsaW5nIHRoZSB3b3JrIG9iamVjdCBjYW4gYmUKPiBza2lwcGVkLgo+IAo+IEVyaWMsIERvIHlv
dSBtZWFuIGl0IGlzIG1vcmUgc3VpdGFibGUgaW4gZG1fYnVmaW9fcHJlZmV0Y2ggd2hpY2ggaXMg
Y2FsbGVkIG9uCj4gZGlmZmVyZW50IHBhdGhzIGV2ZW4gdGhvdWdoIHByZWZlY2hpbmcgaXMgZGlz
YWJsZWQgPwo+IAoKTm8sIEknbSB0YWxraW5nIGFib3V0IHZlcml0eV9zdWJtaXRfcHJlZmV0Y2go
KS4gIHZlcml0eV9zdWJtaXRfcHJlZmV0Y2goKQphbGxvY2F0ZXMgYW5kIHNjaGVkdWxlcyBhIHdv
cmsgb2JqZWN0LCB3aGljaCBleGVjdXRlcyB2ZXJpdHlfcHJlZmV0Y2hfaW8oKS4KSWYgYWxsIGRh
dGEgYmxvY2tzIGluIHRoZSBJL08gcmVxdWVzdCB3ZXJlIGFscmVhZHkgdmFsaWRhdGVkLCB0aGVy
ZSdzIG5vIG5lZWQgdG8KYWxsb2NhdGUgYW5kIHNjaGVkdWxlIHRoZSBwcmVmZXRjaCB3b3JrLgoK
LSBFcmljCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0
cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

