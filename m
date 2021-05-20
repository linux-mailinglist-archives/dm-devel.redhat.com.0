Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id E28C2389D79
	for <lists+dm-devel@lfdr.de>; Thu, 20 May 2021 08:05:20 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-129-PF5e3TxXPKiyHAVg2QFQKQ-1; Thu, 20 May 2021 02:05:16 -0400
X-MC-Unique: PF5e3TxXPKiyHAVg2QFQKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EAA8F8049CE;
	Thu, 20 May 2021 06:05:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC611B471;
	Thu, 20 May 2021 06:05:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AB0771801029;
	Thu, 20 May 2021 06:05:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14K5uSW4015251 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 01:56:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A62DE20287D9; Thu, 20 May 2021 05:56:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A1D8720287D8
	for <dm-devel@redhat.com>; Thu, 20 May 2021 05:56:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B7D6C1857F1E
	for <dm-devel@redhat.com>; Thu, 20 May 2021 05:56:21 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-3-bLmJ6uHVNTWZjFajroDqjg-1;
	Thu, 20 May 2021 01:56:15 -0400
X-MC-Unique: bLmJ6uHVNTWZjFajroDqjg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id CEDDBAF03;
	Thu, 20 May 2021 05:56:13 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
References: <20210520042228.974083-1-damien.lemoal@wdc.com>
	<20210520042228.974083-8-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <ff07c069-694e-8a14-36d5-2fcda5ad5cd4@suse.de>
Date: Thu, 20 May 2021 07:56:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210520042228.974083-8-damien.lemoal@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14K5uSW4015251
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 07/11] dm: Introduce dm_report_zones()
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNS8yMC8yMSA2OjIyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBUbyBzaW1wbGlmeSB0
aGUgaW1wbGVtZW50YXRpb24gb2YgdGhlIHJlcG9ydF96b25lcyBvcGVyYXRpb24gb2YgYSB6b25l
ZAo+IHRhcmdldCwgaW50cm9kdWNlIHRoZSBmdW5jdGlvbiBkbV9yZXBvcnRfem9uZXMoKSB0byBz
ZXQgYSB0YXJnZXQKPiBtYXBwaW5nIHN0YXJ0IHNlY3RvciBpbiBzdHJ1Y3QgZG1fcmVwb3J0X3pv
bmVzX2FyZ3MgYW5kIGNhbGwKPiBibGtkZXZfcmVwb3J0X3pvbmVzKCkuIFRoaXMgbmV3IGZ1bmN0
aW9uIGlzIGV4cG9ydGVkIGFuZCB0aGUgcmVwb3J0Cj4gem9uZXMgY2FsbGJhY2sgZnVuY3Rpb24g
ZG1fcmVwb3J0X3pvbmVzX2NiKCkgaXMgbm90Lgo+IAo+IGRtLWxpbmVhciwgZG0tZmxha2V5IGFu
ZCBkbS1jcnlwdCBhcmUgbW9kaWZpZWQgdG8gdXNlIGRtX3JlcG9ydF96b25lcygpLgo+IAo+IFNp
Z25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gUmV2
aWV3ZWQtYnk6IEpvaGFubmVzIFRodW1zaGlybiA8am9oYW5uZXMudGh1bXNoaXJuQHdkYy5jb20+
Cj4gLS0tCj4gICBkcml2ZXJzL21kL2RtLWNyeXB0LmMgICAgICAgICB8ICA3ICsrKy0tLS0KPiAg
IGRyaXZlcnMvbWQvZG0tZmxha2V5LmMgICAgICAgIHwgIDcgKysrLS0tLQo+ICAgZHJpdmVycy9t
ZC9kbS1saW5lYXIuYyAgICAgICAgfCAgNyArKystLS0tCj4gICBkcml2ZXJzL21kL2RtLXpvbmUu
YyAgICAgICAgICB8IDIzICsrKysrKysrKysrKysrKysrKysrLS0tCj4gICBpbmNsdWRlL2xpbnV4
L2RldmljZS1tYXBwZXIuaCB8ICAzICsrLQo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRp
b25zKCspLCAxNiBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8
aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAg
ICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChB
RyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0K
ZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFu
LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

