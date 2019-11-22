Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id C6544106837
	for <lists+dm-devel@lfdr.de>; Fri, 22 Nov 2019 09:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1574412309;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rDvZBgUe3FlC0TqEbQU38jo0TUYRSr+dLfWbqdW9iPw=;
	b=EKw+QLPM84VRw0ScaezQgkQTlr7wUKsiWABErt0MV7HxhgRCFG86BIP1+2aNVoBy0sECAy
	/sWycHFr9X1zd5OJhmJc9/uBLJOIBljC2MHBNq/L67PjLTN6G6e4kiOXzv7MYCSGuwZoXO
	v1S6JVn94PX6QTt/pFyHQ35kcItWuWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-JOG_oS49Oy6qcLROQi9dNQ-1; Fri, 22 Nov 2019 03:45:07 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05115100551A;
	Fri, 22 Nov 2019 08:45:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CC6FF1036C91;
	Fri, 22 Nov 2019 08:44:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E5714BB65;
	Fri, 22 Nov 2019 08:44:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xAM3hLgG032616 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 21 Nov 2019 22:43:22 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D284F1055236; Fri, 22 Nov 2019 03:43:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CE68D1055070
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 03:43:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 67E4F1011A64
	for <dm-devel@redhat.com>; Fri, 22 Nov 2019 03:43:19 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R201e4; CH=green; DM=||false|;
	FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04395;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=3; SR=0;
	TI=SMTPD_---0Tilmjj3_1574394180;
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
	[47.88.44.36]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-103-Kp9xN5ivOZi2lhR_w8iFug-1; Thu, 21 Nov 2019 22:43:15 -0500
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0Tilmjj3_1574394180) by smtp.aliyun-inc.com(127.0.0.1);
	Fri, 22 Nov 2019 11:43:01 +0800
To: agk@redhat.com, Mike Snitzer <snitzer@redhat.com>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <95b81e25-49ed-71a9-5dcf-0ff3618f2ea6@linux.alibaba.com>
Date: Fri, 22 Nov 2019 11:43:00 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
X-MC-Unique: Kp9xN5ivOZi2lhR_w8iFug-1
X-MC-Unique: JOG_oS49Oy6qcLROQi9dNQ-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xAM3hLgG032616
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 22 Nov 2019 03:43:26 -0500
Cc: dm-devel@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
ZXMgdGhhdCBwcm9jZXNzX2JpbygpIGNvbnN1bWVzIDg2JSBvZiB0aGUgCnRpbWUuCgoKQmVzaWRl
cyBpdCBzZWVtcyB0aGF0IEkgY2FuJ3Qgc2VuZCBlbWFpbCB0byBkbS1kZXZlbEByZWRoYXQuY29t
IG1haWxpbmcgCmxpc3QuCgoKUmVnYXJkcwoKSmVmZmxlIFh1CgoKLS0KZG0tZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFu
L2xpc3RpbmZvL2RtLWRldmVs

