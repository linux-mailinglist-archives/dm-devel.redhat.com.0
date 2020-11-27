Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF682C632B
	for <lists+dm-devel@lfdr.de>; Fri, 27 Nov 2020 11:37:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-527-EhjywwLaO_qMVmkRXJXwVg-1; Fri, 27 Nov 2020 05:37:04 -0500
X-MC-Unique: EhjywwLaO_qMVmkRXJXwVg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E7011DDF6;
	Fri, 27 Nov 2020 10:36:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5CBF660BF1;
	Fri, 27 Nov 2020 10:36:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0FE8F4E58E;
	Fri, 27 Nov 2020 10:36:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0ARAas4O002092 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 27 Nov 2020 05:36:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 1389B2166B2A; Fri, 27 Nov 2020 10:36:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0EB512166B28
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 10:36:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BDD36800C00
	for <dm-devel@redhat.com>; Fri, 27 Nov 2020 10:36:50 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-34-Y7rIlNZHMpqi_gpmWggdAA-1;
	Fri, 27 Nov 2020 05:36:48 -0500
X-MC-Unique: Y7rIlNZHMpqi_gpmWggdAA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id E1240AC75;
	Fri, 27 Nov 2020 10:36:45 +0000 (UTC)
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201126130422.92945-1-hch@lst.de>
	<20201126130422.92945-11-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2ef8235e-2f2a-6f0d-4143-f6c069da737c@suse.de>
Date: Fri, 27 Nov 2020 11:36:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201126130422.92945-11-hch@lst.de>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0ARAas4O002092
X-loop: dm-devel@redhat.com
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jan Kara <jack@suse.com>, Josef Bacik <josef@toxicpanda.com>,
	Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
	linux-mtd@lists.infradead.org,
	Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Subject: Re: [dm-devel] [PATCH 10/44] block: remove a duplicate
	__disk_get_part prototype
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"

T24gMTEvMjYvMjAgMjowMyBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gQWNrZWQtYnk6IFRlanVuIEhl
byA8dGpAa2VybmVsLm9yZz4KPiBSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4K
PiBSZXZpZXdlZC1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9u
Lm9yZz4KPiBSZXZpZXdlZC1ieTogSm9oYW5uZXMgVGh1bXNoaXJuIDxqb2hhbm5lcy50aHVtc2hp
cm5Ad2RjLmNvbT4KPiAtLS0KPiAgIGluY2x1ZGUvbGludXgvZ2VuaGQuaCB8IDEgLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9nZW5oZC5oIGIvaW5jbHVkZS9saW51eC9nZW5oZC5oCj4gaW5kZXggNDY1NTNkNmQ2MDI1NjMu
LjIyZjViOWZkOTZmOGJmIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+ICsr
KyBiL2luY2x1ZGUvbGludXgvZ2VuaGQuaAo+IEBAIC0yNTAsNyArMjUwLDYgQEAgc3RhdGljIGlu
bGluZSBkZXZfdCBwYXJ0X2RldnQoc3RydWN0IGhkX3N0cnVjdCAqcGFydCkKPiAgIAlyZXR1cm4g
cGFydF90b19kZXYocGFydCktPmRldnQ7Cj4gICB9Cj4gICAKPiAtZXh0ZXJuIHN0cnVjdCBoZF9z
dHJ1Y3QgKl9fZGlza19nZXRfcGFydChzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgaW50IHBhcnRubyk7
Cj4gICBleHRlcm4gc3RydWN0IGhkX3N0cnVjdCAqZGlza19nZXRfcGFydChzdHJ1Y3QgZ2VuZGlz
ayAqZGlzaywgaW50IHBhcnRubyk7Cj4gICAKPiAgIHN0YXRpYyBpbmxpbmUgdm9pZCBkaXNrX3B1
dF9wYXJ0KHN0cnVjdCBoZF9zdHJ1Y3QgKnBhcnQpCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVp
bmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWlu
ZWNrZSAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRl
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAz
NjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8v
d3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

