Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 2F959192318
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:46:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585125975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KdfIi6eV0h9PDwB5ivTSvXuAiOpXnzod9SVmboCqdZQ=;
	b=ALVoyKs9MvzeqvDo6wri+E0Oq9kaCzoHA7HdBk7cGwIBVu2QuP9tKokecEP4CptKKmCDbC
	3xb9i+vLd8joZ10iOTNbUJRt0jrctW5W72xcXSaoqzfMR9bKvfXUOY7/fz4ARp859w7zaT
	NfedoyklXXxZLmr5Gs1Twe8qhWwKIx4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-242-aSh7fT5jOl2Io6PFzEgmyg-1; Wed, 25 Mar 2020 04:46:12 -0400
X-MC-Unique: aSh7fT5jOl2Io6PFzEgmyg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAD51149CF;
	Wed, 25 Mar 2020 08:46:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8EB25D9C5;
	Wed, 25 Mar 2020 08:46:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0186686382;
	Wed, 25 Mar 2020 08:46:00 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P8jq48029068 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 04:45:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4EAC510A4764; Wed, 25 Mar 2020 08:45:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AD5910A4761
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:45:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8CA388007D2
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:45:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-170-4tj0xut9MEW3N7mxM-2dow-1;
	Wed, 25 Mar 2020 04:45:07 -0400
X-MC-Unique: 4tj0xut9MEW3N7mxM-2dow-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CA51BAFD4;
	Wed, 25 Mar 2020 08:45:05 +0000 (UTC)
To: Bob Liu <bob.liu@oracle.com>, Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
	<0e7c5043-4345-b052-7cec-a53cfea340f7@oracle.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <6db63d3a-99e7-98f6-4b74-4a649d90d363@suse.de>
Date: Wed, 25 Mar 2020 09:45:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <0e7c5043-4345-b052-7cec-a53cfea340f7@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P8jq48029068
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
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

