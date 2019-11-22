Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B659F106838
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 09:45:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574412310;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Z1Pp8yQxOcqLRQzMkQw1cFfrSwwjCzW0VIaXLxOq4nU=;
	b=MsKFl5qFJiDFMifbl46AaO9YweBzlDOks2xOdOlLtVAYhy+6FK5Jv8XCLivPE3R2EpfFFU
	hRJp8KjPd8CCY2a2+Q88xQ17NsvQODbiDXWsR4JlM5AXHwrUr2ncfA1EAnn+zGSvSddqaK
	vPQ3Va/iS/a819yVbt1qSgEknbThzpQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-qr-rjTRbOxWNkrm1KlY5dg-1; Fri, 22 Nov 2019 03:45:07 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AD257184CAA8;
	Fri, 22 Nov 2019 08:44:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB13161F36;
	Fri, 22 Nov 2019 08:44:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D918918089C8;
	Fri, 22 Nov 2019 08:44:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM3EOn4032011 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 22:14:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A3EB21069F58; Fri, 22 Nov 2019 03:14:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FFAA1069F57
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 03:14:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CAEB900ABA
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 03:14:22 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R151e4; CH=green; DM=||false|;
	FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e07417;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=1; SR=0;
	TI=SMTPD_---0TilFRs7_1574392455;
Received: from out30-54.freemail.mail.aliyun.com
	(out30-54.freemail.mail.aliyun.com [115.124.30.54]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-168-VDDWbBmiP3y6VIp0T4nZ9Q-1;
	Thu, 21 Nov 2019 22:14:20 -0500
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0TilFRs7_1574392455) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 22 Nov 2019 11:14:16 +0800
To: dm-devel@redhat.com
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
Date: Fri, 22 Nov 2019 11:14:15 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
X-MC-Unique: VDDWbBmiP3y6VIp0T4nZ9Q-1
X-MC-Unique: qr-rjTRbOxWNkrm1KlY5dg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM3EOn4032011
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 03:43:26 -0500
Subject: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgZ3V5cywKCkkgaGF2ZSBzZXZlcmFsIHF1ZXN0aW9ucyBvbiBkbS10aGluIHdoZW4gSSdtIHRl
c3RpbmcgYW5kIGV2YWx1YXRpbmcgSU8gCnBlcmZvcm1hbmNlIG9mIGRtLXRoaW4uIEkgd291bGQg
YmUgZ3JhdGVmdWwgaWYgc29tZW9uZSBjb3VsZCBzcGVuZCBhIApsaXR0bGUgdGltZSBvbiBpdC4K
CgpUaGUgZmlyc3QgcXVlc3Rpb24gaXMgd2hhdCdzIHRoZSBwdXJwb3NlIG9mIGRhdGEgY2VsbD8g
SW4gCnRoaW5fYmlvX21hcCgpLCBub3JtYWwgYmlvIHdpbGwgYmUgcGFja2VkIGFzIGEgdmlydHVh
bCBjZWxsIGFuZCBkYXRhIApjZWxsLiBJIGNhbiB1bmRlcnN0YW5kIHRoYXQgdmlydHVhbCBjZWxs
IGlzIHVzZWQgdG8gcHJldmVudCBkaXNjYXJkIGJpbyAKYW5kIG5vbi1kaXNjYXJkIGJpbyB0YXJn
ZXRpbmcgdGhlIHNhbWUgYmxvY2sgZnJvbSBiZWluZyBwcm9jZXNzZWQgYXQgdGhlIApzYW1lIHRp
bWUuIEkgZmluZCBpdCB3YXMgYWRkZWQgaW4gY29tbWl0IMKgwqDCoCAKZTgwODgwNzNjOTYxMGFm
MDE3ZmQ0N2ZkZGQxMDRhMmMzYWZiMzJlOCAoZG0gdGhpbjogZml4IHJhY2UgYmV0d2VlbiAKc2lt
dWx0YW5lb3VzIGlvIGFuZCBkaXNjYXJkcyB0byBzYW1lIGJsb2NrKSwgYnV0IEknbSBzdGlsbCBj
b25mdXNlZCAKYWJvdXQgdGhlIHVzZSBvZiBkYXRhIGNlbGwuCgoKVGhlIHNlY29uZCBxdWVzdGlv
biBpcyB0aGUgaW1wYWN0IG9mIHZpcnR1YWwgY2VsbCBhbmQgZGF0YSBjZWxsIG9uIElPIApwZXJm
b3JtYW5jZS4gSWYgJGRhdGFfYmxvY2tfc2l6ZSBpcyBsYXJnZSBmb3IgZXhhbXBsZSAxRywgaW4g
bXVsdGl0aHJlYWQgCmZpbyB0ZXN0LCBtb3N0IGJpbyB3aWxsIGJlIGJ1ZmZlcmVkIGluIGNlbGwt
PmJpb3MgbGlzdCBhbmQgdGhlbiBiZSAKcHJvY2Vzc2VkIGJ5IHdvcmtlciB0aHJlYWQgYXN5bmNo
cm9ub3VzbHksIGV2ZW4gd2hlbiB0aGVyZSdzIG5vIGRpc2NhcmQgCmJpby4gVGh1cyB0aGUgb3Jp
Z2luYWwgcGFyYWxsZWwgSU8gaXMgcHJvY2Vzc2VkIGJ5IHdvcmtlciB0aHJlYWQgCnNlcmlhbGx5
IG5vdy4gQXMgdGhlIG51bWJlciBvZiBmaW8gdGVzdCB0aHJlYWRzIGluY3JlYXNlLCB0aGUgc2lu
Z2xlIAp3b3JrZXIgdGhyZWFkIGNhbiBlYXNpbHkgZ2V0IENQVSAxMDAlLCBhbmQgdGh1cyBiZWNv
bWUgdGhlIGJvdHRsZW5lY2sgb2YgCnRoZSBwZXJmb3JtYW5jZSBzaW5jZSBkbS10aGluIHdvcmtx
dWV1ZSBpcyBvcmRlcmVkIHVuYm91bmQuCgpVc2luZyBhbiBudm1lIFNTRCBhbmQgZmlvIChkaXJl
Y3Q9MSwgaW9lbmdpbmU9bGliYWlvLCBpb2RlcHRoPTEyOCwgCm51bWpvYnM9NCwgcnc9cmVhZCwg
YnM9NGspLCB0aGUgYmFuZHdpZHRoIG9uIGJhcmUgbnZtZSBpcyAxNTg5TWlCL3MuIFRoZSAKYmFu
ZHdpZHRoIG9uIHRoaW4gZGV2aWNlIGlzIG9ubHkgMTI3NE1pQi9zLCB3aGlsZSB0aGUgZm91ciBm
aW8gdGhyZWFkcyAKcnVuIGF0IDIwMCUgQ1BVIGFuZCB0aGUgc2luZ2xlIHdvcmtlciB0aHJlYWQg
aXMgYWx3YXlzIHJ1bmluZyBhdCAxMDAlIApDUFUuIHBlcmYgb2Ygd29ya2VyIHRocmVhZCBzaG93
ZXMgdGhhdCBwcm9jZXNzX2JpbygpIGNvbnN1bWVzIDg2JSBvZiB0aGUgCnRpbWUuCgoKUmVnYXJk
cwoKSmVmZmxlIFh1CgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

