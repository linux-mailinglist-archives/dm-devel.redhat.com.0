Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6590E2197F5
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 07:32:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-367-eIA3_Z81MXyKx3OwExfzDA-1; Thu, 09 Jul 2020 01:32:53 -0400
X-MC-Unique: eIA3_Z81MXyKx3OwExfzDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 341B2107ACCA;
	Thu,  9 Jul 2020 05:32:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BBEDF797FE;
	Thu,  9 Jul 2020 05:32:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3C72972F5B;
	Thu,  9 Jul 2020 05:32:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0695Wg5B031781 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 01:32:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BF602026D69; Thu,  9 Jul 2020 05:32:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 379032026D67
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 05:32:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABEC5185A78B
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 05:32:39 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-377-sq36t0oeNv6F3jOEFt4paQ-1;
	Thu, 09 Jul 2020 01:32:37 -0400
X-MC-Unique: sq36t0oeNv6F3jOEFt4paQ-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 2292B68B05; Thu,  9 Jul 2020 07:32:34 +0200 (CEST)
Date: Thu, 9 Jul 2020 07:32:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200709053233.GA3243@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0695Wg5B031781
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-mm@kvack.org,
	linux-bcache@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, drbd-dev@tron.linbit.com,
	dm-devel@redhat.com, Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	linux-btrfs@vger.kernel.org
Subject: Re: [dm-devel] remove dead bdi congestion leftovers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gV2VkLCBKdWwgMDgsIDIwMjAgYXQgMDU6MTQ6MjlQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiA3LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBIaSBK
ZW5zLAo+ID4gCj4gPiB3ZSBoYXZlIGEgbG90IG9mIGJkaSBjb25nZXN0aW9uIHJlbGF0ZWQgY29k
ZSB0aGF0IGlzIGxlZnQgYXJvdW5kIHdpdGhvdXQKPiA+IGFueSB1c2UuICBUaGlzIHNlcmllcyBy
ZW1vdmVzIGl0IGluIHByZXBhcmF0aW9uIG9mIHNvcnRpbmcgb3V0IHRoZSBiZGkKPiA+IGxpZmV0
aW1lIHJ1bGVzIHByb3Blcmx5Lgo+IAo+IFBsZWFzZSBydW4gc2VyaWVzIGxpa2UgdGhpcyB0aHJv
dWdoIGEgZnVsbCBjb21waWxhdGlvbiwgZm9yIGJvdGggdGhpcyBvbmUKPiBhbmQgdGhlIHByZXZp
b3VzIHNlcmllcyBJIGhhZCB0byBmaXggdXAgaXNzdWVzIGxpa2UgdGhpczoKPiAKPiBkcml2ZXJz
L21kL2JjYWNoZS9yZXF1ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGJjaF9jYWNoZWRfZGV2X3JlcXVl
c3RfaW5pdOKAmToKPiBkcml2ZXJzL21kL2JjYWNoZS9yZXF1ZXN0LmM6MTIzMzoxODogd2Fybmlu
ZzogdW51c2VkIHZhcmlhYmxlIOKAmGfigJkgWy1XdW51c2VkLXZhcmlhYmxlXQo+ICAxMjMzIHwg
IHN0cnVjdCBnZW5kaXNrICpnID0gZGMtPmRpc2suZGlzazsKPiAgICAgICB8ICAgICAgICAgICAg
ICAgICAgXgo+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzogSW4gZnVuY3Rpb24g4oCYYmNo
X2ZsYXNoX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4gZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5j
OjEzMjA6MTg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhn4oCZIFstV3VudXNlZC12YXJp
YWJsZV0KPiAgMTMyMCB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGQtPmRpc2s7Cj4gICAgICAgfCAg
ICAgICAgICAgICAgICAgIF4KPiAKPiBEaWQgdGhlIHNhbWUgaGVyZSwgYXBwbGllZCBpdC4KCkFu
ZCBqdXN0IGxpa2UgdGhlIHByZXZpb3VzIG9uZSBJIGRpZCwgYW5kIHRoZSBjb21waWxlciBkaWQg
bm90IGNvbXBsYWluLgpUaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBhYm91dCBjZXJ0YWluIGdjYyB2
ZXJzaW9ucyBub3Qgd2FybmluZyBhYm91dAp2YXJpYWJsZXMgdGhhdCBhcmUgaW5pdGlhbGl6ZWQg
YnV0IG5vdCBvdGhlcndpc2UgdXNlZC4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0t
ZGV2ZWw=

