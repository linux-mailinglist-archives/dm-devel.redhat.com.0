Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4B52520325C
	for <lists+dm-devel@lfdr.de>; Mon, 22 Jun 2020 10:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592815663;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=XufFatMYkIPWL9iWKpdrivkFJsRDq0tEC2X3mRmFEXg=;
	b=UnUXH5F16dIjlDmlkhJhS20b48xy2+Jtkb/PyTLPMp9rGs6gs6XOygb/5uIYaYQomqYZw3
	UFJGAtAZK4jNlU09f5tUUsUAp4A+sUnAdynzot15qqZwG5OIFKcfQhgPFKnv5Da5K0GUH/
	SmuxnOJxuc/etRi2aA4FJ3VBvJhdu7k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-0e2rwCAcMniDD2Q--8T0SA-1; Mon, 22 Jun 2020 04:47:41 -0400
X-MC-Unique: 0e2rwCAcMniDD2Q--8T0SA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2B6C835B48;
	Mon, 22 Jun 2020 08:47:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 80D605D9F1;
	Mon, 22 Jun 2020 08:47:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3F4381809554;
	Mon, 22 Jun 2020 08:47:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05M0Xens019753 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 21 Jun 2020 20:33:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0DE534241B; Mon, 22 Jun 2020 00:33:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 082C73325F
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:33:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16076185A797
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:33:37 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-34-hUGu5khJPfqghGP-iz85gw-1; Sun, 21 Jun 2020 20:33:34 -0400
X-MC-Unique: hUGu5khJPfqghGP-iz85gw-1
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20200622003331epoutp02bb4efc18c094d38a62c40a62395cf361~atnBPDicw1183111831epoutp02g
	for <dm-devel@redhat.com>; Mon, 22 Jun 2020 00:33:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20200622003331epoutp02bb4efc18c094d38a62c40a62395cf361~atnBPDicw1183111831epoutp02g
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas1p4.samsung.com (KnoxPortal) with ESMTP id
	20200622003331epcas1p4a633442df0ff69d93d9c2b5654196b05~atnBA2CNx2214822148epcas1p4y;
	Mon, 22 Jun 2020 00:33:31 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 49qr4B3PrnzMqYkh;
	Mon, 22 Jun 2020 00:33:30 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	B0.9F.28578.A5CFFEE5; Mon, 22 Jun 2020 09:33:30 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20200622003329epcas1p1ae0bb8f2652a9f350e5db9688ddb906d~atm-kIjME0189001890epcas1p1v;
	Mon, 22 Jun 2020 00:33:29 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20200622003329epsmtrp1aa4654e323de0f100614d64b9e6fd31f~atm-jfIIM0832908329epsmtrp1x;
	Mon, 22 Jun 2020 00:33:29 +0000 (GMT)
