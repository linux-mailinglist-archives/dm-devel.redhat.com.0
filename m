Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCCA762B78
	for <lists+dm-devel@lfdr.de>; Wed, 26 Jul 2023 08:33:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690353225;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p6uVZmg544swhUnxix6bQgyDXmFatmA9huxgifs58Uk=;
	b=UdrUk3Q9Xqp8orOecqq3XApxAhGwGY426wwVBR8CyuGgEUHBqSEMsNodu+k4Cjg8MuN0F8
	EUtY4aWTGFBRIbBZpsv2FrsFugcyeLN9ORFR63AJMsh2/Ic+9JiA83kUtIkbmkH6g+lSb7
	OYtn/OC2uCoseHZd9cf8LgzKlox6RaQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-684-DELT3aHzM3ma9jHAf2fAxQ-1; Wed, 26 Jul 2023 02:33:41 -0400
X-MC-Unique: DELT3aHzM3ma9jHAf2fAxQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 168FE185A791;
	Wed, 26 Jul 2023 06:33:39 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F1E1201EE6E;
	Wed, 26 Jul 2023 06:33:36 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DBDB219452C2;
	Wed, 26 Jul 2023 06:33:35 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 962501946587
 for <dm-devel@listman.corp.redhat.com>; Tue, 25 Jul 2023 09:56:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 828B82166B27; Tue, 25 Jul 2023 09:56:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A9272166B25
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:56:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5435C1C34081
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 09:56:51 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-9nxtKJIGNfWU6vv0wZQCcQ-1; Tue, 25 Jul 2023 05:56:46 -0400
X-MC-Unique: 9nxtKJIGNfWU6vv0wZQCcQ-1
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2659b1113c2so706746a91.1
 for <dm-devel@redhat.com>; Tue, 25 Jul 2023 02:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690279003; x=1690883803;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/casiWQBa8FLPDyI/Gjog1Q/iFy65e/7JWaM5Gwrppw=;
 b=h1iH2VVYDMTp0kUvw5v4TxxjGiWdIZ57+6OEBOjjYtPApub7ZTIfqbugZ0bmNbd42D
 6GOfkYd+G5BZbeQKAFIdld+xISgqmRqpRQeCJCdVJGtR3MBlAyrSR/esZ9lrMpU8iDX3
 UTDURi43Q5mdfpLfT767Q4AMLcopTOwGgQhgcyxF85E/VAlqXoml6OIOinLn9er3gdxW
 8aRSIXsZweOx26NgUoRdMUByaLZoWQHfBRzCr5V1I1oHydwYEUbWxzHbWTYa86n0Ux+t
 cfiFeuPk3Z7I+2ey3WRUaJDjoQBpeAvbuCkI9TI2ajvpNePlgLJknnTsrIK9jPpQEJ3G
 6RqA==
X-Gm-Message-State: ABy/qLZxIq1Xcmc/IBKy0Mcn6M2mcgac8F9ZsnrrtfzvQ0FLtaDGjY30
 0PdzfFAxiPZJgilkPcAkXrmiTg==
X-Google-Smtp-Source: APBJJlE4g3zxacKAsn4H4YysRKAp71VN9gqUpsqodFXfAXxBRsoAel6FjePiWo+WkUy1agkNvA6LJQ==
X-Received: by 2002:a17:90a:74cf:b0:268:196f:9656 with SMTP id
 p15-20020a17090a74cf00b00268196f9656mr4627258pjl.1.1690279003192; 
 Tue, 25 Jul 2023 02:56:43 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a170902da8800b001b39ffff838sm10605398plx.25.2023.07.25.02.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jul 2023 02:56:42 -0700 (PDT)
Message-ID: <c1a1952f-0c3e-2fa1-fdf9-8b3b8a592b23@bytedance.com>
Date: Tue, 25 Jul 2023 17:56:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
To: Muchun Song <muchun.song@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
 <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <3648ca69-d65e-8431-135a-a5738586bc25@linux.dev>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: bytedance.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

