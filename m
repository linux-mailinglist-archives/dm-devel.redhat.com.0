Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 3B030192348
	for <lists+dm-devel@lfdr.de>; Wed, 25 Mar 2020 09:53:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585126386;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=h3mpYoUt1JKMOwyDh2yTQe4V4J1HglA+PiGlBeoQC2A=;
	b=QPc50ja7I42/6eaHyXk5WeJnHdrFieomaSV9I1ZqD3V6q0fjTRg4pdCj46PcmCxuSz3dYM
	/bMvxi34jp+h92bIl24EKNhO3rO7gGBi/c7RjzLB1OoVejOCN5iWlbEB75Mpex/O8wTjN4
	ooyngUu9T1+UnfPE9inaXJ/YxuuvI9c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-PY6IwtqMNueduIt6xB1pRw-1; Wed, 25 Mar 2020 04:53:03 -0400
X-MC-Unique: PY6IwtqMNueduIt6xB1pRw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B567B107ACCA;
	Wed, 25 Mar 2020 08:52:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB4D41001F43;
	Wed, 25 Mar 2020 08:52:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E051118089C8;
	Wed, 25 Mar 2020 08:52:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02P8qh76029360 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 25 Mar 2020 04:52:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A0CB2107528; Wed, 25 Mar 2020 08:52:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D02BF1033
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:52:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03E46800294
	for <dm-devel@redhat.com>; Wed, 25 Mar 2020 08:52:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-145-6LbyFwnQMsy8-K86BjF3vQ-1;
	Wed, 25 Mar 2020 04:52:38 -0400
X-MC-Unique: 6LbyFwnQMsy8-K86BjF3vQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 18AC2B11F;
	Wed, 25 Mar 2020 08:52:37 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Bob Liu <bob.liu@oracle.com>,
	"dm-devel@redhat.com" <dm-devel@redhat.com>
References: <20200324110255.8385-1-bob.liu@oracle.com>
	<20200324110255.8385-4-bob.liu@oracle.com>
	<CO2PR04MB23438E0AB35CC46732F96085E7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
	<812da9e9-cfd2-ea24-60cb-4af48f476079@suse.de>
	<CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <0bd2daa1-abbf-681d-405c-f7e4aecd577c@suse.de>