X-AuditID: b6c32a39-8dfff70000006fa2-9f-5eeffc5a1298
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2B.7F.08382.95CFFEE5; Mon, 22 Jun 2020 09:33:29 +0900 (KST)
Received: from [10.253.105.155] (unknown [10.253.105.155]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20200622003329epsmtip24f83689fd80193be4905a39b19599e72~atm-VMlFV0734207342epsmtip2h;
	Mon, 22 Jun 2020 00:33:29 +0000 (GMT)
To: Mike Snitzer <snitzer@redhat.com>, Sami Tolvanen <samitolvanen@google.com>
From: JeongHyeon Lee <jhs2.lee@samsung.com>
Message-ID: <3df0c938-6b7d-4c02-e243-22e0d95e3de0@samsung.com>
Date: Mon, 22 Jun 2020 09:27:27 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200618170952.GA18057@redhat.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmgW7Un/dxBqcOSVqsP3WM2eLJgXZG
	i73vZrNaLGxbwmJxedccNoulK96yWrRt/MrowO6xYFOpx+K+yawe7/ddZfP4vEkugCUqxyYj
	NTEltUghNS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6AAlhbLEnFKg
	UEBicbGSvp1NUX5pSapCRn5xia1SakFKToGhQYFecWJucWleul5yfq6VoYGBkSlQZUJOxp9j
	61gLeuUqOneeZGpgbJPoYuTkkBAwkZg2ZwpzFyMXh5DADkaJ3deWMEI4nxglnl3sZ4VwvjFK
	7DrXygrTsrexlwXEFhLYyyhxeY4aRNF7Roktm2aBFQkL6El87PwKZosIBEjc//SOEcRmFiiS
	6P38FizOJqAtcbtlEzuIzStgJzFx/VegOzg4WARUJTZsFwIJiwpESNw/toEVokRQ4uTMJ2B7
	OQUMJJZ+b2SCGCkv0bx1NjOELS5x68l8JpB7JARaOSSu/VrOCHG0i8T7d3+gHhCWeHV8CzuE
	LSXxsr8Nyi6XuNJ0Gaq+RmLChW6oemOJ+S0LwW5jFtCUWL9LHyKsKLHz91yot/gk3n3tYQUp
	kRDglehoE4IoUZJY8e8aC4QtIbHhcDcbhO0hsbR1OusERsVZSD6bheSbWUi+mYWweAEjyypG
	sdSC4tz01GLDAlPkuN7ECE6bWpY7GKe//aB3iJGJg/EQowQHs5II7+uAd3FCvCmJlVWpRfnx
	RaU5qcWHGE2BQT2RWUo0OR+YuPNK4g1NjYyNjS1MzMzNTI2VxHmdrC/ECQmkJ5akZqemFqQW
	wfQxcXBKNTCFyzl4JXZsv1si8C4pOGfxhbOcnrWtzNa3Pncc+RQ5S/9aqHGX+7H9shc3vfO6
	rb15iZ5vyubabaLnj18P/lfyrUZMffcd7Sf8mmeLP+wUtDnbH9z/R7Kw09Bm39Wu7i8x3vpn
	DnNN/rrnq+itX6GT72S6V0b8CU089kHxeWdsOtOxmA95/z9zu01Rln1/fFKcUPg8Seu1QQ86
	v98OV8wW8MicGpN17/PZWaohqr6ZHwJZCtTFH++cs9pRqfLQxJdVFv8X1P79PWHuUa6lpnva
	0p/6NvTo7/Gepns19tGC4tqCiL6Xe1I7zZquf11yvORa4bKfkRNzbhwWNGXwqruxVWTGYeEt
	4jz1x+4t28+sxFKckWioxVxUnAgAxvR3gCQEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPLMWRmVeSWpSXmKPExsWy7bCSvG7kn/dxBt/eG1msP3WM2eLJgXZG
	i73vZrNaLGxbwmJxedccNoulK96yWrRt/MrowO6xYFOpx+K+yawe7/ddZfP4vEkugCWKyyYl
	NSezLLVI3y6BK+PPsXWsBb1yFZ07TzI1MLZJdDFyckgImEjsbexlAbGFBHYzSjycZA8Rl5DY
	sGktexcjB5AtLHH4cHEXIxdQyVtGiZ6ex4wgNcICehIfO7+ygtgiAn4Sk48/YwaxmQWKJHbe
	PskE0dDMJHF78WQ2kASbgLbE7ZZN7CA2r4CdxMT1X5lBFrAIqEps2C4EEhYViJA4834FC0SJ
	oMTJmU/AbE4BA4ml3xuZIOabSczb/BBql7xE89bZULa4xK0n85kmMArNQtI+C0nLLCQts5C0
	LGBkWcUomVpQnJueW2xYYJiXWq5XnJhbXJqXrpecn7uJERwnWpo7GLev+qB3iJGJg/EQowQH
	s5II7+uAd3FCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeW8ULowTEkhPLEnNTk0tSC2CyTJxcEo1
	MKWVSHK4Ghg8vm206rCqQVnsav/Kqy0Hj7WoTVJ68/Uxy9HFoekex95VtkzRbfi30snu2Iwu
	m1Kvxw7iclI+z36v8iuaXn7gx+wdqj/KbjE53MiqWtnYK/d5xukuiUmW/dsYjyj9tpn5ZKba
	+jWc4du8Hqyvn/pMXGdPj5KG68QX73handKkY49cXVuQpyQc9G+J7ptbh7V/ljD8u/1WY0OP
	JEcxj8WSmX1PbCZuMjk3d6vi1aUCewOEGFVLBHond/zk3FdSf/fY4e/egjKbN5yb8Mv1k62A
	1/7tDR/mi5q1ZXpe408yd9t01eJ2ErPU7Z1f5qlekRd4qnrf2bpoIfOSJxzF/xobXx/L3/Rq
	dokSS3FGoqEWc1FxIgBvTZqGAgMAAA==
X-CMS-MailID: 20200622003329epcas1p1ae0bb8f2652a9f350e5db9688ddb906d
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25
References: <CGME20200618070250epcas1p409eb2ddd19ecc5d55c219ac3dc884f25@epcas1p4.samsung.com>
	<98eac3fc-c399-625d-5730-29853b3a0771@samsung.com>
	<20200618154444.GB18007@redhat.com>
	<20200618165006.GA103290@google.com>
	<20200618170952.GA18057@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05M0Xens019753
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 22 Jun 2020 04:47:18 -0400
Cc: dm-devel@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	agk@redhat.com, linux-doc@vger.kernel.org
Subject: Re: [dm-devel] New mode DM-Verity error handling
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gRGVhciBETS1WZXJpdHkgbWFpbnRhaW5lcnMuClRoYW5rIHlvdSBmb3IgeW91ciByZXBs
eS4KCkkgYWdyZWVkIHdpdGggeW91IHRoYXQgInRoZSBkZXZpY2Ugc2hvdWxkIGJlIHB1dCBpbiBh
IGZhaWxlZCBzdGF0ZSBhbmQgCmxlZnQgZm9yIGFkbWluIHJlY292ZXJ5IgpBcyBkZWFyIFNhbWkg
dG9sZCB1cywgV2hlbiBBbmRyb2lkIGRldmljZSBvY2N1cnJlZCBwYW5pYywgcmVzdGFydGluZyBh
bmQgCnRvIHNhdmUgdGhlIGxvZ3MgdG8gYm9vdGxvYWRlciBhbHNvIHJlY292ZXJ5IGxvZy4KT2Yg
Y291cnNlIFVzaW5nIHRoZSByZXN0YXJ0IG1vZGUgb24gc3lzdGVtcyB3aXRob3V0IGZpcm13YXJl
IHN1cHBvcnQgCndvbid0IG1ha2Ugc2Vuc2UuCkhvd2V2ZXIsIG9uIEFuZHJvaWQgZGV2aWNlcywg
cmVzdGFydCBvciBwYW5pYyBtb2RlIG1ha2VzIHNlbnNlLgoKSW4gYW5kcm9pZCwgdGhlIGJlaGF2
aW9yIGlzIGRpZmZlcmVudCBkZXBlbmQgb24gdGhlIGJpbmFyeSB0eXBlLgpoZXJlIGFyZSAzIHR5
cGUgbGlrZSB1c2VyIC8gdXNlcmRlYnVnIC8gZW5nIChlbmdpbmVlcmluZykuCgpXaGVuIGtlcm5l
bCBwYW5pYyBvY2N1cnMsIGl0IG9wZXJhdGVzIGFzIGZvbGxvd3MKIMKgKiBrZXJuZWwgcGFuaWMg
aW4gdXNlciBiaW5hcnkobG93KS0+IHJlc3RhcnQgbW9kZQogwqAqIGtlcm5lbCBwYW5pYyBpbiBl
bmcgYmluYXJ5KG1pZCkgLT4gdXBsb2FkIG1vZGUKCkl0J3MgYWN0dWFsbHkgYXQgdGhlIGRlYnVn
IGxldmVsLgpBbGwgdXNlcnMgYXJlIHNldCB0byBsb3csIGJ1dCBjaGFuZ2UgaXQgYnVpbGQgb3B0
aW9uIG9yIG90aGVycy4KYnV0IE1vc3QgdXNlcnMgZG8gbm90IGtub3cuCgpZb3UgbWlnaHQgdGhp
bmssICJXaHkgZG8geW91IG5lZWQgYSBwYW5pYyBpbnN0ZWFkIG9mIHJlYm9vdD8iCgpUbyBzdGFy
dCB3aXRoLCBJdCdzIGVhc3kgdG8gYW5hbHl6ZSB3aGF0IHRoZSBkZXZpY2UgaGFzIHByb2JsZW0u
CklmIHdlIHVzZSByZXN0YXJ0IG1vZGUsIGl0J3MgZGlmZmljdWx0IHRvIGFuYWx5emUgYmVjYXVz
ZSBkZXZpY2UgaXMgCnJlYm9vdGVkIHdpdGhvdXQgbG9nZ2luZy4obm90IHJlbWFpbiBsb2cpCkFu
ZCBJZiB1c2UgcGFuaWMgbW9kZSwgc2Ftc3VuZyB0YWtlcyBzbmFwc2hvdHMoc2F2ZSBsb2cgZXRj
KSB3aGVuIApvY2N1cnJlZCBwYW5pYy4oTWF5YmUgb3RoZXIgY29tcGFueSBvciBBbmRyb2lkIGFy
ZSBzYW1lKS4KU28gV2UgbG9vayBmb3IgYSBkZWJ1Z2dpbmcgbG9nIGFuZCB0aGUgYW5hbHl6ZSBr
aW5kIG9mIHByb2JsZW0gaW4gZGV2aWNlIAphcyB3ZWxsIGFzIGRtLXZlcml0eS4KSW4gdGhlIGRl
dmVsb3BtZW50IHN0YWdlLCBtb3N0IG9mIHRoZW0gYXJlIHVzZSBpbiBlbmcgbW9kZS4Kd2hlbiBw
YW5pYyBvY2N1cnMsIGl0IGdvZXMgdG8gdXBsb2FkIG1vZGUsIHNvIGl0IGlzIGNvbnZlbmllbnQg
dG8gCmFuYWx5emUgd2hldGhlciBpdCBpcyBIVyBwcm9ibGVtIC8gU1cgcHJvYmxlbS4KSW4gbW9z
dCBjYXNlcyBpdCB3YXMgYSBoYXJkd2FyZSBpc3N1ZS4gU2luY2Ugd2UgYXJlIGEgbWFudWZhY3R1
cmVyLCB0aGUgCkhXIHByb2JsZW0gaXMgYWxzbyBpbXBvcnRhbnQuCgpBbHNvLCB1c2VycyB1c2lu
ZyBBbmRyb2lkIGRldmljZXMgY2FuIHJlY29nbml6ZSB0aGF0IHRoZXJlIGlzIGEgcHJvYmxlbSAK
d2l0aCBteSBkZXZpY2UgdGhyb3VnaCBhIHJlYm9vdC4KVXNlcnMgZG9uJ3Qga25vdyB0aGUgZXhh
Y3QgcmVhc29uLCBidXQgdGhleSB0aGluayB0aGF0IHJlYm9vdGluZyBpcyB3cm9uZy4KQXMgbWVu
dGlvbmVkIGFib3ZlLCBpbiB1c2VyIG1vZGUsIHBhbmljIG9wZXJhdGVzIGluIHJlYm9vdCBtb2Rl
LgpUaGUgdXNlciBzZWVzIHRoYXQgZGV2aWNlIGlzIHJlYm9vdGluZyBhbmQgdGhpbmtzIHRoZXJl
IGlzIGEgcHJvYmxlbS4KVGhleSB1cGxvYWRzIFFuQSB0byBTYW1zdW5nIG1lbWJlcnMgQXBwIG9y
IHZpc2l0IHNlcnZpY2UgY2VudGVyIGZvciByZXBhaXIuClRoZW4sIGRldmVsb3BlcnMgbmVlZCB0
byBnZXQgdGhlIGxvZyB0aGUgZGV2aWNlIHVzZWQgYnkgdXNlcnMgdG8gY2hlY2sgCndoYXQgdGhl
IHByb2JsZW0gaXMuIFNvIFdlIGFyZSB1c2luZyBwYW5pYyB0byBnZXQgdGhlIGxvZy4KCldoYXQn
cyBtb3JlLCByZWJvb3QvcGFuaWMgbWF5IHNlZW0gd3JvbmcsIGJ1dCBmcm9tIGEgc2VjdXJpdHkg
CnBlcnNwZWN0aXZlLCBJIHRoaW5rIGl0J3MgcmVhbGx5IGltcG9ydGFudCB3aGVuIGxvb2tpbmcg
YXQgZG0tdmVyaXR5LgpPZiBjb3Vyc2UsIEkgdGhpbmsgdGhlIG1haW50YWluZXJzIGFscmVhZHkg
a25vdyBpdC4KVG8gdGhlIGltcG9ydGFudCBwYXJ0aXRpb24gb3IgQW5kcm9pZCBkZXZpY2VzIHN5
c3RlbSwgd2lsbCBiZSBwcm90ZWN0ZWQgCnVzaW5nIGRtLXZlcml0eS4KV2UgY2FuIG1ha2UgdGhl
IHBhcnRpdGlvbih3YW50IHRvIHByb3RlY3QpIGludG8gYSByZWFkLW9ubHkgcGFydGl0aW9uLCAK
Y29tcGFyZSB0aGUgZGlnZXN0LCBhbmQgY2hlY2sgd2hldGhlciB0aGVyZSBhcmUgYW55IHByb2Js
ZW1zLgpJZiBhIG1hbGljaW91cyB1c2VyIG9yIGhhY2tlciBjYW4gZGFtYWdlIHRoZSBzeXN0ZW0g
b3IgaW1wb3J0YW50IApwYXJ0aXRpb24gbWF5IGNoYW5nZSBzb21ldGhpbmcuCkF0IHRoaXMgdGlt
ZSwgd2UgY2FuIGRlZmVuZCBhZ2FpbnN0IGZ1cnRoZXIgaGFja2luZyBieSBnZW5lcmF0aW5nIGEg
CnBhbmljIG9yIHJlc3RhcnQuClRoaXMgd2lsbCBtYWtlIHRoZSBzZWN1cml0eSBmZWVsIHN0cm9u
Zy4gU28gcmVib290IG1vZGUgYW5kIHBhbmljIG1vZGUgCndpbGwgYmUgcmVxdWlyZWQuCgpXZSBo
YXZlIGxvbmcgZXhwbGFpbmVkIHdoeSB3ZSBuZWVkIGl0LgpUaHJvdWdoIHRoaXMsIFNhbXN1bmcg
bmVlZHMgYSBwYW5pYyBtb2RlLCBzbyBwbGVhc2UgcmVhZCBpdCBjYXJlZnVsbHkgCmFuZCBnaXZl
IGZlZWRiYWNrLgoKVGhhbmsgeW91IDpECkplb25naHllb24gTGVlCgoKT24gMTkvMDYvMjAyMCAw
MjowOSwgTWlrZSBTbml0emVyIHdyb3RlOgo+IE9uIFRodSwgSnVuIDE4IDIwMjAgYXQgMTI6NTBw
bSAtMDQwMCwKPiBTYW1pIFRvbHZhbmVuIDxzYW1pdG9sdmFuZW5AZ29vZ2xlLmNvbT4gd3JvdGU6
Cj4KPj4gT24gVGh1LCBKdW4gMTgsIDIwMjAgYXQgMTE6NDQ6NDVBTSAtMDQwMCwgTWlrZSBTbml0
emVyIHdyb3RlOgo+Pj4gSSBkbyBub3QgYWNjZXB0IHRoYXQgcGFuaWNpbmcgdGhlIHN5c3RlbSBi
ZWNhdXNlIG9mIHZlcml0eSBmYWlsdXJlIGlzCj4+PiByZWFzb25hYmxlLgo+Pj4KPj4+IEluIGZh
Y3QsIGV2ZW4gcmVib290aW5nICh2aWEgRE1fVkVSSVRZX01PREVfUkVTVEFSVCkgbG9va3MgdmVy
eSB3cm9uZy4KPj4+Cj4+PiBUaGUgZGV2aWNlIHNob3VsZCBiZSBwdXQgaW4gYSBmYWlsZWQgc3Rh
dGUgYW5kIGxlZnQgZm9yIGFkbWluIHJlY292ZXJ5Lgo+PiBUaGF0J3MgZXhhY3RseSBob3cgdGhl
IHJlc3RhcnQgbW9kZSB3b3JrcyBvbiBzb21lIEFuZHJvaWQgZGV2aWNlcy4gVGhlCj4+IGJvb3Rs
b2FkZXIgc2VlcyB0aGUgdmVyaWZpY2F0aW9uIGVycm9yIGFuZCBwdXRzIHRoZSBkZXZpY2UgaW4g
cmVjb3ZlcnkKPj4gbW9kZS4gVXNpbmcgdGhlIHJlc3RhcnQgbW9kZSBvbiBzeXN0ZW1zIHdpdGhv
dXQgZmlybXdhcmUgc3VwcG9ydCB3b24ndAo+PiBtYWtlIHNlbnNlLCBvYnZpb3VzbHkuCj4gT0ss
IHNvIEkgbmVlZCBmdXJ0aGVyIGp1c3RpZmljYXRpb24gZnJvbSBTYW1zdW5nIHdoeSB0aGV5IGFy
ZSBhc2tpbmcgZm9yCj4gdGhpcyBwYW5pYyBtb2RlLgo+Cj4gVGhhbmtzLAo+IE1pa2UKPgo+Cj4K
CgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3
dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

