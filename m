Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B485762BB7
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jul 2023 08:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690353744;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=8nyOwHPW6hN62aacQdlP6tueKFmQGGxEuNwKyFJPiJU=;
	b=STGHISUJ7hIy4jzX/MdyXsQjcPyjS2HJMCkbHUJWM9+oUwFQCJw5G69SjvfyhCvRJ1RXsw
	GYo66/sXia9bnRSq2auqH8Oc9B1/WhL1C9NXer2OGUgkXGDWojq9mNofrsiXQ+wQFU/0ze
	wjZLZexy4YtLcatyorE3zR2iaEQhTFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-539-GW1aJ_bhMOm-Y1qNv6r7lQ-1; Wed, 26 Jul 2023 02:42:22 -0400
X-MC-Unique: GW1aJ_bhMOm-Y1qNv6r7lQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 40401185A78F;
	Wed, 26 Jul 2023 06:42:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E356E46A3AC;
	Wed, 26 Jul 2023 06:42:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 214A019451F6;
	Wed, 26 Jul 2023 06:42:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 3189E1946589
 for <dm-devel@listman.corp.redhat.com>; Tue, 25 Jul 2023 09:03:12 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AEE5540C206F; Tue, 25 Jul 2023 09:03:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0F8540C2070
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:03:08 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 827F983FC20
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:03:08 +0000 (UTC)
Received: from out-5.mta1.migadu.com (out-5.mta1.migadu.com [95.215.58.5])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-73-kLcfoJ77MpuCeJOp96G0cg-1; Tue,
 25 Jul 2023 05:03:05 -0400
X-MC-Unique: kLcfoJ77MpuCeJOp96G0cg-1
Message-ID: <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
Date: Tue, 25 Jul 2023 17:02:47 +0800
MIME-Version: 1.0
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mailman-Approved-At: Wed, 26 Jul 2023 06:33:26 +0000
Subject: Re: [dm-devel] [PATCH v2 03/47] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, brauner@kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, tytso@mit.edu,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 senozhatsky@chromium.org, gregkh@linuxfoundation.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: linux.dev
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

