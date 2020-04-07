Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id BE3991A0F50
	for <lists+dm-devel@lfdr.de>; Tue,  7 Apr 2020 16:34:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586270070;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=oUUVUEyFxrBqED5oX5SQt4+cdi/WFzIS+8eTqNe71gw=;
	b=chndpinp1zJOG64Q3glQCvYYAQvnMM96StZar5LK54moPZ2e3SC2H7A/xjsKCPN3+92HHy
	sv7mEJ2vc/H9jk8hMLF5+ytE/yIPbA2CJ07iVluqxuNyh7Uije59FyrshioQ2iTTT51mUD
	j0fPC484sGVj+HMSWvUhElL4phSGUHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-COFdTE1fMcmG7hisVs4DCA-1; Tue, 07 Apr 2020 10:34:28 -0400
X-MC-Unique: COFdTE1fMcmG7hisVs4DCA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87E8C1926DA2;
	Tue,  7 Apr 2020 14:34:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5723B60BE1;
	Tue,  7 Apr 2020 14:34:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DCE8B18089C8;
	Tue,  7 Apr 2020 14:34:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03770GOS015164 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 7 Apr 2020 03:00:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7D9D3D74CD; Tue,  7 Apr 2020 07:00:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 687E2D1EA5
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 07:00:14 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F3127101A55A
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 07:00:13 +0000 (UTC)
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-97-qcbz5YUEPHuxsM35ADKc8g-1; Tue, 07 Apr 2020 03:00:11 -0400
X-MC-Unique: qcbz5YUEPHuxsM35ADKc8g-1
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id
	20200407065342epoutp02b782436cd5cddf0f13acc356cf8eaeda~DdxRWY62l1001110011epoutp02s
	for <dm-devel@redhat.com>; Tue,  7 Apr 2020 06:53:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
	20200407065342epoutp02b782436cd5cddf0f13acc356cf8eaeda~DdxRWY62l1001110011epoutp02s
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTP id
	20200407065342epcas1p1850b81d4d79a42181466be7717710a72~DdxRLtG-N1071510715epcas1p1k;
	Tue,  7 Apr 2020 06:53:42 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.163]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 48xJ5w6dFszMqYkk;
	Tue,  7 Apr 2020 06:53:40 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
	epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	F8.CD.04744.4732C8E5; Tue,  7 Apr 2020 15:53:40 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82~DdxOq9kmZ1177111771epcas1p1W;
	Tue,  7 Apr 2020 06:53:40 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200407065340epsmtrp2fd6b44677cbbdd43f51ab5891ce1972a~DdxOqB1UI2992929929epsmtrp2P;
	Tue,  7 Apr 2020 06:53:40 +0000 (GMT)
