Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id EAF081ECA30
	for <lists+dm-devel@lfdr.de>; Wed,  3 Jun 2020 09:10:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591168202;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=tRIAn6f9fvWaPVe9V04VQHitLlsir9hA59ieMp5oQVU=;
	b=CcMFwySoWxEnXVqP0z/nurY8TjpJl0ZYw//cwiS1T4hWzeZ3J7y6MM+ekqH7M7T3mh9bxP
	TzxiZZozR71M9YhP2Bc3Rnp2NOcdf1Sa3htMXd7tel2M7E1FbpEPOREE/AOo6uVqVkocZ/
	Z/HsNrguKV6RtAMGVBHCVvBdCHWR5qg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-4E8DsAAoO_qkv3uAwzAICA-1; Wed, 03 Jun 2020 03:10:00 -0400
X-MC-Unique: 4E8DsAAoO_qkv3uAwzAICA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38549872FE0;
	Wed,  3 Jun 2020 07:09:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C87CF5C220;
	Wed,  3 Jun 2020 07:09:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BB2793902;
	Wed,  3 Jun 2020 07:09:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05379RlB021319 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 3 Jun 2020 03:09:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E7971DBAE3; Wed,  3 Jun 2020 07:09:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E37FBE596F
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 07:09:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 409171024D02
	for <dm-devel@redhat.com>; Wed,  3 Jun 2020 07:09:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-249-u9L4CkpcNRaIkIXYNW4ZZg-1;
	Wed, 03 Jun 2020 03:09:19 -0400
X-MC-Unique: u9L4CkpcNRaIkIXYNW4ZZg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5A1CDACB8;
	Wed,  3 Jun 2020 07:09:21 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200602110956.121170-1-hare@suse.de>
	<20200602222719.GA14318@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <ff341711-ef31-d7e4-f45d-e788e25e7dad@suse.de>
