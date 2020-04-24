Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7BFBA1B75A2
	for <lists+dm-devel@lfdr.de>; Fri, 24 Apr 2020 14:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587732254;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xdbfod7Iyj/YWArrpR91qFneqcWsxpf4hxSfFybvKro=;
	b=Qxu1nIjCYQQouN1g9aOsCJD6UcN/RduiI9yk+77u3IU0cmK8wvEq8vmIIQ884LsO9Q6zaR
	UAo10eMT7AlbOZs9uoPn8QxgDtIOguxE3/RKx/y0enP+pQ7IrU0BfU5VWssu30ofaeEWx3
	hkdTOkE0BSZhZhKmenehsONv5F0pmLw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61-POaoT9UgOU--9KFZ9Lefrw-1; Fri, 24 Apr 2020 08:44:12 -0400
X-MC-Unique: POaoT9UgOU--9KFZ9Lefrw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 79CBB1054F99;
	Fri, 24 Apr 2020 12:44:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21BF15D9CC;
	Fri, 24 Apr 2020 12:44:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52E501809542;
	Fri, 24 Apr 2020 12:43:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03OChsNf031677 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 24 Apr 2020 08:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 18E4F2026D5D; Fri, 24 Apr 2020 12:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1088D202683D
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 12:43:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9ECEB800FC0
	for <dm-devel@redhat.com>; Fri, 24 Apr 2020 12:43:51 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-73-8oXZfPJKM42cAe5Si3RSYA-1;
	Fri, 24 Apr 2020 08:43:47 -0400
X-MC-Unique: 8oXZfPJKM42cAe5Si3RSYA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 94659AD7C;
	Fri, 24 Apr 2020 12:43:44 +0000 (UTC)
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20200424102351.475641-1-ming.lei@redhat.com>
	<20200424102351.475641-3-ming.lei@redhat.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <2b2df3bc-edc2-7179-a57b-daad7d67cfac@suse.de>
Date: Fri, 24 Apr 2020 14:43:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200424102351.475641-3-ming.lei@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03OChsNf031677
X-loop: dm-devel@redhat.com
Cc: Hannes Reinecke <hare@suse.com>, Bart Van Assche <bvanassche@acm.org>,
	Mike Snitzer <snitzer@redhat.com>,
	John Garry <john.garry@huawei.com>, linux-block@vger.kernel.org,
	dm-devel@redhat.com, Thomas Gleixner <tglx@linutronix.de>,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [dm-devel] [PATCH V8 02/11] block: add helper for copying
	request
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

T24gNC8yNC8yMCAxMjoyMyBQTSwgTWluZyBMZWkgd3JvdGU6Cj4gQWRkIG9uZSBuZXcgaGVscGVy
IG9mIGJsa19ycV9jb3B5X3JlcXVlc3QoKSB0byBjb3B5IHJlcXVlc3QsIGFuZCB0aGUgaGVscGVy
Cj4gd2lsbCBiZSB1c2VkIGluIHRoaXMgcGF0Y2ggZm9yIHJlLXN1Ym1pdHRpbmcgcmVxdWVzdCwg
c28gbWFrZSBpdCBhcyBhIGJsb2NrCj4gbGF5ZXIgaW50ZXJuYWwgaGVscGVyLgo+IAo+IENjOiBK
b2huIEdhcnJ5IDxqb2huLmdhcnJ5QGh1YXdlaS5jb20+Cj4gQ2M6IEJhcnQgVmFuIEFzc2NoZSA8
YnZhbmFzc2NoZUBhY20ub3JnPgo+IENjOiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5jb20+
Cj4gQ2M6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBUaG9tYXMgR2xlaXhu
ZXIgPHRnbHhAbGludXRyb25peC5kZT4KPiBDYzogTWlrZSBTbml0emVyIDxzbml0emVyQHJlZGhh
dC5jb20+Cj4gQ2M6IGRtLWRldmVsQHJlZGhhdC5jb20KPiBTaWduZWQtb2ZmLWJ5OiBNaW5nIExl
aSA8bWluZy5sZWlAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGJsb2NrL2Jsay1jb3JlLmMgfCAzMyAr
KysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0KPiAgIGJsb2NrL2Jsay5oICAgICAgfCAg
MiArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMo
LSkKPiBSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMs
CgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICBUZWFtbGVhZCBTdG9y
YWdlICYgTmV0d29ya2luZwpoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR2VzY2jD
pGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlz
dApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kbS1kZXZlbA==

