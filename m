Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42163184A50
	for <lists+dm-devel@lfdr.de>; Fri, 13 Mar 2020 16:15:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584112504;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yBQJtj3jQCFBpIpVX2DMLMLZ2R+J9/RrvI7c42y2ADQ=;
	b=CSkuPi/K/DXIs+rViIF0RJdmwCCwHnq2ysvvQy8MYGJccvyvZsec1XsXdwZ0PiDZApz9d5
	052zZSsLjWh1j/HrlzCUQoqjWS2uQuNw4Kf5JODKkBQX9xY1X0YPzvURXBUBeLzZIFJ97N
	noVUxLTsM0frJn1pXLhFQUFesRpJhBo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-56-q5ygfCwiOfW8MoTOmJZLOA-1; Fri, 13 Mar 2020 11:14:59 -0400
X-MC-Unique: q5ygfCwiOfW8MoTOmJZLOA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD12C1005509;
	Fri, 13 Mar 2020 15:14:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 043E45C1BB;
	Fri, 13 Mar 2020 15:14:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EB79D85EC8;
	Fri, 13 Mar 2020 15:14:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02DFE4YO008164 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Mar 2020 11:14:04 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F46091D66; Fri, 13 Mar 2020 15:14:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from localhost (unknown [10.18.25.174])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BAEEE91D64;
	Fri, 13 Mar 2020 15:14:01 +0000 (UTC)
Date: Fri, 13 Mar 2020 11:14:00 -0400
From: Mike Snitzer <snitzer@redhat.com>
To: Heinz Mauelshagen <heinzm@redhat.com>
Message-ID: <20200313151400.GA20567@redhat.com>
References: <5e49305bc15869c58edea0e6d815a546b9ee2c66.1583792345.git.heinzm@redhat.com>
	<BYAPR04MB5816244DDF2E4EE2F1FAD3A0E7FE0@BYAPR04MB5816.namprd04.prod.outlook.com>
	<f49d23b2-6b2b-1793-32e4-b3527a91922f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f49d23b2-6b2b-1793-32e4-b3527a91922f@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [dm-devel] [PATCH v4] dm ebs: new block size emulating target
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Content-Disposition: inline

