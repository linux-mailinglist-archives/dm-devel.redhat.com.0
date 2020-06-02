Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8CA551EB5EA
	for <lists+dm-devel@lfdr.de>; Tue,  2 Jun 2020 08:43:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591080210;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dxk6WY3zMUbhPlqN5ANrLFkAtNQ5y9oeNl0jLK8jAOY=;
	b=WdgL8i0DAYOSs7Fc50gnv/Jju1O5Izzzv96wp7e9EVZc6PYOSwjc/3AbEc77dBqdpm7mCs
	MxRsH34Ynf/gtZzNnUNDMUnat0cUs0Bgm6fut4XJz2A/Va5kf8plmKVpJeKoM9NMsfzPph
	3XCNkONUBeVBzh2yLSWH8G+o9wYHkvE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-5xjBsACfMYqErqAqmbDNAA-1; Tue, 02 Jun 2020 02:43:26 -0400
X-MC-Unique: 5xjBsACfMYqErqAqmbDNAA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 892CC1800D42;
	Tue,  2 Jun 2020 06:43:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 17D9760C80;
	Tue,  2 Jun 2020 06:43:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A27671809543;
	Tue,  2 Jun 2020 06:43:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0526glNJ007064 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 2 Jun 2020 02:42:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2B8291055471; Tue,  2 Jun 2020 06:42:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27BF11055470
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 06:42:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABF50101A525
	for <dm-devel@redhat.com>; Tue,  2 Jun 2020 06:42:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-1-PC-KTeYvO228RIdtSrm0iw-1;
	Tue, 02 Jun 2020 02:42:36 -0400
X-MC-Unique: PC-KTeYvO228RIdtSrm0iw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 29703AC12;
	Tue,  2 Jun 2020 06:42:37 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"snitzer@redhat.com" <snitzer@redhat.com>
References: <20200529173907.40529-1-hare@suse.de>
	<20200529173907.40529-12-hare@suse.de>
	<36914d620ecccdf0397a47703a69b926afd3d283.camel@wdc.com>
	<2d8e74ee-6f33-e832-f081-694d051343ce@suse.de>
	<CY4PR04MB3751E9482466C8485BE7DF6CE78D0@CY4PR04MB3751.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f275321c-ff8f-753f-b61c-62335100f243@suse.de>
Date: Tue, 2 Jun 2020 08:42:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CY4PR04MB3751E9482466C8485BE7DF6CE78D0@CY4PR04MB3751.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0526glNJ007064
X-loop: dm-devel@redhat.com
Cc: "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 11/14] dm-zoned: support arbitrary number of
	devices
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

