Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 13F1F1A37F3
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 18:26:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586449606;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z6ZDnaW+r4LbtDEWcpPsQLiU4sXX9yBBtieKwZmgNHk=;
	b=UD0UbYjJMcGKEteYkePs50kDYslAEUYOFX6UB9PLWEO0UP918NJDoPbvQVIL5mc1jDD2MT
	E6VXMdDMb1M8kiWPFU41f3v+eHcSwk1NfjxTX67qLmzIKAnsLRtgMyCAmwtkVP44LzzCc+
	jDpMuRr+eEkXqHjtccaxRB39bsg7Ryw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-s5lmTD9bOrapxlvbm7HTqA-1; Thu, 09 Apr 2020 12:26:44 -0400
X-MC-Unique: s5lmTD9bOrapxlvbm7HTqA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3B48801E6C;
	Thu,  9 Apr 2020 16:26:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A4CF5D9CA;
	Thu,  9 Apr 2020 16:26:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0D2B018089CD;
	Thu,  9 Apr 2020 16:26:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 039GQ74P011698 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 12:26:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24BD02026D66; Thu,  9 Apr 2020 16:26:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6922026D68
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 16:26:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7642280029B
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 16:26:04 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182]) by
	relay.mimecast.com with ESMTP id us-mta-452-E8deM0j_ObmIlBurJnKZ5g-1;
	Thu, 09 Apr 2020 12:25:59 -0400
X-MC-Unique: E8deM0j_ObmIlBurJnKZ5g-1
Received: from [10.137.106.115] (unknown [131.107.174.243])
	by linux.microsoft.com (Postfix) with ESMTPSA id CC37A2007679;
	Thu,  9 Apr 2020 09:25:57 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com CC37A2007679
To: Nayna <nayna@linux.vnet.ibm.com>
References: <20200406221439.1469862-1-deven.desai@linux.microsoft.com>
	<c1466cc8-8a08-708a-4629-234485bb833e@linux.vnet.ibm.com>
From: Deven Bowers <deven.desai@linux.microsoft.com>
Message-ID: <35afdffe-179c-aedd-333a-9dfc20635fc3@linux.microsoft.com>
Date: Thu, 9 Apr 2020 09:25:57 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <c1466cc8-8a08-708a-4629-234485bb833e@linux.vnet.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 039GQ74P011698
X-loop: dm-devel@redhat.com
Cc: axboe@kernel.dk, sashal@kernel.org, dm-devel@redhat.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, pasha.tatashin@soleen.com,
	jmorris@namei.org, zohar@linux.ibm.com,
	mdsakib@linux.microsoft.com, linux-block@vger.kernel.org,
	nramas@linux.microsoft.com, linux-security-module@vger.kernel.org,
	tyhicks@linux.microsoft.com, linux-integrity@vger.kernel.org,
	jaskarankhurana@linux.microsoft.com, agk@redhat.com, serge@hallyn.com
Subject: Re: [dm-devel] [RFC PATCH v2 00/12] Integrity Policy Enforcement
	LSM (IPE)
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

