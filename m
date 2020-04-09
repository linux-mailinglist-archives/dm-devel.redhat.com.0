Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id F11DE1A3120
	for <lists+dm-devel@lfdr.de>; Thu,  9 Apr 2020 10:44:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586421864;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=WrmvWX117NrcAoEZtty3KDqXPV4xq8FDCgo7WszfSCg=;
	b=ioHMyl9Abd35x42B1IacVeYZjkLEVxTnNeM2VnnE6RjarDAeALU5g5a72QjwS4rPzAot4q
	T1Z7nsCOO/PU9k4KhFVFXupBqTNgKbQTRD3fJTVUoO7Gv1+bAVddVGlC0WT7SzNCsPCBLN
	4vWSELX5GYQB5Bo4xLEVJb3cZP3klJ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-143-g3k3vOdvPtGPp8wj99qdRw-1; Thu, 09 Apr 2020 04:44:21 -0400
X-MC-Unique: g3k3vOdvPtGPp8wj99qdRw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 327EB18C35A0;
	Thu,  9 Apr 2020 08:44:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88A409DD76;
	Thu,  9 Apr 2020 08:44:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8957B18089CD;
	Thu,  9 Apr 2020 08:44:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0396ePbp004512 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 02:40:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5ECF92166B34; Thu,  9 Apr 2020 06:40:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D732166B31
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:40:23 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 15BB21017E41
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:40:23 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-83-4rP3JrPmNTWyIOZCjTCt3g-1; Thu, 09 Apr 2020 02:40:20 -0400
X-MC-Unique: 4rP3JrPmNTWyIOZCjTCt3g-1
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20200409064017epoutp027a194511cc59fe18e32d6b41d841e083~EE4HT6_pn1780717807epoutp02Z
	for <dm-devel@redhat.com>; Thu,  9 Apr 2020 06:40:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20200409064017epoutp027a194511cc59fe18e32d6b41d841e083~EE4HT6_pn1780717807epoutp02Z
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20200409064015epcas1p284d8a7e7300f7d8c4564c57d0fa7a3e8~EE4F_QXd_0424204242epcas1p2N;
	Thu,  9 Apr 2020 06:40:15 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.161]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 48yWjV2JzyzMqYkn;
	Thu,  9 Apr 2020 06:40:14 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
	58.BD.04658.E43CE8E5; Thu,  9 Apr 2020 15:40:14 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20200409064012epcas1p11be838e56ea23ea52019e03fabf5442f~EE4DSZJKS0214302143epcas1p1H;
	Thu,  9 Apr 2020 06:40:12 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200409064012epsmtrp238a5cdbcd8706e56b8daf1bd26b08643~EE4DRt1h50769107691epsmtrp2I;
	Thu,  9 Apr 2020 06:40:12 +0000 (GMT)
