Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 107B32D8716
	for <lists+dm-devel@lfdr.de>; Sat, 12 Dec 2020 15:29:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607783394;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vWeQW/XKf/AAP7kGUf6uYtEJYtN9LrnmSp3iEuAtCzs=;
	b=NKnsFlC7yhJcg+Lv9TBIFK+nXYbqgFpG8Skik5nlLAN+cJXOa24FnXuPiv0Uo71kGxKzQ3
	xgC7vOORYuNMR4ZZUg7kAMK6+CZBy5HRr4mcBCZUC+8hH9/haQIDI7i31xRNZhGcWfQJYV
	bGnQDCWgdBjni3nVe0wAbFAVBrRTopU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-1arLPmNYPvmOpqQViqmxag-1; Sat, 12 Dec 2020 09:29:51 -0500
X-MC-Unique: 1arLPmNYPvmOpqQViqmxag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B6BB801817;
	Sat, 12 Dec 2020 14:29:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD2D63BA7;
	Sat, 12 Dec 2020 14:29:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B0164A7C6;
	Sat, 12 Dec 2020 14:29:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BCET0MG008385 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 12 Dec 2020 09:29:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CDE6D1F06F; Sat, 12 Dec 2020 14:29:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3DAE51F055;
	Sat, 12 Dec 2020 14:28:57 +0000 (UTC)
