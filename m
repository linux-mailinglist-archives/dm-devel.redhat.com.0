Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 598D91A08BA
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 09:54:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586246087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=cRY0qe9Dy+rjwemcWyaldMz75/bhOiSG/o4nYp+slC0=;
	b=bJsV/bTrvvDRUI2uU0rhVNCUffLshxyYHwQLSr9bPzH3xgzTXaoayMvNsv6lqrPNczw4I6
	jIy+45H0iGqpzpthyN7gT2mjMyJOpXf5dCHRuctpPIIE68rvDEW3HrsBdJJ8/4zFbI9aZ2
	C7dMuSNvmy8av1Nrsjix2rE2TgcHzvk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-K_2c-NNTO_yJ-FVMSsCrpA-1; Tue, 07 Apr 2020 03:54:45 -0400
X-MC-Unique: K_2c-NNTO_yJ-FVMSsCrpA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D00C19057A0;
	Tue,  7 Apr 2020 07:54:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C68860BE1;
	Tue,  7 Apr 2020 07:54:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2367918089C8;
	Tue,  7 Apr 2020 07:54:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0377r3nP019413 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 03:53:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6557C2026D69; Tue,  7 Apr 2020 07:53:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 61907201828A
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 07:53:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 160D9101A55D
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 07:53:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-190-CBrsBZLbO9uyo5lKhdgvGQ-1;
	Tue, 07 Apr 2020 03:52:58 -0400
X-MC-Unique: CBrsBZLbO9uyo5lKhdgvGQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 47A27AC84;
	Tue,  7 Apr 2020 07:52:56 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200406143505.133271-1-hare@suse.de>
	<20200406143505.133271-2-hare@suse.de>
	<BY5PR04MB6900F60FCE7FB016A67370F8E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <b1954a00-74ca-1d1f-5a66-b7bbfaeff2fb@suse.de>
Date: Tue, 7 Apr 2020 09:52:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900F60FCE7FB016A67370F8E7C30@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0377r3nP019413
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/11] dm-zoned: store zone id within the
	zone structure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNC83LzIwIDM6NDcgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDIwMjAvMDQvMDcg
MjoyNiwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBJbnN0ZWFkIG9mIGNhbGN1bGF0aW5nIHRo
ZSB6b25lIGluZGV4IGJ5IHRoZSBvZmZzZXQgd2l0aGluIHRoZQo+PiB6b25lIGFycmF5IHN0b3Jl
IHRoZSBpbmRleCB3aXRoaW4gdGhlIHN0cnVjdHVyZSBpdHNlbGYuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+PiAtLS0KPj4gICBkcml2ZXJzL21k
L2RtLXpvbmVkLW1ldGFkYXRhLmMgfCAzICsrLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQuaCAg
ICAgICAgICB8IDMgKysrCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRh
dGEuYyBiL2RyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYwo+PiBpbmRleCBjODc4NzU2MGZh
OWYuLmFmY2U1OTQwNjdmYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9tZC9kbS16b25lZC1tZXRh
ZGF0YS5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYwo+PiBAQCAtMTg5
LDcgKzE4OSw3IEBAIHN0cnVjdCBkbXpfbWV0YWRhdGEgewo+PiAgICAqLwo+PiAgIHVuc2lnbmVk
IGludCBkbXpfaWQoc3RydWN0IGRtel9tZXRhZGF0YSAqem1kLCBzdHJ1Y3QgZG1fem9uZSAqem9u
ZSkKPj4gICB7Cj4+IC0JcmV0dXJuICgodW5zaWduZWQgaW50KSh6b25lIC0gem1kLT56b25lcykp
Owo+PiArCXJldHVybiB6b25lLT5pZDsKPiAKPiBUaGUgem1kIGFyZ3VtZW50IGlzIG5vdyB1bnVz
ZWQsIGFuZCB0aGUgaGVscGVyIGRvZXMgbm90IG1ha2UgbXVjaCBzZW5zZSBhbnltb3JlLgo+IFdo
eSBub3QganVzdCBkcm9wIGl0IGVudGlyZWx5ID8gQ2FsbGVycyBkaXJlY3RseSByZWZlcmVuY2lu
ZyB0aGUgLT5pZCBmaWVsZCBvZiBhCj4gem9uZSBpcyBzaW1wbGUgYW5kIGNsZWFyLgo+IAo+PiAg
IH0KPj4gICAKPj4gICBzZWN0b3JfdCBkbXpfc3RhcnRfc2VjdChzdHJ1Y3QgZG16X21ldGFkYXRh
ICp6bWQsIHN0cnVjdCBkbV96b25lICp6b25lKQo+PiBAQCAtMTExOSw2ICsxMTE5LDcgQEAgc3Rh
dGljIGludCBkbXpfaW5pdF96b25lKHN0cnVjdCBibGtfem9uZSAqYmxreiwgdW5zaWduZWQgaW50
IGlkeCwgdm9pZCAqZGF0YSkKPj4gICAKPj4gICAJSU5JVF9MSVNUX0hFQUQoJnpvbmUtPmxpbmsp
Owo+PiAgIAlhdG9taWNfc2V0KCZ6b25lLT5yZWZjb3VudCwgMCk7Cj4+ICsJem9uZS0+aWQgPSBp
ZHg7Cj4+ICAgCXpvbmUtPmNodW5rID0gRE1aX01BUF9VTk1BUFBFRDsKPj4gICAKPj4gICAJc3dp
dGNoIChibGt6LT50eXBlKSB7Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXpvbmVkLmgg
Yi9kcml2ZXJzL21kL2RtLXpvbmVkLmgKPj4gaW5kZXggODg0YzBlNTg2MDgyLi4zOWQ1OTg5OGFi
YmUgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbWQvZG0tem9uZWQuaAo+PiArKysgYi9kcml2ZXJz
L21kL2RtLXpvbmVkLmgKPj4gQEAgLTg3LDYgKzg3LDkgQEAgc3RydWN0IGRtX3pvbmUgewo+PiAg
IAkvKiBab25lIGFjdGl2YXRpb24gcmVmZXJlbmNlIGNvdW50ICovCj4+ICAgCWF0b21pY190CQly
ZWZjb3VudDsKPj4gICAKPj4gKwkvKiBab25lIGlkICovCj4+ICsJdW5zaWduZWQgaW50CQlpZDsK
Pj4gKwo+PiAgIAkvKiBab25lIHdyaXRlIHBvaW50ZXIgYmxvY2sgKHJlbGF0aXZlIHRvIHRoZSB6
b25lIHN0YXJ0IGJsb2NrKSAqLwo+PiAgIAl1bnNpZ25lZCBpbnQJCXdwX2Jsb2NrOwo+PiAgIAo+
Pgo+IAo+IApJbmRlZWQsIHlvdSBhcmUgcmlnaHQuIFdpbGwgYmUgZG9pbmcgc28gZm9yIHRoZSBu
ZXh0IHJvdW5kLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAg
ICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFH
IE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpk
bS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

