Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 245911C818A
	for <lists+dm-devel@lfdr.de>; Thu,  7 May 2020 07:34:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588829659;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=IqTbtzrA1ID/dpvtKqyCcV7CwPnfwr0ppdO4klI5yqY=;
	b=VCl72IWPUqaN5W+2Rek+mi6oqNFcwgE0Il8ClyiXX7FIN6c2pwMkYcy9CyDk5BVeCbvga7
	cuaXazsfAYhm+WWlvvRyK6tYZgoxTi+AdRhlgrxvu9WbNcNBC6HYhAi4PbP+rMk4FoxTQI
	6eaQBvtvsnPMPqVZBeUD/ezNY18G80Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-dsHrTEoXNiqXrQJyTk66Rw-1; Thu, 07 May 2020 01:34:17 -0400
X-MC-Unique: dsHrTEoXNiqXrQJyTk66Rw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0EFB468;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C443F60CCC;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 401AE4CAA7;
	Thu,  7 May 2020 05:34:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0469GHQX015449 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 05:16:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4DA4C20316CF; Wed,  6 May 2020 09:16:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A1C52026D69
	for <dm-devel@redhat.com>; Wed,  6 May 2020 09:16:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D1BDB882977
	for <dm-devel@redhat.com>; Wed,  6 May 2020 09:16:14 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-284-2doE-4-4P2K_e3KQPOc5UQ-1; Wed, 06 May 2020 05:16:12 -0400
X-MC-Unique: 2doE-4-4P2K_e3KQPOc5UQ-1
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 49EA1F029C3B287432E4;
	Wed,  6 May 2020 17:16:08 +0800 (CST)
Received: from [127.0.0.1] (10.166.215.55) by DGGEMS414-HUB.china.huawei.com
	(10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
	17:16:05 +0800
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
To: Matthew Wilcox <willy@infradead.org>
References: <20200505115543.1660-1-thunder.leizhen@huawei.com>
	<20200505115543.1660-3-thunder.leizhen@huawei.com>
	<20200505172520.GI16070@bombadil.infradead.org>
	<32ba9907-60ad-27c0-c565-e7b5c80ab03c@huawei.com>
	<bddd596b-2e8e-42aa-70cc-41583b15c548@huawei.com>
Message-ID: <8fefbfb2-1100-fab2-0383-e57343dc44f5@huawei.com>
Date: Wed, 6 May 2020 17:16:04 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <bddd596b-2e8e-42aa-70cc-41583b15c548@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.166.215.55]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0469GHQX015449
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

CgpPbiAyMDIwLzUvNiAxMTo0NywgTGVpemhlbiAoVGh1bmRlclRvd24pIHdyb3RlOgo+IAo+IAo+
IE9uIDIwMjAvNS82IDk6MzMsIExlaXpoZW4gKFRodW5kZXJUb3duKSB3cm90ZToKPj4KPj4KPj4g
T24gMjAyMC81LzYgMToyNSwgTWF0dGhldyBXaWxjb3ggd3JvdGU6Cj4+PiBPbiBUdWUsIE1heSAw
NSwgMjAyMCBhdCAwNzo1NTo0MVBNICswODAwLCBaaGVuIExlaSB3cm90ZToKPj4+PiArKysgYi9t
bS9zd2FwZmlsZS5jCj4+Pj4gQEAgLTE3Nyw4ICsxNzcsOCBAQCBzdGF0aWMgaW50IGRpc2NhcmRf
c3dhcChzdHJ1Y3Qgc3dhcF9pbmZvX3N0cnVjdCAqc2kpCj4+Pj4gIAo+Pj4+ICAJLyogRG8gbm90
IGRpc2NhcmQgdGhlIHN3YXAgaGVhZGVyIHBhZ2UhICovCj4+Pj4gIAlzZSA9IGZpcnN0X3NlKHNp
KTsKPj4+PiAtCXN0YXJ0X2Jsb2NrID0gKHNlLT5zdGFydF9ibG9jayArIDEpIDw8IChQQUdFX1NI
SUZUIC0gOSk7Cj4+Pj4gLQlucl9ibG9ja3MgPSAoKHNlY3Rvcl90KXNlLT5ucl9wYWdlcyAtIDEp
IDw8IChQQUdFX1NISUZUIC0gOSk7Cj4+Pj4gKwlzdGFydF9ibG9jayA9IChzZS0+c3RhcnRfYmxv
Y2sgKyAxKSA8PCBTRUNUT1JTX1BFUl9QQUdFX1NISUZUOwo+Pj4+ICsJbnJfYmxvY2tzID0gKChz
ZWN0b3JfdClzZS0+bnJfcGFnZXMgLSAxKSA8PCBTRUNUT1JTX1BFUl9QQUdFX1NISUZUOwo+Pj4K
Pj4+IFRoaW5raW5nIGFib3V0IHRoaXMgc29tZSBtb3JlLCB3b3VsZG4ndCB0aGlzIGxvb2sgYmV0
dGVyPwo+Pj4KPj4+IAlzdGFydF9ibG9jayA9IHBhZ2Vfc2VjdG9ycyhzZS0+c3RhcnRfYmxvY2sg
KyAxKTsKPj4+IAlucl9ibG9jayA9IHBhZ2Vfc2VjdG9ycyhzZS0+bnJfcGFnZXMgLSAxKTsKPj4+
Cj4+Cj4+IE9L77yMVGhhdCdzIGZpbmUsIGl0J3MgY2xlYXJlci4gQW5kIGluIHRoaXMgd2F5LCB0
aGVyZSB3b24ndCBiZSBtb3JlIHRoYW4gODAgY29sdW1ucy4KPiAKPiBTaG91bGQgd2UgcmVuYW1l
ICJwYWdlX3NlY3RvcnMiIHRvICJwYWdlX3RvX3NlY3RvcnMiPyBCZWNhdXNlIHdlIG1heSBuZWVk
IHRvIGRlZmluZQo+ICJzZWN0b3JzX3RvX3BhZ2UiIGFsc28uCgpDaGFuZ2UgdGhlICJzZWN0b3Jz
X3RvX3BhZ2UiIHRvICJzZWN0b3JzX3RvX25wYWdlIiwgbnBhZ2UgbWVhbnMgIm51bWJlciBvZiBw
YWdlcyIKb3IgInBhZ2UgbnVtYmVyIi4gVG8gZGlzdGluZ3Vpc2ggdGhlIHVzZSBjYXNlIG9mICJw
Zm5fdG9fcGFnZSgpIiBldGMuIFRoZSBsYXR0ZXIKcmV0dXJucyB0aGUgcG9pbnRlciBvZiAic3Ry
dWN0IHBhZ2UiLgoKPiAKPj4KPj4+Cj4+PiAuCj4+PgoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlz
dApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0
aW5mby9kbS1kZXZlbA==

