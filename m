Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7A411198EDD
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 10:54:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585644846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lmHd8FkJXvpjyXAqSacvGG+taFqcwGMscwGEjPqVN8M=;
	b=MsAwUUOCmsDFDUU4et9lVodV31vygczggc4t+hrEGGi8+DMfYBBSgPzFpfOj+w7JaZYnWg
	DrZ5R9jkySOkQEkE15If7O5+hK7FqMk8CLl4SLDMJDVHH56hEzq9sDSzdOJS+Z2o5lTX92
	eNDjCGDIbSqKm8R2KOnKOaz0PRagTfM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-8JXv9PIPMnu562Q6oqKYHg-1; Tue, 31 Mar 2020 04:54:04 -0400
X-MC-Unique: 8JXv9PIPMnu562Q6oqKYHg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62617107ACC9;
	Tue, 31 Mar 2020 08:53:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9055E1001925;
	Tue, 31 Mar 2020 08:53:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 45D2018089C8;
	Tue, 31 Mar 2020 08:53:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V8rLlt022695 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 31 Mar 2020 04:53:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0F5F02166B2F; Tue, 31 Mar 2020 08:53:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B8022166B2A
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 08:53:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6BB86882642
	for <dm-devel@redhat.com>; Tue, 31 Mar 2020 08:53:18 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-42-6DY97_0GPHKPdC5d71eNRA-1;
	Tue, 31 Mar 2020 04:53:15 -0400
X-MC-Unique: 6DY97_0GPHKPdC5d71eNRA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5106CAC84;
	Tue, 31 Mar 2020 08:53:13 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200327071459.67796-1-hare@suse.de>
	<20200327071459.67796-5-hare@suse.de>
	<CO2PR04MB2343240ACAC524067A074813E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <3167d430-9987-150b-363d-dfce119a04b8@suse.de>
Date: Tue, 31 Mar 2020 10:53:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB2343240ACAC524067A074813E7C80@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02V8rLlt022695
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 4/4] dm-zoned: allow for device size smaller
 than the capacity
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

