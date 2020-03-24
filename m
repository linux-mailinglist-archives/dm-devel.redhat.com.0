Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 4204A1906CC
	for <lists+dm-devel@lfdr.de>; Tue, 24 Mar 2020 08:52:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585036322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4QolD/VyWLogOgyn9u690I4zLKkR8IyPI44PCudiMiI=;
	b=IX9OMIsd0DHk4Rvra6V1fDbk2R5/mYgHACYS+BJTEuxfmgT30m8qyiFF9cD9g2xjNMS+cR
	TTqQXciSkWlsJ3M+HCrx58aYS5VjaORQsQzRl4Q0zms66Kd9eP0wL0O/3LKryprNffC6FU
	Rlhf6X5mekJGTSr7vzE2nTIC+Zk6QWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-nF7n1HCCPV-WJoccVZGSMw-1; Tue, 24 Mar 2020 03:51:59 -0400
X-MC-Unique: nF7n1HCCPV-WJoccVZGSMw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99BF5107ACC4;
	Tue, 24 Mar 2020 07:51:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1D656266C;
	Tue, 24 Mar 2020 07:51:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 210D286382;
	Tue, 24 Mar 2020 07:51:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02O7paH2000473 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 24 Mar 2020 03:51:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 68BBE2166B2B; Tue, 24 Mar 2020 07:51:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 64CEB2166B2A
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 07:51:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B1608FF665
	for <dm-devel@redhat.com>; Tue, 24 Mar 2020 07:51:34 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-96-iOUM8JtXOvq2anFMdiJSeQ-1;
	Tue, 24 Mar 2020 03:51:31 -0400
X-MC-Unique: iOUM8JtXOvq2anFMdiJSeQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C766BAB6D;
	Tue, 24 Mar 2020 07:51:29 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323150352.107826-2-hare@suse.de>
	<CO2PR04MB2343170DAC13D92E9A649BBFE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <ac6881a9-1b9f-539d-f0e8-9039b4852a2e@suse.de>
