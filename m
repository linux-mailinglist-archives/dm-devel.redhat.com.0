Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9E4C01FC86F
	for <lists+dm-devel@lfdr.de>; Wed, 17 Jun 2020 10:21:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592382082;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+hqz3e/lGr0GKp2KXm8X6eT92gKDEwMT4m1Y7LMh2to=;
	b=HI9+i7YoxxfsM40iC6MlWZKS0T4Q0DnuDDjZU/aA8nHw0dFAbdlF8RUoaXh+B8qq8t1+to
	OZRDSWclelWLAfNqoquRiB3VS4KM8lid5xPDCQVUXS2MZ162kDPTZB0OJNuSyxnHkgzkW0
	wtwTf1lH/faqUn0N7Pv+X8llU/0x/oE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-gsZt19PeM1i95x1z6ZvTZw-1; Wed, 17 Jun 2020 04:21:20 -0400
X-MC-Unique: gsZt19PeM1i95x1z6ZvTZw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8CF7A835B77;
	Wed, 17 Jun 2020 08:21:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C42965C1BD;
	Wed, 17 Jun 2020 08:21:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 991391809554;
	Wed, 17 Jun 2020 08:21:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05GD2vWv008539 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 16 Jun 2020 09:02:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7503610E60EE; Tue, 16 Jun 2020 13:02:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 70C0E10E60DF
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 13:02:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2996D800FC2
	for <dm-devel@redhat.com>; Tue, 16 Jun 2020 13:02:55 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-488-MmflMo3iOcm5WuAtt1tiQg-1; Tue, 16 Jun 2020 09:02:50 -0400
X-MC-Unique: MmflMo3iOcm5WuAtt1tiQg-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id 44F9C5B071AFAB7CADF4;
	Tue, 16 Jun 2020 21:02:42 +0800 (CST)
Received: from [127.0.0.1] (10.166.212.218) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0;
	Tue, 16 Jun 2020 21:02:40 +0800
To: "Bryn M. Reeves" <bmr@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>, 
	<snitzer@redhat.com>, <dm-devel@redhat.com>
References: <20200608084513.115671-1-yangerkun@huawei.com>
	<20200615170331.GA12312@agk-dp.fab.redhat.com>
	<20200616122803.GA24935@localhost.localdomain>
From: yangerkun <yangerkun@huawei.com>
Message-ID: <464fba5f-fc92-5f5d-29dc-deae19997ad8@huawei.com>
Date: Tue, 16 Jun 2020 21:02:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200616122803.GA24935@localhost.localdomain>
X-Originating-IP: [10.166.212.218]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05GD2vWv008539
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 17 Jun 2020 04:20:55 -0400
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="gbk"; Format="flowed"
Content-Transfer-Encoding: base64

CgrU2iAyMDIwLzYvMTYgMjA6MjgsIEJyeW4gTS4gUmVldmVzINC0tcA6Cj4gT24gTW9uLCBKdW4g
MTUsIDIwMjAgYXQgMDY6MDM6MzFQTSArMDEwMCwgQWxhc2RhaXIgRyBLZXJnb24gd3JvdGU6Cj4+
IE9uIE1vbiwgSnVuIDA4LCAyMDIwIGF0IDA0OjQ1OjExUE0gKzA4MDAsIHlhbmdlcmt1biB3cm90
ZToKPj4+ICAgICAgJCBzdWRvIGRtc2V0dXAgbWVzc2FnZSBkdXN0MSAwIGxpc3RiYWRibG9ja3MK
Pj4+IFRoZSBmb2xsb3dpbmcgbWVzc2FnZSB3aWxsIGFwcGVhciwgbGlzdGluZyBvbmUgYmFkIGJs
b2NrIG51bWJlciBwZXIKPj4KPj4gRGlkIHlvdSBjb25zaWRlciByZXR1cm5pbmcgdGhlIGRhdGEg
ZGlyZWN0bHkgdG8gdGhlIGNhbGxlciBzbyBpdAo+PiBjYW4gYmUgYWNjZXNzZWQgZGlyZWN0bHk/
Cj4+Cj4+IChlLmcuIGxpa2UgQHN0YXRzX2xpc3QgaGFuZGxlZCBpbiBkbS1zdGF0cy5jKQo+IAo+
IEhhdmluZyB0aGlzIHJldHVybmVkIGluIHRoZSBtZXNzYWdlIHJlc3BvbnNlIHdvdWxkIGNlcnRh
aW5seSBiZSBtb3JlCj4gbmF0dXJhbCBhbmQgd291bGQgc2ltcGxpZnkgcGFyc2luZyB0aGUgZGF0
YTogc2VuZGluZyBpdCB0byB0aGUgbG9nIHNlZW1zCj4gbGlrZSBpdCB3b3VsZCBhbGxvdyBsb2cg
bGluZXMgZnJvbSBkaXN0aW5jdCBkZXZpY2VzIHRvIGJlY29tZQo+IGludGVybGVhdmVkIHdoZW4g
dGhlIGxpc3RzIGFyZSBsb25nIGFuZCB0aGUgbWVzc2FnZSBpcyBzZW50IHRvIHR3byBvcgo+IG1v
cmUgZGV2aWNlcyBuZWFyIHNpbXVsdGFuZW91c2x5LiBXaXRob3V0IHNvbWV0aGluZyB0byBpZGVu
dGlmeSB0aGUKPiBkZXZpY2VzIGluIGVhY2ggbWVzc2FnZSB5b3UgY2FuJ3QgZGlzdGluZ3Vpc2gg
dGhlbS4KPiAKPiBFdmVuIHdpdGggbGFyZ2UgbnVtYmVycyBvZiBiYWQgYmxvY2tzIHVzZXJzcGFj
ZSBsaWJkZXZtYXBwZXIgd2lsbAo+IGF1dG9tYXRpY2FsbHkgaGFuZGxlIHJlLXRyeWluZyB3aXRo
IGEgbGFyZ2VyIGJ1ZmZlciBpZiB0aGUgbGlzdCBpcyB0b28KPiBiaWcgZm9yIHRoZSBkZWZhdWx0
Lgo+IAo+IFdlIHVzZSAoc29tZXRpbWVzIHZlcnkgbGFyZ2UpIG1lc3NhZ2UgcmVwbGllcyBoZWF2
aWx5IGluIGxpYmRtLXN0YXRzLgo+IAo+IGRldmljZS1tYXBwZXIuaCBwcm92aWRlcyB0aGUgRE1F
TUlUIG1hY3JvIHRvIG91dHB1dCBtZXNzYWdlIHJlcGxpZXMuCj4gU2VlIGRtX3N0YXRzX3ByaW50
KCkgb3IgdmFyaW91cyB0YXJnZXQgc3RhdHVzKCkgZnVuY3Rpb25zIGZvcgo+IGV4YW1wbGVzLgo+
IAo+IFJlZ2FyZHMsCj4gQnJ5bi4KPiAKSGksCgpUaGFua3MgZm9yIHlvdXIgcmVwbHkhIEkgd2ls
bCByZWFkIHRoaXMgY29kZSBhbmQgY29uc2lkZXIgdG8gcmVhbGl6ZSBpdCEKClRoYW5rcywKS3Vu
LgoKPiAKPiAuCj4gCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5j
b20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

