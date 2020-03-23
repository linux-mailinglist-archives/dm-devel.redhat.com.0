Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3359918F88B
	for <lists+dm-devel@lfdr.de>; Mon, 23 Mar 2020 16:27:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584977232;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=20nyvZbFcS7EE0mHuRlSDwVmesKffFaGe7oDo+WPbbw=;
	b=FkB1JXNEOCuAVA48y3knRE1gytJzuqW+ZjaC10jLRTJYQGtggpMTFvaWuCSi5AJLEnLjU3
	RFuvKVSRa0X0elLA75UWAjyUfkMaOx7RXPsn9AwFQX+TCyQpg5J+K1LdVnePt2AwcTor1e
	HHSXlLnkcDerO/ttW6gAYFTEV2aZILg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-0isMwaa7O0qIeUIVaT_Tig-1; Mon, 23 Mar 2020 11:27:09 -0400
X-MC-Unique: 0isMwaa7O0qIeUIVaT_Tig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04160107ACC4;
	Mon, 23 Mar 2020 15:27:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC01C1000337;
	Mon, 23 Mar 2020 15:27:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D86EF86382;
	Mon, 23 Mar 2020 15:26:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02NFQkGW002967 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 23 Mar 2020 11:26:46 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 35AAB2022EAD; Mon, 23 Mar 2020 15:26:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FEC22026D68
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:26:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6EBC185A790
	for <dm-devel@redhat.com>; Mon, 23 Mar 2020 15:26:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-38-iDwlMEoPPz-qix7Fr4rHqw-1;
	Mon, 23 Mar 2020 11:26:41 -0400
X-MC-Unique: iDwlMEoPPz-qix7Fr4rHqw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9C565AB7F;
	Mon, 23 Mar 2020 15:26:39 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200323150352.107826-1-hare@suse.de>
	<20200323151538.GA27573@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <69ce4dd2-81d3-0ac6-933b-a1f781836597@suse.de>
Date: Mon, 23 Mar 2020 16:26:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200323151538.GA27573@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02NFQkGW002967
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH RFC 0/2] dm-zoned: add cache device
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yMy8yMCA0OjE1IFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gT24gTW9uLCBNYXIgMjMg
MjAyMCBhdCAxMTowM2FtIC0wNDAwLAo+IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPiB3
cm90ZToKPiAKPj4gSGkgRGFtaWVuLAo+Pgo+PiBhcyBteSBvcmlnaW5hbCBwbGFuIHRvIHVwZ3Jh
ZGUgYmNhY2hlIHRvIHdvcmsgZm9yIFNNUiBkZXZpY2VzCj4+IHR1cm5lZCBvdXQgdG8gYmUgbW9y
ZSBjb21wbGV4IHRoYW4gYW50aWNpcGF0ZWQgSSB3ZW50IGZvciB0aGUKPj4gc2ltcGxlciBhcHBy
b2FjaCBhbmQgYWRkZWQgYSAnY2FjaGUnIGRldmljZSBmb3IgZG0tem9uZWQuCj4+IEl0IGlzIHVz
aW5nIGEgbm9ybWFsIGRldmljZSAoZWcgJy9kZXYvcG1lbTAnIDotKSwgc3BsaXQgaXQKPj4gaW50
byB6b25lcyBvZiB0aGUgc2FtZSBzaXplIG9mIHRoZSBvcmlnaW5hbCBTTVIgZGV2aWNlLCBhbmQK
Pj4gbWFrZXMgdGhvc2UgJ3ZpcnR1YWwnIHpvbmVzIGF2aWFsYWJsZSB0byBkbS16b25lZCBpbiBh
IHNpbWlsYXIKPj4gbWFubmVyIHRoYW4gdGhlIGV4aXN0aW5nICdyYW5kb20gd3JpdGUnIHpvbmVk
Lgo+Pgo+PiBUaGUgaW1wbGVtZW50YXRpb24gaXMgc3RpbGwgYSBiaXQgcm91Z2ggKG9uZSB3b3Vs
ZCBuZWVkIHRvIGFkZAo+PiBtZXRhZGF0YSB0byB0aGUgY2FjaGUgZGV2aWNlLCB0b28pLCBidXQg
c28gZmFyIGl0IHNlZW1zIHRvIHdvcmsKPj4gcXVpdGUgd2VsbDsgc3RpbGwgcnVubmluZyBhZnRl
ciBjb3B5aW5nIDMwMEdCIG9mIGRhdGEgYmFjayBhbmQgZm9ydGguCj4+Cj4+IEFzIHVzdWFsLCBj
b21tZW50cyBhbmQgcmV2aWV3cyBhcmUgd2VsY29tZS4KPiAKPiBOb3Qgc2VlaW5nIHdoeSB0aGlz
IG5lZWRzIHRvIGJlIHNvIHNwZWNpYWxpemVkIChuYXRpdmVseSBpbXBsZW1lbnRlZCBpbgo+IGRt
LXpvbmVkKS4gIERpZCB5b3UgdHJ5IHN0YWNraW5nIGRtLXdyaXRlY2FjaGUgb24gZG0tem9uZWQ/
Cj4gCmRtLXpvbmVkIGlzIHVzaW5nIHRoZSByYW5kb20td3JpdGUgem9uZXMgaW50ZXJuYWxseSB0
byBzdGFnZSB3cml0ZXMgdG8gCnRoZSBzZXF1ZW50aWFsIHpvbmVzLCBzbyBpbiBlZmZlY3QgaXQg
YWxyZWFkeSBoYXMgYW4gaW50ZXJuYWwgY2FjaGluZy4KQWxsIHRoaXMgcGF0Y2ggZG9lcyBpcyB0
byB1c2UgYSBkaWZmZXJlbnQgZGV2aWNlIGZvciB0aGUgYWxyZWFkeSBwcmVzZW50Cm1lY2hhbmlz
bS4KVXNpbmcgZG0td3JpdGVjYWNoZSB3b3VsZCBiZSBpZ25vcmFudCBvZiB0aGF0IG1lY2hhbmlz
bSwgbGVhZGluZyB0byAKZG91YmxlIGNhY2hpbmcgYW5kIGRldHJpbWVudGFsIHJlc3VsdHMuCgpD
aGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVh
ZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwg
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwg
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==

