Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09C2E2C7F07
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 08:47:46 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-7tGvcVdrPFmKOEa-3GXJxg-1; Mon, 30 Nov 2020 02:47:44 -0500
X-MC-Unique: 7tGvcVdrPFmKOEa-3GXJxg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 221391074640;
	Mon, 30 Nov 2020 07:47:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A496D5D9D2;
	Mon, 30 Nov 2020 07:47:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 64F234A7C6;
	Mon, 30 Nov 2020 07:47:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU7lWHW026557 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 02:47:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id F3FAD112C07B; Mon, 30 Nov 2020 07:47:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EFB8E112C073
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 07:47:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABB1D185A7BC
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 07:47:29 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-569-FNGTIiIcPA2ytQsgblQOhw-1;
	Mon, 30 Nov 2020 02:47:25 -0500
X-MC-Unique: FNGTIiIcPA2ytQsgblQOhw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 935D2ACC0;
	Mon, 30 Nov 2020 07:47:23 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
	<20201128161510.347752-39-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <45ba93f5-a00d-7e09-e839-afd12c65b067@suse.de>
Date: Mon, 30 Nov 2020 08:47:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-39-hch@lst.de>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AU7lWHW026557
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Chao Yu <yuchao0@huawei.com>,
	Jan Kara <jack@suse.cz>, Mike Snitzer <snitzer@redhat.com>,
	linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] [PATCH 38/45] block: switch partition lookup to use
 struct block_device
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMTEvMjgvMjAgNToxNSBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVXNlIHN0cnVj
dCBibG9ja19kZXZpY2UgdG8gbG9va3VwIHBhcnRpdGlvbnMgb24gYSBkaXNrLiAgVGhpcyByZW1v
dmVzCj4gYWxsIHVzYWdlIG9mIHN0cnVjdCBoZF9zdHJ1Y3QgZnJvbSB0aGUgSS9PIHBhdGguCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gUmV2aWV3
ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQWNrZWQtYnk6IENvbHkgTGkgPGNvbHls
aUBzdXNlLmRlPgkJCVtiY2FjaGVdCj4gQWNrZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2Vp
LmNvbT4JCQlbZjJmc10KPiAtLS0KPiAgIGJsb2NrL2Jpby5jICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgNCArLQo+ICAgYmxvY2svYmxrLWNvcmUuYyAgICAgICAgICAgICAgICAgICB8IDY2ICsr
KysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAgYmxvY2svYmxrLWZsdXNoLmMgICAgICAg
ICAgICAgICAgICB8ICAyICstCj4gICBibG9jay9ibGstbXEuYyAgICAgICAgICAgICAgICAgICAg
IHwgIDkgKystLQo+ICAgYmxvY2svYmxrLW1xLmggICAgICAgICAgICAgICAgICAgICB8ICA3ICsr
LS0KPiAgIGJsb2NrL2Jsay5oICAgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAgYmxv
Y2svZ2VuaGQuYyAgICAgICAgICAgICAgICAgICAgICB8IDU3ICsrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gICBibG9jay9wYXJ0aXRpb25zL2NvcmUuYyAgICAgICAgICAgIHwgIDcgKy0tLQo+
ICAgZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfcmVjZWl2ZXIuYyB8ICAyICstCj4gICBkcml2ZXJz
L2Jsb2NrL2RyYmQvZHJiZF93b3JrZXIuYyAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svenJh
bS96cmFtX2Rydi5jICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5j
ICAgICAgICB8ICA0ICstCj4gICBkcml2ZXJzL21kL2RtLmMgICAgICAgICAgICAgICAgICAgIHwg
IDQgKy0KPiAgIGRyaXZlcnMvbWQvbWQuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArLQo+ICAg
ZHJpdmVycy9udm1lL3RhcmdldC9hZG1pbi1jbWQuYyAgICB8IDIwICsrKystLS0tLQo+ICAgZnMv
ZXh0NC9zdXBlci5jICAgICAgICAgICAgICAgICAgICB8IDE4ICsrKy0tLS0tCj4gICBmcy9leHQ0
L3N5c2ZzLmMgICAgICAgICAgICAgICAgICAgIHwgMTAgKy0tLS0KPiAgIGZzL2YyZnMvZjJmcy5o
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQo+ICAgZnMvZjJmcy9zdXBlci5jICAgICAgICAg
ICAgICAgICAgICB8ICA2ICstLQo+ICAgaW5jbHVkZS9saW51eC9ibGtkZXYuaCAgICAgICAgICAg
ICB8ICA4ICsrLS0KPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAgICAgICAgICAgfCAgNCAr
LQo+ICAgaW5jbHVkZS9saW51eC9wYXJ0X3N0YXQuaCAgICAgICAgICB8IDE3ICsrKystLS0tCj4g
ICAyMiBmaWxlcyBjaGFuZ2VkLCAxMjIgaW5zZXJ0aW9ucygrKSwgMTM3IGRlbGV0aW9ucygtKQo+
IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpI
YW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAgS2VybmVsIFN0b3Jh
Z2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0
OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNm
w7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0t
ZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWw=

