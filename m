Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A2DF51CD430
	for <lists+dm-devel@lfdr.de>; Mon, 11 May 2020 10:47:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589186828;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r7CtkRHoAFQtU4swkxpQgnjLpQUL7i1EMIYDbWtYX5M=;
	b=h9Gb4po0Vv93OpnTS1uo042Ali+sXFm0ZlAW+VMGy1PxpqnBmwzwXQ/4Z2CY/JKmly+Tb8
	HS5ztTXsTU5mRZPnQqS+eeC1nIHK9Tk3YWYQfeJjCkQ4QcKf+xWhfJAftLzA89TrV0L6HL
	atMYHspafzmdMb1SvJkyBETQUm5MwHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-DqJlkicRNmuB0tHNLCC4ZA-1; Mon, 11 May 2020 04:47:06 -0400
X-MC-Unique: DqJlkicRNmuB0tHNLCC4ZA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29C6D835B42;
	Mon, 11 May 2020 08:47:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 716771917A;
	Mon, 11 May 2020 08:46:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 14EB91809543;
	Mon, 11 May 2020 08:46:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04B8kjB0001591 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 04:46:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4B8E5D0191; Mon, 11 May 2020 08:46:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 47353D0192
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:46:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7CAF589CA04
	for <dm-devel@redhat.com>; Mon, 11 May 2020 08:46:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-242-ymhrlf2wNk2tkZuCkUXtyw-1;
	Mon, 11 May 2020 04:46:37 -0400
X-MC-Unique: ymhrlf2wNk2tkZuCkUXtyw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id A90A9AC5F;
	Mon, 11 May 2020 08:46:38 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200511082430.39455-1-hare@suse.de>
	<20200511082430.39455-16-hare@suse.de>
	<BY5PR04MB69008424543BE9E497BBEE9DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <0601428c-8c71-06a9-07b9-d7b1b6331c70@suse.de>
