Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005F608390
	for <lists+dm-devel@lfdr.de>; Sat, 22 Oct 2022 04:17:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666405073;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kqIj3P+7qNAmvkaUmOYXJAniWlHkEK47vH9rgpj+qR0=;
	b=eHbETimm9b4k2DnZlIruj0+2jKkWcA3XT6W05R8T8yfztwZ7BTVunXgESh9CU2RxTlLrnj
	Bc5VC8eL5FMswxM/UY+8daxf3eyjYTlxuOEoSTMm8y7nI8w37aQWvDQ40a4vQ3OzbF6Q28
	WFdCphlLqieL/vRpivMbIKkTi3rkDro=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-575-DlF8g-LfPWK6dxSNhbjg7Q-1; Fri, 21 Oct 2022 22:17:51 -0400
X-MC-Unique: DlF8g-LfPWK6dxSNhbjg7Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D0D1F8027EB;
	Sat, 22 Oct 2022 02:17:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0CD4AC06218;
	Sat, 22 Oct 2022 02:17:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1A84E19465A3;
	Sat, 22 Oct 2022 02:17:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BFD741946586
 for <dm-devel@listman.corp.redhat.com>; Sat, 22 Oct 2022 02:17:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 99EBB40C94D4; Sat, 22 Oct 2022 02:17:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 91F5E40C94CE
 for <dm-devel@redhat.com>; Sat, 22 Oct 2022 02:17:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73C1085A59D
 for <dm-devel@redhat.com>; Sat, 22 Oct 2022 02:17:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-92-JYeGAsPzOGeXKp3k7G52ig-1; Fri, 21 Oct 2022 22:17:38 -0400
X-MC-Unique: JYeGAsPzOGeXKp3k7G52ig-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5165161FB5;
 Sat, 22 Oct 2022 02:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A758C433D6;
 Sat, 22 Oct 2022 02:11:03 +0000 (UTC)
Date: Fri, 21 Oct 2022 19:11:02 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: =?utf-8?B?WWFuZywgWGlhby/mnagg5pmT?= <yangx.jy@fujitsu.com>
Message-ID: <Y1NRNtToQTjs0Dbd@magnolia>
References: <YyHKUhOgHdTKPQXL@bfoster> <YyIBMJzmbZsUBHpy@magnolia>
 <a6e7f4eb-0664-bbe8-98d2-f8386b226113@fujitsu.com>
 <e3d51a6b-12e9-2a19-1280-5fd9dd64117c@fujitsu.com>
 <deb54a77-90d3-df44-1880-61cce6e3f670@fujitsu.com>
 <1444b9b5-363a-163c-0513-55d1ea951799@fujitsu.com>
 <Yzt6eWLuX/RTjmjj@magnolia>
 <f196bcab-6aa2-6313-8a7c-f8ab409621b7@fujitsu.com>
 <Yzx64zGt2kTiDYaP@magnolia>
 <6a83a56e-addc-f3c4-2357-9589a49bf582@fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <6a83a56e-addc-f3c4-2357-9589a49bf582@fujitsu.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: Re: [dm-devel] [PATCH] xfs: fail dax mount if reflink is enabled on
 a partition
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: "hch@infradead.org" <hch@infradead.org>, toshi.kani@hpe.com,
 dm-devel@redhat.com, "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>,
 Brian Foster <bfoster@redhat.com>, "david@fromorbit.com" <david@fromorbit.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?UnVhbiwgU2hpeWFuZy/pmK4g5LiW6Ziz?= <ruansy.fnst@fujitsu.com>,
 =?utf-8?B?R290b3UsIFlhc3Vub3JpL+S6lOWztiDlurfmloc=?= <y-goto@fujitsu.com>,
 Jeff Moyer <jmoyer@redhat.com>, zwisler@kernel.org,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVGh1LCBPY3QgMjAsIDIwMjIgYXQgMTA6MTc6NDVQTSArMDgwMCwgWWFuZywgWGlhby/mnagg
5pmTIHdyb3RlOgo+IE9uIDIwMjIvMTAvNSAyOjI2LCBEYXJyaWNrIEouIFdvbmcgd3JvdGU6Cj4g
PiBOb3RpY2UgdGhpcyBsaW5lIGluIGdlbmVyaWMvNDcwOgo+ID4gCj4gPiAkWEZTX0lPX1BST0cg
LXQgLWMgInRydW5jYXRlICRMRU4iIC1jICJtbWFwIC1TIDAgJExFTiIgLWMgIm13cml0ZSAwICRM
RU4iIFwKPiA+IAktYyAibG9nX3dyaXRlcyAtZCAkTE9HV1JJVEVTX05BTUUgLW0gcHJldW5tYXAi
IFwKPiA+IAktZiAkU0NSQVRDSF9NTlQvdGVzdAo+ID4gCj4gPiBUaGUgc2Vjb25kIHhmc19pbyBj
b21tYW5kIGNyZWF0ZXMgYSBNQVBfU1lOQyBtbWFwIG9mIHRoZQo+ID4gU0NSQVRDSF9NTlQvdGVz
dCBmaWxlLCBhbmQgdGhlIHRoaXJkIGNvbW1hbmQgbWVtY3B5J3MgYnl0ZXMgdG8gdGhlCj4gPiBt
YXBwaW5nIHRvIGludm9rZSB0aGUgd3JpdGUgcGFnZSBmYXVsdCBoYW5kbGVyLgo+ID4gCj4gPiBU
aGUgZm91cnRoIGNvbW1hbmQgdGVsbHMgdGhlIGRtLWxvZ3dyaXRlcyBkcml2ZXIgZm9yICRMT0dX
UklURVNfTkFNRQo+ID4gKGFrYSB0aGUgYmxvY2sgZGV2aWNlIGNvbnRhaW5pbmcgdGhlIG1vdW50
ZWQgWEZTIGZpbGVzeXN0ZW0pIHRvIGNyZWF0ZSBhCj4gPiBtYXJrIGNhbGxlZCAicHJldW5tYXAi
LiAgVGhpcyBtYXJrIGNhcHR1cmVzIHRoZSBleGFjdCBzdGF0ZSBvZiB0aGUgYmxvY2sKPiA+IGRl
dmljZSBpbW1lZGlhdGVseSBhZnRlciB0aGUgd3JpdGUgZmF1bHRzIGNvbXBsZXRlLCBzbyB0aGF0
IHdlIGNhbiBjb21lCj4gPiBiYWNrIHRvIGl0IGxhdGVyLiAgVGhlcmUgYXJlIGEgZmV3IHRoaW5n
cyB0byBub3RlIGhlcmU6Cj4gPiAKPiA+ICAgICgxKSBXZSBkaWQgbm90IHRlbGwgdGhlIGZzIHRv
IHBlcnNpc3QgYW55dGhpbmc7Cj4gPiAgICAoMikgV2UgY2FuJ3QgdXNlIGRtLXNuYXBzaG90IGhl
cmUsIGJlY2F1c2UgZG0tc25hcHNob3Qgd2lsbCBmbHVzaCB0aGUKPiA+ICAgICAgICBmcyAoSSB0
aGluaz8pOyBhbmQKPiA+ICAgICgzKSBUaGUgZnMgaXMgc3RpbGwgbW91bnRlZCwgc28gdGhlIHN0
YXRlIG9mIHRoZSBibG9jayBkZXZpY2UgYXQgdGhlCj4gPiAgICAgICAgbWFyayByZWZsZWN0cyBh
IGRpcnR5IFhGUyB3aXRoIGEgbG9nIHRoYXQgbXVzdCBiZSByZXBsYXllZC4KPiA+IAo+ID4gVGhl
IG5leHQgdGhpbmcgdGhlIHRlc3QgZG9lcyBpcyB1bm1vdW50IHRoZSBmcywgcmVtb3ZlIHRoZSBk
bS1sb2d3cml0ZXMKPiA+IGRyaXZlciB0byBzdG9wIHJlY29yZGluZywgYW5kIGNoZWNrIHRoZSBm
czoKPiA+IAo+ID4gX2xvZ193cml0ZXNfdW5tb3VudAo+ID4gX2xvZ193cml0ZXNfcmVtb3ZlCj4g
PiBfZG10aGluX2NoZWNrX2ZzCj4gPiAKPiA+IFRoaXMgZW5zdXJlcyB0aGF0IHRoZSBwb3N0LXVt
b3VudCBmcyBpcyBjb25zaXN0ZW50LiAgTm93IHdlIHdhbnQgdG8gcm9sbAo+ID4gYmFjayB0byB0
aGUgcGxhY2Ugd2UgbWFya2VkIHRvIHNlZSBpZiB0aGUgbXdyaXRlIGRhdGEgbWFkZSBpdCB0byBw
bWVtLgo+ID4gSXQqc2hvdWxkKiAgaGF2ZSwgc2luY2Ugd2UgYXNrZWQgZm9yIGEgTUFQX1NZTkMg
bWFwcGluZyBvbiBhIGZzZGF4Cj4gPiBmaWxlc3lzdGVtIHJlY29yZGVkIG9uIGEgcG1lbSBkZXZp
Y2U6Cj4gPiAKPiA+ICMgY2hlY2sgcHJlLXVubWFwIHN0YXRlCj4gPiBfbG9nX3dyaXRlc19yZXBs
YXlfbG9nIHByZXVubWFwICRETVRISU5fVk9MX0RFVgo+ID4gX2RtdGhpbl9tb3VudAo+ID4gCj4g
PiBkbS1sb2d3cml0ZXMgY2FuJ3QgYWN0dWFsbHkgcm9sbCBiYWNrd2FyZHMgaW4gdGltZSB0byBh
IG1hcmssIHNpbmNlIGl0Cj4gPiBvbmx5IHJlY29yZHMgbmV3IGRpc2sgY29udGVudHMuICBJdC9j
YW4vICBob3dldmVyIHJvbGwgZm9yd2FyZCBmcm9tCj4gPiB3aGF0ZXZlciBwb2ludCBpdCBiZWdh
biByZWNvcmRpbmcgd3JpdGVzIHRvIHRoZSBtYXJrLCBzbyB0aGF0J3Mgd2hhdCBpdAo+ID4gZG9l
cy4KPiA+IAo+ID4gSG93ZXZlciAtLSByZW1lbWJlciBub3RlICgzKSBmcm9tIGVhcmxpZXIuICBX
aGVuIHdlIF9kbXRoaW5fbW91bnQgYWZ0ZXIKPiA+IHJlcGxheWluZyB0aGUgbG9nIHRvIHRoZSAi
cHJldW5tYXAiIG1hcmssIFhGUyB3aWxsIHNlZSB0aGUgZGlydHkgWEZTIGxvZwo+ID4gYW5kIHRy
eSB0byByZWNvdmVyIHRoZSBYRlMgbG9nLiAgVGhpcyBpcyB3aGVyZSB0aGUgcmVwbGF5IHByb2Js
ZW1zIGNyb3AKPiA+IHVwLiAgVGhlIFhGUyBsb2cgcmVjb3JkcyBhIG1vbm90b25pY2FsbHkgaW5j
cmVhc2luZyBzZXF1ZW5jZSBudW1iZXIKPiA+IChMU04pIHdpdGggZXZlcnkgbG9nIHVwZGF0ZSwg
YW5kIHdoZW4gdXBkYXRlcyBhcmUgd3JpdHRlbiBpbnRvIHRoZQo+ID4gZmlsZXN5c3RlbSwgdGhh
dCBMU04gaXMgYWxzbyB3cml0dGVuIGludG8gdGhlIGZpbGVzeXN0ZW0gYmxvY2suICBMb2cKPiA+
IHJlY292ZXJ5IGFsc28gcmVwbGF5cyB1cGRhdGVzIGludG8gdGhlIGZpbGVzeXN0ZW0sIGJ1dCB3
aXRoIHRoZSBhZGRlZAo+ID4gYmVoYXZpb3IgdGhhdCBpdCBza2lwcyBhIGJsb2NrIHJlcGxheSBp
ZiB0aGUgYmxvY2sncyBMU04gaXMgaGlnaGVyIHRoYW4KPiA+IHRoZSB0cmFuc2FjdGlvbiBiZWlu
ZyByZXBsYXllZC4gIElPV3MsIHdlIG5ldmVyIHJlcGxheSBvbGRlciBibG9jawo+ID4gY29udGVu
dHMgb3ZlciBuZXdlciBibG9jayBjb250ZW50cy4KPiA+IAo+ID4gRm9yIGRtLWxvZ3dyaXRlcyB0
aGlzIGlzIGEgbWFqb3IgcHJvYmxlbSwgYmVjYXVzZSB0aGVyZSBjb3VsZCBiZSBtb3JlCj4gPiBm
aWxlc3lzdGVtIHVwZGF0ZXMgd3JpdHRlbiB0byB0aGUgWEZTIGxvZyBhZnRlciB0aGUgbWFyayBp
cyBtYWRlLiAgTFNOcwo+ID4gd2lsbCB0aGVuIGJlIGhhbmRlZCBvdXQgbGlrZSB0aGlzOgo+ID4g
Cj4gPiBta2ZzX2xzbiAgICAgICAgICAgICAgICAgcHJldW5tYXBfbHNuICAgICAgICAgICAgIHVt
b3VudF9sc24KPiA+ICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgICAgICAgICAg
ICAgICAgICAgIHwKPiA+ICAgIHwtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLXx8LS0tLS0tLS0t
LXwtLS0tLS0tLS0tLXwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgICAg
ICAgIHwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgeHh4X2xzbiAgICAgeXl5X2xzbgo+
ID4gCj4gPiBMZXQncyBzYXkgdGhhdCBhIG5ldyBtZXRhZGF0YSBibG9jayAiQkJCIiB3YXMgY3Jl
YXRlZCBpbiB1cGRhdGUgInh4eCIKPiA+IGltbWVkaWF0ZWx5IGJlZm9yZSB0aGUgcHJldW5tYXAg
bWFyayB3YXMgbWFkZS4gIFBlciAoMSksIHdlIGRpZG4ndCBmbHVzaAo+ID4gdGhlIGZpbGVzeXN0
ZW0gYmVmb3JlIHRha2luZyB0aGUgbWFyaywgd2hpY2ggbWVhbnMgdGhhdCB0aGUgbmV3IGJsb2Nr
J3MKPiA+IGNvbnRlbnRzIGV4aXN0IG9ubHkgaW4gdGhlIGxvZyBhdCB0aGlzIHBvaW50Lgo+ID4g
Cj4gPiBMZXQgdXMgZnVydGhlciBzYXkgdGhhdCB0aGUgbmV3IGJsb2NrIHdhcyBhZ2FpbiBjaGFu
Z2VkIGluIHVwZGF0ZSAieXl5IiwKPiA+IHdoZXJlIHByZXVubWFwX2xzbiA8IHl5eV9sc24gPD0g
dW1vdW50X2xzbi4gIENsZWFybHksIHl5eV9sc24gPiB4eHhfbHNuLgo+ID4geXl5X2xzbiBpcyB3
cml0dGVuIHRvIHRoZSBibG9jayBhdCB1bm1vdW50LCBiZWNhdXNlIHVubW91bnRpbmcgZmx1c2hl
cwo+ID4gdGhlIGxvZyBjbGVhbiBiZWZvcmUgaXQgY29tcGxldGVzLiAgVGhpcyBpcyB0aGUgZmly
c3QgdGltZSB0aGF0IEJCQiBldmVyCj4gPiBnZXRzIHdyaXR0ZW4uCj4gPiAKPiA+IF9sb2dfd3Jp
dGVzX3JlcGxheV9sb2cgYmVnaW5zIHJlcGxheWluZyB0aGUgYmxvY2sgZGV2aWNlIGZyb20gbWtm
c19sc24KPiA+IHRvd2FyZHMgcHJldW5tYXBfbHNuLiAgV2hlbiBpdCdzIGRvbmUsIGl0IHdpbGwg
aGF2ZSBhIGxvZyB0aGF0IHJlZmxlY3RzCj4gPiBhbGwgdGhlIGNoYW5nZXMgdXAgdG8gcHJldW5t
YXBfbHNuLiAgUmVjYWxsIGhvd2V2ZXIgdGhhdCBCQkIgaXNuJ3QKPiA+IHdyaXR0ZW4gdW50aWwg
YWZ0ZXIgdGhlIHByZXVubWFwIG1hcmssIHdoaWNoIG1lYW5zIHRoYXQgZG0tbG9nd3JpdGVzIGhh
cwo+ID4gbm8gcmVjb3JkIG9mIEJCQiBiZWZvcmUgcHJldW5tYXBfbHNuLCBzbyBkbS1sb2d3cml0
ZXMgcmVwbGF5IHdvbid0IHRvdWNoCj4gPiBCQkIuICBBdCB0aGlzIHBvaW50LCB0aGUgYmxvY2sg
aGVhZGVyIGZvciBCQkIgaGFzIGEgVVVJRCB0aGF0IG1hdGNoZXMKPiA+IHRoZSBmaWxlc3lzdGVt
LCBidXQgYSBMU04gKHl5eV9sc24pIHRoYXQgaXMgYmV5b25kIHByZXVubWFwX2xzbi4KPiA+IAo+
ID4gWEZTIGxvZyByZWNvdmVyeSBzdGFydHMgdXAsIGFuZCBmaW5kcyB0cmFuc2FjdGlvbiB4eHgu
ICBJdCB3aWxsIHJlYWQgQkJCCj4gPiBmcm9tIGRpc2ssIGJ1dCB0aGVuIGl0IHdpbGwgc2VlIHRo
YXQgaXQgaGFzIGFuIExTTiBvZiB5eXlfbHNuLiAgVGhpcyBpcwo+ID4gbGFyZ2VyIHRoYW4geHh4
X2xzbiwgc28gaXQgY29uY2x1ZGVzIHRoYXQgQkJCIGlzIG5ld2VyIHRoYW4gdGhlIGxvZyBhbmQK
PiA+IG1vdmVzIG9uIHRvIHRoZSBuZXh0IGxvZyBpdGVtLiAgTm8gb3RoZXIgbG9nIGl0ZW1zIHRv
dWNoIEJCQiwgc28KPiA+IHJlY292ZXJ5IGZpbmlzaGVzLCBhbmQgbm93IHdlIGhhdmUgYSBmaWxl
c3lzdGVtIGNvbnRhaW5pbmcgb25lIG1ldGFkYXRhCj4gPiBibG9jayAoQkJCKSBmcm9tIHRoZSBm
dXR1cmUuICBUaGlzIGlzIGFuIGluY29uc2lzdGVudCBmaWxlc3lzdGVtLCBhbmQKPiA+IGhhcyBj
YXVzZWQgZmFpbHVyZXMgaW4gdGhlIHRlc3RzIHRoYXQgdXNlIGxvZ3dyaXRlcy4KPiA+IAo+ID4g
VG8gd29yayBhcm91bmQgdGhpcyBwcm9ibGVtLCBhbGwgd2UgcmVhbGx5IG5lZWQgdG8gZG8gaXMg
cmVpbml0aWFsaXplCj4gPiB0aGUgZW50aXJlIGJsb2NrIGRldmljZSB0byBrbm93biBjb250ZW50
cyBhdCBta2ZzIHRpbWUuICBUaGlzIGNhbiBiZQo+ID4gZG9uZSBleHBlbnNpdmVseSBieSB3cml0
aW5nIHplcm9lcyB0byB0aGUgZW50aXJlIGJsb2NrIGRldmljZSwgb3IgaXQgY2FuCj4gPiBiZSBk
b25lIGNoZWFwbHkgYnkgKGEpIGlzc3VpbmcgRElTQ0FSRCB0byB0aGUgd2hvbGUgdGhlIGJsb2Nr
IGRldmljZSBhdAo+ID4gdGhlIHN0YXJ0IG9mIHRoZSB0ZXN0IGFuZCAoYikgZW5zdXJpbmcgdGhh
dCByZWFkcyBhZnRlciBhIGRpc2NhcmQgYWx3YXlzCj4gPiBwcm9kdWNlIHplcm9lcy4gIG1rZnMu
eGZzIGFscmVhZHkgZG9lcyAoYSksIHNvIHRoZSB0ZXN0IG1lcmVseSBoYXMgdG8KPiA+IGVuc3Vy
ZSAoYikuCj4gPiAKPiA+IGRtLXRoaW5wIGlzIHRoZSBvbmx5IHNvZnR3YXJlIHNvbHV0aW9uIHRo
YXQgcHJvdmlkZXMgKGIpLCBzbyB0aGF0J3Mgd2h5Cj4gPiB0aGlzIHRlc3QgbGF5ZXJzIGRtLWxv
Z3dyaXRlcyBvbiB0b3Agb2YgZG0tdGhpbnAgb24gdG9wIG9mICRTQ1JBVENIX0RFVi4KPiA+IFRo
aXMgY29tYmluYXRpb24gdXNlZCB0byB3b3JrLCBidXQgd2l0aCB0aGUgcGVuZGluZyBwbWVtL2Js
b2NrZGV2Cj4gPiBkaXZvcmNlLCB0aGlzIHN0cmF0ZWd5IGlzIG5vIGxvbmdlciBmZWFzaWJsZS4K
PiAKPiBIaSBEYXJyaWNrLAo+IAo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBkZXRhaWxlZCBleHBs
YW5hdGlvbi4KPiAKPiBDb3VsZCB5b3UgdGVsbCBtZSBpZiBteSB1bmRlcnN0YW5kaW5nIGlzIGNv
cnJlY3QuIEkgdGhpbmsgdGhlIGlzc3VlIGlzIHRoYXQKPiBsb2ctd3JpdGVzIGxvZyBhbmQgWEZT
IGxvZyBtYXkgc2F2ZSB0aGUgZGlmZmVyZW50IHN0YXRlIG9mIGJsb2NrIGRldmljZS4gSXQKPiBp
cyBwb3NzaWJsZSBmb3IgWEZTIGxvZyB0byBzYXZlIHRoZSBtb3JlIHVwZGF0ZXMgdGhhbiBsb2ct
d3JpdGVzIGxvZyBkb2VzLgoKWWVzLgoKPiBJbiB0aGlzIGNhc2UsIHdlIGNhbiByZWNvdmVyeSB0
aGUgYmxvY2sgZGV2aWNlIGJ5IGxvZy13cml0ZXMgbG9nJ3MgcmVwbGF5Cj4gYnV0IHdlIHdpbGwg
Z2V0IHRoZSBpbmNvbnNpc3RlbnQgZmlsZXN5c3RlbSB3aGVuIG1vdW50aW5nIHRoZSBibG9jayBk
ZXZpY2UKPiBiZWNhdXNlIHRoZSBtb3VudCBvcGVyYXRpb24gd2lsbCB0cnkgdG8gcmVjb3Zlcnkg
bW9yZSB1cGRhdGVzIGZvciBYRlMgb24gdGhlCj4gYmxvY2sgZGVpdmNlIGJ5IFhGUyBsb2cuCgpT
b3J0IG9mLi4uCgo+IFdlIG5lZWQgdG8gZml4IHRoZSBpc3N1ZSBieSBkaXNjYXJkaW5nIFhGUyBs
b2cgb24gdGhlIGJsb2NrIGRldmljZS4KPiBta2ZzLnhmcyB3aWxsIHRyeSB0byBkaXNjYXJkIHRo
ZSBibG9ja3MgaW5jbHVkaW5nIFhGUyBsb2cgYnkgY2FsbGluZwo+IGlvY3RsKEJMS0RJU0NBUkQp
ICBidXQgaXQgd2lsbCBpZ25vcmUgZXJyb3Igc2lsZW50bHkgd2hlbiB0aGUgYmxvY2sKPiBkZXZp
Y2UgZG9lc24ndCBzdXBwb3J0IGlvY3RsKEJMS0RJU0NBUkQpLgoKLi4uYnV0IEkgdGhpbmsgaGVy
ZSdzIHdoZXJlIEkgdGhpbmsgeW91ciB1bmRlcnN0YW5kaW5nIGlzbid0IGNvcnJlY3QuCkl0IG1p
Z2h0IGhlbHAgdG8gc2hvdyBob3cgdGhlIG5lc3RlZCBsb2dnaW5nIGNyZWF0ZXMgaXRzIG93biBw
cm9ibGVtcy4KCkZpcnN0LCBsZXQncyBzYXkgdGhlcmUncyBhIGJsb2NrIEIgdGhhdCBjb250YWlu
cyBzb21lIHN0YWxlIGdhcmJhZ2UKQUFBQS4KClhGUyB3cml0ZXMgYSBibG9jayBpbnRvIHRoZSBY
RlMgbG9nIChjYWxsIHRoZSBibG9jayBMKSB3aXRoIHRoZQppbnN0cnVjdGlvbnMgImFsbG9jYXRl
IGJsb2NrIEIgYW5kIHdyaXRlIENDQ0MgdG8gYmxvY2sgQiIuICBkbS1sb2d3cml0ZXMKZG9lc24n
dCBrbm93IG9yIGNhcmUgYWJvdXQgdGhlIGNvbnRlbnRzIG9mIHRoZSBibG9ja3MgdGhhdCBpdCBp
cyB0b2xkIHRvCndyaXRlOyBpdCBvbmx5IGtub3dzIHRoYXQgWEZTIHRvbGQgaXQgdG8gd3JpdGUg
c29tZSBkYXRhICh0aGUKaW5zdHJ1Y3Rpb25zKSB0byBibG9jayBMLiAgU28gaXQgcmVtZW1iZXJz
IHRoZSBmYWN0IHRoYXQgc29tZSBkYXRhIGdvdAp3cml0dGVuIHRvIEwsIGJ1dCBpdCBkb2Vzbid0
IGtub3cgYWJvdXQgQiBhdCBhbGwuCgpBdCB0aGUgcG9pbnQgd2hlcmUgd2UgY3JlYXRlIHRoZSBk
bS1sb2d3cml0ZXMgcHJldW5tYXAgbWFyaywgaXQncyBvbmx5CnRyYWNraW5nIEwuICBJdCBpcyBu
b3QgdHJhY2tpbmcgQi4gICBBZnRlciB0aGUgbWFyayBpcyB0YWtlbiwgdGhlIFhGUwpBSUwgd3Jp
dGVzIENDQ0MgdG8gQiwgYW5kIG9ubHkgdGhlbiBkb2VzIGRtLWxvZ3dyaXRlcyBiZWdpbiB0cmFj
a2luZyBCLgpIZW5jZSBCIGlzIG5vdCBpbmNsdWRlZCBpbiB0aGUgcHJldW5tYXAgbWFyay4gIFRo
ZSBwcmUtdW5tb3VudCBwcm9jZXNzCmluIFhGUyB3cml0ZXMgdG8gdGhlIFhGUyBsb2cgIndyaXRl
IEREREQgdG8gYmxvY2sgQiIgYW5kIHRoZSB1bm1vdW50CnByb2Nlc3MgY2hlY2twb2ludHMgdGhl
IGxvZyBjb250ZW50cywgc28gbm93IGJsb2NrIEIgY29udGFpbnMgY29udGFpbnMKRERERC4KCk5v
dyB0aGUgdGVzdCB3YW50cyB0byByb2xsIHRvIHRoZSBwcmV1bm1hcCBtYXJrLiAgVW5mb3J0dW5h
dGVseSwKZG0tbG9nd3JpdGVzIGRvZXNuJ3QgcmVjb3JkIGZvcm1lciBibG9jayBjb250ZW50cywg
d2hpY2ggbWVhbnMgdGhhdCB0aGUKbG9nIHJlcGxheSB0b29scyBjYW5ub3Qgcm9sbCBiYWNrd2Fy
ZHMgZnJvbSAidW1vdW50IiB0byAicHJldW5tYXAiIC0tCnRoZXkgY2FuIG9ubHkgcm9sbCBmb3J3
YXJkIGZyb20gdGhlIGJlZ2lubmluZy4gIFNvIHRoZXJlJ3Mgbm8gd2F5IHRvCnVuZG8gd3JpdGlu
ZyBEREREIG9yIENDQ0MgdG8gQi4gIElPV3MsIHRoZXJlJ3Mgbm8gd2F5IHRvIHJldmVydCBCJ3MK
c3RhdGUgYmFjayB0byBBQUFBIHdoZW4gZG9pbmcgZG0tbG9nd3JpdGVzIHJlY292ZXJ5LgoKTm93
IFhGUyBsb2cgcmVjb3Zlcnkgc3RhcnRzLiAgSXQgc2VlcyAiYWxsb2NhdGUgYmxvY2sgQiBhbmQg
d3JpdGUgQ0NDQwp0byBibG9jayBCIi4gIEhvd2V2ZXIsIGl0IHJlYWRzIGJsb2NrIEIsIHNlZXMg
dGhhdCBpdCBjb250YWlucyBERERELCBhbmQKaXQgc2tpcHMgd3JpdGluZyBDQ0NDLiAgSW5jb3Jy
ZWN0bHkuICBUaGUgb25seSB3YXkgdG8gYXZvaWQgdGhpcyBpcyB0bwp6ZXJvIEIgYmVmb3JlIHJl
cGxheWluZyB0aGUgZG0tbG9nd3JpdGVzLgoKU28geW91IGNvdWxkIHNvbHZlIHRoZSBwcm9ibGVt
IHZpYSBCTEtESVNDQVJELCBvciB3cml0aW5nIHplcm9lcyB0byB0aGUKZW50aXJlIGJsb2NrIGRl
dmljZSwgb3Igc2Nhbm5pbmcgdGhlIG1ldGFkYXRhIGFuZCB3cml0aW5nIHplcm9lcyB0byBqdXN0
CnRob3NlIGJsb2Nrcywgb3IgYnkgYWRkaW5nIHVuZG8gYnVmZmVyIHJlY29yZHMgdG8gZG0tbG9n
d3JpdGVzIGFuZAp0ZWFjaGluZyBpdCB0byBkbyBhIHByb3BlciByb2xsYmFjay4KCj4gRGlzY2Fy
ZGluZyBYRlMgbG9nIGlzIHdoYXQgeW91IHNhaWQgInJlaW5pdGlhbGl6ZSB0aGUgZW50aXJlIGJs
b2NrCj4gZGV2aWNlIiwgcmlnaHQ/CgpObywgSSByZWFsbHkgbWVhbnQgdGhlIC9lbnRpcmUvIGJs
b2NrIGRldmljZS4KCj4gPiAKPiA+IEkgdGhpbmsgdGhlIG9ubHkgd2F5IHRvIGZpeCB0aGlzIHRl
c3QgaXMgKGEpIHJldmVydCBhbGwgb2YgQ2hyaXN0b3BoJ3MKPiA+IGNoYW5nZXMgc28gZmFyIGFu
ZCBzY3V0dGxlIHRoZSBkaXZvcmNlOyBvciAoYikgY2hhbmdlIHRoaXMgdGVzdCBsaWtlIHNvOgo+
IAo+IFNvcnJ5LCBJIGRpZG4ndCBrbm93IHdoaWNoIENocmlzdG9waCdzIHBhdGNoZXMgbmVlZCB0
byBiZSByZXZlcnRlZD8KPiBDb3VsZCB5b3UgdGVsbCBtZSB0aGUgVVJMIGFib3V0IENocmlzdG9w
aCdzIHBhdGNoZXM/CgpFaCwgaXQncyBhIHdob2xlIGxvbmcgc2VyaWVzIG9mIHBhdGNoZXMgc2N1
dHRsaW5nIHZhcmlvdXMgcGFydHMgd2hlcmUKcG1lbSBjb3VsZCB0YWxrIHRvIHRoZSBibG9jayBs
YXllci4gIEkgZG91YnQgaGUnbGwgYWNjZXB0IHlvdSByZXZlcnRpbmcKaGlzIHJlbW92YWwgY29k
ZS4KCj4gPiAgIDEuIENyZWF0ZSBhIGxhcmdlIHNwYXJzZSBmaWxlIG9uICRURVNUX0RJUiBhbmQg
bG9zZXR1cCB0aGF0IHNwYXJzZQo+ID4gICAgICBmaWxlLiAgVGhlIHJlc3VsdGluZyBsb29wIGRl
dmljZSB3aWxsIG5vdCBoYXZlIGRheCBjYXBhYmlsaXR5Lgo+ID4gCj4gPiAgIDIuIFNldCB1cCB0
aGUgZG10aGluL2RtbG9nd3JpdGVzIHN0YWNrIG9uIHRvcCBvZiB0aGlzIGxvb3AgZGV2aWNlLgo+
ID4gCj4gPiAgIDMuIENhbGwgbWtmcy54ZnMgd2l0aCB0aGUgU0NSQVRDSF9ERVYgKHdoaWNoIGhv
cGVmdWxseSBpcyBhIHBtZW0KPiA+ICAgICAgZGV2aWNlKSBhcyB0aGUgcmVhbHRpbWUgZGV2aWNl
LCBhbmQgc2V0IHRoZSBkYXhpbmhlcml0IGFuZCBydGluaGVyaXQKPiA+ICAgICAgZmxhZ3Mgb24g
dGhlIHJvb3QgZGlyZWN0b3J5LiAgVGhlIHJlc3VsdCBpcyBhIGZpbGVzeXN0ZW0gd2l0aCBhIGRh
dGEKPiA+ICAgICAgc2VjdGlvbiB0aGF0IHRoZSBrZXJuZWwgd2lsbCB0cmVhdCBhcyBhIHJlZ3Vs
YXIgYmxvY2sgZGV2aWNlLCBhCj4gPiAgICAgIHJlYWx0aW1lIHNlY3Rpb24gYmFja2VkIGJ5IHBt
ZW0sIGFuZCB0aGUgbmVjZXNzYXJ5IGZsYWdzIHRvIG1ha2UKPiA+ICAgICAgc3VyZSB0aGF0IHRo
ZSB0ZXN0IGZpbGUgd2lsbCBhY3R1YWxseSBnZXQgZnNkYXggbW9kZS4KPiA+IAo+ID4gICA0LiBB
Y2tub3dsZWRnZSB0aGF0IHdlIG5vIGxvbmdlciBoYXZlIGFueSB3YXkgdG8gdGVzdCBNQVBfU1lO
Qwo+ID4gICAgICBmdW5jdGlvbmFsaXR5IG9uIGV4dDQsIHdoaWNoIG1lYW5zIHRoYXQgZ2VuZXJp
Yy80NzAgaGFzIHRvIG1vdmUgdG8KPiA+ICAgICAgdGVzdHMveGZzLy4KPiAKPiBTb3JyeSwgSSBk
aWRuJ3QgdW5kZXJzdGFuZCB3aHkgdGhlIGFib3ZlIHRlc3QgY2hhbmdlIGNhbiBmaXggdGhlIGlz
c3VlLgoKWEZTIHN1cHBvcnRzIHR3by1kZXZpY2UgZmlsZXN5c3RlbXMgLS0gdGhlICJyZWFsdGlt
ZSIgc2VjdGlvbiwgYW5kIHRoZQoiZGF0YSIgc2VjdGlvbi4gIEZTIG1ldGFkYXRhIGFuZCBsb2cg
YWxsIGxpdmUgaW4gdGhlICJkYXRhIiBzZWN0aW9uLgoKU28gd2UgY2hhbmdlIHRoZSB0ZXN0IHRv
IHNldCB1cCBzb21lIHJlZ3VsYXIgZmlsZXMsIGxvb3AtbW91bnQgdGhlCmZpbGVzLCBzZXQgdXAg
dGhlIHJlcXVpc2l0ZSBkbS1sb2d3cml0ZXMgc3R1ZmYgYXRvcCB0aGUgbG9vcCBkZXZpY2VzLAph
bmQgZm9ybWF0IHRoZSBYRlMgd2l0aCB0aGUgZGF0YSBzZWN0aW9uIGJhY2tlZCBieSB0aGUgZG0t
bG9nd3JpdGVzCmRldmljZSwgYW5kIG1ha2UgdGhlIHJlYWx0aW1lIHNlY3Rpb24gYmFja2VkIGJ5
IHRoZSBwbWVtLgoKVGhpcyB3YXkgdGhlIGxvZyByZXBsYXkgcHJvZ3JhbSBjYW4gYWN0dWFsbHkg
ZGlzY2FyZCB0aGUgZGF0YSBkZXZpY2UKKGJlY2F1c2UgaXQncyBhIHJlZ3VsYXIgZmlsZSkgYW5k
IHJlcGxheSB0aGUgbG9nIGZvcndhcmQgdG8gdGhlIHByZXVubWFwCm1hcmsuICBUaGUgcG1lbSBk
ZXZpY2UgaXMgbm90IGludm9sdmVkIGluIHRoZSByZXBsYXkgYXQgYWxsLCBzaW5jZQpjaGFuZ2Vz
IHRvIGZpbGUgZGF0YSBhcmUgbmV2ZXIgbG9nZ2VkLiAgSXQgbm93IGJlY29tZXMgaXJyZWxldmFu
dCB0aGF0CnBtZW0gbm8gbG9uZ2VyIHN1cHBvcnRzIGRldmljZSBtYXBwZXIuCgo+IENvdWxkIHlv
dSB0ZWxsIG1lIHdoaWNoIHN0ZXAgY2FuIGRpc2NhcmQgWEZTIGxvZz8KCihOb25lIG9mIHRoZSBz
dGVwcyBkbyB0aGF0LikKCj4gSW4gYWRkaXRpb24sIEkgZG9uJ3QgbGlrZSB5b3VyIGlkZWEgYWJv
dXQgdGhlIHRlc3QgY2hhbmdlIGJlY2F1c2UgaXQgd2lsbAo+IG1ha2UgZ2VuZXJpYy80NzAgYmVj
b21lIHRoZSBzcGVjaWFsIHRlc3QgZm9yIFhGUy4gRG8geW91IGtub3cgaWYgd2UgY2FuIGZpeAo+
IHRoZSBpc3N1ZSBieSBjaGFuZ2luZyB0aGUgdGVzdCBpbiBhbm90aGVyIHdheT8gYmxrZGlzY2Fy
ZCAteiBjYW4gZml4IHRoZQo+IGlzc3VlIGJlY2F1c2UgaXQgZG9lcyB6ZXJvLWZpbGwgcmF0aGVy
IHRoYW4gZGlzY2FyZCBvbiB0aGUgYmxvY2sgZGV2aWNlLgo+IEhvd2V2ZXIsIGJsa2Rpc2NhcmQg
LXogd2lsbCB0YWtlIGEgbG90IG9mIHRpbWUgd2hlbiB0aGUgYmxvY2sgZGV2aWNlIGlzCj4gbGFy
Z2UuCgpXZWxsIHdlIC9jb3VsZC8ganVzdCBkbyB0aGF0IHRvbywgYnV0IHRoYXQgd2lsbCBzdWNr
IGlmIHlvdSBoYXZlIDJUQiBvZgpwbWVtLiA7KQoKTWF5YmUgYXMgYW4gYWx0ZXJuYXRpdmUgcGF0
aCB3ZSBjb3VsZCBqdXN0IGNyZWF0ZSBhIHZlcnkgc21hbGwKZmlsZXN5c3RlbSBvbiB0aGUgcG1l
bSBhbmQgdGhlbiBibGtkaXNjYXJkIC16IGl0PwoKVGhhdCBzYWlkIC0tIGRvZXMgcGVyc2lzdGVu
dCBtZW1vcnkgYWN0dWFsbHkgaGF2ZSBhIGZ1dHVyZT8gIEludGVsCnNjdXR0bGVkIHRoZSBlbnRp
cmUgT3B0YW5lIHByb2R1Y3QsIGN4bC5tZW0gc291bmRzIGxpa2UgZXhwYW5zaW9uCmNoYXNzaXMg
ZnVsbCBvZiBEUkFNLCBhbmQgZnNkYXggaXMgaG9ycmlibHkgYnJva2VuIGluIDYuMCAod2VpcmQg
a2VybmVsCmFzc2VydHMgZXZlcnl3aGVyZSkgYW5kIDYuMSAoZXZlcnkgdGltZSBJIHJ1biBmc3Rl
c3RzIG5vdyBJIHNlZSBtYXNzaXZlCmRhdGEgY29ycnVwdGlvbikuCgpGcmFua2x5IGF0IHRoaXMg
cG9pbnQgSSdtIHRlbXB0ZWQganVzdCB0byB0dXJuIG9mIGZzZGF4IHN1cHBvcnQgZm9yIFhGUwpm
b3IgdGhlIDYuMSBMVFMgYmVjYXVzZSBJIGRvbid0IGhhdmUgdGltZSB0byBmaXggaXQuCgotLUQK
Cj4gCj4gQmVzdCBSZWdhcmRzLAo+IFhpYW8gWWFuZwo+IAo+ID4gCj4gPiAtLUQKCi0tCmRtLWRl
dmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