CgpPbiAyMDIzLzcvMjQgMTc6NDMsIFFpIFpoZW5nIHdyb3RlOgo+IEN1cnJlbnRseSwgdGhlIHNo
cmlua2VyIGluc3RhbmNlcyBjYW4gYmUgZGl2aWRlZCBpbnRvIHRoZSBmb2xsb3dpbmcgdGhyZWUK
PiB0eXBlczoKPgo+IGEpIGdsb2JhbCBzaHJpbmtlciBpbnN0YW5jZSBzdGF0aWNhbGx5IGRlZmlu
ZWQgaW4gdGhlIGtlcm5lbCwgc3VjaCBhcwo+ICAgICB3b3JraW5nc2V0X3NoYWRvd19zaHJpbmtl
ci4KPgo+IGIpIGdsb2JhbCBzaHJpbmtlciBpbnN0YW5jZSBzdGF0aWNhbGx5IGRlZmluZWQgaW4g
dGhlIGtlcm5lbCBtb2R1bGVzLCBzdWNoCj4gICAgIGFzIG1tdV9zaHJpbmtlciBpbiB4ODYuCj4K
PiBjKSBzaHJpbmtlciBpbnN0YW5jZSBlbWJlZGRlZCBpbiBvdGhlciBzdHJ1Y3R1cmVzLgo+Cj4g
Rm9yIGNhc2UgYSwgdGhlIG1lbW9yeSBvZiBzaHJpbmtlciBpbnN0YW5jZSBpcyBuZXZlciBmcmVl
ZC4gRm9yIGNhc2UgYiwKPiB0aGUgbWVtb3J5IG9mIHNocmlua2VyIGluc3RhbmNlIHdpbGwgYmUg
ZnJlZWQgYWZ0ZXIgc3luY2hyb25pemVfcmN1KCkgd2hlbgo+IHRoZSBtb2R1bGUgaXMgdW5sb2Fk
ZWQuIEZvciBjYXNlIGMsIHRoZSBtZW1vcnkgb2Ygc2hyaW5rZXIgaW5zdGFuY2Ugd2lsbAo+IGJl
IGZyZWVkIGFsb25nIHdpdGggdGhlIHN0cnVjdHVyZSBpdCBpcyBlbWJlZGRlZCBpbi4KPgo+IElu
IHByZXBhcmF0aW9uIGZvciBpbXBsZW1lbnRpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmssIHdlIG5l
ZWQgdG8KPiBkeW5hbWljYWxseSBhbGxvY2F0ZSB0aG9zZSBzaHJpbmtlciBpbnN0YW5jZXMgaW4g
Y2FzZSBjLCB0aGVuIHRoZSBtZW1vcnkKPiBjYW4gYmUgZHluYW1pY2FsbHkgZnJlZWQgYWxvbmUg
YnkgY2FsbGluZyBrZnJlZV9yY3UoKS4KPgo+IFNvIHRoaXMgY29tbWl0IGFkZHMgdGhlIGZvbGxv
d2luZyBuZXcgQVBJcyBmb3IgZHluYW1pY2FsbHkgYWxsb2NhdGluZwo+IHNocmlua2VyLCBhbmQg
YWRkIGEgcHJpdmF0ZV9kYXRhIGZpZWxkIHRvIHN0cnVjdCBzaHJpbmtlciB0byByZWNvcmQgYW5k
Cj4gZ2V0IHRoZSBvcmlnaW5hbCBlbWJlZGRlZCBzdHJ1Y3R1cmUuCj4KPiAxLiBzaHJpbmtlcl9h
bGxvYygpCj4KPiBVc2VkIHRvIGFsbG9jYXRlIHNocmlua2VyIGluc3RhbmNlIGl0c2VsZiBhbmQg
cmVsYXRlZCBtZW1vcnksIGl0IHdpbGwKPiByZXR1cm4gYSBwb2ludGVyIHRvIHRoZSBzaHJpbmtl
ciBpbnN0YW5jZSBvbiBzdWNjZXNzIGFuZCBOVUxMIG9uIGZhaWx1cmUuCj4KPiAyLiBzaHJpbmtl
cl9mcmVlX25vbl9yZWdpc3RlcmVkKCkKPgo+IFVzZWQgdG8gZGVzdHJveSB0aGUgbm9uLXJlZ2lz
dGVyZWQgc2hyaW5rZXIgaW5zdGFuY2UuCgpBdCBsZWFzdCBJIGRvbid0IGxpa2UgdGhpcyBuYW1l
LiBJIGtub3cgeW91IHdhbnQgdG8gdGVsbCBvdGhlcnMKdGhpcyBmdW5jdGlvbiBvbmx5IHNob3Vs
ZCBiZSBjYWxsZWQgd2hlbiBzaHJpbmtlciBoYXMgbm90IGJlZW4KcmVnaXN0ZWQgYnV0IGFsbG9j
YXRlZC4gTWF5YmUgc2hyaW5rZXJfZnJlZSgpIGlzIG1vcmUgc2ltcGxlLgpBbmQgYW5kIGEgY29t
bWVudCB0byB0ZWxsIHRoZSB1c2VycyB3aGVuIHRvIHVzZSBpdC4KCj4KPiAzLiBzaHJpbmtlcl9y
ZWdpc3RlcigpCj4KPiBVc2VkIHRvIHJlZ2lzdGVyIHRoZSBzaHJpbmtlciBpbnN0YW5jZSwgd2hp
Y2ggaXMgc2FtZSBhcyB0aGUgY3VycmVudAo+IHJlZ2lzdGVyX3Nocmlua2VyX3ByZXBhcmVkKCku
Cj4KPiA0LiBzaHJpbmtlcl91bnJlZ2lzdGVyKCkKPgo+IFVzZWQgdG8gdW5yZWdpc3RlciBhbmQg
ZnJlZSB0aGUgc2hyaW5rZXIgaW5zdGFuY2UuCj4KPiBJbiBvcmRlciB0byBzaW1wbGlmeSBzaHJp
bmtlci1yZWxhdGVkIEFQSXMgYW5kIG1ha2Ugc2hyaW5rZXIgbW9yZQo+IGluZGVwZW5kZW50IG9m
IG90aGVyIGtlcm5lbCBtZWNoYW5pc21zLCBzdWJzZXF1ZW50IHN1Ym1pc3Npb25zIHdpbGwgdXNl
Cj4gdGhlIGFib3ZlIEFQSSB0byBjb252ZXJ0IGFsbCBzaHJpbmtlcnMgKGluY2x1ZGluZyBjYXNl
IGEgYW5kIGIpIHRvCj4gZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBhbmQgdGhlbiByZW1vdmUgYWxs
IGV4aXN0aW5nIEFQSXMuCj4KPiBUaGlzIHdpbGwgYWxzbyBoYXZlIGFub3RoZXIgYWR2YW50YWdl
IG1lbnRpb25lZCBieSBEYXZlIENoaW5uZXI6Cj4KPiBgYGAKPiBUaGUgb3RoZXIgYWR2YW50YWdl
IG9mIHRoaXMgaXMgdGhhdCBpdCB3aWxsIGJyZWFrIGFsbCB0aGUgZXhpc3RpbmcKPiBvdXQgb2Yg
dHJlZSBjb2RlIGFuZCB0aGlyZCBwYXJ0eSBtb2R1bGVzIHVzaW5nIHRoZSBvbGQgQVBJIGFuZCB3
aWxsCj4gbm8gbG9uZ2VyIHdvcmsgd2l0aCBhIGtlcm5lbCB1c2luZyBsb2NrbGVzcyBzbGFiIHNo
cmlua2Vycy4gVGhleQo+IG5lZWQgdG8gYnJlYWsgKGJvdGggYXQgdGhlIHNvdXJjZSBhbmQgYmlu
YXJ5IGxldmVscykgdG8gc3RvcCBiYWQKPiB0aGluZ3MgZnJvbSBoYXBwZW5pbmcgZHVlIHRvIHVz
aW5nIHVuY292ZXJ0ZWQgc2hyaW5rZXJzIGluIHRoZSBuZXcKPiBzZXR1cC4KPiBgYGAKPgo+IFNp
Z25lZC1vZmYtYnk6IFFpIFpoZW5nIDx6aGVuZ3FpLmFyY2hAYnl0ZWRhbmNlLmNvbT4KPiAtLS0K
PiAgIGluY2x1ZGUvbGludXgvc2hyaW5rZXIuaCB8ICAgNiArKysKPiAgIG1tL3Nocmlua2VyLmMg
ICAgICAgICAgICB8IDExMyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysK
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L3Nocmlua2VyLmggYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKPiBpbmRl
eCA5NjFjYjg0ZTUxZjUuLjI5NmY1ZTE2Mzg2MSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4
L3Nocmlua2VyLmgKPiArKysgYi9pbmNsdWRlL2xpbnV4L3Nocmlua2VyLmgKPiBAQCAtNzAsNiAr
NzAsOCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+ICAgCWludCBzZWVrczsJLyogc2Vla3MgdG8gcmVj
cmVhdGUgYW4gb2JqICovCj4gICAJdW5zaWduZWQgZmxhZ3M7Cj4gICAKPiArCXZvaWQgKnByaXZh
dGVfZGF0YTsKPiArCj4gICAJLyogVGhlc2UgYXJlIGZvciBpbnRlcm5hbCB1c2UgKi8KPiAgIAlz
dHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4gICAjaWZkZWYgQ09ORklHX01FTUNHCj4gQEAgLTk4LDYg
KzEwMCwxMCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+ICAgCj4gICB1bnNpZ25lZCBsb25nIHNocmlu
a19zbGFiKGdmcF90IGdmcF9tYXNrLCBpbnQgbmlkLCBzdHJ1Y3QgbWVtX2Nncm91cCAqbWVtY2cs
Cj4gICAJCQkgIGludCBwcmlvcml0eSk7Cj4gK3N0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXJfYWxs
b2ModW5zaWduZWQgaW50IGZsYWdzLCBjb25zdCBjaGFyICpmbXQsIC4uLik7Cj4gK3ZvaWQgc2hy
aW5rZXJfZnJlZV9ub25fcmVnaXN0ZXJlZChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPiAr
dm9pZCBzaHJpbmtlcl9yZWdpc3RlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPiArdm9p
ZCBzaHJpbmtlcl91bnJlZ2lzdGVyKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpOwo+ICAgCj4g
ICBleHRlcm4gaW50IF9fcHJpbnRmKDIsIDMpIHByZWFsbG9jX3Nocmlua2VyKHN0cnVjdCBzaHJp
bmtlciAqc2hyaW5rZXIsCj4gICAJCQkJCSAgICBjb25zdCBjaGFyICpmbXQsIC4uLik7Cj4gZGlm
ZiAtLWdpdCBhL21tL3Nocmlua2VyLmMgYi9tbS9zaHJpbmtlci5jCj4gaW5kZXggMGEzMmVmNDJm
MmE3Li5kODIwZTRjYzU4MDYgMTAwNjQ0Cj4gLS0tIGEvbW0vc2hyaW5rZXIuYwo+ICsrKyBiL21t
L3Nocmlua2VyLmMKPiBAQCAtNTQ4LDYgKzU0OCwxMTkgQEAgdW5zaWduZWQgbG9uZyBzaHJpbmtf
c2xhYihnZnBfdCBnZnBfbWFzaywgaW50IG5pZCwgc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLAo+
ICAgCXJldHVybiBmcmVlZDsKPiAgIH0KPiAgIAo+ICtzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2Vy
X2FsbG9jKHVuc2lnbmVkIGludCBmbGFncywgY29uc3QgY2hhciAqZm10LCAuLi4pCj4gK3sKPiAr
CXN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXI7Cj4gKwl1bnNpZ25lZCBpbnQgc2l6ZTsKPiArCXZh
X2xpc3QgX19tYXliZV91bnVzZWQgYXA7Cj4gKwlpbnQgZXJyOwo+ICsKPiArCXNocmlua2VyID0g
a3phbGxvYyhzaXplb2Yoc3RydWN0IHNocmlua2VyKSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAoIXNo
cmlua2VyKQo+ICsJCXJldHVybiBOVUxMOwo+ICsKPiArI2lmZGVmIENPTkZJR19TSFJJTktFUl9E
RUJVRwo+ICsJdmFfc3RhcnQoYXAsIGZtdCk7Cj4gKwlzaHJpbmtlci0+bmFtZSA9IGt2YXNwcmlu
dGZfY29uc3QoR0ZQX0tFUk5FTCwgZm10LCBhcCk7Cj4gKwl2YV9lbmQoYXApOwo+ICsJaWYgKCFz
aHJpbmtlci0+bmFtZSkKPiArCQlnb3RvIGVycl9uYW1lOwo+ICsjZW5kaWYKClNvIHdoeSBub3Qg
aW50cm9kdWNlIGFub3RoZXIgaGVscGVyIHRvIGhhbmRsZSB0aGlzIGFuZCBkZWNsYXJlIGl0CmFz
IGEgdm9pZCBmdW5jdGlvbiB3aGVuICFDT05GSUdfU0hSSU5LRVJfREVCVUc/IFNvbWV0aGluZyBs
aWtlIHRoZQpmb2xsb3dpbmc6CgojaWZkZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCnN0YXRpYyBp
bnQgc2hyaW5rZXJfZGVidWdmc19uYW1lX2FsbG9jKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIs
IGNvbnN0IApjaGFyICpmbXQsCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKg
wqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKgIHZhX2xpc3QgdmFyZ3MpCgp7CiDCoMKgwqAg
c2hyaW5rZXItPm5hbWUgPSBrdmFzcHJpbnRmX2NvbnN0KEdGUF9LRVJORUwsIGZtdCwgdmFyZ3Mp
OwogwqDCoMKgIHJldHVybiBzaHJpbmtlci0+bmFtZSA/IDAgOiAtRU5PTUVNOwp9CiNlbHNlCnN0
YXRpYyBpbnQgc2hyaW5rZXJfZGVidWdmc19uYW1lX2FsbG9jKHN0cnVjdCBzaHJpbmtlciAqc2hy
aW5rZXIsIGNvbnN0IApjaGFyICpmbXQsCiDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKgIHZhX2xpc3QgdmFyZ3MpCnsKIMKg
wqDCoCByZXR1cm4gMDsKfQojZW5kaWYKCj4gKwlzaHJpbmtlci0+ZmxhZ3MgPSBmbGFnczsKPiAr
Cj4gKwlpZiAoZmxhZ3MgJiBTSFJJTktFUl9NRU1DR19BV0FSRSkgewo+ICsJCWVyciA9IHByZWFs
bG9jX21lbWNnX3Nocmlua2VyKHNocmlua2VyKTsKPiArCQlpZiAoZXJyID09IC1FTk9TWVMpCj4g
KwkJCXNocmlua2VyLT5mbGFncyAmPSB+U0hSSU5LRVJfTUVNQ0dfQVdBUkU7Cj4gKwkJZWxzZSBp
ZiAoZXJyID09IDApCj4gKwkJCWdvdG8gZG9uZTsKPiArCQllbHNlCj4gKwkJCWdvdG8gZXJyX2Zs
YWdzOwo+ICsJfQo+ICsKPiArCS8qCj4gKwkgKiBUaGUgbnJfZGVmZXJyZWQgaXMgYXZhaWxhYmxl
IG9uIHBlciBtZW1jZyBsZXZlbCBmb3IgbWVtY2cgYXdhcmUKPiArCSAqIHNocmlua2Vycywgc28g
b25seSBhbGxvY2F0ZSBucl9kZWZlcnJlZCBpbiB0aGUgZm9sbG93aW5nIGNhc2VzOgo+ICsJICog
IC0gbm9uIG1lbWNnIGF3YXJlIHNocmlua2Vycwo+ICsJICogIC0gIUNPTkZJR19NRU1DRwo+ICsJ
ICogIC0gbWVtY2cgaXMgZGlzYWJsZWQgYnkga2VybmVsIGNvbW1hbmQgbGluZQo+ICsJICovCj4g
KwlzaXplID0gc2l6ZW9mKCpzaHJpbmtlci0+bnJfZGVmZXJyZWQpOwo+ICsJaWYgKGZsYWdzICYg
U0hSSU5LRVJfTlVNQV9BV0FSRSkKPiArCQlzaXplICo9IG5yX25vZGVfaWRzOwo+ICsKPiArCXNo
cmlua2VyLT5ucl9kZWZlcnJlZCA9IGt6YWxsb2Moc2l6ZSwgR0ZQX0tFUk5FTCk7Cj4gKwlpZiAo
IXNocmlua2VyLT5ucl9kZWZlcnJlZCkKPiArCQlnb3RvIGVycl9mbGFnczsKPiArCj4gK2RvbmU6
Cj4gKwlyZXR1cm4gc2hyaW5rZXI7Cj4gKwo+ICtlcnJfZmxhZ3M6Cj4gKyNpZmRlZiBDT05GSUdf
U0hSSU5LRVJfREVCVUcKPiArCWtmcmVlX2NvbnN0KHNocmlua2VyLT5uYW1lKTsKPiArCXNocmlu
a2VyLT5uYW1lID0gTlVMTDsKClRoaXMgY291bGQgYmUgc2hyaW5rZXJfZGVidWdmc19uYW1lX2Zy
ZWUoKQoKPiArZXJyX25hbWU6Cj4gKyNlbmRpZgo+ICsJa2ZyZWUoc2hyaW5rZXIpOwo+ICsJcmV0
dXJuIE5VTEw7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChzaHJpbmtlcl9hbGxvYyk7Cj4gKwo+ICt2
b2lkIHNocmlua2VyX2ZyZWVfbm9uX3JlZ2lzdGVyZWQoc3RydWN0IHNocmlua2VyICpzaHJpbmtl
cikKPiArewo+ICsjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCj4gKwlrZnJlZV9jb25zdChz
aHJpbmtlci0+bmFtZSk7Cj4gKwlzaHJpbmtlci0+bmFtZSA9IE5VTEw7CgpUaGlzIGNvdWxkIGJl
IHNocmlua2VyX2RlYnVnZnNfbmFtZV9mcmVlKCkKCj4gKyNlbmRpZgo+ICsJaWYgKHNocmlua2Vy
LT5mbGFncyAmIFNIUklOS0VSX01FTUNHX0FXQVJFKSB7Cj4gKwkJZG93bl93cml0ZSgmc2hyaW5r
ZXJfcndzZW0pOwo+ICsJCXVucmVnaXN0ZXJfbWVtY2dfc2hyaW5rZXIoc2hyaW5rZXIpOwo+ICsJ
CXVwX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4gKwl9Cj4gKwo+ICsJa2ZyZWUoc2hyaW5rZXIt
Pm5yX2RlZmVycmVkKTsKPiArCXNocmlua2VyLT5ucl9kZWZlcnJlZCA9IE5VTEw7Cj4gKwo+ICsJ
a2ZyZWUoc2hyaW5rZXIpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woc2hyaW5rZXJfZnJlZV9ub25f
cmVnaXN0ZXJlZCk7Cj4gKwo+ICt2b2lkIHNocmlua2VyX3JlZ2lzdGVyKHN0cnVjdCBzaHJpbmtl
ciAqc2hyaW5rZXIpCj4gK3sKPiArCWRvd25fd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPiArCWxp
c3RfYWRkX3RhaWwoJnNocmlua2VyLT5saXN0LCAmc2hyaW5rZXJfbGlzdCk7Cj4gKwlzaHJpbmtl
ci0+ZmxhZ3MgfD0gU0hSSU5LRVJfUkVHSVNURVJFRDsKPiArCXNocmlua2VyX2RlYnVnZnNfYWRk
KHNocmlua2VyKTsKPiArCXVwX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4gK30KPiArRVhQT1JU
X1NZTUJPTChzaHJpbmtlcl9yZWdpc3Rlcik7Cj4gKwo+ICt2b2lkIHNocmlua2VyX3VucmVnaXN0
ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKCllvdSBoYXZlIG1hZGUgYWxsIHNocmlua2Vy
cyB0byBiZSBkeW5hbWljYWxseSBhbGxvY2F0ZWQsIHNvCndlIHNob3VsZCBwcmV2ZW50IHVzZXJz
IGZyb20gYWxsb2NhdGluZyBzaHJpbmtlcnMgc3RhdGljYWxseSBhbmQKdXNlIHRoaXMgZnVuY3Rp
b24gdG8gdW5yZWdpc3RlciBpdC4gSXQgaXMgYmV0dGVyIHRvIGFkZCBhCmZsYWcgbGlrZSBTSFJJ
TktFUl9BTExPQ0FURUQgd2hpY2ggaXMgc2V0IGluIHNocmlua2VyX2FsbG9jKCksCmFuZCBjaGVj
ayB3aGV0aGVyIGl0IGlzIHNldCBpbiBzaHJpbmtlcl91bnJlZ2lzdGVyKCksIGlmIG5vdAptYXli
ZSBhIHdhcm5pbmcgc2hvdWxkIGJlIGFkZGVkIHRvIHRlbGwgdGhlIHVzZXJzIHdoYXQgaGFwcGVu
ZWQuCgo+ICt7Cj4gKwlzdHJ1Y3QgZGVudHJ5ICpkZWJ1Z2ZzX2VudHJ5Owo+ICsJaW50IGRlYnVn
ZnNfaWQ7Cj4gKwo+ICsJaWYgKCFzaHJpbmtlciB8fCAhKHNocmlua2VyLT5mbGFncyAmIFNIUklO
S0VSX1JFR0lTVEVSRUQpKQo+ICsJCXJldHVybjsKPiArCj4gKwlkb3duX3dyaXRlKCZzaHJpbmtl
cl9yd3NlbSk7Cj4gKwlsaXN0X2RlbCgmc2hyaW5rZXItPmxpc3QpOwo+ICsJc2hyaW5rZXItPmZs
YWdzICY9IH5TSFJJTktFUl9SRUdJU1RFUkVEOwo+ICsJaWYgKHNocmlua2VyLT5mbGFncyAmIFNI
UklOS0VSX01FTUNHX0FXQVJFKQo+ICsJCXVucmVnaXN0ZXJfbWVtY2dfc2hyaW5rZXIoc2hyaW5r
ZXIpOwo+ICsJZGVidWdmc19lbnRyeSA9IHNocmlua2VyX2RlYnVnZnNfZGV0YWNoKHNocmlua2Vy
LCAmZGVidWdmc19pZCk7CgpJbiB0aGUgaW50ZXJuYWwgb2YgdGhpcyBmdW5jdGlvbiwgeW91IGFs
c28gY291bGQgdXNlCnNocmlua2VyX2RlYnVnZnNfbmFtZV9mcmVlKCkuCgpUaGFua3MuCgo+ICsJ
dXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPiArCj4gKwlzaHJpbmtlcl9kZWJ1Z2ZzX3JlbW92
ZShkZWJ1Z2ZzX2VudHJ5LCBkZWJ1Z2ZzX2lkKTsKPiArCj4gKwlrZnJlZShzaHJpbmtlci0+bnJf
ZGVmZXJyZWQpOwo+ICsJc2hyaW5rZXItPm5yX2RlZmVycmVkID0gTlVMTDsKPiArCj4gKwlrZnJl
ZShzaHJpbmtlcik7Cj4gK30KPiArRVhQT1JUX1NZTUJPTChzaHJpbmtlcl91bnJlZ2lzdGVyKTsK
PiArCj4gICAvKgo+ICAgICogQWRkIGEgc2hyaW5rZXIgY2FsbGJhY2sgdG8gYmUgY2FsbGVkIGZy
b20gdGhlIHZtLgo+ICAgICovCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRl
dmVsCg==

