Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CA569DB56
	for <lists+dm-devel@lfdr.de>; Tue, 21 Feb 2023 08:40:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676965231;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=7qDNMFJmVBaN4ja35OJtuTNRTJ78yWjj3vgpKvzg7B4=;
	b=HXMROnN47eialI/GylS31DrmXelN/G4UUghM6JcgIHmPX3/GafT9ygf9PRN8DVqYANvR95
	BuBDgXVnDqh4T6h6RobHJ3RL6WVEpj/+4Owlj0FyD20tcd0sh9UI2on9v3++dRGvnbLotw
	hgvFHeAvfL5/QgeBmhVR6Y6zXBAm3HY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-621-0MDJnDzaM8yXlsOCctVpWw-1; Tue, 21 Feb 2023 02:40:29 -0500
X-MC-Unique: 0MDJnDzaM8yXlsOCctVpWw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CCE3183B3C1;
	Tue, 21 Feb 2023 07:40:26 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A3AE12166B2A;
	Tue, 21 Feb 2023 07:40:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8ECC21946A71;
	Tue, 21 Feb 2023 07:40:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 9005A1946587
 for <dm-devel@listman.corp.redhat.com>; Mon, 20 Feb 2023 12:56:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 8186C43FBA; Mon, 20 Feb 2023 12:56:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7964B422A9
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:56:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5619A802D19
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:56:17 +0000 (UTC)
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-OS09uCvIM2C0zLQXjAFEDA-1; Mon, 20 Feb 2023 07:56:15 -0500
X-MC-Unique: OS09uCvIM2C0zLQXjAFEDA-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20230220124839epoutp036d3dbe69b856be157f1c2fd6838f8412~FiTpCJszX2305723057epoutp03S
 for <dm-devel@redhat.com>; Mon, 20 Feb 2023 12:48:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20230220124839epoutp036d3dbe69b856be157f1c2fd6838f8412~FiTpCJszX2305723057epoutp03S
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20230220124838epcas5p3dcf70f2b730e00dd49ee1752af5fa9c5~FiToHmIjm1791917919epcas5p3T;
 Mon, 20 Feb 2023 12:48:38 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.177]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4PL2KK0Qzsz4x9Pp; Mon, 20 Feb
 2023 12:48:37 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 34.A6.55678.42C63F36; Mon, 20 Feb 2023 21:48:36 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20230220105512epcas5p15e1171c05e5ceda614d4f196672ad678~FgwlA0KTy1670816708epcas5p1N;
 Mon, 20 Feb 2023 10:55:12 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230220105512epsmtrp2889425e694cd431aaa5daf1cb3c64625~Fgwk-_7pQ1664116641epsmtrp2d;
 Mon, 20 Feb 2023 10:55:12 +0000 (GMT)
X-AuditID: b6c32a4a-909fc7000000d97e-94-63f36c247ede
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 4C.8C.05839.F8153F36; Mon, 20 Feb 2023 19:55:11 +0900 (KST)
Received: from green5.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230220105508epsmtip29ca3624ae0ed188e3d91fa3ca62445f2~FgwhyO3SW0727007270epsmtip2o;
 Mon, 20 Feb 2023 10:55:08 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>, Mike
 Snitzer <snitzer@kernel.org>, dm-devel@redhat.com, Keith Busch
 <kbusch@kernel.org>, Christoph Hellwig <hch@lst.de>, Sagi Grimberg
 <sagi@grimberg.me>, James Smart <james.smart@broadcom.com>, Chaitanya
 Kulkarni <kch@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>
Date: Mon, 20 Feb 2023 16:23:28 +0530
Message-Id: <20230220105336.3810-6-nj.shetty@samsung.com>
In-Reply-To: <20230220105336.3810-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te0xbZRTfvbf0saRweUw/QBy7my4UgRahfkVwxi3zVjQi6hIXJ63lCgi0
 TUsFZrKV8UYZbAqyIgUmewCuSJkEBhVWhI02DAVaHgGZE2Zk4yF1WxAbbCno/vv9zvn9zvnO
 +XKYmFcZw4+ZIs2gFFJxGkHfSWvvC+KE7EuzSbh3hqNgi2kAg6fK7Rhsnimjw8qVNQyuDw1j
 0LBU7QYneztR2H3+LAobm/tR2FX/Jwp/m7YxYP/GIh2eNVoROG/RoNAwFQy7DYM0OHrtazqs
 vTjPgMYvclHYMZeDwPb1Wgzq7i3T4M0pfzhsv+H2MiBHx2JJzewQnezUzDDI4V9aaeTokIrU
 NxXTybaGk2TXpJpOluYuOQT5s27k8g8WOnn6ahNCtpk/JW36p0n93CIa53E0NTqZEidSikBK
 KpElpkiTYojYtxMOJkTyubwQngC+QARKxelUDHHo9biQwylpjj0QgZ+I01SOUJxYqSTCXopW
 yFQZVGCyTJkRQ1DyxDR5hDxUKU5XqqRJoVIqI4rH5YZHOoSi1OSiW7do8pLMrHq7UI3oRCUI
 iwnwCFBVVuxWguxkeuFdCBioXqO7yCoC2sx1qIs8RID5fim6bVm//gBxJQwIaLCatkguChom
 Vh2EyaTjwcC8wXQafPBpFHSa9zo1GF6HgSFLN82Z8Mb5YE1nYzgxDX8GnCtZxJyYjQuArrzV
 zVkH4GGgbNbTCVl4FHiUl+1SeILBc3ObVTB8N8j9vhpzlgd4FwtocyboroceAnZtDc2FvcHC
 jasMF/YDtiXDliYTNH55me4y5yFAM65BXIkDIN9UhjkbY3gQaLkW5goHgAqTDnU1dgel63Nb
 S2GDDu023gu+banbqu8LrI9ytjAJfqwxb2IvvBQB9vnj5Uig5rF5NI/No/m/cx2CNSG+lFyZ
 nkQpI+XhUirzvz+WyNL1yOZlcF7rQH69vRJqRFAmYkQAEyN82Btsm8SLnSjOPk4pZAkKVRql
 NCKRjnWfwfx2SWSO05JmJPAiBNwIPp8fIXiezyOeZO+PGZR44UniDCqVouSUYtuHMll+arSi
 OCrM753n4k8SU9nsAMlP+lMxI8jIs/LdT/T8fS+g9OKR2AVVJj7w16vvR3H2X6/sz5kQsT6K
 nDSK1g2CAmFC28GxC9WWFcmMtaLd2jP2cEXeu/C79wViYKiquUDN+Wf07vCR+GXh7cOFvZ2v
 DEbgb35c83mBKX+Hj7DyMw9m63f7RMd0l9w73vP944rlpjog3DuveGMlSL9H2LMc+wbBvqtl
 xX4wFi9S/6ydLtJWdRSOZz114itmsPWMb9/pO8f8z48oBf5vVbrPc4U7li95cvqWHuzJMued
 +LC2fpem7OhskeXFbxYmV01N2YWNHmHv2oUc8YHoK5fFQWvj3oz7rbPWYIKmTBbzOJhCKf4X
 a9tDxKIEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA03Se1BMcRQHcL/7u3v3tmN1d/P4edasIWpEmJ1fJsZ4zFzErMGM5+hO7rRo
 s/YWYSjWcw0lNFqP5Jliadejp8dSSbWhZdTIzlBiqDY7ZDVbXDH89z3nfM7569BQ+ZocQq+N
 T+AN8VycipKRtx+qAselLvTETLj5IQJff1IO8a40H8R5jakUznB7Ie6qqYW4tO2kBNffLyRw
 ybl0Al/JKyNwcXYHgd+99khxWU8rhdPtLwFufmEmcGlDKC4prSRxXdEpCmddapZi+1EjgQua
 dgJ8uysLYsundhI/bhiKa30VkumIrXPOY82uGootNDdK2do3+SRbV5PIWnMPUKztQjJbXJ9C
 sYeMbb/AHpeEbb/7gmIP38wFrK1qG+uxjmCtTa2Exn+5LHINH7d2E28YPy1apt3vcJB60+ak
 bN+cFGCJNgE/GjGTUdeDr8AEZLSSKQbIcaQO9g4Go0u+R39yALrS3SLtRTsJ5O3cR5kATVNM
 KKrqocV+f+Y9gWrevIViARkLRNeMFyXidgCjRl6LRypmkhmFMk2tv6/KmQhkScuXiIcQMx6l
 uhRi9GOmoM7dW0Sh/CUep9tAr1agyswmUiSQCUbXzyjFNmQCkfHWSZgGFOb/lPmfMv+nzgKY
 CwbzekEXqxPC9eHx/OYwgdMJifGxYTEbdFbw+wFCxhaAO7nuMDsgaGAHiIaq/vIeuSdGKV/D
 bdnKGzasNiTG8YIdDKVJ1SD5U1PlaiUTyyXw63lezxv+Tgnab0gKMfPgV+ewvCVvv3WMlm7t
 yJj0XKMLcMh6Qr3y2c9fhQgLqrPz+racjVQUDGjbqNa5vmcdHN2dMGZy2LWGw00TT2dFjVg/
 UOgz3DglfBWnvfrlRHXydKX7sps5UfKp+of3eLflicM/pdw/w9keFFukuXd1bwcXsWLs/ejA
 yMaKHWou4cacZ93VzuBMv4pNpxwrFy1122bMt5qSNTky9dRzLt+SkTkf8/stnpuzvSjxhnRB
 Z2FBy7Ao5zpYxkxqKwd39PpMY5X8R5TtvHqhJjBoR3bSimWKmae/vbocjB3zm/X1i8FUlvZv
 WEl53S+TPhNnat+la4/tXzprXs7dY7sHHjdqD6lIQcuFh0CDwP0Eoub2L28DAAA=
