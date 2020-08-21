Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EDDA124D65B
	for <lists+dm-devel@lfdr.de>; Fri, 21 Aug 2020 15:45:24 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-Wa4neoWWMvGZ4Qlu4keZtA-1; Fri, 21 Aug 2020 09:45:21 -0400
X-MC-Unique: Wa4neoWWMvGZ4Qlu4keZtA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1BF27101EC42;
	Fri, 21 Aug 2020 13:45:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C015105509F;
	Fri, 21 Aug 2020 13:45:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id ABF19662B0;
	Fri, 21 Aug 2020 13:44:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07LDgA2b001500 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 21 Aug 2020 09:42:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E16F9F6414; Fri, 21 Aug 2020 13:42:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7030F640F
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:42:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64BFD8007DC
	for <dm-devel@redhat.com>; Fri, 21 Aug 2020 13:42:07 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-474-WzJxSz_bPeaZXd6cRRG5OA-1;
	Fri, 21 Aug 2020 09:42:05 -0400
X-MC-Unique: WzJxSz_bPeaZXd6cRRG5OA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 89BF1ACB8;
	Fri, 21 Aug 2020 13:42:31 +0000 (UTC)
Message-ID: <5b382b169a8c499acfc523adb81681fe941d743a.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: Zhiqiang Liu <liuzhiqiang26@huawei.com>, Benjamin Marzinski
	<bmarzins@redhat.com>, Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Zdenek Kabelac <zkabelac@redhat.com>
Date: Fri, 21 Aug 2020 15:42:02 +0200
In-Reply-To: <b2c96dc6-1e01-beb2-0ccb-22e1d0d980a6@huawei.com>
References: <52b3b834-6da6-99c1-a2d1-95c2387c47e3@huawei.com>
	<b2c96dc6-1e01-beb2-0ccb-22e1d0d980a6@huawei.com>
User-Agent: Evolution 3.36.5
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07LDgA2b001500
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>, Yanxiaodan <yanxiaodan@huawei.com>,
	dm-devel@redhat.com, lixiaokeng <lixiaokeng@huawei.com>
Subject: Re: [dm-devel] [PATCH V2 1/5] multipathd: adopt static char* arr in
 daemon_status
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCAyMDIwLTA4LTIxIGF0IDE4OjU4ICswODAwLCBaaGlxaWFuZyBMaXUgd3JvdGU6Cj4g
V2UgYWRvcHQgc3RhdGljIGNoYXIqIGFycmF5IChkZW1vbl9zdGF0dXNfbXNnKSBpbiBkYWVtb25f
c3RhdHVzIGZ1bmMsCj4gc28gaXQgbG9va3MgbW9yZSBzaW1wbGVyIGFuZCBlYXNpZXIgdG8gZXhw
YW5kLgo+IAo+IFYxLT5WMjoKPiAtIHVzZSAiaW50IiBhcyB0aGUgdHlwZSBvZiAic3RhdHVzIiAo
c3VnZ2VzdGVkIGJ5IE1hcnRpbikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBaaGlxaWFuZyBMaXUgPGxp
dXpoaXFpYW5nMjZAaHVhd2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBsaXhpYW9rZW5nIDxsaXhp
YW9rZW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIG11bHRpcGF0aGQvbWFpbi5jIHwgMzAgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIG11bHRpcGF0aGQvbWFpbi5oIHwgIDMgKystCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL211bHRpcGF0aGQvbWFpbi5jIGIvbXVsdGlwYXRoZC9tYWluLmMKPiBpbmRl
eCA5ZWM2NTg1Ni4uNjJjZjRmZjQgMTAwNjQ0Cj4gLS0tIGEvbXVsdGlwYXRoZC9tYWluLmMKPiAr
KysgYi9tdWx0aXBhdGhkL21haW4uYwo+IGRpZmYgLS1naXQgYS9tdWx0aXBhdGhkL21haW4uaCBi
L211bHRpcGF0aGQvbWFpbi5oCj4gaW5kZXggNWRmZjE3ZTUuLjZhNTU5MmMwIDEwMDY0NAo+IC0t
LSBhL211bHRpcGF0aGQvbWFpbi5oCj4gKysrIGIvbXVsdGlwYXRoZC9tYWluLmgKPiBAQCAtNCwx
MiArNCwxMyBAQAo+ICAjZGVmaW5lIE1BUEdDSU5UIDUKPiAKPiAgZW51bSBkYWVtb25fc3RhdHVz
IHsKPiAtCURBRU1PTl9JTklULAo+ICsJREFFTU9OX0lOSVQgPSAwLAo+ICAJREFFTU9OX1NUQVJU
LAo+ICAJREFFTU9OX0NPTkZJR1VSRSwKPiAgCURBRU1PTl9JRExFLAo+ICAJREFFTU9OX1JVTk5J
TkcsCj4gIAlEQUVNT05fU0hVVERPV04sCj4gKwlEQUVNT05fU1RBVFVTX1NJWkUsCj4gIH07CgpU
aGlzIGJyZWFrcyBjb21waWxhdGlvbjoKCm1haW4uYzogSW4gZnVuY3Rpb24g4oCYc2Rfbm90aWZ5
X3N0YXR1c+KAmToKbWFpbi5jOjE4NDoyOiBlcnJvcjogZW51bWVyYXRpb24gdmFsdWUg4oCYREFF
TU9OX1NUQVRVU19TSVpF4oCZIG5vdCBoYW5kbGVkCmluIHN3aXRjaCBbLVdlcnJvcj1zd2l0Y2hd
CiAgc3dpdGNoIChzdGF0ZSkgewogIF5+fn5+fgoKUGxlYXNlIGF2b2lkIGludHJvZHVjaW5nIERB
RU1PTl9TVEFUVVNfU0laRS4KClRoaXMgd291bGQgYmUgZml4ZWQgYnkgeW91ciBwYXRjaCAyIGJl
Y2F1c2UgaXQgcmVtb3ZlcyB0aGUgc3dpdGNoCnN0YXRlbWVudCwgYnV0IG5vIHBhdGNoIGluIGEg
c2VyaWVzIHNob3VsZCBicmVhayBjb21waWxhdGlvbiwgdG8gCmFsbG93IGZ1dHVyZSBiaXNlY3Rp
b25zLgoKSSBoYXZlIHRvIHdpdGhkcmF3IG15ICJSZXZpZXdlZC1ieTogZm9yIHRoZSB0aW1lIGJl
aW5nLCBzb3JyeS4KCk1hcnRpbgoKCj4gCj4gIHN0cnVjdCBwcm91dF9wYXJhbV9kZXNjcmlwdG9y
OwoKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczov
L3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

