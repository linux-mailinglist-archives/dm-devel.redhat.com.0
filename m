Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25E7D1A73B9
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:31:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JgGWBJZZVo6ZE4az8STdeVdX9ZV8tyypy/t64t3Jm14=;
	b=LDKNP6cvBjUHc8v4sb9LJ7AsnlZCUPAYCuRno5Q/6ZJhAYOcHjOsa/xESYaWMtL3Ap6AXT
	Ul5/vVKzll5y89S7ynzBWTz3YvZZ/7AQfJs5yhYJf/BFwZxQ/SQAjnT6AIP8bdYEORqwyZ
	vOqXJcA9va1tkO6OgiDNW9AhTRx7fHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-dVxCFrFqMTWKsMHMOSE_tQ-1; Tue, 14 Apr 2020 02:31:40 -0400
X-MC-Unique: dVxCFrFqMTWKsMHMOSE_tQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E532F8017F6;
	Tue, 14 Apr 2020 06:31:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D41419C58;
	Tue, 14 Apr 2020 06:31:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6099B18089C8;
	Tue, 14 Apr 2020 06:31:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03E6VScF004874 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 14 Apr 2020 02:31:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5F1EB2166B2C; Tue, 14 Apr 2020 06:31:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5B7A82166B2B
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:31:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C08EA80028B
	for <dm-devel@redhat.com>; Tue, 14 Apr 2020 06:31:24 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-282-i-7EbzfFO5-rpsdoU-FAOg-1;
	Tue, 14 Apr 2020 02:31:19 -0400
X-MC-Unique: i-7EbzfFO5-rpsdoU-FAOg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 48A12AB5C;
	Tue, 14 Apr 2020 06:31:17 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>, Mike Snitzer <snitzer@redhat.com>
References: <20200409064527.82992-1-hare@suse.de>
	<20200409064527.82992-2-hare@suse.de>
	<BY5PR04MB69007B6D7B177B226272C72DE7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <b200b775-cd2e-e257-c3e9-3268ba87f352@suse.de>
Date: Tue, 14 Apr 2020 08:31:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB69007B6D7B177B226272C72DE7DE0@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03E6VScF004874
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>
Subject: Re: [dm-devel] [PATCH 01/11] dm-zoned: store zone id within the
 zone structure and kill dmz_id()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

T24gNC8xMC8yMCA4OjM3IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzA0LzA5
IDE1OjQ1LCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IEluc3RlYWQgb2YgY2FsY3VsYXRpbmcg
dGhlIHpvbmUgaW5kZXggYnkgdGhlIG9mZnNldCB3aXRoaW4gdGhlCj4+IHpvbmUgYXJyYXkgc3Rv
cmUgdGhlIGluZGV4IHdpdGhpbiB0aGUgc3RydWN0dXJlIGl0c2VsZi4gV2l0aCB0aGF0Cj4+IHRo
ZSBoZWxwZXIgZG16X2lkKCkgaXMgcG9pbnRsZXNzIGFuZCBjYW4gYmUgcmVwbGFjZWQgd2l0aCBh
Y2Nlc3NpbmcKPj4gdGhlIC0+aWQgdmFsdWUgZGlyZWN0bHkuCj4gCj4gTG9va3MgZ29vZC4gQWx0
aG91Z2ggdGhlIGtidWlsZCByb2JvdCBjb21wbGFpbmVkIHRoYXQgeW91IGZvcmdvdCB0byBjaGFu
Z2UgdGhlCj4gZG16X2lkKCkgdXNlIGluIHNvbWUgZG16X2Rldl93YXJuKCkgY2FsbHMgOikKPiBK
dXN0IHNlZW4gaXQuIFdpbGwgYmUgZml4aW5nIGl0IHVwIGluIHRoZSBuZXh0IHJvdW5kLgoKQ2hl
ZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgVGVhbWxlYWQg
U3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIE1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1kZXZlbCBtYWlsaW5n
IGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4v
bGlzdGluZm8vZG0tZGV2ZWw=