X-CMS-MailID: 20230220105512epcas5p15e1171c05e5ceda614d4f196672ad678
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230220105512epcas5p15e1171c05e5ceda614d4f196672ad678
References: <20230220105336.3810-1-nj.shetty@samsung.com>
 <CGME20230220105512epcas5p15e1171c05e5ceda614d4f196672ad678@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mailman-Approved-At: Tue, 21 Feb 2023 07:40:17 +0000
Subject: [dm-devel] [PATCH v7 5/8] nvme: add copy offload support
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: bvanassche@acm.org, joshi.k@samsung.com, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, ming.lei@redhat.com,
 linux-block@vger.kernel.org, nitheshshetty@gmail.com,
 linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Javier=20Gonz=C3=A1lez?= <javier.gonz@samsung.com>,
 damien.lemoal@opensource.wdc.com, Nitesh Shetty <nj.shetty@samsung.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Rm9yIGRldmljZSBzdXBwb3J0aW5nIG5hdGl2ZSBjb3B5LCBudm1lIGRyaXZlciByZWNlaXZlcyBy
ZWFkIGFuZAp3cml0ZSByZXF1ZXN0IHdpdGggQkxLX0NPUFkgb3AgZmxhZ3MuCkZvciByZWFkIHJl
cXVlc3QgdGhlIG52bWUgZHJpdmVyIHBvcHVsYXRlcyB0aGUgcGF5bG9hZCB3aXRoIHNvdXJjZQpp
bmZvcm1hdGlvbi4KRm9yIHdyaXRlIHJlcXVlc3QgdGhlIGRyaXZlciBjb252ZXJ0cyBpdCB0byBu
dm1lIGNvcHkgY29tbWFuZCB1c2luZyB0aGUKc291cmNlIGluZm9ybWF0aW9uIGluIHRoZSBwYXls
b2FkIGFuZCBzdWJtaXRzIHRvIHRoZSBkZXZpY2UuCmN1cnJlbnQgZGVzaWduIG9ubHkgc3VwcG9y
dHMgc2luZ2xlIHNvdXJjZSByYW5nZS4KVGhpcyBkZXNpZ24gaXMgY291cnRlc3kgTWlrdWxhcyBQ
YXRvY2thJ3MgdG9rZW4gYmFzZWQgY29weQoKdHJhY2UgZXZlbnQgc3VwcG9ydCBmb3IgbnZtZV9j
b3B5X2NtZC4KU2V0IHRoZSBkZXZpY2UgY29weSBsaW1pdHMgdG8gcXVldWUgbGltaXRzLgoKU2ln
bmVkLW9mZi1ieTogS2FuY2hhbiBKb3NoaSA8am9zaGkua0BzYW1zdW5nLmNvbT4KU2lnbmVkLW9m
Zi1ieTogTml0ZXNoIFNoZXR0eSA8bmouc2hldHR5QHNhbXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5
OiBKYXZpZXIgR29uesOhbGV6IDxqYXZpZXIuZ29uekBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1i
eTogQW51aiBHdXB0YSA8YW51ajIwLmdAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9udm1lL2hv
c3QvY29uc3RhbnRzLmMgfCAgIDEgKwogZHJpdmVycy9udm1lL2hvc3QvY29yZS5jICAgICAgfCAx
MDYgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQogZHJpdmVycy9udm1lL2hvc3Qv
ZmMuYyAgICAgICAgfCAgIDUgKysKIGRyaXZlcnMvbnZtZS9ob3N0L252bWUuaCAgICAgIHwgICA3
ICsrKwogZHJpdmVycy9udm1lL2hvc3QvcGNpLmMgICAgICAgfCAgMjcgKysrKysrKystCiBkcml2
ZXJzL252bWUvaG9zdC9yZG1hLmMgICAgICB8ICAgNyArKysKIGRyaXZlcnMvbnZtZS9ob3N0L3Rj
cC5jICAgICAgIHwgIDE2ICsrKysrCiBkcml2ZXJzL252bWUvaG9zdC90cmFjZS5jICAgICB8ICAx
OSArKysrKysKIGluY2x1ZGUvbGludXgvbnZtZS5oICAgICAgICAgIHwgIDQzICsrKysrKysrKysr
KystCiA5IGZpbGVzIGNoYW5nZWQsIDIyMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L2NvbnN0YW50cy5jIGIvZHJpdmVycy9udm1l
L2hvc3QvY29uc3RhbnRzLmMKaW5kZXggZTk1OGQ1MDE1NTg1Li40ZTYwOTQ2ZDNhYTggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L2NvbnN0YW50cy5jCisrKyBiL2RyaXZlcnMvbnZtZS9o
b3N0L2NvbnN0YW50cy5jCkBAIC0xOSw2ICsxOSw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICogY29u
c3QgbnZtZV9vcHNbXSA9IHsKIAlbbnZtZV9jbWRfcmVzdl9yZXBvcnRdID0gIlJlc2VydmF0aW9u
IFJlcG9ydCIsCiAJW252bWVfY21kX3Jlc3ZfYWNxdWlyZV0gPSAiUmVzZXJ2YXRpb24gQWNxdWly
ZSIsCiAJW252bWVfY21kX3Jlc3ZfcmVsZWFzZV0gPSAiUmVzZXJ2YXRpb24gUmVsZWFzZSIsCisJ
W252bWVfY21kX2NvcHldID0gIkNvcHkgT2ZmbG9hZCIsCiAJW252bWVfY21kX3pvbmVfbWdtdF9z
ZW5kXSA9ICJab25lIE1hbmFnZW1lbnQgU2VuZCIsCiAJW252bWVfY21kX3pvbmVfbWdtdF9yZWN2
XSA9ICJab25lIE1hbmFnZW1lbnQgUmVjZWl2ZSIsCiAJW252bWVfY21kX3pvbmVfYXBwZW5kXSA9
ICJab25lIE1hbmFnZW1lbnQgQXBwZW5kIiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0
L2NvcmUuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYwppbmRleCA4YjY0MjExNDExNjIuLjRi
MWExYTNmYWQ4MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lL2hvc3QvY29yZS5jCisrKyBiL2Ry
aXZlcnMvbnZtZS9ob3N0L2NvcmUuYwpAQCAtNzUzLDYgKzc1Myw4MCBAQCBzdGF0aWMgaW5saW5l
IHZvaWQgbnZtZV9zZXR1cF9mbHVzaChzdHJ1Y3QgbnZtZV9ucyAqbnMsCiAJY21uZC0+Y29tbW9u
Lm5zaWQgPSBjcHVfdG9fbGUzMihucy0+aGVhZC0+bnNfaWQpOwogfQogCitzdGF0aWMgaW5saW5l
IGJsa19zdGF0dXNfdCBudm1lX3NldHVwX2NvcHlfcmVhZChzdHJ1Y3QgbnZtZV9ucyAqbnMsCisJ
CXN0cnVjdCByZXF1ZXN0ICpyZXEpCit7CisJc3RydWN0IGJpbyAqYmlvID0gcmVxLT5iaW87CisJ
c3RydWN0IG52bWVfY29weV90b2tlbiAqdG9rZW4gPSBidmVjX2ttYXBfbG9jYWwoJmJpby0+Ymlf
aW9fdmVjWzBdKTsKKworCW1lbWNweSh0b2tlbi0+c3Vic3lzLCAibnZtZSIsIDQpOworCXRva2Vu
LT5ucyA9IG5zOworCXRva2VuLT5zcmNfc2VjdG9yID0gYmlvLT5iaV9pdGVyLmJpX3NlY3RvcjsK
Kwl0b2tlbi0+c2VjdG9ycyA9IGJpby0+YmlfaXRlci5iaV9zaXplID4+IDk7CisKKwlyZXR1cm4g
QkxLX1NUU19PSzsKK30KKworc3RhdGljIGlubGluZSBibGtfc3RhdHVzX3QgbnZtZV9zZXR1cF9j
b3B5X3dyaXRlKHN0cnVjdCBudm1lX25zICpucywKKwkgICAgICAgc3RydWN0IHJlcXVlc3QgKnJl
cSwgc3RydWN0IG52bWVfY29tbWFuZCAqY21uZCkKK3sKKwlzdHJ1Y3QgbnZtZV9jb3B5X3Jhbmdl
ICpyYW5nZSA9IE5VTEw7CisJc3RydWN0IGJpbyAqYmlvID0gcmVxLT5iaW87CisJc3RydWN0IG52
bWVfY29weV90b2tlbiAqdG9rZW4gPSBidmVjX2ttYXBfbG9jYWwoJmJpby0+YmlfaW9fdmVjWzBd
KTsKKwlzZWN0b3JfdCBzcmNfc2VjdG9yLCBkc3Rfc2VjdG9yLCBuX3NlY3RvcnM7CisJdTY0IHNy
Y19sYmEsIGRzdF9sYmEsIG5fbGJhOworCXVuc2lnbmVkIHNob3J0IG5yX3JhbmdlID0gMTsKKwl1
MTYgY29udHJvbCA9IDA7CisKKwlpZiAodW5saWtlbHkobWVtY21wKHRva2VuLT5zdWJzeXMsICJu
dm1lIiwgNCkpKQorCQlyZXR1cm4gQkxLX1NUU19OT1RTVVBQOworCWlmICh1bmxpa2VseSh0b2tl
bi0+bnMgIT0gbnMpKQorCQlyZXR1cm4gQkxLX1NUU19OT1RTVVBQOworCisJc3JjX3NlY3RvciA9
IHRva2VuLT5zcmNfc2VjdG9yOworCWRzdF9zZWN0b3IgPSBiaW8tPmJpX2l0ZXIuYmlfc2VjdG9y
OworCW5fc2VjdG9ycyA9IHRva2VuLT5zZWN0b3JzOworCWlmIChXQVJOX09OKG5fc2VjdG9ycyAh
PSBiaW8tPmJpX2l0ZXIuYmlfc2l6ZSA+PiA5KSkKKwkJcmV0dXJuIEJMS19TVFNfTk9UU1VQUDsK
KworCXNyY19sYmEgPSBudm1lX3NlY3RfdG9fbGJhKG5zLCBzcmNfc2VjdG9yKTsKKwlkc3RfbGJh
ID0gbnZtZV9zZWN0X3RvX2xiYShucywgZHN0X3NlY3Rvcik7CisJbl9sYmEgPSBudm1lX3NlY3Rf
dG9fbGJhKG5zLCBuX3NlY3RvcnMpOworCisJaWYgKFdBUk5fT04oIW5fbGJhKSkKKwkJcmV0dXJu
IEJMS19TVFNfTk9UU1VQUDsKKworCWlmIChyZXEtPmNtZF9mbGFncyAmIFJFUV9GVUEpCisJCWNv
bnRyb2wgfD0gTlZNRV9SV19GVUE7CisKKwlpZiAocmVxLT5jbWRfZmxhZ3MgJiBSRVFfRkFJTEZB
U1RfREVWKQorCQljb250cm9sIHw9IE5WTUVfUldfTFI7CisKKwltZW1zZXQoY21uZCwgMCwgc2l6
ZW9mKCpjbW5kKSk7CisJY21uZC0+Y29weS5vcGNvZGUgPSBudm1lX2NtZF9jb3B5OworCWNtbmQt
PmNvcHkubnNpZCA9IGNwdV90b19sZTMyKG5zLT5oZWFkLT5uc19pZCk7CisJY21uZC0+Y29weS5z
ZGxiYSA9IGNwdV90b19sZTY0KGRzdF9sYmEpOworCisJcmFuZ2UgPSBrbWFsbG9jX2FycmF5KG5y
X3JhbmdlLCBzaXplb2YoKnJhbmdlKSwKKwkJCUdGUF9BVE9NSUMgfCBfX0dGUF9OT1dBUk4pOwor
CWlmICghcmFuZ2UpCisJCXJldHVybiBCTEtfU1RTX1JFU09VUkNFOworCisJcmFuZ2VbMF0uc2xi
YSA9IGNwdV90b19sZTY0KHNyY19sYmEpOworCXJhbmdlWzBdLm5sYiA9IGNwdV90b19sZTE2KG5f
bGJhIC0gMSk7CisKKwljbW5kLT5jb3B5Lm5yX3JhbmdlID0gMDsKKworCXJlcS0+c3BlY2lhbF92
ZWMuYnZfcGFnZSA9IHZpcnRfdG9fcGFnZShyYW5nZSk7CisJcmVxLT5zcGVjaWFsX3ZlYy5idl9v
ZmZzZXQgPSBvZmZzZXRfaW5fcGFnZShyYW5nZSk7CisJcmVxLT5zcGVjaWFsX3ZlYy5idl9sZW4g
PSBzaXplb2YoKnJhbmdlKSAqIG5yX3JhbmdlOworCXJlcS0+cnFfZmxhZ3MgfD0gUlFGX1NQRUNJ
QUxfUEFZTE9BRDsKKworCWNtbmQtPmNvcHkuY29udHJvbCA9IGNwdV90b19sZTE2KGNvbnRyb2wp
OworCisJcmV0dXJuIEJMS19TVFNfT0s7Cit9CisKIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9z
ZXR1cF9kaXNjYXJkKHN0cnVjdCBudm1lX25zICpucywgc3RydWN0IHJlcXVlc3QgKnJlcSwKIAkJ
c3RydWN0IG52bWVfY29tbWFuZCAqY21uZCkKIHsKQEAgLTk3OSwxMCArMTA1MywxNiBAQCBibGtf
c3RhdHVzX3QgbnZtZV9zZXR1cF9jbWQoc3RydWN0IG52bWVfbnMgKm5zLCBzdHJ1Y3QgcmVxdWVz
dCAqcmVxKQogCQlyZXQgPSBudm1lX3NldHVwX2Rpc2NhcmQobnMsIHJlcSwgY21kKTsKIAkJYnJl
YWs7CiAJY2FzZSBSRVFfT1BfUkVBRDoKLQkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVxLCBj
bWQsIG52bWVfY21kX3JlYWQpOworCQlpZiAodW5saWtlbHkocmVxLT5jbWRfZmxhZ3MgJiBSRVFf
Q09QWSkpCisJCQlyZXQgPSBudm1lX3NldHVwX2NvcHlfcmVhZChucywgcmVxKTsKKwkJZWxzZQor
CQkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVxLCBjbWQsIG52bWVfY21kX3JlYWQpOwogCQli
cmVhazsKIAljYXNlIFJFUV9PUF9XUklURToKLQkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVx
LCBjbWQsIG52bWVfY21kX3dyaXRlKTsKKwkJaWYgKHVubGlrZWx5KHJlcS0+Y21kX2ZsYWdzICYg
UkVRX0NPUFkpKQorCQkJcmV0ID0gbnZtZV9zZXR1cF9jb3B5X3dyaXRlKG5zLCByZXEsIGNtZCk7
CisJCWVsc2UKKwkJCXJldCA9IG52bWVfc2V0dXBfcncobnMsIHJlcSwgY21kLCBudm1lX2NtZF93
cml0ZSk7CiAJCWJyZWFrOwogCWNhc2UgUkVRX09QX1pPTkVfQVBQRU5EOgogCQlyZXQgPSBudm1l
X3NldHVwX3J3KG5zLCByZXEsIGNtZCwgbnZtZV9jbWRfem9uZV9hcHBlbmQpOwpAQCAtMTczMSw2
ICsxODExLDI2IEBAIHN0YXRpYyB2b2lkIG52bWVfY29uZmlnX2Rpc2NhcmQoc3RydWN0IGdlbmRp
c2sgKmRpc2ssIHN0cnVjdCBudm1lX25zICpucykKIAkJYmxrX3F1ZXVlX21heF93cml0ZV96ZXJv
ZXNfc2VjdG9ycyhxdWV1ZSwgVUlOVF9NQVgpOwogfQogCitzdGF0aWMgdm9pZCBudm1lX2NvbmZp
Z19jb3B5KHN0cnVjdCBnZW5kaXNrICpkaXNrLCBzdHJ1Y3QgbnZtZV9ucyAqbnMsCisJCQkJICAg
ICAgIHN0cnVjdCBudm1lX2lkX25zICppZCkKK3sKKwlzdHJ1Y3QgbnZtZV9jdHJsICpjdHJsID0g
bnMtPmN0cmw7CisJc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBkaXNrLT5xdWV1ZTsKKworCWlm
ICghKGN0cmwtPm9uY3MgJiBOVk1FX0NUUkxfT05DU19DT1BZKSkgeworCQlibGtfcXVldWVfbWF4
X2NvcHlfc2VjdG9yc19odyhxLCAwKTsKKwkJYmxrX3F1ZXVlX2ZsYWdfY2xlYXIoUVVFVUVfRkxB
R19DT1BZLCBxKTsKKwkJcmV0dXJuOworCX0KKworCS8qIHNldHRpbmcgY29weSBsaW1pdHMgKi8K
KwlpZiAoYmxrX3F1ZXVlX2ZsYWdfdGVzdF9hbmRfc2V0KFFVRVVFX0ZMQUdfQ09QWSwgcSkpCisJ
CXJldHVybjsKKworCWJsa19xdWV1ZV9tYXhfY29weV9zZWN0b3JzX2h3KHEsCisJCW52bWVfbGJh
X3RvX3NlY3QobnMsIGxlMTZfdG9fY3B1KGlkLT5tc3NybCkpKTsKK30KKwogc3RhdGljIGJvb2wg
bnZtZV9uc19pZHNfZXF1YWwoc3RydWN0IG52bWVfbnNfaWRzICphLCBzdHJ1Y3QgbnZtZV9uc19p
ZHMgKmIpCiB7CiAJcmV0dXJuIHV1aWRfZXF1YWwoJmEtPnV1aWQsICZiLT51dWlkKSAmJgpAQCAt
MTkzMCw2ICsyMDMwLDcgQEAgc3RhdGljIHZvaWQgbnZtZV91cGRhdGVfZGlza19pbmZvKHN0cnVj
dCBnZW5kaXNrICpkaXNrLAogCXNldF9jYXBhY2l0eV9hbmRfbm90aWZ5KGRpc2ssIGNhcGFjaXR5
KTsKIAogCW52bWVfY29uZmlnX2Rpc2NhcmQoZGlzaywgbnMpOworCW52bWVfY29uZmlnX2NvcHko
ZGlzaywgbnMsIGlkKTsKIAlibGtfcXVldWVfbWF4X3dyaXRlX3plcm9lc19zZWN0b3JzKGRpc2st
PnF1ZXVlLAogCQkJCQkgICBucy0+Y3RybC0+bWF4X3plcm9lc19zZWN0b3JzKTsKIH0KQEAgLTUz
MjMsNiArNTQyNCw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfbnZtZV9jaGVja19zaXplKHZvaWQp
CiAJQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgbnZtZV9kb3dubG9hZF9maXJtd2FyZSkgIT0g
NjQpOwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfZm9ybWF0X2NtZCkgIT0gNjQp
OwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfZHNtX2NtZCkgIT0gNjQpOworCUJV
SUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfY29weV9jb21tYW5kKSAhPSA2NCk7CiAJQlVJ
TERfQlVHX09OKHNpemVvZihzdHJ1Y3QgbnZtZV93cml0ZV96ZXJvZXNfY21kKSAhPSA2NCk7CiAJ
QlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgbnZtZV9hYm9ydF9jbWQpICE9IDY0KTsKIAlCVUlM
RF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBudm1lX2dldF9sb2dfcGFnZV9jb21tYW5kKSAhPSA2NCk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWUvaG9zdC9mYy5jIGIvZHJpdmVycy9udm1lL2hvc3Qv
ZmMuYwppbmRleCA0NTZlZTQyYTYxMzMuLjBlYzhmOWNkMGUwOSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9udm1lL2hvc3QvZmMuYworKysgYi9kcml2ZXJzL252bWUvaG9zdC9mYy5jCkBAIC0yODA3LDYg
KzI4MDcsMTEgQEAgbnZtZV9mY19xdWV1ZV9ycShzdHJ1Y3QgYmxrX21xX2h3X2N0eCAqaGN0eCwK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJaWYgKHVubGlrZWx5KChycS0+Y21kX2ZsYWdz
ICYgUkVRX0NPUFkpICYmCisJCQkJKHJlcV9vcChycSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQli
bGtfbXFfZW5kX3JlcXVlc3QocnEsIEJMS19TVFNfT0spOworCQlyZXR1cm4gQkxLX1NUU19PSzsK
Kwl9CiAJLyoKIAkgKiBudm1lIGNvcmUgZG9lc24ndCBxdWl0ZSB0cmVhdCB0aGUgcnEgb3BhcXVl
bHkuIENvbW1hbmRzIHN1Y2gKIAkgKiBhcyBXUklURSBaRVJPRVMgd2lsbCByZXR1cm4gYSBub24t
emVybyBycSBwYXlsb2FkX2J5dGVzIHlldApkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3Qv
bnZtZS5oIGIvZHJpdmVycy9udm1lL2hvc3QvbnZtZS5oCmluZGV4IDQyNGM4YTQ2N2EwYy4uNmUy
ODI5NTZkZWI0IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWUvaG9zdC9udm1lLmgKKysrIGIvZHJp
dmVycy9udm1lL2hvc3QvbnZtZS5oCkBAIC01MDAsNiArNTAwLDEzIEBAIHN0cnVjdCBudm1lX25z
IHsKIAogfTsKIAorc3RydWN0IG52bWVfY29weV90b2tlbiB7CisJY2hhciBzdWJzeXNbNF07CisJ
c3RydWN0IG52bWVfbnMgKm5zOworCXU2NCBzcmNfc2VjdG9yOworCXU2NCBzZWN0b3JzOworfTsK
KwogLyogTlZNZSBucyBzdXBwb3J0cyBtZXRhZGF0YSBhY3Rpb25zIGJ5IHRoZSBjb250cm9sbGVy
IChnZW5lcmF0ZS9zdHJpcCkgKi8KIHN0YXRpYyBpbmxpbmUgYm9vbCBudm1lX25zX2hhc19waShz
dHJ1Y3QgbnZtZV9ucyAqbnMpCiB7CmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWUvaG9zdC9wY2ku
YyBiL2RyaXZlcnMvbnZtZS9ob3N0L3BjaS5jCmluZGV4IDZkODhkZGQzNTU2NS4uMGIxZGM1YzQ1
N2FkIDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWUvaG9zdC9wY2kuYworKysgYi9kcml2ZXJzL252
bWUvaG9zdC9wY2kuYwpAQCAtNDk5LDE2ICs0OTksMTkgQEAgc3RhdGljIGlubGluZSB2b2lkIG52
bWVfc3FfY29weV9jbWQoc3RydWN0IG52bWVfcXVldWUgKm52bWVxLAogCQludm1lcS0+c3FfdGFp
bCA9IDA7CiB9CiAKLXN0YXRpYyB2b2lkIG52bWVfY29tbWl0X3JxcyhzdHJ1Y3QgYmxrX21xX2h3
X2N0eCAqaGN0eCkKK3N0YXRpYyBpbmxpbmUgdm9pZCBudm1lX2NvbW1pdF9zcV9kYihzdHJ1Y3Qg
bnZtZV9xdWV1ZSAqbnZtZXEpCiB7Ci0Jc3RydWN0IG52bWVfcXVldWUgKm52bWVxID0gaGN0eC0+
ZHJpdmVyX2RhdGE7Ci0KIAlzcGluX2xvY2soJm52bWVxLT5zcV9sb2NrKTsKIAlpZiAobnZtZXEt
PnNxX3RhaWwgIT0gbnZtZXEtPmxhc3Rfc3FfdGFpbCkKIAkJbnZtZV93cml0ZV9zcV9kYihudm1l
cSwgdHJ1ZSk7CiAJc3Bpbl91bmxvY2soJm52bWVxLT5zcV9sb2NrKTsKIH0KIAorc3RhdGljIHZv
aWQgbnZtZV9jb21taXRfcnFzKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4KQoreworCW52bWVf
Y29tbWl0X3NxX2RiKGhjdHgtPmRyaXZlcl9kYXRhKTsKK30KKwogc3RhdGljIHZvaWQgKipudm1l
X3BjaV9pb2RfbGlzdChzdHJ1Y3QgcmVxdWVzdCAqcmVxKQogewogCXN0cnVjdCBudm1lX2lvZCAq
aW9kID0gYmxrX21xX3JxX3RvX3BkdShyZXEpOwpAQCAtODk4LDYgKzkwMSwxMiBAQCBzdGF0aWMg
YmxrX3N0YXR1c190IG52bWVfcHJlcF9ycShzdHJ1Y3QgbnZtZV9kZXYgKmRldiwgc3RydWN0IHJl
cXVlc3QgKnJlcSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJaWYgKHVubGlrZWx5KChy
ZXEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSAmJgorCQkJCShyZXFfb3AocmVxKSA9PSBSRVFfT1Bf
UkVBRCkpKSB7CisJCWJsa19tcV9zdGFydF9yZXF1ZXN0KHJlcSk7CisJCXJldHVybiBCTEtfU1RT
X09LOworCX0KKwogCWlmIChibGtfcnFfbnJfcGh5c19zZWdtZW50cyhyZXEpKSB7CiAJCXJldCA9
IG52bWVfbWFwX2RhdGEoZGV2LCByZXEsICZpb2QtPmNtZCk7CiAJCWlmIChyZXQpCkBAIC05NDQs
NiArOTUzLDE4IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9xdWV1ZV9ycShzdHJ1Y3QgYmxr
X21xX2h3X2N0eCAqaGN0eCwKIAlyZXQgPSBudm1lX3ByZXBfcnEoZGV2LCByZXEpOwogCWlmICh1
bmxpa2VseShyZXQpKQogCQlyZXR1cm4gcmV0OworCWlmICh1bmxpa2VseSgocmVxLT5jbWRfZmxh
Z3MgJiBSRVFfQ09QWSkgJiYKKwkJCQkocmVxX29wKHJlcSkgPT0gUkVRX09QX1JFQUQpKSkgewor
CQlibGtfbXFfc2V0X3JlcXVlc3RfY29tcGxldGUocmVxKTsKKwkJYmxrX21xX2VuZF9yZXF1ZXN0
KHJlcSwgQkxLX1NUU19PSyk7CisJCS8qIENvbW1pdCB0aGUgc3EgaWYgY29weSByZWFkIHdhcyB0
aGUgbGFzdCByZXEgaW4gdGhlIGxpc3QsCisJCSAqIGFzIGNvcHkgcmVhZCBkZW9lc24ndCB1cGRh
dGUgc3EgZGIKKwkJICovCisJCWlmIChiZC0+bGFzdCkKKwkJCW52bWVfY29tbWl0X3NxX2RiKG52
bWVxKTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlzcGluX2xvY2soJm52bWVxLT5zcV9sb2NrKTsK
IAludm1lX3NxX2NvcHlfY21kKG52bWVxLCAmaW9kLT5jbWQpOwogCW52bWVfd3JpdGVfc3FfZGIo
bnZtZXEsIGJkLT5sYXN0KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L3JkbWEuYyBi
L2RyaXZlcnMvbnZtZS9ob3N0L3JkbWEuYwppbmRleCBiYmFkMjZiODJiNTYuLmE4YmYyYTg3ZjQy
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lL2hvc3QvcmRtYS5jCisrKyBiL2RyaXZlcnMvbnZt
ZS9ob3N0L3JkbWEuYwpAQCAtMjA0Myw2ICsyMDQzLDEzIEBAIHN0YXRpYyBibGtfc3RhdHVzX3Qg
bnZtZV9yZG1hX3F1ZXVlX3JxKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAogCiAJbnZtZV9z
dGFydF9yZXF1ZXN0KHJxKTsKIAorCWlmICh1bmxpa2VseSgocnEtPmNtZF9mbGFncyAmIFJFUV9D
T1BZKSAmJgorCQkJCShyZXFfb3AocnEpID09IFJFUV9PUF9SRUFEKSkpIHsKKwkJYmxrX21xX2Vu
ZF9yZXF1ZXN0KHJxLCBCTEtfU1RTX09LKTsKKwkJcmV0ID0gQkxLX1NUU19PSzsKKwkJZ290byB1
bm1hcF9xZTsKKwl9CisKIAlpZiAoSVNfRU5BQkxFRChDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFkp
ICYmCiAJICAgIHF1ZXVlLT5waV9zdXBwb3J0ICYmCiAJICAgIChjLT5jb21tb24ub3Bjb2RlID09
IG52bWVfY21kX3dyaXRlIHx8CmRpZmYgLS1naXQgYS9kcml2ZXJzL252bWUvaG9zdC90Y3AuYyBi
L2RyaXZlcnMvbnZtZS9ob3N0L3RjcC5jCmluZGV4IDhjZWRjMWVmNDk2Yy4uNzc2ZTJiYTg0OTEx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL252bWUvaG9zdC90Y3AuYworKysgYi9kcml2ZXJzL252bWUv
aG9zdC90Y3AuYwpAQCAtMjM0Niw2ICsyMzQ2LDExIEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZt
ZV90Y3Bfc2V0dXBfY21kX3BkdShzdHJ1Y3QgbnZtZV9ucyAqbnMsCiAJaWYgKHJldCkKIAkJcmV0
dXJuIHJldDsKIAorCWlmICh1bmxpa2VseSgocnEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSAmJgor
CQkJCShyZXFfb3AocnEpID09IFJFUV9PUF9SRUFEKSkpIHsKKwkJcmV0dXJuIEJMS19TVFNfT0s7
CisJfQorCiAJcmVxLT5zdGF0ZSA9IE5WTUVfVENQX1NFTkRfQ01EX1BEVTsKIAlyZXEtPnN0YXR1
cyA9IGNwdV90b19sZTE2KE5WTUVfU0NfU1VDQ0VTUyk7CiAJcmVxLT5vZmZzZXQgPSAwOwpAQCAt
MjQxNCw2ICsyNDE5LDE3IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV90Y3BfcXVldWVfcnEo
c3RydWN0IGJsa19tcV9od19jdHggKmhjdHgsCiAKIAludm1lX3N0YXJ0X3JlcXVlc3QocnEpOwog
CisJaWYgKHVubGlrZWx5KChycS0+Y21kX2ZsYWdzICYgUkVRX0NPUFkpICYmCisJCQkJKHJlcV9v
cChycSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfc2V0X3JlcXVlc3RfY29tcGxldGUo
cnEpOworCQlibGtfbXFfZW5kX3JlcXVlc3QocnEsIEJMS19TVFNfT0spOworCQkvKiBpZiBjb3B5
IHJlYWQgaXMgdGhlIGxhc3QgcmVxIHF1ZXVlIHRjcCByZXFzICovCisJCWlmIChiZC0+bGFzdCAm
JiBudm1lX3RjcF9xdWV1ZV9tb3JlKHF1ZXVlKSkKKwkJCXF1ZXVlX3dvcmtfb24ocXVldWUtPmlv
X2NwdSwgbnZtZV90Y3Bfd3EsCisJCQkJCSZxdWV1ZS0+aW9fd29yayk7CisJCXJldHVybiByZXQ7
CisJfQorCiAJbnZtZV90Y3BfcXVldWVfcmVxdWVzdChyZXEsIHRydWUsIGJkLT5sYXN0KTsKIAog
CXJldHVybiBCTEtfU1RTX09LOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3QvdHJhY2Uu
YyBiL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNlLmMKaW5kZXggMWMzNmZjZWRlYTIwLi5kYTRhNzQ5
NGU1YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNlLmMKKysrIGIvZHJpdmVy
cy9udm1lL2hvc3QvdHJhY2UuYwpAQCAtMTUwLDYgKzE1MCwyMyBAQCBzdGF0aWMgY29uc3QgY2hh
ciAqbnZtZV90cmFjZV9yZWFkX3dyaXRlKHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkK
IAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgY29uc3QgY2hhciAqbnZtZV90cmFjZV9jb3B5KHN0
cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkKK3sKKwljb25zdCBjaGFyICpyZXQgPSB0cmFj
ZV9zZXFfYnVmZmVyX3B0cihwKTsKKwl1NjQgc2xiYSA9IGdldF91bmFsaWduZWRfbGU2NChjZHcx
MCk7CisJdTggbnJfcmFuZ2UgPSBnZXRfdW5hbGlnbmVkX2xlMTYoY2R3MTAgKyA4KTsKKwl1MTYg
Y29udHJvbCA9IGdldF91bmFsaWduZWRfbGUxNihjZHcxMCArIDEwKTsKKwl1MzIgZHNtZ210ID0g
Z2V0X3VuYWxpZ25lZF9sZTMyKGNkdzEwICsgMTIpOworCXUzMiByZWZ0YWcgPSBnZXRfdW5hbGln
bmVkX2xlMzIoY2R3MTAgKyAgMTYpOworCisJdHJhY2Vfc2VxX3ByaW50ZihwLAorCQkJICJzbGJh
PSVsbHUsIG5yX3JhbmdlPSV1LCBjdHJsPTB4JXgsIGRzbWdtdD0ldSwgcmVmdGFnPSV1IiwKKwkJ
CSBzbGJhLCBucl9yYW5nZSwgY29udHJvbCwgZHNtZ210LCByZWZ0YWcpOworCXRyYWNlX3NlcV9w
dXRjKHAsIDApOworCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IGNoYXIgKm52bWVf
dHJhY2VfZHNtKHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkKIHsKIAljb25zdCBjaGFy
ICpyZXQgPSB0cmFjZV9zZXFfYnVmZmVyX3B0cihwKTsKQEAgLTI0Myw2ICsyNjAsOCBAQCBjb25z
dCBjaGFyICpudm1lX3RyYWNlX3BhcnNlX252bV9jbWQoc3RydWN0IHRyYWNlX3NlcSAqcCwKIAkJ
cmV0dXJuIG52bWVfdHJhY2Vfem9uZV9tZ210X3NlbmQocCwgY2R3MTApOwogCWNhc2UgbnZtZV9j
bWRfem9uZV9tZ210X3JlY3Y6CiAJCXJldHVybiBudm1lX3RyYWNlX3pvbmVfbWdtdF9yZWN2KHAs
IGNkdzEwKTsKKwljYXNlIG52bWVfY21kX2NvcHk6CisJCXJldHVybiBudm1lX3RyYWNlX2NvcHko
cCwgY2R3MTApOwogCWRlZmF1bHQ6CiAJCXJldHVybiBudm1lX3RyYWNlX2NvbW1vbihwLCBjZHcx
MCk7CiAJfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lLmggYi9pbmNsdWRlL2xpbnV4
L252bWUuaAppbmRleCA0ZmFkNGFhMjQ1ZmIuLmU5MmRkNjljNzQ1YSAxMDA2NDQKLS0tIGEvaW5j
bHVkZS9saW51eC9udm1lLmgKKysrIGIvaW5jbHVkZS9saW51eC9udm1lLmgKQEAgLTMzNyw3ICsz
MzcsNyBAQCBzdHJ1Y3QgbnZtZV9pZF9jdHJsIHsKIAlfX3U4CQkJbnZzY2M7CiAJX191OAkJCW53
cGM7CiAJX19sZTE2CQkJYWN3dTsKLQlfX3U4CQkJcnN2ZDUzNFsyXTsKKwlfX2xlMTYJCQlvY2Zz
OwogCV9fbGUzMgkJCXNnbHM7CiAJX19sZTMyCQkJbW5hbjsKIAlfX3U4CQkJcnN2ZDU0NFsyMjRd
OwpAQCAtMzY1LDYgKzM2NSw3IEBAIGVudW0gewogCU5WTUVfQ1RSTF9PTkNTX1dSSVRFX1pFUk9F
UwkJPSAxIDw8IDMsCiAJTlZNRV9DVFJMX09OQ1NfUkVTRVJWQVRJT05TCQk9IDEgPDwgNSwKIAlO
Vk1FX0NUUkxfT05DU19USU1FU1RBTVAJCT0gMSA8PCA2LAorCU5WTUVfQ1RSTF9PTkNTX0NPUFkJ
CQk9IDEgPDwgOCwKIAlOVk1FX0NUUkxfVldDX1BSRVNFTlQJCQk9IDEgPDwgMCwKIAlOVk1FX0NU
UkxfT0FDU19TRUNfU1VQUCAgICAgICAgICAgICAgICAgPSAxIDw8IDAsCiAJTlZNRV9DVFJMX09B
Q1NfTlNfTU5HVF9TVVBQCQk9IDEgPDwgMywKQEAgLTQxNCw3ICs0MTUsMTAgQEAgc3RydWN0IG52
bWVfaWRfbnMgewogCV9fbGUxNgkJCW5wZGc7CiAJX19sZTE2CQkJbnBkYTsKIAlfX2xlMTYJCQlu
b3dzOwotCV9fdTgJCQlyc3ZkNzRbMThdOworCV9fbGUxNgkJCW1zc3JsOworCV9fbGUzMgkJCW1j
bDsKKwlfX3U4CQkJbXNyYzsKKwlfX3U4CQkJcnN2ZDkxWzExXTsKIAlfX2xlMzIJCQlhbmFncnBp
ZDsKIAlfX3U4CQkJcnN2ZDk2WzNdOwogCV9fdTgJCQluc2F0dHI7CkBAIC03OTYsNiArODAwLDcg
QEAgZW51bSBudm1lX29wY29kZSB7CiAJbnZtZV9jbWRfcmVzdl9yZXBvcnQJPSAweDBlLAogCW52
bWVfY21kX3Jlc3ZfYWNxdWlyZQk9IDB4MTEsCiAJbnZtZV9jbWRfcmVzdl9yZWxlYXNlCT0gMHgx
NSwKKwludm1lX2NtZF9jb3B5CQk9IDB4MTksCiAJbnZtZV9jbWRfem9uZV9tZ210X3NlbmQJPSAw
eDc5LAogCW52bWVfY21kX3pvbmVfbWdtdF9yZWN2CT0gMHg3YSwKIAludm1lX2NtZF96b25lX2Fw
cGVuZAk9IDB4N2QsCkBAIC04MTgsNyArODIzLDggQEAgZW51bSBudm1lX29wY29kZSB7CiAJCW52
bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfcmVzdl9yZWxlYXNlKSwJXAogCQludm1lX29wY29kZV9u
YW1lKG52bWVfY21kX3pvbmVfbWdtdF9zZW5kKSwJXAogCQludm1lX29wY29kZV9uYW1lKG52bWVf
Y21kX3pvbmVfbWdtdF9yZWN2KSwJXAotCQludm1lX29wY29kZV9uYW1lKG52bWVfY21kX3pvbmVf
YXBwZW5kKSkKKwkJbnZtZV9vcGNvZGVfbmFtZShudm1lX2NtZF96b25lX2FwcGVuZCksCQlcCisJ
CW52bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfY29weSkpCiAKIAogCkBAIC05OTUsNiArMTAwMSwz
NiBAQCBzdHJ1Y3QgbnZtZV9kc21fcmFuZ2UgewogCV9fbGU2NAkJCXNsYmE7CiB9OwogCitzdHJ1
Y3QgbnZtZV9jb3B5X2NvbW1hbmQgeworCV9fdTggICAgICAgICAgICAgICAgICAgIG9wY29kZTsK
KwlfX3U4ICAgICAgICAgICAgICAgICAgICBmbGFnczsKKwlfX3UxNiAgICAgICAgICAgICAgICAg
ICBjb21tYW5kX2lkOworCV9fbGUzMiAgICAgICAgICAgICAgICAgIG5zaWQ7CisJX191NjQgICAg
ICAgICAgICAgICAgICAgcnN2ZDI7CisJX19sZTY0ICAgICAgICAgICAgICAgICAgbWV0YWRhdGE7
CisJdW5pb24gbnZtZV9kYXRhX3B0ciAgICAgZHB0cjsKKwlfX2xlNjQgICAgICAgICAgICAgICAg
ICBzZGxiYTsKKwlfX3U4CQkJbnJfcmFuZ2U7CisJX191OAkJCXJzdmQxMjsKKwlfX2xlMTYgICAg
ICAgICAgICAgICAgICBjb250cm9sOworCV9fbGUxNiAgICAgICAgICAgICAgICAgIHJzdmQxMzsK
KwlfX2xlMTYJCQlkc3BlYzsKKwlfX2xlMzIgICAgICAgICAgICAgICAgICBpbGJydDsKKwlfX2xl
MTYgICAgICAgICAgICAgICAgICBsYmF0OworCV9fbGUxNiAgICAgICAgICAgICAgICAgIGxiYXRt
OworfTsKKworc3RydWN0IG52bWVfY29weV9yYW5nZSB7CisJX19sZTY0CQkJcnN2ZDA7CisJX19s
ZTY0CQkJc2xiYTsKKwlfX2xlMTYJCQlubGI7CisJX19sZTE2CQkJcnN2ZDE4OworCV9fbGUzMgkJ
CXJzdmQyMDsKKwlfX2xlMzIJCQllaWxicnQ7CisJX19sZTE2CQkJZWxiYXQ7CisJX19sZTE2CQkJ
ZWxiYXRtOworfTsKKwogc3RydWN0IG52bWVfd3JpdGVfemVyb2VzX2NtZCB7CiAJX191OAkJCW9w
Y29kZTsKIAlfX3U4CQkJZmxhZ3M7CkBAIC0xNzUyLDYgKzE3ODgsNyBAQCBzdHJ1Y3QgbnZtZV9j
b21tYW5kIHsKIAkJc3RydWN0IG52bWVfZG93bmxvYWRfZmlybXdhcmUgZGxmdzsKIAkJc3RydWN0
IG52bWVfZm9ybWF0X2NtZCBmb3JtYXQ7CiAJCXN0cnVjdCBudm1lX2RzbV9jbWQgZHNtOworCQlz
dHJ1Y3QgbnZtZV9jb3B5X2NvbW1hbmQgY29weTsKIAkJc3RydWN0IG52bWVfd3JpdGVfemVyb2Vz
X2NtZCB3cml0ZV96ZXJvZXM7CiAJCXN0cnVjdCBudm1lX3pvbmVfbWdtdF9zZW5kX2NtZCB6bXM7
CiAJCXN0cnVjdCBudm1lX3pvbmVfbWdtdF9yZWN2X2NtZCB6bXI7Ci0tIAoyLjM1LjEuNTAwLmdi
ODk2ZjcyOWUyCgotLQpkbS1kZXZlbCBtYWlsaW5nIGxpc3QKZG0tZGV2ZWxAcmVkaGF0LmNvbQpo
dHRwczovL2xpc3RtYW4ucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RtLWRldmVsCg==

