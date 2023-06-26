Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 737FF73DF17
	for <lists+dm-devel@lfdr.de>; Mon, 26 Jun 2023 14:26:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687782361;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fikNXaNFAOjylvdQUxI/kARh0+byfj9o27k6FK2QN+w=;
	b=c4TxNh/aWz786KsLURf7Wy1aGz4hdV7EXn5XogG4eyZ+MoUxkgHdtzcRhIgGkB5d0CCrAi
	y617giYhTI8EoWF4e9YtN1IePCgwHXmX00VOuWKmowgSa0vYNeUdBx+zPxrynkusml1D5C
	XQ0l1JTHenTfpWq7wpRdaj73v8mpITU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-4gVLkSesOReokJ9VBI_iWw-1; Mon, 26 Jun 2023 08:25:59 -0400
X-MC-Unique: 4gVLkSesOReokJ9VBI_iWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED63B185A78B;
	Mon, 26 Jun 2023 12:25:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 933872166B25;
	Mon, 26 Jun 2023 12:25:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 7B05F1946A62;
	Mon, 26 Jun 2023 12:25:31 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 59BCA1946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 26 Jun 2023 12:25:30 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E95F7200B677; Mon, 26 Jun 2023 12:25:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from [10.45.226.134] (unknown [10.45.226.134])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 65629200C0F2;
 Mon, 26 Jun 2023 12:25:28 +0000 (UTC)
Message-ID: <2096ab6c-7a14-85bb-22d6-3189507c4783@redhat.com>
Date: Mon, 26 Jun 2023 14:25:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Li Lingfeng <lilingfeng3@huawei.com>, dm-devel@redhat.com
References: <faeb60a9-8bde-d31d-acf5-a2bcda6cad72@huawei.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
In-Reply-To: <faeb60a9-8bde-d31d-acf5-a2bcda6cad72@huawei.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: Re: [dm-devel] [Question] Can DATA_DEV_BLOCK_SIZE_MIN_SECTORS be
 set to a smaller value
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

