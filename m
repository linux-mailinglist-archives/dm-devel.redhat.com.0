Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 63F391A73CC
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586846354;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kevpp6ZV4ciOSfL7oTWbGDxOdF5UpalVxp8McUeKnFg=;
	b=eyoUTFW1h7VKoqQWo4AmMSHwqbLttNi/oCCTZhKqTw6+paCbWCuNrxFk6ZHg495IT2pd4J
	CnO+ec1muieZf3MP6KGT8ofup1PmstVotGEjQi+c92Q1r4dVULrJZdWO5OgY7y3gVb+wgo
	+5YXjmNaJxfcfRYedE3fRUL+uEtzEPY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-JBa7qJDHNbWLoCtr3gpfsQ-1; Tue, 14 Apr 2020 02:39:11 -0400
X-MC-Unique: JBa7qJDHNbWLoCtr3gpfsQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68C1A8018AD;
	Tue, 14 Apr 2020 06:39:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3118F116D85;
	Tue, 14 Apr 2020 06:39:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9CE5693069;
	Tue, 14 Apr 2020 06:39:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E6cw1d005413 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 02:38:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E999910DCF7D; Tue, 14 Apr 2020 06:38:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E574D10DCF73
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:38:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34660185A791
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:38:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-323-W62r99exMtCbQN1bmWvbNw-1;
	Tue, 14 Apr 2020 02:38:51 -0400
X-MC-Unique: W62r99exMtCbQN1bmWvbNw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id CC080AB3D;
	Tue, 14 Apr 2020 06:38:48 +0000 (UTC)
To: Bob Liu <bob.liu@oracle.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200409064527.82992-1-hare@suse.de>
	<4052464c-cf93-3e22-3050-58183b9ae564@oracle.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <72e25c3e-818b-93a3-1468-5a5fcd256469@suse.de>
Date: Tue, 14 Apr 2020 08:38:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4052464c-cf93-3e22-3050-58183b9ae564@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E6cw1d005413
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv3 00/11] dm-zoned: metadata version 2
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

