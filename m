Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2D492D3F4F
	for <lists+dm-devel@lfdr.de>; Wed,  9 Dec 2020 10:58:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607507897;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pC4lNyqi85G5fUyPyi0Bt9L0GliF4Y1z5j3EhSkTFf4=;
	b=X35+YRGfm98Gq7ZdUhXepVd/F+xhAUNZjFRXn14lDNVeHVfTZNp/PaJwu3gHzIYmrBQatv
	mCJUQXTPyqusAw0O9ANTeUE5Q9UCAZLV+Bm6lq8XjmlRvazXswgB/wlJYrE+NDrhGUS6K5
	GGTDoKItqVVFBXHvepfHHyCY+vLCFrY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-4Xyo02k5PImfMTB5ireufA-1; Wed, 09 Dec 2020 04:58:15 -0500
X-MC-Unique: 4Xyo02k5PImfMTB5ireufA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BB3A1922973;
	Wed,  9 Dec 2020 09:58:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 76CD16EF54;
	Wed,  9 Dec 2020 09:58:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC66F1809CA0;
	Wed,  9 Dec 2020 09:58:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B8D8FXe015796 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 8 Dec 2020 08:08:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 30A2D5D705; Tue,  8 Dec 2020 13:08:15 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from ovpn-114-102.rdu2.redhat.com (ovpn-114-102.rdu2.redhat.com
	[10.10.114.102])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93EC85D6AB;
	Tue,  8 Dec 2020 13:08:10 +0000 (UTC)
Message-ID: <35ccbf886b1e02323eff96df480c6d5f1123023e.camel@redhat.com>
From: Qian Cai <qcai@redhat.com>
To: Christoph Hellwig <hch@lst.de>
Date: Tue, 08 Dec 2020 08:08:10 -0500
In-Reply-To: <20201208110403.GA22179@lst.de>
References: <20201201165424.2030647-1-hch@lst.de>
	<920899710c9e8dcce16e561c6d832e4e9c03cd73.camel@redhat.com>
	<20201208110403.GA22179@lst.de>
