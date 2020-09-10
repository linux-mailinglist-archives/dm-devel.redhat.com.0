Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 25FF5264DC0
	for <lists+dm-devel@lfdr.de>; Thu, 10 Sep 2020 20:50:41 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-S0mi8btpMNiTyuZcXCxGnw-1; Thu, 10 Sep 2020 14:50:37 -0400
X-MC-Unique: S0mi8btpMNiTyuZcXCxGnw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F3671017DC5;
	Thu, 10 Sep 2020 18:50:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3707119C78;
	Thu, 10 Sep 2020 18:50:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1D068183D021;
	Thu, 10 Sep 2020 18:50:26 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08AImOiH019114 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 10 Sep 2020 14:48:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 352A310D17BF; Thu, 10 Sep 2020 18:48:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F4D510EE6C0
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:48:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7E70801226
	for <dm-devel@redhat.com>; Thu, 10 Sep 2020 18:48:19 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-124-9LdXZ8UuOACOrByoWM_fUg-1;
	Thu, 10 Sep 2020 14:48:16 -0400
X-MC-Unique: 9LdXZ8UuOACOrByoWM_fUg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 91C3BACC2;
	Thu, 10 Sep 2020 18:48:30 +0000 (UTC)
Message-ID: <8ecf7f972b83be7fba3797327046c7cedf1179c8.camel@suse.com>
From: Martin Wilck <mwilck@suse.com>
To: lixiaokeng <lixiaokeng@huawei.com>, Christophe Varoqui
	<christophe.varoqui@opensvc.com>, Benjamin Marzinski <bmarzins@redhat.com>,
	dm-devel mailing list <dm-devel@redhat.com>
