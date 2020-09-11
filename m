Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BA73D2685D4
	for <lists+dm-devel@lfdr.de>; Mon, 14 Sep 2020 09:27:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-A2G10GGRNg67m9Wnr18EAw-1; Mon, 14 Sep 2020 03:26:55 -0400
X-MC-Unique: A2G10GGRNg67m9Wnr18EAw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75E0818B9F02;
	Mon, 14 Sep 2020 07:26:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 523451002D60;
	Mon, 14 Sep 2020 07:26:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0BA211832FDC;
	Mon, 14 Sep 2020 07:26:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08BHcbcS024938 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Sep 2020 13:38:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D66B82068539; Fri, 11 Sep 2020 17:38:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA232068534
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 17:38:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF1D518AE949
	for <dm-devel@redhat.com>; Fri, 11 Sep 2020 17:38:34 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-467-a4eesMpcNVGAHv6IjzUQDw-1;
	Fri, 11 Sep 2020 13:38:32 -0400
X-MC-Unique: a4eesMpcNVGAHv6IjzUQDw-1
Received: from [192.168.86.21] (c-71-197-163-6.hsd1.wa.comcast.net
	[71.197.163.6])
	by linux.microsoft.com (Postfix) with ESMTPSA id D2ECC20D4DAB;
	Fri, 11 Sep 2020 10:38:30 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D2ECC20D4DAB
To: Mimi Zohar <zohar@linux.ibm.com>, stephen.smalley.work@gmail.com,
	casey@schaufler-ca.com, agk@redhat.com, snitzer@redhat.com,
	gmazyland@gmail.com
References: <20200828015704.6629-1-tusharsu@linux.microsoft.com>
	<20200828015704.6629-6-tusharsu@linux.microsoft.com>
	<6c80bdad49c72fa58b5a9fb7ce2d20c8cabe1324.camel@linux.ibm.com>
From: Tushar Sugandhi <tusharsu@linux.microsoft.com>
Message-ID: <01f5ea67-447e-c1c2-9c47-49fd3f6c16ec@linux.microsoft.com>
Date: Fri, 11 Sep 2020 10:38:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6c80bdad49c72fa58b5a9fb7ce2d20c8cabe1324.camel@linux.ibm.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08BHcbcS024938
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Sep 2020 03:23:33 -0400
Cc: sashal@kernel.org, dm-devel@redhat.com, selinux@vger.kernel.org,
	jmorris@namei.org, linux-kernel@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v3 5/6] IMA: add hook to measure critical
 data from kernel components
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Content-Language: en-US

