Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F5B367A
	for <lists+dm-devel@lfdr.de>; Mon, 16 Sep 2019 10:38:43 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 07B9518CB8F5;
	Mon, 16 Sep 2019 08:38:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9B0B60606;
	Mon, 16 Sep 2019 08:38:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 24BC51808876;
	Mon, 16 Sep 2019 08:38:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DDfVpa032047 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 09:41:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2C4CC5C22F; Fri, 13 Sep 2019 13:41:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx25.extmail.prod.ext.phx2.redhat.com
	[10.5.110.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 25ADA5C219
	for <dm-devel@redhat.com>; Fri, 13 Sep 2019 13:41:26 +0000 (UTC)
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.45])
	by mx1.redhat.com (Postfix) with ESMTP id DBA1E10F2E81
	for <dm-devel@redhat.com>; Fri, 13 Sep 2019 13:41:25 +0000 (UTC)
Received: from mail.ispras.ru (localhost [127.0.0.1])
	by mail.ispras.ru (Postfix) with ESMTPSA id 9EB1654008B;
	Fri, 13 Sep 2019 16:41:24 +0300 (MSK)
MIME-Version: 1.0
Date: Fri, 13 Sep 2019 16:41:24 +0300
From: efremov <efremov@ispras.ru>
To: Denis Efremov <efremov@ispras.ru>
Organization: ISPRAS
In-Reply-To: <85d9e45a-9631-a139-2d65-86a6753a35e6@ispras.ru>
References: <20190821074200.2203-1-efremov@ispras.ru>
	<20190824100102.1167-1-efremov@ispras.ru>
	<20190825061158.GC28002@bombadil.infradead.org>
	<ba051566-0343-ea75-0484-8852f65a15da@ispras.ru>
	<20190826183956.GF15933@bombadil.infradead.org>
	<85d9e45a-9631-a139-2d65-86a6753a35e6@ispras.ru>
Message-ID: <b9471f7165bf57e348729a09e07d7055@ispras.ru>
X-Sender: efremov@ispras.ru
User-Agent: Roundcube Webmail/1.1.2
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.6.2 (mx1.redhat.com
	[10.5.110.66]); Fri, 13 Sep 2019 13:41:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]);
	Fri, 13 Sep 2019 13:41:26 +0000 (UTC) for IP:'83.149.199.45'
	DOMAIN:'mail.ispras.ru' HELO:'mail.ispras.ru'
	FROM:'efremov@ispras.ru' RCPT:''
X-RedHat-Spam-Score: 0  (RCVD_IN_DNSWL_NONE, SPF_HELO_NONE,
	SPF_PASS) 83.149.199.45 mail.ispras.ru 83.149.199.45
	mail.ispras.ru <efremov@ispras.ru>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.66
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 16 Sep 2019 04:38:17 -0400
Cc: Shelekhov <vshel@iis.nsk.su>, Jan Kara <jack@suse.cz>, Vladimir,
	Matthew Wilcox <matthew@wil.cx>, Akinobu, Mita <akinobu.mita@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	linux-kernel@vger.kernel.org, dm-devel@redhat.com,
	Erdem Tumurov <erdemus@gmail.com>, linux-fsdevel@vger.kernel.org,
	akpm@linux-foundation.org, linux-media@vger.kernel.org
Subject: Re: [dm-devel] [PATCH v2] lib/memweight.c: open codes
	bitmap_weight()
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.63]); Mon, 16 Sep 2019 08:38:42 +0000 (UTC)

U29ycnksIG5vIHF1ZXN0aW9uLCBwb2ludGVyIGFsaWdubWVudCBvZiBjb3Vyc2UuCgpEZW5pcyBF
ZnJlbW92INC/0LjRgdCw0LsgMjAxOS0wOS0xMyAxNDo0ODoKPiBIaSwKPiAKPiBTb3JyeSBmb3Ig
cmV2aXZpbmcgdGhpcyBjb252ZXJzYXRpb24sIGJ1dCBpdCBsb29rcyB0byBtZSBsaWtlCj4gdGhp
cyBmdW5jdGlvbiBjb3VsZCBiZSByZWR1Y2VkIHRvIGEgc2luZ2xlIGJpdG1hcF93ZWlnaHQgY2Fs
bDoKPiAKPiBzdGF0aWMgaW5saW5lIHNpemVfdCBtZW13ZWlnaHQoY29uc3Qgdm9pZCAqcHRyLCBz
aXplX3QgYnl0ZXMpCj4gewo+ICAgICAgICAgQlVHX09OKGJ5dGVzID49IFVJTlRfTUFYIC8gQklU
U19QRVJfQllURSk7Cj4gICAgICAgICByZXR1cm4gYml0bWFwX3dlaWdodChwdHIsIGJ5dGVzICog
QklUU19QRVJfQllURSk7Cj4gfQo+IAo+IENvbXBhcmluZyB0byB0aGUgY3VycmVudCBpbXBsZW1l
bnRhdGlvbgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2Uv
bGliL21lbXdlaWdodC5jI0wxMQo+IHRoaXMgcmVzdWx0cyBpbiBhIHNpZ25pZmljYXRpb24gc2lt
cGxpZmljYXRpb24uCj4gCj4gX19iaXRtYXBfd2VpZ2h0IGFscmVhZHkgY291bnQgbGFzdCBiaXRz
IHdpdGggaHdlaWdodF9sb25nIGFzIHdlCj4gZGlzY3Vzc2VkIGVhcmxpZXIuCj4gCj4gaW50IF9f
Yml0bWFwX3dlaWdodChjb25zdCB1bnNpZ25lZCBsb25nICpiaXRtYXAsIHVuc2lnbmVkIGludCBi
aXRzKQo+IHsKPiAJLi4uCj4gCWlmIChiaXRzICUgQklUU19QRVJfTE9ORykKPiAJCXcgKz0gaHdl
aWdodF9sb25nKGJpdG1hcFtrXSAmIEJJVE1BUF9MQVNUX1dPUkRfTUFTSyhiaXRzKSk7Cj4gCS4u
Lgo+IH0KPiAKPiBhbmQgX19hcmNoX2h3ZWlnaHQqIGZ1bmN0aW9ucyB1c2UgcG9wY250IGluc3Ry
dWN0aW9uLgo+IAo+IEkndmUgYnJpZWZseSB0ZXN0ZWQgdGhlIGVxdWl2YWxlbmNlIG9mIDIgaW1w
bGVtZW50YXRpb25zIG9uIHg4Nl82NCB3aXRoCj4gZnV6emluZyBoZXJlOiAKPiBodHRwczovL2dp
c3QuZ2l0aHViLmNvbS9ldmRlbmlzLzk1YThiOWI4MDQxZTA5MzY4YjMxYzNhOTUxMDQ5MWE1Cj4g
Cj4gV2hhdCBkbyB5b3UgdGhpbmsgbWFraW5nIHRoaXMgZnVuY3Rpb24gc3RhdGljIGlubGluZSBh
bmQgbW92aW5nIGl0Cj4gdG8gaW5jbHVkZS9saW51eC9zdHJpbmcuaD8gSSBjb3VsZCBwcmVwYXJl
IGEgcGF0Y2ggZm9yIGl0IGFuZCBhZGQgc29tZSAKPiB0ZXN0cyBmb3IKPiBtZW13ZWlnaHQgYW5k
IGJpdG1hcF93ZWlnaHQuIE9yIG1heWJlIEkgbWlzcyBzb21ldGhpbmcgYWdhaW4/Cj4gCj4gQmVz
dCByZWdhcmRzLAo+IERlbmlzCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVk
aGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=