X-AuditID: b6c32a39-a81ff70000001232-7d-5e8ec34e02dd
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	00.6D.04158.C43CE8E5; Thu,  9 Apr 2020 15:40:12 +0900 (KST)
Received: from [10.253.105.163] (unknown [10.253.105.163]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20200409064012epsmtip2886c641577e888295928c8a664185f97~EE4DLu-i70744707447epsmtip2h;
	Thu,  9 Apr 2020 06:40:12 +0000 (GMT)
To: Sami Tolvanen <samitolvanen@google.com>
From: Sunwook Eom <speed.eom@samsung.com>
Message-ID: <4a4a914c-c020-4b45-7cba-5aed816f0545@samsung.com>
Date: Thu, 9 Apr 2020 15:40:07 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABCJKudWRmdyJAxjnTs+NiRJVnhDUQfzGO3sVKZNJoQ5Qi-aew@mail.gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNJsWRmVeSWpSXmKPExsWy7bCmga7f4b44g6UNAhbrTx1jttj7bjar
	xeVdc9gslq54y2rRtvEro0X//g1sDmweO2fdZfdYsKnU4/2+q2wenzfJBbBE5dhkpCampBYp
	pOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAO1WUihLzCkFCgUkFhcr
	6dvZFOWXlqQqZOQXl9gqpRak5BQYGhToFSfmFpfmpesl5+daGRoYGJkCVSbkZCxYPIGxoJ2j
	YtKfeSwNjJPYuhg5OSQETCSO7nnF2MXIxSEksINRouXUbiYI5xOjxNwLJ6Gcb4wSq+afY4dp
	6Z93gxkisZdR4kTnUqiq94wSL3atBqsSFnCSePCrFWyJiIC2xM2rfWAdzCBL/jxexQqSYBPQ
	lDjUc4wFxOYVsJPYs66HGcRmEVCRuHDlI1izqECExL2lB5khagQlTs58AlbPKRAosXP7I7A4
	s4C8RPPW2VC2uMStJ/PBLpIQOMMmceLfYaBlHECOi8TUUxkQLwhLvDq+BeodKYnP7/ZCQ6Na
	4sqJi0wQdo1E7/VbrBC2sURvzwVmkDHMQDev36UPEVaU2Pl7LiPEWj6Jd197oDbxSnS0CUGU
	KEu8PX6eBcKWlDj9dyrURA+JU0/us09gVJyF5LFZSJ6ZheSZWQiLFzCyrGIUSy0ozk1PLTYs
	MEWO7U2M4ISpZbmD8dg5n0OMAhyMSjy8Evt744RYE8uKK3MPMUpwMCuJ8Ho3AYV4UxIrq1KL
	8uOLSnNSiw8xmgLDfSKzlGhyPjCZ55XEG5oaGRsbW5iYmZuZGiuJ8069nhMnJJCeWJKanZpa
	kFoE08fEwSnVwFixcW5GJ1ul8fVPxRfct9hNYbr2b5lIYevadTPf1tpNXMvQr6PcdkaZhePr
	J0VxbdnjMR7M8zKC9xpdXCTcnRDo9uZzxTlOtwT+hC8JtrLe2xcfXzh7k1pBY7OzyWmLcyIH
	MgX2cQUXv6njmvpF6M6KF6cE7sRenD5DKtnzvfctJ7OZSaumfVNiKc5INNRiLipOBABdHL/U
	rgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFLMWRmVeSWpSXmKPExsWy7bCSvK7P4b44gxvHtS3WnzrGbLH33WxW
	i8u75rBZLF3xltWibeNXRov+/RvYHNg8ds66y+6xYFOpx/t9V9k8Pm+SC2CJ4rJJSc3JLEst
	0rdL4MpYsHgCY0E7R8WkP/NYGhgnsXUxcnJICJhI9M+7wdzFyMUhJLCbUWLfri+sEAlJiTdN
	lxm7GDmAbGGJw4eLIWreMkrcOH+aEaRGWMBJ4sGvVrBBIgLaEjev9oENYhbYwShx5N1CJoiO
	m4wSbzs/glWxCWhKHOo5xgJi8wrYSexZ18MMYrMIqEhcuAJRIyoQIdF69xYzRI2gxMmZT8Dq
	OQUCJXZufwQWZxYwk5i3+SGULS/RvHU2lC0ucevJfKYJjEKzkLTPQtIyC0nLLCQtCxhZVjFK
	phYU56bnFhsWGOWllusVJ+YWl+al6yXn525iBMeIltYOxhMn4g8xCnAwKvHwSuzvjRNiTSwr
	rsw9xCjBwawkwuvdBBTiTUmsrEotyo8vKs1JLT7EKM3BoiTOK59/LFJIID2xJDU7NbUgtQgm
	y8TBKdXAuGrjU12x/W5fatzd2G2+ROnoRF9d8nO1lt3/bXyvKud89f10MeGEk8bGy3d2yQfP
	Vixet+lba8ssEz+Rjyr+X1fYMZ3OOPG5vWbPXobSbSG2Fktzv3JHsm6z8spdclFpQ6NbvOOT
	QpOyxo22Kj+vsB85slhY+sem6MSYTI11ve0Nz//VzEmXUGIpzkg01GIuKk4EAAVcjQ+NAgAA
X-CMS-MailID: 20200409064012epcas1p11be838e56ea23ea52019e03fabf5442f
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82
References: <CGME20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82@epcas1p1.samsung.com>
	<317e0073-a6f7-4232-3b95-a4bc3ddbcdec@samsung.com>
	<CABCJKudWRmdyJAxjnTs+NiRJVnhDUQfzGO3sVKZNJoQ5Qi-aew@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0396ePbp004512
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 09 Apr 2020 04:43:58 -0400
Cc: device-mapper development <dm-devel@redhat.com>, sunwook5492@gmail.com,
	Mike Snitzer <snitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [dm-devel] [PATCH] dm verity fec: Don't add data_blocks to block
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

Ck9uIDIwLiA0LiA4LiDsmKTsoIQgMTI6NTUsIFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4gT24gTW9u
LCBBcHIgNiwgMjAyMCBhdCAxMTo1NCBQTSBTdW53b29rIEVvbSA8c3BlZWQuZW9tQHNhbXN1bmcu
Y29tPiB3cm90ZToKPj4gRXZlbiBpZiBibG9jayB0eXBlIGlzIG1ldGFkYXRhLAo+PiBibG9jayBp
biB2ZXJpdHlfZmVjX2RlY29kZSgpIGhhcyBhbHJlYWR5IHRoZSByaWdodCBibG9jayBudW1iZXIu
Cj4+IFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkIGRhdGFfYmxvY2tzIHRvIGJsb2NrLgo+IElz
IHRoaXMgYWxzbyB0cnVlIGlmIHRoZSBoYXNoZXMgYXJlIG9uIGEgc2VwYXJhdGUgYmxvY2sgZGV2
aWNlPwo+Cj4gVGhlIGlkZWEgaGVyZSBpcyB0aGF0IHRoZSBlcnJvciBjb3JyZWN0aW9uIGRhdGEg
d2FzIGNvbXB1dGVkIG92ZXIgYm90aAo+IGRhdGEgYW5kIGhhc2ggYmxvY2tzLCBhcyBpZiB0aGV5
IHdlcmUgY29uY2F0ZW5hdGVkLCBhbmQgd2Ugd2FudCB0bwo+IGNhbGN1bGF0ZSB0aGUgbG9naWNh
bCBibG9jayBudW1iZXIgYmFzZWQgb24gdGhhdC4gSSBhZ3JlZSB0aGF0IHRoZQo+IGNvZGUgZG9l
c24ndCBsb29rIHF1aXRlIHJpZ2h0IHRob3VnaC4gU2hvdWxkIHdlIHVzZSBzb21ldGhpbmcgbGlr
ZQo+IHRoaXMgaW5zdGVhZD8KPgo+ICAgICAgaWYgKHR5cGUgPT0gRE1fVkVSSVRZX0JMT0NLX1RZ
UEVfTUVUQURBVEEpCj4gICAgICAgICAgICAgIGJsb2NrID0gYmxvY2sgLSB2LT5oYXNoX3N0YXJ0
ICsgdi0+ZGF0YV9ibG9ja3M7Cj4KPiBTYW1pCj4KPgpZb3UncmUgcmlnaHQuIEkgbWlzc2VkIHRo
ZSBjYXNlIHRoYXQgaGFzaGVzIGFyZSBvbiBhIHNlcGFyYXRlIGJsb2NrIGRldmljZS4KCkFuZCwg
dGhlIGNvZGUgeW91IHdyb3RlIHNlZW1zIHRvIGJlIGNvcnJlY3QuCgpJZiB5b3UgZG9uJ3QgbWlu
ZCwgSSdsbCBzZW5kIGEgbmV3IHZlcnNpb24gb2YgdGhpcyBwYXRjaC4KClRoYW5rIHlvdSBmb3Ig
dGhlIHJldmlldy4KCgpTdW53b29rCgoKCgoKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0t
ZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWw=

