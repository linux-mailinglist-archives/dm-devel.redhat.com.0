Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id EC3802FB624
	for <lists+dm-devel@lfdr.de>; Tue, 19 Jan 2021 13:47:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-514-IhMc4fr4OWusdj6IEag_qA-1; Tue, 19 Jan 2021 07:47:17 -0500
X-MC-Unique: IhMc4fr4OWusdj6IEag_qA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24427800D53;
	Tue, 19 Jan 2021 12:47:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A2655D760;
	Tue, 19 Jan 2021 12:47:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D6BE6180954D;
	Tue, 19 Jan 2021 12:46:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10JCkfXu004601 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 Jan 2021 07:46:42 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C993A9459C; Tue, 19 Jan 2021 12:46:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C227090A0B
	for <dm-devel@redhat.com>; Tue, 19 Jan 2021 12:46:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7683682DFE0
	for <dm-devel@redhat.com>; Tue, 19 Jan 2021 12:46:38 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com
	[45.249.212.190]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-524-tVGIFph7OC2wvkEy2fsMNA-1; Tue, 19 Jan 2021 07:46:34 -0500
X-MC-Unique: tVGIFph7OC2wvkEy2fsMNA-1
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DKpJv2qymzl65c;
	Tue, 19 Jan 2021 20:45:03 +0800 (CST)
Received: from [10.174.178.113] (10.174.178.113) by
	DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server
	id 14.3.498.0; Tue, 19 Jan 2021 20:46:20 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
References: <063bbeeb-15aa-f7c0-b881-7526c3a2720c@huawei.com>
	<af0f31ce3d83f15049598de0c96c4fde6eb553f6.camel@suse.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <c0b51442-4be4-c2d8-01a1-90240194c48c@huawei.com>
Date: Tue, 19 Jan 2021 20:46:19 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <af0f31ce3d83f15049598de0c96c4fde6eb553f6.camel@suse.com>
X-Originating-IP: [10.174.178.113]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10JCkfXu004601
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>, lihaotian9@huawei.com
Subject: Re: [dm-devel] [QUESTION]: multipath device with wrong path lead to
	metadata err
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-GB
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLAoKICAgIEkgaGF2ZSB0ZXN0ZWQgMC43LjcgYW5kIDAuOC41IGNvZGUuVGhleSBi
b3RoIGhhdmUgbWV0YWRhdGUgZXJyb3IuCkkgZmluZCBJIG1pc3NlZCBzb21lIGluZm9ybWF0aW9u
IGluIGxhc3QgZW1haWwuIElwMSBsb2cgaW4gYmV0d2VlbiAoMSkKYW5kICgyKSBhbmQgc2RpIGJl
Y2FtZSBhIHBhdGggb2YgMzYwMDE0MDViNzY3OWJkOTZiMDk0YmNjYmY5NzFiYzkwLCBidXQKdWV2
ZW50cyB3ZXJlbid0IGRlYWwgdW50aWwg77yIM++8iSBmaW5pc2hlZC4KICAgIFRoZSBkZXRhaWxz
IGRlc2NyaWJlZCBhcmUgYmFzZSBvbiBjb2RlIDAuNy43LiBJIHRoaW5rIHNpbWlsYXIgcHJvY2Vz
cwpleGlzdHMgaW4gMC44LjUgYnV0IHRoZXJlIG1heSBiZSBhbm90aGVyIHRvIGNhdXNlIGVycm9y
LgoKVGhlIGxhdGVzdCAicXVldWUiIGNvZGUgaXNuJ3QgdGVzdGVkLiBJIHdpbGwgdHJ5LgoKUmVn
YXJkcywKTGl4aWFva2VuZwoKT24gMjAyMS8xLzE5IDE3OjQxLCBNYXJ0aW4gV2lsY2sgd3JvdGU6
Cj4gSGkgTGl4aWFva2VuZywgCj4gCj4gT24gTW9uLCAyMDIxLTAxLTE4IGF0IDE5OjA4ICswODAw
LCBsaXhpYW9rZW5nIHdyb3RlOgo+PiBIaQo+PiDCoCBXaGVuIHdlIG1ha2UgSU8gc3RyZXNzIHRl
c3Qgb24gbXVsdGlwYXRoIGRldmljZSwgdGhlcmUgd2lsbAo+PiBiZSBhwqAgbWV0YWRhdGEgZXJy
IGJlY2F1c2Ugb2Ygd3JvbmcgcGF0aC4KPj4KPiAKPiB0aGFua3MgZm9yIHRoZSBkZXRhaWxlZCBy
ZXBvcnQgYW5kIGFuYWx5c2lzLCBhbHNvIGZvciBzaGFyaW5nCj4geW91ciB0ZXN0IHNjcmlwdHMh
IEknbGwgdGFrZSBhIGNsb3NlciBsb29rIGFzYXAuIE1lYW53aGlsZSwgcGxlYXNlCj4gY29uZmly
bSB3aGljaCBtdWx0aXBhdGgtdG9vbHMgdmVyc2lvbiB5b3Ugd2VyZSB1c2luZywgYW5kIHdoZXRo
ZXIgdGhpcwo+IG9jY3VycyB3aXRoIHRoZSBsYXRlc3QgInF1ZXVlIiBjb2RlOgo+IAo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9vcGVuU1VTRS9tdWx0aXBhdGgtdG9vbHMvdHJlZS9xdWV1ZQo+IAo+IFJl
Z2FyZHMKPiBNYXJ0aW4KPiAKPiAKPiAuCj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRt
LWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RtLWRldmVs