Mime-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 09 Dec 2020 04:56:16 -0500
Cc: Jens Axboe <axboe@kernel.dk>, linux-s390@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-bcache@vger.kernel.org, Coly Li <colyli@suse.de>,
	linux-raid@vger.kernel.org, Song Liu <song@kernel.org>,
	dm-devel@redhat.com, Linux Next Mailing List <linux-next@vger.kernel.org>,
	linux-block@vger.kernel.org, Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] store a pointer to the block_device in struct bio
	(again)
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIwLTEyLTA4IGF0IDEyOjA0ICswMTAwLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90
ZToKPiBjYW4geW91IHNlbmQgbWUgZGV0YWlscyBvZiB5b3VyIGRldmljZSBtYXBwZXIgc2V0dXAs
IGUuZy4gd2hpY2ggdGFyZ2V0cwo+IGFyZSB1c2VkLCBhcmUgdGhleSB1c2VkIG9uIHRvcCBvZiB3
aG9sZSBkZXZpY2Ugb3IgcGFydGl0aW9ucy4gIERvIHlvdQo+IHVzZSBwYXJ0aXRpb25zIG9uIHRv
cCBvZiB0aGUgZG0gZGV2aWNlcz8gIEFyZSBhbnkgb3RoZXIgc3RhY2tpbmcgZGV2aWNlcwo+IGlu
dm9sdmVkPwoKSXQgaXMgYSBzdGFuZGFyZCBSSEVMOCBpbnN0YWxsYXRpb24gdXNpbmcgImF1dG9w
YXJ0Iiwgc28gSSBkb24ndCB0aGluayBpdCB1c2VzCmFueSBwYXJ0aWN1bGFyIHRhcmdldHMuIEl0
IGlzIGp1c3QgYSBwbGFpbiBMVk0gYmFja2VkIGJ5IGFoY2kgKHNkYTIgYW5kIHNkYjEuClNvbWUg
b3RoZXIgYWZmZWN0ZWQgc3lzdGVtcyB1c2Ugc21hcnRwcWkvTlZNKS4gVGhlIGtlcm5lbCBoYXMg
b25seSBkbS1taXJyb3IKZW5hYmxlZCBidXQgSSBkb24ndCB0aGluayBpdCB1c2VzIGl0IGFueXdh
eS4KCiMgZ3JlcCAtaSBfRE1fIC5jb25maWcgfCBncmVwIC12IF4jCkNPTkZJR19CTEtfREVWX0RN
X0JVSUxUSU49eQpDT05GSUdfRE1fTUlSUk9SPW0KQ09ORklHX0RNX1VFVkVOVD15CgojIGx2ZGlz
cGxheQogIC0tLSBMb2dpY2FsIHZvbHVtZSAtLS0KICBMViBQYXRoICAgICAgICAgICAgICAgIC9k
ZXYvcmhlbF9pYm0tcDl3ci0xMC9ob21lCiAgTFYgTmFtZSAgICAgICAgICAgICAgICBob21lCiAg
VkcgTmFtZSAgICAgICAgICAgICAgICByaGVsX2libS1wOXdyLTEwCiAgTFYgVVVJRCAgICAgICAg
ICAgICAgICBFVFMyUEkteWVkYy03QUo2LU5VUDItdUFZRC02YXBpLWJwOW5xdgogIExWIFdyaXRl
IEFjY2VzcyAgICAgICAgcmVhZC93cml0ZQogIExWIFN0YXR1cyAgICAgICAgICAgICAgYXZhaWxh
YmxlCiAgIyBvcGVuICAgICAgICAgICAgICAgICAxCiAgTFYgU2l6ZSAgICAgICAgICAgICAgICA8
My41NyBUaUIKICBDdXJyZW50IExFICAgICAgICAgICAgIDkzNDY2MgogIFNlZ21lbnRzICAgICAg
ICAgICAgICAgMgogIEFsbG9jYXRpb24gICAgICAgICAgICAgaW5oZXJpdAogIFJlYWQgYWhlYWQg
c2VjdG9ycyAgICAgYXV0bwogIC0gY3VycmVudGx5IHNldCB0byAgICAgODE5MgogIEJsb2NrIGRl
dmljZSAgICAgICAgICAgMjU0OjIKICAgCiAgLS0tIExvZ2ljYWwgdm9sdW1lIC0tLQogIExWIFBh
dGggICAgICAgICAgICAgICAgL2Rldi9yaGVsX2libS1wOXdyLTEwL3Jvb3QKICBMViBOYW1lICAg
ICAgICAgICAgICAgIHJvb3QKICBWRyBOYW1lICAgICAgICAgICAgICAgIHJoZWxfaWJtLXA5d3It
MTAKICBMViBVVUlEICAgICAgICAgICAgICAgIG96YWtiOC0yRFdFLVlCSTktNG5uYy1nd2s4LW1N
dWYtczNFUHNCCiAgTFYgV3JpdGUgQWNjZXNzICAgICAgICByZWFkL3dyaXRlCiAgTFYgU3RhdHVz
ICAgICAgICAgICAgICBhdmFpbGFibGUKICAjIG9wZW4gICAgICAgICAgICAgICAgIDEKICBMViBT
aXplICAgICAgICAgICAgICAgIDcwLjAwIEdpQgogIEN1cnJlbnQgTEUgICAgICAgICAgICAgMTc5
MjAKICBTZWdtZW50cyAgICAgICAgICAgICAgIDEKICBBbGxvY2F0aW9uICAgICAgICAgICAgIGlu
aGVyaXQKICBSZWFkIGFoZWFkIHNlY3RvcnMgICAgIGF1dG8KICAtIGN1cnJlbnRseSBzZXQgdG8g
ICAgIDgxOTIKICBCbG9jayBkZXZpY2UgICAgICAgICAgIDI1NDowCgojIHB2ZGlzcGxheSAKICAt
LS0gUGh5c2ljYWwgdm9sdW1lIC0tLQogIFBWIE5hbWUgICAgICAgICAgICAgICAvZGV2L3NkYTIK
ICBWRyBOYW1lICAgICAgICAgICAgICAgcmhlbF9pYm0tcDl3ci0xMAogIFBWIFNpemUgICAgICAg
ICAgICAgICA8MS44MiBUaUIgLyBub3QgdXNhYmxlIDQuMDAgTWlCCiAgQWxsb2NhdGFibGUgICAg
ICAgICAgIHllcyAoYnV0IGZ1bGwpCiAgUEUgU2l6ZSAgICAgICAgICAgICAgIDQuMDAgTWlCCiAg
VG90YWwgUEUgICAgICAgICAgICAgIDQ3NjY3NQogIEZyZWUgUEUgICAgICAgICAgICAgICAwCiAg
QWxsb2NhdGVkIFBFICAgICAgICAgIDQ3NjY3NQogIFBWIFVVSUQgICAgICAgICAgICAgICAwVHYy
QXotdng3Uy1ITFBkLTY2RmYtdEg2SC1kdGUxLXRqU1o3aQogICAKICAtLS0gUGh5c2ljYWwgdm9s
dW1lIC0tLQogIFBWIE5hbWUgICAgICAgICAgICAgICAvZGV2L3NkYjEKICBWRyBOYW1lICAgICAg
ICAgICAgICAgcmhlbF9pYm0tcDl3ci0xMAogIFBWIFNpemUgICAgICAgICAgICAgICA8MS44MiBU
aUIgLyBub3QgdXNhYmxlIDQuMDAgTWlCCiAgQWxsb2NhdGFibGUgICAgICAgICAgIHllcyAoYnV0
IGZ1bGwpCiAgUEUgU2l6ZSAgICAgICAgICAgICAgIDQuMDAgTWlCCiAgVG90YWwgUEUgICAgICAg
ICAgICAgIDQ3NjkzMQogIEZyZWUgUEUgICAgICAgICAgICAgICAwCiAgQWxsb2NhdGVkIFBFICAg
ICAgICAgIDQ3NjkzMQogIFBWIFVVSUQgICAgICAgICAgICAgICA0TGZaSk4tTnhiSi0zOU9DLVZC
S1AtanY1UC1oY2lLLUJPZGlNTAoKIyBsc2JsayAKTkFNRSAgICAgICAgICAgICAgICAgICAgICAg
IE1BSjpNSU4gUk0gIFNJWkUgUk8gVFlQRSBNT1VOVFBPSU5UCnNkYSAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDg6MCAgICAxICAxLjhUICAwIGRpc2sgCuKUnOKUgHNkYTEgICAgICAgICAgICAg
ICAgICAgICAgICA4OjEgICAgMSAgICAxRyAgMCBwYXJ0IC9ib290CuKUlOKUgHNkYTIgICAgICAg
ICAgICAgICAgICAgICAgICA4OjIgICAgMSAgMS44VCAgMCBwYXJ0IAogIOKUnOKUgHJoZWxfaWJt
LS1wOXdyLS0xMC1yb290IDI1NDowICAgIDAgICA3MEcgIDAgbHZtICAvCiAg4pSU4pSAcmhlbF9p
Ym0tLXA5d3ItLTEwLWhvbWUgMjU0OjIgICAgMCAgMy42VCAgMCBsdm0gIC9ob21lCnNkYiAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDg6MTYgICAxICAxLjhUICAwIGRpc2sgCuKUlOKUgHNkYjEg
ICAgICAgICAgICAgICAgICAgICAgICA4OjE3ICAgMSAgMS44VCAgMCBwYXJ0IAogIOKUlOKUgHJo
ZWxfaWJtLS1wOXdyLS0xMC1ob21lIDI1NDoyICAgIDAgIDMuNlQgIDAgbHZtICAvaG9tZQoKLS0K
ZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVk
aGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

