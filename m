Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9352E9DEA
	for <lists+dm-devel@lfdr.de>; Mon,  4 Jan 2021 20:05:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-KUlzvFG2OIWmGux-3iPYjw-1; Mon, 04 Jan 2021 14:05:32 -0500
X-MC-Unique: KUlzvFG2OIWmGux-3iPYjw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64A7D800D55;
	Mon,  4 Jan 2021 19:05:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE5476A8F9;
	Mon,  4 Jan 2021 19:05:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A338518087F6;
	Mon,  4 Jan 2021 19:05:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 104AmERi002649 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 4 Jan 2021 05:48:14 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 4E6902026D11; Mon,  4 Jan 2021 10:48:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4758C2026D48
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:48:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D68A4101A562
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:48:10 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-266-Z5dfH3iINySAZb2_ENIVYw-1; Mon, 04 Jan 2021 05:48:08 -0500
X-MC-Unique: Z5dfH3iINySAZb2_ENIVYw-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20210104104805epoutp031f2a9eff5c3de552e3de287b60f82628~XAbjYr7CK3260232602epoutp03w
	for <dm-devel@redhat.com>; Mon,  4 Jan 2021 10:48:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20210104104805epoutp031f2a9eff5c3de552e3de287b60f82628~XAbjYr7CK3260232602epoutp03w
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTP id
	20210104104804epcas5p1797005d1d4563f74e565f65a708d3b4c~XAbixXzMB2070620706epcas5p1B;
	Mon,  4 Jan 2021 10:48:04 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
	epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	69.EB.15682.462F2FF5; Mon,  4 Jan 2021 19:48:04 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20210104104249epcas5p458d1b5c39b5acfad4e7786eca5dd5c49~XAW9rwd611643816438epcas5p43;
	Mon,  4 Jan 2021 10:42:49 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20210104104249epsmtrp16448b254bd414e4929d2e7f1f2e25406~XAW9qpW7R1883718837epsmtrp1u;
	Mon,  4 Jan 2021 10:42:49 +0000 (GMT)
