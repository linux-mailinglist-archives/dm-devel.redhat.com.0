Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 010981D1C02
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 19:14:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589390087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vmgpcgwYfaRr8CExUjvXQQmzJ4nmQMhbK0LjfbwlcKg=;
	b=hFFmxhTaqIpXhCICv4WBU2NGWhbfwN+Sg/mnRysZqHAEH7idgeVNPO7+Co0J/3L1wmqcKZ
	kkiAsB48FkSh8EPCnhK1OFRNI0+X2Z2A/ftkIySjUre58hrqKxs2HPSZ4ag7GesYPjBUD9
	6wXUBxZvMpfmW3gPJpvjoKg6+iQO3mY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-sKjfstW2NO2Cf83L8HTGiQ-1; Wed, 13 May 2020 13:13:59 -0400
X-MC-Unique: sKjfstW2NO2Cf83L8HTGiQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 046E7801504;
	Wed, 13 May 2020 17:13:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 499FF81640;
	Wed, 13 May 2020 17:13:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5D7F1809547;
	Wed, 13 May 2020 17:13:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DHDlJF011609 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 13:13:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9DCBE2029F82; Wed, 13 May 2020 17:13:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDCD52029F78
	for <dm-devel@redhat.com>; Wed, 13 May 2020 17:13:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6F96D1049840
	for <dm-devel@redhat.com>; Wed, 13 May 2020 17:13:43 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-303-ISA-ifZoMrehQwhB5BO3OA-1;
	Wed, 13 May 2020 13:13:38 -0400
X-MC-Unique: ISA-ifZoMrehQwhB5BO3OA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 03222AFBF;
	Wed, 13 May 2020 17:13:39 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200513070843.71528-1-hare@suse.de>
	<BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<5357d0d6-12cb-9585-36ae-9aec206eebb4@suse.de>
	<20200513162502.GA20131@redhat.com>
	<ce79fe87-3d2c-794b-75d6-7e59fd0b447c@suse.de>
	<20200513171042.GA20324@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2540705f-9935-863b-f0e4-4cf29b60a367@suse.de>
