Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 924DA3910C7
	for <lists+dm-devel@lfdr.de>; Wed, 26 May 2021 08:38:28 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-87gBxqxaMam0zQF_kgcnYA-1; Wed, 26 May 2021 02:38:25 -0400
X-MC-Unique: 87gBxqxaMam0zQF_kgcnYA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E76D71007476;
	Wed, 26 May 2021 06:38:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 32DBD60855;
	Wed, 26 May 2021 06:38:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 39FDF55345;
	Wed, 26 May 2021 06:38:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14Q6aqCM013331 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 02:36:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 23829FDCF9; Wed, 26 May 2021 06:36:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E84FFED2B
	for <dm-devel@redhat.com>; Wed, 26 May 2021 06:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7591D858F0D
	for <dm-devel@redhat.com>; Wed, 26 May 2021 06:36:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-455-IwmdenAkNYG6t-Y90wxACg-1;
	Wed, 26 May 2021 02:36:46 -0400
X-MC-Unique: IwmdenAkNYG6t-Y90wxACg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D8E43ADD7;
	Wed, 26 May 2021 06:36:44 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
References: <20210525212501.226888-1-damien.lemoal@wdc.com>
	<20210525212501.226888-2-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <c052d85b-bd8e-711f-75df-829470d22f6d@suse.de>
Date: Wed, 26 May 2021 08:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210525212501.226888-2-damien.lemoal@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14Q6aqCM013331
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v5 01/11] block: improve handling of all
 zones reset operation
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