T24gNC8xMS8yMCAyOjMwIFBNLCBCb2IgTGl1IHdyb3RlOgo+IE9uIDQvOS8yMCAyOjQ1IFBNLCBI
YW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IEhpIGFsbCwKPj4KPj4gdGhpcyBwYXRjaHNldCBhZGRz
IGEgbmV3IG1ldGFkYXRhIHZlcnNpb24gMiwgd2hpY2ggYnJpbmdzIHRoZSBmb2xsb3dpbmcKPj4g
aW1wcm92ZW1lbnRzOgo+PiAtIFVVSURzIGFuZCBsYWJlbHM6IEFkZGluZyB0aHJlZSBtb3JlIGZp
ZWxkcyB0byB0aGUgbWV0YWRhdGEgY29udGFpbmluZwo+PiAgICB0aGUgZG0tem9uZWQgZGV2aWNl
IFVVSUQgYW5kIGxhYmVsLCBhbmQgdGhlIGRldmljZSBVVUlELiBUaGlzIGFsbG93cwo+PiAgICBm
b3IgYW4gdW5pcXVlIGlkZW50aWZpY2F0aW9uIG9mIHRoZSBkZXZpY2VzLCBzbyB0aGF0IHNldmVy
YWwgZG0tem9uZWQKPj4gICAgc2V0cyBjYW4gY29leGlzdCBhbmQgaGF2ZSBhIHBlcnNpc3RlbnQg
aWRlbnRpZmljYXRpb24uCj4+IC0gRXh0ZW5kIHJhbmRvbSB6b25lcyBieSBhbiBhZGRpdGlvbmFs
IHJlZ3VsYXIgZGlzayBkZXZpY2U6IEEgcmVndWxhcgo+PiAgICBibG9jayBkZXZpY2UgY2FuIGJl
IGFkZGVkIHRvZ2V0aGVyIHdpdGggdGhlIHpvbmVkIGJsb2NrIGRldmljZSwgcHJvdmlkaW5nCj4+
ICAgIGFkZGl0aW9uYWwgKGVtdWxhdGVkKSByYW5kb20gd3JpdGUgem9uZXMuIFdpdGggdGhpcyBp
dCdzIHBvc3NpYmxlIHRvCj4+ICAgIGhhbmRsZSBzZXF1ZW50aWFsIHpvbmVzIG9ubHkgZGV2aWNl
czsgYWxzbyB0aGVyZSB3aWxsIGJlIGEgc3BlZWQtdXAgaWYKPj4gICAgdGhlIHJlZ3VsYXIgYmxv
Y2sgZGV2aWNlIHJlc2lkZXMgb24gYSBmYXN0IG1lZGl1bS4gVGhlIHJlZ3VsYXIgYmxvY2sgZGV2
aWNlCj4+ICAgIGlzIHBsYWNlZCBsb2dpY2FsbHkgaW4gZnJvbnQgb2YgdGhlIHpvbmVkIGJsb2Nr
IGRldmljZSwgc28gdGhhdCBtZXRhZGF0YQo+PiAgICBhbmQgbWFwcGluZyB0YWJsZXMgcmVzaWRl
IG9uIHRoZSByZWd1bGFyIGJsb2NrIGRldmljZSwgbm90IHRoZSB6b25lZCBkZXZpY2UuCj4+IC0g
VGVydGlhcnkgc3VwZXJibG9jayBzdXBwb3J0OiBJbiBhZGRpdGlvbiB0byB0aGUgdHdvIGV4aXN0
aW5nIHNldHMgb2YgbWV0YWRhdGEKPj4gICAgYW5vdGhlciwgdGVydGlhcnksIHN1cGVyYmxvY2sg
aXMgd3JpdHRlbiB0byB0aGUgZmlyc3QgYmxvY2sgb2YgdGhlIHpvbmVkCj4+ICAgIGJsb2NrIGRl
dmljZS4gVGhpcyBzdXBlcmJsb2NrIGlzIGZvciBpZGVudGlmaWNhdGlvbiBvbmx5OyB0aGUgZ2Vu
ZXJhdGlvbgo+PiAgICBudW1iZXIgaXMgc2V0IHRvICcwJyBhbmQgdGhlIGJsb2NrIGl0c2VsZiBp
dCBuZXZlciB1cGRhdGVkLiBUaGUgYWRkaXRpb25hbAo+PiAgICBtZXRhZGF0ZSBsaWtlIGJpdG1h
cCB0YWJsZXMgZXRjIGFyZSBub3QgY29waWVkLgo+Pgo+PiBUbyBoYW5kbGUgdGhpcywgc29tZSBj
aGFuZ2VzIHRvIHRoZSBvcmlnaW5hbCBoYW5kbGluZyBhcmUgaW50cm9kdWNlZDoKPj4gLSBab25l
cyBhcmUgbm93IGVxdWlkaXN0YW50LiBPcmlnaW5hbGx5LCBydW50IHpvbmVzIHdlcmUgaWdub3Jl
ZCwgYW5kCj4+ICAgIG5vdCBjb3VudGVkIHdoZW4gc2l6aW5nIHRoZSBtYXBwaW5nIHRhYmxlcy4g
V2l0aCB0aGUgZHVhbCBkZXZpY2Ugc2V0dXAKPj4gICAgcnVudCB6b25lcyBtaWdodCBvY2N1ciBh
dCB0aGUgZW5kIG9mIHRoZSByZWd1bGFyIGJsb2NrIGRldmljZSwgbWFraW5nCj4+ICAgIGRpcmVj
dCB0cmFuc2xhdGlvbiBiZXR3ZWVuIHpvbmUgbnVtYmVyIGFuZCBzZWN0b3IvYmxvY2sgbnVtYmVy
IGNvbXBsZXguCj4+ICAgIEZvciBtZXRhZGF0YSB2ZXJzaW9uIDIgYWxsIHpvbmVzIGFyZSBjb25z
aWRlcmVkIHRvIGJlIG9mIHRoZSBzYW1lIHNpemUsCj4+ICAgIGFuZCBydW50IHpvbmVzIGFyZSBz
aW1wbHkgbWFya2VkIGFzICdvZmZsaW5lJyB0byBoYXZlIHRoZW0gaWdub3JlZCB3aGVuCj4+ICAg
IGFsbG9jYXRpbmcgYSBuZXcgem9uZS4KPj4gLSBUaGUgYmxvY2sgbnVtYmVyIGluIHRoZSBzdXBl
cmJsb2NrIGlzIG5vdyB0aGUgZ2xvYmFsIG51bWJlciwgYW5kIHJlZmVycyB0bwo+PiAgICB0aGUg
bG9jYXRpb24gb2YgdGhlIHN1cGVyYmxvY2sgcmVsYXRpdmUgdG8gdGhlIHJlc3VsdGluZyBkZXZp
Y2UtbWFwcGVyCj4+ICAgIGRldmljZS4gV2hpY2ggbWVhbnMgdGhhdCB0aGUgdGVydGlhcnkgc3Vw
ZXJibG9jayBjb250YWlucyBhYnNvbHV0ZSBibG9jawo+PiAgICBhZGRyZXNzZXMsIHdoaWNoIG5l
ZWRzIHRvIGJlIHRyYW5zbGF0ZWQgdG8gdGhlIHJlbGF0aXZlIGRldmljZSBhZGRyZXNzZXMKPj4g
ICAgdG8gZmluZCB0aGUgcmVmZXJlbmNlZCBibG9jay4KPj4KPj4gVGhlcmUgaXMgYW4gYWNjb21w
YW55aW5nIHBhdGNoc2V0IGZvciBkbS16b25lZC10b29scyBmb3Igd3JpdGluZyBhbmQgY2hlY2tp
bmcKPj4gdGhpcyBuZXcgbWV0YWRhdGEuCj4+Cj4+IEFzIHVzdWFsLCBjb21tZW50cyBhbmQgcmV2
aWV3cyBhcmUgd2VsY29tZS4KPj4KPj4gQ2hhbmdlcyB0byB2MjoKPj4gLSBLaWxsIGRtel9pZCgp
Cj4+IC0gSW5jbHVkZSByZXZpZXdzIGZyb20gRGFtaWVuCj4+IC0gU2FuaXRpemUgdXVpZCBoYW5k
bGluZyBhcyBzdWdnZXN0ZWQgYnkgSm9obiBEb3JtaW55Cj4+Cj4gCj4gVGhpcyBzZXJpZXMgbG9v
a3MgZ29vZCB0byBtZSwgZmVlbCBmcmVlIHRvIGFkZCBteQo+IFJldmlld2VkLWJ5OiBCb2IgTGl1
IDxib2IubGl1QG9yYWNsZS5jb20+Cj4gCj4gQnkgdGhlIHdheSwgaGF2ZSB5b3UgY29tcGxldGVk
IHRoZSBwYXRjaGVzIGZvciByZWd1bGFyIGRldmljZSBzdXBwb3J0Pwo+IEkgd2FzIGNvbnNpZGVy
aW5nIHJlYmFzZSBteSBwcmV2aW91cyBwYXRjaGVzIHRvIHRoaXMgc2VyaWVzIGJ1dCBub3Qgc3Vy
ZSBpcyBpdCBzdGlsbCBuZWNlc3NhcnkuCj4gCkkgaGF2ZSBjb21iaW5lZCBib3RoIHBhdGNoc2V0
cywgdGhpcyBvbmUgbm93IGFsc28gaW5jbHVkZWQgcmVndWxhciAKZGV2aWNlIHN1cHBvcnQuIFNv
IG5vIG5lZWQgdG8gcmVzZW5kIGZyb20geW91ciBzaWRlLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApE
ci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtp
bmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQw
NTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBG
ZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

