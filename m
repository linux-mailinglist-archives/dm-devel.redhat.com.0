Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id DC53B1C818C
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 07:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588829659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SGWYOvJfu1psKekcCTgvLP4A9EURUgsV2V0P2SeZknc=;
	b=BWxaPxoKZmbzR6/7mGOH8RGJBjZlgQv+BoLcisQPhjVZGdwnzbX1azx9XcxgrSpYV4DimN
	+9p+8gwjXirEpTtZ+aI/93pdKbPynZFko2YXYtlHFcSkS+gYZ0XwzkqnIh39h1w6mqusn0
	vZerw82kesNKJPbr4p5Oz1PxlZOYKnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-7-_7EGE9NwGciJ94LV6m8g-1; Thu, 07 May 2020 01:34:16 -0400
X-MC-Unique: 7-_7EGE9NwGciJ94LV6m8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BA6C8014D6;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE03F63F61;
	Thu,  7 May 2020 05:34:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFFCD1809543;
	Thu,  7 May 2020 05:33:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0463lveX024367 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 5 May 2020 23:47:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 103B52166BA2; Wed,  6 May 2020 03:47:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C2ED2166B28
	for <dm-devel@redhat.com>; Wed,  6 May 2020 03:47:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E68C811E77
	for <dm-devel@redhat.com>; Wed,  6 May 2020 03:47:55 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-10-VRqygrPlM7aTjPPItV2oew-1; Tue, 05 May 2020 23:47:49 -0400
X-MC-Unique: VRqygrPlM7aTjPPItV2oew-1
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
	by Forcepoint Email with ESMTP id EAB4A1CEDB2C3B6D3534;
	Wed,  6 May 2020 11:47:44 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS408-HUB.china.huawei.com
	(10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
	11:47:41 +0800
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To: Matthew Wilcox <willy@infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-3-thunder.leizhen@huawei.com>
	<20200505172520.GI16070@bombadil.infradead.org>
	<32ba9907-60ad-27c0-c565-e7b5c80ab03c@huawei.com>
Message-ID: <bddd596b-2e8e-42aa-70cc-41583b15c548@huawei.com>
Date: Wed, 6 May 2020 11:47:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <32ba9907-60ad-27c0-c565-e7b5c80ab03c@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0463lveX024367
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLzUvNiA5OjMzLCBMZWl6aGVuIChUaHVuZGVyVG93bikgd3JvdGU6Cj4gCj4gCj4g
T24gMjAyMC81LzYgMToyNSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+IE9uIFR1ZSwgTWF5IDA1
LCAyMDIwIGF0IDA3OjU1OjQxUE0gKzA4MDAsIFpoZW4gTGVpIHdyb3RlOgo+Pj4gKysrIGIvbW0v
c3dhcGZpbGUuYwo+Pj4gQEAgLTE3Nyw4ICsxNzcsOCBAQCBzdGF0aWMgaW50IGRpc2NhcmRfc3dh
cChzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2kpCj4+PiAgCj4+PiAgCS8qIERvIG5vdCBkaXNj
YXJkIHRoZSBzd2FwIGhlYWRlciBwYWdlISAqLwo+Pj4gIAlzZSA9IGZpcnN0X3NlKHNpKTsKPj4+
IC0Jc3RhcnRfYmxvY2sgPSAoc2UtPnN0YXJ0X2Jsb2NrICsgMSkgPDwgKFBBR0VfU0hJRlQgLSA5
KTsKPj4+IC0JbnJfYmxvY2tzID0gKChzZWN0b3JfdClzZS0+bnJfcGFnZXMgLSAxKSA8PCAoUEFH
RV9TSElGVCAtIDkpOwo+Pj4gKwlzdGFydF9ibG9jayA9IChzZS0+c3RhcnRfYmxvY2sgKyAxKSA8
PCBTRUNUT1JTX1BFUl9QQUdFX1NISUZUOwo+Pj4gKwlucl9ibG9ja3MgPSAoKHNlY3Rvcl90KXNl
LT5ucl9wYWdlcyAtIDEpIDw8IFNFQ1RPUlNfUEVSX1BBR0VfU0hJRlQ7Cj4+Cj4+IFRoaW5raW5n
IGFib3V0IHRoaXMgc29tZSBtb3JlLCB3b3VsZG4ndCB0aGlzIGxvb2sgYmV0dGVyPwo+Pgo+PiAJ
c3RhcnRfYmxvY2sgPSBwYWdlX3NlY3RvcnMoc2UtPnN0YXJ0X2Jsb2NrICsgMSk7Cj4+IAlucl9i
bG9jayA9IHBhZ2Vfc2VjdG9ycyhzZS0+bnJfcGFnZXMgLSAxKTsKPj4KPiAKPiBPS++8jFRoYXQn
cyBmaW5lLCBpdCdzIGNsZWFyZXIuIEFuZCBpbiB0aGlzIHdheSwgdGhlcmUgd29uJ3QgYmUgbW9y
ZSB0aGFuIDgwIGNvbHVtbnMuCgpTaG91bGQgd2UgcmVuYW1lICJwYWdlX3NlY3RvcnMiIHRvICJw
YWdlX3RvX3NlY3RvcnMiPyBCZWNhdXNlIHdlIG1heSBuZWVkIHRvIGRlZmluZQoic2VjdG9yc190
b19wYWdlIiBhbHNvLgoKPiAKPj4KPj4gLgo+PgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApk
bS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kbS1kZXZlbA==

