Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3516A1CD4BA
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 11:19:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589188775;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ITVKZMrh7B3m1Vm8BRVi2pUeHZ+B+gOwV1sRaOOzLps=;
	b=IFVmOkcYyelftUjs+1P1qndATYjKQ/p83IElwymCL7DWJyuIXzahmigel01viiQFfb++By
	RoltamKWU/JUC20Gx0ytkQJg6N36ff7ShZJDTNGjA5tR6RUwkiOvW8a472qZdlqzoJv4oF
	VKiuN5Jlr301PkDmSkh5qfzW/EhbRg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-fjIYfaVmM2GGaRbrirr1OA-1; Mon, 11 May 2020 05:19:33 -0400
X-MC-Unique: fjIYfaVmM2GGaRbrirr1OA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46B2B475;
	Mon, 11 May 2020 09:19:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 53F346C785;
	Mon, 11 May 2020 09:19:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F8831809543;
	Mon, 11 May 2020 09:19:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B9J1Gi004621 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 05:19:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37CB9D29DC; Mon, 11 May 2020 09:19:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 337B5C68E5
	for <dm-devel@redhat.com>; Mon, 11 May 2020 09:18:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 420C480066D
	for <dm-devel@redhat.com>; Mon, 11 May 2020 09:18:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-170-Ad10ejuHOZew_AHdFwiLnA-1;
	Mon, 11 May 2020 05:18:57 -0400
X-MC-Unique: Ad10ejuHOZew_AHdFwiLnA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 06978ABB2;
	Mon, 11 May 2020 09:18:57 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200511082430.39455-1-hare@suse.de>
	<20200511082430.39455-16-hare@suse.de>
	<BY5PR04MB69008424543BE9E497BBEE9DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<0601428c-8c71-06a9-07b9-d7b1b6331c70@suse.de>
	<BY5PR04MB6900D34837D615DB2C1EB80FE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <975783a2-79fd-3453-1a31-18bb85613330@suse.de>
Date: Mon, 11 May 2020 11:18:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900D34837D615DB2C1EB80FE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B9J1Gi004621
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 15/15] dm-zoned: metadata version 2
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