T24gMy8yNS8yMCA4OjI5IEFNLCBCb2IgTGl1IHdyb3RlOgo+IE9uIDMvMjUvMjAgMjo0NyBQTSwg
SGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiAzLzI1LzIwIDc6MjkgQU0sIERhbWllbiBMZSBN
b2FsIHdyb3RlOgo+Pj4gT24gMjAyMC8wMy8yNCAyMDowNCwgQm9iIExpdSB3cm90ZToKPj4+PiBU
aGlzIHBhdGNoIGltcGxlbWVudGVkIG1ldGFkYXRhIHN1cHBvcnQgZm9yIHJlZ3VsYXIgZGV2aWNl
IGJ5Ogo+Pj4+ICDCoCAtIEVtdWxhdGVkIHpvbmUgaW5mb3JtYXRpb24gZm9yIHJlZ3VsYXIgZGV2
aWNlLgo+Pj4+ICDCoCAtIFN0b3JlIG1ldGFkYXRhIGF0IHRoZSBiZWdpbm5pbmcgb2YgcmVndWxh
ciBkZXZpY2UuCj4+Pj4KPj4+PiAgwqDCoMKgwqDCoCB8IC0tLSB6b25lZCBkZXZpY2UgLS0tIHwg
LS0gcmVndWxhciBkZXZpY2UgfHwKPj4+PiAgwqDCoMKgwqDCoCBewqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIF4KPj4+PiAgwqDCoMKgwqDCoCB8wqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHxNZXRhZGF0YQo+Pj4+IHpvbmUgMAo+Pj4+
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQm9iIExpdSA8Ym9iLmxpdUBvcmFjbGUuY29tPgo+Pj4+IC0t
LQo+Pj4+ICDCoCBkcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMgfCAxMzUgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0KPj4+PiAgwqAgZHJpdmVycy9tZC9kbS16
b25lZC10YXJnZXQuY8KgwqAgfMKgwqAgNiArLQo+Pj4+ICDCoCBkcml2ZXJzL21kL2RtLXpvbmVk
LmjCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQo+Pj4+ICDCoCAzIGZpbGVzIGNoYW5nZWQs
IDEwOCBpbnNlcnRpb25zKCspLCAzNiBkZWxldGlvbnMoLSkKPj4+Pgo+PiBIYXZpbmcgdGhvdWdo
dCBhYm91dCBpdCBzb21lIG1vcmUsIEkgdGhpbmsgd2UgY2Fubm90IGNvbnRpbnVlIHdpdGggdGhp
cyAnc2ltcGxlJyBhcHByb2FjaC4KPj4gVGhlIGltbWVkaWF0ZSBwcm9ibGVtIGlzIHRoYXQgd2Ug
bGllIGFib3V0IHRoZSBkaXNrIHNpemU7IGNsZWFybHkgdGhlCj4+IG1ldGFkYXRhIGNhbm5vdCBi
ZSB1c2VkIGZvciByZWd1bGFyIGRhdGEsIHlldCB3ZSBleHBvc2UgYSB0YXJnZXQgZGV2aWNlIHdp
dGggdGhlIGZ1bGwgc2l6ZSBvZiB0aGUgdW5kZXJseWluZyBkZXZpY2UuCj4gCj4gVGhlIGV4cG9z
ZWQgc2l6ZSBpcyAicmVndWxhciBkZXYgc2l6ZSArIHpvbmVkIGRldiBzaXplIC0gbWV0YWRhdGEg
c2l6ZSAtIHJlc2VydmVkIHNlcSB6b25lIHNpemUiLgo+IEkgZGlkbid0IHNlZSB3aHkgdGhlcmUg
aXMgYSBsaWU/Cj4gClRoZSBsaWUgaXMgaW4gZ2VuZXJhdGluZyB0aGUgZGV2aWNlLW1hcHBlciBs
aW5lIGZvciBzZXR0aW5nIHVwIHRoZSAKdGFyZ2V0IGRldmljZS4KRm9ybWF0IGlzCgowIDxzaXpl
PiB6b25lZCA8em9uZWQtZGV2PiA8Y2FjaGUtZGV2PgoKYW5kIDxzaXplPiBpcyB0aGUgY2FwYWNp
dHkgb2YgdGhlIHJlc3VsdGluZyBkZXZpY2UtbWFwcGVyIGRldmljZS4KU28gd2Ugc2hvdWxkIGhh
dmUgYWRhcHRlZCB0aGlzIHRvIGV4Y2x1ZGUgdGhlIG1ldGFkYXRhIHNpemUgYW5kIHRoZSAKcmVz
ZXJ2ZWQgc2VxIHpvbmUgc2l6ZSAoZXZlbiB3aXRoIHRoZSBvcmlnaW5hbCBpbXBsZW1lbnRhdGlv
bik7IAonYmxrc2l6ZScgaXMgY2VydGFpbmx5IHdyb25nIGhlcmUuCgo+PiBNYWtpbmcgbWUgd29u
ZGVyIGlmIGFueWJvZHkgZXZlciB0ZXN0ZWQgYSBkaXNrLWZ1bGwgc2NlbmFyaW8uLi4KPj4gVGhl
IG90aGVyIHByb2JsZW0gaXMgdGhhdCB3aXRoIHR3byBkZXZpY2VzIHdlIG5lZWQgdG8gYmUgYWJs
ZSB0byBzdGl0Y2ggdGhlbSB0b2dldGhlcgo+PiBpbiBhbiBhdXRvbWF0ZWQgZmFzaGlvbiwgZWcg
dmlhIGEgc3lzdGVtZCBzZXJ2aWNlIG9yIHVkZXYgcnVsZS4KPj4gQnV0IGZvciB0aGlzIHdlIG5l
ZWQgdG8gYmUgYWJsZSB0byBpZGVudGlmeSB0aGUgZGV2aWNlcywgd2hpY2ggbWVhbnMgYm90aCBu
ZWVkIHRvIGNhcnJ5Cj4+IG1ldGFkYXRhLCBhbmQgYm90aCBuZWVkIHRvIGhhdmUgdW5pcXVlIGlk
ZW50aWZpZXIgd2l0aGluIHRoZSBtZXRhZGF0YS4gV2hpY2ggdGhlIGN1cnJlbnQKPj4gbWV0YWRh
dGEgZG9lc24ndCBhbGxvdyB0by4KPj4KPj4gSGVuY2UgbXkgcGxhbiBpcyB0byBpbXBsZW1lbnQg
YSB2MiBtZXRhZGF0YSwgY2FycnlpbmcgVVVJRHMgZm9yIHRoZSBkbXogc2V0IF9hbmRfIHRoZQo+
PiBjb21wb25lbnQgZGV2aWNlLiBXaXRoIHRoYXQgd2UgY2FuIHVwZGF0ZSBibGtpZCB0byBjcmVh
dGUgbGlua3MgZXRjIHNvIHRoYXQgdGhlIGRldmljZXMKPj4gY2FuIGJlIGlkZW50aWZpZWQgaW4g
dGhlIHN5c3RlbS4KPj4gQWRkaXRpb25hbGx5IEkgd291bGQgYmUgdXBkYXRpbmcgZG16YWRtIHRv
IHdyaXRlIHRoZSBuZXcgbWV0YWRhdGEuCj4+Cj4+IEFuZCBJIHdpbGwgYWRkIGEgbmV3IGNvbW1h
bmQgJ3N0YXJ0JyB0byBkbXphZG0gd2hpY2ggd2lsbCB0aGVuIGNyZWF0ZSB0aGUgZGV2aWNlLW1h
cHBlcgo+PiBkZXZpY2UgX3dpdGggdGhlIGNvcnJlY3Qgc2l6ZV8uIEl0IGFsc28gaGFzIHRoZSBi
ZW5lZml0IHRoYXQgd2UgY2FuIGNyZWF0ZSB0aGUgZGV2aWNlLW1hcHBlcgo+PiB0YXJnZXQgd2l0
aCB0aGUgVVVJRCBzcGVjaWZpZWQgaW4gdGhlIG1ldGFkYXRhLCBzbyB0aGUgcGVyc2lzdGVudCBk
ZXZpY2UgbGlua3Mgd2lsbCBiZQo+PiBjcmVhdGVkIGF1dG9tYXRpY2FsbHkuCj4+Cj4+IEJvYiwg
Y2FuIHlvdSBzZW5kIG1lIHlvdXIgaW1wcm92ZW1lbnRzIHRvIGRtemFkbSBzbyB0aGF0IEkgY2Fu
IGluY2x1ZGUgdGhlbSBpbiBteSBjaGFuZ2VzPwo+Pgo+IAo+IEF0dGFjaGVkLCBidXQgaXQncyBh
IGJpZyBwYXRjaCBJIGhhdmVuJ3Qgc3BsaXQgdGhlbSB0byBzbWFsbGVyIG9uZS4KPiBUaGUgZG16
X2NoZWNrL3JlcGFpciBjYW4ndCB3b3JrIG5laXRoZXIgaW4gY3VycmVudCBzdGFnZS4KPiAKWWVh
aCwgb2YgY291cnNlLiBQbGFuIGlzIHRvIHN0YXJ0IHdpdGggVjIgbWV0YWRhdGEgaGFuZGxpbmcg
Zmlyc3QgYW55d2F5IAooaXQgYWRkaW5nIFVVSURzKSwgdGhlbiBhZGQgdGhlICdzdGFydCcgZnVu
Y3Rpb25hbGl0eSwgYW5kIG9ubHkgdGhlbiAKaW1wbGVtZW50IGNhY2hlIGRldmljZSBoYW5kbGlu
Zy4KClRoYW5rcyBmb3IgdGhlIHBhdGNoLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVz
IFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBz
dXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVu
ZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpo
dHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

