Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3671D20C8E8
	for <lists+dm-devel@lfdr.de>; Sun, 28 Jun 2020 18:10:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593360613;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z6bSTdXbMPfAGH2tTPYzVJYUftUOZTsxzo/T/4Z1VQA=;
	b=ZYXFStZhz5nfBJdJJceHgsbeBccITU4Po1cObNobjX9VGB92FLYa9w2X+DTSdVGgD8j7B5
	E9yk9MlXHZRFzlx6k/JsoUF6e0CjdmyLI+9AKqmjzobo6FSrXUqug/CIisWCytGCz4VlZN
	BR5jZII/7BEtk5jDtyxa4Sdsf+5E+ZU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-IZaiAew-P1Km8JZiLO_yHQ-1; Sun, 28 Jun 2020 12:10:10 -0400
X-MC-Unique: IZaiAew-P1Km8JZiLO_yHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C647F1800D42;
	Sun, 28 Jun 2020 16:09:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5FF2100EBA4;
	Sun, 28 Jun 2020 16:09:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96DFE1809547;
	Sun, 28 Jun 2020 16:09:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05SG9RYd030221 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 28 Jun 2020 12:09:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BFC257C1E0; Sun, 28 Jun 2020 16:09:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C70617C201;
	Sun, 28 Jun 2020 16:09:24 +0000 (UTC)
Date: Sun, 28 Jun 2020 11:08:04 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: yangerkun <yangerkun@huawei.com>
Message-ID: <20200628150804.GA8779@redhat.com>
References: <1592601039-3868-1-git-send-email-bgurney@redhat.com>
	<ab1e38c7-0394-a685-a406-2ead0291f4d5@huawei.com>
MIME-Version: 1.0
In-Reply-To: <ab1e38c7-0394-a685-a406-2ead0291f4d5@huawei.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, agk@redhat.com, Bryan Gurney <bgurney@redhat.com>
Subject: Re: [dm-devel] [PATCH v4 1/4] dm dust: report some message results
 back to user directly
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