Date: Wed, 25 Mar 2020 09:52:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CO2PR04MB23439B5FA88275A80D3449DFE7CE0@CO2PR04MB2343.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 02P8qh76029360
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yNS8yMCA5OjAyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzAzLzI1
IDE1OjQ3LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IE9uIDMvMjUvMjAgNzoyOSBBTSwgRGFt
aWVuIExlIE1vYWwgd3JvdGU6Cj4+PiBPbiAyMDIwLzAzLzI0IDIwOjA0LCBCb2IgTGl1IHdyb3Rl
Ogo+Pj4+IFRoaXMgcGF0Y2ggaW1wbGVtZW50ZWQgbWV0YWRhdGEgc3VwcG9ydCBmb3IgcmVndWxh
ciBkZXZpY2UgYnk6Cj4+Pj4gICAgLSBFbXVsYXRlZCB6b25lIGluZm9ybWF0aW9uIGZvciByZWd1
bGFyIGRldmljZS4KPj4+PiAgICAtIFN0b3JlIG1ldGFkYXRhIGF0IHRoZSBiZWdpbm5pbmcgb2Yg
cmVndWxhciBkZXZpY2UuCj4+Pj4KPj4+PiAgICAgICAgfCAtLS0gem9uZWQgZGV2aWNlIC0tLSB8
IC0tIHJlZ3VsYXIgZGV2aWNlIHx8Cj4+Pj4gICAgICAgIF4gICAgICAgICAgICAgICAgICAgICAg
Xgo+Pj4+ICAgICAgICB8ICAgICAgICAgICAgICAgICAgICAgIHxNZXRhZGF0YQo+Pj4+IHpvbmUg
MAo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQm9iIExpdSA8Ym9iLmxpdUBvcmFjbGUuY29tPgo+
Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvbWQvZG0tem9uZWQtbWV0YWRhdGEuYyB8IDEzNSArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLQo+Pj4+ICAgIGRyaXZlcnMvbWQv
ZG0tem9uZWQtdGFyZ2V0LmMgICB8ICAgNiArLQo+Pj4+ICAgIGRyaXZlcnMvbWQvZG0tem9uZWQu
aCAgICAgICAgICB8ICAgMyArLQo+Pj4+ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTA4IGluc2VydGlv
bnMoKyksIDM2IGRlbGV0aW9ucygtKQo+Pj4+Cj4+IEhhdmluZyB0aG91Z2h0IGFib3V0IGl0IHNv
bWUgbW9yZSwgSSB0aGluayB3ZSBjYW5ub3QgY29udGludWUgd2l0aCB0aGlzCj4+ICdzaW1wbGUn
IGFwcHJvYWNoLgo+PiBUaGUgaW1tZWRpYXRlIHByb2JsZW0gaXMgdGhhdCB3ZSBsaWUgYWJvdXQg
dGhlIGRpc2sgc2l6ZTsgY2xlYXJseSB0aGUKPj4gbWV0YWRhdGEgY2Fubm90IGJlIHVzZWQgZm9y
IHJlZ3VsYXIgZGF0YSwgeWV0IHdlIGV4cG9zZSBhIHRhcmdldCBkZXZpY2UKPj4gd2l0aCB0aGUg
ZnVsbCBzaXplIG9mIHRoZSB1bmRlcmx5aW5nIGRldmljZS4KPj4gTWFraW5nIG1lIHdvbmRlciBp
ZiBhbnlib2R5IGV2ZXIgdGVzdGVkIGEgZGlzay1mdWxsIHNjZW5hcmlvLi4uCj4gCj4gQ3VycmVu
dCBkbS16b25lZCBkb2VzIG5vdCBkbyB0aGF0Li4uIFdoYXQgaXMgZXhwb3NlZCBhcyB0YXJnZXQg
Y2FwYWNpdHkgaXMKPiBudW1iZXIgb2YgY2h1bmtzICogem9uZSBzaXplLCB3aXRoIHRoZSBudW1i
ZXIgb2YgY2h1bmtzIGJlaW5nIG51bWJlciBvZiB6b25lcwo+IG1pbnVzIG1ldGFkYXRhIHpvbmVz
IG1pbnVzIG51bWJlciBvZiB6b25lcyByZXNlcnZlZCBmb3IgcmVjbGFpbS4gQW5kIEkgZGlkIHRl
c3QKPiBkaXNrIGZ1bGwgc2NlbmFyaW8gKHdoZW4gcGVyZm9ybWFuY2UgZ29lcyB0byB0aGUgdHJh
c2ggYmluIGJlY2F1c2UgcmVjbGFpbQo+IHN0cnVnZ2xlcy4uLikKPiAKVGhpbmcgaXMsIHRoZSBz
ZWNvbmQgbnVtYmVyIGZvciB0aGUgZG1zZXR1cCB0YXJnZXQgbGluZSBpcyBfc3VwcG9zZWRfIHRv
IApiZSB0aGUgdGFyZ2V0IHNpemUuCldoaWNoIGNsZWFybHkgaXMgd3JvbmcgaGVyZS4KSSBtdXN0
IGFkbWl0IEknbSBub3Qgc3VyZSB3aGF0IGRldmljZS1tYXBwZXIgd2lsbCBkbyB3aXRoIGEgdGFy
Z2V0IApkZWZpbml0aW9uIHdoaWNoIGlzIGxhcmdlciB0aGFuIHRoZSByZXN1bHRpbmcgdGFyZ2V0
IGRldmljZSAuLi4KTWlrZSBzaG91bGQga25vdywgYnV0IGl0J3MgZGVmaW5pdGVseSBhd2t3YXJk
LgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVh
bWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdt
YkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVy
ZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBt
YWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

