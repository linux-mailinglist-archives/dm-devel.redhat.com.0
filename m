Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 27C67243CC0
	for <lists+dm-devel@lfdr.de>; Thu, 13 Aug 2020 17:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597333459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dIw+gCudtn+D8hB5mYY24MbnBppjhp6pKB37Hy6VxqU=;
	b=GjNu3OMlHXy38/+5ikkxmsTqFAdkWqEJLaCB/myn7eykqqco+rn6cuHMqRAqGRto5Ip2uB
	uMyX0WgKuXMlbQgOlUiki6gIZbfuojXf4D/7mXpSgY74bPc6sYA1NDnRmTUQZTYAdXPCrP
	2GP8erXerYDxtrtUJ7K28KLEd/MDDpc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-7kPU5DDxMO2cXnDa8eJcLA-1; Thu, 13 Aug 2020 11:44:16 -0400
X-MC-Unique: 7kPU5DDxMO2cXnDa8eJcLA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B72201005504;
	Thu, 13 Aug 2020 15:44:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E7C16198B;
	Thu, 13 Aug 2020 15:44:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BC624EE16;
	Thu, 13 Aug 2020 15:43:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07DFhO3q028710 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 Aug 2020 11:43:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 72F7B54596; Thu, 13 Aug 2020 15:43:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54E446FDAF;
	Thu, 13 Aug 2020 15:43:21 +0000 (UTC)
Date: Thu, 13 Aug 2020 11:43:20 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: "Meneghini, John" <John.Meneghini@netapp.com>
Message-ID: <20200813154320.GA5707@redhat.com>
References: <20200806191943.GA27868@redhat.com>
	<6B826235-C504-4621-B8F7-34475B200979@netapp.com>
	<20200807000755.GA28957@redhat.com>
	<510f5aff-0437-b1ce-f7ab-c812edbea880@grimberg.me>
	<20200807045015.GA29737@redhat.com>
	<fec745aa-0091-ee1f-cb0f-da9e18cf0aa2@grimberg.me>
	<20200810143620.GA19127@redhat.com>
	<20200810172209.GA19535@redhat.com>
	<20200813144811.GA5452@redhat.com>
	<A90B4EF6-354C-4735-9E5A-45BF27F520E2@netapp.com>
MIME-Version: 1.0
In-Reply-To: <A90B4EF6-354C-4735-9E5A-45BF27F520E2@netapp.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, Ewan Milne <emilne@redhat.com>,
	Christoph Hellwig <hch@infradead.org>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>,
	"linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
	Chao Leng <lengchao@huawei.com>, Keith Busch <kbusch@kernel.org>
Subject: Re: [dm-devel] [RESEND PATCH] nvme: explicitly use normal NVMe
 error handling when appropriate
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

