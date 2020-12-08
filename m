Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id A47012D301D
	for <lists+dm-devel@lfdr.de>; Tue,  8 Dec 2020 17:46:20 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-35gQgyAkOvipjrkpOiHg6Q-1; Tue, 08 Dec 2020 11:46:16 -0500
X-MC-Unique: 35gQgyAkOvipjrkpOiHg6Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0199080363F;
	Tue,  8 Dec 2020 16:46:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 478D460BD8;
	Tue,  8 Dec 2020 16:46:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 23F3A180954D;
	Tue,  8 Dec 2020 16:46:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8Gk2Dl011188 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 11:46:02 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 401A6112D40D; Tue,  8 Dec 2020 16:46:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE85112D40B
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 16:45:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C64F61871CC5
	for <dm-devel@redhat.com>; Tue,  8 Dec 2020 16:45:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-584-dy6Jy08TPdO6cLIw9FjxQw-1;
	Tue, 08 Dec 2020 11:45:55 -0500
X-MC-Unique: dy6Jy08TPdO6cLIw9FjxQw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 95A7CAD21;
	Tue,  8 Dec 2020 16:45:53 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201208162829.2424563-1-hch@lst.de>
	<20201208162829.2424563-3-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <5adf02c7-9f53-4162-2655-8063c118ce8f@suse.de>
Date: Tue, 8 Dec 2020 17:45:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201208162829.2424563-3-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B8Gk2Dl011188
X-loop: dm-devel@redhat.com
Cc: Sagi Grimberg <sagi@grimberg.me>, Mike Snitzer <snitzer@redhat.com>,
	Oleksii Kurochko <olkuroch@cisco.com>,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	Ming Lei <ming.lei@redhat.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, linux-nvme@lists.infradead.org,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Ilya Dryomov <idryomov@gmail.com>, ceph-devel@vger.kernel.org
Subject: Re: [dm-devel] [PATCH 2/6] block: remove the NULL bdev check in
	bdev_read_only
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
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMTIvOC8yMCA1OjI4IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbmx5IGEgc2lu
Z2xlIGNhbGxlciBjYW4gZW5kIHVwIGluIGJkZXZfcmVhZF9vbmx5LCBzbyBtb3ZlIHRoZSBjaGVj
awo+IHRoZXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPgo+IFJldmlld2VkLWJ5OiBNaW5nIExlaSA8bWluZy5sZWlAcmVkaGF0LmNvbT4KPiBSZXZp
ZXdlZC1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0aW4ucGV0ZXJzZW5Ab3JhY2xlLmNvbT4K
PiAtLS0KPiAgIGJsb2NrL2dlbmhkLmMgfCAzIC0tLQo+ICAgZnMvc3VwZXIuYyAgICB8IDMgKyst
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvYmxvY2svZ2VuaGQuYyBiL2Jsb2NrL2dlbmhkLmMKPiBpbmRleCBiODRi
ODY3MWU2MjcwYS4uOGYyYjg5ZDExNjE4MTMgMTAwNjQ0Cj4gLS0tIGEvYmxvY2svZ2VuaGQuYwo+
ICsrKyBiL2Jsb2NrL2dlbmhkLmMKPiBAQCAtMTY1MiwxMSArMTY1Miw4IEBAIEVYUE9SVF9TWU1C
T0woc2V0X2Rpc2tfcm8pOwo+ICAgCj4gICBpbnQgYmRldl9yZWFkX29ubHkoc3RydWN0IGJsb2Nr
X2RldmljZSAqYmRldikKPiAgIHsKPiAtCWlmICghYmRldikKPiAtCQlyZXR1cm4gMDsKPiAgIAly
ZXR1cm4gYmRldi0+YmRfcmVhZF9vbmx5Owo+ICAgfQo+IC0KPiAgIEVYUE9SVF9TWU1CT0woYmRl
dl9yZWFkX29ubHkpOwo+ICAgCj4gICAvKgo+IGRpZmYgLS1naXQgYS9mcy9zdXBlci5jIGIvZnMv
c3VwZXIuYwo+IGluZGV4IDJjNmNkZWEyYWIyZDllLi41YTFmMzg0ZmZjNzRmNiAxMDA2NDQKPiAt
LS0gYS9mcy9zdXBlci5jCj4gKysrIGIvZnMvc3VwZXIuYwo+IEBAIC04NjUsNyArODY1LDggQEAg
aW50IHJlY29uZmlndXJlX3N1cGVyKHN0cnVjdCBmc19jb250ZXh0ICpmYykKPiAgIAo+ICAgCWlm
IChmYy0+c2JfZmxhZ3NfbWFzayAmIFNCX1JET05MWSkgewo+ICAgI2lmZGVmIENPTkZJR19CTE9D
Swo+IC0JCWlmICghKGZjLT5zYl9mbGFncyAmIFNCX1JET05MWSkgJiYgYmRldl9yZWFkX29ubHko
c2ItPnNfYmRldikpCj4gKwkJaWYgKCEoZmMtPnNiX2ZsYWdzICYgU0JfUkRPTkxZKSAmJiBzYi0+
c19iZGV2ICYmCj4gKwkJICAgIGJkZXZfcmVhZF9vbmx5KHNiLT5zX2JkZXYpKQo+ICAgCQkJcmV0
dXJuIC1FQUNDRVM7Cj4gICAjZW5kaWYKPiAgIAo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5l
Y2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVj
a2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4
MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIK
CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