Date: Mon, 11 May 2020 10:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB69008424543BE9E497BBEE9DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04B8kjB0001591
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNS8xMS8yMCAxMDozNiBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wNS8x
MSAxNzoyNCwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBJbXBsZW1lbnQgaGFuZGxpbmcgZm9y
IG1ldGFkYXRhIHZlcnNpb24gMi4gVGhlIG5ldyBtZXRhZGF0YSBhZGRzCj4+IGEgbGFiZWwgYW5k
IFVVSUQgZm9yIHRoZSBkZXZpY2UgbWFwcGVyIGRldmljZSwgYW5kIGFkZGl0aW9uYWwgVVVJRAo+
PiBmb3IgdGhlIHVuZGVybHlpbmcgYmxvY2sgZGV2aWNlcy4KPj4gSXQgYWxzbyBhbGxvd3MgZm9y
IGFuIGFkZGl0aW9uYWwgcmVndWxhciBkcml2ZSB0byBiZSB1c2VkIGZvcgo+PiBlbXVsYXRpbmcg
cmFuZG9tIGFjY2VzcyB6b25lcy4gVGhlIGVtdWxhdGVkIHpvbmVzIHdpbGwgYmUgcGxhY2VkCj4+
IGxvZ2ljYWxseSBpbiBmcm9udCBvZiB0aGUgem9uZXMgZnJvbSB0aGUgem9uZWQgYmxvY2sgZGV2
aWNlLCBjYXVzaW5nCj4+IHRoZSBzdXBlcmJsb2NrcyBhbmQgbWV0YWRhdGEgdG8gYmUgc3RvcmVk
IG9uIHRoYXQgZGV2aWNlLgo+PiBUaGUgZmlyc3Qgem9uZSBvZiB0aGUgb3JpZ2luYWwgem9uZWQg
ZGV2aWNlIHdpbGwgYmUgdXNlZCB0byBob2xkCj4+IGFub3RoZXIsIHRlcnRpYXJ5IGNvcHkgb2Yg
dGhlIG1ldGFkYXRhOyB0aGlzIGNvcHkgY2FycmllcyBhCj4+IGdlbmVyYXRpb24gbnVtYmVyIG9m
IDAgYW5kIGlzIG5ldmVyIHVwZGF0ZWQ7IGl0J3MganVzdCB1c2VkCj4+IGZvciBpZGVudGlmaWNh
dGlvbi4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+
Cj4+IFJldmlld2VkLWJ5OiBCb2IgTGl1IDxib2IubGl1QG9yYWNsZS5jb20+Cj4+IFJldmlld2Vk
LWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMuY29tPgo+IAo+IEZvcmdvdCB0
byByZWFkIHRocm91Z2ggdGhlIGRvY3VtZW50YXRpb24gdXBkYXRlLiBBIGNvdXBsZSBvZiBjb21t
ZW50cyBhZGRlZCBiZWxvdy4KPiAKPj4gLS0tCj4+ICAgLi4uL2FkbWluLWd1aWRlL2RldmljZS1t
YXBwZXIvZG0tem9uZWQucnN0ICAgICAgICAgfCAgMzQgKystCj4+ICAgZHJpdmVycy9tZC9kbS16
b25lZC1tZXRhZGF0YS5jICAgICAgICAgICAgICAgICAgICAgfCAzMTAgKysrKysrKysrKysrKysr
KystLS0tCj4+ICAgZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYyAgICAgICAgICAgICAgICAg
ICAgICAgfCAxODUgKysrKysrKystLS0tCj4+ICAgZHJpdmVycy9tZC9kbS16b25lZC5oICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDcgKy0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDQy
NyBpbnNlcnRpb25zKCspLCAxMDkgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tem9uZWQucnN0IGIvRG9jdW1l
bnRhdGlvbi9hZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL2RtLXpvbmVkLnJzdAo+PiBpbmRleCA3
NTQ3Y2U2MzUxNjEuLjU1Mzc1MmVhMjUyMSAxMDA2NDQKPj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9h
ZG1pbi1ndWlkZS9kZXZpY2UtbWFwcGVyL2RtLXpvbmVkLnJzdAo+PiArKysgYi9Eb2N1bWVudGF0
aW9uL2FkbWluLWd1aWRlL2RldmljZS1tYXBwZXIvZG0tem9uZWQucnN0Cj4+IEBAIC0zNyw5ICsz
NywxMyBAQCBBbGdvcml0aG0KPj4gICBkbS16b25lZCBpbXBsZW1lbnRzIGFuIG9uLWRpc2sgYnVm
ZmVyaW5nIHNjaGVtZSB0byBoYW5kbGUgbm9uLXNlcXVlbnRpYWwKPj4gICB3cml0ZSBhY2Nlc3Nl
cyB0byB0aGUgc2VxdWVudGlhbCB6b25lcyBvZiBhIHpvbmVkIGJsb2NrIGRldmljZS4KPj4gICBD
b252ZW50aW9uYWwgem9uZXMgYXJlIHVzZWQgZm9yIGNhY2hpbmcgYXMgd2VsbCBhcyBmb3Igc3Rv
cmluZyBpbnRlcm5hbAo+PiAtbWV0YWRhdGEuCj4+ICttZXRhZGF0YS4gSXQgY2FuIGFsc28gdXNl
IGEgcmVndWxhciBibG9jayBkZXZpY2UgdG9nZXRoZXIgd2l0aCB0aGUgem9uZWQKPj4gK2Jsb2Nr
IGRldmljZTsgaW4gdGhhdCBjYXNlIHRoZSByZWd1bGFyIGJsb2NrIGRldmljZSB3aWxsIGJlIHNw
bGl0IGxvZ2ljYWxseQo+PiAraW4gem9uZXMgd2l0aCB0aGUgc2FtZSBzaXplIGFzIHRoZSB6b25l
ZCBibG9jayBkZXZpY2UuIFRoZXNlIHpvbmVzIHdpbGwgYmUKPj4gK3BsYWNlZCBpbiBmcm9udCBv
ZiB0aGUgem9uZXMgZnJvbSB0aGUgem9uZWQgYmxvY2sgZGV2aWNlIGFuZCB3aWxsIGJlIGhhbmRs
ZWQKPj4gK2p1c3QgbGlrZSBjb252ZW50aW9uYWwgem9uZXMuCj4+ICAgCj4+IC1UaGUgem9uZXMg
b2YgdGhlIGRldmljZSBhcmUgc2VwYXJhdGVkIGludG8gMiB0eXBlczoKPj4gK1RoZSB6b25lcyBv
ZiB0aGUgZGV2aWNlKHMpIGFyZSBzZXBhcmF0ZWQgaW50byAyIHR5cGVzOgo+PiAgIAo+PiAgIDEp
IE1ldGFkYXRhIHpvbmVzOiB0aGVzZSBhcmUgY29udmVudGlvbmFsIHpvbmVzIHVzZWQgdG8gc3Rv
cmUgbWV0YWRhdGEuCj4+ICAgTWV0YWRhdGEgem9uZXMgYXJlIG5vdCByZXBvcnRlZCBhcyB1c2Vh
YmxlIGNhcGFjaXR5IHRvIHRoZSB1c2VyLgo+PiBAQCAtMTI3LDYgKzEzMSwxMyBAQCByZXN1bWVk
LiBGbHVzaGluZyBtZXRhZGF0YSB0aHVzIG9ubHkgdGVtcG9yYXJpbHkgZGVsYXlzIHdyaXRlIGFu
ZAo+PiAgIGRpc2NhcmQgcmVxdWVzdHMuIFJlYWQgcmVxdWVzdHMgY2FuIGJlIHByb2Nlc3NlZCBj
b25jdXJyZW50bHkgd2hpbGUKPj4gICBtZXRhZGF0YSBmbHVzaCBpcyBiZWluZyBleGVjdXRlZC4K
Pj4gICAKPj4gK0lmIGEgcmVndWxhciBkZXZpY2UgaXMgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRo
IHRoZSB6b25lZCBibG9jayBkZXZpY2UsCj4+ICthIHRoaXJkIHNldCBvZiBtZXRhZGF0YSAod2l0
aG91dCB0aGUgem9uZSBiaXRtYXBzKSBpcyB3cml0dGVuIHRvIHRoZQo+PiArc3RhcnQgb2YgdGhl
IHpvbmVkIGJsb2NrIGRldmljZS4gVGhpcyBtZXRhZGF0YSBoYXMgYSBnZW5lcmF0aW9uIGNvdW50
ZXIgb2YKPj4gKycwJyBhbmQgd2lsbCBuZXZlciBiZSB1cGRhdGVkIGR1cmluZyBub3JtYWwgb3Bl
cmF0aW9uOyBpdCBqdXN0IHNlcnZlcyBmb3IKPj4gK2lkZW50aWZpY2F0aW9uIHB1cnBvc2VzLiBU
aGUgZmlyc3QgYW5kIHNlY29uZCBjb3B5IG9mIHRoZSBtZXRhZGF0YQo+PiArYXJlIGxvY2F0ZWQg
YXQgdGhlIHN0YXJ0IG9mIHRoZSByZWd1bGFyIGJsb2NrIGRldmljZS4KPj4gKwo+PiAgIFVzYWdl
Cj4+ICAgPT09PT0KPj4gICAKPj4gQEAgLTEzOCwxMiArMTQ5LDIxIEBAIEV4OjoKPj4gICAKPj4g
ICAJZG16YWRtIC0tZm9ybWF0IC9kZXYvc2R4eAo+PiAgIAo+PiAtRm9yIGEgZm9ybWF0dGVkIGRl
dmljZSwgdGhlIHRhcmdldCBjYW4gYmUgY3JlYXRlZCBub3JtYWxseSB3aXRoIHRoZQo+PiAtZG1z
ZXR1cCB1dGlsaXR5LiBUaGUgb25seSBwYXJhbWV0ZXIgdGhhdCBkbS16b25lZCByZXF1aXJlcyBp
cyB0aGUKPj4gLXVuZGVybHlpbmcgem9uZWQgYmxvY2sgZGV2aWNlIG5hbWUuIEV4OjoKPj4gICAK
Pj4gLQllY2hvICIwIGBibG9ja2RldiAtLWdldHNpemUgJHtkZXZ9YCB6b25lZCAke2Rldn0iIHwg
XAo+PiAtCWRtc2V0dXAgY3JlYXRlIGRtei1gYmFzZW5hbWUgJHtkZXZ9YAo+PiArSWYgdHdvIGRy
aXZlcyBhcmUgdG8gYmUgdXNlZCwgYm90aCBkZXZpY2VzIG11c3QgYmUgc3BlY2lmaWVkLCB3aXRo
IHRoZQo+PiArcmVndWxhciBibG9jayBkZXZpY2UgYXMgdGhlIGZpcnN0IGRldmljZS4KPiAKPiBB
Y3R1YWxseSwgdGhlIHpvbmVkIGJsb2NrIGRldmljZSBtdXN0IGJlIGZpcnN0LiBPdGhlcndpc2Ug
ZG16YWRtIGNvbXBsYWlucy4gV2UKPiBjYW4gY2hhbmdlIHRoYXQsIG9yIGNoYW5nZSB0aGUgZG9j
LiBXaGljaCBkbyB5b3UgcHJlZmVyID8gTm8gc3Ryb25nIG9waW5pb24gaGVyZS4KPiAKTm9wZSwg
bm90IGFueSBtb3JlLiBGaXhlZCBpdCBpbiBteSBsb2NhbCByZXBvICh3aGljaCBJIGhhdmVuJ3Qg
cHVzaGVkLCAKc29ycnkpLgoKQnV0IGFmdGVyIHRoZSBsYXN0IGRpc2N1c3Npb24gd2UgaGFkIEkg
dGhvdWdodCBpdCBiZXR0ZXIgYW5kIG1vcmUgCmNvbnNpc3RlbnQgdG8gaGF2ZSB0aGUgcmVndWxh
ciBkZXZpY2UgZmlyc3QsIGp1c3QgbGlrZSB0aGUgZGV2aWNlLW1hcHBlciAKaW50ZXJmYWNlLgoK
Pj4gKwo+PiArRXg6Ogo+PiArCj4+ICsJZG16YWRtIC0tZm9ybWF0IC9kZXYvc2R4eCAvZGV2L3Nk
eXkKPj4gKwo+PiArCj4+ICtGb21hdHRlZCBkZXZpY2UocykgY2FuIGJlIHN0YXJ0ZWQgd2l0aCB0
aGUgZG16YWRtIHV0aWxpdHksIHRvby46Cj4+ICsKPj4gK0V4OjoKPj4gKwo+PiArCWRtemFkbSAt
LXN0YXJ0IC9kZXYvc2R4eCAvZGV2L3NkeXkKPiAKPiBBbmQgc2FtZSBoZXJlLCB0aGUgem9uZWQg
ZGV2aWNlIG11c3QgY29tZSBmaXJzdC4gSSBhZGRlZCBhIHBhdGNoIHRoYXQgaW50ZXJuYWxseQo+
IHJldmVyc2UgdGhhdCBvcmRlciBmb3IgdGhlIGRtIHN0YXJ0IG9wZXJhdGlvbiBzbyB0aGF0IHRo
ZSByZWd1bGFyIGRldmljZSBpcwo+IHNwZWNpZmllZCBmaXJzdC4KPiAKU2VlIGFib3ZlLiBJJ3Zl
IGZpeGVkIHVwIGRtemFkbSBmb3IgdGhpcy4KCkkganVzdCBoYWRuJ3QgcHVzaGVkIHRoZSBwYXRj
aCBhcyBJIHdhbnRlZCB0byBnZXQgdGhlIGtlcm5lbCBiaXRzIApzZXR0bGVkLiBCdXQgbm93IHRo
YXQgd2UgaGF2ZSBJJ2xsIGJlIHB1c2hpbmcgdGhlIGRtLXpvbmVkLXRvb2xzIHVwZGF0ZXMuCgpD
aGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVh
ZCBTdG9yYWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwg
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwg
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1h
bi9saXN0aW5mby9kbS1kZXZlbA==

