Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 290A02C7EC3
	for <lists+dm-devel@lfdr.de>; Mon, 30 Nov 2020 08:36:54 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-Eio1gmCiNBuIpxy4Jas2lA-1; Mon, 30 Nov 2020 02:36:50 -0500
X-MC-Unique: Eio1gmCiNBuIpxy4Jas2lA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4B2E3E756;
	Mon, 30 Nov 2020 07:36:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 55A0B5D9D2;
	Mon, 30 Nov 2020 07:36:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 439744A7C6;
	Mon, 30 Nov 2020 07:36:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AU7aT9H025386 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Nov 2020 02:36:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D0A4112C07C; Mon, 30 Nov 2020 07:36:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38E65112C078
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 07:36:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E70D8811E76
	for <dm-devel@redhat.com>; Mon, 30 Nov 2020 07:36:26 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-314-Mp4vFMBnMx2dIW64ErefhA-1;
	Mon, 30 Nov 2020 02:36:22 -0500
X-MC-Unique: Mp4vFMBnMx2dIW64ErefhA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 09E40AC6A;
	Mon, 30 Nov 2020 07:36:21 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
	<20201128161510.347752-26-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <daa050e6-8758-a458-91fe-046c5690a336@suse.de>
Date: Mon, 30 Nov 2020 08:36:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-26-hch@lst.de>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0AU7aT9H025386
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] [PATCH 25/45] block: simplify bdev/disk lookup in
	blkdev_get
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gVG8gc2ltcGxp
ZnkgYmxvY2sgZGV2aWNlIGxvb2t1cCBhbmQgYSBmZXcgb3RoZXIgdXBjb21pbmcgYXJlYXMsIG1h
a2Ugc3VyZQo+IHRoYXQgd2UgYWx3YXlzIGhhdmUgYSBzdHJ1Y3QgYmxvY2tfZGV2aWNlIGF2YWls
YWJsZSBmb3IgZWFjaCBkaXNrIGFuZAo+IGVhY2ggcGFydGl0aW9uLCBhbmQgb25seSBmaW5kIGV4
aXN0aW5nIGJsb2NrIGRldmljZXMgaW4gYmRnZXQuICBUaGUgb25seQo+IGRvd25zaWRlIG9mIHRo
aXMgaXMgdGhhdCBlYWNoIGRldmljZSBhbmQgcGFydGl0aW9uIHVzZXMgYSBsaXR0bGUgbW9yZQo+
IG1lbW9yeS4gIFRoZSB1cHNpZGUgd2lsbCBiZSB0aGF0IGEgbG90IG9mIGNvZGUgY2FuIGJlIHNp
bXBsaWZpZWQuCj4gCj4gV2l0aCB0aGF0IGFsbCB3ZSBuZWVkIHRvIGxvb2sgdXAgdGhlIGJsb2Nr
IGRldmljZSBpcyB0byBsb29rdXAgdGhlIGlub2RlCj4gYW5kIGRvIGEgZmV3IHNhbml0eSBjaGVj
a3Mgb24gdGhlIGdlbmRpc2ssIGluc3RlYWQgb2YgdGhlIHNlcGFyYXRlIGxvb2t1cAo+IGZvciB0
aGUgZ2VuZGlzay4gIEZvciBibGstY2dyb3VwIHdoaWNoIHdhbnRzIHRvIGFjY2VzcyBhIGdlbmRp
c2sgd2l0aG91dAo+IG9wZW5pbmcgaXQsIGEgbmV3IGJsa2Rldl97Z2V0LHB1dH1fbm9fb3BlbiBs
b3ctbGV2ZWwgaW50ZXJmYWNlIGlzIGFkZGVkCj4gdG8gcmVwbGFjZSB0aGUgcHJldmlvdXMgZ2V0
X2dlbmRpc2sgdXNlLgo+IAo+IE5vdGUgdGhhdCB0aGUgY2hhbmdlIHRvIGxvb2sgdXAgYmxvY2sg
ZGV2aWNlIGRpcmVjdGx5IGluc3RlYWQgb2YgdGhlIHR3bwo+IHN0ZXAgbG9va3VwIHVzaW5nIHN0
cnVjdCBnZW5kaXNrIGNhdXNlcyBhIHN1YnRpbGUgY2hhbmdlIGluIGJlaGF2aW9yOgo+IGFjY2Vz
c2luZyBhIG5vbi1leGlzdGluZyBwYXJ0aXRpb24gb24gYW4gZXhpc3RpbmcgYmxvY2sgZGV2aWNl
IGNhbiBub3cKPiBjYXVzZSBhIGNhbGwgdG8gcmVxdWVzdF9tb2R1bGUuICBUaGF0IGNhbGwgaXMg
aGFybWxlc3MsIGFuZCBpbiBwcmFjdGljZQo+IG5vIHJlY2VudCBzeXN0ZW0gd2lsbCBhY2Nlc3Mg
dGhlc2Ugbm9kZXMgYXMgdGhleSBhcmVuJ3QgY3JlYXRlZCBieSB1ZGV2Cj4gYW5kIHN0YXRpYyAv
ZGV2LyBzZXR1cHMgYXJlIHVudXN1YWwuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBibG9jay9ibGstY2dyb3VwLmMgICAgICAgICB8
ICA0MiArKysrLS0tLQo+ICAgYmxvY2svYmxrLWlvY29zdC5jICAgICAgICAgfCAgMzYgKysrLS0t
LQo+ICAgYmxvY2svYmxrLmggICAgICAgICAgICAgICAgfCAgIDIgKy0KPiAgIGJsb2NrL2dlbmhk
LmMgICAgICAgICAgICAgIHwgMjEwICsrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0KPiAgIGJsb2NrL3BhcnRpdGlvbnMvY29yZS5jICAgIHwgIDI5ICsrLS0tCj4gICBmcy9ibG9j
a19kZXYuYyAgICAgICAgICAgICB8IDE3NyArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
Cj4gICBpbmNsdWRlL2xpbnV4L2Jsay1jZ3JvdXAuaCB8ICAgNCArLQo+ICAgaW5jbHVkZS9saW51
eC9ibGtkZXYuaCAgICAgfCAgIDYgKysKPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCAgICAgIHwg
ICA3ICstCj4gICA5IGZpbGVzIGNoYW5nZWQsIDE5NCBpbnNlcnRpb25zKCspLCAzMTkgZGVsZXRp
b25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNo
ZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICBLZXJu
ZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcg
bGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9s
aXN0aW5mby9kbS1kZXZlbA==