CgpPbiAyMDIwLTA4LTMxIDExOjIzIGEubS4sIE1pbWkgWm9oYXIgd3JvdGU6Cj4+IGRpZmYgLS1n
aXQgYS9zZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9tYWluLmMgYi9zZWN1cml0eS9pbnRlZ3Jp
dHkvaW1hL2ltYV9tYWluLmMKPj4gaW5kZXggNTJjYmJjMWY3ZWEyLi5hODg5YmY0MGNiN2UgMTAw
NjQ0Cj4+IC0tLSBhL3NlY3VyaXR5L2ludGVncml0eS9pbWEvaW1hX21haW4uYwo+PiArKysgYi9z
ZWN1cml0eS9pbnRlZ3JpdHkvaW1hL2ltYV9tYWluLmMKPj4gQEAgLTg2OSw2ICs4NjksMzAgQEAg
dm9pZCBpbWFfa2V4ZWNfY21kbGluZShpbnQga2VybmVsX2ZkLCBjb25zdCB2b2lkICpidWYsIGlu
dCBzaXplKQo+PiAgIAlmZHB1dChmKTsKPj4gICB9Cj4+ICAgCj4+ICsvKioKPj4gKyAqIGltYV9t
ZWFzdXJlX2NyaXRpY2FsX2RhdGEgLSBtZWFzdXJlIGNyaXRpY2FsIGRhdGEKPj4gKyAqIEBldmVu
dF9uYW1lOiBuYW1lIGZvciB0aGUgZ2l2ZW4gZGF0YQo+PiArICogQGV2ZW50X2RhdGFfc291cmNl
OiBuYW1lIG9mIHRoZSBldmVudCBkYXRhIHNvdXJjZQo+PiArICogQGJ1ZjogcG9pbnRlciB0byBi
dWZmZXIgY29udGFpbmluZyBkYXRhIHRvIG1lYXN1cmUKPj4gKyAqIEBidWZfbGVuOiBsZW5ndGgg
b2YgYnVmZmVyKGluIGJ5dGVzKQo+PiArICogQG1lYXN1cmVfYnVmX2hhc2g6IGlmIHNldCB0byB0
cnVlIC0gd2lsbCBtZWFzdXJlIGhhc2ggb2YgdGhlIGJ1ZiwKPj4gKyAqICAgICAgICAgICAgICAg
ICAgICBpbnN0ZWFkIG9mIGJ1Zgo+PiArICoKPj4gKyAqIEJ1ZmZlcnMgY2FuIG9ubHkgYmUgbWVh
c3VyZWQsIG5vdCBhcHByYWlzZWQuCj4+ICsgKi8KPj4gK2ludCBpbWFfbWVhc3VyZV9jcml0aWNh
bF9kYXRhKGNvbnN0IGNoYXIgKmV2ZW50X25hbWUsCj4+ICsJCQkgICAgICBjb25zdCBjaGFyICpl
dmVudF9kYXRhX3NvdXJjZSwKPj4gKwkJCSAgICAgIGNvbnN0IHZvaWQgKmJ1ZiwgaW50IGJ1Zl9s
ZW4sCj4+ICsJCQkgICAgICBib29sIG1lYXN1cmVfYnVmX2hhc2gpCj4+ICt7Cj4+ICsJaWYgKCFl
dmVudF9uYW1lIHx8ICFldmVudF9kYXRhX3NvdXJjZSB8fCAhYnVmIHx8ICFidWZfbGVuKQo+PiAr
CQlyZXR1cm4gLUVJTlZBTDsKPj4gKwo+PiArCXJldHVybiBwcm9jZXNzX2J1ZmZlcl9tZWFzdXJl
bWVudChOVUxMLCBidWYsIGJ1Zl9sZW4sIGV2ZW50X25hbWUsCj4+ICsJCQkJCSAgQ1JJVElDQUxf
REFUQSwgMCwgZXZlbnRfZGF0YV9zb3VyY2UsCj4+ICsJCQkJCSAgbWVhc3VyZV9idWZfaGFzaCk7
Cj4gCj4gVGhpcyBpcyBleGFjdGx5IHdoYXQgSSdtIGNvbmNlcm5lZCBhYm91dC4gIEZhaWx1cmUg
dG8gbWVhc3VyZSBkYXRhIG1heQo+IGJlIGF1ZGl0ZWQsIGJ1dCBzaG91bGQgbmV2ZXIgZmFpbC4K
PiAKPiBNaW1pCj4gCkFzIEkgcmVzcG9uZGVkIGluIHBhdGNoIDIsIEkgY2FuIGlnbm9yZSB0aGUg
cmVzdWx0IG9mIApwcm9jZXNzX2J1ZmZlcl9tZWFzdXJlbWVudCgpIGluIGltYV9tZWFzdXJlX2Ny
aXRpY2FsX2RhdGEoKSwgYW5kIG1ha2UKaW1hX21lYXN1cmVfY3JpdGljYWxfZGF0YSgpIHJldHVy
biB0eXBlIGFzICJ2b2lkIi4KCkJ1dCB0aGF04oCZcyB0aGUgb25seSBwbGFjZSB3aGVyZSB0aGUg
cmVzdWx0cyBvZiBwX2JfbSgpIGFyZSBiZWluZyB1c2VkLgpTbyBJIG1pZ2h0IGFzIHdlbGwganVz
dCByZXZlcnQgdGhlIHJldHVybiB0eXBlIG9mIHBfYl9tKCkgdG8gdGhlCm9yaWdpbmFsICJ2b2lk
Ii4KCj4+ICt9Cj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