Date: Sat, 12 Dec 2020 09:28:56 -0500
From: Mike Snitzer <snitzer@redhat.com>
To: Song Liu <songliubraving@fb.com>
Message-ID: <20201212142856.GA21863@redhat.com>
References: <C8607BD3-5701-40A1-AA17-62B2A807A751@fb.com>
MIME-Version: 1.0
In-Reply-To: <C8607BD3-5701-40A1-AA17-62B2A807A751@fb.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: Jens Axboe <axboe@kernel.dk>, Heinz Mauelshagen <heinzm@redhat.com>,
	Xiao Ni <xni@redhat.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] need help with dm & md raid10 issue
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU2F0LCBEZWMgMTIgMjAyMCBhdCAgMzo0MmFtIC0wNTAwLApTb25nIExpdSA8c29uZ2xpdWJy
YXZpbmdAZmIuY29tPiB3cm90ZToKCj4gSGkgTWlrZSwKPiAKPiBJIGFtIGxvb2tpbmcgYXQgdGhl
IGEgbmV3IHdhcm5pbmcgd2hpbGUgcmV2ZXJ0aW5nIHRoZSByYWlkMTAgY2hhbmdlczoKPiAKPiBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjE0LAo+ICAgICAg
ICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9hc20tZ2VuZXJpYy9idWcuaDoyMCwKPiAgICAgICAg
ICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oOjkzLAo+ICAgICAgICAg
ICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9idWcuaDo1LAo+ICAgICAgICAgICAgICAgICBm
cm9tIC4vaW5jbHVkZS9saW51eC9tbWRlYnVnLmg6NSwKPiAgICAgICAgICAgICAgICAgZnJvbSAu
L2luY2x1ZGUvbGludXgvZ2ZwLmg6NSwKPiAgICAgICAgICAgICAgICAgZnJvbSAuL2luY2x1ZGUv
bGludXgvc2xhYi5oOjE1LAo+ICAgICAgICAgICAgICAgICBmcm9tIGRyaXZlcnMvbWQvZG0tcmFp
ZC5jOjg6Cj4gZHJpdmVycy9tZC9kbS1yYWlkLmM6IEluIGZ1bmN0aW9uIOKAmHJhaWRfaW9faGlu
dHPigJk6Cj4gLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjE4OjI4OiB3YXJuaW5nOiBjb21wYXJp
c29uIG9mIGRpc3RpbmN0IHBvaW50ZXIgdHlwZXMgbGFja3MgYSBjYXN0Cj4gICAxOCB8ICAoISEo
c2l6ZW9mKCh0eXBlb2YoeCkgKikxID09ICh0eXBlb2YoeSkgKikxKSkpCj4gICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5+Cj4gLi9pbmNsdWRlL2xpbnV4L21pbm1heC5oOjMyOjQ6
IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX3R5cGVjaGVja+KAmQo+ICAgMzIgfCAg
IChfX3R5cGVjaGVjayh4LCB5KSAmJiBfX25vX3NpZGVfZWZmZWN0cyh4LCB5KSkKPiAgICAgIHwg
ICAgXn5+fn5+fn5+fn4KPiAuL2luY2x1ZGUvbGludXgvbWlubWF4Lmg6NDI6MjQ6IG5vdGU6IGlu
IGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX3NhZmVfY21w4oCZCj4gICA0MiB8ICBfX2J1aWx0aW5f
Y2hvb3NlX2V4cHIoX19zYWZlX2NtcCh4LCB5KSwgXAo+ICAgICAgfCAgICAgICAgICAgICAgICAg
ICAgICAgIF5+fn5+fn5+fn4KPiAuL2luY2x1ZGUvbGludXgvbWlubWF4Lmg6NTE6MTk6IG5vdGU6
IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhfX2NhcmVmdWxfY21w4oCZCj4gICA1MSB8ICNkZWZp
bmUgbWluKHgsIHkpIF9fY2FyZWZ1bF9jbXAoeCwgeSwgPCkKPiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9taW5tYXguaDo4NDozOTogbm90
ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmG1pbuKAmQo+ICAgODQgfCAgX194ID09IDAgPyBf
X3kgOiAoKF9feSA9PSAwKSA/IF9feCA6IG1pbihfX3gsIF9feSkpOyB9KQo+ICAgICAgfCAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fgo+IGRyaXZlcnMvbWQvZG0tcmFp
ZC5jOjM3Mzk6MzM6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhtaW5fbm90X3plcm/i
gJkKPiAzNzM5IHwgICBsaW1pdHMtPm1heF9kaXNjYXJkX3NlY3RvcnMgPSBtaW5fbm90X3plcm8o
cnMtPm1kLmNodW5rX3NlY3RvcnMsCj4gICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn5+fn5+fn5+fn5+Cj4gCj4gVGhpcyBpcyBjYXVzZWQgYnkgcmVjZW50IHJldmVydHMu
IEhlcmUgaXMgd2hhdCBoYXBwZW5lZC4gCj4gCj4gV2UgYXJlIGxvb2tpbmcgYXQgNyBwYXRjaGVz
LCBpbiB0aGUgb3JpZ2luYWwgY29tbWl0dGVkIG9yZGVyOgo+IAo+IFttZDEgLSBtZDVdCj4gbWQ6
IGFkZCBtZF9zdWJtaXRfZGlzY2FyZF9iaW8oKSBmb3Igc3VibWl0dGluZyBkaXNjYXJkIGJpbwo+
IG1kL3JhaWQxMDogZXh0ZW5kIHIxMGJpbyBkZXZzIHRvIHJhaWQgZGlza3MKPiBtZC9yYWlkMTA6
IHB1bGwgY29kZXMgdGhhdCB3YWl0IGZvciBibG9ja2VkIGRldiBpbnRvIG9uZSBmdW5jdGlvbgo+
IG1kL3JhaWQxMDogaW1wcm92ZSByYWlkMTAgZGlzY2FyZCByZXF1ZXN0Cj4gbWQvcmFpZDEwOiBp
bXByb3ZlIGRpc2NhcmQgcmVxdWVzdCBmb3IgZmFyIGxheW91dAo+IAo+IFtkbTEgLSBkbTJdCj4g
ZG0gcmFpZDogZml4IGRpc2NhcmQgbGltaXRzIGZvciByYWlkMSBhbmQgcmFpZDEwCj4gZG0gcmFp
ZDogcmVtb3ZlIHVubmVjZXNzYXJ5IGRpc2NhcmQgbGltaXRzIGZvciByYWlkMTAKPiAKPiBkbTIg
ZGVwZW5kcyBvbiB0aGUgbWQxLTUgY2hhbmdlcywgd2hpbGUgZG0xIGRvZXNuJ3QuIAo+IAo+IEkg
cmV2ZXJ0ZWQgbWQgcGF0Y2hlcyBhbmQgZG0yLCB3aGljaCBjYXVzZWQgdGhlIG5ldyB3YXJuaW5n
IGFib3ZlLiBJIAo+IGRpZG4ndCBwYXkgbXVjaCBhdHRlbnRpb24gdG8gaXQsIGJlY2F1c2UgSSB0
aG91Z2h0IEkgd2FzIHJldmVydGluZyBhIAo+IHBhdGNoLCBzbyBJIGp1c3QgYnJvdWdodCBiYWNr
IGFuIG9sZCB3YXJuaW5nLiBIb3dldmVyLCB0aGlzIHdhcyB3cm9uZy4gCj4gVGhlIHdhcm5pbmcg
d2FzIGludHJvZHVjZWQgaW4gZG0xLCBhbmQgZml4ZWQgaW4gZG0yLiBUaGVyZWZvcmUsIHRoZXJl
IAo+IHdhc24ndCB3YXJuaW5nIGJlZm9yZSBkbTEgb3IgYWZ0ZXIgZG0yLiBJdCBoYXBwZW5zIHdp
dGggZG0xIG9ubHkuIAoKT0ssIEkgc2VlIGl0IHdoZW4gSSByZXZlcnQgZjBlOTBiNmM2NjNhN2Uz
YjQ3MzZjYjMxOGM2YzdjNTg5ZjE1MmMyOAoKQnV0IGEgc2ltcGxlIGNhc3Qgc2lsZW5jZXMgaXQ6
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS1yYWlkLmMgYi9kcml2ZXJzL21kL2RtLXJhaWQu
YwppbmRleCBkYzg1NjhhYjk2ZjIuLjhlMDRhNGNiMTZhNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9t
ZC9kbS1yYWlkLmMKKysrIGIvZHJpdmVycy9tZC9kbS1yYWlkLmMKQEAgLTM3MzYsNyArMzczNiw3
IEBAIHN0YXRpYyB2b2lkIHJhaWRfaW9faGludHMoc3RydWN0IGRtX3RhcmdldCAqdGksIHN0cnVj
dCBxdWV1ZV9saW1pdHMgKmxpbWl0cykKICAgICAgICBpZiAocnNfaXNfcmFpZDEwKHJzKSkgewog
ICAgICAgICAgICAgICAgbGltaXRzLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gbWF4KGNodW5rX3Np
emVfYnl0ZXMsCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGltaXRzLT5kaXNjYXJkX2dyYW51bGFyaXR5KTsKLSAgICAgICAgICAgICAgIGxpbWl0cy0+
bWF4X2Rpc2NhcmRfc2VjdG9ycyA9IG1pbl9ub3RfemVybyhycy0+bWQuY2h1bmtfc2VjdG9ycywK
KyAgICAgICAgICAgICAgIGxpbWl0cy0+bWF4X2Rpc2NhcmRfc2VjdG9ycyA9IG1pbl9ub3RfemVy
bygodW5zaWduZWQpcnMtPm1kLmNodW5rX3NlY3RvcnMsCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGltaXRzLT5tYXhfZGlzY2FyZF9z
ZWN0b3JzKTsKICAgICAgICB9CiB9CgpCdXQgSSB0aGluayBhIHByb3BlciBmaXggaXMgbmVlZGVk
IGluIE1EIChzZWUgYmVsb3cpLgoKPiBBdCB0aGlzIHBvaW50LCBJIHRoaW5rIG91ciBiZXN0IG9w
dGlvbiBpcyB0byByZXZlcnQgYWxsIG9mIHRoZXNlIHBhdGNoZXMuIAo+IEFzIGRtMSBhbG9uZSBo
YXNuJ3QgYmVlbiB0ZXN0ZWQgbXVjaCAoYW5kIGl0IHRyaWdnZXJzIG5ldyB3YXJuaW5nKS4KPiAK
PiBIb3dldmVyLCBhcyBJIHBsYW4gdG8gdGVzdCBkbSByYWlkMTAsIEkgZm91bmQgdGhlcmUgbWln
aHQgYmUgc29tZSBpc3N1ZSAKPiB3aXRoIGl0LiBJIGFtIGZvbGxvd2luZyBodHRwczovL3dpa2ku
Z2VudG9vLm9yZy93aWtpL0RldmljZS1tYXBwZXIjUkFJRDEwIAo+IGFuZCB1c2luZyBjb21tYW5k
czoKPiAKPiBmb3IgUyBpbiB7MC4uM30gOyBkbyBkbXNldHVwIGNyZWF0ZSB0ZXN0LXJhaWQtbWV0
YWRhdGEkUyBcCj4gICAgIC0tdGFibGUgIjAgODE5MiBsaW5lYXIgL2Rldi9sb29wJFMgMCI7IFwK
PiAgICAgZG1zZXR1cCBjcmVhdGUgdGVzdC1yYWlkLWRhdGEkUyAtLXRhYmxlICIwIDE5NTMxMjUg
bGluZWFyIC9kZXYvbG9vcCRTIDgxOTIiOyBkb25lCj4gCj4gZG1zZXR1cCBjcmVhdGUgdGVzdC1y
YWlkMTAgLS10YWJsZSAnMCAxOTUzMDI0IHJhaWQgcmFpZDEwIDUgNTEyIHJhaWQxMF9mb3JtYXQg
bmVhciByYWlkMTBfY29waWVzIDIgNCAtIC9kZXYvbWFwcGVyL3Rlc3QtcmFpZC1kYXRhMCAtIC9k
ZXYvbWFwcGVyL3Rlc3QtcmFpZC1kYXRhMSAtIC9kZXYvbWFwcGVyL3Rlc3QtcmFpZC1kYXRhMiAt
IC9kZXYvbWFwcGVyL3Rlc3QtcmFpZC1kYXRhMycKPiAKPiBUaGUgc2Vjb25kIGNvbW1hbmQgZ2l2
ZSBzb21lIGVycm9yLiBBZnRlciBkZWJ1Z2dpbmcgSSBmb3VuZCByYWlkX2N0cigpIAo+IGNhbGxz
IG1kX3J1bigpIHdpdGggcnMtPm1kLm5ld19sYXlvdXQgPT0gMCwgd2hpY2ggZG9lc24ndCB3b3Jr
LiBUaGUgCj4gbmV3X2xheW91dCB3YXMgaW5pdGlhbGx5IHNldCB0byAyNTggaW4gcGFyc2VfcmFp
ZF9wYXJhbXMoKSwgYnV0IGdvdCAKPiBvdmVyd3JpdHRlbiB0byB6ZXJvIGluIHJzX3NldF9jdXIo
KS4gV2l0aCB0aGUgZm9sbG93aW5nIGhhY2ssIEkgd2FzIAo+IGZpbmFsbHkgYWJsZSB0byBydW4g
dGVzdHMgd2l0aCBkbS1yYWlkMTAuIAo+IAo+ID09PT09PT09PT09PT09PT09PT0gODwgPT09PT09
PT09PT09PT09PT09PT09PT09PQo+IAo+IGRpZmYgLS1naXQgaS9kcml2ZXJzL21kL2RtLXJhaWQu
YyB3L2RyaXZlcnMvbWQvZG0tcmFpZC5jCj4gaW5kZXggOWMxZjdjNGRlNjViMy4uMTNiNjI0NDkw
ZTI0YyAxMDA2NDQKPiAtLS0gaS9kcml2ZXJzL21kL2RtLXJhaWQuYwo+ICsrKyB3L2RyaXZlcnMv
bWQvZG0tcmFpZC5jCj4gQEAgLTMxNzgsNyArMzE3OCw2IEBAIHN0YXRpYyBpbnQgcmFpZF9jdHIo
c3RydWN0IGRtX3RhcmdldCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBjaGFyICoqYXJndikKPiAg
ICAgICAgICAgICAgICAgICAgICAgICAvKiBSZXNoYXBpbmcgYWluJ3QgcmVjb3ZlcnksIHNvIGRp
c2FibGUgcmVjb3ZlcnkgKi8KPiAgICAgICAgICAgICAgICAgICAgICAgICByc19zZXR1cF9yZWNv
dmVyeShycywgTWF4U2VjdG9yKTsKPiAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAg
ICByc19zZXRfY3VyKHJzKTsKPiAgICAgICAgIH0gZWxzZSB7Cj4gIHNpemVfY2hlY2s6Cj4gICAg
ICAgICAgICAgICAgIC8qIE1heSBub3Qgc2V0IHJlY292ZXJ5IHdoZW4gYSBkZXZpY2UgcmVidWls
ZCBpcyByZXF1ZXN0ZWQgKi8KPiAKPiA9PT09PT09PT09PT09PT09PT09IDg8ID09PT09PT09PT09
PT09PT09PT09PT09PT0KPiAKPiBDb3VsZCB5b3UgcGxlYXNlIGhlbHAgbWUgd2l0aCB0aGUgZm9s
bG93aW5nOgo+IAo+IDEuIENvbmZpcm0gaXQgaXMgT0sgdG8gcmV2ZXJ0IGJvdGggZG0gcGF0Y2hl
cywgd2hpY2ggaXMgYXZhaWxhYmxlIGF0IAo+IAo+ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc29uZy9tZC5naXQgbWQtZml4ZXMKPiAKPiBUaGlzIGlz
IHVyZ2VudCwgYXMgd2UgbmVlZCBpdCBpbiA1LjEwIGZpbmFsIHRoaXMgd2Vla2VuZC4gCgpJJ20g
bm90IHVuZGVyc3RhbmRpbmcgaG93IHRoZSBjb21waWxlciB3YXJuaW5nIHJlbGF0ZXMgdG8geW91
ciBnZW50b28KcmVjaXBlJ3MgZmFpbHVyZSAoc2VlbXMgaXQgZG9lc24ndCkuCgpCdXQgZ2l2ZW4g
TUQgcmFpZDEgZG9lc24ndCByZXF1aXJlIGJpbyBzcGxpdHRpbmcsIHJldmVydGluZwplMDkxMGM4
ZTRmODdiIGlzIGV4Y2Vzc2l2ZS4KCldoeSBub3QgZG8gdGhlIHVuc2lnbmVkIGNhc3QgbGlrZSBJ
IHNob3dlZCBhYm92ZT8gIEJ1dCBzZWNvbmRhcmlseTogd2h5CmlzIGNodW5rX3NlY3RvcnNpbiAn
c3RydWN0IG1kZGV2JyBfbm90XyAndW5zaWduZWQgaW50JyBsaWtlIGl0IGlzIGluCidzdHJ1Y3Qg
cXVldWVfbGltaXRzJz8KCklzbid0IHRoZSBwcm9wZXIgZml4IGp1c3QgY2hhbmdpbmcgTUQncyBj
aHVua19zZWN0b3JzIHRvICd1bnNpZ25lZCBpbnQnPwpFLmcuIHRoaXMgc2VlbXMgdG8gc2lsZW5j
ZSB0aGUgY29tcGlsZXIgd2FybmluZyB0b286CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9tZC5o
IGIvZHJpdmVycy9tZC9tZC5oCmluZGV4IGNjZmI2OTg2OGMyZS4uYjA4MTRkOGYzNTIzIDEwMDY0
NAotLS0gYS9kcml2ZXJzL21kL21kLmgKKysrIGIvZHJpdmVycy9tZC9tZC5oCkBAIC0zMTEsNyAr
MzExLDcgQEAgc3RydWN0IG1kZGV2IHsKICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGV4dGVybmFsOyAgICAgICAvKiBtZXRhZGF0YSBpcwogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAqIG1hbmFnZWQgZXh0ZXJuYWxs
eSAqLwogICAgICAgIGNoYXIgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWV0YWRhdGFfdHlw
ZVsxN107IC8qIGV4dGVybmFsbHkgc2V0Ki8KLSAgICAgICBpbnQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNodW5rX3NlY3RvcnM7CisgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAg
ICAgICAgICBjaHVua19zZWN0b3JzOwogICAgICAgIHRpbWU2NF90ICAgICAgICAgICAgICAgICAg
ICAgICAgY3RpbWUsIHV0aW1lOwogICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgbGV2ZWwsIGxheW91dDsKICAgICAgICBjaGFyICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGNsZXZlbFsxNl07CkBAIC0zMzksNyArMzM5LDcgQEAgc3RydWN0IG1kZGV2IHsKICAgICAgICAg
Ki8KICAgICAgICBzZWN0b3JfdCAgICAgICAgICAgICAgICAgICAgICAgIHJlc2hhcGVfcG9zaXRp
b247CiAgICAgICAgaW50ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZWx0YV9kaXNrcywg
bmV3X2xldmVsLCBuZXdfbGF5b3V0OwotICAgICAgIGludCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgbmV3X2NodW5rX3NlY3RvcnM7CisgICAgICAgdW5zaWduZWQgaW50ICAgICAgICAgICAg
ICAgICAgICBuZXdfY2h1bmtfc2VjdG9yczsKICAgICAgICBpbnQgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJlc2hhcGVfYmFja3dhcmRzOwoKICAgICAgICBzdHJ1Y3QgbWRfdGhyZWFkICAg
ICAgICAgICAgICAgICp0aHJlYWQ7ICAgICAgICAvKiBtYW5hZ2VtZW50IHRocmVhZCAqLwoKPiAy
LiBIZWxwIG1lIHdpdGggZG0tcmFpZCB0ZXN0aW5nLiBJcyBpdCBhIGJ1Zz8gT3IgZGlkIEkgdXNl
IHdyb25nIG9wdGlvbnM/IAo+IAo+IFRoaXMgaXMgcHJvYmFibHkgbm90IHVyZ2VudCwgYXMgdGhl
IHNhbWUgY29tbWFuZCBnaXZlcyBzYW1lIGVycm9yIG9uIDUuOS4wLiAKCkkgZG9uJ3Qga25vdywg
bGlrZWx5IGJlc3QgZm9yIFhpYW8gb3IgSGVpbnogdG8gaGF2ZSBhIGxvb2suCgpUaGVzZSBwcml2
YXRlIG1haWxzIGFyZSBjb21wbGV0ZWx5IHVubmVjZXNzYXJ5LgoKWW91IHJlYWxseSBzaG91bGQg
YmUgY29tbXVuaWNhdGluZyB3aXRoIFhpYW8gYW5kIEhlaW56IGFuZCBjYydpbmcKZG0tZGV2ZWwg
KEkndmUgZG9uZSB0aGF0IG5vdykuICBJIG5ldmVyIGV2ZW4gc2F3IGFueSBleGNoYW5nZSB3aGVy
ZSB5b3UKZXZlbiBhc2sgWGFpbyBhYm91dCB0aGUgY29ycnVwdGlvbiwgY2F1c2VkIGJ5IGhpcyBy
YWlkMTAgZGlzY2FyZApjaGFuZ2VzLCB0aGF0IGtpY2tlZCBvZmYgeW91ciBjYXNjYWRlIG9mIHJl
dmVydHMuCgpUaGF0IG1heSBoYXZlIGhhcHBlbmVkIGFuZCBJIGp1c3QgbWlzc2VkIGl0LiAgQnV0
IGlmIGl0IGRpZG4ndCBoYXBwZW46CndoeSBub3Q/CgpNaWtlCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

