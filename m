Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD521B75A0
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 14:43:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587732233;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9kX5WK57Gf0NG7PE9E8Z//n1p+HnYKapZ6Vt6ID7pMw=;
	b=cgplInCXkPzctuvqI3AcTgsMkwK4PIxJaGw4fLAQHT+SFqnQ1tlaANuu69I68DjM0y5Hyi
	rfZfPvPKcvqLHctfrft3988cpWemMyYuO8Ec1AVNNv/SZfXBKyRXKtEoNWpLnY0JLYxXn2
	se8bXcgkIVaOg2YuJGf4/ubE6X6LtEo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-456-EmmUtc63No623OQeDHan7g-1; Fri, 24 Apr 2020 08:43:50 -0400
X-MC-Unique: EmmUtc63No623OQeDHan7g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7105C460;
	Fri, 24 Apr 2020 12:43:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E70A45D9CC;
	Fri, 24 Apr 2020 12:43:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3194A18095FF;
	Fri, 24 Apr 2020 12:43:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OChHel031635 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 08:43:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 85674114CA4; Fri, 24 Apr 2020 12:43:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8170E114CA9
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 12:43:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F198A811E77
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 12:43:14 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-479-Fp1Fip7QNICcdMAQoy9CBg-1;
	Fri, 24 Apr 2020 08:43:10 -0400
X-MC-Unique: Fp1Fip7QNICcdMAQoy9CBg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 07802AD0F;
	Fri, 24 Apr 2020 12:43:08 +0000 (UTC)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-2-ming.lei@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <43e63bfd-fd63-b9b8-d8db-64bff93f84be@suse.de>
Date: Fri, 24 Apr 2020 14:43:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424102351.475641-2-ming.lei@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OChHel031635
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 01/11] block: clone nr_integrity_segments
 and write_hint in blk_rq_prep_clone
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNC8yNC8yMCAxMjoyMyBQTSwgTWluZyBMZWkgd3JvdGU6Cj4gU28gZmFyIGJsa19ycV9wcmVw
X2Nsb25lKCkgaXMgb25seSB1c2VkIGZvciBzZXR1cCBvbmUgdW5kZXJseWluZyBjbG9uZWQKPiBy
ZXF1ZXN0IGZyb20gZG0tcnEgcmVxdWVzdC4gYmxvY2sgaW50ZXRyaXR5IGNhbiBiZSBlbmFibGVk
IGZvciBib3RoIGRtLXJxCj4gYW5kIHRoZSB1bmRlcmx5aW5nIHF1ZXVlcywgc28gaXQgaXMgcmVh
c29uYWJsZSB0byBjbG9uZSBycSdzCj4gbnJfaW50ZWdyaXR5X3NlZ21lbnRzLiBBbHNvIHdyaXRl
X2hpbnQgaXMgZnJvbSBiaW8sIGl0IHNob3VsZCBoYXZlIGJlZW4KPiBjbG9uZWQgdG9vLgo+IAo+
IFNvIGNsb25lIG5yX2ludGVncml0eV9zZWdtZW50cyBhbmQgd3JpdGVfaGludCBpbiBibGtfcnFf
cHJlcF9jbG9uZS4KPiAKPiBDYzogSm9obiBHYXJyeSA8am9obi5nYXJyeUBodWF3ZWkuY29tPgo+
IENjOiBCYXJ0IFZhbiBBc3NjaGUgPGJ2YW5hc3NjaGVAYWNtLm9yZz4KPiBDYzogSGFubmVzIFJl
aW5lY2tlIDxoYXJlQHN1c2UuY29tPgo+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KPiBDYzogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+Cj4gQ2M6IE1pa2Ug
U25pdHplciA8c25pdHplckByZWRoYXQuY29tPgo+IENjOiBkbS1kZXZlbEByZWRoYXQuY29tCj4g
U2lnbmVkLW9mZi1ieTogTWluZyBMZWkgPG1pbmcubGVpQHJlZGhhdC5jb20+Cj4gLS0tCj4gICBi
bG9jay9ibGstY29yZS5jIHwgNCArKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspCj4gCj4gZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay1jb3JlLmMgYi9ibG9jay9ibGstY29yZS5j
Cj4gaW5kZXggN2U0YTFkYTA3MTVlLi45MTUzN2U1MjZiNDUgMTAwNjQ0Cj4gLS0tIGEvYmxvY2sv
YmxrLWNvcmUuYwo+ICsrKyBiL2Jsb2NrL2Jsay1jb3JlLmMKPiBAQCAtMTYzNiw5ICsxNjM2LDEz
IEBAIGludCBibGtfcnFfcHJlcF9jbG9uZShzdHJ1Y3QgcmVxdWVzdCAqcnEsIHN0cnVjdCByZXF1
ZXN0ICpycV9zcmMsCj4gICAJCXJxLT5ycV9mbGFncyB8PSBSUUZfU1BFQ0lBTF9QQVlMT0FEOwo+
ICAgCQlycS0+c3BlY2lhbF92ZWMgPSBycV9zcmMtPnNwZWNpYWxfdmVjOwo+ICAgCX0KPiArI2lm
ZGVmIENPTkZJR19CTEtfREVWX0lOVEVHUklUWQo+ICsJcnEtPm5yX2ludGVncml0eV9zZWdtZW50
cyA9IHJxX3NyYy0+bnJfaW50ZWdyaXR5X3NlZ21lbnRzOwo+ICsjZW5kaWYKPiAgIAlycS0+bnJf
cGh5c19zZWdtZW50cyA9IHJxX3NyYy0+bnJfcGh5c19zZWdtZW50czsKPiAgIAlycS0+aW9wcmlv
ID0gcnFfc3JjLT5pb3ByaW87Cj4gICAJcnEtPmV4dHJhX2xlbiA9IHJxX3NyYy0+ZXh0cmFfbGVu
Owo+ICsJcnEtPndyaXRlX2hpbnQgPSBycV9zcmMtPndyaXRlX2hpbnQ7Cj4gICAKPiAgIAlyZXR1
cm4gMDsKPiAgIAo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+
CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFt
bGVhZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21i
SCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1h
aWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFp
bG1hbi9saXN0aW5mby9kbS1kZXZlbA==

