Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F2EC71F8EDE
	for <lists+dm-devel@lfdr.de>; Mon, 15 Jun 2020 08:58:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592204280;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=4hF3Y5bkhSaUH4qejxhB/ceXBr/1n3kTbsYk5T8dwjk=;
	b=dqrISC4QjowAfAtB0+IlM9rfj+3ALoSJUGJMUI3rLsiXUa8vgIvOlH6KsaEJAkD1cgzjii
	lUneWjLpPjtcN++viUxeOxqayY7BwVl4CIkj0GFXu5/VPasRRK1jbxx7to78qEl0udd6hO
	uTbatcKZUWOn9ISepY0Hqm1dggBCeeI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-197-MlETN0lYOlW-U8T1y9brLQ-1; Mon, 15 Jun 2020 02:57:57 -0400
X-MC-Unique: MlETN0lYOlW-U8T1y9brLQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2285A835B43;
	Mon, 15 Jun 2020 06:57:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5BF175D9CD;
	Mon, 15 Jun 2020 06:57:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A22A01809547;
	Mon, 15 Jun 2020 06:57:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05F0vfpb025651 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 14 Jun 2020 20:57:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C581C110F397; Mon, 15 Jun 2020 00:57:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1159110F38C
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 00:57:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08FA782A6CB
	for <dm-devel@redhat.com>; Mon, 15 Jun 2020 00:57:38 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-101-6HPBikeuPR--z2UPSiG51g-1; Sun, 14 Jun 2020 20:57:32 -0400
X-MC-Unique: 6HPBikeuPR--z2UPSiG51g-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id C48921313CFDDF76C6CB;
	Mon, 15 Jun 2020 08:57:26 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.218) by DGGEMS402-HUB.china.huawei.com
	(10.3.19.202) with Microsoft SMTP Server id 14.3.487.0;
	Mon, 15 Jun 2020 08:57:24 +0800
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>, Mike Snitzer
	<snitzer@redhat.com>
References: <20200608084513.115671-1-yangerkun@huawei.com>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <b7626f88-52ca-f60b-11a8-e64d167f0169@huawei.com>
Date: Mon, 15 Jun 2020 08:57:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200608084513.115671-1-yangerkun@huawei.com>
X-Originating-IP: [10.166.212.218]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05F0vfpb025651
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 15 Jun 2020 02:57:28 -0400
Cc: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 0/2] introduce interface to list all badblocks
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64

SGksCgpTb3JyeSBmb3Igbm90IHNlbmQgdG8gTWlrZS4gQ2FuIHlvdSBjb25zaWRlciB0byBhcHBs
eSB0aGlzIHBhdGNoc2V0PwoKVGhhbmtzLApLdW4uCgrU2iAyMDIwLzYvOCAxNjo0NSwgeWFuZ2Vy
a3VuINC0tcA6Cj4gV2UgY2FuIGFkZC9yZW1vdmUvcXVlcnkgdGhlIGJhZGJsb2NrcywgYnV0IG5v
IGludGVyZmFjZSB0byBsaXN0IGFsbAo+IGJhZGJsb2NrcyB3aGVuIHdlIHdhbnQgdG8ga25vdyB0
aGUgYmFkYmxvY2tzIHdlIGV2ZXIgc2V0IHN0aWxsCj4gYXZhaWxhYmxlLiBBZGQgbWVzc2FnZSBs
aXN0YmFkYmxvY2tzIHRvIGRvIHRoaXMuCj4gCj4gVG8gbGlzdCBhbGwgYmFkIGJsb2NrcyBpbiB0
aGUgYmFkIGJsb2NrIGxpc3QsIHJ1biB0aGUgZm9sbG93aW5nCj4gbWVzc2FnZSBjb21tYW5kOgo+
IAo+ICAgICAgJCBzdWRvIGRtc2V0dXAgbWVzc2FnZSBkdXN0MSAwIGxpc3RiYWRibG9ja3MKPiAK
PiBUaGUgZm9sbG93aW5nIG1lc3NhZ2Ugd2lsbCBhcHBlYXIsIGxpc3Rpbmcgb25lIGJhZCBibG9j
ayBudW1iZXIgcGVyCj4gbGluZSAodXNpbmcgYW4gZXhhbXBsZSBkZXZpY2Ugd2l0aCBibG9ja3Mg
MSBhbmQgMiBpbiB0aGUgYmFkIGJsb2NrCj4gbGlzdCk6Cj4gCj4gZGV2aWNlLW1hcHBlcjogZHVz
dDogZHVzdF9saXN0X2JhZGJsb2NrczogYmFkYmxvY2tzIGxpc3QgYmVsb3c6Cj4gICAgICBkZXZp
Y2UtbWFwcGVyOiBkdXN0OiBiYWQgYmxvY2s6IDEKPiAgICAgIGRldmljZS1tYXBwZXI6IGR1c3Q6
IGJhZCBibG9jazogMgo+ICAgICAgZGV2aWNlLW1hcHBlcjogZHVzdDogZHVzdF9saXN0X2JhZGJs
b2NrczogYmFkYmxvY2tzIGxpc3QgZW5kLgo+IAo+IAo+IHlhbmdlcmt1biAoMik6Cj4gICAgZG0g
ZHVzdDogYWRkIGludGVyZmFjZSB0byBsaXN0IGFsbCBiYWRibG9ja3MKPiAgICBkbSBkdXN0OiBp
bnRyb2R1Y2UgbGlzdGJhZGJsb2NrcyBpbiB0aGUgcnN0Cj4gCj4gICAuLi4vYWRtaW4tZ3VpZGUv
ZGV2aWNlLW1hcHBlci9kbS1kdXN0LnJzdCAgICAgfCAxOCArKysrKysrKysrKysrKysrCj4gICBk
cml2ZXJzL21kL2RtLWR1c3QuYyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMSArKysrKysr
KysrKysrKysrKysrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykKPiAKCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