T24gNS8yNS8yMSAxMToyNCBQTSwgRGFtaWVuIExlIE1vYWwgd3JvdGU6Cj4gU0NTSSwgWk5TIGFu
ZCBudWxsX2JsayB6b25lZCBkZXZpY2VzIHN1cHBvcnQgcmVzZXR0aW5nIGFsbCB6b25lcyB1c2lu
Zwo+IGEgc2luZ2xlIGNvbW1hbmQgKFJFUV9PUF9aT05FX1JFU0VUX0FMTCksIGFzIGluZGljYXRl
ZCB1c2luZyB0aGUgZGV2aWNlCj4gcmVxdWVzdCBxdWV1ZSBmbGFnIFFVRVVFX0ZMQUdfWk9ORV9S
RVNFVEFMTC4gVGhpcyBmbGFnIGlzIG5vdCBzZXQgZm9yCj4gZGV2aWNlIG1hcHBlciB0YXJnZXRz
IGNyZWF0aW5nIHpvbmVkIGRldmljZXMuIEluIHRoaXMgY2FzZSwgYSB1c2VyCj4gcmVxdWVzdCBm
b3IgcmVzZXR0aW5nIGFsbCB6b25lcyBvZiBhIGRldmljZSBpcyBwcm9jZXNzZWQgaW4KPiBibGtk
ZXZfem9uZV9tZ210KCkgYnkgaXNzdWluZyBhIFJFUV9PUF9aT05FX1JFU0VUIG9wZXJhdGlvbiBm
b3IgZWFjaAo+IHpvbmUgb2YgdGhlIGRldmljZS4gVGhpcyBsZWFkcyB0byBkaWZmZXJlbnQgYmVo
YXZpb3JzIG9mIHRoZQo+IEJMS1JFU0VUWk9ORSBpb2N0bCgpIGRlcGVuZGluZyBvbiB0aGUgdGFy
Z2V0IGRldmljZSBzdXBwb3J0IGZvciB0aGUKPiByZXNldCBhbGwgb3BlcmF0aW9uLiBFLmcuCj4g
Cj4gYmxrem9uZSByZXNldCAvZGV2L3NkWAo+IAo+IHdpbGwgcmVzZXQgYWxsIHpvbmVzIG9mIGEg
U0NTSSBkZXZpY2UgdXNpbmcgYSBzaW5nbGUgY29tbWFuZCB0aGF0IHdpbGwKPiBpZ25vcmUgY29u
dmVudGlvbmFsLCByZWFkLW9ubHkgb3Igb2ZmbGluZSB6b25lcy4KPiAKPiBCdXQgYSBkbS1saW5l
YXIgZGV2aWNlIGluY2x1ZGluZyBjb252ZW50aW9uYWwsIHJlYWQtb25seSBvciBvZmZsaW5lCj4g
em9uZXMgY2Fubm90IGJlIHJlc2V0IGluIHRoZSBzYW1lIG1hbm5lciBhcyBzb21lIG9mIHRoZSBz
aW5nbGUgem9uZQo+IHJlc2V0IG9wZXJhdGlvbnMgaXNzdWVkIGJ5IGJsa2Rldl96b25lX21nbXQo
KSB3aWxsIGZhaWwuIEUuZy46Cj4gCj4gYmxrem9uZSByZXNldCAvZGV2L2RtLVkKPiBibGt6b25l
OiAvZGV2L2RtLTA6IEJMS1JFU0VUWk9ORSBpb2N0bCBmYWlsZWQ6IFJlbW90ZSBJL08gZXJyb3IK
PiAKPiBUbyBzaW1wbGlmeSBhcHBsaWNhdGlvbnMgYW5kIHRvb2xzIGRldmVsb3BtZW50LCB1bmlm
eSB0aGUgYmVoYXZpb3Igb2YKPiB0aGUgYWxsLXpvbmUgcmVzZXQgb3BlcmF0aW9uIGJ5IG1vZGlm
eWluZyBibGtkZXZfem9uZV9tZ210KCkgdG8gbm90Cj4gaXNzdWUgYSB6b25lIHJlc2V0IG9wZXJh
dGlvbiBmb3IgY29udmVudGlvbmFsLCByZWFkLW9ubHkgYW5kIG9mZmxpbmUKPiB6b25lcywgdGh1
cyBtaW1pY2tpbmcgd2hhdCBhbiBhY3R1YWwgcmVzZXQtYWxsIGRldmljZSBjb21tYW5kIGRvZXMg
b24gYQo+IGRldmljZSBzdXBwb3J0aW5nIFJFUV9PUF9aT05FX1JFU0VUX0FMTC4gVGhpcyBlbXVs
YXRpb24gaXMgZG9uZSB1c2luZwo+IHRoZSBuZXcgZnVuY3Rpb24gYmxrZGV2X3pvbmVfcmVzZXRf
YWxsX2VtdWxhdGVkKCkuIFRoZSB6b25lcyBuZWVkaW5nIGEKPiByZXNldCBhcmUgaWRlbnRpZmll
ZCB1c2luZyBhIGJpdG1hcCB0aGF0IGlzIGluaXRpYWxpemVkIHVzaW5nIGEgem9uZQo+IHJlcG9y
dC4gU2luY2UgZW1wdHkgem9uZXMgZG8gbm90IG5lZWQgYSByZXNldCwgYWxzbyBpZ25vcmUgdGhl
c2Ugem9uZXMuCj4gVGhlIGZ1bmN0aW9uIGJsa2Rldl96b25lX3Jlc2V0X2FsbCgpIGlzIGludHJv
ZHVjZWQgZm9yIGJsb2NrIGRldmljZXMKPiBuYXRpdmVseSBzdXBwb3J0aW5nIHJlc2V0IGFsbCBv
cGVyYXRpb25zLiBibGtkZXZfem9uZV9tZ210KCkgaXMgbW9kaWZpZWQKPiB0byBjYWxsIGVpdGhl
ciBmdW5jdGlvbiB0byBleGVjdXRlIGFuIGFsbCB6b25lIHJlc2V0IHJlcXVlc3QuCj4gCj4gU2ln
bmVkLW9mZi1ieTogRGFtaWVuIExlIE1vYWwgPGRhbWllbi5sZW1vYWxAd2RjLmNvbT4KPiBbaGNo
OiBzcGxpdCBpbnRvIG11bHRpcGxlIGZ1bmN0aW9uc10KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBSZXZpZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5p
IDxjaGFpdGFueWEua3Vsa2FybmlAd2RjLmNvbT4KPiAtLS0KPiAgIGJsb2NrL2Jsay16b25lZC5j
IHwgMTE5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkKPiAKUmV2
aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVz
Ci0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFy
Y2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTEx
IDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJl
cjogRmVsaXggSW1lbmTDtnJmZmVyCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVs
QHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9k
bS1kZXZlbA==

