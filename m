Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4C80D389D7A
	for <lists+dm-devel@lfdr.de>; Thu, 20 May 2021 08:05:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-bDGA2bHLMpWLjDqKnV7sgg-1; Thu, 20 May 2021 02:05:18 -0400
X-MC-Unique: bDGA2bHLMpWLjDqKnV7sgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A69C1926DA7;
	Thu, 20 May 2021 06:05:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1C43160BD9;
	Thu, 20 May 2021 06:05:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3CAA6180B463;
	Thu, 20 May 2021 06:05:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14K5w2AL015374 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 May 2021 01:58:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BE118205D6AF; Thu, 20 May 2021 05:58:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B90E7205D6B4
	for <dm-devel@redhat.com>; Thu, 20 May 2021 05:57:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F33B8101A531
	for <dm-devel@redhat.com>; Thu, 20 May 2021 05:57:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-78-X70wPIXsN8yJIck9HUKzDQ-1;
	Thu, 20 May 2021 01:57:54 -0400
X-MC-Unique: X70wPIXsN8yJIck9HUKzDQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 34AEFAD71;
	Thu, 20 May 2021 05:57:53 +0000 (UTC)
To: Damien Le Moal <damien.lemoal@wdc.com>, dm-devel@redhat.com,
	Mike Snitzer <snitzer@redhat.com>, linux-block@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
References: <20210520042228.974083-1-damien.lemoal@wdc.com>
	<20210520042228.974083-9-damien.lemoal@wdc.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <275d8cc1-495f-54fd-276a-ec1adbca5b04@suse.de>
Date: Thu, 20 May 2021 07:57:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210520042228.974083-9-damien.lemoal@wdc.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14K5w2AL015374
X-loop: dm-devel@redhat.com
Subject: Re: [dm-devel] [PATCH v2 08/11] dm: Forbid requeue of writes to
	zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gNS8yMC8yMSA2OjIyIEFNLCBEYW1pZW4gTGUgTW9hbCB3cm90ZToKPiBBIHRhcmdldCBtYXAg
bWV0aG9kIHJlcXVlc3RpbmcgdGhlIHJlcXVldWUgb2YgYSBiaW8gd2l0aAo+IERNX01BUElPX1JF
UVVFVUUgb3IgY29tcGxldGluZyBpdCB3aXRoIERNX0VORElPX1JFUVVFVUUgY2FuIGNhdXNlCj4g
dW5hbGlnbmVkIHdyaXRlIGVycm9ycyBpZiB0aGUgYmlvIGlzIGEgd3JpdGUgb3BlcmF0aW9uIHRh
cmdldGluZyBhCj4gc2VxdWVudGlhbCB6b25lLiBJZiBhIHpvbmVkIHRhcmdldCByZXF1ZXN0IHN1
Y2ggYSByZXF1ZXVlLCB3YXJuIGFib3V0Cj4gaXQgYW5kIGtpbGwgdGhlIElPLgo+IAo+IFRoZSBm
dW5jdGlvbiBkbV9pc196b25lX3dyaXRlKCkgaXMgaW50cm9kdWNlZCB0byBkZXRlY3Qgd3JpdGUg
b3BlcmF0aW9ucwo+IHRvIHpvbmVkIHRhcmdldHMuCj4gCj4gVGhpcyBjaGFuZ2UgZG9lcyBub3Qg
YWZmZWN0IHRoZSB0YXJnZXQgZHJpdmVycyBzdXBwb3J0aW5nIHpvbmVkIGRldmljZXMKPiBhbmQg
ZXhwb3NpbmcgYSB6b25lZCBkZXZpY2UsIG5hbWVseSBkbS1jcnlwdCwgZG0tbGluZWFyIGFuZCBk
bS1mbGFrZXkgYXMKPiBub25lIG9mIHRoZXNlIHRhcmdldHMgZXZlciByZXF1ZXN0IGEgcmVxdWV1
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGFtaWVuLmxlbW9hbEB3ZGMu
Y29tPgo+IC0tLQo+ICAgZHJpdmVycy9tZC9kbS16b25lLmMgfCAxNyArKysrKysrKysrKysrKysr
Kwo+ICAgZHJpdmVycy9tZC9kbS5jICAgICAgfCAxOCArKysrKysrKysrKysrKystLS0KPiAgIGRy
aXZlcnMvbWQvZG0uaCAgICAgIHwgIDUgKysrKysKPiAgIDMgZmlsZXMgY2hhbmdlZCwgMzcgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNr
ZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tl
ICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5
IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCgoK
LS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0
bWFuLnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