T24gVHVlLCBNYXIgMTAgMjAyMCBhdCAgODozOWFtIC0wNDAwLApIZWlueiBNYXVlbHNoYWdlbiA8
aGVpbnptQHJlZGhhdC5jb20+IHdyb3RlOgoKPiBPbiAzLzkvMjAgMTE6NDQgUE0sIERhbWllbiBM
ZSBNb2FsIHdyb3RlOgo+ID5PbiAyMDIwLzAzLzEwIDc6MjYsIGhlaW56bUByZWRoYXQuY29tIHdy
b3RlOgo+ID4+RnJvbTogSGVpbnogTWF1ZWxzaGFnZW4gPGhlaW56bUByZWRoYXQuY29tPgo+ID4+
Cj4gPj5kbSBlYnM6IG5ldyBibG9jayBzaXplIGVtdWxhdGluZyB0YXJnZXQKPiA+Pgo+ID4+VGhp
cyBuZXcgdGFyZ2V0IGlzIHNpbWlsYXIgdG8gdGhlIGxpbmVhciB0YXJnZXQgZXhjZXB0IHRoYXQg
aXQgZW11bGF0ZXMKPiA+PmEgc21hbGxlciBsb2dpY2FsIGJsb2NrIHNpemUgb24gZGV2aWNlcyB3
aXRoIGxhcmdlciBvbmVzLiAgSXQncyBtYWluCj4gPj5wdXJwb3NlIGlzIHRvIGVtdWxhdGUgNTEy
IGJ5dGUgc2VjdG9ycyBvbiA0SyBuYXRpdmUgZGlza3MgKGkuZS4gNTEyZSkuCj4gPj4KPiA+PlNl
ZSBEb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tZWJzLnJzdCBmb3Ig
ZGV0YWlscy4KPiA+Pgo+ID4+Q2hhbmdlcyB2ZXJzdXMgdmVyc2lvbiAzIHNlbnQgb24gMi8xOS8y
MDIwOgo+ID4+Cj4gPj4tIGRvY3VtZW50ICdzdHJ1Y3QgZWJzX2MnIGFuZCByZW5hbWUgaXRzIGJs
b2Nrc2l6ZSBhbmQgYmxvY2sgc2hpZnQgZmllbGRzCj4gPj4tIGlubGluZSBmdW5jdGlvbnMgKGUu
Zy4gX19ucl9ibG9ja3MoKSkKPiA+Pi0gYWRqdXN0IF9fZWJzX3J3X2J2ZWMoKSBmdW5jdGlvbiBo
ZWFkZXIgZm9ybWF0Cj4gPj4tIGFjY2VzcyBwYWdlX2FkZHJlc3MoKSBhZnRlciBidl9wYWdlIGNo
ZWNrOyB0eXBvCj4gPj4tIGF2b2lkIHN1cGVyZmx1b3VzIGNoZWNrIGRlZmluaW5nIGJpX3N0YXR1
cyBpbiBfX2Vic19wcm9jZXNzX2Jpb3MoKQo+ID4+LSBjb3JyZWN0IGluZGVudGF0aW9uCj4gPj4t
IGF2b2lkIG9wX2lzX2ZsdXNoKCkgY2F1c2luZyBSRVFfRlVBIGJpb3MgdG8gYmUKPiA+PiAgIHJl
bWFwcGVkIGhlbmNlIG5vdCBwcm9jZXNzZWQgYnkgdGhlIHRhcmdldAo+ID4+LSBjYWxsIGZsdXNo
X2RjYWNoZV9wYWdlKCkgY29ycmVsYXRlZCB3aXRoIG1lbWNweSgpIHRvIGVuc3VyZQo+ID4+ICAg
RC1jYWNoZSBhbGlhc2luZyBhcyBvZiBjYWNoZSBhbmQgVExCIGZsdXNoaW5nIGd1aWRlbGluZXMK
PiA+Pi0gY29tbWVudHMKPiA+R2VuZXJhbGx5LCB0aGUgY2hhbmdlIGxvZyBpcyBub3QgYWRkZWQg
YXMgcGFydCBvZiB0aGUgY29tbWl0IG1lc3NhZ2UgYW5kCj4gPm1lbnRpb25lZCBhZnRlciB0aGUg
Ii0tLSIgYW5kIGFsbCBjaGFuZ2UgbG9ncyAiZnJvbSB2MSIsICJmcm9tIHYyIiBldGMga2VwdCBz
bwo+ID50aGF0IGV2ZXJ5Ym9keSBjYW4gc2VlIHRoZSBwcm9ncmVzc2lvbi4KPiAKPiAKPiBBcyBv
ZiB0aGUga2VybmVsIHBhdGNoIHN1Ym1pc3Npb24gZ3VpZGVsaW5lcyBpdCBzaG91bGQgYmUgcGFy
dCBvZjoKPiAKPiAnRGVzY3JpYmUgeW91ciBjaGFuZ2VzIGluIGltcGVyYXRpdmUgbW9vZCwgZS5n
LiDigJxtYWtlIHh5enp5IGRvCj4gZnJvdHrigJ0gaW5zdGVhZCBvZiDigJxbVGhpcyBwYXRjaF0g
bWFrZXMgeHl6enkgZG8gZnJvdHrigJ0gb3Ig4oCcW0ldCj4gY2hhbmdlZCB4eXp6eSB0byBkbyBm
cm90euKAnSwgYXMgaWYgeW91IGFyZSBnaXZpbmcgb3JkZXJzIHRvIHRoZQo+IGNvZGViYXNlIHRv
IGNoYW5nZSBpdHMgYmVoYXZpb3VyLicKPiAKPiBUaGUgbGltaXRhdGlvbiB0byB0aGUgdjMgLT4g
djQgY2hhbmdlcyB3YXMgbmVnb3RpYXRlZCB3aXRoIE1pa2UuCj4gSSdsbCBrZWVwIGl0IGFzIGlz
IHVudGlsIGZ1cnRoZXIgZGVjaXNpb24uCgpSaWdodCBidXQgSSBzYWlkIEkgbmVlZCBhIHVzZWZ1
bCBoZWFkZXIgdGhhdCB5b3UgcmVmaW5lIG92ZXIgdGltZTsgYW5kCnRoZW4gdGhlIGluY3JlbWVu
dGFsIGNoYW5nZXMgYmV0d2VlbiB2ZXJzaW9ucyBpbiB0aGUgY3V0ICgtLSkgc2VjdGlvbgpsaWtl
IERhbWllbiBwb2ludGVkIG91dC4KCklmIHlvdSBoYXZlIGEgbmV3IHJldmlzaW9uIGRlZmluaXRl
bHkgZG8gc3RhY2sgdGhlIGluY3JlbWVudGFsIGNoYW5nZQppbmZvIG9uIHRoZSBpbmZvIGZvciBw
cmV2aW91cyByZXZpc2lvbnMuCgpUaGFua3MsCk1pa2UKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlz
dApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kbS1kZXZlbA==

