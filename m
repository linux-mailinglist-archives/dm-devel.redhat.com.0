Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 008CC635270
	for <lists+dm-devel@lfdr.de>; Wed, 23 Nov 2022 09:26:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1669191971;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=V8tGs7kAroQUyoaity9QzJLMgjI4WadUtMRDCUOuHlA=;
	b=DCrSSkHhyjDGX43HYYNBdfFY5f3v7Xc9pWOhkvkn2kUJ4+KpjK3KFy269U+B8dU75H8wdm
	nV8Fx0jaTfWJUb3VxsQP0OdnANZ7M6BSdKSALImAZHpHQ0SsRi+TSSTGIrIV+uxEasdvMQ
	VJCMcRRPaIOvb1DOZwMmFU53oN1QVxM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-gZl5KJWZPbWX4SSoKD2PTg-1; Wed, 23 Nov 2022 03:26:05 -0500
X-MC-Unique: gZl5KJWZPbWX4SSoKD2PTg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DA083833B00;
	Wed, 23 Nov 2022 08:26:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C7D791400C3A;
	Wed, 23 Nov 2022 08:25:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A8DFD1946A40;
	Wed, 23 Nov 2022 08:25:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 290881946587
 for <dm-devel@listman.corp.redhat.com>; Wed, 23 Nov 2022 06:21:20 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F3307200B40B; Wed, 23 Nov 2022 06:21:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAC0A2027062
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:19 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C76FE800B23
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:21:19 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-JztfIK23OfWzz0S-9bSaFQ-1; Wed, 23 Nov 2022 01:21:18 -0500
X-MC-Unique: JztfIK23OfWzz0S-9bSaFQ-1
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20221123061330epoutp04c9f5827670c97eaa8eae5af85850ca59~qIgOkznGt2231722317epoutp04i
 for <dm-devel@redhat.com>; Wed, 23 Nov 2022 06:13:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20221123061330epoutp04c9f5827670c97eaa8eae5af85850ca59~qIgOkznGt2231722317epoutp04i
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20221123061330epcas5p3a3dc532a95135f8efcab3c1d537a55b1~qIgN8Kw_U1162011620epcas5p3G;
 Wed, 23 Nov 2022 06:13:30 +0000 (GMT)