T24gNC83LzIwMjAgMjozMSBQTSwgTmF5bmEgd3JvdGU6Cgo+Cj4gT24gNC82LzIwIDY6MTQgUE0s
IGRldmVuLmRlc2FpQGxpbnV4Lm1pY3Jvc29mdC5jb20gd3JvdGU6Cj4+IEZyb206IERldmVuIEJv
d2VycyA8ZGV2ZW4uZGVzYWlAbGludXgubWljcm9zb2Z0LmNvbT4KPj4KPj4gQ2hhbmdlbG9nOgo+
PiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4KPj4gdjE6IEludHJvZHVj
ZWQKPj4KPj4gdjI6Cj4+IMKgwqAgU3BsaXQgdGhlIHNlY29uZCBwYXRjaCBvZiB0aGUgcHJldmlv
dXMgc2VyaWVzIGludG8gdHdvLgo+PiDCoMKgIE1pbm9yIGNvcnJlY3Rpb25zIGluIHRoZSBjb3Zl
ci1sZXR0ZXIgYW5kIGRvY3VtZW50YXRpb24KPj4gwqDCoCBjb21tZW50cyByZWdhcmRpbmcgQ0FQ
X01BQ19BRE1JTiBjaGVja3MgaW4gSVBFLgo+Pgo+PiBPdmVydmlldzoKPj4gLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+IElQRSBpcyBhIExpbnV4IFNlY3VyaXR5IE1vZHVs
ZSwgd2hpY2ggYWxsb3dzIGZvciBhIGNvbmZpZ3VyYWJsZQo+PiBwb2xpY3kgdG8gZW5mb3JjZSBp
bnRlZ3JpdHkgcmVxdWlyZW1lbnRzIG9uIHRoZSB3aG9sZSBzeXN0ZW0uIEl0Cj4+IGF0dGVtcHRz
IHRvIHNvbHZlIHRoZSBpc3N1ZSBvZiBDb2RlIEludGVncml0eTogdGhhdCBhbnkgY29kZSBiZWlu
Zwo+PiBleGVjdXRlZCAob3IgZmlsZXMgYmVpbmcgcmVhZCksIGFyZSBpZGVudGljYWwgdG8gdGhl
IHZlcnNpb24gdGhhdAo+PiB3YXMgYnVpbHQgYnkgYSB0cnVzdGVkIHNvdXJjZS4KPgo+IENhbiB5
b3UgcGxlYXNlIGNsYXJpZnkgdGhlICJtb3RpdmF0aW9uIiBmb3IgdGhpcyBwYXRjaCBzZXQgbW9y
ZSAKPiBjbGVhcmx5PyBJdCBzZWVtcyB0byBkZWZpbmUgYSBwb2xpY3kgbGF5ZXIgb24gdG9wIG9m
IGRtLXZlcml0eSwgd2hpY2ggCj4gbWF5IGJlIGNvbXBpbGVkIGludG8gdGhlIGtlcm5lbC4gSW4g
dGhlIG1vdGl2YXRpb24sIGNhbiB5b3UgcGxlYXNlIAo+IGFsc28gbWFrZSBpdCBleHBsaWNpdCB3
aHkgZXhpc3RpbmcgbWVjaGFuaXNtcyBjYW5ub3QgYmUgZXh0ZW5kZWQgdG8gCj4gYWNoaWV2ZSB5
b3VyIHB1cnBvc2U/Cj4KVGhpcyBMU00gd2FzIGJvcm4gb3V0IG9mIGEgbW90aXZhdGlvbiB0byBw
cm92aWRlIHN0cm9uZyBpbnRlZ3JpdHkgCmd1YXJhbnRlZXMgd2l0aG91dCBhIGRlcGVuZGVuY3kg
b24gZmlsZS1tZXRhZGF0YSwgYWxsb3cgdGhlIGludGVncml0eSAKY2xhaW1zIHRvIGJlIGNvbmZp
Z3VyYWJsZSBvbiBhIGhvdCBzeXN0ZW0sIGFuZCBhbGxvdyBmb3IgdGhlIG1lY2hhbmlzbXMgCmZv
ciBlbnN1cmluZyBpbnRlZ3JpdHkgdG8gYmUgZXh0ZW5kYWJsZS4KClRoaXMgbmF0dXJhbGx5IGhh
ZCB0byBiZSBhbiBMU00sIGFzIGNvbnRyb2xsaW5nIGV4ZWN1dGlvbiBhdCB0aGUgYmxvY2sgCm9y
IGZpbGVzeXN0ZW0gbGF5ZXIgZG9lcyBub3QgbWFrZSBzZW5zZS4gRXhpc3RpbmcgTFNNIGltcGxl
bWVudGF0aW9ucyAKdXNlIGZpbGVzeXN0ZW0gbWV0YWRhdGEsIGFuZCBzaW5jZSBvbmUgb2YgSVBF
J3MgZ29hbHMgaXMgdG8gc2VjdXJlIGZpbGUgCm1ldGFkYXRhLCBpdCBpcyBjaXJjdWxhciB0byBk
ZXBlbmQgb24gdGhlIGZpbGUgbWV0YWRhdGEgaXRzZWxmIHRvIG1ha2UgCmRlY2lzaW9ucyBhYm91
dCB3aGV0aGVyIHRoZSBmaWxlIGhhcyBiZWVuIG1vZGlmaWVkLgoKQWRkaXRpb25hbGx5LCBJUEUg
d2hpbGUgSVBFIGN1cnJlbnRseSBwcm92aWRlcyBkbS12ZXJpdHkgc3VwcG9ydCBhbmQgdGhlIAp0
cnVzdCByb290IHN1cHBvcnQsIGl0IGNhbiBiZSBlYXNpbHkgZXh0ZW5kZWQgdG8gb3RoZXIgaW1w
bGVtZW50YXRpb25zIApzdWNoIGFzIGZzLXZlcml0eS4gQXQgaXQncyBjb3JlLCBJUEUgaXMgYXR0
ZW1wdGluZyB0byBzZXBhcmF0ZSBtZWNoYW5pc20gCihkbS12ZXJpdHksIGZzLXZlcml0eSwgZXRj
LikgZnJvbSBwb2xpY3kgKElQRSkuCgo+IEFsc28sIEFGSUssIHRoZSBjaGFuZ2Vsb2cgc2hvdWxk
IGJlIG1vdmVkIHRvIHRoZSBlbmQgb2YgdGhlIHBhdGNoIAo+IGRlc2NyaXB0aW9uLgo+ClRoYW5r
cyEgSSdsbCBtb3ZlIHRoZSBjaGFuZ2Vsb2cuCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRt
LWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RtLWRldmVs

