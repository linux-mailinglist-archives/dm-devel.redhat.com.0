Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3552E1A73B1
	for <lists+dm-devel@lfdr.de>; Tue, 14 Apr 2020 08:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1586845789;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=VXERIeg63KGD8B8SCYUPtD0zqFRjxnoGv0kWm5MiGME=;
	b=ilf0O/P/1c/j8j3Ws13yfpw7VZrrRN3LyXJfrTzSdlxrME/ZxRkBykysJ/EDhyh4apWoNm
	d7bYPkAKGDfZU8uE+Rma1UK4je4bRDpT8NsjDEt6ooF2GWKJQbVph5+MVskKCuHneHuYQZ
	Z/s+40ccJM9HWyTHbRmrSukbv6O/TFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-FZW9H2aPOmWnvjk5D5cDNQ-1; Tue, 14 Apr 2020 02:29:45 -0400
X-MC-Unique: FZW9H2aPOmWnvjk5D5cDNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F35CD100727B;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FFDA60BE0;
	Tue, 14 Apr 2020 06:29:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6030193068;
	Tue, 14 Apr 2020 06:29:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03A3siCj017243 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Apr 2020 23:54:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A46622166B34; Fri, 10 Apr 2020 03:54:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F9282166B36
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 03:54:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A471D101A55F
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 03:54:41 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-222-s6Uw8iOQN4W5Ho1K6ttayA-1; Thu, 09 Apr 2020 23:54:28 -0400
X-MC-Unique: s6Uw8iOQN4W5Ho1K6ttayA-1
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id
	20200410035425epoutp03f2e5287a535a69ca340922a322748979~EWQl16LnB0966509665epoutp03D
	for <dm-devel@redhat.com>; Fri, 10 Apr 2020 03:54:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
	20200410035425epoutp03f2e5287a535a69ca340922a322748979~EWQl16LnB0966509665epoutp03D
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
	epcas1p3.samsung.com (KnoxPortal) with ESMTP id
	20200410035425epcas1p3bf05c02c99c0887df07b8d5d5978565b~EWQlmIaKr1904719047epcas1p3m;
	Fri, 10 Apr 2020 03:54:25 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.165]) by
	epsnrtp2.localdomain (Postfix) with ESMTP id 48z3zh4JxQzMqYkb;
	Fri, 10 Apr 2020 03:54:24 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	90.63.04402.0FDEF8E5; Fri, 10 Apr 2020 12:54:24 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269~EWQkUE8eN1044010440epcas1p2F;
	Fri, 10 Apr 2020 03:54:24 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20200410035424epsmtrp2e2527f8ae6b2cbcce046664ad390764b~EWQkTT1yO0739007390epsmtrp2g;
	Fri, 10 Apr 2020 03:54:24 +0000 (GMT)
X-AuditID: b6c32a35-753ff70000001132-d3-5e8fedf0d434
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	1F.E0.04158.0FDEF8E5; Fri, 10 Apr 2020 12:54:24 +0900 (KST)
Received: from [10.253.105.163] (unknown [10.253.105.163]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20200410035424epsmtip153d290ab78720891bbbcde9d34510592~EWQkH72Zd1557515575epsmtip1I;
	Fri, 10 Apr 2020 03:54:24 +0000 (GMT)
To: Alasdair Kergon <agk@redhat.com>
From: Sunwook Eom <speed.eom@samsung.com>
Message-ID: <b8de2c4b-d8cf-2bdb-f4cf-5b10faf48955@samsung.com>
Date: Fri, 10 Apr 2020 12:54:19 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmvu6Ht/1xBk+eKlqsP3WM2WLvu9ms
	Fl2N8RZLV7xltWjb+JXRon//BjYHNo+ds+6yeyzYVOrxft9VNo++LasYA1iicmwyUhNTUosU
	UvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJzgHYrKZQl5pQChQISi4uV
	9O1sivJLS1IVMvKLS2yVUgtScgoMDQr0ihNzi0vz0vWS83OtDA0MjEyBKhNyMhbsucFacJ+9
	ovVLZgPjPrYuRk4OCQETie2fO1i6GLk4hAR2MEq0nuhjBUkICXxilFh7UQgi8Q0ocXkdE0zH
	z2MnWSESexkl1hyeyw7hvGeUOHHsIQtIlYiAisSf888ZQRLMApsYJZZubWcGSbAJaEoc6jkG
	ViQs4CWxe94EMJtXwE6ic+pEsBUsAqoSszb9BKsXFYiQuLf0IDNEjaDEyZlPwOqZBeQlmrfO
	ZoawxSVuPZnPBLJMQmALm8S8Xz/YIW51kfi68w2ULSzx6vgWKFtK4vO7vdAQqJa4cuIi1G81
	Er3Xb7FC2MYSvT0XgBZwAC3QlFi/Sx8irCix8/dcRoi9fBLvvvawgpRICPBKdLQJQZQoS7w9
	fp4FwpaUOP13KtRED4kvCzezQ4I3VuLj6j1MExgVZiH5bBaSz2Yh+WwWwhELGFlWMYqlFhTn
	pqcWGxYYIkf2JkZwutQy3cE45ZzPIUYBDkYlHt4Opv44IdbEsuLK3EOMEhzMSiK83k29cUK8
	KYmVValF+fFFpTmpxYcYTYEBP5FZSjQ5H5jK80riDU2NjI2NLUzMzM1MjZXEeadez4kTEkhP
	LEnNTk0tSC2C6WPi4JRqYNwl+2PRUZPEedGlf3bUCIXF+7NsX3dQ6MjHRF/WyJW7en++3Xz7
	eumD28VxaqoH719WP1F7/eqz6q6SwGX9syQrUkUYI+eeVuDZnlL8yPL3v6DyG3xez2XOWv7+
	uubI9Vl3J71KejZzxysF+6p5M2QOTT8rO18pxU1+Uqgf61Nm4312AotTD0gqsRRnJBpqMRcV
	JwIA0lP1Ua0DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrPLMWRmVeSWpSXmKPExsWy7bCSnO6Ht/1xBne3c1isP3WM2WLvu9ms
	Fl2N8RZLV7xltWjb+JXRon//BjYHNo+ds+6yeyzYVOrxft9VNo++LasYA1iiuGxSUnMyy1KL
	9O0SuDIW7LnBWnCfvaL1S2YD4z62LkZODgkBE4mfx06ydjFycQgJ7GaUuDC1hR0iISnxpuky
	YxcjB5AtLHH4cDFEzVtGiTtvGsFqRARUJP6cf84IYjMLbGGUeHswHsRmE9CUONRzjAXEFhbw
	ktg9bwKYzStgJ9E5dSITiM0ioCoxa9NPZhBbVCBCovXuLWaIGkGJkzOfsEDMNJOYt/khM4Qt
	L9G8dTaULS5x68l8pgmMArOQtMxC0jILScssJC0LGFlWMUqmFhTnpucWGxYY5aWW6xUn5haX
	5qXrJefnbmIEB7uW1g7GEyfiDzEKcDAq8fAaMPTHCbEmlhVX5h5ilOBgVhLh9W7qjRPiTUms
	rEotyo8vKs1JLT7EKM3BoiTOK59/LFJIID2xJDU7NbUgtQgmy8TBKdXAmLr7j9v3ufwuRzld
	J8/RvsuSmnquRWzt9F0zn8Ys/eV7ivNNfUaCVKbCldLKi2wa25Y/iDPNNVtaMN3D9ve+mXPj
	ZB7HT+9ccE7tjHzJPM93UXYhItFf9f8wq8vukJqpPPuE7ZuL+gs3Pm1LUK/0rVxgGWC6fXf0
	l5lhHyTflMpOkNv+dt8VFiWW4oxEQy3mouJEAMKMWJlyAgAA
X-CMS-MailID: 20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269
References: <CGME20200410035424epcas1p2d47ca3a171af6a895af17d86e2838269@epcas1p2.samsung.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03A3siCj017243
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 14 Apr 2020 02:29:26 -0400
Cc: mcneo.kang@samsung.com, device-mapper development <dm-devel@redhat.com>,
	sunwook5492@gmail.com, Sami Tolvanen <samitolvanen@google.com>,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH] dm verity fec: fix hash block number in
	verity_fec_decode
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