Date: Wed, 3 Jun 2020 09:09:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200602222719.GA14318@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05379RlB021319
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCHv4 00/15] dm-zoned: multiple drive support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNi8zLzIwIDEyOjI3IEFNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gT24gVHVlLCBKdW4gMDIg
MjAyMCBhdCAgNzowOWFtIC0wNDAwLAo+IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPiB3
cm90ZToKPiAKPj4gSGkgYWxsLAo+Pgo+PiBoZXJlJ3MgdGhlIHNlY29uZCB2ZXJzaW9uIG9mIG15
IHBhdGNoc2V0IHRvIHN1cHBvcnQgbXVsdGlwbGUgem9uZWQKPj4gZHJpdmVzIHdpdGggZG0tem9u
ZWQuCj4+IFRoaXMgcGF0Y2hzZXQ6Cj4+IC0gQ29udmVydHMgdGhlIHpvbmUgYXJyYXkgdG8gdXNp
bmcgeGFycmF5IGZvciBiZXR0ZXIgc2NhbGFiaWxpdHkKPj4gLSBTZXBhcmF0ZXMgb3V0IHNoYXJl
ZCBzdHJ1Y3R1cmVzIGludG8gcGVyLWRldmljZSBzdHJ1Y3R1cmUKPj4gLSBFbmZvcmNlIGRyaXZl
LWxvY2FsaXR5IGZvciBhbGxvY2F0aW5nIGFuZCByZWNsYWltaW5nIHpvbmVzCj4+IC0gTGlmdHMg
dGhlIHJlc3RyaWN0aW9uIG9mIDIgZGV2aWNlcyB0byBoYW5kbGUgYW4gYXJiaXRyYXJ5IG51bWJl
cgo+PiAgICBvZiBkcml2ZXMuCj4+Cj4+IFRoaXMgZ2l2ZXMgbWUgYSBuZWFyLXBlcmZlY3Qgc2Nh
bGFiaWxpdHkgYnkgaW5jcmVhc2luZyB0aGUgd3JpdGUKPj4gc3BlZWQgZnJvbSAxNTBNQi9zIChm
b3IgYSBjYWNoZSBhbmQgb25lIHpvbmVkIGRyaXZlKSB0byAzMDBNQi9zCj4+IChmb3IgYSBjYWNo
ZSBhbmQgdHdvIHpvbmVkIGRyaXZlcykuCj4+Cj4+IENoYW5nZXMgdG8gdjE6Cj4+IC0gSW5jbHVk
ZSByZXZpZXdzIGZyb20gRGFtaWVuCj4+IC0gUmVzaHVmZmxlIHBhdGNoZXMKPj4gQ2hhbmdlcyB0
byB2MjoKPj4gLSBBZGQgcmV2aWV3cyBmcm9tIERhbWllbgo+PiAtIE1lcmdlIHBhdGNoZXMgJ2R5
bmFtaWMgZGV2aWNlIGFsbG9jYXRpb24nIGFuZAo+PiAgICAnc3VwcG9ydCBhcmJpdHJhcnkgbnVt
YmVyIG9mIGRldmljZXMnCj4+IC0gRml4IG1lbW9yeSBsZWFrIHdoZW4gcmVhZGluZyB0ZXJ0aWFy
eSBzdXBlcmJsb2Nrcwo+PiBDaGFuZ2VzIHRvIHYzOgo+PiAtIEFkZCByZXZpZXdzIGZyb20gRGFt
aWVuCj4+IC0gQWRkIHBhdGNoIHRvIGVuc3VyZSBjb3JyZWN0IGRldmljZSBvcmRlcmluZwo+IAo+
IEkndmUgcGlja2VkIHRoaXMgc2VyaWVzIHVwIGZvciA1LjggKHllcywgSSBrbm93IGl0IGlzIGxh
c3QgbWludXRlKS4gIEJ1dAo+IEkgc2F3IG5vIGJlbmVmaXQgdG8gbWVyZ2luZyB0aGUgaW5pdGlh
bCAyIGRldmljZSBzdGVwIGluIDUuOCBvbmx5IHRvCj4gdGhlbiBjaHVybiB0aGUgY29kZSBhbmQg
aW50ZXJmYWNlIHRvIHN1cHBvcnQgYW4gYXJiaXRyYXJ5IG51bWJlciBvZgo+IGRldmljZXMgaW4g
NS45LiAgRWFzaWVyIHRvIHN1cHBvcnQgb25lIG1ham9yIHVwZGF0ZSB0byB0aGUgY29kZSBub3cu
Cj4gCj4gQXMgc3VjaCB0aGUgdGFyZ2V0J3MgdmVyc2lvbiBudW1iZXIgd2FzIF9ub3RfIGJ1bXBl
ZCBmcm9tIDIuMC4wIHRvCj4gMy4wLjAuCj4gCj4gSSB0d2Vha2VkIHZhcmlvdXMgcGF0Y2ggaGVh
ZGVycyAoX3BsZWFzZV8gImRtIHpvbmVkIiBpbnN0ZWFkIG9mCj4gImRtLXpvbmVkIiBpbiBjb21t
aXQgc3ViamVjdHMsIGFsc28gZG9uJ3QgZXZlciBzYXkgIndlIiBvciAidGhpcyBwYXRjaCIKPiBp
biBhIGNvbW1pdCBoZWFkZXIuLi4gaWYgeW91IGRvLCBJIGFtIGZvcmNlZCB0byByZXdyaXRlIHRo
ZSBoZWFkZXIpLgo+IAo+IEJUVywganVzdCBzbyBJIGZlZWwgbGlrZSBJIHNhaWQgaXQ6IGFsbCB0
aGVzZSBjaGFuZ2VzIHRvIHVzZSBhZGRpdGlvbmFsCj4gZGV2aWNlKHMpIHJlYWxseSBzZWVtcyBs
aWtlIGEgdHJhZGVvZmYgYmV0d2VlbiBwZXJmb3JtYW5jZSBhbmQgcmVkdWNlZAo+IE1UQkYgLS0g
dGhlcmUgaXMgaW5jcmVhc2VkIHBvdGVudGlhbCBmb3IgZmFpbHVyZSB3aXRoIGVhY2ggYWRkaXRp
b25hbAo+IGRldmljZSB0aGF0IGlzIGFkZGVkIHRvIHRoZSBkbS16b25lZCBkZXZpY2UuLi4gdGhl
cmUgSSd2ZSBzYWlkIGl0IDspCj4gCiJXZSIgKHNpYykgYXJlIGZ1bGx5IGF3YXJlLiBBbmQgSSdt
IGxvb2tpbmcgaW50byBpdC4KClRoYW5rcyBmb3IgbWVyZ2luZyBpdC4gTW9zdCBhcHByZWNpYXRl
ZC4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRl
YW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
bWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJl
cmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