Date: Thu, 10 Sep 2020 20:48:14 +0200
In-Reply-To: <3f34cd14-17a0-f7a4-6cdb-7a37aa5c31b4@huawei.com>
References: <f8c2133b-6c02-4cc4-59cd-162828154689@huawei.com>
	<3f34cd14-17a0-f7a4-6cdb-7a37aa5c31b4@huawei.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08AImOiH019114
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: Re: [dm-devel] [PATCH V4 11/14] mpathpersist: check whether malloc
 paramp->trnptid_list fails in handle_args func
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCAyMDIwLTA5LTEwIGF0IDE4OjUyICswODAwLCBsaXhpYW9rZW5nIHdyb3RlOgo+IElu
IGhhbmRsZV9hcmdzIGZ1bmMsIHdlIGRvbm90IGNoZWNrIHdoZXRoZXIgbWFsbG9jIHBhcmFtcCBh
bmQKPiBlYWNoIHBhcmFtcC0+dHJucHRpZF9saXN0W2pdIGZhaWxzIGJlZm9yZSB1c2luZyB0aGVt
LCBpdCBtYXkKPiBjYXVzZSBhY2Nlc3MgTlVMTCBwb2ludGVyLgo+IAo+IEhlcmUsIHdlIGFkZCBh
bGxvY19wcm91dF9wYXJhbV9kZXNjcmlwdG9yIHRvIGFsbG9jYXRlIGFuZCBpbml0Cj4gcGFyYW1w
LCBhbmQgd2UgYWRkIGZyZWVfcHJvdXRfcGFyYW1fZGVzY3JpcHRvciB0byBmcmVlIHBhcmFtcAo+
IGFuZCBlYWNoIHBhcmFtcC0+dHJucHRpZF9saXN0W2pdLgo+IAo+IFdlIGNoYW5nZSBudW1fdHJh
bnNwb3J0IHRvIG51bV90cmFuc3BvcnRpZHMgdG8gY29tYmluZSB0aGVtLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFpoaXFpYW5nIExpdSA8bGl1emhpcWlhbmcyNkBodWF3ZWkuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IGxpeGlhb2tlbmcgPGxpeGlhb2tlbmdAaHVhd2VpLmNvbT4KPiAtLS0KPiAgbXBhdGhw
ZXJzaXN0L21haW4uYyB8IDY1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0t
LS0tLS0KPiAtLQo+ICAxIGZpbGUgY2hhbmdlZCwgNTAgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL21wYXRocGVyc2lzdC9tYWluLmMgYi9tcGF0aHBlcnNp
c3QvbWFpbi5jCj4gaW5kZXggMjhiZmU0MTAuLmRhNjdjMTVjIDEwMDY0NAo+IC0tLSBhL21wYXRo
cGVyc2lzdC9tYWluLmMKPiArKysgYi9tcGF0aHBlcnNpc3QvbWFpbi5jCj4gQEAgLTE1Myw2ICsx
NTMsMzggQEAgc3RhdGljIGludCBkb19iYXRjaF9maWxlKGNvbnN0IGNoYXIgKmJhdGNoX2ZuKQo+
ICAJcmV0dXJuIHJldDsKPiAgfQo+IAo+ICtzdGF0aWMgc3RydWN0IHByb3V0X3BhcmFtX2Rlc2Ny
aXB0b3IgKgo+ICthbGxvY19wcm91dF9wYXJhbV9kZXNjcmlwdG9yKGludCBudW1fdHJhbnNwb3J0
aWQpCj4gK3sKPiArCXN0cnVjdCBwcm91dF9wYXJhbV9kZXNjcmlwdG9yICpwYXJhbXA7Cj4gKwo+
ICsJaWYgKG51bV90cmFuc3BvcnRpZCA8IDAgfHwgbnVtX3RyYW5zcG9ydGlkID4gTVBBVEhfTVhf
VElEUykKPiArCQlyZXR1cm4gTlVMTDsKPiArCj4gKwlwYXJhbXA9IG1hbGxvYyhzaXplb2Yoc3Ry
dWN0IHByb3V0X3BhcmFtX2Rlc2NyaXB0b3IpICsKPiArCQkJCShzaXplb2Yoc3RydWN0IHRyYW5z
cG9ydGlkICopICoKPiBudW1fdHJhbnNwb3J0aWQpKTsKPiArCj4gKwlpZiAoIXBhcmFtcCkKPiAr
CQlyZXR1cm4gTlVMTDsKPiArCj4gKwlwYXJhbXAtPm51bV90cmFuc3BvcnRpZCA9IG51bV90cmFu
c3BvcnRpZDsKPiArCW1lbXNldChwYXJhbXAsIDAsIHNpemVvZihzdHJ1Y3QgcHJvdXRfcGFyYW1f
ZGVzY3JpcHRvcikgKwo+ICsJCQkoc2l6ZW9mKHN0cnVjdCB0cmFuc3BvcnRpZCAqKSAqCj4gbnVt
X3RyYW5zcG9ydGlkKSk7Cj4gKwlyZXR1cm4gcGFyYW1wOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9p
ZCBmcmVlX3Byb3V0X3BhcmFtX2Rlc2NyaXB0b3Ioc3RydWN0Cj4gcHJvdXRfcGFyYW1fZGVzY3Jp
cHRvciAqcGFyYW1wKQo+ICt7Cj4gKwlpbnQgaTsKPiArCWlmICghcGFyYW1wKQo+ICsJCXJldHVy
bjsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgcGFyYW1wLT5udW1fdHJhbnNwb3J0aWQ7IGkrKykK
PiArCQlmcmVlKHBhcmFtcC0+dHJucHRpZF9saXN0W2ldKTsKClRoaXMgY2F1c2VzIGEgY29tcGls
YXRpb24gZXJyb3IuIERpZG4ndCB5b3UgY29tcGlsZS10ZXN0PwoKbWFpbi5jOiBJbiBmdW5jdGlv
biDigJhmcmVlX3Byb3V0X3BhcmFtX2Rlc2NyaXB0b3LigJk6Cm1haW4uYzoxODI6MTY6IGVycm9y
OiBjb21wYXJpc29uIG9mIGludGVnZXIgZXhwcmVzc2lvbnMgb2YgZGlmZmVyZW50CnNpZ25lZG5l
c3M6IOKAmGludOKAmSBhbmQg4oCYdWludDMyX3TigJkge2FrYSDigJh1bnNpZ25lZCBpbnTigJl9
IFstV2Vycm9yPXNpXQogIDE4MiB8ICBmb3IgKGkgPSAwOyBpIDwgcGFyYW1wLT5udW1fdHJhbnNw
b3J0aWQ7IGkrKykKICAgICAgfCAgICAgICAgICAgICAgICBeCmNjMTogYWxsIHdhcm5pbmdzIGJl
aW5nIHRyZWF0ZWQgYXMgZXJyb3JzCgpSZWdhcmRzLApNYXJ0aW4KCgoKCi0tCmRtLWRldmVsIG1h
aWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kbS1kZXZlbA==