Received: from epsmges5p1new.samsung.com (unknown [182.195.38.181]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4NH9mS0rXMz4x9Pv; Wed, 23 Nov
 2022 06:13:28 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 18.81.01710.70ABD736; Wed, 23 Nov 2022 15:13:27 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20221123061028epcas5p1aecd27b2f4f694b5a18b51d3df5d7432~qIdkRaBU-1477114771epcas5p1z;
 Wed, 23 Nov 2022 06:10:28 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221123061028epsmtrp1cfd31646264591325c4f7ace998d2661~qIdkQSnO71958719587epsmtrp1L;
 Wed, 23 Nov 2022 06:10:28 +0000 (GMT)
X-AuditID: b6c32a49-c9ffa700000006ae-c6-637dba07ebd0
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 8F.B2.18644.359BD736; Wed, 23 Nov 2022 15:10:27 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221123061024epsmtip1eee71df6bc660545a51ff2a4c5239c0e~qIdhOmlWl2539625396epsmtip1b;
 Wed, 23 Nov 2022 06:10:24 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: axboe@kernel.dk, agk@redhat.com, snitzer@kernel.org,
 dm-devel@redhat.com, kbusch@kernel.org, hch@lst.de, sagi@grimberg.me,
 james.smart@broadcom.com, kch@nvidia.com, damien.lemoal@opensource.wdc.com,
 naohiro.aota@wdc.com, jth@kernel.org, viro@zeniv.linux.org.uk
Date: Wed, 23 Nov 2022 11:28:22 +0530
Message-Id: <20221123055827.26996-6-nj.shetty@samsung.com>
In-Reply-To: <20221123055827.26996-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01TfVCTdRy/3/OMZ8MOexh6/liWu3FwBwZstM0fCKYX1YNxF6HXm+xwN57G
 67bbS1CHJ+jQwtgQy3Ikg8sMMaE24mWA0IgQFNEz5BhvlqwDEwzRMJBo44Hyv8/3+/18vi+f
 3/04OPcTNo+TodLTWpU8W0CsYzV0hoaGsx0HFEJnjwTV9f6Mo0OlSzg6P2om0GJfP47aZsp9
 0FBHM4bOne/CUEvVLIZuj8yxUdfyNIF+feBioTLnTYDcAxYMtbm2ota2Hha64fiSQNazbjY6
 3m33QU0ThQA1LFpxNPe1kY1q/7jHQpdcz6D+pW6fnZCyjPcRVLNllE31j33Pom70GShbzccE
 ZT9zkGoZKiCoksMzHkLRuA917+IAQZnqawA1Z3uOOtpxDKNsE9NY0vp3s2LTaXkareXTKoU6
 LUOljBO8tif1pVSJVCgKF0WjbQK+Sp5DxwniE5PCX8nI9pgg4L8vzzZ4UklynU4QuSNWqzbo
 aX66WqePE9CatGyNWBOhk+foDCplhIrWx4iEwiiJh7g/K720YYytKdPljUxbWQXALCsGvhxI
 iqGtYZBdDNZxuGQLgJfO9ONMcB9A9+dzgAnmAPyp8RtiTTLdObIqcQBouXV2pcAlizBYP6ws
 BhwOQW6Fl5c5Xs4G0oTBj1o6cC8HJ4cx2NMW7MUBJIJDj2d8vJhFBsPb9mW2F/uRMdBxbRjz
 9oFkJDSP+3vTvuR2eOW6A2Mo/rDn1ASLabkFHv6hfGVrSDb6wqVFM5vRxsPvZmOYnQPgne56
 NoN5cMp8ZBXnwnOfVhOM1ui5ZdACmMKLsKjXjHv74GQorHNEMuln4We9tRgzdz0sWZzAmLwf
 bKpYw0Hw27rKVa8C4c35QoJZh4J9lRzGNhOAhb1ToBTwLU+cY3niHMv/kysBXgMCaY0uR0nr
 JBqRis79740V6hwbWPkWYQlNYPTWnxFOgHGAE0AOLtjgdzAhX8H1S5N/8CGtVadqDdm0zgkk
 HruP47yNCrXnX6n0qSJxtFAslUrF0S9IRYJNfl99Eabgkkq5ns6iaQ2tXdNhHF9eAcZpfyPx
 rbjG+hN7fhNN5O2az6991SJ9qi/o4UjCUbWF5+rowoy04OlTwseuSXem6YCc+/f1hZroaVL2
 tuxywpEi/pZjFfYTVe3VUXubHlSPRfCXeXVRCwspsdfuxtvbg/8yLwWoePMyWGJ2t+a7C8o3
 X60wslo2K990lJw0/WI/eXry+ZhGSwgYm4pMNAw25V280r2pfd5dnvRPjPXqdmLf7vRZu/gd
 Wag5RLmv8cLQIfvv9yVlxgspKCj54c69mcbAwrTobftzJa13QfLr4e3CIIsrcKDqToirLYWU
 YbmzptOZya1iedmul52PrDves+bwNtoeTf6I3BnNmRr/zt0Cli5dLgrDtTr5v/87K+2fBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBIsWRmVeSWpSXmKPExsWy7bCSnG7wztpkg6atNhbrTx1jtmia8JfZ
 YvXdfjaL32fPM1vsfTeb1eLmgZ1MFitXH2Wy2L3wI5PF4zuf2S2O/n/LZvHwyy0Wi0mHrjFa
 PL06i8li7y1tiz17T7JYXN41h81i/rKn7BYTj29mtdjxpJHRYtvv+cwWn5e2sFuse/2exeLE
 LWmL83+PszpIeMy6f5bNY+esu+we5+9tZPG4fLbUY9OqTjaPzUvqPXbfbGDz6G1+B1TQep/V
 4/2+q2wefVtWMXp83iTn0X6gm8lj05O3TAF8UVw2Kak5mWWpRfp2CVwZE7bdYy+YVFxx5+18
 lgbG/tguRk4OCQETibeH77B3MXJxCAnsYJT4/2MeO0RCUmLZ3yPMELawxMp/z8HiQgLNTBIz
 m0K6GDk42AS0JU7/5wDpFRFYwCRx+d4rsHpmgadMEmefeIPYwgIWEjf/vGMFsVkEVCUeb/4P
 NodXwEpi14XbTCBzJAT0JfrvC4KEOQWsJc5c3AUWFgIq2bNMB6JaUOLkzCcsIGFmAXWJ9fOE
 IBbJSzRvnc08gVFwFpKqWQhVs5BULWBkXsUomVpQnJueW2xYYJSXWq5XnJhbXJqXrpecn7uJ
 ERz5Wlo7GPes+qB3iJGJg/EQowQHs5IIb71nTbIQb0piZVVqUX58UWlOavEhRmkOFiVx3gtd
 J+OFBNITS1KzU1MLUotgskwcnFINTIZ8oWoe2v5LCop/WpVFu/H6NCZt7lXuao+V8nkZ0HZ/
 w9t96qlLeS3rjU6far4dvW3hR8e5UqzCP8x/njtUI9Dfk1jWV/Oqpztvav8pldDEEz/6zx/d
 OmX6HmdD0eeanwQyz5jdTNN8YP2+q2avXneV/oxPOkFhCa83v9378ZG86/q8X36THgmmiFvf
 uHPr7+tffxM5fL9E7SpfP9HtgOds+/Nek1seF1469v9Xh2uJ863+4LjTR+z9JutlP6pfvsu+
 8LTdhUWWXb+z/L+niF+fpvziWFXs3KUvD31a5reud5GrscfppZcCFu0v3edty8px+ZL7Te7N
 m5uVrF1X7rqwc8NfR9EzXDd4LSJPNyqxFGckGmoxFxUnAgBsRPyUawMAAA==
X-CMS-MailID: 20221123061028epcas5p1aecd27b2f4f694b5a18b51d3df5d7432
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20221123061028epcas5p1aecd27b2f4f694b5a18b51d3df5d7432
References: <20221123055827.26996-1-nj.shetty@samsung.com>
 <CGME20221123061028epcas5p1aecd27b2f4f694b5a18b51d3df5d7432@epcas5p1.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mailman-Approved-At: Wed, 23 Nov 2022 08:25:56 +0000
Subject: [dm-devel] [PATCH v5 05/10] nvme: add copy offload support
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
Cc: p.raghav@samsung.com, joshi.k@samsung.com, gost.dev@samsung.com,
 anuj20.g@samsung.com, linux-kernel@vger.kernel.org,
 linux-nvme@lists.infradead.org, Nitesh Shetty <nj.shetty@samsung.com>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Javier=20Gonz=C3=A1lez?= <javier.gonz@samsung.com>,
 nitheshshetty@gmail.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
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
c3QvY29yZS5jICB8IDEwNiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQog
ZHJpdmVycy9udm1lL2hvc3QvZmMuYyAgICB8ICAgNSArKwogZHJpdmVycy9udm1lL2hvc3QvbnZt
ZS5oICB8ICAgNyArKysKIGRyaXZlcnMvbnZtZS9ob3N0L3BjaS5jICAgfCAgMjggKysrKysrKyst
LQogZHJpdmVycy9udm1lL2hvc3QvcmRtYS5jICB8ICAgNyArKysKIGRyaXZlcnMvbnZtZS9ob3N0
L3RjcC5jICAgfCAgMTYgKysrKysrCiBkcml2ZXJzL252bWUvaG9zdC90cmFjZS5jIHwgIDE5ICsr
KysrKysKIGluY2x1ZGUvbGludXgvbnZtZS5oICAgICAgfCAgNDMgKysrKysrKysrKysrKystLQog
OCBmaWxlcyBjaGFuZ2VkLCAyMjMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL252bWUvaG9zdC9jb3JlLmMgYi9kcml2ZXJzL252bWUvaG9zdC9jb3Jl
LmMKaW5kZXggNDQyM2NjZDBiMGIxLi4yNmNlNDgyYWMxMTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
bnZtZS9ob3N0L2NvcmUuYworKysgYi9kcml2ZXJzL252bWUvaG9zdC9jb3JlLmMKQEAgLTc1MSw2
ICs3NTEsODAgQEAgc3RhdGljIGlubGluZSB2b2lkIG52bWVfc2V0dXBfZmx1c2goc3RydWN0IG52
bWVfbnMgKm5zLAogCWNtbmQtPmNvbW1vbi5uc2lkID0gY3B1X3RvX2xlMzIobnMtPmhlYWQtPm5z
X2lkKTsKIH0KIAorc3RhdGljIGlubGluZSBibGtfc3RhdHVzX3QgbnZtZV9zZXR1cF9jb3B5X3Jl
YWQoc3RydWN0IG52bWVfbnMgKm5zLAorCQlzdHJ1Y3QgcmVxdWVzdCAqcmVxKQoreworCXN0cnVj
dCBiaW8gKmJpbyA9IHJlcS0+YmlvOworCXN0cnVjdCBudm1lX2NvcHlfdG9rZW4gKnRva2VuID0g
YnZlY19rbWFwX2xvY2FsKCZiaW8tPmJpX2lvX3ZlY1swXSk7CisKKwltZW1jcHkodG9rZW4tPnN1
YnN5cywgIm52bWUiLCA0KTsKKwl0b2tlbi0+bnMgPSBuczsKKwl0b2tlbi0+c3JjX3NlY3RvciA9
IGJpby0+YmlfaXRlci5iaV9zZWN0b3I7CisJdG9rZW4tPnNlY3RvcnMgPSBiaW8tPmJpX2l0ZXIu
Ymlfc2l6ZSA+PiA5OworCisJcmV0dXJuIEJMS19TVFNfT0s7Cit9CisKK3N0YXRpYyBpbmxpbmUg
YmxrX3N0YXR1c190IG52bWVfc2V0dXBfY29weV93cml0ZShzdHJ1Y3QgbnZtZV9ucyAqbnMsCisJ
ICAgICAgIHN0cnVjdCByZXF1ZXN0ICpyZXEsIHN0cnVjdCBudm1lX2NvbW1hbmQgKmNtbmQpCit7
CisJc3RydWN0IG52bWVfY29weV9yYW5nZSAqcmFuZ2UgPSBOVUxMOworCXN0cnVjdCBiaW8gKmJp
byA9IHJlcS0+YmlvOworCXN0cnVjdCBudm1lX2NvcHlfdG9rZW4gKnRva2VuID0gYnZlY19rbWFw
X2xvY2FsKCZiaW8tPmJpX2lvX3ZlY1swXSk7CisJc2VjdG9yX3Qgc3JjX3NlY3RvciwgZHN0X3Nl
Y3Rvciwgbl9zZWN0b3JzOworCXU2NCBzcmNfbGJhLCBkc3RfbGJhLCBuX2xiYTsKKwl1bnNpZ25l
ZCBzaG9ydCBucl9yYW5nZSA9IDE7CisJdTE2IGNvbnRyb2wgPSAwOworCisJaWYgKHVubGlrZWx5
KG1lbWNtcCh0b2tlbi0+c3Vic3lzLCAibnZtZSIsIDQpKSkKKwkJcmV0dXJuIEJMS19TVFNfTk9U
U1VQUDsKKwlpZiAodW5saWtlbHkodG9rZW4tPm5zICE9IG5zKSkKKwkJcmV0dXJuIEJMS19TVFNf
Tk9UU1VQUDsKKworCXNyY19zZWN0b3IgPSB0b2tlbi0+c3JjX3NlY3RvcjsKKwlkc3Rfc2VjdG9y
ID0gYmlvLT5iaV9pdGVyLmJpX3NlY3RvcjsKKwluX3NlY3RvcnMgPSB0b2tlbi0+c2VjdG9yczsK
KwlpZiAoV0FSTl9PTihuX3NlY3RvcnMgIT0gYmlvLT5iaV9pdGVyLmJpX3NpemUgPj4gOSkpCisJ
CXJldHVybiBCTEtfU1RTX05PVFNVUFA7CisKKwlzcmNfbGJhID0gbnZtZV9zZWN0X3RvX2xiYShu
cywgc3JjX3NlY3Rvcik7CisJZHN0X2xiYSA9IG52bWVfc2VjdF90b19sYmEobnMsIGRzdF9zZWN0
b3IpOworCW5fbGJhID0gbnZtZV9zZWN0X3RvX2xiYShucywgbl9zZWN0b3JzKTsKKworCWlmIChX
QVJOX09OKCFuX2xiYSkpCisJCXJldHVybiBCTEtfU1RTX05PVFNVUFA7CisKKwlpZiAocmVxLT5j
bWRfZmxhZ3MgJiBSRVFfRlVBKQorCQljb250cm9sIHw9IE5WTUVfUldfRlVBOworCisJaWYgKHJl
cS0+Y21kX2ZsYWdzICYgUkVRX0ZBSUxGQVNUX0RFVikKKwkJY29udHJvbCB8PSBOVk1FX1JXX0xS
OworCisJbWVtc2V0KGNtbmQsIDAsIHNpemVvZigqY21uZCkpOworCWNtbmQtPmNvcHkub3Bjb2Rl
ID0gbnZtZV9jbWRfY29weTsKKwljbW5kLT5jb3B5Lm5zaWQgPSBjcHVfdG9fbGUzMihucy0+aGVh
ZC0+bnNfaWQpOworCWNtbmQtPmNvcHkuc2RsYmEgPSBjcHVfdG9fbGU2NChkc3RfbGJhKTsKKwor
CXJhbmdlID0ga21hbGxvY19hcnJheShucl9yYW5nZSwgc2l6ZW9mKCpyYW5nZSksCisJCQlHRlBf
QVRPTUlDIHwgX19HRlBfTk9XQVJOKTsKKwlpZiAoIXJhbmdlKQorCQlyZXR1cm4gQkxLX1NUU19S
RVNPVVJDRTsKKworCXJhbmdlWzBdLnNsYmEgPSBjcHVfdG9fbGU2NChzcmNfbGJhKTsKKwlyYW5n
ZVswXS5ubGIgPSBjcHVfdG9fbGUxNihuX2xiYSAtIDEpOworCisJY21uZC0+Y29weS5ucl9yYW5n
ZSA9IDA7CisKKwlyZXEtPnNwZWNpYWxfdmVjLmJ2X3BhZ2UgPSB2aXJ0X3RvX3BhZ2UocmFuZ2Up
OworCXJlcS0+c3BlY2lhbF92ZWMuYnZfb2Zmc2V0ID0gb2Zmc2V0X2luX3BhZ2UocmFuZ2UpOwor
CXJlcS0+c3BlY2lhbF92ZWMuYnZfbGVuID0gc2l6ZW9mKCpyYW5nZSkgKiBucl9yYW5nZTsKKwly
ZXEtPnJxX2ZsYWdzIHw9IFJRRl9TUEVDSUFMX1BBWUxPQUQ7CisKKwljbW5kLT5jb3B5LmNvbnRy
b2wgPSBjcHVfdG9fbGUxNihjb250cm9sKTsKKworCXJldHVybiBCTEtfU1RTX09LOworfQorCiBz
dGF0aWMgYmxrX3N0YXR1c190IG52bWVfc2V0dXBfZGlzY2FyZChzdHJ1Y3QgbnZtZV9ucyAqbnMs
IHN0cnVjdCByZXF1ZXN0ICpyZXEsCiAJCXN0cnVjdCBudm1lX2NvbW1hbmQgKmNtbmQpCiB7CkBA
IC05NzQsMTAgKzEwNDgsMTYgQEAgYmxrX3N0YXR1c190IG52bWVfc2V0dXBfY21kKHN0cnVjdCBu
dm1lX25zICpucywgc3RydWN0IHJlcXVlc3QgKnJlcSkKIAkJcmV0ID0gbnZtZV9zZXR1cF9kaXNj
YXJkKG5zLCByZXEsIGNtZCk7CiAJCWJyZWFrOwogCWNhc2UgUkVRX09QX1JFQUQ6Ci0JCXJldCA9
IG52bWVfc2V0dXBfcncobnMsIHJlcSwgY21kLCBudm1lX2NtZF9yZWFkKTsKKwkJaWYgKHVubGlr
ZWx5KHJlcS0+Y21kX2ZsYWdzICYgUkVRX0NPUFkpKQorCQkJcmV0ID0gbnZtZV9zZXR1cF9jb3B5
X3JlYWQobnMsIHJlcSk7CisJCWVsc2UKKwkJCXJldCA9IG52bWVfc2V0dXBfcncobnMsIHJlcSwg
Y21kLCBudm1lX2NtZF9yZWFkKTsKIAkJYnJlYWs7CiAJY2FzZSBSRVFfT1BfV1JJVEU6Ci0JCXJl
dCA9IG52bWVfc2V0dXBfcncobnMsIHJlcSwgY21kLCBudm1lX2NtZF93cml0ZSk7CisJCWlmICh1
bmxpa2VseShyZXEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSkKKwkJCXJldCA9IG52bWVfc2V0dXBf
Y29weV93cml0ZShucywgcmVxLCBjbWQpOworCQllbHNlCisJCQlyZXQgPSBudm1lX3NldHVwX3J3
KG5zLCByZXEsIGNtZCwgbnZtZV9jbWRfd3JpdGUpOwogCQlicmVhazsKIAljYXNlIFJFUV9PUF9a
T05FX0FQUEVORDoKIAkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVxLCBjbWQsIG52bWVfY21k
X3pvbmVfYXBwZW5kKTsKQEAgLTE3MDQsNiArMTc4NCwyNiBAQCBzdGF0aWMgdm9pZCBudm1lX2Nv
bmZpZ19kaXNjYXJkKHN0cnVjdCBnZW5kaXNrICpkaXNrLCBzdHJ1Y3QgbnZtZV9ucyAqbnMpCiAJ
CWJsa19xdWV1ZV9tYXhfd3JpdGVfemVyb2VzX3NlY3RvcnMocXVldWUsIFVJTlRfTUFYKTsKIH0K
IAorc3RhdGljIHZvaWQgbnZtZV9jb25maWdfY29weShzdHJ1Y3QgZ2VuZGlzayAqZGlzaywgc3Ry
dWN0IG52bWVfbnMgKm5zLAorCQkJCSAgICAgICBzdHJ1Y3QgbnZtZV9pZF9ucyAqaWQpCit7CisJ
c3RydWN0IG52bWVfY3RybCAqY3RybCA9IG5zLT5jdHJsOworCXN0cnVjdCByZXF1ZXN0X3F1ZXVl
ICpxID0gZGlzay0+cXVldWU7CisKKwlpZiAoIShjdHJsLT5vbmNzICYgTlZNRV9DVFJMX09OQ1Nf
Q09QWSkpIHsKKwkJYmxrX3F1ZXVlX21heF9jb3B5X3NlY3RvcnNfaHcocSwgMCk7CisJCWJsa19x
dWV1ZV9mbGFnX2NsZWFyKFFVRVVFX0ZMQUdfQ09QWSwgcSk7CisJCXJldHVybjsKKwl9CisKKwkv
KiBzZXR0aW5nIGNvcHkgbGltaXRzICovCisJaWYgKGJsa19xdWV1ZV9mbGFnX3Rlc3RfYW5kX3Nl
dChRVUVVRV9GTEFHX0NPUFksIHEpKQorCQlyZXR1cm47CisKKwlibGtfcXVldWVfbWF4X2NvcHlf
c2VjdG9yc19odyhxLAorCQludm1lX2xiYV90b19zZWN0KG5zLCBsZTE2X3RvX2NwdShpZC0+bXNz
cmwpKSk7Cit9CisKIHN0YXRpYyBib29sIG52bWVfbnNfaWRzX2VxdWFsKHN0cnVjdCBudm1lX25z
X2lkcyAqYSwgc3RydWN0IG52bWVfbnNfaWRzICpiKQogewogCXJldHVybiB1dWlkX2VxdWFsKCZh
LT51dWlkLCAmYi0+dXVpZCkgJiYKQEAgLTE5MDMsNiArMjAwMyw3IEBAIHN0YXRpYyB2b2lkIG52
bWVfdXBkYXRlX2Rpc2tfaW5mbyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaywKIAlzZXRfY2FwYWNpdHlf
YW5kX25vdGlmeShkaXNrLCBjYXBhY2l0eSk7CiAKIAludm1lX2NvbmZpZ19kaXNjYXJkKGRpc2ss
IG5zKTsKKwludm1lX2NvbmZpZ19jb3B5KGRpc2ssIG5zLCBpZCk7CiAJYmxrX3F1ZXVlX21heF93
cml0ZV96ZXJvZXNfc2VjdG9ycyhkaXNrLT5xdWV1ZSwKIAkJCQkJICAgbnMtPmN0cmwtPm1heF96
ZXJvZXNfc2VjdG9ycyk7CiB9CkBAIC01MjI4LDYgKzUzMjksNyBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgX252bWVfY2hlY2tfc2l6ZSh2b2lkKQogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52
bWVfZG93bmxvYWRfZmlybXdhcmUpICE9IDY0KTsKIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVj
dCBudm1lX2Zvcm1hdF9jbWQpICE9IDY0KTsKIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBu
dm1lX2RzbV9jbWQpICE9IDY0KTsKKwlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBudm1lX2Nv
cHlfY29tbWFuZCkgIT0gNjQpOwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfd3Jp
dGVfemVyb2VzX2NtZCkgIT0gNjQpOwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVf
YWJvcnRfY21kKSAhPSA2NCk7CiAJQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgbnZtZV9nZXRf
bG9nX3BhZ2VfY29tbWFuZCkgIT0gNjQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3Qv
ZmMuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L2ZjLmMKaW5kZXggNWQ1N2EwNDJkYmNhLi5iMmExY2Yz
N2NkOTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L2ZjLmMKKysrIGIvZHJpdmVycy9u
dm1lL2hvc3QvZmMuYwpAQCAtMjc5NCw2ICsyNzk0LDExIEBAIG52bWVfZmNfcXVldWVfcnEoc3Ry
dWN0IGJsa19tcV9od19jdHggKmhjdHgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCWlm
ICh1bmxpa2VseSgocnEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSAmJgorCQkJCShyZXFfb3AocnEp
ID09IFJFUV9PUF9SRUFEKSkpIHsKKwkJYmxrX21xX2VuZF9yZXF1ZXN0KHJxLCBCTEtfU1RTX09L
KTsKKwkJcmV0dXJuIEJMS19TVFNfT0s7CisJfQogCS8qCiAJICogbnZtZSBjb3JlIGRvZXNuJ3Qg
cXVpdGUgdHJlYXQgdGhlIHJxIG9wYXF1ZWx5LiBDb21tYW5kcyBzdWNoCiAJICogYXMgV1JJVEUg
WkVST0VTIHdpbGwgcmV0dXJuIGEgbm9uLXplcm8gcnEgcGF5bG9hZF9ieXRlcyB5ZXQKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L252bWUuaCBiL2RyaXZlcnMvbnZtZS9ob3N0L252bWUu
aAppbmRleCBmOWRmMTA2NTNmM2MuLjE3Y2ZjZmM1ODM0NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
dm1lL2hvc3QvbnZtZS5oCisrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L252bWUuaApAQCAtNDk1LDYg
KzQ5NSwxMyBAQCBzdHJ1Y3QgbnZtZV9ucyB7CiAKIH07CiAKK3N0cnVjdCBudm1lX2NvcHlfdG9r
ZW4geworCWNoYXIgc3Vic3lzWzRdOworCXN0cnVjdCBudm1lX25zICpuczsKKwl1NjQgc3JjX3Nl
Y3RvcjsKKwl1NjQgc2VjdG9yczsKK307CisKIC8qIE5WTWUgbnMgc3VwcG9ydHMgbWV0YWRhdGEg
YWN0aW9ucyBieSB0aGUgY29udHJvbGxlciAoZ2VuZXJhdGUvc3RyaXApICovCiBzdGF0aWMgaW5s
aW5lIGJvb2wgbnZtZV9uc19oYXNfcGkoc3RydWN0IG52bWVfbnMgKm5zKQogewpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9udm1lL2hvc3QvcGNpLmMgYi9kcml2ZXJzL252bWUvaG9zdC9wY2kuYwppbmRl
eCAwMTYzYmZhOTI1YWEuLmViMWVkMmM4YjNhMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lL2hv
c3QvcGNpLmMKKysrIGIvZHJpdmVycy9udm1lL2hvc3QvcGNpLmMKQEAgLTUwMywxNiArNTAzLDE5
IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBudm1lX3NxX2NvcHlfY21kKHN0cnVjdCBudm1lX3F1ZXVl
ICpudm1lcSwKIAkJbnZtZXEtPnNxX3RhaWwgPSAwOwogfQogCi1zdGF0aWMgdm9pZCBudm1lX2Nv
bW1pdF9ycXMoc3RydWN0IGJsa19tcV9od19jdHggKmhjdHgpCitzdGF0aWMgaW5saW5lIHZvaWQg
bnZtZV9jb21taXRfc3FfZGIoc3RydWN0IG52bWVfcXVldWUgKm52bWVxKQogewotCXN0cnVjdCBu
dm1lX3F1ZXVlICpudm1lcSA9IGhjdHgtPmRyaXZlcl9kYXRhOwotCiAJc3Bpbl9sb2NrKCZudm1l
cS0+c3FfbG9jayk7CiAJaWYgKG52bWVxLT5zcV90YWlsICE9IG52bWVxLT5sYXN0X3NxX3RhaWwp
CiAJCW52bWVfd3JpdGVfc3FfZGIobnZtZXEsIHRydWUpOwogCXNwaW5fdW5sb2NrKCZudm1lcS0+
c3FfbG9jayk7CiB9CiAKK3N0YXRpYyB2b2lkIG52bWVfY29tbWl0X3JxcyhzdHJ1Y3QgYmxrX21x
X2h3X2N0eCAqaGN0eCkKK3sKKwludm1lX2NvbW1pdF9zcV9kYihoY3R4LT5kcml2ZXJfZGF0YSk7
Cit9CisKIHN0YXRpYyB2b2lkICoqbnZtZV9wY2lfaW9kX2xpc3Qoc3RydWN0IHJlcXVlc3QgKnJl
cSkKIHsKIAlzdHJ1Y3QgbnZtZV9pb2QgKmlvZCA9IGJsa19tcV9ycV90b19wZHUocmVxKTsKQEAg
LTkwMCw2ICs5MDMsMTIgQEAgc3RhdGljIGJsa19zdGF0dXNfdCBudm1lX3ByZXBfcnEoc3RydWN0
IG52bWVfZGV2ICpkZXYsIHN0cnVjdCByZXF1ZXN0ICpyZXEpCiAJaWYgKHJldCkKIAkJcmV0dXJu
IHJldDsKIAorCWlmICh1bmxpa2VseSgocmVxLT5jbWRfZmxhZ3MgJiBSRVFfQ09QWSkgJiYKKwkJ
CQkocmVxX29wKHJlcSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfc3RhcnRfcmVxdWVz
dChyZXEpOworCQlyZXR1cm4gQkxLX1NUU19PSzsKKwl9CisKIAlpZiAoYmxrX3JxX25yX3BoeXNf
c2VnbWVudHMocmVxKSkgewogCQlyZXQgPSBudm1lX21hcF9kYXRhKGRldiwgcmVxLCAmaW9kLT5j
bWQpOwogCQlpZiAocmV0KQpAQCAtOTEzLDYgKzkyMiw3IEBAIHN0YXRpYyBibGtfc3RhdHVzX3Qg
bnZtZV9wcmVwX3JxKHN0cnVjdCBudm1lX2RldiAqZGV2LCBzdHJ1Y3QgcmVxdWVzdCAqcmVxKQog
CX0KIAogCWJsa19tcV9zdGFydF9yZXF1ZXN0KHJlcSk7CisKIAlyZXR1cm4gQkxLX1NUU19PSzsK
IG91dF91bm1hcF9kYXRhOgogCW52bWVfdW5tYXBfZGF0YShkZXYsIHJlcSk7CkBAIC05NDYsNiAr
OTU2LDE4IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9xdWV1ZV9ycShzdHJ1Y3QgYmxrX21x
X2h3X2N0eCAqaGN0eCwKIAlyZXQgPSBudm1lX3ByZXBfcnEoZGV2LCByZXEpOwogCWlmICh1bmxp
a2VseShyZXQpKQogCQlyZXR1cm4gcmV0OworCWlmICh1bmxpa2VseSgocmVxLT5jbWRfZmxhZ3Mg
JiBSRVFfQ09QWSkgJiYKKwkJCQkocmVxX29wKHJlcSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQli
bGtfbXFfc2V0X3JlcXVlc3RfY29tcGxldGUocmVxKTsKKwkJYmxrX21xX2VuZF9yZXF1ZXN0KHJl
cSwgQkxLX1NUU19PSyk7CisJCS8qIENvbW1pdCB0aGUgc3EgaWYgY29weSByZWFkIHdhcyB0aGUg
bGFzdCByZXEgaW4gdGhlIGxpc3QsCisJCSAqIGFzIGNvcHkgcmVhZCBkZW9lc24ndCB1cGRhdGUg
c3EgZGIKKwkJICovCisJCWlmIChiZC0+bGFzdCkKKwkJCW52bWVfY29tbWl0X3NxX2RiKG52bWVx
KTsKKwkJcmV0dXJuIHJldDsKKwl9CisKIAlzcGluX2xvY2soJm52bWVxLT5zcV9sb2NrKTsKIAlu
dm1lX3NxX2NvcHlfY21kKG52bWVxLCAmaW9kLT5jbWQpOwogCW52bWVfd3JpdGVfc3FfZGIobnZt
ZXEsIGJkLT5sYXN0KTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L3JkbWEuYyBiL2Ry
aXZlcnMvbnZtZS9ob3N0L3JkbWEuYwppbmRleCA2ZTA3OWFiYjIyZWUuLjY5Mzg2NTEzOWUzYyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9udm1lL2hvc3QvcmRtYS5jCisrKyBiL2RyaXZlcnMvbnZtZS9o
b3N0L3JkbWEuYwpAQCAtMjA0MCw2ICsyMDQwLDEzIEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZt
ZV9yZG1hX3F1ZXVlX3JxKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAogCWlmIChyZXQpCiAJ
CWdvdG8gdW5tYXBfcWU7CiAKKwlpZiAodW5saWtlbHkoKHJxLT5jbWRfZmxhZ3MgJiBSRVFfQ09Q
WSkgJiYKKwkJCQkocmVxX29wKHJxKSA9PSBSRVFfT1BfUkVBRCkpKSB7CisJCWJsa19tcV9lbmRf
cmVxdWVzdChycSwgQkxLX1NUU19PSyk7CisJCXJldCA9IEJMS19TVFNfT0s7CisJCWdvdG8gdW5t
YXBfcWU7CisJfQorCiAJYmxrX21xX3N0YXJ0X3JlcXVlc3QocnEpOwogCiAJaWYgKElTX0VOQUJM
RUQoQ09ORklHX0JMS19ERVZfSU5URUdSSVRZKSAmJgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1l
L2hvc3QvdGNwLmMgYi9kcml2ZXJzL252bWUvaG9zdC90Y3AuYwppbmRleCA5YjQ3ZGNiMmE3ZDku
LmU0MmZiNTNlOWRjMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1lL2hvc3QvdGNwLmMKKysrIGIv
ZHJpdmVycy9udm1lL2hvc3QvdGNwLmMKQEAgLTIzNDgsNiArMjM0OCwxMSBAQCBzdGF0aWMgYmxr
X3N0YXR1c190IG52bWVfdGNwX3NldHVwX2NtZF9wZHUoc3RydWN0IG52bWVfbnMgKm5zLAogCWlm
IChyZXQpCiAJCXJldHVybiByZXQ7CiAKKwlpZiAodW5saWtlbHkoKHJxLT5jbWRfZmxhZ3MgJiBS
RVFfQ09QWSkgJiYKKwkJCQkocmVxX29wKHJxKSA9PSBSRVFfT1BfUkVBRCkpKSB7CisJCXJldHVy
biBCTEtfU1RTX09LOworCX0KKwogCXJlcS0+c3RhdGUgPSBOVk1FX1RDUF9TRU5EX0NNRF9QRFU7
CiAJcmVxLT5zdGF0dXMgPSBjcHVfdG9fbGUxNihOVk1FX1NDX1NVQ0NFU1MpOwogCXJlcS0+b2Zm
c2V0ID0gMDsKQEAgLTI0MTYsNiArMjQyMSwxNyBAQCBzdGF0aWMgYmxrX3N0YXR1c190IG52bWVf
dGNwX3F1ZXVlX3JxKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAogCiAJYmxrX21xX3N0YXJ0
X3JlcXVlc3QocnEpOwogCisJaWYgKHVubGlrZWx5KChycS0+Y21kX2ZsYWdzICYgUkVRX0NPUFkp
ICYmCisJCQkJKHJlcV9vcChycSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfc2V0X3Jl
cXVlc3RfY29tcGxldGUocnEpOworCQlibGtfbXFfZW5kX3JlcXVlc3QocnEsIEJMS19TVFNfT0sp
OworCQkvKiBpZiBjb3B5IHJlYWQgaXMgdGhlIGxhc3QgcmVxIHF1ZXVlIHRjcCByZXFzICovCisJ
CWlmIChiZC0+bGFzdCAmJiBudm1lX3RjcF9xdWV1ZV9tb3JlKHF1ZXVlKSkKKwkJCXF1ZXVlX3dv
cmtfb24ocXVldWUtPmlvX2NwdSwgbnZtZV90Y3Bfd3EsCisJCQkJCSZxdWV1ZS0+aW9fd29yayk7
CisJCXJldHVybiByZXQ7CisJfQorCiAJbnZtZV90Y3BfcXVldWVfcmVxdWVzdChyZXEsIHRydWUs
IGJkLT5sYXN0KTsKIAogCXJldHVybiBCTEtfU1RTX09LOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
dm1lL2hvc3QvdHJhY2UuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNlLmMKaW5kZXggMWMzNmZj
ZWRlYTIwLi5kYTRhNzQ5NGU1YTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNl
LmMKKysrIGIvZHJpdmVycy9udm1lL2hvc3QvdHJhY2UuYwpAQCAtMTUwLDYgKzE1MCwyMyBAQCBz
dGF0aWMgY29uc3QgY2hhciAqbnZtZV90cmFjZV9yZWFkX3dyaXRlKHN0cnVjdCB0cmFjZV9zZXEg
KnAsIHU4ICpjZHcxMCkKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgY29uc3QgY2hhciAqbnZt
ZV90cmFjZV9jb3B5KHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkKK3sKKwljb25zdCBj
aGFyICpyZXQgPSB0cmFjZV9zZXFfYnVmZmVyX3B0cihwKTsKKwl1NjQgc2xiYSA9IGdldF91bmFs
aWduZWRfbGU2NChjZHcxMCk7CisJdTggbnJfcmFuZ2UgPSBnZXRfdW5hbGlnbmVkX2xlMTYoY2R3
MTAgKyA4KTsKKwl1MTYgY29udHJvbCA9IGdldF91bmFsaWduZWRfbGUxNihjZHcxMCArIDEwKTsK
Kwl1MzIgZHNtZ210ID0gZ2V0X3VuYWxpZ25lZF9sZTMyKGNkdzEwICsgMTIpOworCXUzMiByZWZ0
YWcgPSBnZXRfdW5hbGlnbmVkX2xlMzIoY2R3MTAgKyAgMTYpOworCisJdHJhY2Vfc2VxX3ByaW50
ZihwLAorCQkJICJzbGJhPSVsbHUsIG5yX3JhbmdlPSV1LCBjdHJsPTB4JXgsIGRzbWdtdD0ldSwg
cmVmdGFnPSV1IiwKKwkJCSBzbGJhLCBucl9yYW5nZSwgY29udHJvbCwgZHNtZ210LCByZWZ0YWcp
OworCXRyYWNlX3NlcV9wdXRjKHAsIDApOworCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNv
bnN0IGNoYXIgKm52bWVfdHJhY2VfZHNtKHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkK
IHsKIAljb25zdCBjaGFyICpyZXQgPSB0cmFjZV9zZXFfYnVmZmVyX3B0cihwKTsKQEAgLTI0Myw2
ICsyNjAsOCBAQCBjb25zdCBjaGFyICpudm1lX3RyYWNlX3BhcnNlX252bV9jbWQoc3RydWN0IHRy
YWNlX3NlcSAqcCwKIAkJcmV0dXJuIG52bWVfdHJhY2Vfem9uZV9tZ210X3NlbmQocCwgY2R3MTAp
OwogCWNhc2UgbnZtZV9jbWRfem9uZV9tZ210X3JlY3Y6CiAJCXJldHVybiBudm1lX3RyYWNlX3pv
bmVfbWdtdF9yZWN2KHAsIGNkdzEwKTsKKwljYXNlIG52bWVfY21kX2NvcHk6CisJCXJldHVybiBu
dm1lX3RyYWNlX2NvcHkocCwgY2R3MTApOwogCWRlZmF1bHQ6CiAJCXJldHVybiBudm1lX3RyYWNl
X2NvbW1vbihwLCBjZHcxMCk7CiAJfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lLmgg
Yi9pbmNsdWRlL2xpbnV4L252bWUuaAppbmRleCAwNTBkN2QwY2Q4MWIuLjQxMzQ5ZDc4ZDQxMCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9udm1lLmgKKysrIGIvaW5jbHVkZS9saW51eC9udm1l
LmgKQEAgLTMzNiw3ICszMzYsNyBAQCBzdHJ1Y3QgbnZtZV9pZF9jdHJsIHsKIAlfX3U4CQkJbnZz
Y2M7CiAJX191OAkJCW53cGM7CiAJX19sZTE2CQkJYWN3dTsKLQlfX3U4CQkJcnN2ZDUzNFsyXTsK
KwlfX2xlMTYJCQlvY2ZzOwogCV9fbGUzMgkJCXNnbHM7CiAJX19sZTMyCQkJbW5hbjsKIAlfX3U4
CQkJcnN2ZDU0NFsyMjRdOwpAQCAtMzY0LDYgKzM2NCw3IEBAIGVudW0gewogCU5WTUVfQ1RSTF9P
TkNTX1dSSVRFX1pFUk9FUwkJPSAxIDw8IDMsCiAJTlZNRV9DVFJMX09OQ1NfUkVTRVJWQVRJT05T
CQk9IDEgPDwgNSwKIAlOVk1FX0NUUkxfT05DU19USU1FU1RBTVAJCT0gMSA8PCA2LAorCU5WTUVf
Q1RSTF9PTkNTX0NPUFkJCQk9IDEgPDwgOCwKIAlOVk1FX0NUUkxfVldDX1BSRVNFTlQJCQk9IDEg
PDwgMCwKIAlOVk1FX0NUUkxfT0FDU19TRUNfU1VQUCAgICAgICAgICAgICAgICAgPSAxIDw8IDAs
CiAJTlZNRV9DVFJMX09BQ1NfTlNfTU5HVF9TVVBQCQk9IDEgPDwgMywKQEAgLTQxMyw3ICs0MTQs
MTAgQEAgc3RydWN0IG52bWVfaWRfbnMgewogCV9fbGUxNgkJCW5wZGc7CiAJX19sZTE2CQkJbnBk
YTsKIAlfX2xlMTYJCQlub3dzOwotCV9fdTgJCQlyc3ZkNzRbMThdOworCV9fbGUxNgkJCW1zc3Js
OworCV9fbGUzMgkJCW1jbDsKKwlfX3U4CQkJbXNyYzsKKwlfX3U4CQkJcnN2ZDkxWzExXTsKIAlf
X2xlMzIJCQlhbmFncnBpZDsKIAlfX3U4CQkJcnN2ZDk2WzNdOwogCV9fdTgJCQluc2F0dHI7CkBA
IC03OTQsNiArNzk4LDcgQEAgZW51bSBudm1lX29wY29kZSB7CiAJbnZtZV9jbWRfcmVzdl9yZXBv
cnQJPSAweDBlLAogCW52bWVfY21kX3Jlc3ZfYWNxdWlyZQk9IDB4MTEsCiAJbnZtZV9jbWRfcmVz
dl9yZWxlYXNlCT0gMHgxNSwKKwludm1lX2NtZF9jb3B5CQk9IDB4MTksCiAJbnZtZV9jbWRfem9u
ZV9tZ210X3NlbmQJPSAweDc5LAogCW52bWVfY21kX3pvbmVfbWdtdF9yZWN2CT0gMHg3YSwKIAlu
dm1lX2NtZF96b25lX2FwcGVuZAk9IDB4N2QsCkBAIC04MTUsNyArODIwLDggQEAgZW51bSBudm1l
X29wY29kZSB7CiAJCW52bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfcmVzdl9yZWxlYXNlKSwJXAog
CQludm1lX29wY29kZV9uYW1lKG52bWVfY21kX3pvbmVfbWdtdF9zZW5kKSwJXAogCQludm1lX29w
Y29kZV9uYW1lKG52bWVfY21kX3pvbmVfbWdtdF9yZWN2KSwJXAotCQludm1lX29wY29kZV9uYW1l
KG52bWVfY21kX3pvbmVfYXBwZW5kKSkKKwkJbnZtZV9vcGNvZGVfbmFtZShudm1lX2NtZF96b25l
X2FwcGVuZCksCQlcCisJCW52bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfY29weSkpCiAKIAogCkBA
IC05OTEsNiArOTk3LDM2IEBAIHN0cnVjdCBudm1lX2RzbV9yYW5nZSB7CiAJX19sZTY0CQkJc2xi
YTsKIH07CiAKK3N0cnVjdCBudm1lX2NvcHlfY29tbWFuZCB7CisJX191OCAgICAgICAgICAgICAg
ICAgICAgb3Bjb2RlOworCV9fdTggICAgICAgICAgICAgICAgICAgIGZsYWdzOworCV9fdTE2ICAg
ICAgICAgICAgICAgICAgIGNvbW1hbmRfaWQ7CisJX19sZTMyICAgICAgICAgICAgICAgICAgbnNp
ZDsKKwlfX3U2NCAgICAgICAgICAgICAgICAgICByc3ZkMjsKKwlfX2xlNjQgICAgICAgICAgICAg
ICAgICBtZXRhZGF0YTsKKwl1bmlvbiBudm1lX2RhdGFfcHRyICAgICBkcHRyOworCV9fbGU2NCAg
ICAgICAgICAgICAgICAgIHNkbGJhOworCV9fdTgJCQlucl9yYW5nZTsKKwlfX3U4CQkJcnN2ZDEy
OworCV9fbGUxNiAgICAgICAgICAgICAgICAgIGNvbnRyb2w7CisJX19sZTE2ICAgICAgICAgICAg
ICAgICAgcnN2ZDEzOworCV9fbGUxNgkJCWRzcGVjOworCV9fbGUzMiAgICAgICAgICAgICAgICAg
IGlsYnJ0OworCV9fbGUxNiAgICAgICAgICAgICAgICAgIGxiYXQ7CisJX19sZTE2ICAgICAgICAg
ICAgICAgICAgbGJhdG07Cit9OworCitzdHJ1Y3QgbnZtZV9jb3B5X3JhbmdlIHsKKwlfX2xlNjQJ
CQlyc3ZkMDsKKwlfX2xlNjQJCQlzbGJhOworCV9fbGUxNgkJCW5sYjsKKwlfX2xlMTYJCQlyc3Zk
MTg7CisJX19sZTMyCQkJcnN2ZDIwOworCV9fbGUzMgkJCWVpbGJydDsKKwlfX2xlMTYJCQllbGJh
dDsKKwlfX2xlMTYJCQllbGJhdG07Cit9OworCiBzdHJ1Y3QgbnZtZV93cml0ZV96ZXJvZXNfY21k
IHsKIAlfX3U4CQkJb3Bjb2RlOwogCV9fdTgJCQlmbGFnczsKQEAgLTE3NDgsNiArMTc4NCw3IEBA
IHN0cnVjdCBudm1lX2NvbW1hbmQgewogCQlzdHJ1Y3QgbnZtZV9kb3dubG9hZF9maXJtd2FyZSBk
bGZ3OwogCQlzdHJ1Y3QgbnZtZV9mb3JtYXRfY21kIGZvcm1hdDsKIAkJc3RydWN0IG52bWVfZHNt
X2NtZCBkc207CisJCXN0cnVjdCBudm1lX2NvcHlfY29tbWFuZCBjb3B5OwogCQlzdHJ1Y3QgbnZt
ZV93cml0ZV96ZXJvZXNfY21kIHdyaXRlX3plcm9lczsKIAkJc3RydWN0IG52bWVfem9uZV9tZ210
X3NlbmRfY21kIHptczsKIAkJc3RydWN0IG52bWVfem9uZV9tZ210X3JlY3ZfY21kIHptcjsKLS0g
CjIuMzUuMS41MDAuZ2I4OTZmNzI5ZTIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZl
bEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8v
ZG0tZGV2ZWwK