Date: Tue, 24 Mar 2020 08:51:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB2343170DAC13D92E9A649BBFE7F10@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02O7paH2000473
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Johannes Thumshirn <jth@kernel.org>,
	Bob Liu <bob.liu@oracle.com>, Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/2] dm-zoned: cache device for zones
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yNC8yMCA0OjUyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiArQm9iIHdobyBoYWQg
cHJvcG9zZWQgYSBzaW1pbGFyIGNoYW5nZSBhIGxhc3QgbW9udGguCj4gCj4gT24gMjAyMC8wMy8y
NCAwOjA0LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IEltcGxlbWVudCAnY2FjaGUnIHpvbmVz
IHdoaWNoIHJlc2lkZSBvbiBhIGRpZmZlcmVudCBkZXZpY2UuCj4+IFRoZSBkZXZpY2UgaXMgbG9n
aWNhbGx5IHNwbGl0IGludG8gem9uZXMsIHdoaWNoIHRoZW4gd2lsbCBiZQo+PiB1c2VkIGFzICdj
YWNoZScgem9uZXMsIHNpbWlsYXIgdG8gdGhlIGV4aXN0aW5nIHJhbmRvdyB3cml0ZQo+PiB6b25l
cy4KPiAKPiBJdCBkb2VzIGxvb2sgbGlrZSB0aGUgbmV3ICJjYWNoZSIgem9uZXMgYXJlIHJlYWxs
eSB1c2VkIGV4YWN0bHkgYXMgY29udmVudGlvbmFsCj4gem9uZXMgb2YgdGhlIFNNUiBkcml2ZS4g
U28gSSB3b25kZXI6IHdoeSBldmVuIGRlZmluZSB0aGlzIG5ldyB6b25lIHR5cGUgPyBXZQo+IGNv
dWxkIGhhdmUgdGhlICJjYWNoZSIgZGV2aWNlIHNwbGl0IGludG8gcmFuZG9tIChjb252ZW50aW9u
YWwpIHpvbmVzIGFkZGVkIHRvIGEKPiBzaW5nbGUgcG9vbCBvZiByYW5kb20gem9uZXMuIFdlIGNh
biBzaW1wbHkgYWRkIGRldmljZSBhd2FyZW5lc3MgdG8gdGhlIHpvbmUKPiBhbGxvY2F0b3IgdG8g
YXZvaWQgYXMgbXVjaCBhcyBwb3NzaWJsZSB1c2luZyBhIHJhbmRvbSB6b25lIGZyb20gdGhlIHNh
bWUgZHJpdmUKPiBhcyB0aGUgc2VxdWVudGlhbCB6b25lIGl0IGJ1ZmZlcnMuIFRoYXQgd291bGQg
YXZvaWQgcmVwZWF0aW5nIG1vc3Qgb2YgdGhlIGNvZGUKPiBmb3IgY2FjaGUgJiByYW5kb20uCj4g
ClllcywgaW5kZWVkIHRoYXQgd2FzIHRoZSBpZGVhIHRvIGtlZXAgJ2NhY2hlJyBhbmQgJ3JhbmRv
bScgem9uZXMgCmVzc2VudGlhbGx5IHNpbWlsYXIuIEJ1dCB0aGVuIGFzIHRoZXJlIGlzIGEgbmVl
ZCB0byBkaWZmZXJlbnRpYXRlIApiZXR3ZWVuIHRoZW0gSSB0aG91Z2h0IGl0IGVhc2llciB0byBp
bnRyb2R1Y2UgYSBuZXcgem9uZSB0eXBlLgoKSG93ZXZlciwgaXQncyBhIG5pY2UgaWRlYSB0byB1
c2UgdGhlIGRldmljZSB0byBkaWZmZXJlbnRpYXRlIGJldHdlZW4gCmJvdGguIEFuZCBpdCB3b3Vs
ZCBldmVuIGxlbmQgdG8gYSBzaW1wbGVyIHJlY2xhaW0gbWVjaGFuaXNtOyBzZXQgdGhlIGxvdyAK
d2F0ZXJtYXJrIHdoZW4gYWxsIHJhbmRvbSB6b25lcyBvbiB0aGUgY2FjaGUgZGV2aWNlIGFyZSBm
dWxsLCBhbmQgc2V0IAp0aGUgaGlnaCB3YXRlcm1hcmsgd2hlbiBoYWxmIG9mIHRoZSByYW5kb20g
em9uZXMgb24gdGhlIFNNUiBkZXZpY2UgYXJlIGZ1bGwuCgpJJ2xsIGdpdmUgaXQgYSBnbyBhbmQg
c2VlIHdoZXJlIEkgZW5kIHVwLgoKPiBGdXJ0aGVybW9yZSwgdGhpcyB3b3JrIGlzIHJlYWxseSBn
cmVhdCB0byBzdXBwb3J0IFNNUiBkcml2ZXMgd2l0aCBubwo+IGNvbnZlbnRpb25hbCB6b25lcyAo
YSBsb3Qgb2YgYXNrIGZvciB0aGVzZSkuIEFuZCBjb25zaWRlcmluZyB0aGF0IHRoZSBuZXcgRk9S
TUFUCj4gV0lUSCBQUkVTRVQgY29tbWFuZCBpcyBjb21pbmcgc29vbiwgYSB1c2VyIHdpbGwgYmUg
YWJsZSB0byByZWZvcm1hdCBhbiBTTVIgZHJpdmUKPiB3aXRoIHNlcXVlbnRpYWwgem9uZXMgb25s
eSB0byBtYXhpbWl6ZSBjYXBhY2l0eS4gRm9yIHRoZXNlLCB0aGUgY2FjaGUgZGV2aWNlCj4gd291
bGQgbmVlZCB0byBob2xkIHRoZSByYW5kb20gem9uZXMsIGF0IHdoaWNoIHBvaW50IHRoZSBkaWZm
ZXJlbmNlIGJldHdlZW4gY2FjaGUKPiBhbmQgcmFuZG8gZ29lcyBhd2F5Lgo+IApJIGtub3cgOi0p
Cgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KPj4g
LS0tCj4+ICAgZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jIHwgMTc0ICsrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtcmVjbGFpbS5j
ICB8ICA3NiArKysrKysrKysrKy0tLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMg
ICB8IDEwOSArKysrKysrKysrKysrKysrKystLS0KPj4gICBkcml2ZXJzL21kL2RtLXpvbmVkLmgg
ICAgICAgICAgfCAgMzEgKysrKystCj4+ICAgNCBmaWxlcyBjaGFuZ2VkLCAzMzkgaW5zZXJ0aW9u
cygrKSwgNTEgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21kL2RtLXpv
bmVkLW1ldGFkYXRhLmMgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMKPj4gaW5kZXgg
MzY5ZGUxNWM0ZTgwLi40MWNjM2EyOWRiMGIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvbWQvZG0t
em9uZWQtbWV0YWRhdGEuYwo+PiArKysgYi9kcml2ZXJzL21kL2RtLXpvbmVkLW1ldGFkYXRhLmMK
Pj4gQEAgLTEzMiw2ICsxMzIsOCBAQCBzdHJ1Y3QgZG16X3NiIHsKPj4gICBzdHJ1Y3QgZG16X21l
dGFkYXRhIHsKPj4gICAJc3RydWN0IGRtel9kZXYJCSpkZXY7Cj4+ICAgCj4+ICsJc3RydWN0IGRt
el9jZGV2CQkqY2RldjsKPiAKPiBHaXZlbiB0aGUgcG9pbnQgYWJvdmUsIHdlIGNvdWxkIGhhdmUg
dGhpcyBnZW5lcmFsaXplZCBhcyBhbiBhcnJheSBvZiBkZXZpY2VzLAo+IHdpdGggdGhlIGZpcnN0
IG9uZSBtZWV0aW5nIHRoZSBjb25zdHJhaW50czoKPiAqIEl0IGNvbnRhaW5zIHRoZSBtZXRhZGF0
YQo+ICogSXQgaGFzIHJhbmRvbS9jb252ZW50aW9uYWwgem9uZXMsIG9yIGlzIGEgcmVndWxhciBk
ZXZpY2UgKHdpdGggYWxsIGl0cwo+IGNhcGFjaXR5IHVzZWQgdGhyb3VnaCBlbXVsYXRlZCByYW5k
b20gem9uZXMpCj4gCj4gSSBkbyBub3QgdGhpbmsgdGhhdCBjb21wbGljYXRlcyB0aGUgY2hhbmdl
cyB5b3UgZGlkIGEgbG90LiBUaGUgcmVjbGFpbSBwYXJ0IHdpbGwKPiBuZWVkIHNvbWUgbW9yZSBs
b3ZlIEkgZ3Vlc3MgdG8gYmUgZWZmaWNpZW50LCBidXQgaXQgbWF5IGJlIGFzIHNpbXBsZSBhcyBk
ZWZpbmluZwo+IG9uZSB3b3JrIHN0cnVjdCBmb3IgZWFjaCBkcml2ZSBiZXNpZGUgdGhlIGZpcnN0
IG9uZS4KPiAKPiBUaG91Z2h0cyA/Cj4gClJhdGhlciBub3QuIFN0cmluZ2luZyBzZXZlcmFsIGRl
dmljZXMgdG9nZXRoZXIgZXNzZW50aWFsbHkgZW11bGF0ZXMgYSAKUkFJRDAgc2V0dXAgd2l0aG91
dCBhbnkgb2YgdGhlIGJlbmVmaXRzLiBBbmQgdGhlIHJlY2xhaW0gbWVjaGFuaXNtIGdldHMgCmlu
ZmluaXRlbHkgbW9yZSBjb21wbGV4LgoKQW5vdGhlciB0aGluZzogSSB3b3VsZCBuZWVkIHRvIHVw
ZGF0ZSB0aGUgbWV0YWRhdGEgdG8gaG9sZCB0aGUgZGV2aWNlIAphbmQgem9uZXNldCBVVUlEOyBi
b3RoIGRldmljZXMgbmVlZCB0byBjYXJyeSBhIG1ldGFkYXRhIHNvIHRoYXQgd2UgY2FuIApzdGl0
Y2ggdGhlbSB0b2dldGhlciB1cG9uIHJlc3RhcnQuCgpCdXQgc29tZSBicmlnaHQgc291bCBwdXQg
YSBjcmMgaW4gdGhlIG1pZGRsZSBvZiB0aGUgbWV0YWRhdGEgOi0oClNvIHdlIGNhbid0IGVhc2ls
eSBleHRlbmQgdGhlIG1ldGFkYXRhIHdpdGggbmV3IGZpZWxkcyBhcyB0aGVuIHRoZSAKbWVhbmlu
ZyBvZiB0aGUgY3JjIGlzIHVuY2xlYXI7IGFzIGl0IHN0YW5kcyBpdCB3b3VsZCBvbmx5IGNvdmVy
IHRoZSBvbGQgCmZpZWxkcywgYW5kIG5vdCB0aGUgbmV3IG9uZXMuCgpTbyBJIHdvdWxkIHByb3Bv
c2UgYSAndjInIG1ldGFkYXRhLCBob2xkaW5nIHRoZSBjcmMgYXMgdGhlIGxhc3QgZW50cnkgb2Yg
CnRoZSBtZXRhZGF0YS4gQW5kIGFkZGluZyBhIGRldmljZSBVVUlEIGFuZCBjYWNoZXNldCBVVUlE
LgpBbmQgZW5zdXJpbmcgdGhhdCB0aGUgZmlyc3QgbWV0YWRhdGEgc2V0IGlzIHN0b3JlZCBvbiB0
aGUgY2FjaGUgZGV2aWNlLCAKYW5kIHRoZSBiYWNrdXAgb25lIG9uIHRoZSBTTVIgZGV2aWNlLgoK
Q2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxl
YWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgs
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyks
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWls
aW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxt
YW4vbGlzdGluZm8vZG0tZGV2ZWw=