SGkgTXVjaHVuLAoKT24gMjAyMy83LzI1IDE3OjAyLCBNdWNodW4gU29uZyB3cm90ZToKPiAKPiAK
PiBPbiAyMDIzLzcvMjQgMTc6NDMsIFFpIFpoZW5nIHdyb3RlOgo+PiBDdXJyZW50bHksIHRoZSBz
aHJpbmtlciBpbnN0YW5jZXMgY2FuIGJlIGRpdmlkZWQgaW50byB0aGUgZm9sbG93aW5nIHRocmVl
Cj4+IHR5cGVzOgo+Pgo+PiBhKSBnbG9iYWwgc2hyaW5rZXIgaW5zdGFuY2Ugc3RhdGljYWxseSBk
ZWZpbmVkIGluIHRoZSBrZXJuZWwsIHN1Y2ggYXMKPj4gwqDCoMKgIHdvcmtpbmdzZXRfc2hhZG93
X3Nocmlua2VyLgo+Pgo+PiBiKSBnbG9iYWwgc2hyaW5rZXIgaW5zdGFuY2Ugc3RhdGljYWxseSBk
ZWZpbmVkIGluIHRoZSBrZXJuZWwgbW9kdWxlcywgCj4+IHN1Y2gKPj4gwqDCoMKgIGFzIG1tdV9z
aHJpbmtlciBpbiB4ODYuCj4+Cj4+IGMpIHNocmlua2VyIGluc3RhbmNlIGVtYmVkZGVkIGluIG90
aGVyIHN0cnVjdHVyZXMuCj4+Cj4+IEZvciBjYXNlIGEsIHRoZSBtZW1vcnkgb2Ygc2hyaW5rZXIg
aW5zdGFuY2UgaXMgbmV2ZXIgZnJlZWQuIEZvciBjYXNlIGIsCj4+IHRoZSBtZW1vcnkgb2Ygc2hy
aW5rZXIgaW5zdGFuY2Ugd2lsbCBiZSBmcmVlZCBhZnRlciBzeW5jaHJvbml6ZV9yY3UoKSAKPj4g
d2hlbgo+PiB0aGUgbW9kdWxlIGlzIHVubG9hZGVkLiBGb3IgY2FzZSBjLCB0aGUgbWVtb3J5IG9m
IHNocmlua2VyIGluc3RhbmNlIHdpbGwKPj4gYmUgZnJlZWQgYWxvbmcgd2l0aCB0aGUgc3RydWN0
dXJlIGl0IGlzIGVtYmVkZGVkIGluLgo+Pgo+PiBJbiBwcmVwYXJhdGlvbiBmb3IgaW1wbGVtZW50
aW5nIGxvY2tsZXNzIHNsYWIgc2hyaW5rLCB3ZSBuZWVkIHRvCj4+IGR5bmFtaWNhbGx5IGFsbG9j
YXRlIHRob3NlIHNocmlua2VyIGluc3RhbmNlcyBpbiBjYXNlIGMsIHRoZW4gdGhlIG1lbW9yeQo+
PiBjYW4gYmUgZHluYW1pY2FsbHkgZnJlZWQgYWxvbmUgYnkgY2FsbGluZyBrZnJlZV9yY3UoKS4K
Pj4KPj4gU28gdGhpcyBjb21taXQgYWRkcyB0aGUgZm9sbG93aW5nIG5ldyBBUElzIGZvciBkeW5h
bWljYWxseSBhbGxvY2F0aW5nCj4+IHNocmlua2VyLCBhbmQgYWRkIGEgcHJpdmF0ZV9kYXRhIGZp
ZWxkIHRvIHN0cnVjdCBzaHJpbmtlciB0byByZWNvcmQgYW5kCj4+IGdldCB0aGUgb3JpZ2luYWwg
ZW1iZWRkZWQgc3RydWN0dXJlLgo+Pgo+PiAxLiBzaHJpbmtlcl9hbGxvYygpCj4+Cj4+IFVzZWQg
dG8gYWxsb2NhdGUgc2hyaW5rZXIgaW5zdGFuY2UgaXRzZWxmIGFuZCByZWxhdGVkIG1lbW9yeSwg
aXQgd2lsbAo+PiByZXR1cm4gYSBwb2ludGVyIHRvIHRoZSBzaHJpbmtlciBpbnN0YW5jZSBvbiBz
dWNjZXNzIGFuZCBOVUxMIG9uIGZhaWx1cmUuCj4+Cj4+IDIuIHNocmlua2VyX2ZyZWVfbm9uX3Jl
Z2lzdGVyZWQoKQo+Pgo+PiBVc2VkIHRvIGRlc3Ryb3kgdGhlIG5vbi1yZWdpc3RlcmVkIHNocmlu
a2VyIGluc3RhbmNlLgo+IAo+IEF0IGxlYXN0IEkgZG9uJ3QgbGlrZSB0aGlzIG5hbWUuIEkga25v
dyB5b3Ugd2FudCB0byB0ZWxsIG90aGVycwo+IHRoaXMgZnVuY3Rpb24gb25seSBzaG91bGQgYmUg
Y2FsbGVkIHdoZW4gc2hyaW5rZXIgaGFzIG5vdCBiZWVuCj4gcmVnaXN0ZWQgYnV0IGFsbG9jYXRl
ZC4gTWF5YmUgc2hyaW5rZXJfZnJlZSgpIGlzIG1vcmUgc2ltcGxlLgo+IEFuZCBhbmQgYSBjb21t
ZW50IHRvIHRlbGwgdGhlIHVzZXJzIHdoZW4gdG8gdXNlIGl0LgoKT0ssIGlmIG5vIG9uZSBlbHNl
IG9iamVjdHMsIEkgd2lsbCBjaGFuZ2UgaXQgdG8gc2hyaW5rZXJfZnJlZSgpIGluCnRoZSBuZXh0
IHZlcnNpb24uCgo+IAo+Pgo+PiAzLiBzaHJpbmtlcl9yZWdpc3RlcigpCj4+Cj4+IFVzZWQgdG8g
cmVnaXN0ZXIgdGhlIHNocmlua2VyIGluc3RhbmNlLCB3aGljaCBpcyBzYW1lIGFzIHRoZSBjdXJy
ZW50Cj4+IHJlZ2lzdGVyX3Nocmlua2VyX3ByZXBhcmVkKCkuCj4+Cj4+IDQuIHNocmlua2VyX3Vu
cmVnaXN0ZXIoKQo+Pgo+PiBVc2VkIHRvIHVucmVnaXN0ZXIgYW5kIGZyZWUgdGhlIHNocmlua2Vy
IGluc3RhbmNlLgo+Pgo+PiBJbiBvcmRlciB0byBzaW1wbGlmeSBzaHJpbmtlci1yZWxhdGVkIEFQ
SXMgYW5kIG1ha2Ugc2hyaW5rZXIgbW9yZQo+PiBpbmRlcGVuZGVudCBvZiBvdGhlciBrZXJuZWwg
bWVjaGFuaXNtcywgc3Vic2VxdWVudCBzdWJtaXNzaW9ucyB3aWxsIHVzZQo+PiB0aGUgYWJvdmUg
QVBJIHRvIGNvbnZlcnQgYWxsIHNocmlua2VycyAoaW5jbHVkaW5nIGNhc2UgYSBhbmQgYikgdG8K
Pj4gZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBhbmQgdGhlbiByZW1vdmUgYWxsIGV4aXN0aW5nIEFQ
SXMuCj4+Cj4+IFRoaXMgd2lsbCBhbHNvIGhhdmUgYW5vdGhlciBhZHZhbnRhZ2UgbWVudGlvbmVk
IGJ5IERhdmUgQ2hpbm5lcjoKPj4KPj4gYGBgCj4+IFRoZSBvdGhlciBhZHZhbnRhZ2Ugb2YgdGhp
cyBpcyB0aGF0IGl0IHdpbGwgYnJlYWsgYWxsIHRoZSBleGlzdGluZwo+PiBvdXQgb2YgdHJlZSBj
b2RlIGFuZCB0aGlyZCBwYXJ0eSBtb2R1bGVzIHVzaW5nIHRoZSBvbGQgQVBJIGFuZCB3aWxsCj4+
IG5vIGxvbmdlciB3b3JrIHdpdGggYSBrZXJuZWwgdXNpbmcgbG9ja2xlc3Mgc2xhYiBzaHJpbmtl
cnMuIFRoZXkKPj4gbmVlZCB0byBicmVhayAoYm90aCBhdCB0aGUgc291cmNlIGFuZCBiaW5hcnkg
bGV2ZWxzKSB0byBzdG9wIGJhZAo+PiB0aGluZ3MgZnJvbSBoYXBwZW5pbmcgZHVlIHRvIHVzaW5n
IHVuY292ZXJ0ZWQgc2hyaW5rZXJzIGluIHRoZSBuZXcKPj4gc2V0dXAuCj4+IGBgYAo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBRaSBaaGVuZyA8emhlbmdxaS5hcmNoQGJ5dGVkYW5jZS5jb20+Cj4+IC0t
LQo+PiDCoCBpbmNsdWRlL2xpbnV4L3Nocmlua2VyLmggfMKgwqAgNiArKysKPj4gwqAgbW0vc2hy
aW5rZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMTMgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTE5IGluc2VydGlvbnMo
KykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvc2hyaW5rZXIuaCBiL2luY2x1ZGUv
bGludXgvc2hyaW5rZXIuaAo+PiBpbmRleCA5NjFjYjg0ZTUxZjUuLjI5NmY1ZTE2Mzg2MSAxMDA2
NDQKPj4gLS0tIGEvaW5jbHVkZS9saW51eC9zaHJpbmtlci5oCj4+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvc2hyaW5rZXIuaAo+PiBAQCAtNzAsNiArNzAsOCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+PiDC
oMKgwqDCoMKgIGludCBzZWVrczvCoMKgwqAgLyogc2Vla3MgdG8gcmVjcmVhdGUgYW4gb2JqICov
Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgZmxhZ3M7Cj4+ICvCoMKgwqAgdm9pZCAqcHJpdmF0ZV9k
YXRhOwo+PiArCj4+IMKgwqDCoMKgwqAgLyogVGhlc2UgYXJlIGZvciBpbnRlcm5hbCB1c2UgKi8K
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4+IMKgICNpZmRlZiBDT05GSUdf
TUVNQ0cKPj4gQEAgLTk4LDYgKzEwMCwxMCBAQCBzdHJ1Y3Qgc2hyaW5rZXIgewo+PiDCoCB1bnNp
Z25lZCBsb25nIHNocmlua19zbGFiKGdmcF90IGdmcF9tYXNrLCBpbnQgbmlkLCBzdHJ1Y3QgbWVt
X2Nncm91cCAKPj4gKm1lbWNnLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50
IHByaW9yaXR5KTsKPj4gK3N0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXJfYWxsb2ModW5zaWduZWQg
aW50IGZsYWdzLCBjb25zdCBjaGFyICpmbXQsIAo+PiAuLi4pOwo+PiArdm9pZCBzaHJpbmtlcl9m
cmVlX25vbl9yZWdpc3RlcmVkKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpOwo+PiArdm9pZCBz
aHJpbmtlcl9yZWdpc3RlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPj4gK3ZvaWQgc2hy
aW5rZXJfdW5yZWdpc3RlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyKTsKPj4gwqAgZXh0ZXJu
IGludCBfX3ByaW50ZigyLCAzKSBwcmVhbGxvY19zaHJpbmtlcihzdHJ1Y3Qgc2hyaW5rZXIgKnNo
cmlua2VyLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjb25zdCBjaGFyICpmbXQsIC4uLik7Cj4+IGRpZmYgLS1naXQgYS9tbS9zaHJpbmtlci5j
IGIvbW0vc2hyaW5rZXIuYwo+PiBpbmRleCAwYTMyZWY0MmYyYTcuLmQ4MjBlNGNjNTgwNiAxMDA2
NDQKPj4gLS0tIGEvbW0vc2hyaW5rZXIuYwo+PiArKysgYi9tbS9zaHJpbmtlci5jCj4+IEBAIC01
NDgsNiArNTQ4LDExOSBAQCB1bnNpZ25lZCBsb25nIHNocmlua19zbGFiKGdmcF90IGdmcF9tYXNr
LCBpbnQgCj4+IG5pZCwgc3RydWN0IG1lbV9jZ3JvdXAgKm1lbWNnLAo+PiDCoMKgwqDCoMKgIHJl
dHVybiBmcmVlZDsKPj4gwqAgfQo+PiArc3RydWN0IHNocmlua2VyICpzaHJpbmtlcl9hbGxvYyh1
bnNpZ25lZCBpbnQgZmxhZ3MsIGNvbnN0IGNoYXIgKmZtdCwgCj4+IC4uLikKPj4gK3sKPj4gK8Kg
wqDCoCBzdHJ1Y3Qgc2hyaW5rZXIgKnNocmlua2VyOwo+PiArwqDCoMKgIHVuc2lnbmVkIGludCBz
aXplOwo+PiArwqDCoMKgIHZhX2xpc3QgX19tYXliZV91bnVzZWQgYXA7Cj4+ICvCoMKgwqAgaW50
IGVycjsKPj4gKwo+PiArwqDCoMKgIHNocmlua2VyID0ga3phbGxvYyhzaXplb2Yoc3RydWN0IHNo
cmlua2VyKSwgR0ZQX0tFUk5FTCk7Cj4+ICvCoMKgwqAgaWYgKCFzaHJpbmtlcikKPj4gK8KgwqDC
oMKgwqDCoMKgIHJldHVybiBOVUxMOwo+PiArCj4+ICsjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RF
QlVHCj4+ICvCoMKgwqAgdmFfc3RhcnQoYXAsIGZtdCk7Cj4+ICvCoMKgwqAgc2hyaW5rZXItPm5h
bWUgPSBrdmFzcHJpbnRmX2NvbnN0KEdGUF9LRVJORUwsIGZtdCwgYXApOwo+PiArwqDCoMKgIHZh
X2VuZChhcCk7Cj4+ICvCoMKgwqAgaWYgKCFzaHJpbmtlci0+bmFtZSkKPj4gK8KgwqDCoMKgwqDC
oMKgIGdvdG8gZXJyX25hbWU7Cj4+ICsjZW5kaWYKPiAKPiBTbyB3aHkgbm90IGludHJvZHVjZSBh
bm90aGVyIGhlbHBlciB0byBoYW5kbGUgdGhpcyBhbmQgZGVjbGFyZSBpdAo+IGFzIGEgdm9pZCBm
dW5jdGlvbiB3aGVuICFDT05GSUdfU0hSSU5LRVJfREVCVUc/IFNvbWV0aGluZyBsaWtlIHRoZQo+
IGZvbGxvd2luZzoKPiAKPiAjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCj4gc3RhdGljIGlu
dCBzaHJpbmtlcl9kZWJ1Z2ZzX25hbWVfYWxsb2Moc3RydWN0IHNocmlua2VyICpzaHJpbmtlciwg
Y29uc3QgCj4gY2hhciAqZm10LAo+ICDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKgIHZhX2xpc3QgdmFyZ3MpCj4gCj4gewo+
ICDCoMKgwqAgc2hyaW5rZXItPm5hbWUgPSBrdmFzcHJpbnRmX2NvbnN0KEdGUF9LRVJORUwsIGZt
dCwgdmFyZ3MpOwo+ICDCoMKgwqAgcmV0dXJuIHNocmlua2VyLT5uYW1lID8gMCA6IC1FTk9NRU07
Cj4gfQo+ICNlbHNlCj4gc3RhdGljIGludCBzaHJpbmtlcl9kZWJ1Z2ZzX25hbWVfYWxsb2Moc3Ry
dWN0IHNocmlua2VyICpzaHJpbmtlciwgY29uc3QgCj4gY2hhciAqZm10LAo+ICDCoMKgwqAgwqDC
oMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgIMKgwqDCoMKg
IHZhX2xpc3QgdmFyZ3MpCj4gewo+ICDCoMKgwqAgcmV0dXJuIDA7Cj4gfQo+ICNlbmRpZgoKV2ls
bCBkbyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiAKPj4gK8KgwqDCoCBzaHJpbmtlci0+ZmxhZ3Mg
PSBmbGFnczsKPj4gKwo+PiArwqDCoMKgIGlmIChmbGFncyAmIFNIUklOS0VSX01FTUNHX0FXQVJF
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSBwcmVhbGxvY19tZW1jZ19zaHJpbmtlcihzaHJp
bmtlcik7Cj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZXJyID09IC1FTk9TWVMpCj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNocmlua2VyLT5mbGFncyAmPSB+U0hSSU5LRVJfTUVNQ0dfQVdBUkU7
Cj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChlcnIgPT0gMCkKPj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBkb25lOwo+PiArwqDCoMKgwqDCoMKgwqAgZWxzZQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIGVycl9mbGFnczsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gK8KgwqDC
oCAvKgo+PiArwqDCoMKgwqAgKiBUaGUgbnJfZGVmZXJyZWQgaXMgYXZhaWxhYmxlIG9uIHBlciBt
ZW1jZyBsZXZlbCBmb3IgbWVtY2cgYXdhcmUKPj4gK8KgwqDCoMKgICogc2hyaW5rZXJzLCBzbyBv
bmx5IGFsbG9jYXRlIG5yX2RlZmVycmVkIGluIHRoZSBmb2xsb3dpbmcgY2FzZXM6Cj4+ICvCoMKg
wqDCoCAqwqAgLSBub24gbWVtY2cgYXdhcmUgc2hyaW5rZXJzCj4+ICvCoMKgwqDCoCAqwqAgLSAh
Q09ORklHX01FTUNHCj4+ICvCoMKgwqDCoCAqwqAgLSBtZW1jZyBpcyBkaXNhYmxlZCBieSBrZXJu
ZWwgY29tbWFuZCBsaW5lCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKgIHNpemUgPSBzaXplb2Yo
KnNocmlua2VyLT5ucl9kZWZlcnJlZCk7Cj4+ICvCoMKgwqAgaWYgKGZsYWdzICYgU0hSSU5LRVJf
TlVNQV9BV0FSRSkKPj4gK8KgwqDCoMKgwqDCoMKgIHNpemUgKj0gbnJfbm9kZV9pZHM7Cj4+ICsK
Pj4gK8KgwqDCoCBzaHJpbmtlci0+bnJfZGVmZXJyZWQgPSBremFsbG9jKHNpemUsIEdGUF9LRVJO
RUwpOwo+PiArwqDCoMKgIGlmICghc2hyaW5rZXItPm5yX2RlZmVycmVkKQo+PiArwqDCoMKgwqDC
oMKgwqAgZ290byBlcnJfZmxhZ3M7Cj4+ICsKPj4gK2RvbmU6Cj4+ICvCoMKgwqAgcmV0dXJuIHNo
cmlua2VyOwo+PiArCj4+ICtlcnJfZmxhZ3M6Cj4+ICsjaWZkZWYgQ09ORklHX1NIUklOS0VSX0RF
QlVHCj4+ICvCoMKgwqAga2ZyZWVfY29uc3Qoc2hyaW5rZXItPm5hbWUpOwo+PiArwqDCoMKgIHNo
cmlua2VyLT5uYW1lID0gTlVMTDsKPiAKPiBUaGlzIGNvdWxkIGJlIHNocmlua2VyX2RlYnVnZnNf
bmFtZV9mcmVlKCkKCldpbGwgZG8uCgo+IAo+PiArZXJyX25hbWU6Cj4+ICsjZW5kaWYKPj4gK8Kg
wqDCoCBrZnJlZShzaHJpbmtlcik7Cj4+ICvCoMKgwqAgcmV0dXJuIE5VTEw7Cj4+ICt9Cj4+ICtF
WFBPUlRfU1lNQk9MKHNocmlua2VyX2FsbG9jKTsKPj4gKwo+PiArdm9pZCBzaHJpbmtlcl9mcmVl
X25vbl9yZWdpc3RlcmVkKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rZXIpCj4+ICt7Cj4+ICsjaWZk
ZWYgQ09ORklHX1NIUklOS0VSX0RFQlVHCj4+ICvCoMKgwqAga2ZyZWVfY29uc3Qoc2hyaW5rZXIt
Pm5hbWUpOwo+PiArwqDCoMKgIHNocmlua2VyLT5uYW1lID0gTlVMTDsKPiAKPiBUaGlzIGNvdWxk
IGJlIHNocmlua2VyX2RlYnVnZnNfbmFtZV9mcmVlKCkKPiAKPj4gKyNlbmRpZgo+PiArwqDCoMKg
IGlmIChzaHJpbmtlci0+ZmxhZ3MgJiBTSFJJTktFUl9NRU1DR19BV0FSRSkgewo+PiArwqDCoMKg
wqDCoMKgwqAgZG93bl93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+PiArwqDCoMKgwqDCoMKgwqAg
dW5yZWdpc3Rlcl9tZW1jZ19zaHJpbmtlcihzaHJpbmtlcik7Cj4+ICvCoMKgwqDCoMKgwqDCoCB1
cF93cml0ZSgmc2hyaW5rZXJfcndzZW0pOwo+PiArwqDCoMKgIH0KPj4gKwo+PiArwqDCoMKgIGtm
cmVlKHNocmlua2VyLT5ucl9kZWZlcnJlZCk7Cj4+ICvCoMKgwqAgc2hyaW5rZXItPm5yX2RlZmVy
cmVkID0gTlVMTDsKPj4gKwo+PiArwqDCoMKgIGtmcmVlKHNocmlua2VyKTsKPj4gK30KPj4gK0VY
UE9SVF9TWU1CT0woc2hyaW5rZXJfZnJlZV9ub25fcmVnaXN0ZXJlZCk7Cj4+ICsKPj4gK3ZvaWQg
c2hyaW5rZXJfcmVnaXN0ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKPj4gK3sKPj4gK8Kg
wqDCoCBkb3duX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4+ICvCoMKgwqAgbGlzdF9hZGRfdGFp
bCgmc2hyaW5rZXItPmxpc3QsICZzaHJpbmtlcl9saXN0KTsKPj4gK8KgwqDCoCBzaHJpbmtlci0+
ZmxhZ3MgfD0gU0hSSU5LRVJfUkVHSVNURVJFRDsKPj4gK8KgwqDCoCBzaHJpbmtlcl9kZWJ1Z2Zz
X2FkZChzaHJpbmtlcik7Cj4+ICvCoMKgwqAgdXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4g
K30KPj4gK0VYUE9SVF9TWU1CT0woc2hyaW5rZXJfcmVnaXN0ZXIpOwo+PiArCj4+ICt2b2lkIHNo
cmlua2VyX3VucmVnaXN0ZXIoc3RydWN0IHNocmlua2VyICpzaHJpbmtlcikKPiAKPiBZb3UgaGF2
ZSBtYWRlIGFsbCBzaHJpbmtlcnMgdG8gYmUgZHluYW1pY2FsbHkgYWxsb2NhdGVkLCBzbwo+IHdl
IHNob3VsZCBwcmV2ZW50IHVzZXJzIGZyb20gYWxsb2NhdGluZyBzaHJpbmtlcnMgc3RhdGljYWxs
eSBhbmQKPiB1c2UgdGhpcyBmdW5jdGlvbiB0byB1bnJlZ2lzdGVyIGl0LiBJdCBpcyBiZXR0ZXIg
dG8gYWRkIGEKPiBmbGFnIGxpa2UgU0hSSU5LRVJfQUxMT0NBVEVEIHdoaWNoIGlzIHNldCBpbiBz
aHJpbmtlcl9hbGxvYygpLAo+IGFuZCBjaGVjayB3aGV0aGVyIGl0IGlzIHNldCBpbiBzaHJpbmtl
cl91bnJlZ2lzdGVyKCksIGlmIG5vdAo+IG1heWJlIGEgd2FybmluZyBzaG91bGQgYmUgYWRkZWQg
dG8gdGVsbCB0aGUgdXNlcnMgd2hhdCBoYXBwZW5lZC4KCk1ha2Ugc2Vuc2UsIHdpbGwgZG8uCgo+
IAo+PiArewo+PiArwqDCoMKgIHN0cnVjdCBkZW50cnkgKmRlYnVnZnNfZW50cnk7Cj4+ICvCoMKg
wqAgaW50IGRlYnVnZnNfaWQ7Cj4+ICsKPj4gK8KgwqDCoCBpZiAoIXNocmlua2VyIHx8ICEoc2hy
aW5rZXItPmZsYWdzICYgU0hSSU5LRVJfUkVHSVNURVJFRCkpCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXR1cm47Cj4+ICsKPj4gK8KgwqDCoCBkb3duX3dyaXRlKCZzaHJpbmtlcl9yd3NlbSk7Cj4+ICvC
oMKgwqAgbGlzdF9kZWwoJnNocmlua2VyLT5saXN0KTsKPj4gK8KgwqDCoCBzaHJpbmtlci0+Zmxh
Z3MgJj0gflNIUklOS0VSX1JFR0lTVEVSRUQ7Cj4+ICvCoMKgwqAgaWYgKHNocmlua2VyLT5mbGFn
cyAmIFNIUklOS0VSX01FTUNHX0FXQVJFKQo+PiArwqDCoMKgwqDCoMKgwqAgdW5yZWdpc3Rlcl9t
ZW1jZ19zaHJpbmtlcihzaHJpbmtlcik7Cj4+ICvCoMKgwqAgZGVidWdmc19lbnRyeSA9IHNocmlu
a2VyX2RlYnVnZnNfZGV0YWNoKHNocmlua2VyLCAmZGVidWdmc19pZCk7Cj4gCj4gSW4gdGhlIGlu
dGVybmFsIG9mIHRoaXMgZnVuY3Rpb24sIHlvdSBhbHNvIGNvdWxkIHVzZQo+IHNocmlua2VyX2Rl
YnVnZnNfbmFtZV9mcmVlKCkuCgpZZWFoLCB3aWxsIGRvLgoKVGhhbmtzLApRaQoKPiAKPiBUaGFu
a3MuCj4gCj4+ICvCoMKgwqAgdXBfd3JpdGUoJnNocmlua2VyX3J3c2VtKTsKPj4gKwo+PiArwqDC
oMKgIHNocmlua2VyX2RlYnVnZnNfcmVtb3ZlKGRlYnVnZnNfZW50cnksIGRlYnVnZnNfaWQpOwo+
PiArCj4+ICvCoMKgwqAga2ZyZWUoc2hyaW5rZXItPm5yX2RlZmVycmVkKTsKPj4gK8KgwqDCoCBz
aHJpbmtlci0+bnJfZGVmZXJyZWQgPSBOVUxMOwo+PiArCj4+ICvCoMKgwqAga2ZyZWUoc2hyaW5r
ZXIpOwo+PiArfQo+PiArRVhQT1JUX1NZTUJPTChzaHJpbmtlcl91bnJlZ2lzdGVyKTsKPj4gKwo+
PiDCoCAvKgo+PiDCoMKgICogQWRkIGEgc2hyaW5rZXIgY2FsbGJhY2sgdG8gYmUgY2FsbGVkIGZy
b20gdGhlIHZtLgo+PiDCoMKgICovCj4gCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2
ZWxAcmVkaGF0LmNvbQpodHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZv
L2RtLWRldmVsCg==

