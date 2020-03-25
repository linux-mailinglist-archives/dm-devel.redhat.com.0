Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id F16E219214E
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 07:48:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585118893;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=aqnw+cinz08OWKp6Knj1dlyW9FKZHI6v5S3edB6d7Qc=;
	b=ha7ZiPfd0wLKyN2FsLmmMVY1XyUGQ4zvMBWLOghyeKcK13OlrkK4dSVP/0MSL2x4oiU4vZ
	AotmFOX7bbzqsjirZjxYDJZ6AttX0KjUH/EVqWGFAJudYue6g1wxD6hBXY5dd7d4Xu5d+d
	MCJula3TWioRamFeoafnRv5a4Zb88Nc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-hXr7oZ1yNe-FfKIgKWsTgw-1; Wed, 25 Mar 2020 02:48:10 -0400
X-MC-Unique: hXr7oZ1yNe-FfKIgKWsTgw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D8A118C35A1;
	Wed, 25 Mar 2020 06:48:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E7115D9C5;
	Wed, 25 Mar 2020 06:48:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 458DF18089C8;
	Wed, 25 Mar 2020 06:47:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P6lflI023253 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 02:47:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEADBF9AAB; Wed, 25 Mar 2020 06:47:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CA1DFF89E2
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:47:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8144A185A78E
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 06:47:37 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-292-appHryDeM9S9aqS-MuPd4A-1;
	Wed, 25 Mar 2020 02:47:34 -0400
X-MC-Unique: appHryDeM9S9aqS-MuPd4A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 6ABDFABC2;
	Wed, 25 Mar 2020 06:47:33 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
Date: Wed, 25 Mar 2020 07:47:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P6lflI023253
X-loop: dm-devel@redhat.com
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Dmitry Fomichev <Dmitry.Fomichev@wdc.com>
Subject: Re: [dm-devel] [RFC PATCH v2 3/3] dm zoned: add regular device info
	to metadata
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

