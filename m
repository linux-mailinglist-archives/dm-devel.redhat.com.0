Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id CE2691CD7A1
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 13:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589196010;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g9mk4eYKWBxKbJAPRIGNQoqZri6RlfnM4WhRYJkvGVA=;
	b=BqSYYWVPTc6FFLCr051bNtiv1rBWdlZrBXCxIxSYsvQyndelr1mM3aIAtWetdr0mjxviof
	b2MoFYhKjKPBFPDGPgwfraAtyIVHbwGR9t+4eRGT3cdJJF3EaV3zZ1yybkhcUf9dqSfC9N
	C4cbzFdN8ESILMHD6JOAw2PCo/s0/mw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-257-L--EjgYRNjq89nv18e9-mA-1; Mon, 11 May 2020 07:20:08 -0400
X-MC-Unique: L--EjgYRNjq89nv18e9-mA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7131C461;
	Mon, 11 May 2020 11:20:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 233A06299C;
	Mon, 11 May 2020 11:20:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F255C4CAA0;
	Mon, 11 May 2020 11:19:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BBJkA4018258 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 07:19:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C41EFF1C70; Mon, 11 May 2020 11:19:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B911AF1C74
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:19:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B97CD1859162
	for <dm-devel@redhat.com>; Mon, 11 May 2020 11:19:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-316-4B3zRjG4MPGvuVV_T7vyuA-1;
	Mon, 11 May 2020 07:19:42 -0400
X-MC-Unique: 4B3zRjG4MPGvuVV_T7vyuA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 78C09AEB1;
	Mon, 11 May 2020 11:19:43 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f3b1182e-45fb-4b8b-71ca-a1b340403260@suse.de>
Date: Mon, 11 May 2020 13:19:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BBJkA4018258
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMS8yMCAxMjo1NSBQTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNS8x
MSAxMTo0NiwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+IE1pa2UsCj4+Cj4+IEkgYW0gc3RpbGwg
c2VlaW5nIHRoZSB3YXJuaW5nOgo+Pgo+PiBbIDE4MjcuODM5NzU2XSBkZXZpY2UtbWFwcGVyOiB0
YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4gYWxpZ25t
ZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNhbF9ibG9j
a19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+PiBbIDE4MjcuODU2
NzM4XSBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNk
aiBjYXVzZWQgYW4KPj4gYWxpZ25tZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3Np
emU9NDA5NiwgbG9naWNhbF9ibG9ja19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwg
c3RhcnQ9MAo+PiBbIDE4MjcuODc0MDMxXSBkZXZpY2UtbWFwcGVyOiB0YWJsZTogMjUzOjE6IGFk
ZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4gYWxpZ25tZW50IGluY29uc2lzdGVu
Y3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNhbF9ibG9ja19zaXplPTQwOTYsCj4+
IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+PiBbIDE4MjcuODkxMDg2XSBkZXZpY2UtbWFw
cGVyOiB0YWJsZTogMjUzOjE6IGFkZGluZyB0YXJnZXQgZGV2aWNlIHNkaiBjYXVzZWQgYW4KPj4g
YWxpZ25tZW50IGluY29uc2lzdGVuY3k6IHBoeXNpY2FsX2Jsb2NrX3NpemU9NDA5NiwgbG9naWNh
bF9ibG9ja19zaXplPTQwOTYsCj4+IGFsaWdubWVudF9vZmZzZXQ9MCwgc3RhcnQ9MAo+Pgo+PiB3
aGVuIG1peGluZyA1MTJCIHNlY3RvciBhbmQgNEtCIHNlY3RvciBkZXZpY2VzLiBJbnZlc3RpZ2F0
aW5nIG5vdy4KPiAKPiAKPiBPSy4gRmlndXJlZCB0aGF0IG9uZSBvdXQ6IHRoZSA1MDBHQiBTU0Qg
SSBhbSB1c2luZyBmb3IgdGhlIHJlZ3VsYXIgZGV2aWNlIGlzCj4gOTc2NzczMTY4IDUxMkIgc2Vj
dG9ycyBjYXBhY2l0eSwgdGhhdCBpcywgbm90IGEgbXVsdGlwbGUgb2YgdGhlIDI1Nk1CIHpvbmUg
c2l6ZSwKPiBhbmQgbm90IGV2ZW4gYSBtdWx0aXBsZSBvZiA0Sy4gVGhpcyBjYXVzZXMgdGhlIGNy
ZWF0aW9uIG9mIGEgMTJNQiBydW50IHpvbmUgb2YKPiAyNDYyNCBzZWN0b3JzLCB3aGljaCBpcyBp
Z25vcmVkLiBCdXQgdGhlIHN0YXJ0IHNlY3RvciBvZiB0aGUgc2Vjb25kIGRldmljZSBpbgo+IHRo
ZSBkbS10YWJsZSByZW1haW5zIDk3Njc3MzE2OCwgc28gbm90IGFsaWduZWQgb24gNEsuIFRoaXMg
Y2F1c2VzCj4gYmRldl9zdGFja19saW1pdHMgdG8gcmV0dXJuIGFuIGVycm9yIGFuZCB0aGUgYWJv
dmUgbWVzc2FnZXMgdG8gYmUgcHJpbnRlZC4KPiAKPiBTbyBJIHRoaW5rIHdlIG5lZWQgdG8gY29t
cGxldGVseSBpZ25vcmUgdGhlIGV2ZW50dWFsICJydW50IiB6b25lIG9mIHRoZSByZWd1bGFyCj4g
ZGV2aWNlIHNvIHRoYXQgZXZlcnl0aGluZyBhbGlnbnMgY29ycmVjdGx5LiBUaGlzIHdpbGwgbmVl
ZCBjaGFuZ2VzIGluIGJvdGgKPiBkbXphZG0gYW5kIGRtLXpvbmVkLgo+IAo+IEhhbm5lcywgSSBj
YW4gaGFjayBzb21ldGhpbmcgb24gdG9wIG9mIHlvdXIgc2VyaWVzLiBPciBjYW4geW91IHJlc2Vu
ZCB3aXRoIHRoYXQKPiBmaXhlZCA/Cj4gCj4gCkkgX3Rob3VnaHRfIEkgaGFkIHRoaXMgZml4ZWQ7
IHRoZSBpZGVhIHdhcyB0byBtYW5pcHVsYXRlIHRoZSAncnVudCcgem9uZSAKc3VjaCB0aGF0IHRo
ZSB6b25lIHdvdWxkIGFsd2F5cyBkaXNwbGF5ZWQgYXMgYSB6b25lIHdpdGggc2FtZSBzaXplIGFz
IAphbGwgdGhlIG90aGVyIHpvbmVzLCBidXQgbWFya2VkIGFzIG9mZmxpbmUuIElFIHRoZSAobG9n
aWNhbCkgem9uZSBsYXlvdXQgCndvdWxkIGFsd2F5cyBiZSBlcXVpZGlzdGFudCwgd2l0aCBubyBy
dW50IHpvbmVzIGluIGJldHdlZW4uCiBGcm9tIHRoYXQgcGVyc3BlY3RpdmUgdGhlIGFjdHVhbCBz
aXplIG9mIHRoZSBydW50IHpvbmUgd291bGRuJ3QgbWF0dGVyIAphdCBhbGwuCgpMZW1tZSBjaGVj
ay4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRl
YW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
bWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJl
cmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwg
bWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9t
YWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