X-AuditID: b6c32a49-8d5ff70000013d42-01-5ff2f264abe2
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	5B.49.13470.921F2FF5; Mon,  4 Jan 2021 19:42:49 +0900 (KST)
Received: from localhost.localdomain (unknown [107.110.206.5]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20210104104246epsmtip137d6dfe517af1c170f3a4abb46bd8681~XAW6jBBw21626316263epsmtip1J;
	Mon,  4 Jan 2021 10:42:46 +0000 (GMT)
From: SelvaKumar S <selvakuma.s1@samsung.com>
To: linux-nvme@lists.infradead.org
Date: Mon,  4 Jan 2021 16:11:58 +0530
Message-Id: <20210104104159.74236-3-selvakuma.s1@samsung.com>
In-Reply-To: <20210104104159.74236-1-selvakuma.s1@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUxTVxzNfe/x+mAre6vILh8TqRsRxqfAdmecjkTdExfjXKJRYV3XvoCz
	1KblWxOaMQHLVgQ3ooVMgqAZLmJpQaywkEIliM20gFikUCPsQ7eVFSlT+Zjtw8z/zv2dc+45
	v5tL4YJSMpQ6JM9llXKxTEgGEB290TFxUrdblNjeEYIuOqpIVDvzBEfHyz0Y6v67zg91NdZg
	6MeLFgw9GJ/loUXNBIYsy3+RqMZ8B6DusXfQkKmeRGfPT/NQ5WgniS70L2GoumIEQx3PzuJo
	+LtGHF165CKQ0zXKQ4/+HSBRmX4OfBjMDA3vZK7qHDzmlwk9wQxZ85i2lhMkY2gqYa7Z1STz
	z/QYwbh+HiEZrbEFMIbBo8xs2xqmvKcS280/ELBJysoO5bPKhM2fB2QvmAcIhdYACj0NFj81
	0NYADfCnIJ0C1cNfYxoQQAnoawBecT0kvISAdgPY0PMxR3gA7F666ffCUW/r8+OIbgBvlt1d
	OcwCaHE7fHaSjoN3mtp8OIgWwsXWrwivCKftOLQ9dfO8xCp6Ixz39PuKEPTb0Hy59nkRiuLT
	H8BpTzSXFgHP2OZ9cn96M6y5PeFrwadfhwNnpnz34881pe11uPd+SJ/zh/PHJwnOvBVqDXqc
	w6vgw34jj8Oh8I+qshVcAH894c31YjWAWlcBh7fA212Lvj44HQ1bTQnc+E34/Y1LGJcbCL99
	NrVi5cPOH6Z8ckhHwRtX3uXG4XCm10RyYwb+Xn2Me6pqAO3WBXASrNW9tI3upW10/wc3ALwF
	hLAKVU4Wq0pVJMnZgniVOEeVJ8+KlxzJaQO+fxqzoxM4nDPxZoBRwAwghQuD+IW3ZkQCvlRc
	VMwqj4iUeTJWZQZhFCF8g9+Z6BQJ6CxxLnuYZRWs8gWLUf6hamxtIRGrvfVp8jb7uHp7pH7T
	6i3H9i6MvJcizFju2x+bFlsr07zf9Il2Qn9Q7sgPNLYml8Vm3l84vy7RnNAMectRyxv6ijKC
	v6xKk1aEpFaWvBVJb9uHi6ke/Keoeps9KT4kfGz9UandFhixS7Ike+XU6XT94IViSbpWEhak
	Hj/VPMdKFaNPM4aytx4+Hd6e8JEz/7MG7ZPc7cVrTJmSyLnLqQpjxXXjjg7dvUZrkcbkMKok
	v937Zunc9XIxddcScbBwcNefiZGTzfV2vsgTtzq0RChLp3r3fGHLCl6/J5lMmU/avcHgfHW/
	mKy7nyHqGZ3MLLeGPbY+6HqsKn0trW+jkFBli5NicKVK/B8zKowAFgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Rf0yMcRzH932e5557ujmersZXfnZSLuvS2Hxnfs0fPDcLs2Z+zHLy7DJd
	d+4pio2wqGuVO0Q/1t1OQjfJpZBIx6GTpLpKupCKreiSflglrmb677336/XZ+48PhYuqCR/q
	YHQMq4mWR4lJAVH6VDw/SNL3I3yZK3UpMjvTSZTh+oWjxHODGHr0PZuHyk16DN002zD0ubWf
	j8a0bRiyjX8jkd7aCNCjlqWoviyHRIb8Tj5KabpPousvfmNIl+TAUOmIAUcNF004KuzuJdDH
	3iY+6h6uItHZOwNg/UymvmEz8yDLyWfetN0hmPrXsYylIJlkivNOMg/fJZBMX2cLwfQ+dpBM
	2t0CwBS/Os70W+Yz556kYNuEuwWrD7BRB4+wmuC1+wSRo9YqQp1WDOIGjTZeAkjTAy3woCC9
	AubUPeNpgYAS0Q8BHLAP8CfBXHjLmUxOZi948/cX/qTUB2Dd6HvcDUg6CDbmWQh39qbFcOz2
	acIt4XQ/Dg1lZyeAF70Ktg6+mJgj6MXQWpSBaQFFCek1sHNQMjmwAGbWDU0Me9Brof5tG8+t
	iP4qpkQvdy2kPWFVZgfhrnE6AN7OFblr/O/lmZJs/DzwzJpiZf23sqZYRoAXgNmsmlMqlFyI
	OiSaPSrl5EouNlohjVApLWDi4YGS++BegUtqBRgFrABSuNhbGFfrChcJD8jjj7EaVbgmNorl
	rGAORYhnCWu1VeEiWiGPYQ+xrJrV/KMY5eGTgBn1bOq8SF6ZxT/JT3xhuaHw8M+7AVtk604V
	qjf6trdUD+VpHHbjyIxrP/N3yPSgff2u5p5xz0XHYhKnq9SGE+2nimpWsqG5zSayY4MiPlAQ
	9KTSdnpY3yhjcz58lbYaF6r3Dpfn9izG4kpUrnLFDN3lp5LllbrgpL7RCPuyndvXjCG/9HvN
	IobfJHQeveJ0pF/b5tjqPw+GNYVdveVzaU7RHpXM1xqTbL9RGTri0eDggrv2aPLfVJhncV2p
	S2zyitX7p5XGbx9/6enPSCMI+6tPRR2i5iHJXFOJIMA3mWyr2FCaKq2Zae72znueoquuYczP
	yR6lY+umrtGQb7VigouUhwTiGk7+B2Yy85BfAwAA
X-CMS-MailID: 20210104104249epcas5p458d1b5c39b5acfad4e7786eca5dd5c49
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210104104249epcas5p458d1b5c39b5acfad4e7786eca5dd5c49
References: <20210104104159.74236-1-selvakuma.s1@samsung.com>
	<CGME20210104104249epcas5p458d1b5c39b5acfad4e7786eca5dd5c49@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 104AmERi002649
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 04 Jan 2021 14:03:12 -0500
Cc: axboe@kernel.dk, damien.lemoal@wdc.com,
	SelvaKumar S <selvakuma.s1@samsung.com>, sagi@grimberg.me,
	linux-scsi@vger.kernel.org, selvajove@gmail.com,
	Johannes.Thumshirn@wdc.com, snitzer@redhat.com,
	linux-kernel@vger.kernel.org, nj.shetty@samsung.com,
	linux-block@vger.kernel.org, dm-devel@redhat.com,
	mpatocka@redhat.com, joshi.k@samsung.com,
	martin.petersen@oracle.com, kbusch@kernel.org,
	javier.gonz@samsung.com, hch@lst.de, bvanassche@acm.org
Subject: [dm-devel] [RFC PATCH v4 2/3] block: add simple copy support
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWRkIG5ldyBCTEtDT1BZIGlvY3RsIHRoYXQgb2ZmbG9hZHMgY29weWluZyBvZiBvbmUgb3IgbW9y
ZSBzb3VyY2VzCnJhbmdlcyB0byBhIGRlc3RpbmF0aW9uIGluIHRoZSBkZXZpY2UuIEFjY2VwdHMg
Y29weV9yYW5nZXMgdGhhdCBjb250YWlucwpkZXN0aW5hdGlvbiwgbm8gb2Ygc291cmNlcyBhbmQg
cG9pbnRlciB0byB0aGUgYXJyYXkgb2Ygc291cmNlCnJhbmdlcy4gRWFjaCByYW5nZV9lbnRyeSBj
b250YWlucyBzdGFydCBhbmQgbGVuZ3RoIG9mIHNvdXJjZQpyYW5nZXMgKGluIGJ5dGVzKS4KCklu
dHJvZHVjZSBSRVFfT1BfQ09QWSwgYSBuby1tZXJnZSBjb3B5IG9mZmxvYWQgb3BlcmF0aW9uLiBD
cmVhdGUKYmlvIHdpdGggY29udHJvbCBpbmZvcm1hdGlvbiBhcyBwYXlsb2FkIGFuZCBzdWJtaXQg
dG8gdGhlIGRldmljZS4KUkVRX09QX0NPUFkoMTkpIGlzIGEgd3JpdGUgb3AgYW5kIHRha2VzIHpv
bmVfd3JpdGVfbG9jayB3aGVuIHN1Ym1pdHRlZAp0byB6b25lZCBkZXZpY2UuCgpJZiB0aGUgZGV2
aWNlIGRvZXNuJ3Qgc3VwcG9ydCBjb3B5IG9yIGNvcHkgb2ZmbG9hZCBpcyBkaXNhYmxlZCwgdGhl
bgpjb3B5IGlzIGVtdWxhdGVkIGJ5IGFsbG9jYXRpbmcgbWVtb3J5IG9mIHRvdGFsIGNvcHkgc2l6
ZS4gVGhlIHNvdXJjZQpyYW5nZXMgYXJlIHJlYWQgaW50byBtZW1vcnkgYnkgY2hhaW5pbmcgYmlv
IGZvciBlYWNoIHNvdXJjZSByYW5nZXMgYW5kCnN1Ym1pdHRpbmcgdGhlbSBhc3luYyBhbmQgdGhl
IGxhc3QgYmlvIHdhaXRzIGZvciBjb21wbGV0aW9uLiBBZnRlciBkYXRhCmlzIHJlYWQsIGl0IGlz
IHdyaXR0ZW4gdG8gdGhlIGRlc3RpbmF0aW9uLgoKYmlvX21hcF9rZXJuKCkgaXMgdXNlZCB0byBh
bGxvY2F0ZSBiaW8gYW5kIGFkZCBwYWdlcyBvZiBjb3B5IGJ1ZmZlciB0bwpiaW8uIEFzIGJpby0+
YmlfcHJpdmF0ZSBhbmQgYmlvLT5iaV9lbmRfaW8gaXMgbmVlZGVkIGZvciBjaGFpbmluZyB0aGUK
YmlvIGFuZCBvdmVyIHdyaXR0ZW4sIGludmFsaWRhdGVfa2VybmVsX3ZtYXBfcmFuZ2UoKSBmb3Ig
cmVhZCBpcyBjYWxsZWQKaW4gdGhlIGNhbGxlci4KCkludHJvZHVjZSBxdWV1ZSBsaW1pdHMgZm9y
IHNpbXBsZSBjb3B5IGFuZCBvdGhlciBoZWxwZXIgZnVuY3Rpb25zLgpBZGQgZGV2aWNlIGxpbWl0
cyBhcyBzeXNmcyBlbnRyaWVzLgoJLSBjb3B5X29mZmxvYWQKCS0gbWF4X2NvcHlfc2VjdG9ycwoJ
LSBtYXhfY29weV9yYW5nZXNfc2VjdG9ycwoJLSBtYXhfY29weV9ucl9yYW5nZXMKCmNvcHlfb2Zm
bG9hZCg9IDApIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQuCm1heF9jb3B5X3NlY3RvcnMgPSAwIGlu
ZGljYXRlcyB0aGUgZGV2aWNlIGRvZXNuJ3Qgc3VwcG9ydCBuYXRpdmUgY29weS4KCk5hdGl2ZSBj
b3B5IG9mZmxvYWQgaXMgbm90IHN1cHBvcnRlZCBmb3Igc3RhY2tlZCBkZXZpY2VzIGFuZCBpcyBk
b25lIHZpYQpjb3B5IGVtdWxhdGlvbi4KClNpZ25lZC1vZmYtYnk6IFNlbHZhS3VtYXIgUyA8c2Vs
dmFrdW1hLnMxQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBLYW5jaGFuIEpvc2hpIDxqb3No
aS5rQHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBOaXRlc2ggU2hldHR5IDxuai5zaGV0dHlA
c2Ftc3VuZy5jb20+ClNpZ25lZC1vZmYtYnk6IEphdmllciBHb256w6FsZXogPGphdmllci5nb256
QHNhbXN1bmcuY29tPgotLS0KIGJsb2NrL2Jsay1jb3JlLmMgICAgICAgICAgfCAgOTQgKysrKysr
KysrKysrKystLQogYmxvY2svYmxrLWxpYi5jICAgICAgICAgICB8IDIyMyArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwogYmxvY2svYmxrLW1lcmdlLmMgICAgICAgICB8ICAg
MiArCiBibG9jay9ibGstc2V0dGluZ3MuYyAgICAgIHwgIDEwICsrCiBibG9jay9ibGstc3lzZnMu
YyAgICAgICAgIHwgIDUwICsrKysrKysrKwogYmxvY2svYmxrLXpvbmVkLmMgICAgICAgICB8ICAg
MSArCiBibG9jay9ib3VuY2UuYyAgICAgICAgICAgIHwgICAxICsKIGJsb2NrL2lvY3RsLmMgICAg
ICAgICAgICAgfCAgNDMgKysrKysrKysKIGluY2x1ZGUvbGludXgvYmlvLmggICAgICAgfCAgIDEg
KwogaW5jbHVkZS9saW51eC9ibGtfdHlwZXMuaCB8ICAxNSArKysKIGluY2x1ZGUvbGludXgvYmxr
ZGV2LmggICAgfCAgMTMgKysrCiBpbmNsdWRlL3VhcGkvbGludXgvZnMuaCAgIHwgIDEzICsrKwog
MTIgZmlsZXMgY2hhbmdlZCwgNDU4IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYmxvY2svYmxrLWNvcmUuYyBiL2Jsb2NrL2Jsay1jb3JlLmMKaW5kZXggOTZlNWZj
ZDdmMDcxLi40YTVjZDNmNTNjZDIgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2Jsay1jb3JlLmMKKysrIGIv
YmxvY2svYmxrLWNvcmUuYwpAQCAtNzE5LDYgKzcxOSwxNyBAQCBzdGF0aWMgbm9pbmxpbmUgaW50
IHNob3VsZF9mYWlsX2JpbyhzdHJ1Y3QgYmlvICpiaW8pCiB9CiBBTExPV19FUlJPUl9JTkpFQ1RJ
T04oc2hvdWxkX2ZhaWxfYmlvLCBFUlJOTyk7CiAKK3N0YXRpYyBpbmxpbmUgaW50IGJpb19jaGVj
a19jb3B5X2VvZChzdHJ1Y3QgYmlvICpiaW8sIHNlY3Rvcl90IHN0YXJ0LAorCQlzZWN0b3JfdCBu
cl9zZWN0b3JzLCBzZWN0b3JfdCBtYXhzZWN0b3IpCit7CisJaWYgKG5yX3NlY3RvcnMgJiYgbWF4
c2VjdG9yICYmCisJICAgIChucl9zZWN0b3JzID4gbWF4c2VjdG9yIHx8IHN0YXJ0ID4gbWF4c2Vj
dG9yIC0gbnJfc2VjdG9ycykpIHsKKwkJaGFuZGxlX2JhZF9zZWN0b3IoYmlvLCBtYXhzZWN0b3Ip
OworCQlyZXR1cm4gLUVJTzsKKwl9CisJcmV0dXJuIDA7Cit9CisKIC8qCiAgKiBDaGVjayB3aGV0
aGVyIHRoaXMgYmlvIGV4dGVuZHMgYmV5b25kIHRoZSBlbmQgb2YgdGhlIGRldmljZSBvciBwYXJ0
aXRpb24uCiAgKiBUaGlzIG1heSB3ZWxsIGhhcHBlbiAtIHRoZSBrZXJuZWwgY2FsbHMgYnJlYWQo
KSB3aXRob3V0IGNoZWNraW5nIHRoZSBzaXplIG9mCkBAIC03MzcsNiArNzQ4LDY1IEBAIHN0YXRp
YyBpbmxpbmUgaW50IGJpb19jaGVja19lb2Qoc3RydWN0IGJpbyAqYmlvLCBzZWN0b3JfdCBtYXhz
ZWN0b3IpCiAJcmV0dXJuIDA7CiB9CiAKKy8qCisgKiBDaGVjayBmb3IgY29weSBsaW1pdHMgYW5k
IHJlbWFwIHNvdXJjZSByYW5nZXMgaWYgbmVlZGVkLgorICovCitzdGF0aWMgaW50IGJsa19jaGVj
a19jb3B5KHN0cnVjdCBiaW8gKmJpbykKK3sKKwlzdHJ1Y3QgYmxvY2tfZGV2aWNlICpwID0gTlVM
TDsKKwlzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSA9IGJpby0+YmlfZGlzay0+cXVldWU7CisJc3Ry
dWN0IGJsa19jb3B5X3BheWxvYWQgKnBheWxvYWQ7CisJaW50IGksIG1heHNlY3Rvciwgc3RhcnRf
c2VjdCA9IDAsIHJldCA9IC1FSU87CisJdW5zaWduZWQgc2hvcnQgbnJfcmFuZ2U7CisKKwlyY3Vf
cmVhZF9sb2NrKCk7CisKKwlwID0gX19kaXNrX2dldF9wYXJ0KGJpby0+YmlfZGlzaywgYmlvLT5i
aV9wYXJ0bm8pOworCWlmICh1bmxpa2VseSghcCkpCisJCWdvdG8gb3V0OworCWlmICh1bmxpa2Vs
eShzaG91bGRfZmFpbF9yZXF1ZXN0KHAsIGJpby0+YmlfaXRlci5iaV9zaXplKSkpCisJCWdvdG8g
b3V0OworCWlmICh1bmxpa2VseShiaW9fY2hlY2tfcm8oYmlvLCBwKSkpCisJCWdvdG8gb3V0Owor
CisJbWF4c2VjdG9yID0gIGJkZXZfbnJfc2VjdG9ycyhwKTsKKwlzdGFydF9zZWN0ID0gcC0+YmRf
c3RhcnRfc2VjdDsKKworCXBheWxvYWQgPSBiaW9fZGF0YShiaW8pOworCW5yX3JhbmdlID0gcGF5
bG9hZC0+Y29weV9yYW5nZTsKKworCS8qIGNhbm5vdCBoYW5kbGUgY29weSBjcm9zc2luZyBucl9y
YW5nZXMgbGltaXQgKi8KKwlpZiAocGF5bG9hZC0+Y29weV9yYW5nZSA+IHEtPmxpbWl0cy5tYXhf
Y29weV9ucl9yYW5nZXMpCisJCWdvdG8gb3V0OworCisJLyogY2Fubm90IGhhbmRsZSBjb3B5IG1v
cmUgdGhhbiBjb3B5IGxpbWl0cyAqLworCWlmIChwYXlsb2FkLT5jb3B5X3NpemUgPiBxLT5saW1p
dHMubWF4X2NvcHlfc2VjdG9ycykKKwkJZ290byBvdXQ7CisKKwkvKiBjaGVjayBpZiBjb3B5IGxl
bmd0aCBjcm9zc2VzIGVvZCAqLworCWlmICh1bmxpa2VseShiaW9fY2hlY2tfY29weV9lb2QoYmlv
LCBiaW8tPmJpX2l0ZXIuYmlfc2VjdG9yLAorCQkJCQlwYXlsb2FkLT5jb3B5X3NpemUsIG1heHNl
Y3RvcikpKQorCQlnb3RvIG91dDsKKwliaW8tPmJpX2l0ZXIuYmlfc2VjdG9yICs9IHN0YXJ0X3Nl
Y3Q7CisKKwlmb3IgKGkgPSAwOyBpIDwgbnJfcmFuZ2U7IGkrKykgeworCQlpZiAodW5saWtlbHko
YmlvX2NoZWNrX2NvcHlfZW9kKGJpbywgcGF5bG9hZC0+cmFuZ2VbaV0uc3JjLAorCQkJCQlwYXls
b2FkLT5yYW5nZVtpXS5sZW4sIG1heHNlY3RvcikpKQorCQkJZ290byBvdXQ7CisKKwkJLyogc2lu
Z2xlIHNvdXJjZSByYW5nZSBsZW5ndGggbGltaXQgKi8KKwkJaWYgKHBheWxvYWQtPnJhbmdlW2ld
LnNyYyA+IHEtPmxpbWl0cy5tYXhfY29weV9yYW5nZV9zZWN0b3JzKQorCQkJZ290byBvdXQ7CisJ
CXBheWxvYWQtPnJhbmdlW2ldLnNyYyArPSBzdGFydF9zZWN0OworCX0KKworCWJpby0+YmlfcGFy
dG5vID0gMDsKKwlyZXQgPSAwOworb3V0OgorCXJjdV9yZWFkX3VubG9jaygpOworCXJldHVybiBy
ZXQ7Cit9CisKIC8qCiAgKiBSZW1hcCBibG9jayBuIG9mIHBhcnRpdGlvbiBwIHRvIGJsb2NrIG4r
c3RhcnQocCkgb2YgdGhlIGRpc2suCiAgKi8KQEAgLTgyNiwxNCArODk2LDE2IEBAIHN0YXRpYyBu
b2lubGluZV9mb3Jfc3RhY2sgYm9vbCBzdWJtaXRfYmlvX2NoZWNrcyhzdHJ1Y3QgYmlvICpiaW8p
CiAJaWYgKHNob3VsZF9mYWlsX2JpbyhiaW8pKQogCQlnb3RvIGVuZF9pbzsKIAotCWlmIChiaW8t
PmJpX3BhcnRubykgewotCQlpZiAodW5saWtlbHkoYmxrX3BhcnRpdGlvbl9yZW1hcChiaW8pKSkK
LQkJCWdvdG8gZW5kX2lvOwotCX0gZWxzZSB7Ci0JCWlmICh1bmxpa2VseShiaW9fY2hlY2tfcm8o
YmlvLCBiaW8tPmJpX2Rpc2stPnBhcnQwKSkpCi0JCQlnb3RvIGVuZF9pbzsKLQkJaWYgKHVubGlr
ZWx5KGJpb19jaGVja19lb2QoYmlvLCBnZXRfY2FwYWNpdHkoYmlvLT5iaV9kaXNrKSkpKQotCQkJ
Z290byBlbmRfaW87CisJaWYgKGxpa2VseSghb3BfaXNfY29weShiaW8tPmJpX29wZikpKSB7CisJ
CWlmIChiaW8tPmJpX3BhcnRubykgeworCQkJaWYgKHVubGlrZWx5KGJsa19wYXJ0aXRpb25fcmVt
YXAoYmlvKSkpCisJCQkJZ290byBlbmRfaW87CisJCX0gZWxzZSB7CisJCQlpZiAodW5saWtlbHko
YmlvX2NoZWNrX3JvKGJpbywgYmlvLT5iaV9kaXNrLT5wYXJ0MCkpKQorCQkJCWdvdG8gZW5kX2lv
OworCQkJaWYgKHVubGlrZWx5KGJpb19jaGVja19lb2QoYmlvLCBnZXRfY2FwYWNpdHkoYmlvLT5i
aV9kaXNrKSkpKQorCQkJCWdvdG8gZW5kX2lvOworCQl9CiAJfQogCiAJLyoKQEAgLTg1Nyw2ICs5
MjksMTIgQEAgc3RhdGljIG5vaW5saW5lX2Zvcl9zdGFjayBib29sIHN1Ym1pdF9iaW9fY2hlY2tz
KHN0cnVjdCBiaW8gKmJpbykKIAkJaWYgKCFibGtfcXVldWVfZGlzY2FyZChxKSkKIAkJCWdvdG8g
bm90X3N1cHBvcnRlZDsKIAkJYnJlYWs7CisJY2FzZSBSRVFfT1BfQ09QWToKKwkJaWYgKCFibGtf
cXVldWVfY29weShxKSkKKwkJCWdvdG8gbm90X3N1cHBvcnRlZDsKKwkJaWYgKHVubGlrZWx5KGJs
a19jaGVja19jb3B5KGJpbykpKQorCQkJZ290byBlbmRfaW87CisJCWJyZWFrOwogCWNhc2UgUkVR
X09QX1NFQ1VSRV9FUkFTRToKIAkJaWYgKCFibGtfcXVldWVfc2VjdXJlX2VyYXNlKHEpKQogCQkJ
Z290byBub3Rfc3VwcG9ydGVkOwpkaWZmIC0tZ2l0IGEvYmxvY2svYmxrLWxpYi5jIGIvYmxvY2sv
YmxrLWxpYi5jCmluZGV4IDc1MmY5YzcyMjA2Mi4uNGMwZjEyZTJlZDdjIDEwMDY0NAotLS0gYS9i
bG9jay9ibGstbGliLmMKKysrIGIvYmxvY2svYmxrLWxpYi5jCkBAIC0xNTAsNiArMTUwLDIyOSBA
QCBpbnQgYmxrZGV2X2lzc3VlX2Rpc2NhcmQoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgc2Vj
dG9yX3Qgc2VjdG9yLAogfQogRVhQT1JUX1NZTUJPTChibGtkZXZfaXNzdWVfZGlzY2FyZCk7CiAK
K2ludCBibGtfY29weV9vZmZsb2FkKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHN0cnVjdCBi
bGtfY29weV9wYXlsb2FkICpwYXlsb2FkLAorCQlzZWN0b3JfdCBkZXN0LCBnZnBfdCBnZnBfbWFz
aykKK3sKKwlzdHJ1Y3QgYmlvICpiaW87CisJaW50IHJldCwgdG90YWxfc2l6ZTsKKworCWJpbyA9
IGJpb19hbGxvYyhnZnBfbWFzaywgMSk7CisJYmlvLT5iaV9pdGVyLmJpX3NlY3RvciA9IGRlc3Q7
CisJYmlvLT5iaV9vcGYgPSBSRVFfT1BfQ09QWSB8IFJFUV9OT01FUkdFOworCWJpb19zZXRfZGV2
KGJpbywgYmRldik7CisKKwl0b3RhbF9zaXplID0gc3RydWN0X3NpemUocGF5bG9hZCwgcmFuZ2Us
IHBheWxvYWQtPmNvcHlfcmFuZ2UpOworCXJldCA9IGJpb19hZGRfcGFnZShiaW8sIHZpcnRfdG9f
cGFnZShwYXlsb2FkKSwgdG90YWxfc2l6ZSwKKwkJCQkJICAgb2Zmc2V0X2luX3BhZ2UocGF5bG9h
ZCkpOworCWlmIChyZXQgIT0gdG90YWxfc2l6ZSkgeworCQlyZXQgPSAtRU5PTUVNOworCQliaW9f
cHV0KGJpbyk7CisJCWdvdG8gZXJyOworCX0KKworCXJldCA9IHN1Ym1pdF9iaW9fd2FpdChiaW8p
OworZXJyOgorCWJpb19wdXQoYmlvKTsKKwlyZXR1cm4gcmV0OworCit9CisKK2ludCBibGtfcmVh
ZF90b19idWYoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgc3RydWN0IGJsa19jb3B5X3BheWxv
YWQgKnBheWxvYWQsCisJCWdmcF90IGdmcF9tYXNrLCB2b2lkICoqYnVmX3ApCit7CisJc3RydWN0
IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9xdWV1ZShiZGV2KTsKKwlzdHJ1Y3QgYmlvICpi
aW8sICpwYXJlbnQgPSBOVUxMOworCXZvaWQgKmJ1ZiA9IE5VTEw7CisJYm9vbCBpc192bWFsbG9j
OworCWludCBpLCBucl9zcmNzLCBjb3B5X2xlbiwgcmV0LCBjdXJfc2l6ZSwgdF9sZW4gPSAwOwor
CisJbnJfc3JjcyA9IHBheWxvYWQtPmNvcHlfcmFuZ2U7CisJY29weV9sZW4gPSBwYXlsb2FkLT5j
b3B5X3NpemUgPDwgU0VDVE9SX1NISUZUOworCisJYnVmID0ga3ZtYWxsb2MoY29weV9sZW4sIGdm
cF9tYXNrKTsKKwlpZiAoIWJ1ZikKKwkJcmV0dXJuIC1FTk9NRU07CisJaXNfdm1hbGxvYyA9IGlz
X3ZtYWxsb2NfYWRkcihidWYpOworCisJZm9yIChpID0gMDsgaSA8IG5yX3NyY3M7IGkrKykgewor
CQljdXJfc2l6ZSA9IHBheWxvYWQtPnJhbmdlW2ldLmxlbiA8PCBTRUNUT1JfU0hJRlQ7CisKKwkJ
YmlvID0gYmlvX21hcF9rZXJuKHEsIGJ1ZiArIHRfbGVuLCBjdXJfc2l6ZSwgZ2ZwX21hc2spOwor
CQlpZiAoSVNfRVJSKGJpbykpIHsKKwkJCXJldCA9IFBUUl9FUlIoYmlvKTsKKwkJCWdvdG8gb3V0
OworCQl9CisKKwkJYmlvLT5iaV9pdGVyLmJpX3NlY3RvciA9IHBheWxvYWQtPnJhbmdlW2ldLnNy
YzsKKwkJYmlvLT5iaV9vcGYgPSBSRVFfT1BfUkVBRDsKKwkJYmlvX3NldF9kZXYoYmlvLCBiZGV2
KTsKKwkJYmlvLT5iaV9lbmRfaW8gPSBOVUxMOworCQliaW8tPmJpX3ByaXZhdGUgPSBOVUxMOwor
CisJCWlmIChwYXJlbnQpIHsKKwkJCWJpb19jaGFpbihwYXJlbnQsIGJpbyk7CisJCQlzdWJtaXRf
YmlvKHBhcmVudCk7CisJCX0KKworCQlwYXJlbnQgPSBiaW87CisJCXRfbGVuICs9IGN1cl9zaXpl
OworCX0KKworCXJldCA9IHN1Ym1pdF9iaW9fd2FpdChiaW8pOworCWJpb19wdXQoYmlvKTsKKwlp
ZiAoaXNfdm1hbGxvYykKKwkJaW52YWxpZGF0ZV9rZXJuZWxfdm1hcF9yYW5nZShidWYsIGNvcHlf
bGVuKTsKKwlpZiAocmV0KQorCQlnb3RvIG91dDsKKworCSpidWZfcCA9IGJ1ZjsKKwlyZXR1cm4g
MDsKK291dDoKKwlrdmZyZWUoYnVmKTsKKwlyZXR1cm4gcmV0OworfQorCitpbnQgYmxrX3dyaXRl
X2Zyb21fYnVmKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIHZvaWQgKmJ1Ziwgc2VjdG9yX3Qg
ZGVzdCwKKwkJaW50IGNvcHlfbGVuLCBnZnBfdCBnZnBfbWFzaykKK3sKKwlzdHJ1Y3QgcmVxdWVz
dF9xdWV1ZSAqcSA9IGJkZXZfZ2V0X3F1ZXVlKGJkZXYpOworCXN0cnVjdCBiaW8gKmJpbzsKKwlp
bnQgcmV0OworCisJYmlvID0gYmlvX21hcF9rZXJuKHEsIGJ1ZiwgY29weV9sZW4sIGdmcF9tYXNr
KTsKKwlpZiAoSVNfRVJSKGJpbykpIHsKKwkJcmV0ID0gUFRSX0VSUihiaW8pOworCQlnb3RvIG91
dDsKKwl9CisJYmlvX3NldF9kZXYoYmlvLCBiZGV2KTsKKwliaW8tPmJpX29wZiA9IFJFUV9PUF9X
UklURTsKKwliaW8tPmJpX2l0ZXIuYmlfc2VjdG9yID0gZGVzdDsKKworCWJpby0+YmlfZW5kX2lv
ID0gTlVMTDsKKwlyZXQgPSBzdWJtaXRfYmlvX3dhaXQoYmlvKTsKKwliaW9fcHV0KGJpbyk7Citv
dXQ6CisJcmV0dXJuIHJldDsKK30KKworaW50IGJsa19wcmVwYXJlX3BheWxvYWQoc3RydWN0IGJs
b2NrX2RldmljZSAqYmRldiwgaW50IG5yX3NyY3MsIHN0cnVjdCByYW5nZV9lbnRyeSAqcmxpc3Qs
CisJCWdmcF90IGdmcF9tYXNrLCBzdHJ1Y3QgYmxrX2NvcHlfcGF5bG9hZCAqKnBheWxvYWRfcCkK
K3sKKworCXN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxID0gYmRldl9nZXRfcXVldWUoYmRldik7CisJ
c3RydWN0IGJsa19jb3B5X3BheWxvYWQgKnBheWxvYWQ7CisJc2VjdG9yX3QgYnNfbWFzazsKKwlz
ZWN0b3JfdCBzcmNfc2VjdHMsIGxlbiA9IDAsIHRvdGFsX2xlbiA9IDA7CisJaW50IGksIHJldCwg
dG90YWxfc2l6ZTsKKworCWlmICghcSkKKwkJcmV0dXJuIC1FTlhJTzsKKworCWlmICghbnJfc3Jj
cykKKwkJcmV0dXJuIC1FSU5WQUw7CisKKwlpZiAoYmRldl9yZWFkX29ubHkoYmRldikpCisJCXJl
dHVybiAtRVBFUk07CisKKwlic19tYXNrID0gKGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGJkZXYp
ID4+IDkpIC0gMTsKKworCXRvdGFsX3NpemUgPSBzdHJ1Y3Rfc2l6ZShwYXlsb2FkLCByYW5nZSwg
bnJfc3Jjcyk7CisJcGF5bG9hZCA9IGttYWxsb2ModG90YWxfc2l6ZSwgZ2ZwX21hc2spOworCWlm
ICghcGF5bG9hZCkKKwkJcmV0dXJuIC1FTk9NRU07CisKKwlmb3IgKGkgPSAwOyBpIDwgbnJfc3Jj
czsgaSsrKSB7CisJCS8qICBjb3B5IHBheWxvYWQgcHJvdmlkZWQgYXJlIGluIGJ5dGVzICovCisJ
CXNyY19zZWN0cyA9IHJsaXN0W2ldLnNyYzsKKwkJaWYgKHNyY19zZWN0cyAmIGJzX21hc2spIHsK
KwkJCXJldCA9ICAtRUlOVkFMOworCQkJZ290byBlcnI7CisJCX0KKwkJc3JjX3NlY3RzID0gc3Jj
X3NlY3RzID4+IFNFQ1RPUl9TSElGVDsKKworCQlpZiAobGVuICYgYnNfbWFzaykgeworCQkJcmV0
ID0gLUVJTlZBTDsKKwkJCWdvdG8gZXJyOworCQl9CisKKwkJbGVuID0gcmxpc3RbaV0ubGVuID4+
IFNFQ1RPUl9TSElGVDsKKworCQl0b3RhbF9sZW4gKz0gbGVuOworCisJCVdBUk5fT05fT05DRSgo
c3JjX3NlY3RzIDw8IDkpID4gVUlOVF9NQVgpOworCisJCXBheWxvYWQtPnJhbmdlW2ldLnNyYyA9
IHNyY19zZWN0czsKKwkJcGF5bG9hZC0+cmFuZ2VbaV0ubGVuID0gbGVuOworCX0KKworCS8qIHN0
b3JpbmcgIyBvZiBzb3VyY2UgcmFuZ2VzICovCisJcGF5bG9hZC0+Y29weV9yYW5nZSA9IGk7CisJ
Lyogc3RvcmluZyBjb3B5IGxlbiBzbyBmYXIgKi8KKwlwYXlsb2FkLT5jb3B5X3NpemUgPSB0b3Rh
bF9sZW47CisKKwkqcGF5bG9hZF9wID0gcGF5bG9hZDsKKwlyZXR1cm4gMDsKK2VycjoKKwlrZnJl
ZShwYXlsb2FkKTsKKwlyZXR1cm4gcmV0OworfQorCisvKioKKyAqIGJsa2Rldl9pc3N1ZV9jb3B5
IC0gcXVldWUgYSBjb3B5CisgKiBAYmRldjogICAgICAgc291cmNlIGJsb2NrIGRldmljZQorICog
QG5yX3NyY3M6CW51bWJlciBvZiBzb3VyY2UgcmFuZ2VzIHRvIGNvcHkKKyAqIEBybGlzdDoJYXJy
YXkgb2Ygc291cmNlIHJhbmdlcyAoaW4gYnl0ZXMpCisgKiBAZGVzdF9iZGV2OglkZXN0aW5hdGlv
biBibG9jayBkZXZpY2UKKyAqIEBkZXN0OglkZXN0aW5hdGlvbiAoaW4gYnl0ZXMpCisgKiBAZ2Zw
X21hc2s6ICAgbWVtb3J5IGFsbG9jYXRpb24gZmxhZ3MgKGZvciBiaW9fYWxsb2MpCisgKgorICog
RGVzY3JpcHRpb246CisgKglDb3B5IGFycmF5IG9mIHNvdXJjZSByYW5nZXMgZnJvbSBzb3VyY2Ug
YmxvY2sgZGV2aWNlIHRvCisgKglkZXN0aW5hdGlvbiBibG9jayBkZXZjaWUuCisgKi8KKworCitp
bnQgYmxrZGV2X2lzc3VlX2NvcHkoc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiwgaW50IG5yX3Ny
Y3MsCisJCXN0cnVjdCByYW5nZV9lbnRyeSAqc3JjX3JsaXN0LCBzdHJ1Y3QgYmxvY2tfZGV2aWNl
ICpkZXN0X2JkZXYsCisJCXNlY3Rvcl90IGRlc3QsIGdmcF90IGdmcF9tYXNrKQoreworCXN0cnVj
dCByZXF1ZXN0X3F1ZXVlICpxID0gYmRldl9nZXRfcXVldWUoYmRldik7CisJc3RydWN0IGJsa19j
b3B5X3BheWxvYWQgKnBheWxvYWQ7CisJc2VjdG9yX3QgYnNfbWFzaywgZGVzdF9zZWN0OworCXZv
aWQgKmJ1ZiA9IE5VTEw7CisJaW50IHJldDsKKworCXJldCA9IGJsa19wcmVwYXJlX3BheWxvYWQo
YmRldiwgbnJfc3Jjcywgc3JjX3JsaXN0LCBnZnBfbWFzaywgJnBheWxvYWQpOworCWlmIChyZXQp
CisJCXJldHVybiByZXQ7CisKKwlic19tYXNrID0gKGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGRl
c3RfYmRldikgPj4gOSkgLSAxOworCWlmIChkZXN0ICYgYnNfbWFzaykgeworCQlyZXR1cm4gLUVJ
TlZBTDsKKwkJZ290byBvdXQ7CisJfQorCWRlc3Rfc2VjdCA9IGRlc3QgPj4gU0VDVE9SX1NISUZU
OworCisJaWYgKGJkZXYgPT0gZGVzdF9iZGV2ICYmIHEtPmxpbWl0cy5jb3B5X29mZmxvYWQpIHsK
KwkJcmV0ID0gYmxrX2NvcHlfb2ZmbG9hZChiZGV2LCBwYXlsb2FkLCBkZXN0X3NlY3QsIGdmcF9t
YXNrKTsKKwkJaWYgKHJldCkKKwkJCWdvdG8gb3V0OworCX0gZWxzZSB7CisJCXJldCA9IGJsa19y
ZWFkX3RvX2J1ZihiZGV2LCBwYXlsb2FkLCBnZnBfbWFzaywgJmJ1Zik7CisJCWlmIChyZXQpCisJ
CQlnb3RvIG91dDsKKwkJcmV0ID0gYmxrX3dyaXRlX2Zyb21fYnVmKGRlc3RfYmRldiwgYnVmLCBk
ZXN0X3NlY3QsCisJCQkJcGF5bG9hZC0+Y29weV9zaXplIDw8IFNFQ1RPUl9TSElGVCwgZ2ZwX21h
c2spOworCX0KKworCWlmIChidWYpCisJCWt2ZnJlZShidWYpOworb3V0OgorCWt2ZnJlZShwYXls
b2FkKTsKKwlyZXR1cm4gcmV0OworfQorRVhQT1JUX1NZTUJPTChibGtkZXZfaXNzdWVfY29weSk7
CisKIC8qKgogICogX19ibGtkZXZfaXNzdWVfd3JpdGVfc2FtZSAtIGdlbmVyYXRlIG51bWJlciBv
ZiBiaW9zIHdpdGggc2FtZSBwYWdlCiAgKiBAYmRldjoJdGFyZ2V0IGJsb2NrZGV2CmRpZmYgLS1n
aXQgYS9ibG9jay9ibGstbWVyZ2UuYyBiL2Jsb2NrL2Jsay1tZXJnZS5jCmluZGV4IDgwODc2OGY2
YjE3NC4uNGUwNGYyNGUxM2MxIDEwMDY0NAotLS0gYS9ibG9jay9ibGstbWVyZ2UuYworKysgYi9i
bG9jay9ibGstbWVyZ2UuYwpAQCAtMzA5LDYgKzMwOSw4IEBAIHZvaWQgX19ibGtfcXVldWVfc3Bs
aXQoc3RydWN0IGJpbyAqKmJpbywgdW5zaWduZWQgaW50ICpucl9zZWdzKQogCXN0cnVjdCBiaW8g
KnNwbGl0ID0gTlVMTDsKIAogCXN3aXRjaCAoYmlvX29wKCpiaW8pKSB7CisJY2FzZSBSRVFfT1Bf
Q09QWToKKwkJCWJyZWFrOwogCWNhc2UgUkVRX09QX0RJU0NBUkQ6CiAJY2FzZSBSRVFfT1BfU0VD
VVJFX0VSQVNFOgogCQlzcGxpdCA9IGJsa19iaW9fZGlzY2FyZF9zcGxpdChxLCAqYmlvLCAmcS0+
YmlvX3NwbGl0LCBucl9zZWdzKTsKZGlmZiAtLWdpdCBhL2Jsb2NrL2Jsay1zZXR0aW5ncy5jIGIv
YmxvY2svYmxrLXNldHRpbmdzLmMKaW5kZXggNDM5OTBiMWQxNDhiLi45M2MxNWJhNDVhNjkgMTAw
NjQ0Ci0tLSBhL2Jsb2NrL2Jsay1zZXR0aW5ncy5jCisrKyBiL2Jsb2NrL2Jsay1zZXR0aW5ncy5j
CkBAIC02MCw2ICs2MCwxMCBAQCB2b2lkIGJsa19zZXRfZGVmYXVsdF9saW1pdHMoc3RydWN0IHF1
ZXVlX2xpbWl0cyAqbGltKQogCWxpbS0+aW9fb3B0ID0gMDsKIAlsaW0tPm1pc2FsaWduZWQgPSAw
OwogCWxpbS0+em9uZWQgPSBCTEtfWk9ORURfTk9ORTsKKwlsaW0tPmNvcHlfb2ZmbG9hZCA9IDA7
CisJbGltLT5tYXhfY29weV9zZWN0b3JzID0gMDsKKwlsaW0tPm1heF9jb3B5X25yX3JhbmdlcyA9
IDA7CisJbGltLT5tYXhfY29weV9yYW5nZV9zZWN0b3JzID0gMDsKIH0KIEVYUE9SVF9TWU1CT0wo
YmxrX3NldF9kZWZhdWx0X2xpbWl0cyk7CiAKQEAgLTU2NSw2ICs1NjksMTIgQEAgaW50IGJsa19z
dGFja19saW1pdHMoc3RydWN0IHF1ZXVlX2xpbWl0cyAqdCwgc3RydWN0IHF1ZXVlX2xpbWl0cyAq
YiwKIAlpZiAoYi0+Y2h1bmtfc2VjdG9ycykKIAkJdC0+Y2h1bmtfc2VjdG9ycyA9IGdjZCh0LT5j
aHVua19zZWN0b3JzLCBiLT5jaHVua19zZWN0b3JzKTsKIAorCS8qIHNpbXBsZSBjb3B5IG5vdCBz
dXBwb3J0ZWQgaW4gc3RhY2tlZCBkZXZpY2VzICovCisJdC0+Y29weV9vZmZsb2FkID0gMDsKKwl0
LT5tYXhfY29weV9zZWN0b3JzID0gMDsKKwl0LT5tYXhfY29weV9yYW5nZV9zZWN0b3JzID0gMDsK
Kwl0LT5tYXhfY29weV9ucl9yYW5nZXMgPSAwOworCiAJLyogUGh5c2ljYWwgYmxvY2sgc2l6ZSBh
IG11bHRpcGxlIG9mIHRoZSBsb2dpY2FsIGJsb2NrIHNpemU/ICovCiAJaWYgKHQtPnBoeXNpY2Fs
X2Jsb2NrX3NpemUgJiAodC0+bG9naWNhbF9ibG9ja19zaXplIC0gMSkpIHsKIAkJdC0+cGh5c2lj
YWxfYmxvY2tfc2l6ZSA9IHQtPmxvZ2ljYWxfYmxvY2tfc2l6ZTsKZGlmZiAtLWdpdCBhL2Jsb2Nr
L2Jsay1zeXNmcy5jIGIvYmxvY2svYmxrLXN5c2ZzLmMKaW5kZXggYjUxM2YxNjgzYWYwLi41MWIz
NWE4MzExZDkgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2Jsay1zeXNmcy5jCisrKyBiL2Jsb2NrL2Jsay1z
eXNmcy5jCkBAIC0xNjYsNiArMTY2LDQ3IEBAIHN0YXRpYyBzc2l6ZV90IHF1ZXVlX2Rpc2NhcmRf
Z3JhbnVsYXJpdHlfc2hvdyhzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSwgY2hhciAqcGFnCiAJcmV0
dXJuIHF1ZXVlX3Zhcl9zaG93KHEtPmxpbWl0cy5kaXNjYXJkX2dyYW51bGFyaXR5LCBwYWdlKTsK
IH0KIAorc3RhdGljIHNzaXplX3QgcXVldWVfY29weV9vZmZsb2FkX3Nob3coc3RydWN0IHJlcXVl
c3RfcXVldWUgKnEsIGNoYXIgKnBhZ2UpCit7CisJcmV0dXJuIHF1ZXVlX3Zhcl9zaG93KHEtPmxp
bWl0cy5jb3B5X29mZmxvYWQsIHBhZ2UpOworfQorCitzdGF0aWMgc3NpemVfdCBxdWV1ZV9jb3B5
X29mZmxvYWRfc3RvcmUoc3RydWN0IHJlcXVlc3RfcXVldWUgKnEsCisJCQkJICAgICAgIGNvbnN0
IGNoYXIgKnBhZ2UsIHNpemVfdCBjb3VudCkKK3sKKwl1bnNpZ25lZCBsb25nIGNvcHlfb2ZmbG9h
ZDsKKwlzc2l6ZV90IHJldCA9IHF1ZXVlX3Zhcl9zdG9yZSgmY29weV9vZmZsb2FkLCBwYWdlLCBj
b3VudCk7CisKKwlpZiAocmV0IDwgMCkKKwkJcmV0dXJuIHJldDsKKworCWlmIChjb3B5X29mZmxv
YWQgPCAwIHx8IGNvcHlfb2ZmbG9hZCA+IDEpCisJCXJldHVybiAtRUlOVkFMOworCisJaWYgKHEt
PmxpbWl0cy5tYXhfY29weV9zZWN0b3JzID09IDAgJiYgY29weV9vZmZsb2FkID09IDEpCisJCXJl
dHVybiAtRUlOVkFMOworCisJcS0+bGltaXRzLmNvcHlfb2ZmbG9hZCA9IGNvcHlfb2ZmbG9hZDsK
KwlyZXR1cm4gcmV0OworfQorCitzdGF0aWMgc3NpemVfdCBxdWV1ZV9tYXhfY29weV9zZWN0b3Jz
X3Nob3coc3RydWN0IHJlcXVlc3RfcXVldWUgKnEsIGNoYXIgKnBhZ2UpCit7CisJcmV0dXJuIHF1
ZXVlX3Zhcl9zaG93KHEtPmxpbWl0cy5tYXhfY29weV9zZWN0b3JzLCBwYWdlKTsKK30KKworc3Rh
dGljIHNzaXplX3QgcXVldWVfbWF4X2NvcHlfcmFuZ2Vfc2VjdG9yc19zaG93KHN0cnVjdCByZXF1
ZXN0X3F1ZXVlICpxLAorCQljaGFyICpwYWdlKQoreworCXJldHVybiBxdWV1ZV92YXJfc2hvdyhx
LT5saW1pdHMubWF4X2NvcHlfcmFuZ2Vfc2VjdG9ycywgcGFnZSk7Cit9CisKK3N0YXRpYyBzc2l6
ZV90IHF1ZXVlX21heF9jb3B5X25yX3Jhbmdlc19zaG93KHN0cnVjdCByZXF1ZXN0X3F1ZXVlICpx
LAorCQljaGFyICpwYWdlKQoreworCXJldHVybiBxdWV1ZV92YXJfc2hvdyhxLT5saW1pdHMubWF4
X2NvcHlfbnJfcmFuZ2VzLCBwYWdlKTsKK30KKwogc3RhdGljIHNzaXplX3QgcXVldWVfZGlzY2Fy
ZF9tYXhfaHdfc2hvdyhzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSwgY2hhciAqcGFnZSkKIHsKIApA
QCAtNTkxLDYgKzYzMiwxMSBAQCBRVUVVRV9ST19FTlRSWShxdWV1ZV9ucl96b25lcywgIm5yX3pv
bmVzIik7CiBRVUVVRV9ST19FTlRSWShxdWV1ZV9tYXhfb3Blbl96b25lcywgIm1heF9vcGVuX3pv
bmVzIik7CiBRVUVVRV9ST19FTlRSWShxdWV1ZV9tYXhfYWN0aXZlX3pvbmVzLCAibWF4X2FjdGl2
ZV96b25lcyIpOwogCitRVUVVRV9SV19FTlRSWShxdWV1ZV9jb3B5X29mZmxvYWQsICJjb3B5X29m
ZmxvYWQiKTsKK1FVRVVFX1JPX0VOVFJZKHF1ZXVlX21heF9jb3B5X3NlY3RvcnMsICJtYXhfY29w
eV9zZWN0b3JzIik7CitRVUVVRV9ST19FTlRSWShxdWV1ZV9tYXhfY29weV9yYW5nZV9zZWN0b3Jz
LCAibWF4X2NvcHlfcmFuZ2Vfc2VjdG9ycyIpOworUVVFVUVfUk9fRU5UUlkocXVldWVfbWF4X2Nv
cHlfbnJfcmFuZ2VzLCAibWF4X2NvcHlfbnJfcmFuZ2VzIik7CisKIFFVRVVFX1JXX0VOVFJZKHF1
ZXVlX25vbWVyZ2VzLCAibm9tZXJnZXMiKTsKIFFVRVVFX1JXX0VOVFJZKHF1ZXVlX3JxX2FmZmlu
aXR5LCAicnFfYWZmaW5pdHkiKTsKIFFVRVVFX1JXX0VOVFJZKHF1ZXVlX3BvbGwsICJpb19wb2xs
Iik7CkBAIC02MzYsNiArNjgyLDEwIEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpxdWV1ZV9h
dHRyc1tdID0gewogCSZxdWV1ZV9kaXNjYXJkX21heF9lbnRyeS5hdHRyLAogCSZxdWV1ZV9kaXNj
YXJkX21heF9od19lbnRyeS5hdHRyLAogCSZxdWV1ZV9kaXNjYXJkX3plcm9lc19kYXRhX2VudHJ5
LmF0dHIsCisJJnF1ZXVlX2NvcHlfb2ZmbG9hZF9lbnRyeS5hdHRyLAorCSZxdWV1ZV9tYXhfY29w
eV9zZWN0b3JzX2VudHJ5LmF0dHIsCisJJnF1ZXVlX21heF9jb3B5X3JhbmdlX3NlY3RvcnNfZW50
cnkuYXR0ciwKKwkmcXVldWVfbWF4X2NvcHlfbnJfcmFuZ2VzX2VudHJ5LmF0dHIsCiAJJnF1ZXVl
X3dyaXRlX3NhbWVfbWF4X2VudHJ5LmF0dHIsCiAJJnF1ZXVlX3dyaXRlX3plcm9lc19tYXhfZW50
cnkuYXR0ciwKIAkmcXVldWVfem9uZV9hcHBlbmRfbWF4X2VudHJ5LmF0dHIsCmRpZmYgLS1naXQg
YS9ibG9jay9ibGstem9uZWQuYyBiL2Jsb2NrL2Jsay16b25lZC5jCmluZGV4IDdhNjhiNmU0MzAw
Yy4uMDIwNjkxNzhkNTFlIDEwMDY0NAotLS0gYS9ibG9jay9ibGstem9uZWQuYworKysgYi9ibG9j
ay9ibGstem9uZWQuYwpAQCAtNzUsNiArNzUsNyBAQCBib29sIGJsa19yZXFfbmVlZHNfem9uZV93
cml0ZV9sb2NrKHN0cnVjdCByZXF1ZXN0ICpycSkKIAljYXNlIFJFUV9PUF9XUklURV9aRVJPRVM6
CiAJY2FzZSBSRVFfT1BfV1JJVEVfU0FNRToKIAljYXNlIFJFUV9PUF9XUklURToKKwljYXNlIFJF
UV9PUF9DT1BZOgogCQlyZXR1cm4gYmxrX3JxX3pvbmVfaXNfc2VxKHJxKTsKIAlkZWZhdWx0Ogog
CQlyZXR1cm4gZmFsc2U7CmRpZmYgLS1naXQgYS9ibG9jay9ib3VuY2UuYyBiL2Jsb2NrL2JvdW5j
ZS5jCmluZGV4IGQzZjUxYWNkNmUzYi4uNWUwNTJhZmU4NjkxIDEwMDY0NAotLS0gYS9ibG9jay9i
b3VuY2UuYworKysgYi9ibG9jay9ib3VuY2UuYwpAQCAtMjU0LDYgKzI1NCw3IEBAIHN0YXRpYyBz
dHJ1Y3QgYmlvICpib3VuY2VfY2xvbmVfYmlvKHN0cnVjdCBiaW8gKmJpb19zcmMsIGdmcF90IGdm
cF9tYXNrLAogCWJpby0+YmlfaXRlci5iaV9zaXplCT0gYmlvX3NyYy0+YmlfaXRlci5iaV9zaXpl
OwogCiAJc3dpdGNoIChiaW9fb3AoYmlvKSkgeworCWNhc2UgUkVRX09QX0NPUFk6CiAJY2FzZSBS
RVFfT1BfRElTQ0FSRDoKIAljYXNlIFJFUV9PUF9TRUNVUkVfRVJBU0U6CiAJY2FzZSBSRVFfT1Bf
V1JJVEVfWkVST0VTOgpkaWZmIC0tZ2l0IGEvYmxvY2svaW9jdGwuYyBiL2Jsb2NrL2lvY3RsLmMK
aW5kZXggZDYxZDY1MjA3OGY0Li5kNTBiNmFiZTI4ODMgMTAwNjQ0Ci0tLSBhL2Jsb2NrL2lvY3Rs
LmMKKysrIGIvYmxvY2svaW9jdGwuYwpAQCAtMTMzLDYgKzEzMyw0NyBAQCBzdGF0aWMgaW50IGJs
a19pb2N0bF9kaXNjYXJkKHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwK
IAkJCQkgICAgR0ZQX0tFUk5FTCwgZmxhZ3MpOwogfQogCitzdGF0aWMgaW50IGJsa19pb2N0bF9j
b3B5KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGZtb2RlX3QgbW9kZSwKKwkJdW5zaWduZWQg
bG9uZyBhcmcpCit7CisJc3RydWN0IGNvcHlfcmFuZ2UgY3JhbmdlOworCXN0cnVjdCByYW5nZV9l
bnRyeSAqcmxpc3Q7CisJc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9xdWV1ZShi
ZGV2KTsKKwlzZWN0b3JfdCBkZXN0OworCWludCByZXQ7CisKKwlpZiAoIShtb2RlICYgRk1PREVf
V1JJVEUpKQorCQlyZXR1cm4gLUVCQURGOworCisJaWYgKCFibGtfcXVldWVfY29weShxKSkKKwkJ
cmV0dXJuIC1FT1BOT1RTVVBQOworCisJaWYgKGNvcHlfZnJvbV91c2VyKCZjcmFuZ2UsICh2b2lk
IF9fdXNlciAqKWFyZywgc2l6ZW9mKGNyYW5nZSkpKQorCQlyZXR1cm4gLUVGQVVMVDsKKworCWlm
IChjcmFuZ2UuZGVzdCAmICgoMSA8PCBTRUNUT1JfU0hJRlQpIC0gMSkpCisJCXJldHVybiAtRUZB
VUxUOworCWRlc3QgPSBjcmFuZ2UuZGVzdDsKKworCXJsaXN0ID0ga21hbGxvY19hcnJheShjcmFu
Z2UubnJfcmFuZ2UsIHNpemVvZigqcmxpc3QpLAorCQkJR0ZQX0tFUk5FTCk7CisKKwlpZiAoIXJs
aXN0KQorCQlyZXR1cm4gLUVOT01FTTsKKworCWlmIChjb3B5X2Zyb21fdXNlcihybGlzdCwgKHZv
aWQgX191c2VyICopY3JhbmdlLnJhbmdlX2xpc3QsCisJCQkJc2l6ZW9mKCpybGlzdCkgKiBjcmFu
Z2UubnJfcmFuZ2UpKSB7CisJCXJldCA9IC1FRkFVTFQ7CisJCWdvdG8gb3V0OworCX0KKworCXJl
dCA9IGJsa2Rldl9pc3N1ZV9jb3B5KGJkZXYsIGNyYW5nZS5ucl9yYW5nZSwgcmxpc3QsIGJkZXYs
IGRlc3QsCisJCQlHRlBfS0VSTkVMKTsKK291dDoKKwlrZnJlZShybGlzdCk7CisJcmV0dXJuIHJl
dDsKK30KKwogc3RhdGljIGludCBibGtfaW9jdGxfemVyb291dChzdHJ1Y3QgYmxvY2tfZGV2aWNl
ICpiZGV2LCBmbW9kZV90IG1vZGUsCiAJCXVuc2lnbmVkIGxvbmcgYXJnKQogewpAQCAtNDU4LDYg
KzQ5OSw4IEBAIHN0YXRpYyBpbnQgYmxrZGV2X2NvbW1vbl9pb2N0bChzdHJ1Y3QgYmxvY2tfZGV2
aWNlICpiZGV2LCBmbW9kZV90IG1vZGUsCiAJY2FzZSBCTEtTRUNESVNDQVJEOgogCQlyZXR1cm4g
YmxrX2lvY3RsX2Rpc2NhcmQoYmRldiwgbW9kZSwgYXJnLAogCQkJCUJMS0RFVl9ESVNDQVJEX1NF
Q1VSRSk7CisJY2FzZSBCTEtDT1BZOgorCQlyZXR1cm4gYmxrX2lvY3RsX2NvcHkoYmRldiwgbW9k
ZSwgYXJnKTsKIAljYXNlIEJMS1pFUk9PVVQ6CiAJCXJldHVybiBibGtfaW9jdGxfemVyb291dChi
ZGV2LCBtb2RlLCBhcmcpOwogCWNhc2UgQkxLUkVQT1JUWk9ORToKZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvYmlvLmggYi9pbmNsdWRlL2xpbnV4L2Jpby5oCmluZGV4IDFlZGRhNjE0ZjdjZS4u
MTY0MzEzYmRmYjM1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Jpby5oCisrKyBiL2luY2x1
ZGUvbGludXgvYmlvLmgKQEAgLTcxLDYgKzcxLDcgQEAgc3RhdGljIGlubGluZSBib29sIGJpb19o
YXNfZGF0YShzdHJ1Y3QgYmlvICpiaW8pCiBzdGF0aWMgaW5saW5lIGJvb2wgYmlvX25vX2FkdmFu
Y2VfaXRlcihjb25zdCBzdHJ1Y3QgYmlvICpiaW8pCiB7CiAJcmV0dXJuIGJpb19vcChiaW8pID09
IFJFUV9PUF9ESVNDQVJEIHx8CisJICAgICAgIGJpb19vcChiaW8pID09IFJFUV9PUF9DT1BZIHx8
CiAJICAgICAgIGJpb19vcChiaW8pID09IFJFUV9PUF9TRUNVUkVfRVJBU0UgfHwKIAkgICAgICAg
YmlvX29wKGJpbykgPT0gUkVRX09QX1dSSVRFX1NBTUUgfHwKIAkgICAgICAgYmlvX29wKGJpbykg
PT0gUkVRX09QX1dSSVRFX1pFUk9FUzsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYmxrX3R5
cGVzLmggYi9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oCmluZGV4IDg2NmY3NDI2MWIzYi4uZDRk
MTFlOWZmODE0IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2Jsa190eXBlcy5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvYmxrX3R5cGVzLmgKQEAgLTM4MCw2ICszODAsOCBAQCBlbnVtIHJlcV9vcGYg
ewogCVJFUV9PUF9aT05FX1JFU0VUCT0gMTUsCiAJLyogcmVzZXQgYWxsIHRoZSB6b25lIHByZXNl
bnQgb24gdGhlIGRldmljZSAqLwogCVJFUV9PUF9aT05FX1JFU0VUX0FMTAk9IDE3LAorCS8qIGNv
cHkgcmFuZ2VzIHdpdGhpbiBkZXZpY2UgKi8KKwlSRVFfT1BfQ09QWQkJPSAxOSwKIAogCS8qIFND
U0kgcGFzc3Rocm91Z2ggdXNpbmcgc3RydWN0IHNjc2lfcmVxdWVzdCAqLwogCVJFUV9PUF9TQ1NJ
X0lOCQk9IDMyLApAQCAtNTA2LDYgKzUwOCwxMSBAQCBzdGF0aWMgaW5saW5lIGJvb2wgb3BfaXNf
ZGlzY2FyZCh1bnNpZ25lZCBpbnQgb3ApCiAJcmV0dXJuIChvcCAmIFJFUV9PUF9NQVNLKSA9PSBS
RVFfT1BfRElTQ0FSRDsKIH0KIAorc3RhdGljIGlubGluZSBib29sIG9wX2lzX2NvcHkodW5zaWdu
ZWQgaW50IG9wKQoreworCXJldHVybiAob3AgJiBSRVFfT1BfTUFTSykgPT0gUkVRX09QX0NPUFk7
Cit9CisKIC8qCiAgKiBDaGVjayBpZiBhIGJpbyBvciByZXF1ZXN0IG9wZXJhdGlvbiBpcyBhIHpv
bmUgbWFuYWdlbWVudCBvcGVyYXRpb24sIHdpdGgKICAqIHRoZSBleGNlcHRpb24gb2YgUkVRX09Q
X1pPTkVfUkVTRVRfQUxMIHdoaWNoIGlzIHRyZWF0ZWQgYXMgYSBzcGVjaWFsIGNhc2UKQEAgLTU2
NSw0ICs1NzIsMTIgQEAgc3RydWN0IGJsa19ycV9zdGF0IHsKIAl1NjQgYmF0Y2g7CiB9OwogCitz
dHJ1Y3QgYmxrX2NvcHlfcGF5bG9hZCB7CisJc2VjdG9yX3QJZGVzdDsKKwlpbnQJCWNvcHlfcmFu
Z2U7CisJaW50CQljb3B5X3NpemU7CisJaW50CQllcnI7CisJc3RydWN0CXJhbmdlX2VudHJ5CXJh
bmdlW107Cit9OworCiAjZW5kaWYgLyogX19MSU5VWF9CTEtfVFlQRVNfSCAqLwpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9ibGtkZXYuaCBiL2luY2x1ZGUvbGludXgvYmxrZGV2LmgKaW5kZXgg
ODFmOWU3YmVjMTZjLi40YzdlODYxZTU3ZTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvYmxr
ZGV2LmgKKysrIGIvaW5jbHVkZS9saW51eC9ibGtkZXYuaApAQCAtMzQwLDEwICszNDAsMTQgQEAg
c3RydWN0IHF1ZXVlX2xpbWl0cyB7CiAJdW5zaWduZWQgaW50CQltYXhfem9uZV9hcHBlbmRfc2Vj
dG9yczsKIAl1bnNpZ25lZCBpbnQJCWRpc2NhcmRfZ3JhbnVsYXJpdHk7CiAJdW5zaWduZWQgaW50
CQlkaXNjYXJkX2FsaWdubWVudDsKKwl1bnNpZ25lZCBpbnQJCWNvcHlfb2ZmbG9hZDsKKwl1bnNp
Z25lZCBpbnQJCW1heF9jb3B5X3NlY3RvcnM7CiAKIAl1bnNpZ25lZCBzaG9ydAkJbWF4X3NlZ21l
bnRzOwogCXVuc2lnbmVkIHNob3J0CQltYXhfaW50ZWdyaXR5X3NlZ21lbnRzOwogCXVuc2lnbmVk
IHNob3J0CQltYXhfZGlzY2FyZF9zZWdtZW50czsKKwl1bnNpZ25lZCBzaG9ydAkJbWF4X2NvcHlf
cmFuZ2Vfc2VjdG9yczsKKwl1bnNpZ25lZCBzaG9ydAkJbWF4X2NvcHlfbnJfcmFuZ2VzOwogCiAJ
dW5zaWduZWQgY2hhcgkJbWlzYWxpZ25lZDsKIAl1bnNpZ25lZCBjaGFyCQlkaXNjYXJkX21pc2Fs
aWduZWQ7CkBAIC02MjUsNiArNjI5LDcgQEAgc3RydWN0IHJlcXVlc3RfcXVldWUgewogI2RlZmlu
ZSBRVUVVRV9GTEFHX1JRX0FMTE9DX1RJTUUgMjcJLyogcmVjb3JkIHJxLT5hbGxvY190aW1lX25z
ICovCiAjZGVmaW5lIFFVRVVFX0ZMQUdfSENUWF9BQ1RJVkUJMjgJLyogYXQgbGVhc3Qgb25lIGJs
ay1tcSBoY3R4IGlzIGFjdGl2ZSAqLwogI2RlZmluZSBRVUVVRV9GTEFHX05PV0FJVCAgICAgICAy
OQkvKiBkZXZpY2Ugc3VwcG9ydHMgTk9XQUlUICovCisjZGVmaW5lIFFVRVVFX0ZMQUdfQ09QWQkJ
MzAJLyogc3VwcG9ydHMgY29weSAqLwogCiAjZGVmaW5lIFFVRVVFX0ZMQUdfTVFfREVGQVVMVAko
KDEgPDwgUVVFVUVfRkxBR19JT19TVEFUKSB8CQlcCiAJCQkJICgxIDw8IFFVRVVFX0ZMQUdfU0FN
RV9DT01QKSB8CQlcCkBAIC02NDcsNiArNjUyLDcgQEAgYm9vbCBibGtfcXVldWVfZmxhZ190ZXN0
X2FuZF9zZXQodW5zaWduZWQgaW50IGZsYWcsIHN0cnVjdCByZXF1ZXN0X3F1ZXVlICpxKTsKICNk
ZWZpbmUgYmxrX3F1ZXVlX2lvX3N0YXQocSkJdGVzdF9iaXQoUVVFVUVfRkxBR19JT19TVEFULCAm
KHEpLT5xdWV1ZV9mbGFncykKICNkZWZpbmUgYmxrX3F1ZXVlX2FkZF9yYW5kb20ocSkJdGVzdF9i
aXQoUVVFVUVfRkxBR19BRERfUkFORE9NLCAmKHEpLT5xdWV1ZV9mbGFncykKICNkZWZpbmUgYmxr
X3F1ZXVlX2Rpc2NhcmQocSkJdGVzdF9iaXQoUVVFVUVfRkxBR19ESVNDQVJELCAmKHEpLT5xdWV1
ZV9mbGFncykKKyNkZWZpbmUgYmxrX3F1ZXVlX2NvcHkocSkJdGVzdF9iaXQoUVVFVUVfRkxBR19D
T1BZLCAmKHEpLT5xdWV1ZV9mbGFncykKICNkZWZpbmUgYmxrX3F1ZXVlX3pvbmVfcmVzZXRhbGwo
cSkJXAogCXRlc3RfYml0KFFVRVVFX0ZMQUdfWk9ORV9SRVNFVEFMTCwgJihxKS0+cXVldWVfZmxh
Z3MpCiAjZGVmaW5lIGJsa19xdWV1ZV9zZWN1cmVfZXJhc2UocSkgXApAQCAtMTA2MSw2ICsxMDY3
LDkgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBpbnQgYmxrX3F1ZXVlX2dldF9tYXhfc2VjdG9y
cyhzdHJ1Y3QgcmVxdWVzdF9xdWV1ZSAqcSwKIAkJcmV0dXJuIG1pbihxLT5saW1pdHMubWF4X2Rp
c2NhcmRfc2VjdG9ycywKIAkJCSAgIFVJTlRfTUFYID4+IFNFQ1RPUl9TSElGVCk7CiAKKwlpZiAo
dW5saWtlbHkob3AgPT0gUkVRX09QX0NPUFkpKQorCQlyZXR1cm4gcS0+bGltaXRzLm1heF9jb3B5
X3NlY3RvcnM7CisKIAlpZiAodW5saWtlbHkob3AgPT0gUkVRX09QX1dSSVRFX1NBTUUpKQogCQly
ZXR1cm4gcS0+bGltaXRzLm1heF93cml0ZV9zYW1lX3NlY3RvcnM7CiAKQEAgLTEzMzUsNiArMTM0
NCwxMCBAQCBleHRlcm4gaW50IF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoc3RydWN0IGJsb2NrX2Rl
dmljZSAqYmRldiwgc2VjdG9yX3Qgc2VjdG9yLAogCQlzZWN0b3JfdCBucl9zZWN0cywgZ2ZwX3Qg
Z2ZwX21hc2ssIGludCBmbGFncywKIAkJc3RydWN0IGJpbyAqKmJpb3ApOwogCitleHRlcm4gaW50
IGJsa2Rldl9pc3N1ZV9jb3B5KHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYsIGludCBucl9zcmNz
LAorCQlzdHJ1Y3QgcmFuZ2VfZW50cnkgKnNyY19ybGlzdCwgc3RydWN0IGJsb2NrX2RldmljZSAq
ZGVzdF9iZGV2LAorCQlzZWN0b3JfdCBkZXN0LCBnZnBfdCBnZnBfbWFzayk7CisKICNkZWZpbmUg
QkxLREVWX1pFUk9fTk9VTk1BUAkoMSA8PCAwKSAgLyogZG8gbm90IGZyZWUgYmxvY2tzICovCiAj
ZGVmaW5lIEJMS0RFVl9aRVJPX05PRkFMTEJBQ0sJKDEgPDwgMSkgIC8qIGRvbid0IHdyaXRlIGV4
cGxpY2l0IHplcm9lcyAqLwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvZnMuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC9mcy5oCmluZGV4IGY0NGViMGEwNGFmZC4uNWNhZGIxNzYzMTdh
IDEwMDY0NAotLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvZnMuaAorKysgYi9pbmNsdWRlL3VhcGkv
bGludXgvZnMuaApAQCAtNjQsNiArNjQsMTggQEAgc3RydWN0IGZzdHJpbV9yYW5nZSB7CiAJX191
NjQgbWlubGVuOwogfTsKIAorc3RydWN0IHJhbmdlX2VudHJ5IHsKKwlfX3U2NCBzcmM7CisJX191
NjQgbGVuOworfTsKKworc3RydWN0IGNvcHlfcmFuZ2UgeworCV9fdTY0IGRlc3Q7CisJX191NjQg
bnJfcmFuZ2U7CisJX191NjQgcmFuZ2VfbGlzdDsKKwlfX3U2NCByc3ZkOworfTsKKwogLyogZXh0
ZW50LXNhbWUgKGRlZHVwZSkgaW9jdGxzOyB0aGVzZSBNVVNUIG1hdGNoIHRoZSBidHJmcyBpb2N0
bCBkZWZpbml0aW9ucyAqLwogI2RlZmluZSBGSUxFX0RFRFVQRV9SQU5HRV9TQU1FCQkwCiAjZGVm
aW5lIEZJTEVfREVEVVBFX1JBTkdFX0RJRkZFUlMJMQpAQCAtMTg0LDYgKzE5Niw3IEBAIHN0cnVj
dCBmc3hhdHRyIHsKICNkZWZpbmUgQkxLU0VDRElTQ0FSRCBfSU8oMHgxMiwxMjUpCiAjZGVmaW5l
IEJMS1JPVEFUSU9OQUwgX0lPKDB4MTIsMTI2KQogI2RlZmluZSBCTEtaRVJPT1VUIF9JTygweDEy
LDEyNykKKyNkZWZpbmUgQkxLQ09QWSBfSU9XUigweDEyLCAxMjgsIHN0cnVjdCBjb3B5X3Jhbmdl
KQogLyoKICAqIEEganVtcCBoZXJlOiAxMzAtMTMxIGFyZSByZXNlcnZlZCBmb3Igem9uZWQgYmxv
Y2sgZGV2aWNlcwogICogKHNlZSB1YXBpL2xpbnV4L2Jsa3pvbmVkLmgpCi0tIAoyLjI1LjEKCgot
LQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5y
ZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