T24gNi8xLzIwIDE6NTQgQU0sIERhbWllbiBMZSBNb2FsIHdyb3RlOgo+IE9uIDIwMjAvMDUvMzEg
MjI6MDYsIEhhbm5lcyBSZWluZWNrZSB3cm90ZToKPj4gT24gNS8zMS8yMCAxMToxMCBBTSwgRGFt
aWVuIExlIE1vYWwgd3JvdGU6ClsgLi4gXQo+Pj4KPj4+IExvb2tzIGFsbCBnb29kIHRvIG1lLCBi
dXQgdGhpbmtpbmcgbW9yZSBhYm91dCBpdCwgZG9uJ3Qgd2UgbmVlZCB0byBhZGQKPj4+IGEgZGV2
aWNlIGluZGV4IGluIHRoZSBzdXBlciBibG9ja3MgPyBUaGUgcmVhc29uIGlzIHRoYXQgaWYgdGhl
IGRyaXZlCj4+PiBjb25maWd1cmF0aW9uIGNoYW5nZXMgYmV0d2VlbiBzdG9wdC9zdGFydCAoZHJp
dmVzIHJlbW92ZWQsIGFkZGVkIG9yCj4+PiBjaGFuZ2VkIHNsb3RzKSwgdGhlIGRyaXZlIG5hbWVz
IHdpbGwgY2hhbmdlIGFuZCB3aGlsZSB0aGUgdXNlcnNwYWNlCj4+PiB3aWxsIHN0aWxsIGJlIGFi
bGUgdG8gZmluZCB0aGUgZ3JvdXAgb2YgZHJpdmVzIGNvbnN0aXR1dGluZyB0aGUgdGFyZ2V0Cj4+
PiAodXNpbmcgVVVJRDksIHRoZXJlIGlzIG5vIG9idmlvdXMgd2F5IHRvIGZpbmQgb3V0IHdoYXQg
dGhlIG9yaWdpbmFsCj4+PiBkcml2ZSBvcmRlciB3YXMuIFNpbmNlIHRoZSBrZXJuZWwgc2lkZSBy
ZWxpZXMgb24gdGhlIGRyaXZlIGJlaW5nIHBhc3NlZAo+Pj4gdG8gdGhlIGN0ciBmdW5jdGlvbiBp
biB0aGUgb3JkZXIgb2YgdGhlIG1hcHBpbmcsIHdlIG5lZWQgdG8gcHJlc2VydmUKPj4+IHRoYXQu
IE9yIGNoYW5nZSBhbHNvIHRoZSBrZXJuZWwgc2lkZSB0byB1c2UgdGhlIGluZGV4IGluIHRoZSBz
dXBlcgo+Pj4gYmxvY2sgdG8gcHV0IGVhY2ggZHJpdmUgaW4gaXRzIGNvcnJlY3QgZG16LT5kZXZb
XSBzbG90Lgo+Pj4KPj4gQWxyZWFkeSB0YWtlbiBjYXJlIG9mOyBoZXJlJ3Mgd2hlcmUgdGhlIHRl
cnRpYXJ5IHN1cGVyYmxvY2tzIGNvbWUgaW4uCj4+IEVhY2ggc3VwZXJibG9jayBjYXJyaWVzIGl0
cyBvd24gcG9zaXRpb24gKGluIHRoZSAnc2JfYmxvY2snIGZpZWxkKS4KPj4gVGhpcyBpcyB0aGUg
X2Fic29sdXRlXyBwb3NpdGlvbiB3aXRoaW4gdGhlIGVudGlyZSBzZXR1cCwgbm90IHRoZQo+PiBy
ZWxhdGl2ZSBwZXItZGV2aWNlIGJsb2NrIG51bWJlci4KPj4gQW5kIGl0IGFsc28gaGFzIHRoZSBh
YnNvbHV0ZSBudW1iZXIgb2YgYmxvY2tzIGluIHRoZSAnbnJfY2h1bmtzJyBmaWVsZC4KPj4KPj4g
SGVuY2Ugd2Uga25vdyBleGFjdGx5IHdoZXJlIHRoaXMgc3VwZXJibG9jayAoYW5kLCBieSBpbXBs
aWNhdGlvbiwgdGhlCj4+IHpvbmVzIGZvbGxvd2luZyB0aGlzIHN1cGVyYmxvY2spIHNob3VsZCBl
bmQgdXAuIEFuZCB3ZSBrbm93IGhvdyBsYXJnZQo+PiB0aGUgZW50aXJlIHNldHVwIHdpbGwgYmUu
IFNvIGNhbiBpbnNlcnQgdGhlIHN1cGVyYmxvY2sgYXQgdGhlIHJpZ2h0Cj4+IHBvc2l0aW9uIGFu
ZCB0aGVuIGNhbiBjaGVjayBpZiB3ZSBoYXZlIGVub3VnaCB6b25lcyBmb3IgdGhlIGVudGlyZQo+
PiBkZXZpY2UuCj4gCj4gSSBkbyBub3QgZ2V0IGl0IHRob3VnaC4gV2hlcmUgaXMgdGhhdCBjaGVj
a2VkID8gQXQgbGVhc3QgaW4gdGhpcyBwYXRjaCwgZHJpdmVzCj4gYXJlIGluaXRpYWxpemVkIGlu
IHRoZSBvcmRlciBvZiB0aGUgY3RyIGFyZ3VtZW50cywgYW5kIHRoaXMgbG9vcDoKPiAKPiArCQlm
b3IgKGkgPSAxOyBpIDwgZG16LT5ucl9kZGV2czsgaSsrKSB7Cj4gKwkJCWRtei0+ZGV2W2ldLnpv
bmVfb2Zmc2V0ID0gem9uZV9vZmZzZXQ7Cj4gKwkJCXpvbmVfb2Zmc2V0ICs9IGRtei0+ZGV2W2ld
Lm5yX3pvbmVzOwo+ICsJCX0KPiAKPiBpbiBkbXpfZml4dXBfZGV2aWNlcygpIHNldHMgdGhlIHpv
bmUgb2Zmc2V0IGZvciBlYWNoIGRldmljZSBpbiB0aGUgc2FtZSBvcmRlci4KPiBTbyBmb3IgYSBn
aXZlbiBjaHVuayBtYXBwZWQgdG8gYSB6b25lIGlkZW50aWZpZWQgYnkgaXRzIElELCBpZiB0aGUg
ZGV2aWNlIG9yZGVyCj4gY2hhbmdlcywgem9uZSBJRCB3aWxsIGNoYW5nZSBhbmQgdGhlIGNodW5r
IHdpbGwgbm90IGJlIG1hcHBlZCB0byB0aGUgY29ycmVjdAo+IHpvbmUuIFdoYXQgYW0gSSBtaXNz
aW5nIGhlcmUgPwo+IApXZWxsLCBJIF9kaWRfIHN0YXRlIHRoYXQgd2UncmUgbWlzc2luZyBzdXBw
b3J0IGZvciBpdDsgYWxsIEkgZGlkIHdhcyAKcG9pbnRpbmcgb3V0IHRoYXQgdGhlIG1ldGFkYXRh
IGFscmVhZHkgaGFzIHRoZSBjYXBhYmlsaXR5IGZvciBkZXRlY3RpbmcgCmEgbWlzbWF0Y2guIEFu
ZCBJIGRvIHRoaW5rIHdlJ3JlIGdldHRpbmcgYSB3YXJuaW5nIHdoZW4gbG9hZGluZyAKc3VwZXJi
bG9ja3MsIGFuZCB0aGUgc2V0dXAgd291bGQgYmUgcmVqZWN0ZWQuCgpCdXQgdGhlbiBJIGp1c3Qg
Y2hlY2tlZCwgYW5kIHdlJ3JlIGluZGVlZCBtaXNzaW5nIHRoZSBzYl9ibG9jayAKdmFsaWRhdGlv
bi4gV2lsbCBiZSBhZGRpbmcgaXQgc3VjaCB0aGF0IHdlJ3JlIHJlamVjdGluZyBvdXQtb2Ytb3Jk
ZXIgCmRldmljZXMuCgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAg
ICAgICAgICBUZWFtbGVhZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAo
QUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0t
CmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

