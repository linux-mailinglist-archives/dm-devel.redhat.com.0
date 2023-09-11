Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D6679A4A7
	for <lists+dm-devel@lfdr.de>; Mon, 11 Sep 2023 09:39:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694417992;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HcUrLrvaEGF+Rl60C8mDsRVOwK0n37FcEQmynVVZnBw=;
	b=T2731SAdq8G2n7d+c+tFzMpcR3+TZVSk/eIORWaIgM5s8x3kV3+OPp003jlPDGrG20jx51
	B1YDSaKAQbHktvxferQibJkeiOhKNG883tzjSXHwKF/5nbmA4P9162Rnb2yVlSRYBPwO2H
	NripdGnOznHITvOdFg9xI8Cb8QI9gQI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-617-jwiAEblMPpO1zI1u_HPhJQ-1; Mon, 11 Sep 2023 03:39:48 -0400
X-MC-Unique: jwiAEblMPpO1zI1u_HPhJQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7EE41381DC94;
	Mon, 11 Sep 2023 07:39:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 901A51054FC4;
	Mon, 11 Sep 2023 07:39:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 38EC019465B5;
	Mon, 11 Sep 2023 07:39:43 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 2CFAB1946597
 for <dm-devel@listman.corp.redhat.com>; Mon, 11 Sep 2023 07:39:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 125F92904; Mon, 11 Sep 2023 07:39:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A9AF4402E
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 07:39:42 +0000 (UTC)
Received: from us-smtp-inbound-delivery-1.mimecast.com
 (us-smtp-inbound-delivery-1.mimecast.com [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD87329ABA11
 for <dm-devel@redhat.com>; Mon, 11 Sep 2023 07:39:41 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-115-A-MiLUscP7GHSP7TAUpLiA-1; Mon,
 11 Sep 2023 03:39:40 -0400
X-MC-Unique: A-MiLUscP7GHSP7TAUpLiA-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 84077218E2;
 Mon, 11 Sep 2023 07:39:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EA7F6139CC;
 Mon, 11 Sep 2023 07:39:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e2KjNznE/mT1aAAAMHmgww
 (envelope-from <hare@suse.de>); Mon, 11 Sep 2023 07:39:37 +0000
Message-ID: <ec35111d-ba31-497b-ab01-b198d3feb814@suse.de>
Date: Mon, 11 Sep 2023 09:39:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Nitesh Shetty <nj.shetty@samsung.com>
References: <20230906163844.18754-1-nj.shetty@samsung.com>
 <CGME20230906164321epcas5p4dad5b1c64fcf85e2c4f9fc7ddb855ea7@epcas5p4.samsung.com>
 <20230906163844.18754-5-nj.shetty@samsung.com>
 <e6fc7e65-ad31-4ca2-8b1b-4d97ba32926e@suse.de>
 <20230911070937.GB28177@green245>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230911070937.GB28177@green245>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: Re: [dm-devel] [PATCH v15 04/12] block: add emulation for copy
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Jens Axboe <axboe@kernel.dk>, Vincent Fu <vincent.fu@samsung.com>,
 Christian Brauner <brauner@kernel.org>, Chaitanya Kulkarni <kch@nvidia.com>,
 Sagi Grimberg <sagi@grimberg.me>, martin.petersen@oracle.com,
 Jonathan Corbet <corbet@lwn.net>, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-doc@vger.kernel.org,
 Mike Snitzer <snitzer@kernel.org>, mcgrof@kernel.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, Alexander Viro <viro@zeniv.linux.org.uk>,
 Keith Busch <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Alasdair Kergon <agk@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: suse.de
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gOS8xMS8yMyAwOTowOSwgTml0ZXNoIFNoZXR0eSB3cm90ZToKPiBPbiBGcmksIFNlcCAwOCwg
MjAyMyBhdCAwODowNjozOEFNICswMjAwLCBIYW5uZXMgUmVpbmVja2Ugd3JvdGU6Cj4+IE9uIDkv
Ni8yMyAxODozOCwgTml0ZXNoIFNoZXR0eSB3cm90ZToKPj4+IEZvciB0aGUgZGV2aWNlcyB3aGlj
aCBkb2VzIG5vdCBzdXBwb3J0IGNvcHksIGNvcHkgZW11bGF0aW9uIGlzIGFkZGVkLgo+Pj4gSXQg
aXMgcmVxdWlyZWQgZm9yIGluLWtlcm5lbCB1c2VycyBsaWtlIGZhYnJpY3MsIHdoZXJlIGZpbGUg
ZGVzY3JpcHRvciBpcwo+Pj4gbm90IGF2YWlsYWJsZSBhbmQgaGVuY2UgdGhleSBjYW4ndCB1c2Ug
Y29weV9maWxlX3JhbmdlLgo+Pj4gQ29weS1lbXVsYXRpb24gaXMgaW1wbGVtZW50ZWQgYnkgcmVh
ZGluZyBmcm9tIHNvdXJjZSBpbnRvIG1lbW9yeSBhbmQKPj4+IHdyaXRpbmcgdG8gdGhlIGNvcnJl
c3BvbmRpbmcgZGVzdGluYXRpb24uCj4+PiBBbHNvIGVtdWxhdGlvbiBjYW4gYmUgdXNlZCwgaWYg
Y29weSBvZmZsb2FkIGZhaWxzIG9yIHBhcnRpYWxseSBjb21wbGV0ZXMuCj4+PiBBdCBwcmVzZW50
IGluIGtlcm5lbCB1c2VyIG9mIGVtdWxhdGlvbiBpcyBOVk1lIGZhYnJpY3MuCj4+Pgo+PiBMZWF2
ZSBvdXQgdGhlIGxhc3Qgc2VudGVuY2U7IEkgcmVhbGx5IHdvdWxkIGxpa2UgdG8gc2VlIGl0IGVu
YWJsZWQgZm9yIFNDU0ksCj4+IHRvbyAod2UgZG8gaGF2ZSBjb3B5IG9mZmxvYWQgY29tbWFuZHMg
Zm9yIFNDU0kgLi4uKS4KPj4KPiBTdXJlLCB3aWxsIGRvIHRoYXQKPiAKPj4gQW5kIGl0IHJhaXNl
cyBhbGwgdGhlIHF1ZXN0aW9ucyB3aGljaCBoYXZlIGJvZ2dlZCB1cyBkb3duIHJpZ2h0IGZyb20g
dGhlCj4+IHN0YXJ0OiB3aGVyZSBpcyB0aGUgcG9pbnQgaW4gY2FsbGluZyBjb3B5IG9mZmxvYWQg
aWYgY29weSBvZmZsb2FkIGlzIG5vdAo+PiBpbXBsZW1lbnRlZCBvciBzbG93ZXIgdGhhbiBjb3B5
aW5nIGl0IGJ5IGhhbmQ/Cj4+IEFuZCBob3cgY2FuIHRoZSBjYWxsZXIgZGlmZmVyZW50aWF0ZSB3
aGV0aGVyIGNvcHkgb2ZmbG9hZCBicmluZyBhIGJlbmVmaXQgdG8KPj4gaGltPwo+Pgo+PiBJT1c6
IHdvdWxkbid0IGl0IGJlIGJldHRlciB0byByZXR1cm4gLUVPUE5PVFNVUFAgaWYgY29weSBvZmZs
b2FkIGlzIG5vdAo+PiBhdmFpbGFibGU/Cj4gCj4gUHJlc2VudCBhcHByb2FjaCB0cmVhdHMgY29w
eSBhcyBhIGJhY2tncm91bmQgb3BlcmF0aW9uIGFuZCB0aGUgaWRlYSBpcyB0bwo+IG1heGltaXpl
IHRoZSBjaGFuY2VzIG9mIGFjaGlldmluZyBjb3B5IGJ5IGZhbGxpbmcgYmFjayB0byBlbXVsYXRp
b24uCj4gSGF2aW5nIHNhaWQgdGhhdCwgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIHJldHVybiAt
RU9QTk9UU1VQUCwKPiBpbiBjYXNlIG9mIG9mZmxvYWQgSU8gZmFpbHVyZSBvciBkZXZpY2Ugbm90
IHN1cHBvcnRpbmcgb2ZmbG9hZC4KPiBXZSB3aWxsIHVwZGF0ZSB0aGlzIGluIG5leHQgdmVyc2lv
bi4KPiAKVGhhdCBpcyBhbHNvIHdoYXQgSSBtZWFudCB3aXRoIG15IGNvbW1lbnRzIHRvIHBhdGNo
IDA5LzEyOiBJIGRvbid0IHNlZSAKaXQgYXMgYSBiZW5lZml0IHRvIF9hbHdheXNfIGZhbGwgYmFj
ayB0byBhIGdlbmVyaWMgY29weS1vZmZsb2FkIAplbXVsYXRpb24uIEFmdGVyIGFsbCwgdGhhdCBo
YXJkbHkgYnJpbmdzIGFueSBiZW5lZml0LgpXaGVyZSBJIGRvIHNlZSBhIGJlbmVmaXQgaXMgdG8g
dGllIGluIHRoZSBnZW5lcmljIGNvcHktb2ZmbG9hZCAKX2luZnJhc3RydWN0dXJlXyB0byBleGlz
dGluZyBtZWNoYW5pc21zIChsaWtlIGRtLWtjb3B5ZCkuCkJ1dCBpZiB0aGVyZSBpcyBubyBjb3B5
LW9mZmxvYWQgaW5mcmFzdHJ1Y3R1cmUgYXZhaWxhYmxlIHRoZW4gd2UgcmVhbGx5IApzaG91bGQg
cmV0dXJuIC1FT1BOT1RTVVBQIGFzIGl0IHJlYWxseSBpcyBub3Qgc3VwcG9ydGVkLgoKSW4gdGhl
IGVuZCwgY29weSBvZmZsb2FkIGlzIG5vdCBhIGNvbW1hbmQgd2hpY2ggJ2Fsd2F5cyB3b3Jrcycu
Ckl0J3MgYSBjb21tYW5kIHdoaWNoIF9taWdodF8gZGVsaXZlciBiZW5lZml0cyAoaWUgYmV0dGVy
IHBlcmZvcm1hbmNlKSBpZiAKZGVkaWNhdGVkIGltcGxlbWVudGF0aW9ucyBhcmUgYXZhaWxhYmxl
IGFuZCBjZXJ0YWluIHBhcmFtZXRlcnMgYXJlIG1ldC4gCklmIG5vdCB0aGVuIGNvcHkgb2ZmbG9h
ZCBpcyBub3QgdGhlIGJlc3QgY2hvaWNlLCBhbmQgYXBwbGljYXRpb25zIHdpbGwgCm5lZWQgdG8g
YmUgbWFkZSBhd2FyZSBvZiB0aGF0LgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJl
aW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2Uu
ZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJC
IDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2LCBBbmRy
ZXcKTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgTWFydGplIEJvdWRpZW4gTW9lcm1hbgoKLS0KZG0t
ZGV2ZWwgbWFpbGluZyBsaXN0CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly9saXN0bWFuLnJl
ZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbAo=

