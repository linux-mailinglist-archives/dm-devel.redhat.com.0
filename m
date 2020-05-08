Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 86FFE1CB718
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 20:25:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588962357;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oobVWN94cZ6Ox44tob2ecOgfF81/fHuvidH0e5/ndyA=;
	b=ZBXbcoBNyALutbyAEaOitZmWoe0vHB8InF2aK2JWXHQk5iK0W+FqtwhlIv4LWF0LY1uG5e
	4ZIePdBY+A/6JJyY6SspHJ2nqWyAcdo1AjfvG3Gw4uf5wklehsotaHqjhUT82JavRIBKvJ
	o1RTHZJx+QO0LgPvNoDlMmtyofpsEno=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-28-R97pY4-8NRaxaYJ7s2SW3A-1; Fri, 08 May 2020 14:25:55 -0400
X-MC-Unique: R97pY4-8NRaxaYJ7s2SW3A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E397474;
	Fri,  8 May 2020 18:25:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6047B6109E;
	Fri,  8 May 2020 18:25:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 028E24CAA0;
	Fri,  8 May 2020 18:25:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 048IPKac007162 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 14:25:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4E2021054EE8; Fri,  8 May 2020 18:25:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A3E91054EB0
	for <dm-devel@redhat.com>; Fri,  8 May 2020 18:25:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4999580CDB0
	for <dm-devel@redhat.com>; Fri,  8 May 2020 18:25:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-413-ysyFW5daMfmZWZow3AYm4Q-1;
	Fri, 08 May 2020 14:25:13 -0400
X-MC-Unique: ysyFW5daMfmZWZow3AYm4Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 9869DABEC;
	Fri,  8 May 2020 18:25:14 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<20200508090332.40716-2-hare@suse.de>
	<20200508162955.GA18662@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <9dee23c7-76ed-d80b-bfe2-9d2930488316@suse.de>
Date: Fri, 8 May 2020 20:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508162955.GA18662@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 048IPKac007162
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH 01/14] dm-zoned: add 'status' and 'message'
	callbacks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS84LzIwIDY6MjkgUE0sIE1pa2UgU25pdHplciB3cm90ZToKPiBPbiBGcmksIE1heSAwOCAy
MDIwIGF0ICA1OjAzYW0gLTA0MDAsCj4gSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+IHdy
b3RlOgo+IAo+PiBBZGQgY2FsbGJhY2tzIHRvIHN1cHBseSBpbmZvcm1hdGlvbiBmb3IgJ2Rtc2V0
dXAgc3RhdHVzJwo+PiBhbmQgJ2Rtc2V0dXAgaW5mbycsIGFuZCBpbXBsZW1lbnQgdGhlIG1lc3Nh
Z2UgJ3JlY2xhaW0nCj4+IHRvIHN0YXJ0IHRoZSByZWNsYWltIHdvcmtlci4KPiAKPiBTYW1lIGZl
ZWRiYWNrIGZyb20gYmVmb3JlOgo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vYXJjaGl2ZXMvZG0t
ZGV2ZWwvMjAyMC1NYXJjaC9tc2cwMDE4OS5odG1sCj4gCj4gV2hvL1doYXQgd2lsbCB1c2UgdGhl
ICdyZWNsYWltJyBtZXNzYWdlPyAgU2hvdWxkbid0IGl0IGJlIGRvY3VtZW50ZWQ/Cj4gVGhpbmsg
dGhlIGRtel9zdGF0dXMgY2hhbmdlcyBzaG91bGQgYmUgc3BsaXQgb3V0IGZyb20gdGhpcyByZWNs
YWltCj4gbWVzc2FnZT8KPiAKJ3JlY2xhaW0nIG1lYW5zIHRoYXQgZG0tem9uZWQgc2hvdWxkIHN0
YXJ0IG1vdmluZyB6b25lcyBmcm9tIHRoZSByYW5kb20gCnpvbmVzIHRvIHRoZSBzZXF1ZW50aWFs
IHpvbmVzIHRvIGZyZWUgdXAgbW9yZSByYW5kb20gem9uZXMuClRoZXJlJ3MgYSB0aHJlc2hvbGQg
YWZ0ZXIgd2hpY2ggaXQnbGwgc3RhcnQgYXV0b21hdGljYWxseSwgYnV0IHRoaXMgCmFsbG93cyB5
b3UgdG8gc3RhcnQgcmVjbGFpbSBldmVuIGlmIHRoZSB0aHJlc2hvbGQgaXNuJ3QgcmVhY2hlZC4K
WW91IG1pZ2h0IGJlIHJpZ2h0LCBpdCBzaG91bGQgYmUgZG9jdW1lbnRlZC4KKFdoZXJlPyBJbiB0
aGUgY29kZT8pCgpBcyBmb3Igc3BsaXR0aW5nIHRoaW5ncyBvZmY7IHllYWgsIEkgY291bGQ7IG1h
eWJlIEkgc2hvdWxkIGlmIHRoZSAKJ3JlY2xhaW0nIG1lc3NhZ2UgdHVybnMgb3V0IHRvIGJlIGNv
bnRyb3ZlcnNpYWwuLi4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAg
ICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5
IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoK
LS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cu
cmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

