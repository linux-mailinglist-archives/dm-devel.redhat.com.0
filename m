Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAC067390F
	for <lists+dm-devel@lfdr.de>; Thu, 19 Jan 2023 13:58:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674133110;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r5n+/2a8FOb5Nb9PFUoDJIZlhB3WOI69A7s+1Q44148=;
	b=jH5FHEnmvfwc3ClEAFBRKVgnmvQ7nQDW7hEZh9d8Tk7GATpAfAcKr1QYbDpdcZrtdcaYZp
	HOLvzQQUpD8NCnWKWbojlfIaTRGEu2e6n925xRO6VTH3tQlIStO+OQKodWnAxEdxQkn/7c
	TTgfe3hrE3UH4D/FW074J9l2Ia6MabM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-bjM1RfcKMsqDUrdyQVhSFw-1; Thu, 19 Jan 2023 07:58:28 -0500
X-MC-Unique: bjM1RfcKMsqDUrdyQVhSFw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C3BB4181E3EE;
	Thu, 19 Jan 2023 12:58:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BCA3B2026D68;
	Thu, 19 Jan 2023 12:58:21 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE26C1946A7B;
	Thu, 19 Jan 2023 12:58:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 07FED1946A6D
 for <dm-devel@listman.corp.redhat.com>; Thu, 19 Jan 2023 12:58:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DEB1C2026D76; Thu, 19 Jan 2023 12:58:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.40.193.97] (ovpn-193-97.brq.redhat.com [10.40.193.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D83BB2026D68;
 Thu, 19 Jan 2023 12:58:18 +0000 (UTC)
Message-ID: <87610279-d3f0-85cc-a340-06adf924b488@redhat.com>
Date: Thu, 19 Jan 2023 13:58:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.0
To: Nikos Tsironis <ntsironis@arrikto.com>, Mike Snitzer <snitzer@redhat.com>
References: <20230118122946.20435-1-ntsironis@arrikto.com>
 <Y8geIzYJ4dCeXpEI@redhat.com>
 <2f53c4ee-5bdf-e4e4-2dca-46ae4e22c312@arrikto.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <2f53c4ee-5bdf-e4e4-2dca-46ae4e22c312@arrikto.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [PATCH 0/2] dm era: avoid deadlock when swapping
 table with dm-era target
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com, snitzer@kernel.org, ejt@redhat.com, agk@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDE5LiAwMS4gMjMgdiAxMDozNiBOaWtvcyBUc2lyb25pcyBuYXBzYWwoYSk6Cj4gT24gMS8x
OC8yMyAxODoyOCwgTWlrZSBTbml0emVyIHdyb3RlOgo+PiBPbiBXZWQsIEphbiAxOCAyMDIzIGF0
wqAgNzoyOVAgLTA1MDAsCj4+IE5pa29zIFRzaXJvbmlzIDxudHNpcm9uaXNAYXJyaWt0by5jb20+
IHdyb3RlOgo+Pgo+Pgo+Cj4gSGkgTWlrZSwKPgo+IFRoYW5rcyBmb3IgdGhlIHF1aWNrIHJlcGx5
Lgo+Cj4gSSBjb3VsZG4ndCBmaW5kIHRoaXMgY29uc3RyYWludCBkb2N1bWVudGVkIGFueXdoZXJl
IGFuZCBzaW5jZSB0aGUKPiB2YXJpb3VzIERNIHRhcmdldHMgc2VlbSB0byBhbGxvdyBtZXNzYWdl
IG9wZXJhdGlvbnMgd2hpbGUgdGhlIGRldmljZSBpcwo+IHN1c3BlbmRlZCBJIGRyZXcgdGhlIHdy
b25nIGNvbmNsdXNpb24uCgpIacKgIE5pa29zCgoKU29tZSBub3RlcyBmcm9tIGx2bTIgZGV2ZWxv
cGVyIC0gd2Ugd29yayB3aXRoIHRoZXNlIGNvbnN0cmFpbnM6CgpETSB0YXJnZXQgc2hvdWxkwqAg
bm90IG5lZWQgdG8gYWxsb2NhdGUgYnVuY2ggb2YgbWVtb3J5IHdoaWxlIHN1c3BlbmRlZCAodGFy
Z2V0IApzaG91bGQgcHJlYWxsb2NhdGVkIHBvb2wgb2Ygc29tZSBtZW1vcnkgaWYgaXQgcmVhbGx5
IG5lZWRzIHRvIGRvIGl0IGluIHRoaXMgY2FzZSkuCgpETSB0YXJnZXQgc2hvdWxkIGNoZWNrIGFu
ZCBhbGxvY2F0ZSBldmVyeXRoaW5nIGl0IGNhbiBpbiB0aGUgJ2xvYWQnIHBoYXNlIGFuZCAKZXJy
b3IgYXMgZWFybHkgYXMgcG9zc2libHkgKHNvIGxvYWRlZCBpbmFjdGl2ZSB0YWJsZSBjYW4gYmUg
Y2xlYXJlZC9kcm9wcGVkIAphbmQgJ3Jlc3VtZScgdGFyZ2V0IGNhbiBjb250aW51ZSBpdHMgd29y
aykuCgpFcnJvciBpbiBzdXNwZW5kIHBoYXNlIGlzIHR5cGljYWxseSB0aGUgbGFzdCBtb21lbnQg
LXdlIGNhbiBoYW5kbGUgZmFpbHVyZSAKJ3NvbWVob3cnLgoKSGFuZGxpbmcgZmFpbHVyZSBpbiAn
cmVzdW1lJyBpcyBhIGNhbiBvZiB3b3JtIHdpdGggbm8gZ29vZCBzb2x1dGlvbiAtIHNvIApyZXN1
bWUgcmVhbGx5IHNob3VsZCBkbyBhcyBtaW5pbWFsIGFzIHBvc3NpYmxlIGFuZCBzaG91bGQgd29y
ayB3aXRoIGV2ZXJ5dGhpbmcgCmFscmVhZHkgcHJlcGFyZWQgZnJvbSBsb2FkICYgc3VzcGVuZC4K
CidETSBzdGF0dXMvaW5mbyfCoCBzaG91bGQgd29yayB3aGlsZSBkZXZpY2UgaXMgc3VzcGVuZCAt
IGJ1dCBubyBhbGxvY2F0aW9uIApzaG91bGQgYmUgbmVlZGVkIGluIHRoaXMgY2FzZSB0byBwcm9k
dWNlIHJlc3VsdC4KClNlbmRpbmcgbWVzc2FnZXMgdG8gYSBzdXNwZW5kZWQgdGFyZ2V0IHNob3Vs
ZCBub3QgYmUgbmVlZGVkIC0gaWYgaXQgaXMgLSBpdCAKc2hvdWxkIGJlIG1vc3QgbGlrZWx5IHNv
bHZlZCB2aWHCoCAndGFibGUgcmVsb2FkJyBjaGFuZ2UgKHRhcmdldCBkZXNpZ24gY2hhbmdlKS4K
CkxvYWRpbmcgdG8gdGhlIGluYWN0aXZlIHRhYmxlIHNsb3Qgc2hvdWxkIG5vdCBiZSBicmVhayBh
bnl0aGluZyBmb3IgdGhlIGFjdGl2ZSAKdGFibGUgc2xvdMKgICh0YWJsZSBjbGVhciBzaGFsbCBy
ZXN1bWUgYXQgc3VzcGVuZCBwb2ludCkuCgpTdXJlbHkgdGhlIGxpc3QgY291bGQgZ28gbG9uZ2Vy
IC0gYnV0IHRoZXNlIGJhc2ljcyBhcmUgY3J1Y2lhbC4KCgpSZWdhcmRzCgpaZGVuZWsKCi0tCmRt
LWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

