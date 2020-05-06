Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 110311C818D
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 07:34:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588829660;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0QzfyAU8coQahJ17U06QMglbcWoszEPQxH4Sgkt5l9c=;
	b=WQNGPTAtUeHetz1h4bMUw0pGwGZ0QcX62teU/LGopTyVC93xyGH10a5HIdV+yUf+vUdBq+
	7lkhO6LOmmxv89+qIMHjqN0K9swty7569Jk2Zx+rM6/BmjThsX4eZuC6nFayXUwSeW3sYH
	CkqgfXlroxa0zSbxJb8WUsiSKQJ3VWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-28ZTWfubPXS0Nc8ZU_wn5g-1; Thu, 07 May 2020 01:34:16 -0400
X-MC-Unique: 28ZTWfubPXS0Nc8ZU_wn5g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 065AC100CCC3;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 152247055D;
	Thu,  7 May 2020 05:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D8D2D180954D;
	Thu,  7 May 2020 05:33:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0461Y81D014482 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 21:34:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E08FDD29D9; Wed,  6 May 2020 01:34:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DC3A476ED
	for <dm-devel@redhat.com>; Wed,  6 May 2020 01:34:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3141F8008A3
	for <dm-devel@redhat.com>; Wed,  6 May 2020 01:34:02 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-367-3ShuPOZBMp-kIBMriwZYJQ-1; Tue, 05 May 2020 21:33:57 -0400
X-MC-Unique: 3ShuPOZBMp-kIBMriwZYJQ-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 44882CD09A619D1254D8;
	Wed,  6 May 2020 09:33:53 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS413-HUB.china.huawei.com
	(10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
	09:33:52 +0800
To: Matthew Wilcox <willy@infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-3-thunder.leizhen@huawei.com>
	<20200505172520.GI16070@bombadil.infradead.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <32ba9907-60ad-27c0-c565-e7b5c80ab03c@huawei.com>
Date: Wed, 6 May 2020 09:33:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20200505172520.GI16070@bombadil.infradead.org>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0461Y81D014482
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 07 May 2020 01:33:44 -0400
Cc: Jens Axboe <axboe@kernel.dk>, linux-raid <linux-raid@vger.kernel.org>,
	Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
	Mike Snitzer <snitzer@redhat.com>, linux-mm <linux-mm@kvack.org>,
	Song Liu <song@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
	linux-block <linux-block@vger.kernel.org>,
	Minchan Kim <minchan@kernel.org>, dm-devel <dm-devel@redhat.com>,
	Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>, Nitin Gupta <ngupta@vflare.org>
Subject: Re: [dm-devel] [PATCH 2/4] mm/swap: use SECTORS_PER_PAGE_SHIFT to
	clean up code
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLzUvNiAxOjI1LCBNYXR0aGV3IFdpbGNveCB3cm90ZToKPiBPbiBUdWUsIE1heSAw
NSwgMjAyMCBhdCAwNzo1NTo0MVBNICswODAwLCBaaGVuIExlaSB3cm90ZToKPj4gKysrIGIvbW0v
c3dhcGZpbGUuYwo+PiBAQCAtMTc3LDggKzE3Nyw4IEBAIHN0YXRpYyBpbnQgZGlzY2FyZF9zd2Fw
KHN0cnVjdCBzd2FwX2luZm9fc3RydWN0ICpzaSkKPj4gIAo+PiAgCS8qIERvIG5vdCBkaXNjYXJk
IHRoZSBzd2FwIGhlYWRlciBwYWdlISAqLwo+PiAgCXNlID0gZmlyc3Rfc2Uoc2kpOwo+PiAtCXN0
YXJ0X2Jsb2NrID0gKHNlLT5zdGFydF9ibG9jayArIDEpIDw8IChQQUdFX1NISUZUIC0gOSk7Cj4+
IC0JbnJfYmxvY2tzID0gKChzZWN0b3JfdClzZS0+bnJfcGFnZXMgLSAxKSA8PCAoUEFHRV9TSElG
VCAtIDkpOwo+PiArCXN0YXJ0X2Jsb2NrID0gKHNlLT5zdGFydF9ibG9jayArIDEpIDw8IFNFQ1RP
UlNfUEVSX1BBR0VfU0hJRlQ7Cj4+ICsJbnJfYmxvY2tzID0gKChzZWN0b3JfdClzZS0+bnJfcGFn
ZXMgLSAxKSA8PCBTRUNUT1JTX1BFUl9QQUdFX1NISUZUOwo+IAo+IFRoaW5raW5nIGFib3V0IHRo
aXMgc29tZSBtb3JlLCB3b3VsZG4ndCB0aGlzIGxvb2sgYmV0dGVyPwo+IAo+IAlzdGFydF9ibG9j
ayA9IHBhZ2Vfc2VjdG9ycyhzZS0+c3RhcnRfYmxvY2sgKyAxKTsKPiAJbnJfYmxvY2sgPSBwYWdl
X3NlY3RvcnMoc2UtPm5yX3BhZ2VzIC0gMSk7Cj4gCgpPS++8jFRoYXQncyBmaW5lLCBpdCdzIGNs
ZWFyZXIuIEFuZCBpbiB0aGlzIHdheSwgdGhlcmUgd29uJ3QgYmUgbW9yZSB0aGFuIDgwIGNvbHVt
bnMuCgo+IAo+IC4KPiAKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0
LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