T24gNS8xMS8yMCAxMDo1MSBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNS8x
MSAxNzo0NiwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiA1LzExLzIwIDEwOjM2IEFNLCBE
YW1pZW4gTGUgTW9hbCB3cm90ZToKPj4+IE9uIDIwMjAvMDUvMTEgMTc6MjQsIEhhbm5lcyBSZWlu
ZWNrZSB3cm90ZToKPj4+PiBJbXBsZW1lbnQgaGFuZGxpbmcgZm9yIG1ldGFkYXRhIHZlcnNpb24g
Mi4gVGhlIG5ldyBtZXRhZGF0YSBhZGRzCj4+Pj4gYSBsYWJlbCBhbmQgVVVJRCBmb3IgdGhlIGRl
dmljZSBtYXBwZXIgZGV2aWNlLCBhbmQgYWRkaXRpb25hbCBVVUlECj4+Pj4gZm9yIHRoZSB1bmRl
cmx5aW5nIGJsb2NrIGRldmljZXMuCj4+Pj4gSXQgYWxzbyBhbGxvd3MgZm9yIGFuIGFkZGl0aW9u
YWwgcmVndWxhciBkcml2ZSB0byBiZSB1c2VkIGZvcgo+Pj4+IGVtdWxhdGluZyByYW5kb20gYWNj
ZXNzIHpvbmVzLiBUaGUgZW11bGF0ZWQgem9uZXMgd2lsbCBiZSBwbGFjZWQKPj4+PiBsb2dpY2Fs
bHkgaW4gZnJvbnQgb2YgdGhlIHpvbmVzIGZyb20gdGhlIHpvbmVkIGJsb2NrIGRldmljZSwgY2F1
c2luZwo+Pj4+IHRoZSBzdXBlcmJsb2NrcyBhbmQgbWV0YWRhdGEgdG8gYmUgc3RvcmVkIG9uIHRo
YXQgZGV2aWNlLgo+Pj4+IFRoZSBmaXJzdCB6b25lIG9mIHRoZSBvcmlnaW5hbCB6b25lZCBkZXZp
Y2Ugd2lsbCBiZSB1c2VkIHRvIGhvbGQKPj4+PiBhbm90aGVyLCB0ZXJ0aWFyeSBjb3B5IG9mIHRo
ZSBtZXRhZGF0YTsgdGhpcyBjb3B5IGNhcnJpZXMgYQo+Pj4+IGdlbmVyYXRpb24gbnVtYmVyIG9m
IDAgYW5kIGlzIG5ldmVyIHVwZGF0ZWQ7IGl0J3MganVzdCB1c2VkCj4+Pj4gZm9yIGlkZW50aWZp
Y2F0aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1
c2UuZGU+Cj4+Pj4gUmV2aWV3ZWQtYnk6IEJvYiBMaXUgPGJvYi5saXVAb3JhY2xlLmNvbT4KPj4+
PiBSZXZpZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KPj4+
Cj4+PiBGb3Jnb3QgdG8gcmVhZCB0aHJvdWdoIHRoZSBkb2N1bWVudGF0aW9uIHVwZGF0ZS4gQSBj
b3VwbGUgb2YgY29tbWVudHMgYWRkZWQgYmVsb3cuCj4+Pgo+Pj4+IC0tLQo+Pj4+ICAgIC4uLi9h
ZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL2RtLXpvbmVkLnJzdCAgICAgICAgIHwgIDM0ICsrLQo+
Pj4+ICAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyAgICAgICAgICAgICAgICAgICAg
IHwgMzEwICsrKysrKysrKysrKysrKysrLS0tLQo+Pj4+ICAgIGRyaXZlcnMvbWQvZG0tem9uZWQt
dGFyZ2V0LmMgICAgICAgICAgICAgICAgICAgICAgIHwgMTg1ICsrKysrKysrLS0tLQo+Pj4+ICAg
IGRyaXZlcnMvbWQvZG0tem9uZWQuaCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA3
ICstCj4+Pj4gICAgNCBmaWxlcyBjaGFuZ2VkLCA0MjcgaW5zZXJ0aW9ucygrKSwgMTA5IGRlbGV0
aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
ZGV2aWNlLW1hcHBlci9kbS16b25lZC5yc3QgYi9Eb2N1bWVudGF0aW9uL2FkbWluLWd1aWRlL2Rl
dmljZS1tYXBwZXIvZG0tem9uZWQucnN0Cj4+Pj4gaW5kZXggNzU0N2NlNjM1MTYxLi41NTM3NTJl
YTI1MjEgMTAwNjQ0Cj4+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2Ut
bWFwcGVyL2RtLXpvbmVkLnJzdAo+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
ZGV2aWNlLW1hcHBlci9kbS16b25lZC5yc3QKPj4+PiBAQCAtMzcsOSArMzcsMTMgQEAgQWxnb3Jp
dGhtCj4+Pj4gICAgZG0tem9uZWQgaW1wbGVtZW50cyBhbiBvbi1kaXNrIGJ1ZmZlcmluZyBzY2hl
bWUgdG8gaGFuZGxlIG5vbi1zZXF1ZW50aWFsCj4+Pj4gICAgd3JpdGUgYWNjZXNzZXMgdG8gdGhl
IHNlcXVlbnRpYWwgem9uZXMgb2YgYSB6b25lZCBibG9jayBkZXZpY2UuCj4+Pj4gICAgQ29udmVu
dGlvbmFsIHpvbmVzIGFyZSB1c2VkIGZvciBjYWNoaW5nIGFzIHdlbGwgYXMgZm9yIHN0b3Jpbmcg
aW50ZXJuYWwKPj4+PiAtbWV0YWRhdGEuCj4+Pj4gK21ldGFkYXRhLiBJdCBjYW4gYWxzbyB1c2Ug
YSByZWd1bGFyIGJsb2NrIGRldmljZSB0b2dldGhlciB3aXRoIHRoZSB6b25lZAo+Pj4+ICtibG9j
ayBkZXZpY2U7IGluIHRoYXQgY2FzZSB0aGUgcmVndWxhciBibG9jayBkZXZpY2Ugd2lsbCBiZSBz
cGxpdCBsb2dpY2FsbHkKPj4+PiAraW4gem9uZXMgd2l0aCB0aGUgc2FtZSBzaXplIGFzIHRoZSB6
b25lZCBibG9jayBkZXZpY2UuIFRoZXNlIHpvbmVzIHdpbGwgYmUKPj4+PiArcGxhY2VkIGluIGZy
b250IG9mIHRoZSB6b25lcyBmcm9tIHRoZSB6b25lZCBibG9jayBkZXZpY2UgYW5kIHdpbGwgYmUg
aGFuZGxlZAo+Pj4+ICtqdXN0IGxpa2UgY29udmVudGlvbmFsIHpvbmVzLgo+Pj4+ICAgIAo+Pj4+
IC1UaGUgem9uZXMgb2YgdGhlIGRldmljZSBhcmUgc2VwYXJhdGVkIGludG8gMiB0eXBlczoKPj4+
PiArVGhlIHpvbmVzIG9mIHRoZSBkZXZpY2UocykgYXJlIHNlcGFyYXRlZCBpbnRvIDIgdHlwZXM6
Cj4+Pj4gICAgCj4+Pj4gICAgMSkgTWV0YWRhdGEgem9uZXM6IHRoZXNlIGFyZSBjb252ZW50aW9u
YWwgem9uZXMgdXNlZCB0byBzdG9yZSBtZXRhZGF0YS4KPj4+PiAgICBNZXRhZGF0YSB6b25lcyBh
cmUgbm90IHJlcG9ydGVkIGFzIHVzZWFibGUgY2FwYWNpdHkgdG8gdGhlIHVzZXIuCj4+Pj4gQEAg
LTEyNyw2ICsxMzEsMTMgQEAgcmVzdW1lZC4gRmx1c2hpbmcgbWV0YWRhdGEgdGh1cyBvbmx5IHRl
bXBvcmFyaWx5IGRlbGF5cyB3cml0ZSBhbmQKPj4+PiAgICBkaXNjYXJkIHJlcXVlc3RzLiBSZWFk
IHJlcXVlc3RzIGNhbiBiZSBwcm9jZXNzZWQgY29uY3VycmVudGx5IHdoaWxlCj4+Pj4gICAgbWV0
YWRhdGEgZmx1c2ggaXMgYmVpbmcgZXhlY3V0ZWQuCj4+Pj4gICAgCj4+Pj4gK0lmIGEgcmVndWxh
ciBkZXZpY2UgaXMgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRoIHRoZSB6b25lZCBibG9jayBkZXZp
Y2UsCj4+Pj4gK2EgdGhpcmQgc2V0IG9mIG1ldGFkYXRhICh3aXRob3V0IHRoZSB6b25lIGJpdG1h
cHMpIGlzIHdyaXR0ZW4gdG8gdGhlCj4+Pj4gK3N0YXJ0IG9mIHRoZSB6b25lZCBibG9jayBkZXZp
Y2UuIFRoaXMgbWV0YWRhdGEgaGFzIGEgZ2VuZXJhdGlvbiBjb3VudGVyIG9mCj4+Pj4gKycwJyBh
bmQgd2lsbCBuZXZlciBiZSB1cGRhdGVkIGR1cmluZyBub3JtYWwgb3BlcmF0aW9uOyBpdCBqdXN0
IHNlcnZlcyBmb3IKPj4+PiAraWRlbnRpZmljYXRpb24gcHVycG9zZXMuIFRoZSBmaXJzdCBhbmQg
c2Vjb25kIGNvcHkgb2YgdGhlIG1ldGFkYXRhCj4+Pj4gK2FyZSBsb2NhdGVkIGF0IHRoZSBzdGFy
dCBvZiB0aGUgcmVndWxhciBibG9jayBkZXZpY2UuCj4+Pj4gKwo+Pj4+ICAgIFVzYWdlCj4+Pj4g
ICAgPT09PT0KPj4+PiAgICAKPj4+PiBAQCAtMTM4LDEyICsxNDksMjEgQEAgRXg6Ogo+Pj4+ICAg
IAo+Pj4+ICAgIAlkbXphZG0gLS1mb3JtYXQgL2Rldi9zZHh4Cj4+Pj4gICAgCj4+Pj4gLUZvciBh
IGZvcm1hdHRlZCBkZXZpY2UsIHRoZSB0YXJnZXQgY2FuIGJlIGNyZWF0ZWQgbm9ybWFsbHkgd2l0
aCB0aGUKPj4+PiAtZG1zZXR1cCB1dGlsaXR5LiBUaGUgb25seSBwYXJhbWV0ZXIgdGhhdCBkbS16
b25lZCByZXF1aXJlcyBpcyB0aGUKPj4+PiAtdW5kZXJseWluZyB6b25lZCBibG9jayBkZXZpY2Ug
bmFtZS4gRXg6Ogo+Pj4+ICAgIAo+Pj4+IC0JZWNobyAiMCBgYmxvY2tkZXYgLS1nZXRzaXplICR7
ZGV2fWAgem9uZWQgJHtkZXZ9IiB8IFwKPj4+PiAtCWRtc2V0dXAgY3JlYXRlIGRtei1gYmFzZW5h
bWUgJHtkZXZ9YAo+Pj4+ICtJZiB0d28gZHJpdmVzIGFyZSB0byBiZSB1c2VkLCBib3RoIGRldmlj
ZXMgbXVzdCBiZSBzcGVjaWZpZWQsIHdpdGggdGhlCj4+Pj4gK3JlZ3VsYXIgYmxvY2sgZGV2aWNl
IGFzIHRoZSBmaXJzdCBkZXZpY2UuCj4+Pgo+Pj4gQWN0dWFsbHksIHRoZSB6b25lZCBibG9jayBk
ZXZpY2UgbXVzdCBiZSBmaXJzdC4gT3RoZXJ3aXNlIGRtemFkbSBjb21wbGFpbnMuIFdlCj4+PiBj
YW4gY2hhbmdlIHRoYXQsIG9yIGNoYW5nZSB0aGUgZG9jLiBXaGljaCBkbyB5b3UgcHJlZmVyID8g
Tm8gc3Ryb25nIG9waW5pb24gaGVyZS4KPj4+Cj4+IE5vcGUsIG5vdCBhbnkgbW9yZS4gRml4ZWQg
aXQgaW4gbXkgbG9jYWwgcmVwbyAod2hpY2ggSSBoYXZlbid0IHB1c2hlZCwKPj4gc29ycnkpLgo+
Pgo+PiBCdXQgYWZ0ZXIgdGhlIGxhc3QgZGlzY3Vzc2lvbiB3ZSBoYWQgSSB0aG91Z2h0IGl0IGJl
dHRlciBhbmQgbW9yZQo+PiBjb25zaXN0ZW50IHRvIGhhdmUgdGhlIHJlZ3VsYXIgZGV2aWNlIGZp
cnN0LCBqdXN0IGxpa2UgdGhlIGRldmljZS1tYXBwZXIKPj4gaW50ZXJmYWNlLgo+IAo+IFdvcmtz
IGZvciBtZSAhCj4gCgpJIGRvIGhvcGUgc28gOi0pCkkndmUgc3B1biBhIG5ldyB2ZXJzaW9uIGFn
YWluc3QgdGhlIG1hc3RlciBicmFuY2guCgo+Pgo+Pj4+ICsKPj4+PiArRXg6Ogo+Pj4+ICsKPj4+
PiArCWRtemFkbSAtLWZvcm1hdCAvZGV2L3NkeHggL2Rldi9zZHl5Cj4+Pj4gKwo+Pj4+ICsKPj4+
PiArRm9tYXR0ZWQgZGV2aWNlKHMpIGNhbiBiZSBzdGFydGVkIHdpdGggdGhlIGRtemFkbSB1dGls
aXR5LCB0b28uOgo+Pj4+ICsKPj4+PiArRXg6Ogo+Pj4+ICsKPj4+PiArCWRtemFkbSAtLXN0YXJ0
IC9kZXYvc2R4eCAvZGV2L3NkeXkKPj4+Cj4+PiBBbmQgc2FtZSBoZXJlLCB0aGUgem9uZWQgZGV2
aWNlIG11c3QgY29tZSBmaXJzdC4gSSBhZGRlZCBhIHBhdGNoIHRoYXQgaW50ZXJuYWxseQo+Pj4g
cmV2ZXJzZSB0aGF0IG9yZGVyIGZvciB0aGUgZG0gc3RhcnQgb3BlcmF0aW9uIHNvIHRoYXQgdGhl
IHJlZ3VsYXIgZGV2aWNlIGlzCj4+PiBzcGVjaWZpZWQgZmlyc3QuCj4+Pgo+PiBTZWUgYWJvdmUu
IEkndmUgZml4ZWQgdXAgZG16YWRtIGZvciB0aGlzLgo+Pgo+PiBJIGp1c3QgaGFkbid0IHB1c2hl
ZCB0aGUgcGF0Y2ggYXMgSSB3YW50ZWQgdG8gZ2V0IHRoZSBrZXJuZWwgYml0cwo+PiBzZXR0bGVk
LiBCdXQgbm93IHRoYXQgd2UgaGF2ZSBJJ2xsIGJlIHB1c2hpbmcgdGhlIGRtLXpvbmVkLXRvb2xz
IHVwZGF0ZXMuCj4gCj4gUGxlYXNlIHNlbmQgY2hhbmdlcyBvbiB0b3Agb2YgdGhlICJzdGFnaW5n
IiBicmFuY2guIFlvdXIgZmlyc3QgYmF0Y2ggb2YgY2hhbmdlcwo+IGlzIGFscmVhZHkgbWVyZ2Vk
IGluIHRoYXQgYnJhbmNoLgo+IApSYWguIFNlbmQgYSBuZXcgbWVyZ2UgcmVxdWVzdCBmb3IgJ21h
c3Rlcic7IHdpbGwgYmUgZG9pbmcgYW4gdXBkYXRlIHRvIAp0aGUgJ3N0YWdpbmcnIGJyYW5jaCwg
dG9vLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAg
VGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJu
YmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZl
bCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29t
L21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

