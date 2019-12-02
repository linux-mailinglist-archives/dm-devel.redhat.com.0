Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4056210E828
	for <lists+dm-devel@lfdr.de>; Mon,  2 Dec 2019 11:04:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575281043;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RyCNbuVIiMXsZPtXOsVdjiOqk9UAtDwENfXrxJb+faA=;
	b=LF5B7voCsNQjlvPgDMTcsu23IFB9qTQK/e7aMLy5opGpXwKKwikE+5+GDN4AgKEzmaZotz
	N5vwlcg44V9FzOJ/a+ZFO0v4qjf4cOLKusTqIQwVwnlzyFonNGdoUcJKtxkgilBU100QlH
	+15QljiT6yRuV6QR28XIToYVpYTITyg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-3f-1dXSrMyeuGnK5lf128g-1; Mon, 02 Dec 2019 05:03:42 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B47A1005514;
	Mon,  2 Dec 2019 10:03:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5BFC67648;
	Mon,  2 Dec 2019 10:03:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3D8A64EA33;
	Mon,  2 Dec 2019 10:03:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB27oDKS009001 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Dec 2019 02:50:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 696F910A4910; Mon,  2 Dec 2019 07:50:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 651E910A490E
	for <dm-devel@redhat.com>; Mon,  2 Dec 2019 07:50:11 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 941A91018C31
	for <dm-devel@redhat.com>; Mon,  2 Dec 2019 07:50:11 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R161e4; CH=green; DM=||false|;
	DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01f04427;
	MF=jefflexu@linux.alibaba.com; NM=1; PH=DS; RN=1; SR=0;
	TI=SMTPD_---0Tjg.uWv_1575273003;
