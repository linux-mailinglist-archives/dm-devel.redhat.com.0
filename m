Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 8B74E1D26E3
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 07:57:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589435843;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=C0suZU42kU0sV0ZLAx+GeLoEWi1DdU5cFY1MOIehzQk=;
	b=Xi4pPkVV0Dga2b31r0BqYzYtCyxDXGdMjVO3W10/eeaC0wpjxgFLu9e4VuWoZ+EgK9oS3Y
	mZPs1o5bX95yzhmzcOqRC0WEp7RNLWIrP4cXqWpF0ReY9budhGqLQ1MDz+eXYrHjt2jc1Y
	tDSs2VCkmBorzKl/vC3rLtdCumBxgbI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-ZlmWIHamNwWWCvSoOCpP_g-1; Thu, 14 May 2020 01:57:21 -0400
X-MC-Unique: ZlmWIHamNwWWCvSoOCpP_g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D801800053;
	Thu, 14 May 2020 05:57:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AB0B55D9E5;
	Thu, 14 May 2020 05:57:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79C524E588;
	Thu, 14 May 2020 05:57:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E5v2IF027167 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 01:57:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 380212029F77; Thu, 14 May 2020 05:57:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 265E32029F72
	for <dm-devel@redhat.com>; Thu, 14 May 2020 05:57:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2DB1380067A
	for <dm-devel@redhat.com>; Thu, 14 May 2020 05:57:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-473-WxwawE0lM4mVzXQ5pB1Dcw-1;
	Thu, 14 May 2020 01:56:57 -0400
X-MC-Unique: WxwawE0lM4mVzXQ5pB1Dcw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 4C425AD71;
	Thu, 14 May 2020 05:56:58 +0000 (UTC)
To: Damien Le Moal <Damien.LeMoal@wdc.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>
References: <20200508090332.40716-1-hare@suse.de>
	<BY5PR04MB6900138C0F78196D0F81BF07E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB6900C76141ABD428F42C1840E7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<2553e593-795d-6aed-f983-e990a283e2ff@suse.de>
	<BY5PR04MB6900C84D00585D3560D4C51AE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690020AE68E7A20EA8BFED0DE7A10@BY5PR04MB6900.namprd04.prod.outlook.com>
	<BY5PR04MB690002ABF208B084607B6971E7BF0@BY5PR04MB6900.namprd04.prod.outlook.com>
	<yq13683z7sj.fsf@oracle.com>
	<BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <f9f41321-2a30-e0b2-4c74-d27f832bfed9@suse.de>
Date: Thu, 14 May 2020 07:56:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR04MB6900B82F4BEE1B13B239D93EE7BC0@BY5PR04MB6900.namprd04.prod.outlook.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04E5v2IF027167
X-loop: dm-devel@redhat.com
Cc: Bob Liu <bob.liu@oracle.com>, "dm-devel@redhat.com" <dm-devel@redhat.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: Re: [dm-devel] [PATCHv5 00/14] dm-zoned: metadata version 2
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

T24gNS8xNC8yMCAyOjU1IEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBPbiAyMDIwLzA1LzE0
IDk6MjIsIE1hcnRpbiBLLiBQZXRlcnNlbiB3cm90ZToKPj4KPj4gRGFtaWVuLAo+Pgo+Pj4gQW55
IGlkZWEgd2h5IHRoZSBpb19vcHQgbGltaXQgaXMgbm90IHNldCB0byB0aGUgcGh5c2ljYWwgYmxv
Y2sgc2l6ZQo+Pj4gd2hlbiB0aGUgZHJpdmUgZG9lcyBub3QgcmVwb3J0IGFuIG9wdGltYWwgdHJh
bnNmZXIgbGVuZ3RoID8gV291bGQgaXQKPj4+IGJlIGJhZCB0byBzZXQgdGhhdCB2YWx1ZSBpbnN0
ZWFkIG9mIGxlYXZpbmcgaXQgdG8gMCA/Cj4+Cj4+IFRoZSBvcmlnaW5hbCBpbnRlbnQgd2FzIHRo
YXQgaW9fb3B0IHdhcyBhIHdlYWsgaGV1cmlzdGljIGZvciBzb21ldGhpbmcKPj4gYmVpbmcgYSBS
QUlEIGRldmljZS4gUmVndWxhciBkaXNrIGRyaXZlcyBkaWRuJ3QgcmVwb3J0IGl0LiBUaGVzZSBk
YXlzCj4+IHRoYXQgZGlzdGluY3Rpb24gcHJvYmFibHkgaXNuJ3QgcmVsZXZhbnQuCj4+Cj4+IEhv
d2V2ZXIsIGJlZm9yZSB3ZSBlbnRlcnRhaW4gZGVwYXJ0aW5nIGZyb20gdGhlIGhpc3RvcmljIGlv
X29wdAo+PiBiZWhhdmlvciwgSSBhbSBhIGJpdCBwdXp6bGVkIGJ5IHRoZSBmYWN0IHRoYXQgeW91
IGhhdmUgYSBkZXZpY2UgdGhhdAo+PiByZXBvcnRzIGlvX29wdCBhcyA1MTIgYnl0ZXMuIFdoYXQg
a2luZCBvZiBkZXZpY2UgcGVyZm9ybXMgYmVzdCB3aGVuIGVhY2gKPj4gSS9PIGlzIGxpbWl0ZWQg
dG8gYSBzaW5nbGUgbG9naWNhbCBibG9jaz8KPj4KPiAKPiBJbmRlZWQuIEl0IGlzIGFuIE5WTWUg
TS4yIGNvbnN1bWVyIGdyYWRlIFNTRC4gTm90aGluZyBmYW5jeS4gSWYgeW91IGxvb2sgYXQKPiBu
dm1lL2hvc3QvY29yZS5jIG52bWVfdXBkYXRlX2Rpc2tfaW5mbygpLCB5b3Ugd2lsbCBzZWUgdGhh
dCBpb19vcHQgaXMgc2V0IHRvIHRoZQo+IGJsb2NrIHNpemUuLi4gVGhpcyBpcyBwcm9iYWJseSBh
YnVzaW5nIHRoaXMgbGltaXQuIFNvIEkgZ3Vlc3MgdGhlIG1vc3QgZWxlZ2FudAo+IGZpeCBtYXkg
YmUgdG8gaGF2ZSBudm1lIHN0b3AgZG9pbmcgdGhhdCA/Cj4gCj4gClllcywgSSBndWVzcyB0aGF0
IHdvdWxkIGJlIHRoZSBiZXN0IGFwcHJvYWNoLiBJZiB0aGUgZHJpdmVyIGRvZXNuJ3QgCnJlcG9y
dCBpdCB3ZSBzaG91bGRuJ3QgbWFrZSB1cCBhbnkgdmFsdWVzIGJ1dCByYXRoZXIgbGVhdmUgaXQg
YXQgJzAnLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAg
ICAgVGVhbWxlYWQgU3RvcmFnZSAmIE5ldHdvcmtpbmcKaGFyZUBzdXNlLmRlICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdtYkgsIE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7D
vHJuYmVyZyksIEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCgotLQpkbS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQu
Y29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