VGhlIGVycm9yIGNvcnJlY3Rpb24gZGF0YSBpcyBjb21wdXRlZCBhcyBpZiBkYXRhIGFuZCBoYXNo
IGJsb2Nrcwp3ZXJlIGNvbmNhdGVuYXRlZC4gQnV0IGhhc2ggYmxvY2sgbnVtYmVyIGlzIHN0YXJ0
IGZyb20gdi0+aGFzaF9zdGFydC4KU28sIHdlIGhhdmUgdG8gY2FsY3VsYXRlIGhhc2ggYmxvY2sg
bnVtYmVyIGJhc2VkIG9uIHRoYXQuCgpGaXhlczogYTczOWZmM2Y1NDNhZiAoImRtIHZlcml0eTog
YWRkIHN1cHBvcnQgZm9yIGZvcndhcmQgZXJyb3IgY29ycmVjdGlvbiIpClNpZ25lZC1vZmYtYnk6
IFN1bndvb2sgRW9tIDxzcGVlZC5lb21Ac2Ftc3VuZy5jb20+Ci0tLQogwqBkcml2ZXJzL21kL2Rt
LXZlcml0eS1mZWMuYyB8IDIgKy0KIMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS12ZXJpdHktZmVjLmMgYi9k
cml2ZXJzL21kL2RtLXZlcml0eS1mZWMuYwppbmRleCA0OTE0N2U2MzQwNDYuLmZiNDFiNGYyM2M0
OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZC9kbS12ZXJpdHktZmVjLmMKKysrIGIvZHJpdmVycy9t
ZC9kbS12ZXJpdHktZmVjLmMKQEAgLTQzNSw3ICs0MzUsNyBAQCBpbnQgdmVyaXR5X2ZlY19kZWNv
ZGUoc3RydWN0IGRtX3Zlcml0eSAqdiwgc3RydWN0IApkbV92ZXJpdHlfaW8gKmlvLAogwqDCoMKg
wqAgZmlvLT5sZXZlbCsrOwoKIMKgwqDCoMKgIGlmICh0eXBlID09IERNX1ZFUklUWV9CTE9DS19U
WVBFX01FVEFEQVRBKQotwqDCoMKgIMKgwqDCoCBibG9jayArPSB2LT5kYXRhX2Jsb2NrczsKK8Kg
wqDCoCDCoMKgwqAgYmxvY2sgPSBibG9jayAtIHYtPmhhc2hfc3RhcnQgKyB2LT5kYXRhX2Jsb2Nr
czsKCiDCoMKgwqDCoCAvKgogwqDCoMKgwqAgwqAqIEZvciBSUyhNLCBOKSwgdGhlIGNvbnRpbnVv
dXMgRkVDIGRhdGEgaXMgZGl2aWRlZCBpbnRvIGJsb2NrcyBvZiBOCi0tIAoyLjE3LjEKCgotLQpk
bS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpodHRwczovL3d3dy5yZWRo
YXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2ZWw=

