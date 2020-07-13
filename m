Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id EAFD221DB17
	for <lists+dm-devel@lfdr.de>; Mon, 13 Jul 2020 18:02:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-297-eEoKHLYZOUmcTuezGGxUgw-1; Mon, 13 Jul 2020 12:02:06 -0400
X-MC-Unique: eEoKHLYZOUmcTuezGGxUgw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B65A88027E3;
	Mon, 13 Jul 2020 16:02:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C929100E870;
	Mon, 13 Jul 2020 16:01:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5C9CE94EEF;
	Mon, 13 Jul 2020 16:01:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06DG1ln4022050 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 13 Jul 2020 12:01:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EEC682026D5D; Mon, 13 Jul 2020 16:01:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EABE12018283
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 16:01:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D1C8100E7DB
	for <dm-devel@redhat.com>; Mon, 13 Jul 2020 16:01:44 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-467-f41N5PsjOAmkHt5GwNL6IA-1;
	Mon, 13 Jul 2020 12:01:40 -0400
X-MC-Unique: f41N5PsjOAmkHt5GwNL6IA-1
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
	[107.3.166.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 2D2A82067D;
	Mon, 13 Jul 2020 16:01:38 +0000 (UTC)
Date: Mon, 13 Jul 2020 09:01:36 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>
Message-ID: <20200713160136.GA1696@sol.localdomain>
References: <20200701045217.121126-1-ebiggers@kernel.org>
	<20200701045217.121126-6-ebiggers@kernel.org>
	<3f2d3409-2739-b121-0469-b14c86110b2d@nxp.com>
MIME-Version: 1.0
In-Reply-To: <3f2d3409-2739-b121-0469-b14c86110b2d@nxp.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 06DG1ln4022050
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mikulas Patocka <mpatocka@redhat.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [dm-devel] [PATCH 5/6] crypto: set the flag
	CRYPTO_ALG_ALLOCATES_MEMORY
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

T24gTW9uLCBKdWwgMTMsIDIwMjAgYXQgMDY6NDk6MDBQTSArMDMwMCwgSG9yaWEgR2VhbnTEgyB3
cm90ZToKPiBPbiA3LzEvMjAyMCA3OjUyIEFNLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4gPiBGcm9t
OiBNaWt1bGFzIFBhdG9ja2EgPG1wYXRvY2thQHJlZGhhdC5jb20+Cj4gPiAKPiA+IFNldCB0aGUg
ZmxhZyBDUllQVE9fQUxHX0FMTE9DQVRFU19NRU1PUlkgaW4gdGhlIGNyeXB0byBkcml2ZXJzIHRo
YXQKPiA+IGFsbG9jYXRlIG1lbW9yeS4KPiA+IAo+IFF1aXRlIGEgZmV3IGRyaXZlcnMgYXJlIGlt
cGFjdGVkLgo+IAo+IEkgd29uZGVyIHdoYXQncyB0aGUgcHJvcGVyIHdheSB0byBhZGRyZXNzIHRo
ZSBtZW1vcnkgYWxsb2NhdGlvbi4KPiAKPiBIZXJiZXJ0IG1lbnRpb25lZCBzZXR0aW5nIHVwIHJl
cXNpemU6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY3J5cHRvLzIwMjAwNjEwMDEw
NDUwLkdBNjQ0OUBnb25kb3IuYXBhbmEub3JnLmF1Lwo+IAo+IEkgc2VlIGF0IGxlYXN0IHR3byBo
dXJkbGVzIGluIGNvbnZlcnRpbmcgdGhlIGRyaXZlcnMgdG8gdXNpbmcgcmVxc2l6ZToKPiAKPiAx
LiBTb21lIGRyaXZlcnMgYWxsb2NhdGUgdGhlIG1lbW9yeSB1c2luZyBHRlBfRE1BCj4gCj4gcmVx
c2l6ZSBkb2VzIG5vdCBhbGxvdyBkcml2ZXJzIHRvIGNvbnRyb2wgZ2ZwIGFsbG9jYXRpb24gZmxh
Z3MuCj4gCj4gSSd2ZSB0cmllZCBjb252ZXJ0aW5nIHRhbGl0b3MgZHJpdmVyICh0byB1c2UgcmVx
c2l6ZSkgYXQgc29tZSBwb2ludCwKPiBhbmQgaW4gdGhlIHByb2Nlc3MgYWRkaW5nIGEgZ2VuZXJp
YyBDUllQVE9fVEZNX1JFUV9ETUEgZmxhZzoKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1jcnlwdG8vNTRGRDhEM0IuNTA0MDQwOUBmcmVlc2NhbGUuY29tCj4gaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvbGludXgtY3J5cHRvLzE0MjYyNjY4ODItMzE2MjYtMS1naXQtc2VuZC1lbWFpbC1o
b3JpYS5nZWFudGFAZnJlZXNjYWxlLmNvbQo+IAo+IFRoZSBmbGFnIHdhcyBzdXBwb3NlZCB0byBi
ZSB0cmFuc3BhcmVudCBmb3IgdGhlIHVzZXIsCj4gaG93ZXZlciB0aGVyZSB3ZXJlIHVzZXJzIHRo
YXQgb3Blbi1jb2RlZCB0aGUgcmVxdWVzdCBhbGxvY2F0aW9uLAo+IGZvciBleGFtcGxlIGVzcF9h
bGxvY190bXAoKSBpbiBuZXQvaXB2NC9lc3A0LmMuCj4gQXQgdGhhdCB0aW1lLCBEYXZlIE5BQ0st
ZWQgdGhlIGNoYW5nZToKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jcnlwdG8vMTQy
NjI2NjkyMi0zMTY3OS0xLWdpdC1zZW5kLWVtYWlsLWhvcmlhLmdlYW50YUBmcmVlc2NhbGUuY29t
Cj4gCj4gCj4gMi4gTWVtb3J5IHJlcXVpcmVtZW50cyBjYW5ub3QgYmUgZGV0ZXJtaW5lZCAvIGFy
ZSBub3Qga25vd24KPiBhdCByZXF1ZXN0IGFsbG9jYXRpb24gdGltZQo+IAo+IEFuIGFuYWx5c2lz
IGZvciB0YWxpdG9zIGRyaXZlciBpcyBoZXJlOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LWNyeXB0by81NEY4MjM1Qi41MDgwMzAxQGZyZWVzY2FsZS5jb20KPiAKPiBJbiBnZW5lcmFs
LCBkcml2ZXJzIHdvdWxkIGJlIGZvcmNlZCB0byBhc2sgbW9yZSBtZW1vcnkgdGhhbiBuZWVkZWQs
Cj4gdG8gaGFuZGxlIHRoZSAid29yc3QtY2FzZSIuCj4gTG9naWMgd2lsbCBiZSBuZWVkZWQgdG8g
ZmFpbCBpbiBjYXNlIHRoZSAid29yc3QtY2FzZSIgaXNuJ3QgY29ycmVjdGx5IGVzdGltYXRlZC4K
PiAKPiBIb3dldmVyLCB0aGlzIGlzIHN0aWxsIHByb2JsZW1hdGljLgo+IAo+IEZvciBleGFtcGxl
LCBhIGRyaXZlciBjb3VsZCBzZXQgdXAgcmVxc2l6ZSB0byBhY2NvbW1vZGF0ZSBmb3IgMzIgUy9H
IGVudHJpZXMKPiAoaW4gdGhlIEhXIFMvRyB0YWJsZSkuIEluIGNhc2UgYSBkbS1jcnlwdCBlbmNy
eXB0aW9uIHJlcXVlc3Qgd291bGQgcmVxdWlyZSBtb3JlLAo+IHRoZW4gZHJpdmVyJ3MgLmVuY3J5
cHQgY2FsbGJhY2sgd291bGQgZmFpbCwgcG9zc2libHkgd2l0aCAtRU5PTUVNLAo+IHNpbmNlIHRo
ZXJlJ3Mgbm90IGVub3VnaCBwcmUtYWxsb2NhdGVkIG1lbW9yeS4KPiBUaGlzIGJyaW5ncyB1cyBi
YWNrIHRvIHRoZSBzYW1lIHByb2JsZW0gd2UncmUgdHJ5aW5nIHRvIHNvbHZlLAo+IHNpbmNlIGlu
IHRoaXMgY2FzZSB0aGUgZHJpdmVyIHdvdWxkIGJlIGZvcmNlZCB0byBlaXRoZXIgZmFpbCBpbW1l
ZGlhdGVseSBvcgo+IHRvIGFsbG9jYXRlIG1lbW9yeSBhdCAuZW5jcnlwdC8uZGVjcnlwdCB0aW1l
Lgo+IAoKV2UgaGF2ZSB0byBwbGFjZSByZXN0cmljdGlvbnMgb24gd2hhdCBjYXNlcwohKGZsYWdz
ICYgQ1JZUFRPX0FMR19BTExPQ0FURVNfTUVNT1JZKSBhcHBsaWVzIHRvIGFueXdheTsgc2VlIHRo
ZSBwYXRjaCB0aGF0CmludHJvZHVjZXMgaXQuICBJZiBuZWVkZWQgd2UgY291bGQgYWRkIG1vcmUg
cmVzdHJpY3Rpb25zLCBsaWtlIGxpbWl0IHRoZSBudW1iZXIKb2Ygc2NhdHRlcmxpc3QgZWxlbWVu
dHMuICBJZiB3ZSBkaWQgdGhhdCwgdGhlIGRyaXZlciBjb3VsZCBhbGxvY2F0ZSBtZW1vcnkgaWYK
dGhlIG51bWJlciBvZiBzY2F0dGVybGlzdCBlbGVtZW50cyBpcyBsYXJnZSwgd2l0aG91dCBoYXZp
bmcgdG8gc2V0CkNSWVBUT19BTEdfQUxMT0NBVEVTX01FTU9SWS4KCkFsc28sIGhhdmUgeW91IGNv
bnNpZGVyZWQgdXNpbmcgYSBtZW1wb29sPyAgQSBtZW1wb29sIGFsbG93cyBhbGxvY2F0aW9ucyB3
aXRob3V0CmEgcG9zc2liaWxpdHkgb2YgZmFpbHVyZSwgYXQgdGhlIGNvc3Qgb2YgcHJlLWFsbG9j
YXRpb25zLgoKLSBFcmljCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

