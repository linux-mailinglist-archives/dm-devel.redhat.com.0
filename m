Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 2CDAE1D1BC8
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 19:01:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589389317;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V9juDkf/7J+ej7yYvfw/izj+WrTMZpCXNRpD1yBAok4=;
	b=fGPFDJ1qBYCPbP59gmgC9z0Pa4K6X46Kfb8tEa/oc5S3nFV/VXKw6UeIkEZgujIrqqr3/t
	Q5pa8jVJBBjQGPpS6YcWKSB6ocMgVqQFeDz8f6ZrJ9DWyx5oIsIPygZKj5QWF4nx9bDaVO
	xHtWZSZfW3W5LMCMxmYmBg06skN2It8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-dieG57tONAeF-yine168gg-1; Wed, 13 May 2020 13:01:54 -0400
X-MC-Unique: dieG57tONAeF-yine168gg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 379A9835B44;
	Wed, 13 May 2020 17:01:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DFC035D9C5;
	Wed, 13 May 2020 17:01:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AAD0E4E561;
	Wed, 13 May 2020 17:01:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04DH1VER010370 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 13:01:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B5432157F24; Wed, 13 May 2020 17:01:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 707D92166BA3
	for <dm-devel@redhat.com>; Wed, 13 May 2020 17:01:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 081BA1064C6C
	for <dm-devel@redhat.com>; Wed, 13 May 2020 17:01:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-404-bBokFbKBPL2UADMo8Vs2dA-1;
	Wed, 13 May 2020 13:01:22 -0400
X-MC-Unique: bBokFbKBPL2UADMo8Vs2dA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 2A29FAC11;
	Wed, 13 May 2020 17:01:23 +0000 (UTC)
To: Mike Snitzer <snitzer@redhat.com>
References: <20200513070843.71528-1-hare@suse.de>
	<BY5PR04MB6900AD28F5B6B6C3A8AEAA5EE7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<5357d0d6-12cb-9585-36ae-9aec206eebb4@suse.de>
	<20200513162502.GA20131@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <ce79fe87-3d2c-794b-75d6-7e59fd0b447c@suse.de>
Date: Wed, 13 May 2020 19:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200513162502.GA20131@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04DH1VER010370
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMy8yMCA2OjI1IFBNLCBNaWtlIFNuaXR6ZXIgd3JvdGU6Cj4gT24gV2VkLCBNYXkgMTMg
MjAyMCBhdCAgNzoxMGFtIC0wNDAwLAo+IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPiB3
cm90ZToKPiAKPj4gT24gNS8xMy8yMCAxMTo0MSBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4+
PiBPbiAyMDIwLzA1LzEzIDE2OjEwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+Pj4gU3dpdGNo
IHRvIHVzZSBkeW5hbWljIGRlYnVnIHRvIGF2b2lkIGhhdmluZyByZWNvbXBpbGUgdGhlIGtlcm5l
bAo+Pj4+IGp1c3QgdG8gZW5hYmxlIGRlYnVnZ2luZyBtZXNzYWdlcy4KPj4+Pgo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+Pj4+IC0tLQo+Pj4+ICAg
aW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmggfCA3ICstLS0tLS0KPj4+PiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1n
aXQgYS9pbmNsdWRlL2xpbnV4L2RldmljZS1tYXBwZXIuaCBiL2luY2x1ZGUvbGludXgvZGV2aWNl
LW1hcHBlci5oCj4+Pj4gaW5kZXggZTJkNTA2ZGQ4MDVlLi4zZDQzNjVmZDMwMDEgMTAwNjQ0Cj4+
Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9kZXZpY2UtbWFwcGVyLmgKPj4+PiArKysgYi9pbmNsdWRl
L2xpbnV4L2RldmljZS1tYXBwZXIuaAo+Pj4+IEBAIC01NTYsMTMgKzU1Niw4IEBAIHZvaWQgKmRt
X3ZjYWxsb2ModW5zaWduZWQgbG9uZyBubWVtYiwgdW5zaWduZWQgbG9uZyBlbGVtX3NpemUpOwo+
Pj4+ICAgI2RlZmluZSBETUlORk8oZm10LCAuLi4pIHByX2luZm8oRE1fRk1UKGZtdCksICMjX19W
QV9BUkdTX18pCj4+Pj4gICAjZGVmaW5lIERNSU5GT19MSU1JVChmbXQsIC4uLikgcHJfaW5mb19y
YXRlbGltaXRlZChETV9GTVQoZm10KSwgIyNfX1ZBX0FSR1NfXykKPj4+PiAtI2lmZGVmIENPTkZJ
R19ETV9ERUJVRwo+Pj4KPj4+IENhbiB3ZSByZW1vdmUgdGhpcyBmcm9tIEtjb25maWcgYXMgYSBj
b25maWcgb3B0aW9uID8KPj4+Cj4+IE5vLCB3ZSBjYW4ndCwgaXQncyBiZWluZyB1c2VkIGJ5IGRt
LXNuYXAgYW5kIGRtLWludGVncml0eS4KPiAKPiBZZWFoLCB0aGV5IHByb3ZpZGUgYWRkaXRpb25h
bCBkZWJ1Z2dpbmcgaWYgaXRzIHNldC4KPiAKPiBCdXQgc2hvdWxkbid0IHdlIHByZXNlcnZlIG9s
ZC1zdHlsZSBETURFQlVHIGlmIENPTkZJR19ETV9ERUJVRyBpcyBzZXQKPiAoY29tcGlsZSB0aW1l
IHByaW50aW5nIG9mIGRlYnVnZ2luZykgYnV0IGlmIG5vdCBzZXQsIHVzZSBkeW5hbWljCj4gZGVi
dWdnaW5nPwo+IAo+IFRoaW5rIEknZCBwcmVmZXIgdGhhdCBhcyB0aGUgaW5jcmVtZW50YWwgaW1w
cm92ZW1lbnQuLi4gdGhvdWdodHM/Cj4gCldvcmtzIGZvciBtZTsgSSBqdXN0IGRvbid0IHdhbnQg
dG8gcmVjb21waWxlIHRoZSBrZXJuZWwgYW55dGltZSBJIG5lZWQgCnRvIGRlYnVnIGRldmljZS1t
YXBwZXIgc3R1ZmYuCgpXaWxsIGJlIHJlc2VuZGluZy4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIu
IEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5n
CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUz
IDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVs
aXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhh
dC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