T24gMy8yNS8yMCA3OjI5IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzAzLzI0
IDIwOjA0LCBCb2IgTGl1IHdyb3RlOgo+PiBUaGlzIHBhdGNoIGltcGxlbWVudGVkIG1ldGFkYXRh
IHN1cHBvcnQgZm9yIHJlZ3VsYXIgZGV2aWNlIGJ5Ogo+PiAgIC0gRW11bGF0ZWQgem9uZSBpbmZv
cm1hdGlvbiBmb3IgcmVndWxhciBkZXZpY2UuCj4+ICAgLSBTdG9yZSBtZXRhZGF0YSBhdCB0aGUg
YmVnaW5uaW5nIG9mIHJlZ3VsYXIgZGV2aWNlLgo+Pgo+PiAgICAgICB8IC0tLSB6b25lZCBkZXZp
Y2UgLS0tIHwgLS0gcmVndWxhciBkZXZpY2UgfHwKPj4gICAgICAgXiAgICAgICAgICAgICAgICAg
ICAgICBeCj4+ICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgfE1ldGFkYXRhCj4+IHpvbmUg
MAo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBCb2IgTGl1IDxib2IubGl1QG9yYWNsZS5jb20+Cj4+IC0t
LQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDEzNSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQtdGFy
Z2V0LmMgICB8ICAgNiArLQo+PiAgIGRyaXZlcnMvbWQvZG0tem9uZWQuaCAgICAgICAgICB8ICAg
MyArLQo+PiAgIDMgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlvbnMoKyksIDM2IGRlbGV0aW9u
cygtKQo+PgpIYXZpbmcgdGhvdWdodCBhYm91dCBpdCBzb21lIG1vcmUsIEkgdGhpbmsgd2UgY2Fu
bm90IGNvbnRpbnVlIHdpdGggdGhpcyAKJ3NpbXBsZScgYXBwcm9hY2guClRoZSBpbW1lZGlhdGUg
cHJvYmxlbSBpcyB0aGF0IHdlIGxpZSBhYm91dCB0aGUgZGlzayBzaXplOyBjbGVhcmx5IHRoZQpt
ZXRhZGF0YSBjYW5ub3QgYmUgdXNlZCBmb3IgcmVndWxhciBkYXRhLCB5ZXQgd2UgZXhwb3NlIGEg
dGFyZ2V0IGRldmljZSAKd2l0aCB0aGUgZnVsbCBzaXplIG9mIHRoZSB1bmRlcmx5aW5nIGRldmlj
ZS4KTWFraW5nIG1lIHdvbmRlciBpZiBhbnlib2R5IGV2ZXIgdGVzdGVkIGEgZGlzay1mdWxsIHNj
ZW5hcmlvLi4uClRoZSBvdGhlciBwcm9ibGVtIGlzIHRoYXQgd2l0aCB0d28gZGV2aWNlcyB3ZSBu
ZWVkIHRvIGJlIGFibGUgdG8gc3RpdGNoIAp0aGVtIHRvZ2V0aGVyIGluIGFuIGF1dG9tYXRlZCBm
YXNoaW9uLCBlZyB2aWEgYSBzeXN0ZW1kIHNlcnZpY2Ugb3IgdWRldiAKcnVsZS4KQnV0IGZvciB0
aGlzIHdlIG5lZWQgdG8gYmUgYWJsZSB0byBpZGVudGlmeSB0aGUgZGV2aWNlcywgd2hpY2ggbWVh
bnMgCmJvdGggbmVlZCB0byBjYXJyeSBtZXRhZGF0YSwgYW5kIGJvdGggbmVlZCB0byBoYXZlIHVu
aXF1ZSBpZGVudGlmaWVyIAp3aXRoaW4gdGhlIG1ldGFkYXRhLiBXaGljaCB0aGUgY3VycmVudCBt
ZXRhZGF0YSBkb2Vzbid0IGFsbG93IHRvLgoKSGVuY2UgbXkgcGxhbiBpcyB0byBpbXBsZW1lbnQg
YSB2MiBtZXRhZGF0YSwgY2FycnlpbmcgVVVJRHMgZm9yIHRoZSBkbXogCnNldCBfYW5kXyB0aGUg
Y29tcG9uZW50IGRldmljZS4gV2l0aCB0aGF0IHdlIGNhbiB1cGRhdGUgYmxraWQgdG8gY3JlYXRl
IApsaW5rcyBldGMgc28gdGhhdCB0aGUgZGV2aWNlcyBjYW4gYmUgaWRlbnRpZmllZCBpbiB0aGUg
c3lzdGVtLgpBZGRpdGlvbmFsbHkgSSB3b3VsZCBiZSB1cGRhdGluZyBkbXphZG0gdG8gd3JpdGUg
dGhlIG5ldyBtZXRhZGF0YS4KCkFuZCBJIHdpbGwgYWRkIGEgbmV3IGNvbW1hbmQgJ3N0YXJ0JyB0
byBkbXphZG0gd2hpY2ggd2lsbCB0aGVuIGNyZWF0ZSAKdGhlIGRldmljZS1tYXBwZXIgZGV2aWNl
IF93aXRoIHRoZSBjb3JyZWN0IHNpemVfLiBJdCBhbHNvIGhhcyB0aGUgCmJlbmVmaXQgdGhhdCB3
ZSBjYW4gY3JlYXRlIHRoZSBkZXZpY2UtbWFwcGVyIHRhcmdldCB3aXRoIHRoZSBVVUlEIApzcGVj
aWZpZWQgaW4gdGhlIG1ldGFkYXRhLCBzbyB0aGUgcGVyc2lzdGVudCBkZXZpY2UgbGlua3Mgd2ls
bCBiZSAKY3JlYXRlZCBhdXRvbWF0aWNhbGx5LgoKQm9iLCBjYW4geW91IHNlbmQgbWUgeW91ciBp
bXByb3ZlbWVudHMgdG8gZG16YWRtIHNvIHRoYXQgSSBjYW4gaW5jbHVkZSAKdGhlbSBpbiBteSBj
aGFuZ2VzPwoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7D
vHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