TWF5YmUgYmVjYXVzZSBJIGRpZG4ndCBjYyBsaW51eC1ibG9jaz8KT25seSB3YXkgdGhhdCBJIGtu
b3cgdG8gInVwbG9hZCB0aGlzIHBhdGNoIHRoZXJlIiBpcyB0byBoYXZlIGNjJ2QKbGludXgtYmxv
Y2suCgpCdXQgdGhlIHBhdGNoIGlzIGluIGRtLWRldmVsJ3MgcGF0Y2h3b3JrIGhlcmU6Cmh0dHBz
Oi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTE3MTI1NjMvCgpJcyB0aGF0IHN1ZmZpY2ll
bnQgZm9yIHlvdXIgbmVlZHM/CgpUaGFua3MsCk1pa2UKCk9uIFRodSwgQXVnIDEzIDIwMjAgYXQg
MTE6MjlhbSAtMDQwMCwKTWVuZWdoaW5pLCBKb2huIDxKb2huLk1lbmVnaGluaUBuZXRhcHAuY29t
PiB3cm90ZToKCj4gTWlrZSwgCj4gCj4gSSBkb24ndCBzZWUgeW91ciBwYXRjaCBhdDoKPiAKPiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtYmxvY2svbGlzdC8/c3Vi
bWl0dGVyPTE2NDMKPiAKPiBDYW4geW91IHBsZWFzZSB1cGxvYWQgdGhpcyBwYXRjaCB0aGVyZT8K
PiAKPiBUaGFua3MsCj4gCj4gL0pvaG4KPiAKPiDvu79PbiA4LzEzLzIwLCAxMDo0OCBBTSwgIk1p
a2UgU25pdHplciIgPHNuaXR6ZXJAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gCj4gICAgIENvbW1pdCA3
NjRlOTMzMjA5OGMwICgibnZtZS1tdWx0aXBhdGg6IGRvIG5vdCByZXNldCBvbiB1bmtub3duCj4g
ICAgIHN0YXR1cyIpLCBhbW9uZyBvdGhlciB0aGluZ3MsIGZpeGVkIE5WTUVfU0NfQ01EX0lOVEVS
UlVQVEVEIGVycm9yCj4gICAgIGhhbmRsaW5nIGJ5IGNoYW5naW5nIG11bHRpcGF0aGluZydzIG52
bWVfZmFpbG92ZXJfcmVxKCkgdG8gc2hvcnQtY2lyY3VpdAo+ICAgICBwYXRoIGZhaWxvdmVyIGFu
ZCB0aGVuIGZhbGxiYWNrIHRvIE5WTWUncyBub3JtYWwgZXJyb3IgaGFuZGxpbmcgKHdoaWNoCj4g
ICAgIHRha2VzIGNhcmUgb2YgTlZNRV9TQ19DTURfSU5URVJSVVBURUQpLgo+IAo+ICAgICBUaGlz
IGRldG91ciB0aHJvdWdoIG5hdGl2ZSBOVk1lIG11bHRpcGF0aGluZyBjb2RlIGlzIHVud2VsY29t
ZSBiZWNhdXNlCj4gICAgIGl0IHByZXZlbnRzIE5WTWUgY29yZSBmcm9tIGhhbmRsaW5nIE5WTUVf
U0NfQ01EX0lOVEVSUlVQVEVEIGluZGVwZW5kZW50Cj4gICAgIG9mIGFueSBtdWx0aXBhdGhpbmcg
Y29uY2VybnMuCj4gCj4gICAgIEludHJvZHVjZSBudm1lX3N0YXR1c19uZWVkc19sb2NhbF9lcnJv
cl9oYW5kbGluZygpIHRvIHByaW9yaXRpemUKPiAgICAgbm9uLWZhaWxvdmVyIHJldHJ5LCB3aGVu
IGFwcHJvcHJpYXRlLCBpbiB0ZXJtcyBvZiBub3JtYWwgTlZNZSBlcnJvcgo+ICAgICBoYW5kbGlu
Zy4gIG52bWVfc3RhdHVzX25lZWRzX2xvY2FsX2Vycm9yX2hhbmRsaW5nKCkgd2lsbCBuYXR1cmVs
eSBldm9sdmUKPiAgICAgdG8gaW5jbHVkZSBoYW5kbGluZyBvZiBhbnkgb3RoZXIgZXJyb3JzIHRo
YXQgbm9ybWFsIGVycm9yIGhhbmRsaW5nIG11c3QKPiAgICAgYmUgdXNlZCBmb3IuCj4gCj4gICAg
IG52bWVfZmFpbG92ZXJfcmVxKCkncyBhYmlsaXR5IHRvIGZhbGxiYWNrIHRvIG5vcm1hbCBOVk1l
IGVycm9yIGhhbmRsaW5nCj4gICAgIGhhcyBiZWVuIHByZXNlcnZlZCBiZWNhdXNlIGl0IG1heSBi
ZSB1c2VmdWwgZm9yIGZ1dHVyZSBOVk1FX1NDIHRoYXQKPiAgICAgbnZtZV9zdGF0dXNfbmVlZHNf
bG9jYWxfZXJyb3JfaGFuZGxpbmcoKSBoYXNuJ3QgYmVlbiB0cmFpbmVkIGZvciB5ZXQuCj4gCj4g
ICAgIFNpZ25lZC1vZmYtYnk6IE1pa2UgU25pdHplciA8c25pdHplckByZWRoYXQuY29tPgo+ICAg
ICAtLS0KPiAgICAgIGRyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYyB8IDE2ICsrKysrKysrKysrKysr
LS0KPiAgICAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQo+IAo+ICAgICBkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jIGIvZHJpdmVy
cy9udm1lL2hvc3QvY29yZS5jCj4gICAgIGluZGV4IDg4Y2ZmMzA5ZDhlNC4uYmU3NDliNjkwYWY3
IDEwMDY0NAo+ICAgICAtLS0gYS9kcml2ZXJzL252bWUvaG9zdC9jb3JlLmMKPiAgICAgKysrIGIv
ZHJpdmVycy9udm1lL2hvc3QvY29yZS5jCj4gICAgIEBAIC0yNTIsNiArMjUyLDE2IEBAIHN0YXRp
YyBpbmxpbmUgYm9vbCBudm1lX3JlcV9uZWVkc19yZXRyeShzdHJ1Y3QgcmVxdWVzdCAqcmVxKQo+
ICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAgICAgfQo+IAo+ICAgICArc3RhdGljIGlubGlu
ZSBib29sIG52bWVfc3RhdHVzX25lZWRzX2xvY2FsX2Vycm9yX2hhbmRsaW5nKHUxNiBzdGF0dXMp
Cj4gICAgICt7Cj4gICAgICsgICAgICAgc3dpdGNoIChzdGF0dXMgJiAweDdmZikgewo+ICAgICAr
ICAgICAgIGNhc2UgTlZNRV9TQ19DTURfSU5URVJSVVBURUQ6Cj4gICAgICsgICAgICAgICAgICAg
ICByZXR1cm4gdHJ1ZTsKPiAgICAgKyAgICAgICBkZWZhdWx0Ogo+ICAgICArICAgICAgICAgICAg
ICAgcmV0dXJuIGZhbHNlOwo+ICAgICArICAgICAgIH0KPiAgICAgK30KPiAgICAgKwo+ICAgICAg
c3RhdGljIHZvaWQgbnZtZV9yZXRyeV9yZXEoc3RydWN0IHJlcXVlc3QgKnJlcSkKPiAgICAgIHsK
PiAgICAgICAgICAgICBzdHJ1Y3QgbnZtZV9ucyAqbnMgPSByZXEtPnEtPnF1ZXVlZGF0YTsKPiAg
ICAgQEAgLTI3MCw3ICsyODAsOCBAQCBzdGF0aWMgdm9pZCBudm1lX3JldHJ5X3JlcShzdHJ1Y3Qg
cmVxdWVzdCAqcmVxKQo+IAo+ICAgICAgdm9pZCBudm1lX2NvbXBsZXRlX3JxKHN0cnVjdCByZXF1
ZXN0ICpyZXEpCj4gICAgICB7Cj4gICAgIC0gICAgICAgYmxrX3N0YXR1c190IHN0YXR1cyA9IG52
bWVfZXJyb3Jfc3RhdHVzKG52bWVfcmVxKHJlcSktPnN0YXR1cyk7Cj4gICAgICsgICAgICAgdTE2
IG52bWVfc3RhdHVzID0gbnZtZV9yZXEocmVxKS0+c3RhdHVzOwo+ICAgICArICAgICAgIGJsa19z
dGF0dXNfdCBzdGF0dXMgPSBudm1lX2Vycm9yX3N0YXR1cyhudm1lX3N0YXR1cyk7Cj4gCj4gICAg
ICAgICAgICAgdHJhY2VfbnZtZV9jb21wbGV0ZV9ycShyZXEpOwo+IAo+ICAgICBAQCAtMjgwLDcg
KzI5MSw4IEBAIHZvaWQgbnZtZV9jb21wbGV0ZV9ycShzdHJ1Y3QgcmVxdWVzdCAqcmVxKQo+ICAg
ICAgICAgICAgICAgICAgICAgbnZtZV9yZXEocmVxKS0+Y3RybC0+Y29tcF9zZWVuID0gdHJ1ZTsK
PiAKPiAgICAgICAgICAgICBpZiAodW5saWtlbHkoc3RhdHVzICE9IEJMS19TVFNfT0sgJiYgbnZt
ZV9yZXFfbmVlZHNfcmV0cnkocmVxKSkpIHsKPiAgICAgLSAgICAgICAgICAgICAgIGlmICgocmVx
LT5jbWRfZmxhZ3MgJiBSRVFfTlZNRV9NUEFUSCkgJiYgbnZtZV9mYWlsb3Zlcl9yZXEocmVxKSkK
PiAgICAgKyAgICAgICAgICAgICAgIGlmICghbnZtZV9zdGF0dXNfbmVlZHNfbG9jYWxfZXJyb3Jf
aGFuZGxpbmcobnZtZV9zdGF0dXMpICYmCj4gICAgICsgICAgICAgICAgICAgICAgICAgKHJlcS0+
Y21kX2ZsYWdzICYgUkVRX05WTUVfTVBBVEgpICYmIG52bWVfZmFpbG92ZXJfcmVxKHJlcSkpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAKPiAgICAgICAgICAgICAgICAg
ICAgIGlmICghYmxrX3F1ZXVlX2R5aW5nKHJlcS0+cSkpIHsKPiAgICAgLS0KPiAgICAgMi4xOC4w
Cj4gCj4gCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRw
czovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

