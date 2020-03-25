Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3462D1924DF
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 11:01:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585130475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=gyQr6BcWmMQQJnweagdeaZhYRO5cRxJWrhB776m9gE4=;
	b=a9Cc5eXw0cSR0RSYTlfneUno6sepbDEBhiQ/gXlAPo/SfiwmC+sCkSypPCNE5PQ6QA7dwu
	0aTyDI15mHNrL4t8n39Q6ffm72Btmr2eVErijbAu+e7eTN95OzfsuUreKL5IyjcBgqHEnv
	dDKTk0+PDFDVyam7MwDVkmf6XsblUgo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-V5qtEWljMDWqZAmT7E_QqA-1; Wed, 25 Mar 2020 06:01:12 -0400
X-MC-Unique: V5qtEWljMDWqZAmT7E_QqA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 523B7189D6C0;
	Wed, 25 Mar 2020 10:01:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8417E92D41;
	Wed, 25 Mar 2020 10:01:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 42743944AF;
	Wed, 25 Mar 2020 10:00:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02PA0eJ6032205 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 06:00:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7489210A7E43; Wed, 25 Mar 2020 10:00:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 708A310A7E3C
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 10:00:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 197BB800298
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 10:00:38 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-327-cACPmhnePnSOmLpCnjrBnQ-1;
	Wed, 25 Mar 2020 06:00:35 -0400
X-MC-Unique: cACPmhnePnSOmLpCnjrBnQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 188BDACB8;
	Wed, 25 Mar 2020 10:00:34 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
	<CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<0bd2daa1-abbf-681d-405c-f7e4aecd577c@suse.de>
	<CO2PR04MB23433CAD26D492654041FCDCE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <cdf003a6-b0c8-30c0-edc3-049471a7a2b0@suse.de>