Date: Wed, 13 May 2020 19:13:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513171042.GA20324@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DHDlJF011609
X-loop: dm-devel@redhat.com
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] device-mapper: use dynamic debug instead of
 compile-time config option
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMy8yMCA3OjEwIFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMTMg
MjAyMCBhdCAgMTowMXBtIC0wNDAwLAo+IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPiB3
cm90ZToKPiAKPj4gT24gNS8xMy8yMCA2OjI1IFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4+PiBP
biBXZWQsIE1heSAxMyAyMDIwIGF0ICA3OjEwYW0gLTA0MDAsCj4+PiBIYW5uZXMgUmVpbmVja2Ug
PGhhcmVAc3VzZS5kZT4gd3JvdGU6Cj4+Pgo+Pj4+IE9uIDUvMTMvMjAgMTE6NDEgQU0sIERhbWll
biBMZSBNb2FsIHdyb3RlOgo+Pj4+PiBPbiAyMDIwLzA1LzEzIDE2OjEwLCBIYW5uZXMgUmVpbmVj
a2Ugd3JvdGU6Cj4+Pj4+PiBTd2l0Y2ggdG8gdXNlIGR5bmFtaWMgZGVidWcgdG8gYXZvaWQgaGF2
aW5nIHJlY29tcGlsZSB0aGUga2VybmVsCj4+Pj4+PiBqdXN0IHRvIGVuYWJsZSBkZWJ1Z2dpbmcg
bWVzc2FnZXMuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFubmVzIFJlaW5lY2tlIDxo
YXJlQHN1c2UuZGU+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgaW5jbHVkZS9saW51eC9kZXZpY2UtbWFw
cGVyLmggfCA3ICstLS0tLS0KPj4+Pj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCA2IGRlbGV0aW9ucygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2RldmljZS1tYXBwZXIuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNlLW1hcHBlci5oCj4+Pj4+PiBp
bmRleCBlMmQ1MDZkZDgwNWUuLjNkNDM2NWZkMzAwMSAxMDA2NDQKPj4+Pj4+IC0tLSBhL2luY2x1
ZGUvbGludXgvZGV2aWNlLW1hcHBlci5oCj4+Pj4+PiArKysgYi9pbmNsdWRlL2xpbnV4L2Rldmlj
ZS1tYXBwZXIuaAo+Pj4+Pj4gQEAgLTU1NiwxMyArNTU2LDggQEAgdm9pZCAqZG1fdmNhbGxvYyh1
bnNpZ25lZCBsb25nIG5tZW1iLCB1bnNpZ25lZCBsb25nIGVsZW1fc2l6ZSk7Cj4+Pj4+PiAgICNk
ZWZpbmUgRE1JTkZPKGZtdCwgLi4uKSBwcl9pbmZvKERNX0ZNVChmbXQpLCAjI19fVkFfQVJHU19f
KQo+Pj4+Pj4gICAjZGVmaW5lIERNSU5GT19MSU1JVChmbXQsIC4uLikgcHJfaW5mb19yYXRlbGlt
aXRlZChETV9GTVQoZm10KSwgIyNfX1ZBX0FSR1NfXykKPj4+Pj4+IC0jaWZkZWYgQ09ORklHX0RN
X0RFQlVHCj4+Pj4+Cj4+Pj4+IENhbiB3ZSByZW1vdmUgdGhpcyBmcm9tIEtjb25maWcgYXMgYSBj
b25maWcgb3B0aW9uID8KPj4+Pj4KPj4+PiBObywgd2UgY2FuJ3QsIGl0J3MgYmVpbmcgdXNlZCBi
eSBkbS1zbmFwIGFuZCBkbS1pbnRlZ3JpdHkuCj4+Pgo+Pj4gWWVhaCwgdGhleSBwcm92aWRlIGFk
ZGl0aW9uYWwgZGVidWdnaW5nIGlmIGl0cyBzZXQuCj4+Pgo+Pj4gQnV0IHNob3VsZG4ndCB3ZSBw
cmVzZXJ2ZSBvbGQtc3R5bGUgRE1ERUJVRyBpZiBDT05GSUdfRE1fREVCVUcgaXMgc2V0Cj4+PiAo
Y29tcGlsZSB0aW1lIHByaW50aW5nIG9mIGRlYnVnZ2luZykgYnV0IGlmIG5vdCBzZXQsIHVzZSBk
eW5hbWljCj4+PiBkZWJ1Z2dpbmc/Cj4+Pgo+Pj4gVGhpbmsgSSdkIHByZWZlciB0aGF0IGFzIHRo
ZSBpbmNyZW1lbnRhbCBpbXByb3ZlbWVudC4uLiB0aG91Z2h0cz8KPj4+Cj4+IFdvcmtzIGZvciBt
ZTsgSSBqdXN0IGRvbid0IHdhbnQgdG8gcmVjb21waWxlIHRoZSBrZXJuZWwgYW55dGltZSBJCj4+
IG5lZWQgdG8gZGVidWcgZGV2aWNlLW1hcHBlciBzdHVmZi4KPj4KPj4gV2lsbCBiZSByZXNlbmRp
bmcuCj4gCj4gRG9lcyB0aGUgdXNlIG9mIHByX2RlYnVnKCkgY2F1c2UgbWlzc2luZyBuZXdsaW5l
cyAod2l0aCB5b3VyIHBhdGNoKT8KPiAKPiBPbmx5IHRob3VnaHQgdG8gYXNrIHRoaXMgYmVjYXVz
ZSBJJ20gY2hhc2luZyBhbm90aGVyIERNIGlzc3VlIGF0IHRoZQo+IG1vbWVudCBhbmQgaGFwcGVu
ZWQgdG8gc2VlIF9fZG1fc3VzcGVuZCgpJ3MgdXNlIG9mIHByX2RlYnVnKCkgaW5jbHVkZXMKPiBh
biBleHBsaWNpdCBleHRyYSBcbi4KPiAKSG1tLiBOb3QgdGhhdCBJJ3ZlIG5vdGljZWQ7IGJ1dCB5
ZWFoLCB0eXBpY2FsbHkgb25lIHdvdWxkIGhhdmUgdG8gYWRkIAonXG4nIHRvIGFueSBvZiB0aGUg
cHJfWFhYIGNhbGxzLiBCdXQgdGhlbiBpdCBkZXBlbmRzIG9uIHRoZSB3cmFwcGVyIApiZWluZyB1
c2VkLiBJJ2xsIGNoZWNrLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tl
ICAgICAgICAgICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4
MDkgKEFHIE7DvHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIK
CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