RG5lIDI2LiAwNi4gMjMgdiAxNDoxOSBMaSBMaW5nZmVuZyBuYXBzYWwoYSk6Cj4gSGVsbG86Cj4K
PiBSZWNlbnRseSwgSSBmb3VuZCB0aGF0IHRoZSB1c2VkIHNwYWNlIG9mIHRoZSB0aGluLXBvb2wg
d2lsbCBrZWVwIHJpc2luZyBpZiBJIAo+IHVzZSBkbS10aGluIGFzIGZvbGxvdzoKPgo+IC8vIGNy
ZWF0ZSBkbS10aGluCj4gZG1zZXR1cCBjcmVhdGUgbGluZWFyXzEgLS10YWJsZSAiMCAyMDk3MTUy
IGxpbmVhciAvZGV2L3NkYyAwIgo+IGRtc2V0dXAgY3JlYXRlIGxpbmVhcl8yIC0tdGFibGUgIjAg
MTY3NzcyMTbCoCBsaW5lYXIgL2Rldi9zZGMgMjA5NzE1MyIKPiBkZCBpZj0vZGV2L3plcm8gb2Y9
L2Rldi9tYXBwZXIvbGluZWFyXzEgYnM9NDA5NiBjb3VudD0xCj4gZG1zZXR1cCBjcmVhdGUgcG9v
bCAtLXRhYmxlICIwIDE2Nzc3MjE2IHRoaW4tcG9vbCAvZGV2L21hcHBlci9saW5lYXJfMSAKPiAv
ZGV2L21hcHBlci9saW5lYXJfMiAxMjggMCAxIHNraXBfYmxvY2tfemVyb2luZyIKPiBkbXNldHVw
IG1lc3NhZ2UgL2Rldi9tYXBwZXIvcG9vbCAwICJjcmVhdGVfdGhpbiAwIgo+IGRtc2V0dXAgY3Jl
YXRlIHRoaW4gLS10YWJsZSAiMCAxNDY4MDA2NCB0aGluIC9kZXYvbWFwcGVyL3Bvb2wgMCIKPgo+
IC8vIG1rZnMgYW5kIG1vdW50IHdpdGggZGlzY2FyZAo+IG1rZnMuZXh0NCAvZGV2L21hcHBlci90
aGluCj4gbW91bnQgL2Rldi9tYXBwZXIvdGhpbiAvbW50L3Rlc3QgLW8gZGlzY2FyZAo+IGNkIC9t
bnQvdGVzdAo+Cj4gLy8gY3JlYXRlIGEgZmlsZSgxN0tCKQo+IGRkIGlmPS9kZXYvcmFuZG9tIG9m
PXRlc3RmaWxlIGJzPTFrIGNvdW50PTE3IG9mbGFnPWRpcmVjdAo+IHN5bmMKPgo+IC8vIHRydW5j
YXRlIHRoZSBmaWxlIGFuZCB3cml0ZSBpdCBmb3IgbWFueSB0aW1lcwo+IGRkIGlmPS9kZXYvcmFu
ZG9tIG9mPXRlc3RmaWxlIGJzPTFrIGNvdW50PTE3IG9mbGFnPWRpcmVjdAo+IHN5bmMKPiAuLi4K
Pgo+IEV4dDQgd2lsbCBpc3N1ZSBkaXNjYXJkIElPIHRvIGRtLXRoaW4gd2hlbiB0cnVuY2F0aW5n
IGZpbGUuIEhvd2V2ZXIsIAo+IERBVEFfREVWX0JMT0NLX1NJWkVfTUlOX1NFQ1RPUlMgaXMgc2V0
IGFzIDY0S0Igd2hpY2ggbWVhbnMgdGhlIGRpc2NhcmQgCj4gY292ZXJzIGxlc3MgdGhhbiBhIGJs
b2NrIHdoZW4gSSB0cnVuY2F0aW5nIGEgMTdLQiBmaWxlLiBBcyB0aGUgcmVzdWx0IG9mIGl0LCAK
PiBkaXNjYXJkIGJpbyB3aWxsIGVuZCBpbiBwcm9jZXNzX2Rpc2NhcmRfYmlvKCksIGFuZCBtb3Jl
IGFuZCBtb3JlIGJsb2NrcyB3aWxsIAo+IGxlYWsuCj4KPiBJJ20gY3VyaW91cyBhYm91dCB0aGUg
cmVhc29uIGJlaGluZCBzZXR0aW5nIERBVEFfREVWX0JMT0NLX1NJWkVfTUlOX1NFQ1RPUlMgCj4g
dG8gNjRLQi4gSXMgdGhlcmUgYW55IHNwZWNpZmljIGNvbnNpZGVyYXRpb24gZm9yIHRoaXM/IFdv
dWxkIGl0IGJlIHBvc3NpYmxlIAo+IHRvIHNldCB0aGlzIG1pbmltdW0gbGltaXQgdG8gYSBzbWFs
bGVyIHZhbHVlLCBzdWNoIGFzIDRLQj8gCgoKSGkKCgpUaGUgbWluaW1hbCBjaHVua3NpemUgZm9y
IHRoaW4tcG9vbCB3YXMgc2VsZWN0ZWQgdG/CoCA2NEsgLSBzbWFsbGVyIHZhbHVlIHdvdWxkIApj
YXVzZSBtYWpvciBleHBhbnNpb24gaW4gdGhlIHVzZWQgJ21ldGFkYXRhJyBzaXplIGFuZCBmdXJ0
aGVyIHNsb3dkb3duIG9mIAptZXRhZGF0YSBtYW5pcHVsYXRpb24gLSBzbyB0aGUgNjRLIHdhcyBz
ZXQgYXMgbWluaW1hbCBzaXplLgoKUmVnYXJkcwoKClpkZW5lawoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