Received: from out30-45.freemail.mail.aliyun.com
	(out30-45.freemail.mail.aliyun.com [115.124.30.45]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-313-UANVufi4NAKpW994z5oxEw-1;
	Mon, 02 Dec 2019 02:50:09 -0500
Received: from admindeMacBook-Pro-2.local(mailfrom:jefflexu@linux.alibaba.com
	fp:SMTPD_---0Tjg.uWv_1575273003) by smtp.aliyun-inc.com(127.0.0.1);
	Mon, 02 Dec 2019 15:50:03 +0800
To: dm-devel@redhat.com
References: <35cf1ecf-5cd8-604b-ec4e-18c9fd4a4195@linux.alibaba.com>
	<20191122185530.pcrgmb655dkdbdcq@reti>
From: JeffleXu <jefflexu@linux.alibaba.com>
Message-ID: <6b12137e-411e-0368-518e-41ae54e138e0@linux.alibaba.com>
Date: Mon, 2 Dec 2019 15:50:03 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191122185530.pcrgmb655dkdbdcq@reti>
X-MC-Unique: UANVufi4NAKpW994z5oxEw-1
X-MC-Unique: 3f-1dXSrMyeuGnK5lf128g-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id xB27oDKS009001
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 02 Dec 2019 05:03:09 -0500
Subject: Re: [dm-devel] dm-thin: Several Questions on dm-thin performance.
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64

VGhhbmtzIGZvciByZXBseWluZyBhbmQgZXhwbGFuYXRpb24uCgpBbnl3YXksIGl0IHNlZW1zIGEg
c2lnbmlmaWNhbnQgd29ya2xvYWQgdG8gdHJhbnNmb3JtIHRvIGJpby1wcmlzb24tY2VsbC12Mi4K
CgpSZWdhcmRzCgpKZWZmbGUKCgrlnKggMjAxOS8xMS8yMyDkuIrljYgyOjU1LCBKb2UgVGhvcm5i
ZXIg5YaZ6YGTOgoKPiBPbiBGcmksIE5vdiAyMiwgMjAxOSBhdCAxMToxNDoxNUFNICswODAwLCBK
ZWZmbGVYdSB3cm90ZToKPgo+PiBUaGUgZmlyc3QgcXVlc3Rpb24gaXMgd2hhdCdzIHRoZSBwdXJw
b3NlIG9mIGRhdGEgY2VsbD8gSW4gdGhpbl9iaW9fbWFwKCksCj4+IG5vcm1hbCBiaW8gd2lsbCBi
ZSBwYWNrZWQgYXMgYSB2aXJ0dWFsIGNlbGwgYW5kIGRhdGEgY2VsbC4gSSBjYW4gdW5kZXJzdGFu
ZAo+PiB0aGF0IHZpcnR1YWwgY2VsbCBpcyB1c2VkIHRvIHByZXZlbnQgZGlzY2FyZCBiaW8gYW5k
IG5vbi1kaXNjYXJkIGJpbwo+PiB0YXJnZXRpbmcgdGhlIHNhbWUgYmxvY2sgZnJvbSBiZWluZyBw
cm9jZXNzZWQgYXQgdGhlIHNhbWUgdGltZS4gSSBmaW5kIGl0Cj4+IHdhcyBhZGRlZCBpbiBjb21t
aXQgwqDCoMKgIGU4MDg4MDczYzk2MTBhZjAxN2ZkNDdmZGRkMTA0YTJjM2FmYjMyZTggKGRtIHRo
aW46Cj4+IGZpeCByYWNlIGJldHdlZW4gc2ltdWx0YW5lb3VzIGlvIGFuZCBkaXNjYXJkcyB0byBz
YW1lIGJsb2NrKSwgYnV0IEknbSBzdGlsbAo+PiBjb25mdXNlZCBhYm91dCB0aGUgdXNlIG9mIGRh
dGEgY2VsbC4KPiBBcyB5b3UgYXJlIGF3YXJlIHRoZXJlIGFyZSB0d28gYWRkcmVzcyBzcGFjZXMg
Zm9yIHRoZSBsb2Nrcy4gIFRoZSAndmlydHVhbCcgb25lCj4gcmVmZXJzIHRvIGNlbGxzIGluIHRo
ZSBsb2dpY2FsIGFkZHJlc3Mgc3BhY2Ugb2YgdGhlIHRoaW4gZGV2aWNlcywgYW5kIHRoZSAnZGF0
YScgb25lCj4gcmVmZXJzIHRvIHRoZSB1bmRlcmx5aW5nIGRhdGEgZGV2aWNlLiAgVGhlcmUgYXJl
IGNlcnRhaW4gY29uZGl0aW9ucyB3aGVyZSB3ZQo+IHVuZm9ydHVuYXRlbHkgbmVlZCB0byBob2xk
IGJvdGggb2YgdGhlc2UgKGVnLCB0byBwcmV2ZW50IGEgZGF0YSBibG9jayBiZWluZyByZXByb3Zp
c2lvbmVkCj4gYmVmb3JlIGFuIGlvIHRvIGl0IGhhcyBjb21wbGV0ZWQpLgo+Cj4+IFRoZSBzZWNv
bmQgcXVlc3Rpb24gaXMgdGhlIGltcGFjdCBvZiB2aXJ0dWFsIGNlbGwgYW5kIGRhdGEgY2VsbCBv
biBJTwo+PiBwZXJmb3JtYW5jZS4gSWYgJGRhdGFfYmxvY2tfc2l6ZSBpcyBsYXJnZSBmb3IgZXhh
bXBsZSAxRywgaW4gbXVsdGl0aHJlYWQgZmlvCj4+IHRlc3QsIG1vc3QgYmlvIHdpbGwgYmUgYnVm
ZmVyZWQgaW4gY2VsbC0+YmlvcyBsaXN0IGFuZCB0aGVuIGJlIHByb2Nlc3NlZCBieQo+PiB3b3Jr
ZXIgdGhyZWFkIGFzeW5jaHJvbm91c2x5LCBldmVuIHdoZW4gdGhlcmUncyBubyBkaXNjYXJkIGJp
by4gVGh1cyB0aGUKPj4gb3JpZ2luYWwgcGFyYWxsZWwgSU8gaXMgcHJvY2Vzc2VkIGJ5IHdvcmtl
ciB0aHJlYWQgc2VyaWFsbHkgbm93LiBBcyB0aGUKPj4gbnVtYmVyIG9mIGZpbyB0ZXN0IHRocmVh
ZHMgaW5jcmVhc2UsIHRoZSBzaW5nbGUgd29ya2VyIHRocmVhZCBjYW4gZWFzaWx5IGdldAo+PiBD
UFUgMTAwJSwgYW5kIHRodXMgYmVjb21lIHRoZSBib3R0bGVuZWNrIG9mIHRoZSBwZXJmb3JtYW5j
ZSBzaW5jZSBkbS10aGluCj4+IHdvcmtxdWV1ZSBpcyBvcmRlcmVkIHVuYm91bmQuCj4gWWVwLCB0
aGlzIGlzIGEgYmlnIGlzc3VlLiAgVGFrZSBhIGxvb2sgYXQgZG0tYmlvLXByaXNvbi12Mi5oLCB0
aGlzIGlzIHRoZQo+IG5ldyBpbnRlcmZhY2UgdGhhdCB3ZSBuZWVkIHRvIG1vdmUgZG0tdGhpbiBh
Y3Jvc3MgdG8gdXNlIChkbS1jYWNoZSBhbHJlYWR5IHVzZXMgaXQpLgo+IEl0IGFsbG93cyBjb25j
dXJyZW50IGhvbGRlcnMgb2YgYSBjZWxsIChpZSwgcmVhZCBsb2NrcyksIHNvIHdlJ2xsIGJlIGFi
bGUgdG8gcmVtYXAKPiBtdWNoIG1vcmUgaW8gd2l0aG91dCBoYW5kaW5nIGl0IG9mZiB0byBhIHdv
cmtlciB0aHJlYWQuICBPbmNlIHRoaXMgaXMgZG9uZSBJIHdhbnQKPiB0byBhZGQgYW4gZXh0cmEg
ZmllbGQgdG8gY2VsbHMgdGhhdCB3aWxsIGNhY2hlIHRoZSBtYXBwaW5nLCB0aGlzIHdheSBpZiB5
b3UgYWNxdWlyZSBhCj4gY2VsbCB0aGF0IGlzIGFscmVhZHkgaGVsZCB0aGVuIHlvdSBjYW4gYXZv
aWQgdGhlIGV4cGVuc2l2ZSBidHJlZSBsb29rdXAuICBUb2dldGhlcgo+IHRoZXNlIGNoYW5nZXMg
c2hvdWxkIG1ha2UgYSBodWdlIGRpZmZlcmVuY2UgdG8gdGhlIHBlcmZvcm1hbmNlLgo+Cj4gSWYg
eW91J3ZlIGdvdCBzb21lIHNwYXJlIGNvZGluZyBjeWNsZXMgSSdkIGxvdmUgc29tZSBoZWxwIHdp
dGggdGhpcyA7KQo+Cj4gLSBKb2UKPgo+IC0tCj4gZG0tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZG0t
ZGV2ZWxAcmVkaGF0LmNvbQo+IGh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5m
by9kbS1kZXZlbAoKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29t
Cmh0dHBzOi8vd3d3LnJlZGhhdC5jb20vbWFpbG1hbi9saXN0aW5mby9kbS1kZXZlbA==