X-AuditID: b6c32a38-26bff70000001288-00-5e8c2374195e
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	6C.02.04158.3732C8E5; Tue,  7 Apr 2020 15:53:40 +0900 (KST)
Received: from [10.253.105.163] (unknown [10.253.105.163]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20200407065339epsmtip26053ab6019e61953f3103c48aef31168~DdxOggBwS1741817418epsmtip2Z;
	Tue,  7 Apr 2020 06:53:39 +0000 (GMT)
From: Sunwook Eom <speed.eom@samsung.com>
To: agk@redhat.com
Message-ID: <317e0073-a6f7-4232-3b95-a4bc3ddbcdec@samsung.com>
Date: Tue, 7 Apr 2020 15:53:35 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprIJsWRmVeSWpSXmKPExsWy7bCmgW6Jck+cwYQtWhbrTx1jttj7bjar
	xeVdc9gs2jZ+ZbTo37+BzYHVY+esu+we7/ddZfP4vEkugDkqxyYjNTEltUghNS85PyUzL91W
	yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
	I7+4xFYptSAlp8DQoECvODG3uDQvXS85P9fK0MDAyBSoMiEnY+6ErSwF5+Qq1r9czd7A2CXV
	xcjJISFgIvF2zi62LkYuDiGBHYwSXS9fQDmfGCUa/j1khXC+MUps75vEBNNyo2MRVGIvo8SD
	G3OZIJz3jBL9i/eygFSxCWhKHOo5BmYLC9hJbL3/kRHEFhEQkpg+twfMZhZIkujsegY2lReo
	5v77l8wgNouAisSPBe/ZQWxRgQiJe0sPMkPUCEqcnPmEBaJXXqJ562xmCFtc4taT+WBHSAis
	YJN4sxuiQULAReLF9r9QZwtLvDq+hR3ClpL4/G4vG4RdLXHlxEWomhqJ3uu3WCFsY4nengtA
	cziAFmhKrN+lDxFWlNj5ey7U/XwS7772sIKUSAjwSnS0CUGUKEu8PX6eBcKWlDj9dyrURA+J
	U0/us4OUCwnESlyYHTmBUWEWksdmIXlsFpLHZiHcsICRZRWjWGpBcW56arFhgQlyZG9iBCdH
	LYsdjHvO+RxiFOBgVOLhjeDsjhNiTSwrrsw9xCjBwawkwivV2xknxJuSWFmVWpQfX1Sak1p8
	iNEUGO4TmaVEk/OBiTuvJN7Q1MjY2NjCxMzczNRYSZx36vWcOCGB9MSS1OzU1ILUIpg+Jg5O
	qQZGV1OngLh/rxXvXN4+70HsrqszTtjc4SioKjuUmJk5/17Nngaliz5BC/hs58rK3u64/jh8
	VY1VhZX2st3hsyS7L560yZdwkZYO1NC7l93NnOsS27enosexRebeXTtrz6VZHQuUnLSWXDts
	ueD187Pz5n++fFNi6+RTV9TELbYsVJ+bH+WSmfJEiaU4I9FQi7moOBEAFTczTqQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrGLMWRmVeSWpSXmKPExsWy7bCSvG6Jck+cwcI1LBbrTx1jttj7bjar
	xeVdc9gs2jZ+ZbTo37+BzYHVY+esu+we7/ddZfP4vEkugDmKyyYlNSezLLVI3y6BK2PuhK0s
	BefkKta/XM3ewNgl1cXIySEhYCJxo2MRaxcjF4eQwG5GiVfHdrBCJCQl3jRdZuxi5ACyhSUO
	Hy4GCQsJvGWUmHCQCcRmE9CUONRzjAXEFhawk9h6/yMjiC0iICQxfW4PmM0skCQxZdUJsHpe
	oJr7718yg9gsAioSPxa8ZwexRQUiJFrv3mKGqBGUODnzCQtEr5nEvM0PmSFseYnmrbOhbHGJ
	W0/mM01gFJiFpGUWkpZZSFpmIWlZwMiyilEytaA4Nz232LDAKC+1XK84Mbe4NC9dLzk/dxMj
	OLS1tHYwnjgRf4hRgINRiYeXgb07Tog1say4MvcQowQHs5IIr1RvZ5wQb0piZVVqUX58UWlO
	avEhRmkOFiVxXvn8Y5FCAumJJanZqakFqUUwWSYOTqkGRpkQ9bDESRF3fFc1mK48w//vWb2L
	X39L3uGpyrIN/8XdHYRur18kqylnomfzyenx9PI//6MsTrHKzX5eGPqHr6+k24L3/NGahcYR
	q/jDr91YsVv2sYxQzUcT7lOzbC7H5hTFftn86scuHv3tFkKNkj2P7JZHThIM8biXpplsKHrz
	fvaVeV4JSizFGYmGWsxFxYkAPeYRlGkCAAA=
X-CMS-MailID: 20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82
References: <CGME20200407065340epcas1p13e6e5ad6131f0a94d3ed1e8360353a82@epcas1p1.samsung.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03770GOS015164
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 07 Apr 2020 10:34:00 -0400
Cc: dm-devel@redhat.com, sunwook5492@gmail.com, linux-kernel@vger.kernel.org,
	snitzer@redhat.com
Subject: [dm-devel] [PATCH] dm verity fec: Don't add data_blocks to block
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

RXZlbiBpZiBibG9jayB0eXBlIGlzIG1ldGFkYXRhLApibG9jayBpbiB2ZXJpdHlfZmVjX2RlY29k
ZSgpIGhhcyBhbHJlYWR5IHRoZSByaWdodCBibG9jayBudW1iZXIuClNvIHRoZXJlIGlzIG5vIG5l
ZWQgdG8gYWRkIGRhdGFfYmxvY2tzIHRvIGJsb2NrLgoKU2lnbmVkLW9mZi1ieTogU3Vud29vayBF
b20gPHNwZWVkLmVvbUBzYW1zdW5nLmNvbT4KLS0tCiDCoGRyaXZlcnMvbWQvZG0tdmVyaXR5LWZl
Yy5jwqDCoMKgIHwgNiArLS0tLS0KIMKgZHJpdmVycy9tZC9kbS12ZXJpdHktZmVjLmjCoMKgwqAg
fCA0ICstLS0KIMKgZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMgfCA0ICstLS0KIMKgMyBm
aWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5jIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktZmVj
LmMKaW5kZXggNDkxNDdlNjM0MDQ2Li41NWYzNTNjYWU2ZWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bWQvZG0tdmVyaXR5LWZlYy5jCisrKyBiL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5jCkBAIC00
MTcsOCArNDE3LDcgQEAgc3RhdGljIGludCBmZWNfYnZfY29weShzdHJ1Y3QgZG1fdmVyaXR5ICp2
LCBzdHJ1Y3QgCmRtX3Zlcml0eV9pbyAqaW8sIHU4ICpkYXRhLAogwqAgKiBvdGhlcndpc2UgdG8g
YSBiaW9fdmVjIHN0YXJ0aW5nIGZyb20gaXRlci4KIMKgICovCiDCoGludCB2ZXJpdHlfZmVjX2Rl
Y29kZShzdHJ1Y3QgZG1fdmVyaXR5ICp2LCBzdHJ1Y3QgZG1fdmVyaXR5X2lvICppbywKLcKgwqDC
oCDCoMKgwqAgwqDCoMKgwqDCoCBlbnVtIHZlcml0eV9ibG9ja190eXBlIHR5cGUsIHNlY3Rvcl90
IGJsb2NrLCB1OCAqZGVzdCwKLcKgwqDCoCDCoMKgwqAgwqDCoMKgwqDCoCBzdHJ1Y3QgYnZlY19p
dGVyICppdGVyKQorwqDCoMKgIMKgwqDCoCDCoMKgwqDCoMKgIHNlY3Rvcl90IGJsb2NrLCB1OCAq
ZGVzdCwgc3RydWN0IGJ2ZWNfaXRlciAqaXRlcikKIMKgewogwqDCoMKgwqAgaW50IHI7CiDCoMKg
wqDCoCBzdHJ1Y3QgZG1fdmVyaXR5X2ZlY19pbyAqZmlvID0gZmVjX2lvKGlvKTsKQEAgLTQzNCw5
ICs0MzMsNiBAQCBpbnQgdmVyaXR5X2ZlY19kZWNvZGUoc3RydWN0IGRtX3Zlcml0eSAqdiwgc3Ry
dWN0IApkbV92ZXJpdHlfaW8gKmlvLAoKIMKgwqDCoMKgIGZpby0+bGV2ZWwrKzsKCi3CoMKgwqAg
aWYgKHR5cGUgPT0gRE1fVkVSSVRZX0JMT0NLX1RZUEVfTUVUQURBVEEpCi3CoMKgwqAgwqDCoMKg
IGJsb2NrICs9IHYtPmRhdGFfYmxvY2tzOwotCiDCoMKgwqDCoCAvKgogwqDCoMKgwqAgwqAqIEZv
ciBSUyhNLCBOKSwgdGhlIGNvbnRpbnVvdXMgRkVDIGRhdGEgaXMgZGl2aWRlZCBpbnRvIGJsb2Nr
cyBvZiBOCiDCoMKgwqDCoCDCoCogYnl0ZXMuIFNpbmNlIGJsb2NrIHNpemUgbWF5IG5vdCBiZSBk
aXZpc2libGUgYnkgTiwgdGhlIGxhc3QgYmxvY2sKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWQvZG0t
dmVyaXR5LWZlYy5oIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktZmVjLmgKaW5kZXggNDJmYmQzYTdm
YzlmLi43ZTJmZWEwZjhjYmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5o
CisrKyBiL2RyaXZlcnMvbWQvZG0tdmVyaXR5LWZlYy5oCkBAIC02OCw4ICs2OCw3IEBAIHN0cnVj
dCBkbV92ZXJpdHlfZmVjX2lvIHsKIMKgZXh0ZXJuIGJvb2wgdmVyaXR5X2ZlY19pc19lbmFibGVk
KHN0cnVjdCBkbV92ZXJpdHkgKnYpOwoKIMKgZXh0ZXJuIGludCB2ZXJpdHlfZmVjX2RlY29kZShz
dHJ1Y3QgZG1fdmVyaXR5ICp2LCBzdHJ1Y3QgZG1fdmVyaXR5X2lvICppbywKLcKgwqDCoCDCoMKg
wqAgwqDCoMKgIMKgwqDCoMKgIGVudW0gdmVyaXR5X2Jsb2NrX3R5cGUgdHlwZSwgc2VjdG9yX3Qg
YmxvY2ssCi3CoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoCB1OCAqZGVzdCwgc3RydWN0IGJ2
ZWNfaXRlciAqaXRlcik7CivCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqDCoCBzZWN0b3JfdCBi
bG9jaywgdTggKmRlc3QsIHN0cnVjdCBidmVjX2l0ZXIgKml0ZXIpOwoKIMKgZXh0ZXJuIHVuc2ln
bmVkIHZlcml0eV9mZWNfc3RhdHVzX3RhYmxlKHN0cnVjdCBkbV92ZXJpdHkgKnYsIHVuc2lnbmVk
IHN6LAogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNoYXIgKnJlc3VsdCwg
dW5zaWduZWQgbWF4bGVuKTsKQEAgLTk4LDcgKzk3LDYgQEAgc3RhdGljIGlubGluZSBib29sIHZl
cml0eV9mZWNfaXNfZW5hYmxlZChzdHJ1Y3QgCmRtX3Zlcml0eSAqdikKCiDCoHN0YXRpYyBpbmxp
bmUgaW50IHZlcml0eV9mZWNfZGVjb2RlKHN0cnVjdCBkbV92ZXJpdHkgKnYsCiDCoMKgwqDCoCDC
oMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgc3RydWN0IGRtX3Zlcml0eV9pbyAqaW8sCi3CoMKg
wqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIGVudW0gdmVyaXR5X2Jsb2NrX3R5cGUgdHlw
ZSwKIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBzZWN0b3JfdCBibG9jaywg
dTggKmRlc3QsCiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgc3RydWN0IGJ2
ZWNfaXRlciAqaXRlcikKIMKgewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFy
Z2V0LmMgYi9kcml2ZXJzL21kL2RtLXZlcml0eS10YXJnZXQuYwppbmRleCBlZWM5ZjI1MmU5MzUu
LmE5MWI0Y2IyYmY1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMK
KysrIGIvZHJpdmVycy9tZC9kbS12ZXJpdHktdGFyZ2V0LmMKQEAgLTMwMyw3ICszMDMsNiBAQCBz
dGF0aWMgaW50IHZlcml0eV92ZXJpZnlfbGV2ZWwoc3RydWN0IGRtX3Zlcml0eSAqdiwgCnN0cnVj
dCBkbV92ZXJpdHlfaW8gKmlvLAogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqAgdi0+
ZGlnZXN0X3NpemUpID09IDApKQogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCBhdXgtPmhhc2hfdmVy
aWZpZWQgPSAxOwogwqDCoMKgwqAgwqDCoMKgIGVsc2UgaWYgKHZlcml0eV9mZWNfZGVjb2RlKHYs
IGlvLAotwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgIERNX1ZFUklUWV9C
TE9DS19UWVBFX01FVEFEQVRBLAogwqDCoMKgwqAgwqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKg
IMKgwqAgaGFzaF9ibG9jaywgZGF0YSwgTlVMTCkgPT0gMCkKIMKgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgYXV4LT5oYXNoX3ZlcmlmaWVkID0gMTsKIMKgwqDCoMKgIMKgwqDCoCBlbHNlIGlmICh2ZXJp
dHlfaGFuZGxlX2Vycih2LApAQCAtNTIxLDggKzUyMCw3IEBAIHN0YXRpYyBpbnQgdmVyaXR5X3Zl
cmlmeV9pbyhzdHJ1Y3QgZG1fdmVyaXR5X2lvICppbykKIMKgwqDCoMKgIMKgwqDCoCDCoMKgwqAg
aWYgKHYtPnZhbGlkYXRlZF9ibG9ja3MpCiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqDCoCBz
ZXRfYml0KGN1cl9ibG9jaywgdi0+dmFsaWRhdGVkX2Jsb2Nrcyk7CiDCoMKgwqDCoCDCoMKgwqAg
wqDCoMKgIGNvbnRpbnVlOwotwqDCoMKgIMKgwqDCoCB9Ci3CoMKgwqAgwqDCoMKgIGVsc2UgaWYg
KHZlcml0eV9mZWNfZGVjb2RlKHYsIGlvLCBETV9WRVJJVFlfQkxPQ0tfVFlQRV9EQVRBLAorwqDC
oMKgIMKgwqDCoCB9IGVsc2UgaWYgKHZlcml0eV9mZWNfZGVjb2RlKHYsIGlvLAogwqDCoMKgwqAg
wqDCoMKgIMKgwqDCoCDCoMKgwqAgwqDCoMKgIMKgwqAgY3VyX2Jsb2NrLCBOVUxMLCAmc3RhcnQp
ID09IDApCiDCoMKgwqDCoCDCoMKgwqAgwqDCoMKgIGNvbnRpbnVlOwogwqDCoMKgwqAgwqDCoMKg
IGVsc2UgaWYgKHZlcml0eV9oYW5kbGVfZXJyKHYsIERNX1ZFUklUWV9CTE9DS19UWVBFX0RBVEEs
Ci0tIAoyLjE3LjEKCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNv
bQpodHRwczovL3d3dy5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

