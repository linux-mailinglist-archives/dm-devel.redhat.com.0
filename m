Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 6123E21A1BC
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 16:05:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-TTLJtODyOuy_jnZR0y6b8w-1; Thu, 09 Jul 2020 10:05:26 -0400
X-MC-Unique: TTLJtODyOuy_jnZR0y6b8w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5C3618FF663;
	Thu,  9 Jul 2020 14:05:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6850410016DA;
	Thu,  9 Jul 2020 14:05:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C4E2180954D;
	Thu,  9 Jul 2020 14:05:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069E1wxl022056 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 10:01:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65F85208DD95; Thu,  9 Jul 2020 14:01:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51BC0208DD8A
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 14:01:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1370100E7C9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 14:01:55 +0000 (UTC)
Received: from verein.lst.de (verein.lst.de [213.95.11.211]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-60-eW-3i19OOAu3seIoPWImiA-1;
	Thu, 09 Jul 2020 10:01:49 -0400
X-MC-Unique: eW-3i19OOAu3seIoPWImiA-1
Received: by verein.lst.de (Postfix, from userid 2407)
	id 03E3D68AEF; Thu,  9 Jul 2020 16:01:46 +0200 (CEST)
Date: Thu, 9 Jul 2020 16:01:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Message-ID: <20200709140145.GA3068@lst.de>
References: <20200701090622.3354860-1-hch@lst.de>
	<b5d6df17-68af-d535-79e4-f95e16dd5632@kernel.dk>
	<20200709053233.GA3243@lst.de>
	<82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
MIME-Version: 1.0
In-Reply-To: <82e2785d-2091-1986-0014-3b7cea7cd0d8@kernel.dk>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069E1wxl022056
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVGh1LCBKdWwgMDksIDIwMjAgYXQgMDc6NTg6NThBTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90
ZToKPiBPbiA3LzgvMjAgMTE6MzIgUE0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gT24g
V2VkLCBKdWwgMDgsIDIwMjAgYXQgMDU6MTQ6MjlQTSAtMDYwMCwgSmVucyBBeGJvZSB3cm90ZToK
PiA+PiBPbiA3LzEvMjAgMzowNiBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPj4+IEhp
IEplbnMsCj4gPj4+Cj4gPj4+IHdlIGhhdmUgYSBsb3Qgb2YgYmRpIGNvbmdlc3Rpb24gcmVsYXRl
ZCBjb2RlIHRoYXQgaXMgbGVmdCBhcm91bmQgd2l0aG91dAo+ID4+PiBhbnkgdXNlLiAgVGhpcyBz
ZXJpZXMgcmVtb3ZlcyBpdCBpbiBwcmVwYXJhdGlvbiBvZiBzb3J0aW5nIG91dCB0aGUgYmRpCj4g
Pj4+IGxpZmV0aW1lIHJ1bGVzIHByb3Blcmx5Lgo+ID4+Cj4gPj4gUGxlYXNlIHJ1biBzZXJpZXMg
bGlrZSB0aGlzIHRocm91Z2ggYSBmdWxsIGNvbXBpbGF0aW9uLCBmb3IgYm90aCB0aGlzIG9uZQo+
ID4+IGFuZCB0aGUgcHJldmlvdXMgc2VyaWVzIEkgaGFkIHRvIGZpeCB1cCBpc3N1ZXMgbGlrZSB0
aGlzOgo+ID4+Cj4gPj4gZHJpdmVycy9tZC9iY2FjaGUvcmVxdWVzdC5jOiBJbiBmdW5jdGlvbiDi
gJhiY2hfY2FjaGVkX2Rldl9yZXF1ZXN0X2luaXTigJk6Cj4gPj4gZHJpdmVycy9tZC9iY2FjaGUv
cmVxdWVzdC5jOjEyMzM6MTg6IHdhcm5pbmc6IHVudXNlZCB2YXJpYWJsZSDigJhn4oCZIFstV3Vu
dXNlZC12YXJpYWJsZV0KPiA+PiAgMTIzMyB8ICBzdHJ1Y3QgZ2VuZGlzayAqZyA9IGRjLT5kaXNr
LmRpc2s7Cj4gPj4gICAgICAgfCAgICAgICAgICAgICAgICAgIF4KPiA+PiBkcml2ZXJzL21kL2Jj
YWNoZS9yZXF1ZXN0LmM6IEluIGZ1bmN0aW9uIOKAmGJjaF9mbGFzaF9kZXZfcmVxdWVzdF9pbml0
4oCZOgo+ID4+IGRyaXZlcnMvbWQvYmNhY2hlL3JlcXVlc3QuYzoxMzIwOjE4OiB3YXJuaW5nOiB1
bnVzZWQgdmFyaWFibGUg4oCYZ+KAmSBbLVd1bnVzZWQtdmFyaWFibGVdCj4gPj4gIDEzMjAgfCAg
c3RydWN0IGdlbmRpc2sgKmcgPSBkLT5kaXNrOwo+ID4+ICAgICAgIHwgICAgICAgICAgICAgICAg
ICBeCj4gPj4KPiA+PiBEaWQgdGhlIHNhbWUgaGVyZSwgYXBwbGllZCBpdC4KPiA+IAo+ID4gQW5k
IGp1c3QgbGlrZSB0aGUgcHJldmlvdXMgb25lIEkgZGlkLCBhbmQgdGhlIGNvbXBpbGVyIGRpZCBu
b3QgY29tcGxhaW4uCj4gPiBUaGVyZSBtdXN0IGJlIHNvbWV0aGluZyBhYm91dCBjZXJ0YWluIGdj
YyB2ZXJzaW9ucyBub3Qgd2FybmluZyBhYm91dAo+ID4gdmFyaWFibGVzIHRoYXQgYXJlIGluaXRp
YWxpemVkIGJ1dCBub3Qgb3RoZXJ3aXNlIHVzZWQuCj4gCj4gQXJlIHlvdSB1c2luZyBnY2MtMTA/
IEl0IHN1Y2tzIGZvciB0aGF0LiBnY2MtOSBzZWVtcyB0byByZWxpYWJseSBoaXQKPiB0aGVzZSBj
YXNlcyBmb3IgbWUsIG5vdCBzdXJlIHdoeSBnY2MtMTAgZG9lc24ndC4gQW5kIHRoZSBvbmVzIHF1
b3RlZAo+IGFib3ZlIGFyZSBhYm91dCBhcyB0cml2aWFsIGFzIHRoZXkgY2FuIGdldC4KCmdjYy05
LjMgZnJvbSBEZWJpYW4gLXRlc3RpbmcuICBBbmQgeWVzLCBJJ20gcmVhbGx5IHN1cnByaXNlZCBp
dCBkaWRuJ3QKZmluZCB0aG9zZS4KCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxA
cmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWw=