SXQgaXMgb24gdGhlIGRtLWRldmVsIHBhdGNod29yayBsaXN0IHRvIHBpY2sgdXAgZm9yIHRoZSA1
LjkgbWVyZ2UKd2luZG93LiAgSSd2ZSBqdXN0IGJlZW4gYnVzeSB3aXRoIG90aGVyIHdvcmsuCgpU
aGFua3MsCk1pa2UKCk9uIFNhdCwgSnVuIDI3IDIwMjAgYXQgIDk6MDhwbSAtMDQwMCwKeWFuZ2Vy
a3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4gd3JvdGU6Cgo+IEhpIE1pa2UsIGRvZXMgdGhlcmUg
YW55IGFkdmljZSBmb3IgdGhpcyBwYXRjaHNldD8KPiAKPiBUaGFua3MsCj4gS3VuLgo+IAo+IOWc
qCAyMDIwLzYvMjAgNToxMCwgQnJ5YW4gR3VybmV5IOWGmemBkzoKPiA+RnJvbTogeWFuZ2Vya3Vu
IDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiA+Cj4gPkZyb206IHlhbmdlcmt1biA8eWFuZ2Vya3Vu
QGh1YXdlaS5jb20+Cj4gPgo+ID5Tb21lIHR5cGUgb2YgbWVzc2FnZShxdWVyeWJsb2NrL2NvdW50
YmFkYmxvY2tzL3JlbW92ZWJhZGJsb2NrKSBtYXkgYmV0dGVyCj4gPnJlcG9ydCByZXN1bHRzIHRv
IHVzZXIgZGlyZWN0bHkuIERvIGl0IHdpdGggRE1FTUlULgo+ID4KPiA+W0JyeWFuOiBtYWludGFp
biBfX2Z1bmNfXyBvdXRwdXQgaW4gRE1FTUlUIG1lc3NhZ2VzXQo+ID4KPiA+U2lnbmVkLW9mZi1i
eTogeWFuZ2Vya3VuIDx5YW5nZXJrdW5AaHVhd2VpLmNvbT4KPiA+U2lnbmVkLW9mZi1ieTogQnJ5
YW4gR3VybmV5IDxiZ3VybmV5QHJlZGhhdC5jb20+Cj4gPi0tLQo+ID4gIGRyaXZlcnMvbWQvZG0t
ZHVzdC5jIHwgMzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKPiA+Cj4gPmRpZmYgLS1n
aXQgYS9kcml2ZXJzL21kL2RtLWR1c3QuYyBiL2RyaXZlcnMvbWQvZG0tZHVzdC5jCj4gPmluZGV4
IGZmMDNiOTAwNzJjNS4uZjFmMmRkNmE0ZTg0IDEwMDY0NAo+ID4tLS0gYS9kcml2ZXJzL21kL2Rt
LWR1c3QuYwo+ID4rKysgYi9kcml2ZXJzL21kL2RtLWR1c3QuYwo+ID5AQCAtMTM4LDIwICsxMzgs
MjIgQEAgc3RhdGljIGludCBkdXN0X2FkZF9ibG9jayhzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRkLCB1
bnNpZ25lZCBsb25nIGxvbmcgYmxvY2ssCj4gPiAgCXJldHVybiAwOwo+ID4gIH0KPiA+LXN0YXRp
YyBpbnQgZHVzdF9xdWVyeV9ibG9jayhzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRkLCB1bnNpZ25lZCBs
b25nIGxvbmcgYmxvY2spCj4gPitzdGF0aWMgaW50IGR1c3RfcXVlcnlfYmxvY2soc3RydWN0IGR1
c3RfZGV2aWNlICpkZCwgdW5zaWduZWQgbG9uZyBsb25nIGJsb2NrLCBjaGFyICpyZXN1bHQsCj4g
PisJCQkgICAgdW5zaWduZWQgaW50IG1heGxlbiwgdW5zaWduZWQgaW50ICpzel9wdHIpCj4gPiAg
ewo+ID4gIAlzdHJ1Y3QgYmFkYmxvY2sgKmJibG9jazsKPiA+ICAJdW5zaWduZWQgbG9uZyBmbGFn
czsKPiA+Kwl1bnNpZ25lZCBpbnQgc3ogPSAqc3pfcHRyOwo+ID4gIAlzcGluX2xvY2tfaXJxc2F2
ZSgmZGQtPmR1c3RfbG9jaywgZmxhZ3MpOwo+ID4gIAliYmxvY2sgPSBkdXN0X3JiX3NlYXJjaCgm
ZGQtPmJhZGJsb2NrbGlzdCwgYmxvY2spOwo+ID4gIAlpZiAoYmJsb2NrICE9IE5VTEwpCj4gPi0J
CURNSU5GTygiJXM6IGJsb2NrICVsbHUgZm91bmQgaW4gYmFkYmxvY2tsaXN0IiwgX19mdW5jX18s
IGJsb2NrKTsKPiA+KwkJRE1FTUlUKCIlczogYmxvY2sgJWxsdSBmb3VuZCBpbiBiYWRibG9ja2xp
c3QiLCBfX2Z1bmNfXywgYmxvY2spOwo+ID4gIAllbHNlCj4gPi0JCURNSU5GTygiJXM6IGJsb2Nr
ICVsbHUgbm90IGZvdW5kIGluIGJhZGJsb2NrbGlzdCIsIF9fZnVuY19fLCBibG9jayk7Cj4gPisJ
CURNRU1JVCgiJXM6IGJsb2NrICVsbHUgbm90IGZvdW5kIGluIGJhZGJsb2NrbGlzdCIsIF9fZnVu
Y19fLCBibG9jayk7Cj4gPiAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmRkLT5kdXN0X2xvY2ss
IGZsYWdzKTsKPiA+LQlyZXR1cm4gMDsKPiA+KwlyZXR1cm4gMTsKPiA+ICB9Cj4gPiAgc3RhdGlj
IGludCBfX2R1c3RfbWFwX3JlYWQoc3RydWN0IGR1c3RfZGV2aWNlICpkZCwgc2VjdG9yX3QgdGhp
c2Jsb2NrKQo+ID5AQCAtMjU5LDExICsyNjEsMTMgQEAgc3RhdGljIGJvb2wgX19kdXN0X2NsZWFy
X2JhZGJsb2NrcyhzdHJ1Y3QgcmJfcm9vdCAqdHJlZSwKPiA+ICAJcmV0dXJuIHRydWU7Cj4gPiAg
fQo+ID4tc3RhdGljIGludCBkdXN0X2NsZWFyX2JhZGJsb2NrcyhzdHJ1Y3QgZHVzdF9kZXZpY2Ug
KmRkKQo+ID4rc3RhdGljIGludCBkdXN0X2NsZWFyX2JhZGJsb2NrcyhzdHJ1Y3QgZHVzdF9kZXZp
Y2UgKmRkLCBjaGFyICpyZXN1bHQsIHVuc2lnbmVkIGludCBtYXhsZW4sCj4gPisJCQkJdW5zaWdu
ZWQgaW50ICpzel9wdHIpCj4gPiAgewo+ID4gIAl1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gIAlz
dHJ1Y3QgcmJfcm9vdCBiYWRibG9ja2xpc3Q7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgbG9uZyBiYWRi
bG9ja19jb3VudDsKPiA+Kwl1bnNpZ25lZCBpbnQgc3ogPSAqc3pfcHRyOwo+ID4gIAlzcGluX2xv
Y2tfaXJxc2F2ZSgmZGQtPmR1c3RfbG9jaywgZmxhZ3MpOwo+ID4gIAliYWRibG9ja2xpc3QgPSBk
ZC0+YmFkYmxvY2tsaXN0Owo+ID5AQCAtMjczLDExICsyNzcsMTEgQEAgc3RhdGljIGludCBkdXN0
X2NsZWFyX2JhZGJsb2NrcyhzdHJ1Y3QgZHVzdF9kZXZpY2UgKmRkKQo+ID4gIAlzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZkZC0+ZHVzdF9sb2NrLCBmbGFncyk7Cj4gPiAgCWlmICghX19kdXN0X2Ns
ZWFyX2JhZGJsb2NrcygmYmFkYmxvY2tsaXN0LCBiYWRibG9ja19jb3VudCkpCj4gPi0JCURNSU5G
TygiJXM6IG5vIGJhZGJsb2NrcyBmb3VuZCIsIF9fZnVuY19fKTsKPiA+KwkJRE1FTUlUKCIlczog
bm8gYmFkYmxvY2tzIGZvdW5kIiwgX19mdW5jX18pOwo+ID4gIAllbHNlCj4gPi0JCURNSU5GTygi
JXM6IGJhZGJsb2NrcyBjbGVhcmVkIiwgX19mdW5jX18pOwo+ID4rCQlETUVNSVQoIiVzOiBiYWRi
bG9ja3MgY2xlYXJlZCIsIF9fZnVuY19fKTsKPiA+LQlyZXR1cm4gMDsKPiA+KwlyZXR1cm4gMTsK
PiA+ICB9Cj4gPiAgLyoKPiA+QEAgLTM4Myw3ICszODcsNyBAQCBzdGF0aWMgdm9pZCBkdXN0X2R0
cihzdHJ1Y3QgZG1fdGFyZ2V0ICp0aSkKPiA+ICB9Cj4gPiAgc3RhdGljIGludCBkdXN0X21lc3Nh
Z2Uoc3RydWN0IGRtX3RhcmdldCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBjaGFyICoqYXJndiwK
PiA+LQkJCWNoYXIgKnJlc3VsdF9idWYsIHVuc2lnbmVkIGludCBtYXhsZW4pCj4gPisJCQljaGFy
ICpyZXN1bHQsIHVuc2lnbmVkIGludCBtYXhsZW4pCj4gPiAgewo+ID4gIAlzdHJ1Y3QgZHVzdF9k
ZXZpY2UgKmRkID0gdGktPnByaXZhdGU7Cj4gPiAgCXNlY3Rvcl90IHNpemUgPSBpX3NpemVfcmVh
ZChkZC0+ZGV2LT5iZGV2LT5iZF9pbm9kZSkgPj4gU0VDVE9SX1NISUZUOwo+ID5AQCAtMzkzLDYg
KzM5Nyw3IEBAIHN0YXRpYyBpbnQgZHVzdF9tZXNzYWdlKHN0cnVjdCBkbV90YXJnZXQgKnRpLCB1
bnNpZ25lZCBpbnQgYXJnYywgY2hhciAqKmFyZ3YsCj4gPiAgCXVuc2lnbmVkIGNoYXIgd3JfZmFp
bF9jbnQ7Cj4gPiAgCXVuc2lnbmVkIGludCB0bXBfdWk7Cj4gPiAgCXVuc2lnbmVkIGxvbmcgZmxh
Z3M7Cj4gPisJdW5zaWduZWQgaW50IHN6ID0gMDsKPiA+ICAJY2hhciBkdW1teTsKPiA+ICAJaWYg
KGFyZ2MgPT0gMSkgewo+ID5AQCAtNDEwLDEyICs0MTUsMTIgQEAgc3RhdGljIGludCBkdXN0X21l
c3NhZ2Uoc3RydWN0IGRtX3RhcmdldCAqdGksIHVuc2lnbmVkIGludCBhcmdjLCBjaGFyICoqYXJn
diwKPiA+ICAJCQlyID0gMDsKPiA+ICAJCX0gZWxzZSBpZiAoIXN0cmNhc2VjbXAoYXJndlswXSwg
ImNvdW50YmFkYmxvY2tzIikpIHsKPiA+ICAJCQlzcGluX2xvY2tfaXJxc2F2ZSgmZGQtPmR1c3Rf
bG9jaywgZmxhZ3MpOwo+ID4tCQkJRE1JTkZPKCJjb3VudGJhZGJsb2NrczogJWxsdSBiYWRibG9j
ayhzKSBmb3VuZCIsCj4gPisJCQlETUVNSVQoImNvdW50YmFkYmxvY2tzOiAlbGx1IGJhZGJsb2Nr
KHMpIGZvdW5kIiwKPiA+ICAJCQkgICAgICAgZGQtPmJhZGJsb2NrX2NvdW50KTsKPiA+ICAJCQlz
cGluX3VubG9ja19pcnFyZXN0b3JlKCZkZC0+ZHVzdF9sb2NrLCBmbGFncyk7Cj4gPi0JCQlyID0g
MDsKPiA+KwkJCXIgPSAxOwo+ID4gIAkJfSBlbHNlIGlmICghc3RyY2FzZWNtcChhcmd2WzBdLCAi
Y2xlYXJiYWRibG9ja3MiKSkgewo+ID4tCQkJciA9IGR1c3RfY2xlYXJfYmFkYmxvY2tzKGRkKTsK
PiA+KwkJCXIgPSBkdXN0X2NsZWFyX2JhZGJsb2NrcyhkZCwgcmVzdWx0LCBtYXhsZW4sICZzeik7
Cj4gPiAgCQl9IGVsc2UgaWYgKCFzdHJjYXNlY21wKGFyZ3ZbMF0sICJxdWlldCIpKSB7Cj4gPiAg
CQkJaWYgKCFkZC0+cXVpZXRfbW9kZSkKPiA+ICAJCQkJZGQtPnF1aWV0X21vZGUgPSB0cnVlOwo+
ID5AQCAtNDQxLDcgKzQ0Niw3IEBAIHN0YXRpYyBpbnQgZHVzdF9tZXNzYWdlKHN0cnVjdCBkbV90
YXJnZXQgKnRpLCB1bnNpZ25lZCBpbnQgYXJnYywgY2hhciAqKmFyZ3YsCj4gPiAgCQllbHNlIGlm
ICghc3RyY2FzZWNtcChhcmd2WzBdLCAicmVtb3ZlYmFkYmxvY2siKSkKPiA+ICAJCQlyID0gZHVz
dF9yZW1vdmVfYmxvY2soZGQsIGJsb2NrKTsKPiA+ICAJCWVsc2UgaWYgKCFzdHJjYXNlY21wKGFy
Z3ZbMF0sICJxdWVyeWJsb2NrIikpCj4gPi0JCQlyID0gZHVzdF9xdWVyeV9ibG9jayhkZCwgYmxv
Y2spOwo+ID4rCQkJciA9IGR1c3RfcXVlcnlfYmxvY2soZGQsIGJsb2NrLCByZXN1bHQsIG1heGxl
biwgJnN6KTsKPiA+ICAJCWVsc2UKPiA+ICAJCQlpbnZhbGlkX21zZyA9IHRydWU7Cj4gPgo+IAoK
LS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cu
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