Date: Wed, 25 Mar 2020 11:00:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB23433CAD26D492654041FCDCE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02PA0eJ6032205
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yNS8yMCAxMDoxMCBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gT24gMjAyMC8wMy8y
NSAxNzo1MiwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiAzLzI1LzIwIDk6MDIgQU0sIERh
bWllbiBMZSBNb2FsIHdyb3RlOgo+Pj4gT24gMjAyMC8wMy8yNSAxNTo0NywgSGFubmVzIFJlaW5l
Y2tlIHdyb3RlOgo+Pj4+IE9uIDMvMjUvMjAgNzoyOSBBTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6
Cj4+Pj4+IE9uIDIwMjAvMDMvMjQgMjA6MDQsIEJvYiBMaXUgd3JvdGU6Cj4+Pj4+PiBUaGlzIHBh
dGNoIGltcGxlbWVudGVkIG1ldGFkYXRhIHN1cHBvcnQgZm9yIHJlZ3VsYXIgZGV2aWNlIGJ5Ogo+
Pj4+Pj4gICAgIC0gRW11bGF0ZWQgem9uZSBpbmZvcm1hdGlvbiBmb3IgcmVndWxhciBkZXZpY2Uu
Cj4+Pj4+PiAgICAgLSBTdG9yZSBtZXRhZGF0YSBhdCB0aGUgYmVnaW5uaW5nIG9mIHJlZ3VsYXIg
ZGV2aWNlLgo+Pj4+Pj4KPj4+Pj4+ICAgICAgICAgfCAtLS0gem9uZWQgZGV2aWNlIC0tLSB8IC0t
IHJlZ3VsYXIgZGV2aWNlIHx8Cj4+Pj4+PiAgICAgICAgIF4gICAgICAgICAgICAgICAgICAgICAg
Xgo+Pj4+Pj4gICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHxNZXRhZGF0YQo+Pj4+Pj4g
em9uZSAwCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogQm9iIExpdSA8Ym9iLmxpdUBvcmFj
bGUuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgICAgZHJpdmVycy9tZC9kbS16b25lZC1tZXRhZGF0
YS5jIHwgMTM1ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4+Pj4+
PiAgICAgZHJpdmVycy9tZC9kbS16b25lZC10YXJnZXQuYyAgIHwgICA2ICstCj4+Pj4+PiAgICAg
ZHJpdmVycy9tZC9kbS16b25lZC5oICAgICAgICAgIHwgICAzICstCj4+Pj4+PiAgICAgMyBmaWxl
cyBjaGFuZ2VkLCAxMDggaW5zZXJ0aW9ucygrKSwgMzYgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+
IEhhdmluZyB0aG91Z2h0IGFib3V0IGl0IHNvbWUgbW9yZSwgSSB0aGluayB3ZSBjYW5ub3QgY29u
dGludWUgd2l0aCB0aGlzCj4+Pj4gJ3NpbXBsZScgYXBwcm9hY2guCj4+Pj4gVGhlIGltbWVkaWF0
ZSBwcm9ibGVtIGlzIHRoYXQgd2UgbGllIGFib3V0IHRoZSBkaXNrIHNpemU7IGNsZWFybHkgdGhl
Cj4+Pj4gbWV0YWRhdGEgY2Fubm90IGJlIHVzZWQgZm9yIHJlZ3VsYXIgZGF0YSwgeWV0IHdlIGV4
cG9zZSBhIHRhcmdldCBkZXZpY2UKPj4+PiB3aXRoIHRoZSBmdWxsIHNpemUgb2YgdGhlIHVuZGVy
bHlpbmcgZGV2aWNlLgo+Pj4+IE1ha2luZyBtZSB3b25kZXIgaWYgYW55Ym9keSBldmVyIHRlc3Rl
ZCBhIGRpc2stZnVsbCBzY2VuYXJpby4uLgo+Pj4KPj4+IEN1cnJlbnQgZG0tem9uZWQgZG9lcyBu
b3QgZG8gdGhhdC4uLiBXaGF0IGlzIGV4cG9zZWQgYXMgdGFyZ2V0IGNhcGFjaXR5IGlzCj4+PiBu
dW1iZXIgb2YgY2h1bmtzICogem9uZSBzaXplLCB3aXRoIHRoZSBudW1iZXIgb2YgY2h1bmtzIGJl
aW5nIG51bWJlciBvZiB6b25lcwo+Pj4gbWludXMgbWV0YWRhdGEgem9uZXMgbWludXMgbnVtYmVy
IG9mIHpvbmVzIHJlc2VydmVkIGZvciByZWNsYWltLiBBbmQgSSBkaWQgdGVzdAo+Pj4gZGlzayBm
dWxsIHNjZW5hcmlvICh3aGVuIHBlcmZvcm1hbmNlIGdvZXMgdG8gdGhlIHRyYXNoIGJpbiBiZWNh
dXNlIHJlY2xhaW0KPj4+IHN0cnVnZ2xlcy4uLikKPj4+Cj4+IFRoaW5nIGlzLCB0aGUgc2Vjb25k
IG51bWJlciBmb3IgdGhlIGRtc2V0dXAgdGFyZ2V0IGxpbmUgaXMgX3N1cHBvc2VkXyB0bwo+PiBi
ZSB0aGUgdGFyZ2V0IHNpemUuCj4+IFdoaWNoIGNsZWFybHkgaXMgd3JvbmcgaGVyZS4KPj4gSSBt
dXN0IGFkbWl0IEknbSBub3Qgc3VyZSB3aGF0IGRldmljZS1tYXBwZXIgd2lsbCBkbyB3aXRoIGEg
dGFyZ2V0Cj4+IGRlZmluaXRpb24gd2hpY2ggaXMgbGFyZ2VyIHRoYW4gdGhlIHJlc3VsdGluZyB0
YXJnZXQgZGV2aWNlIC4uLgo+PiBNaWtlIHNob3VsZCBrbm93LCBidXQgaXQncyBkZWZpbml0ZWx5
IGF3a3dhcmQuCj4gCj4gQUhoLiBPSy4gTmV2ZXIgdGhvdWdodCBvZiBpdCBsaWtlIHRoaXMsIGVz
cGVjaWFsbHkgY29uc2lkZXJpbmcgdGhlIGZhY3QgdGhhdCB0aGUKPiB0YWJsZSBlbnRyeSBpcyBj
aGVja2VkIHRvIHNlZSBpZiB0aGUgZW50aXJlIGRyaXZlIGlzIGdpdmVuLiBTbyBpbnN0ZWFkIG9m
IHRoZQo+IHRhcmdldCBzaXplLCBJIHdhcyBpbiBmYWN0IHVzaW5nIHRoZSBzaXplIHBhcmFtZXRl
ciBvZiBkbXNldHVwIGFzIHRoZSBzaXplIHRvCj4gdXNlIG9uIHRoZSBiYWNrZW5kLCB3aGljaCBm
b3IgZG0tem9uZWQgbXVzdCBiZSB0aGUgZGV2aWNlIGNhcGFjaXR5Li4uCj4gCj4gTm90IHN1cmUg
aWYgd2UgY2FuIGZpeCB0aGF0IG5vdyA/IEVzcGVjaWFsbHkgY29uc2lkZXJpbmcgdGhhdCB0aGUg
bnVtYmVyIG9mCj4gcmVzZXJ2ZWQgc2VxIHpvbmVzIGZvciByZWNsYWltIGlzIG5vdCBjb25zdGFu
dCBidXQgYSBkbXphZG0gZm9ybWF0IG9wdGlvbi4gU28KPiB0aGUgYXZlcmFnZSB1c2VyIHdvdWxk
IGhhdmUgdG8ga25vdyBleGFjdGx5IHRoZSB1c2VhYmxlIHNpemUgdG8gZG1zZXR1cCB0aGUKPiB0
YXJnZXQuIEFrd2FyZCB0b28sIG9yIHJhdGhlciwgbm90IHN1cGVyIGVhc3kgdG8gdXNlLiBJIHdv
bmRlciBob3cgZG0tdGhpbiBvcgo+IG90aGVyIHRhcmdldHMgd2l0aCBtZXRhZGF0YSBoYW5kbGUg
dGhpcyA/IERvIHRoZXkgZm9ybWF0IHRoZW1zZWx2ZXMKPiBhdXRvbWF0aWNhbGx5IG9uIGRtc2V0
dXAgdXNpbmcgdGhlIHNpemUgc3BlY2lmaWVkID8KPiAKV2hpY2ggaXMgX3ByZWNpc2VseV8gd2h5
IEkgd2FudCB0byBoYXZlIHRoZSAnc3RhcnQnIG9wdGlvbiB0byBkbXphZG0uClRoYXQgY2FuIHJl
YWQgdGhlIG1ldGFkYXRhLCB2YWxpZGF0ZSBpdCwgYW5kIHRoZW4gZ2VuZXJhdGUgdGhlIGNvcnJl
Y3QgCmludm9jYXRpb24gZm9yIGRldmljZS1tYXBwZXIuCl9BbmRfIHdlIGdldCBhIGRldmljZS11
dWlkIHRvIGJvb3QsIGFzIHRoaXMgY2FuIG9ubHkgYmUgc2V0IGZyb20gdGhlIGlvY3RsLgoKQ2hl
ZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxlYWQg
U3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