T24gMy8zMS8yMCAyOjQ5IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzAzLzI3
IDE2OjE1LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IGRtLXpvbmVkIHJlcXVpcmVzIHNldmVy
YWwgem9uZXMgZm9yIG1ldGFkYXRhIGFuZCBjaHVuayBiaXRtYXBzLAo+PiBzbyBpdCBjYW5ub3Qg
ZXhwb3NlIHRoZSBlbnRpcmUgY2FwYWNpdHkgYXMgdGhlIGRldmljZSBzaXplLgo+PiBPcmlnaW5h
bGx5IHRoZSBjb2RlIHdvdWxkIGNoZWNrIGZvciB0aGUgY2FwYWNpdHkgYmVpbmcgZXF1YWwgdG8K
Pj4gdGhlIGRldmljZSBzaXplLCB3aGljaCBpcyBhcmd1YWJseSB3cm9uZy4KPj4gU28gcmVsYXgg
dGhpcyBjaGVjayBhbmQgaW5jcmVhc2UgdGhlIGludGVyZmFjZSB2ZXJzaW9uIG51bWJlcgo+PiB0
byBzaWduYWwgdG8gdXNlcnNwYWNlIHRoYXQgaXQgY2FuIHNldCBhIHNtYWxsZXIgZGV2aWNlIHNp
emUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgo+
PiAtLS0KPj4gICBkcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jIHwgNCArKy0tCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMgYi9kcml2ZXJzL21kL2RtLXpvbmVk
LXRhcmdldC5jCj4+IGluZGV4IDdlYzlkZGUyNDUxNi4uODlhODI1ZDEwMzRlIDEwMDY0NAo+PiAt
LS0gYS9kcml2ZXJzL21kL2RtLXpvbmVkLXRhcmdldC5jCj4+ICsrKyBiL2RyaXZlcnMvbWQvZG0t
em9uZWQtdGFyZ2V0LmMKPj4gQEAgLTcxNSw3ICs3MTUsNyBAQCBzdGF0aWMgaW50IGRtel9nZXRf
em9uZWRfZGV2aWNlKHN0cnVjdCBkbV90YXJnZXQgKnRpLCBjaGFyICpwYXRoKQo+PiAgIAlhbGln
bmVkX2NhcGFjaXR5ID0gZGV2LT5jYXBhY2l0eSAmCj4+ICAgCQkJCX4oKHNlY3Rvcl90KWJsa19x
dWV1ZV96b25lX3NlY3RvcnMocSkgLSAxKTsKPj4gICAJaWYgKHRpLT5iZWdpbiB8fAo+PiAtCSAg
ICAoKHRpLT5sZW4gIT0gZGV2LT5jYXBhY2l0eSkgJiYgKHRpLT5sZW4gIT0gYWxpZ25lZF9jYXBh
Y2l0eSkpKSB7Cj4+ICsJICAgICgodGktPmxlbiA+IGRldi0+Y2FwYWNpdHkpICYmICh0aS0+bGVu
ID4gYWxpZ25lZF9jYXBhY2l0eSkpKSB7Cj4+ICAgCQl0aS0+ZXJyb3IgPSAiUGFydGlhbCBtYXBw
aW5nIG5vdCBzdXBwb3J0ZWQiOwo+IAo+IFRoZSBtZXNzYWdlIGlzIG5vdyB3cm9uZy4gQWxzbywg
dGhlIGNvbmRpdGlvbiBjYW4gbm93IGJlIHNpbXBsaWZpZWQgdG86Cj4gCj4gaWYgKCh0aS0+YmVn
aW4gKyB0aS0+bGVuKSA+IGFsaWduZWRfY2FwYWNpdHkpIHsKPiAKPiBTaW5jZSBhbGlnbmVkIGNh
cGFjaXR5IGlzIGVxdWFsIG9yIHNtYWxsZXIgdGhhbiBkZXYgY2FwYWNpdHkuIEFuZCB3ZSBoYXZl
IHRvCj4gYWNjb3VudCBmb3IgdGhlIHBvdGVudGlhbCBub24temVybyBiZWdpbi4KPiAKX0FjdHVh
bGx5XyBJIHdvdWxkIGZvcmJpZCBmb3IgJ3RpLT5iZWdpbicgdG8gYmUgYW55dGhpbmcgb3RoZXIg
dGhhbiAwLgpGb3IgYSB6b25lZCBkZXZpY2UgdGhlcmUgaXMgbm8gcG9pbnQgaW4gYWxsb3dpbmcg
Zm9yIHBhcnRpYWwgaGFuZGxpbmcgYXQgCmFsbC4KUHJvYmxlbSBpcyB0aGF0ICdkZXYtPmNhcGFj
aXR5JyBpcyB0aGUgY2FwYWNpdHkgb2YgdGhlIHpvbmVkIGJsb2NrIApkZXZpY2UsIHdoZXJlYXMg
J3RpLWxlbicgaXMgdGhlIGV4cG9ydGVkIGNhcGFjaXR5IG9mIHRoZSBkZXZpY2UtbWFwcGVyIApk
ZXZpY2UsIHdoaWNoIGlzIHNtYWxsZXIgdGhhbiB0aGUgZGV2aWNlIGNhcGFjaXR5IGJ5IHRoZSBu
dW1iZXIgb2YgCm1ldGFkYXRhIGJsb2Nrcy96b25lcy4KCj4+ICAgCQlyZXQgPSAtRUlOVkFMOwo+
PiAgIAkJZ290byBlcnI7Cj4+IEBAIC0xMDA4LDcgKzEwMDgsNyBAQCBzdGF0aWMgaW50IGRtel9t
ZXNzYWdlKHN0cnVjdCBkbV90YXJnZXQgKnRpLCB1bnNpZ25lZCBpbnQgYXJnYywgY2hhciAqKmFy
Z3YsCj4+ICAgCj4+ICAgc3RhdGljIHN0cnVjdCB0YXJnZXRfdHlwZSBkbXpfdHlwZSA9IHsKPj4g
ICAJLm5hbWUJCSA9ICJ6b25lZCIsCj4+IC0JLnZlcnNpb24JID0gezEsIDIsIDB9LAo+PiArCS52
ZXJzaW9uCSA9IHsxLCAzLCAwfSwKPj4gICAJLmZlYXR1cmVzCSA9IERNX1RBUkdFVF9TSU5HTEVU
T04gfCBETV9UQVJHRVRfWk9ORURfSE0sCj4+ICAgCS5tb2R1bGUJCSA9IFRISVNfTU9EVUxFLAo+
PiAgIAkuY3RyCQkgPSBkbXpfY3RyLAo+Pgo+IAo+IEkgZG8gbm90IHRoaW5rIHRoaXMgaXMgbmVh
cmx5IGVub3VnaDogZG16X2luaXRfem9uZXMoKSBpcyBzdGlsbCBjb25zaWRlcmluZyB0aGUKPiBl
bnRpcmUgZHJpdmUgYW5kIGRvZXMgYSB6b25lIHJlcG9ydCBmcm9tIDAgb24gdGhlIGJhY2tlbmQg
YmRldi4gSXQgc2hvdWxkIHN0YXJ0Cj4gYXQgdGktPmJlZ2luIGFuZCB1cCB0byB0aS0+YmVnaW4r
dGktPmxlbiwgbm8gPwo+IApZZXMsIGFuZCBuby4gSSB3YW50IHRvIGRpc2FsbG93ICd0aS0+YmVn
aW4nIHRvIGJlIGFueXRoaW5nIGVsc2UgdGhhbiAwIAphcyB0aS0+YmVnaW4gYW5kIHRpLT5sZW4g
YXJlIHJlbGF0aXZlIHRvIGV4cG9ydGVkIGRldmljZS1tYXBwZXIgZGV2aWNlLCAKYW5kIHdlIGFs
d2F5cyB3YW50IHRvIGhhdmUgYmxvY2sgMCBtYXBwZWQgOi0pCgpBbmQgYXMgc3VjaCBkbXpfaW5p
dF96b25lcygpIG5lZWRzIHRvIGNvdmVyIGFsbCB6b25lcywgYXMgdGhpcyBpcyAKcmVsYXRpdmUg
dG8gdGhlIHpvbmVkIGJsb2NrIGRldmljZS4KCj4gRnVydGhlcm1vcmUsIHRoaXMgaW50cm9kdWNl
IGEgY2hhbmdlIGluIHRoZSBtZWFuaW5nIG9mIHRoZSB6b25lIElELiBTaW5jZSB0aGlzCj4gaXMg
c2V0IHRvIHRoZSBpbmRleCBvZiB0aGUgem9uZSBpbiB0aGUgcmVwb3J0IChwYXRjaCAxKSwgaWYg
dGhlIG1hcHBpbmcgaXMKPiBwYXJ0aWFsIGFuZCB0aGUgem9uZSByZXBvcnQgZG9lcyBub3Qgc3Rh
cnQgYXQgMCwgdGhlbiB6b25lIElEIGlzIG5vdCB6b25lIG51bWJlcgo+IG9uIHRoZSBkZXZpY2Ug
YW55bW9yZS4gU28gZG16X3N0YXJ0X2Jsb2NrKCkgbmVlZHMgdG8gYmUgb2Zmc2V0IGJ5IHRpLT5i
ZWdpbgo+IG90aGVyd2lzZSBJT3Mgd2lsbCBnbyB0byB0aGUgd3Jvbmcgem9uZXMuCj4gCkFzIEkg
c2FpZDogV2Ugd2lsbCBuZXZlciBkbyBhIHBhcnRpYWwgbWFwcGluZy4KV2hhdCB0aGlzIHBhdGNo
IGRvZXMgaXQgdG8gYnJpbmcgdGhlIGRldmljZS1tYXBwZXIgbWFwcGluZyBpbi1saW5lIHdpdGgg
CnRoZSBleHBvcnRlZCBkZXZpY2Ugc2l6ZS4KCk9yaWdpbmFsbHkgd2Ugd291bGQgZXhwb3J0IGEg
ZGV2aWNlLW1hcHBlciBtYXBwaW5nIGZvciBibG9ja3MgdXAgdG8gdGhlIAp6b25lLWRldmljZSBj
YXBhY2l0eS4gQXMgdGhlIHJlc3VsdGluZyBkZXZpY2UtbWFwcGVyIGJsb2NrIGRldmljZSBoYXMg
YSAKc21hbGxlciBjYXBhY2l0eSB0aGFuIHRoZSBtYXBwaW5nIHdvdWxkIGFsbG93IGZvciB0aG9z
ZSAnc3BhcmUnIGJsb2NrcyAKd291bGQgbmV2ZXIgYmVlbiB1c2VkLCB0aHVzIHRoZSBpbnZhbGlk
IG1hcHBpbmcgd2FzIG5ldmVyIHRyaWdnZXJlZC4KCldoYXQgdGhpcyBwYXRjaCBkb2VzIGlzIHRv
IGJyaW5nIHRoZSBkZXZpY2UtbWFwcGVyIG1hcHBpbmcgaW4tbGluZSB3aXRoIAp0aGUgZXhwb3J0
ZWQgYmxvY2sgZGV2aWNlIGNhcGFjaXR5LCBzbyB0aGF0IHdlIGRvbid0IGhhdmUgYW4gaW52YWxp
ZCAKbWFwcGluZy4gTm90aGluZyBlbHNlIGhhcyAoYW5kIHNob3VsZCkgYmUgY2hhbmdlZC4KCkVz
cGVjaWFsbHkgbm90IHRoZSBwYXJ0aWFsIHpvbmVkIGRldmljZSBoYW5kbGluZyA6LSkKCkNoZWVy
cywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0
b3JhZ2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBs
aXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xp
c3RpbmZvL2RtLWRldmVs

