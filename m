Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8F46E198EE7
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 10:56:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585644961;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=jTw2gvFZMtpaVIwbs5jC8ElVRFHrnu8lm3gQgjxhojM=;
	b=RgAwxk2NBc3k3G58dV09F6gmshm2A5hGCUv2PitOCTgoF3I90MG0oVSg5BY3pJ4F/CREU6
	xj+Qkhxy2ZumD7EH2zo/+k7fflurbDt46Qatyof7HRzpvMs8cTaxHnbG7Jnd7Uxs7C5Ug+
	r6ws425r5OL6g4xjhXnNXhBugq718/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-foVfkcDwNiGSqLwQaDu7fw-1; Tue, 31 Mar 2020 04:55:59 -0400
X-MC-Unique: foVfkcDwNiGSqLwQaDu7fw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FB17A0CBF;
	Tue, 31 Mar 2020 08:55:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 92E6396B82;
	Tue, 31 Mar 2020 08:55:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A91E086BE7;
	Tue, 31 Mar 2020 08:55:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V8swh5022871 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 04:54:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 49283D017B; Tue, 31 Mar 2020 08:54:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 454F4167F2
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 08:54:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65A368EC760
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 08:54:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-317-kqBKXHP3OyS0dniLiTPPxA-1;
	Tue, 31 Mar 2020 04:54:53 -0400
X-MC-Unique: kqBKXHP3OyS0dniLiTPPxA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 43DF1AC84;
	Tue, 31 Mar 2020 08:54:52 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-2-hare@suse.de>
	<CO2PR04MB2343EA1C30F6ACC57B36F170E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2ac051c7-b6af-9517-6036-0f074ada3e59@suse.de>
Date: Tue, 31 Mar 2020 10:54:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB2343EA1C30F6ACC57B36F170E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V8swh5022871
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 1/4] dm-zoned: store zone id within the zone
	structure
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

T24gMy8zMS8yMCAyOjU3IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzAzLzI3
IDE2OjE1LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IEluc3RlYWQgb2YgY2FsY3VsYXRpbmcg
dGhlIHpvbmUgaW5kZXggYnkgdGhlIG9mZnNldCB3aXRoaW4gdGhlCj4+IHpvbmUgYXJyYXkgc3Rv
cmUgdGhlIGluZGV4IHdpdGhpbiB0aGUgc3RydWN0dXJlIGl0c2VsZi4KPj4KPj4gU2lnbmVkLW9m
Zi1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+Cj4+IC0tLQo+PiAgIGRyaXZlcnMv
bWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDMgKystCj4+ICAgZHJpdmVycy9tZC9kbS16b25lZC5o
ICAgICAgICAgIHwgMyArKysKPj4gICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS16b25lZC1tZXRh
ZGF0YS5jIGIvZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jCj4+IGluZGV4IGM4Nzg3NTYw
ZmE5Zi4uYWZjZTU5NDA2N2ZiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL21kL2RtLXpvbmVkLW1l
dGFkYXRhLmMKPj4gKysrIGIvZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0YS5jCj4+IEBAIC0x
ODksNyArMTg5LDcgQEAgc3RydWN0IGRtel9tZXRhZGF0YSB7Cj4+ICAgICovCj4+ICAgdW5zaWdu
ZWQgaW50IGRtel9pZChzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQsIHN0cnVjdCBkbV96b25lICp6
b25lKQo+PiAgIHsKPj4gLQlyZXR1cm4gKCh1bnNpZ25lZCBpbnQpKHpvbmUgLSB6bWQtPnpvbmVz
KSk7Cj4+ICsJcmV0dXJuIHpvbmUtPmlkOwo+PiAgIH0KPj4gICAKPj4gICBzZWN0b3JfdCBkbXpf
c3RhcnRfc2VjdChzdHJ1Y3QgZG16X21ldGFkYXRhICp6bWQsIHN0cnVjdCBkbV96b25lICp6b25l
KQo+PiBAQCAtMTExOSw2ICsxMTE5LDcgQEAgc3RhdGljIGludCBkbXpfaW5pdF96b25lKHN0cnVj
dCBibGtfem9uZSAqYmxreiwgdW5zaWduZWQgaW50IGlkeCwgdm9pZCAqZGF0YSkKPj4gICAKPj4g
ICAJSU5JVF9MSVNUX0hFQUQoJnpvbmUtPmxpbmspOwo+PiAgIAlhdG9taWNfc2V0KCZ6b25lLT5y
ZWZjb3VudCwgMCk7Cj4+ICsJem9uZS0+aWQgPSBpZHg7Cj4gCj4gU2VlIG15IGNvbW1lbnQgb24g
cGF0Y2ggNC4gQWxsb3dpbmcgcGFydGlhbCBiZGV2IG1hcHBpbmcgY2hhbmdlcyB0aGUgbWVhbmlu
ZyBvZgo+IHRoaXMgSUQ6IGZvciBhIHBhcnRpYWwgbWFwcGluZywgdGhpcyBpcyBub3QgZXF1YWwg
dG8gdGhlIHpvbmUgbnVtYmVyIGFueW1vcmUuIFNvCj4gd2Ugc2hvdWxkIGRvY3VtZW50IHRoYXQg
KGluIHRoZSBzdHJ1Y3QgZGVjbGFyYXRpb24pLCBhbmQgbWF5IGJlIG1lcmdlIHRoaXMgcGF0Y2gK
PiB3aXRoIHBhdGNoIDQgc2luY2UgdGhleSBhcmUgcmVsYXRlZCBzbyBjbG9zZWx5ID8KPiAKU2Vl
IG15IHJlcGx5IHRvIHBhdGNoIDQuIEkgZG8gbm90IGFsbG93IGZvciBwYXJ0aWFsIG1hcHBpbmcs
IG5vciB3YXMgaXQgCmV2ZXIgdGhlIGludGVudGlvbiB0byBkbyBzby4KVGhlIHpvbmUgbnVtYmVy
aW5nIHdpbGwgbm90IGNoYW5nZS4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWlu
ZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5k
ZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJC
IDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJm
ZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6
Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVs

