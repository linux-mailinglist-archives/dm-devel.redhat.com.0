Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2432511692
	for <lists+dm-devel@lfdr.de>; Wed, 27 Apr 2022 14:15:03 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-183-VG-PYhVaMz6NzsIBZNZs7w-1; Wed, 27 Apr 2022 08:14:55 -0400
X-MC-Unique: VG-PYhVaMz6NzsIBZNZs7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B19D185A7A4;
	Wed, 27 Apr 2022 12:14:53 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E916F9E69;
	Wed, 27 Apr 2022 12:14:46 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 5243D1947060;
	Wed, 27 Apr 2022 12:14:45 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 584361947BBE
 for <dm-devel@listman.corp.redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4D6972167D64; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 484882167D6C
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:38 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28F7B3C161A9
 for <dm-devel@redhat.com>; Tue, 26 Apr 2022 12:24:33 +0000 (UTC)
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-288-FKl0_UC_NraTriOiKnR1AA-1; Tue, 26 Apr 2022 08:24:29 -0400
X-MC-Unique: FKl0_UC_NraTriOiKnR1AA-1
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20220426121515epoutp0437e539ae68c2cf5fcbf9420fb22c98dd~pcU12E1P52403124031epoutp04Z;
 Tue, 26 Apr 2022 12:15:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20220426121515epoutp0437e539ae68c2cf5fcbf9420fb22c98dd~pcU12E1P52403124031epoutp04Z
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20220426121515epcas5p2ce7ecf5f7bef603348cda529aab37a4b~pcU1bEt4D2624626246epcas5p2Y;
 Tue, 26 Apr 2022 12:15:15 +0000 (GMT)
Received: from epsmges5p2new.samsung.com (unknown [182.195.38.180]) by
 epsnrtp2.localdomain (Postfix) with ESMTP id 4KngnC6ps9z4x9Q1; Tue, 26 Apr
 2022 12:15:11 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
 86.4F.09827.F42E7626; Tue, 26 Apr 2022 21:15:11 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
 20220426102001epcas5p4e321347334971d704cb19ffa25f9d0b4~pawOYHjZy3243632436epcas5p4H;
 Tue, 26 Apr 2022 10:20:01 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220426102001epsmtrp172543dabc421aaef233c3b335d047536~pawOV5vR92263822638epsmtrp1i;
 Tue, 26 Apr 2022 10:20:01 +0000 (GMT)
X-AuditID: b6c32a4a-b3bff70000002663-2c-6267e24f133e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 26.BA.08924.157C7626; Tue, 26 Apr 2022 19:20:01 +0900 (KST)
Received: from test-zns.sa.corp.samsungelectronics.net (unknown
 [107.110.206.5]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220426101955epsmtip13ba2f31a98b5974fda4e654680a1c4bd~pawIxZdur0427604276epsmtip10;
 Tue, 26 Apr 2022 10:19:55 +0000 (GMT)
From: Nitesh Shetty <nj.shetty@samsung.com>
To: 
Date: Tue, 26 Apr 2022 15:42:33 +0530
Message-Id: <20220426101241.30100-6-nj.shetty@samsung.com>
In-Reply-To: <20220426101241.30100-1-nj.shetty@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Te0xTdxTHcx+9LRjwCqg/YDhSwhZwPMoK+8Fkusi2m+nCw6mTuNUCd4UB
 bdeWuZEpMMSM13gJg+LkoYAgAwTGG+KAAtYhsgoKjtaOMqMGKg+DBpS1FDb/+/zO+Z7nL4eF
 Wd1j2rGihDJaIuTHsAlzvKXPxcUt8G9BmOeoggvrlQMY7JpYZMArU1kELHjyHIP636cZMDer
 kAlXhkcwqNJZwu65Yga89SwJhdONayicuNaOwq7yXBRWX1Gg8EHVRQR2ls0bvH8tMuGqlgMV
 a7ME1C5N4jC3dxyBM2NyFHZP7oZd3ddxqOo4T8CSyhkmTL/TRsCex90YrBp8icKb8lUC5gw2
 MWCbLgmBLSslGOxTj+Gw7rEeh0OT9jAl4zkTjrwYZOx7g1LdPkDJNcMElZM8x6Ta5VNMakR9
 FadUw3FUY00qQTVdSqDy7lYhVOdEIkH98IcCowoXlggqM3mOoNpTNAxqfmYSp/Q9Y0TQztDo
 PZE0P4KWONLCcFFElFDgzz5wiLef5+3jyXHj+MJ32I5Cfiztzw44GOT2YVSMYaVsx2/4MXEG
 UxBfKmV7vLdHIoqT0Y6RIqnMn02LI2LEXLG7lB8rjRMK3IW0zI/j6enlbRCeiI6sV/czxRVx
 3zaoavFEpIqXhpixAMkFzcvlTCNbkZ0I0NRFpCHmBl5AQE/2S9z0WETATN8ssRlxZ/YCboro
 QEBripNJlIICZe0/BhGLRZC7wY01llFjQ+Kgenl5PRFGjrHAwC3teiJrEoLs0WHMyDjpDHpV
 K4iRLUg/cPmqej0PID1Almab0WxGvgsqFHOoSbINXC/SrfeAka+D5N+KMWN+QJaZgz7FTczU
 aACoXKximtgaPBps3mA78DDr7AafBK1nS1FT8BkEpCmVuMmxF4x2vUCNTWCkC6jv8DCZHUC+
 sg41FbYEmSs61GS3AG0XNtkJ1NaXbizLFowvJ20wBfK0C4RpWT8h4IGqmJGNOMpfGUj+ykDy
 /0uXIlgNYkuLpbECWuot9hLSJ//75HBRbCOyfmWuH7ch2vtP3HsRlIX0IoCFsW0s8p2/DLOy
 iOB/F09LRDxJXAwt7UW8DQvPwey2h4sMZyqU8ThcX0+uj48P1/dtHw57p8UNQQPfihTwZXQ0
 TYtpyWYcyjKzS0QrYbGfbHIp9XS/VXx61MOQj9QZXQk+ksldp4J2FHG8nml9E7ymE4fK3hy3
 Do+MkpTILPdRvK3j+RmXTnt4vfVV+wR3PldfFow5nPqFL3cOPv5UH1ZR06q7Vn1kpvnMOafy
 R3oRV5PiLv/stXsHgz2OFxQd0i5XdlvHhpqFNDv05mVovQJ3fGqhvRwpVNuf/9q+SXn33FyN
 cm+q2qbhe9knoZmBAz+f0NW4a4RbAn6sn92ewn5623qwOr4qdaL/4p9bdePHdn1BjqVRId62
 DdL09/s+L9Md/lXShguyo4f6Go/QAvpYQXCDELQEc5uPrrjq78uztkxZrX6QcDTErLBl/+Fw
 Ni6N5HNcMYmU/y9q74zx7gQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0xTdxiHPZeec2B0O5QG/pbEbQ2gwYDr0OwVjWzL3M42I/bTEpaJBY/o
 BOx6GY4Ps64hju5SYQ6xGHArWLmMS9mgaAuutXSIXLaOSRu5qBCSEYooG7KinYUs89ub53ny
 +/QyhMgikDBHCjW8qlCRL6UiyQ6XdEOK3JOX81KvVQIt13sJsPseCKBxzEhBxb1lAuZ/viuA
 cmMlDcGBIQK8U8+CI1AlgOGHJ3G4aw3h4LvahYP9+3Ic6hvdOMxYzBhc+W7hib31gIaV2zJw
 h+YouL3oJ6Hc+QcG0yMmHBz+zWB39JHgvXyegpqL0zR8cdNGQfesgwCL5zEOg6YVCso87QKw
 TZ3EoCNYQ4BrfISE5tl5En7xx0PJl8s0DD3yCF5N4ry/v8uZJgYorkwfoLku0xjNDY23kZx3
 QMtZG0oprr32BPfNqAXjrvh0FPfZDTfBVd5fpLiv9AGK6yqZEHAL036Sm+8eofbFZUXuPMjn
 H/mYV23ZdSDycMv4NVpZpz3e6m0idZgl24BFMIjdim7OVZMGLJIRsTYMmUN/kWtiPbr46Bqx
 dseg+scz9Fqkx1Gtq58yYAxDsZtRf4gJN2KWRPVLS6tDBBtiUOedUiosYlhAp38dWB0i2UTk
 9Aax8C1k09GltvHVHcRuQcaJ6DCOYHegOncAD2PRk2Q0eHytjkZ956bIMCbYjailWhTGBPs8
 0v9URZzGok1PVab/K9NT1QWMaMDW80p1QV6BWqZ8uZAvSlUrCtTawrzU3GMFVmz1l5KTbZi9
 4V6qE8MZzIkhhpCKhd8mHsoRCQ8qPinmVceyVdp8Xu3E4hlSGiccNvRli9g8hYY/yvNKXvWf
 xZkIiQ7X2bOyKzX6+2XT2kvK4pn2Nrz40PLurFq++sVYx2DV7nTzD5tCv23YU1OXNvZM3fWa
 xP0LHwUgbtOO1oySz+3VssnSU/b+TvTKB8WldI4nZm9ngjaqU/HGiiueyXgBDJPbzyQ0JZQ0
 V5xt+tG6Ne28pnXbQtfZd66qe/5Ma9a236DfrOgRKUnjbE+UJFPkH7ZtPJWzGH9AuL1RKU+W
 J7yd6BPzuzINxpHJv1P85svsvCtLFvX6uq+7R8X/ZJj94szWo906G9Fx4s5+uTt39n33p0mD
 Gom2TY0/lzZMbzvzIfuaNMXXW7TOsTQpiw3eavHUyt+KmksaykiPVeS+VySSkurDClkyoVIr
 /gX3jBHiugMAAA==
X-CMS-MailID: 20220426102001epcas5p4e321347334971d704cb19ffa25f9d0b4
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220426102001epcas5p4e321347334971d704cb19ffa25f9d0b4
References: <20220426101241.30100-1-nj.shetty@samsung.com>
 <CGME20220426102001epcas5p4e321347334971d704cb19ffa25f9d0b4@epcas5p4.samsung.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Mailman-Approved-At: Wed, 27 Apr 2022 12:14:17 +0000
Subject: [dm-devel] [PATCH v4 05/10] nvme: add copy offload support
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
Cc: djwong@kernel.org, linux-nvme@lists.infradead.org, clm@fb.com,
 dm-devel@redhat.com, osandov@fb.com, Alasdair Kergon <agk@redhat.com>,
 Naohiro Aota <naohiro.aota@wdc.com>, msnitzer@redhat.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, gost.dev@samsung.com, nitheshshetty@gmail.com,
 James Smart <james.smart@broadcom.com>, hch@lst.de,
 Nitesh Shetty <nj.shetty@samsung.com>, chaitanyak@nvidia.com,
 Chaitanya Kulkarni <kch@nvidia.com>, Mike Snitzer <snitzer@kernel.org>,
 josef@toxicpanda.com, linux-block@vger.kernel.org, dsterba@suse.com,
 kbusch@kernel.org, Frederick.Knight@netapp.com,
 Sagi Grimberg <sagi@grimberg.me>, axboe@kernel.dk,
 Johannes Thumshirn <jth@kernel.org>, tytso@mit.edu,
 Kanchan Joshi <joshi.k@samsung.com>, martin.petersen@oracle.com,
 linux-kernel@vger.kernel.org, Arnav Dawn <arnav.dawn@samsung.com>,
 jack@suse.com, linux-fsdevel@vger.kernel.org,
 =?UTF-8?q?Javier=20Gonz=C3=A1lez?= <javier.gonz@samsung.com>,
 lsf-pc@lists.linux-foundation.org,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
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
eTogQXJuYXYgRGF3biA8YXJuYXYuZGF3bkBzYW1zdW5nLmNvbT4KLS0tCiBkcml2ZXJzL252bWUv
aG9zdC9jb3JlLmMgIHwgMTE2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
CiBkcml2ZXJzL252bWUvaG9zdC9mYy5jICAgIHwgICA0ICsrCiBkcml2ZXJzL252bWUvaG9zdC9u
dm1lLmggIHwgICA3ICsrKwogZHJpdmVycy9udm1lL2hvc3QvcGNpLmMgICB8ICAyNSArKysrKysr
KwogZHJpdmVycy9udm1lL2hvc3QvcmRtYS5jICB8ICAgNiArKwogZHJpdmVycy9udm1lL2hvc3Qv
dGNwLmMgICB8ICAxNCArKysrKwogZHJpdmVycy9udm1lL2hvc3QvdHJhY2UuYyB8ICAxOSArKysr
KysrCiBpbmNsdWRlL2xpbnV4L252bWUuaCAgICAgIHwgIDQzICsrKysrKysrKysrKystCiA4IGZp
bGVzIGNoYW5nZWQsIDIyOSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYwpp
bmRleCBiOWIwZmJkZTk3YzguLjljYmM4ZmFhY2U3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9udm1l
L2hvc3QvY29yZS5jCisrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L2NvcmUuYwpAQCAtNzI0LDYgKzcy
NCw4NyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgbnZtZV9zZXR1cF9mbHVzaChzdHJ1Y3QgbnZtZV9u
cyAqbnMsCiAJY21uZC0+Y29tbW9uLm5zaWQgPSBjcHVfdG9fbGUzMihucy0+aGVhZC0+bnNfaWQp
OwogfQogCitzdGF0aWMgaW5saW5lIGJsa19zdGF0dXNfdCBudm1lX3NldHVwX2NvcHlfcmVhZChz
dHJ1Y3QgbnZtZV9ucyAqbnMsIHN0cnVjdCByZXF1ZXN0ICpyZXEpCit7CisJc3RydWN0IGJpbyAq
YmlvID0gcmVxLT5iaW87CisJc3RydWN0IG52bWVfY29weV90b2tlbiAqdG9rZW4gPSBidmVjX2tt
YXBfbG9jYWwoJmJpby0+YmlfaW9fdmVjWzBdKTsKKworCW1lbWNweSh0b2tlbi0+c3Vic3lzLCAi
bnZtZSIsIDQpOworCXRva2VuLT5ucyA9IG5zOworCXRva2VuLT5zcmNfc2VjdG9yID0gYmlvLT5i
aV9pdGVyLmJpX3NlY3RvcjsKKwl0b2tlbi0+c2VjdG9ycyA9IGJpby0+YmlfaXRlci5iaV9zaXpl
ID4+IDk7CisKKwlyZXR1cm4gQkxLX1NUU19PSzsKK30KKworc3RhdGljIGlubGluZSBibGtfc3Rh
dHVzX3QgbnZtZV9zZXR1cF9jb3B5X3dyaXRlKHN0cnVjdCBudm1lX25zICpucywKKwkgICAgICAg
c3RydWN0IHJlcXVlc3QgKnJlcSwgc3RydWN0IG52bWVfY29tbWFuZCAqY21uZCkKK3sKKwlzdHJ1
Y3QgbnZtZV9jdHJsICpjdHJsID0gbnMtPmN0cmw7CisJc3RydWN0IG52bWVfY29weV9yYW5nZSAq
cmFuZ2UgPSBOVUxMOworCXN0cnVjdCBiaW8gKmJpbyA9IHJlcS0+YmlvOworCXN0cnVjdCBudm1l
X2NvcHlfdG9rZW4gKnRva2VuID0gYnZlY19rbWFwX2xvY2FsKCZiaW8tPmJpX2lvX3ZlY1swXSk7
CisJc2VjdG9yX3Qgc3JjX3NlY3RvciwgZHN0X3NlY3Rvciwgbl9zZWN0b3JzOworCXU2NCBzcmNf
bGJhLCBkc3RfbGJhLCBuX2xiYTsKKwl1bnNpZ25lZCBzaG9ydCBucl9yYW5nZSA9IDE7CisJdTE2
IGNvbnRyb2wgPSAwOworCXUzMiBkc21nbXQgPSAwOworCisJaWYgKHVubGlrZWx5KG1lbWNtcCh0
b2tlbi0+c3Vic3lzLCAibnZtZSIsIDQpKSkKKwkJcmV0dXJuIEJMS19TVFNfTk9UU1VQUDsKKwlp
ZiAodW5saWtlbHkodG9rZW4tPm5zICE9IG5zKSkKKwkJcmV0dXJuIEJMS19TVFNfTk9UU1VQUDsK
KworCXNyY19zZWN0b3IgPSB0b2tlbi0+c3JjX3NlY3RvcjsKKwlkc3Rfc2VjdG9yID0gYmlvLT5i
aV9pdGVyLmJpX3NlY3RvcjsKKwluX3NlY3RvcnMgPSB0b2tlbi0+c2VjdG9yczsKKwlpZiAoV0FS
Tl9PTihuX3NlY3RvcnMgIT0gYmlvLT5iaV9pdGVyLmJpX3NpemUgPj4gOSkpCisJCXJldHVybiBC
TEtfU1RTX05PVFNVUFA7CisKKwlzcmNfbGJhID0gbnZtZV9zZWN0X3RvX2xiYShucywgc3JjX3Nl
Y3Rvcik7CisJZHN0X2xiYSA9IG52bWVfc2VjdF90b19sYmEobnMsIGRzdF9zZWN0b3IpOworCW5f
bGJhID0gbnZtZV9zZWN0X3RvX2xiYShucywgbl9zZWN0b3JzKTsKKworCWlmICh1bmxpa2VseShu
dm1lX2xiYV90b19zZWN0KG5zLCBzcmNfbGJhKSAhPSBzcmNfc2VjdG9yKSB8fAorCQkJdW5saWtl
bHkobnZtZV9sYmFfdG9fc2VjdChucywgZHN0X2xiYSkgIT0gZHN0X3NlY3RvcikgfHwKKwkJCXVu
bGlrZWx5KG52bWVfbGJhX3RvX3NlY3QobnMsIG5fbGJhKSAhPSBuX3NlY3RvcnMpKQorCQlyZXR1
cm4gQkxLX1NUU19OT1RTVVBQOworCisJaWYgKFdBUk5fT04oIW5fbGJhKSkKKwkJcmV0dXJuIEJM
S19TVFNfTk9UU1VQUDsKKworCWlmIChyZXEtPmNtZF9mbGFncyAmIFJFUV9GVUEpCisJCWNvbnRy
b2wgfD0gTlZNRV9SV19GVUE7CisKKwlpZiAocmVxLT5jbWRfZmxhZ3MgJiBSRVFfRkFJTEZBU1Rf
REVWKQorCQljb250cm9sIHw9IE5WTUVfUldfTFI7CisKKwltZW1zZXQoY21uZCwgMCwgc2l6ZW9m
KCpjbW5kKSk7CisJY21uZC0+Y29weS5vcGNvZGUgPSBudm1lX2NtZF9jb3B5OworCWNtbmQtPmNv
cHkubnNpZCA9IGNwdV90b19sZTMyKG5zLT5oZWFkLT5uc19pZCk7CisJY21uZC0+Y29weS5zZGxi
YSA9IGNwdV90b19sZTY0KGRzdF9sYmEpOworCisJcmFuZ2UgPSBrbWFsbG9jX2FycmF5KG5yX3Jh
bmdlLCBzaXplb2YoKnJhbmdlKSwKKwkJCUdGUF9BVE9NSUMgfCBfX0dGUF9OT1dBUk4pOworCWlm
ICghcmFuZ2UpCisJCXJldHVybiBCTEtfU1RTX1JFU09VUkNFOworCisJcmFuZ2VbMF0uc2xiYSA9
IGNwdV90b19sZTY0KHNyY19sYmEpOworCXJhbmdlWzBdLm5sYiA9IGNwdV90b19sZTE2KG5fbGJh
IC0gMSk7CisKKwljbW5kLT5jb3B5Lm5yX3JhbmdlID0gMDsKKworCXJlcS0+c3BlY2lhbF92ZWMu
YnZfcGFnZSA9IHZpcnRfdG9fcGFnZShyYW5nZSk7CisJcmVxLT5zcGVjaWFsX3ZlYy5idl9vZmZz
ZXQgPSBvZmZzZXRfaW5fcGFnZShyYW5nZSk7CisJcmVxLT5zcGVjaWFsX3ZlYy5idl9sZW4gPSBz
aXplb2YoKnJhbmdlKSAqIG5yX3JhbmdlOworCXJlcS0+cnFfZmxhZ3MgfD0gUlFGX1NQRUNJQUxf
UEFZTE9BRDsKKworCWNtbmQtPmNvcHkuY29udHJvbCA9IGNwdV90b19sZTE2KGNvbnRyb2wpOwor
CWNtbmQtPmNvcHkuZHNwZWMgPSBjcHVfdG9fbGUzMihkc21nbXQpOworCisJcmV0dXJuIEJMS19T
VFNfT0s7Cit9CisKIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9zZXR1cF9kaXNjYXJkKHN0cnVj
dCBudm1lX25zICpucywgc3RydWN0IHJlcXVlc3QgKnJlcSwKIAkJc3RydWN0IG52bWVfY29tbWFu
ZCAqY21uZCkKIHsKQEAgLTk0NywxMCArMTAyOCwxNiBAQCBibGtfc3RhdHVzX3QgbnZtZV9zZXR1
cF9jbWQoc3RydWN0IG52bWVfbnMgKm5zLCBzdHJ1Y3QgcmVxdWVzdCAqcmVxKQogCQlyZXQgPSBu
dm1lX3NldHVwX2Rpc2NhcmQobnMsIHJlcSwgY21kKTsKIAkJYnJlYWs7CiAJY2FzZSBSRVFfT1Bf
UkVBRDoKLQkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVxLCBjbWQsIG52bWVfY21kX3JlYWQp
OworCQlpZiAodW5saWtlbHkocmVxLT5jbWRfZmxhZ3MgJiBSRVFfQ09QWSkpCisJCQlyZXQgPSBu
dm1lX3NldHVwX2NvcHlfcmVhZChucywgcmVxKTsKKwkJZWxzZQorCQkJcmV0ID0gbnZtZV9zZXR1
cF9ydyhucywgcmVxLCBjbWQsIG52bWVfY21kX3JlYWQpOwogCQlicmVhazsKIAljYXNlIFJFUV9P
UF9XUklURToKLQkJcmV0ID0gbnZtZV9zZXR1cF9ydyhucywgcmVxLCBjbWQsIG52bWVfY21kX3dy
aXRlKTsKKwkJaWYgKHVubGlrZWx5KHJlcS0+Y21kX2ZsYWdzICYgUkVRX0NPUFkpKQorCQkJcmV0
ID0gbnZtZV9zZXR1cF9jb3B5X3dyaXRlKG5zLCByZXEsIGNtZCk7CisJCWVsc2UKKwkJCXJldCA9
IG52bWVfc2V0dXBfcncobnMsIHJlcSwgY21kLCBudm1lX2NtZF93cml0ZSk7CiAJCWJyZWFrOwog
CWNhc2UgUkVRX09QX1pPTkVfQVBQRU5EOgogCQlyZXQgPSBudm1lX3NldHVwX3J3KG5zLCByZXEs
IGNtZCwgbnZtZV9jbWRfem9uZV9hcHBlbmQpOwpAQCAtMTY0Miw2ICsxNzI5LDI5IEBAIHN0YXRp
YyB2b2lkIG52bWVfY29uZmlnX2Rpc2NhcmQoc3RydWN0IGdlbmRpc2sgKmRpc2ssIHN0cnVjdCBu
dm1lX25zICpucykKIAkJYmxrX3F1ZXVlX21heF93cml0ZV96ZXJvZXNfc2VjdG9ycyhxdWV1ZSwg
VUlOVF9NQVgpOwogfQogCitzdGF0aWMgdm9pZCBudm1lX2NvbmZpZ19jb3B5KHN0cnVjdCBnZW5k
aXNrICpkaXNrLCBzdHJ1Y3QgbnZtZV9ucyAqbnMsCisJCQkJICAgICAgIHN0cnVjdCBudm1lX2lk
X25zICppZCkKK3sKKwlzdHJ1Y3QgbnZtZV9jdHJsICpjdHJsID0gbnMtPmN0cmw7CisJc3RydWN0
IHJlcXVlc3RfcXVldWUgKnEgPSBkaXNrLT5xdWV1ZTsKKworCWlmICghKGN0cmwtPm9uY3MgJiBO
Vk1FX0NUUkxfT05DU19DT1BZKSkgeworCQlibGtfcXVldWVfbWF4X2NvcHlfc2VjdG9ycyhxLCAw
KTsKKwkJYmxrX3F1ZXVlX21heF9jb3B5X3JhbmdlX3NlY3RvcnMocSwgMCk7CisJCWJsa19xdWV1
ZV9tYXhfY29weV9ucl9yYW5nZXMocSwgMCk7CisJCWJsa19xdWV1ZV9mbGFnX2NsZWFyKFFVRVVF
X0ZMQUdfQ09QWSwgcSk7CisJCXJldHVybjsKKwl9CisKKwkvKiBzZXR0aW5nIGNvcHkgbGltaXRz
ICovCisJaWYgKGJsa19xdWV1ZV9mbGFnX3Rlc3RfYW5kX3NldChRVUVVRV9GTEFHX0NPUFksIHEp
KQorCQlyZXR1cm47CisKKwlibGtfcXVldWVfbWF4X2NvcHlfc2VjdG9ycyhxLCBudm1lX2xiYV90
b19zZWN0KG5zLCBsZTMyX3RvX2NwdShpZC0+bWNsKSkpOworCWJsa19xdWV1ZV9tYXhfY29weV9y
YW5nZV9zZWN0b3JzKHEsIG52bWVfbGJhX3RvX3NlY3QobnMsIGxlMTZfdG9fY3B1KGlkLT5tc3Ny
bCkpKTsKKwlibGtfcXVldWVfbWF4X2NvcHlfbnJfcmFuZ2VzKHEsIGlkLT5tc3JjICsgMSk7Cit9
CisKIHN0YXRpYyBib29sIG52bWVfbnNfaWRzX2VxdWFsKHN0cnVjdCBudm1lX25zX2lkcyAqYSwg
c3RydWN0IG52bWVfbnNfaWRzICpiKQogewogCXJldHVybiB1dWlkX2VxdWFsKCZhLT51dWlkLCAm
Yi0+dXVpZCkgJiYKQEAgLTE4NDEsNiArMTk1MSw3IEBAIHN0YXRpYyB2b2lkIG52bWVfdXBkYXRl
X2Rpc2tfaW5mbyhzdHJ1Y3QgZ2VuZGlzayAqZGlzaywKIAlzZXRfY2FwYWNpdHlfYW5kX25vdGlm
eShkaXNrLCBjYXBhY2l0eSk7CiAKIAludm1lX2NvbmZpZ19kaXNjYXJkKGRpc2ssIG5zKTsKKwlu
dm1lX2NvbmZpZ19jb3B5KGRpc2ssIG5zLCBpZCk7CiAJYmxrX3F1ZXVlX21heF93cml0ZV96ZXJv
ZXNfc2VjdG9ycyhkaXNrLT5xdWV1ZSwKIAkJCQkJICAgbnMtPmN0cmwtPm1heF96ZXJvZXNfc2Vj
dG9ycyk7CiB9CkBAIC00ODMzLDYgKzQ5NDQsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgX252bWVf
Y2hlY2tfc2l6ZSh2b2lkKQogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfZG93bmxv
YWRfZmlybXdhcmUpICE9IDY0KTsKIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBudm1lX2Zv
cm1hdF9jbWQpICE9IDY0KTsKIAlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBudm1lX2RzbV9j
bWQpICE9IDY0KTsKKwlCVUlMRF9CVUdfT04oc2l6ZW9mKHN0cnVjdCBudm1lX2NvcHlfY29tbWFu
ZCkgIT0gNjQpOwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfd3JpdGVfemVyb2Vz
X2NtZCkgIT0gNjQpOwogCUJVSUxEX0JVR19PTihzaXplb2Yoc3RydWN0IG52bWVfYWJvcnRfY21k
KSAhPSA2NCk7CiAJQlVJTERfQlVHX09OKHNpemVvZihzdHJ1Y3QgbnZtZV9nZXRfbG9nX3BhZ2Vf
Y29tbWFuZCkgIT0gNjQpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hvc3QvZmMuYyBiL2Ry
aXZlcnMvbnZtZS9ob3N0L2ZjLmMKaW5kZXggMDgwZjg1ZjQxMDVmLi4wZmVhMjMxYjdjY2IgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L2ZjLmMKKysrIGIvZHJpdmVycy9udm1lL2hvc3Qv
ZmMuYwpAQCAtMjc4OCw2ICsyNzg4LDEwIEBAIG52bWVfZmNfcXVldWVfcnEoc3RydWN0IGJsa19t
cV9od19jdHggKmhjdHgsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAorCWlmICh1bmxpa2Vs
eSgocnEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSAmJiAocmVxX29wKHJxKSA9PSBSRVFfT1BfUkVB
RCkpKSB7CisJCWJsa19tcV9lbmRfcmVxdWVzdChycSwgQkxLX1NUU19PSyk7CisJCXJldHVybiBC
TEtfU1RTX09LOworCX0KIAkvKgogCSAqIG52bWUgY29yZSBkb2Vzbid0IHF1aXRlIHRyZWF0IHRo
ZSBycSBvcGFxdWVseS4gQ29tbWFuZHMgc3VjaAogCSAqIGFzIFdSSVRFIFpFUk9FUyB3aWxsIHJl
dHVybiBhIG5vbi16ZXJvIHJxIHBheWxvYWRfYnl0ZXMgeWV0CmRpZmYgLS1naXQgYS9kcml2ZXJz
L252bWUvaG9zdC9udm1lLmggYi9kcml2ZXJzL252bWUvaG9zdC9udm1lLmgKaW5kZXggYTJiNTNj
YTYzMzM1Li5kYzUxZmM2NDdmMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L252bWUu
aAorKysgYi9kcml2ZXJzL252bWUvaG9zdC9udm1lLmgKQEAgLTQ4Miw2ICs0ODIsMTMgQEAgc3Ry
dWN0IG52bWVfbnMgewogCiB9OwogCitzdHJ1Y3QgbnZtZV9jb3B5X3Rva2VuIHsKKwljaGFyIHN1
YnN5c1s0XTsKKwlzdHJ1Y3QgbnZtZV9ucyAqbnM7CisJdTY0IHNyY19zZWN0b3I7CisJdTY0IHNl
Y3RvcnM7Cit9OworCiAvKiBOVk1lIG5zIHN1cHBvcnRzIG1ldGFkYXRhIGFjdGlvbnMgYnkgdGhl
IGNvbnRyb2xsZXIgKGdlbmVyYXRlL3N0cmlwKSAqLwogc3RhdGljIGlubGluZSBib29sIG52bWVf
bnNfaGFzX3BpKHN0cnVjdCBudm1lX25zICpucykKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZt
ZS9ob3N0L3BjaS5jIGIvZHJpdmVycy9udm1lL2hvc3QvcGNpLmMKaW5kZXggM2FhY2YxYzBkNWE1
Li5iOTA4MWM5ODNiNmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L3BjaS5jCisrKyBi
L2RyaXZlcnMvbnZtZS9ob3N0L3BjaS5jCkBAIC01MTEsNiArNTExLDE0IEBAIHN0YXRpYyBpbmxp
bmUgdm9pZCBudm1lX3NxX2NvcHlfY21kKHN0cnVjdCBudm1lX3F1ZXVlICpudm1lcSwKIAkJbnZt
ZXEtPnNxX3RhaWwgPSAwOwogfQogCitzdGF0aWMgdm9pZCBudm1lX2NvbW1pdF9zcWRiKHN0cnVj
dCBudm1lX3F1ZXVlICpudm1lcSkKK3sKKwlzcGluX2xvY2soJm52bWVxLT5zcV9sb2NrKTsKKwlp
ZiAobnZtZXEtPnNxX3RhaWwgIT0gbnZtZXEtPmxhc3Rfc3FfdGFpbCkKKwkJbnZtZV93cml0ZV9z
cV9kYihudm1lcSwgdHJ1ZSk7CisJc3Bpbl91bmxvY2soJm52bWVxLT5zcV9sb2NrKTsKK30KKwog
c3RhdGljIHZvaWQgbnZtZV9jb21taXRfcnFzKHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4KQog
ewogCXN0cnVjdCBudm1lX3F1ZXVlICpudm1lcSA9IGhjdHgtPmRyaXZlcl9kYXRhOwpAQCAtOTE4
LDYgKzkyNiwxMSBAQCBzdGF0aWMgYmxrX3N0YXR1c190IG52bWVfcHJlcF9ycShzdHJ1Y3QgbnZt
ZV9kZXYgKmRldiwgc3RydWN0IHJlcXVlc3QgKnJlcSkKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwogCisJaWYgKHVubGlrZWx5KChyZXEtPmNtZF9mbGFncyAmIFJFUV9DT1BZKSAmJiAocmVxX29w
KHJlcSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfc3RhcnRfcmVxdWVzdChyZXEpOwor
CQlyZXR1cm4gQkxLX1NUU19PSzsKKwl9CisKIAlpZiAoYmxrX3JxX25yX3BoeXNfc2VnbWVudHMo
cmVxKSkgewogCQlyZXQgPSBudm1lX21hcF9kYXRhKGRldiwgcmVxLCAmaW9kLT5jbWQpOwogCQlp
ZiAocmV0KQpAQCAtOTMxLDYgKzk0NCw3IEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9wcmVw
X3JxKHN0cnVjdCBudm1lX2RldiAqZGV2LCBzdHJ1Y3QgcmVxdWVzdCAqcmVxKQogCX0KIAogCWJs
a19tcV9zdGFydF9yZXF1ZXN0KHJlcSk7CisKIAlyZXR1cm4gQkxLX1NUU19PSzsKIG91dF91bm1h
cF9kYXRhOgogCW52bWVfdW5tYXBfZGF0YShkZXYsIHJlcSk7CkBAIC05NjQsNiArOTc4LDE3IEBA
IHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9xdWV1ZV9ycShzdHJ1Y3QgYmxrX21xX2h3X2N0eCAq
aGN0eCwKIAlyZXQgPSBudm1lX3ByZXBfcnEoZGV2LCByZXEpOwogCWlmICh1bmxpa2VseShyZXQp
KQogCQlyZXR1cm4gcmV0OworCWlmICh1bmxpa2VseSgocmVxLT5jbWRfZmxhZ3MgJiBSRVFfQ09Q
WSkgJiYgKHJlcV9vcChyZXEpID09IFJFUV9PUF9SRUFEKSkpIHsKKwkJYmxrX21xX3NldF9yZXF1
ZXN0X2NvbXBsZXRlKHJlcSk7CisJCWJsa19tcV9lbmRfcmVxdWVzdChyZXEsIEJMS19TVFNfT0sp
OworCQkvKiBDb21taXQgdGhlIHNxIGlmIGNvcHkgcmVhZCB3YXMgdGhlIGxhc3QgcmVxIGluIHRo
ZSBsaXN0LAorCQkgKiBhcyBjb3B5IHJlYWQgZGVvZXNuJ3QgdXBkYXRlIHNxIGRiCisJCSAqLwor
CQlpZiAoYmQtPmxhc3QpCisJCQludm1lX2NvbW1pdF9zcWRiKG52bWVxKTsKKwkJcmV0dXJuIHJl
dDsKKwl9CisKIAlzcGluX2xvY2soJm52bWVxLT5zcV9sb2NrKTsKIAludm1lX3NxX2NvcHlfY21k
KG52bWVxLCAmaW9kLT5jbWQpOwogCW52bWVfd3JpdGVfc3FfZGIobnZtZXEsIGJkLT5sYXN0KTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L3JkbWEuYyBiL2RyaXZlcnMvbnZtZS9ob3N0
L3JkbWEuYwppbmRleCA1YTY5YTQ1YzViZDYuLjc4YWYzMzdjNTFiYiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9udm1lL2hvc3QvcmRtYS5jCisrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L3JkbWEuYwpAQCAt
MjA4Nyw2ICsyMDg3LDEyIEBAIHN0YXRpYyBibGtfc3RhdHVzX3QgbnZtZV9yZG1hX3F1ZXVlX3Jx
KHN0cnVjdCBibGtfbXFfaHdfY3R4ICpoY3R4LAogCWlmIChyZXQpCiAJCWdvdG8gdW5tYXBfcWU7
CiAKKwlpZiAodW5saWtlbHkoKHJxLT5jbWRfZmxhZ3MgJiBSRVFfQ09QWSkgJiYgKHJlcV9vcChy
cSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfZW5kX3JlcXVlc3QocnEsIEJMS19TVFNf
T0spOworCQlyZXQgPSBCTEtfU1RTX09LOworCQlnb3RvIHVubWFwX3FlOworCX0KKwogCWJsa19t
cV9zdGFydF9yZXF1ZXN0KHJxKTsKIAogCWlmIChJU19FTkFCTEVEKENPTkZJR19CTEtfREVWX0lO
VEVHUklUWSkgJiYKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZtZS9ob3N0L3RjcC5jIGIvZHJpdmVy
cy9udm1lL2hvc3QvdGNwLmMKaW5kZXggYWQzYTJiZjJmMWU5Li40ZTRjZGNmODIxMGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L3RjcC5jCisrKyBiL2RyaXZlcnMvbnZtZS9ob3N0L3Rj
cC5jCkBAIC0yMzk0LDYgKzIzOTQsMTEgQEAgc3RhdGljIGJsa19zdGF0dXNfdCBudm1lX3RjcF9z
ZXR1cF9jbWRfcGR1KHN0cnVjdCBudm1lX25zICpucywKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0
OwogCisJaWYgKHVubGlrZWx5KChycS0+Y21kX2ZsYWdzICYgUkVRX0NPUFkpICYmIChyZXFfb3Ao
cnEpID09IFJFUV9PUF9SRUFEKSkpIHsKKwkJYmxrX21xX3N0YXJ0X3JlcXVlc3QocmVxKTsKKwkJ
cmV0dXJuIEJMS19TVFNfT0s7CisJfQorCiAJcmVxLT5zdGF0ZSA9IE5WTUVfVENQX1NFTkRfQ01E
X1BEVTsKIAlyZXEtPnN0YXR1cyA9IGNwdV90b19sZTE2KE5WTUVfU0NfU1VDQ0VTUyk7CiAJcmVx
LT5vZmZzZXQgPSAwOwpAQCAtMjQ2Miw2ICsyNDY3LDE1IEBAIHN0YXRpYyBibGtfc3RhdHVzX3Qg
bnZtZV90Y3BfcXVldWVfcnEoc3RydWN0IGJsa19tcV9od19jdHggKmhjdHgsCiAKIAlibGtfbXFf
c3RhcnRfcmVxdWVzdChycSk7CiAKKwlpZiAodW5saWtlbHkoKHJxLT5jbWRfZmxhZ3MgJiBSRVFf
Q09QWSkgJiYgKHJlcV9vcChycSkgPT0gUkVRX09QX1JFQUQpKSkgeworCQlibGtfbXFfc2V0X3Jl
cXVlc3RfY29tcGxldGUocnEpOworCQlibGtfbXFfZW5kX3JlcXVlc3QocnEsIEJMS19TVFNfT0sp
OworCQkvKiBpZiBjb3B5IHJlYWQgaXMgdGhlIGxhc3QgcmVxIHF1ZXVlIHRjcCByZXFzICovCisJ
CWlmIChiZC0+bGFzdCAmJiBudm1lX3RjcF9xdWV1ZV9tb3JlKHF1ZXVlKSkKKwkJCXF1ZXVlX3dv
cmtfb24ocXVldWUtPmlvX2NwdSwgbnZtZV90Y3Bfd3EsICZxdWV1ZS0+aW9fd29yayk7CisJCXJl
dHVybiByZXQ7CisJfQorCiAJbnZtZV90Y3BfcXVldWVfcmVxdWVzdChyZXEsIHRydWUsIGJkLT5s
YXN0KTsKIAogCXJldHVybiBCTEtfU1RTX09LOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udm1lL2hv
c3QvdHJhY2UuYyBiL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNlLmMKaW5kZXggMmE4OWM1YWEwNzkw
Li5hYjcyYmY1NDZhMTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZtZS9ob3N0L3RyYWNlLmMKKysr
IGIvZHJpdmVycy9udm1lL2hvc3QvdHJhY2UuYwpAQCAtMTUwLDYgKzE1MCwyMyBAQCBzdGF0aWMg
Y29uc3QgY2hhciAqbnZtZV90cmFjZV9yZWFkX3dyaXRlKHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4
ICpjZHcxMCkKIAlyZXR1cm4gcmV0OwogfQogCitzdGF0aWMgY29uc3QgY2hhciAqbnZtZV90cmFj
ZV9jb3B5KHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkKK3sKKwljb25zdCBjaGFyICpy
ZXQgPSB0cmFjZV9zZXFfYnVmZmVyX3B0cihwKTsKKwl1NjQgc2xiYSA9IGdldF91bmFsaWduZWRf
bGU2NChjZHcxMCk7CisJdTggbnJfcmFuZ2UgPSBnZXRfdW5hbGlnbmVkX2xlMTYoY2R3MTAgKyA4
KTsKKwl1MTYgY29udHJvbCA9IGdldF91bmFsaWduZWRfbGUxNihjZHcxMCArIDEwKTsKKwl1MzIg
ZHNtZ210ID0gZ2V0X3VuYWxpZ25lZF9sZTMyKGNkdzEwICsgMTIpOworCXUzMiByZWZ0YWcgPSBn
ZXRfdW5hbGlnbmVkX2xlMzIoY2R3MTAgKyAgMTYpOworCisJdHJhY2Vfc2VxX3ByaW50ZihwLAor
CQkJICJzbGJhPSVsbHUsIG5yX3JhbmdlPSV1LCBjdHJsPTB4JXgsIGRzbWdtdD0ldSwgcmVmdGFn
PSV1IiwKKwkJCSBzbGJhLCBucl9yYW5nZSwgY29udHJvbCwgZHNtZ210LCByZWZ0YWcpOworCXRy
YWNlX3NlcV9wdXRjKHAsIDApOworCisJcmV0dXJuIHJldDsKK30KKwogc3RhdGljIGNvbnN0IGNo
YXIgKm52bWVfdHJhY2VfZHNtKHN0cnVjdCB0cmFjZV9zZXEgKnAsIHU4ICpjZHcxMCkKIHsKIAlj
b25zdCBjaGFyICpyZXQgPSB0cmFjZV9zZXFfYnVmZmVyX3B0cihwKTsKQEAgLTI0Myw2ICsyNjAs
OCBAQCBjb25zdCBjaGFyICpudm1lX3RyYWNlX3BhcnNlX252bV9jbWQoc3RydWN0IHRyYWNlX3Nl
cSAqcCwKIAkJcmV0dXJuIG52bWVfdHJhY2Vfem9uZV9tZ210X3NlbmQocCwgY2R3MTApOwogCWNh
c2UgbnZtZV9jbWRfem9uZV9tZ210X3JlY3Y6CiAJCXJldHVybiBudm1lX3RyYWNlX3pvbmVfbWdt
dF9yZWN2KHAsIGNkdzEwKTsKKwljYXNlIG52bWVfY21kX2NvcHk6CisJCXJldHVybiBudm1lX3Ry
YWNlX2NvcHkocCwgY2R3MTApOwogCWRlZmF1bHQ6CiAJCXJldHVybiBudm1lX3RyYWNlX2NvbW1v
bihwLCBjZHcxMCk7CiAJfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9udm1lLmggYi9pbmNs
dWRlL2xpbnV4L252bWUuaAppbmRleCBmNjI2YTQ0NWQxYTguLmVjMTI0OTJiMzA2MyAxMDA2NDQK
LS0tIGEvaW5jbHVkZS9saW51eC9udm1lLmgKKysrIGIvaW5jbHVkZS9saW51eC9udm1lLmgKQEAg
LTMxNiw3ICszMTYsNyBAQCBzdHJ1Y3QgbnZtZV9pZF9jdHJsIHsKIAlfX3U4CQkJbnZzY2M7CiAJ
X191OAkJCW53cGM7CiAJX19sZTE2CQkJYWN3dTsKLQlfX3U4CQkJcnN2ZDUzNFsyXTsKKwlfX2xl
MTYJCQlvY2ZzOwogCV9fbGUzMgkJCXNnbHM7CiAJX19sZTMyCQkJbW5hbjsKIAlfX3U4CQkJcnN2
ZDU0NFsyMjRdOwpAQCAtMzQ0LDYgKzM0NCw3IEBAIGVudW0gewogCU5WTUVfQ1RSTF9PTkNTX1dS
SVRFX1pFUk9FUwkJPSAxIDw8IDMsCiAJTlZNRV9DVFJMX09OQ1NfUkVTRVJWQVRJT05TCQk9IDEg
PDwgNSwKIAlOVk1FX0NUUkxfT05DU19USU1FU1RBTVAJCT0gMSA8PCA2LAorCU5WTUVfQ1RSTF9P
TkNTX0NPUFkJCQk9IDEgPDwgOCwKIAlOVk1FX0NUUkxfVldDX1BSRVNFTlQJCQk9IDEgPDwgMCwK
IAlOVk1FX0NUUkxfT0FDU19TRUNfU1VQUCAgICAgICAgICAgICAgICAgPSAxIDw8IDAsCiAJTlZN
RV9DVFJMX09BQ1NfTlNfTU5HVF9TVVBQCQk9IDEgPDwgMywKQEAgLTM5Myw3ICszOTQsMTAgQEAg
c3RydWN0IG52bWVfaWRfbnMgewogCV9fbGUxNgkJCW5wZGc7CiAJX19sZTE2CQkJbnBkYTsKIAlf
X2xlMTYJCQlub3dzOwotCV9fdTgJCQlyc3ZkNzRbMThdOworCV9fbGUxNgkJCW1zc3JsOworCV9f
bGUzMgkJCW1jbDsKKwlfX3U4CQkJbXNyYzsKKwlfX3U4CQkJcnN2ZDkxWzExXTsKIAlfX2xlMzIJ
CQlhbmFncnBpZDsKIAlfX3U4CQkJcnN2ZDk2WzNdOwogCV9fdTgJCQluc2F0dHI7CkBAIC03NTAs
NiArNzU0LDcgQEAgZW51bSBudm1lX29wY29kZSB7CiAJbnZtZV9jbWRfcmVzdl9yZXBvcnQJPSAw
eDBlLAogCW52bWVfY21kX3Jlc3ZfYWNxdWlyZQk9IDB4MTEsCiAJbnZtZV9jbWRfcmVzdl9yZWxl
YXNlCT0gMHgxNSwKKwludm1lX2NtZF9jb3B5CQk9IDB4MTksCiAJbnZtZV9jbWRfem9uZV9tZ210
X3NlbmQJPSAweDc5LAogCW52bWVfY21kX3pvbmVfbWdtdF9yZWN2CT0gMHg3YSwKIAludm1lX2Nt
ZF96b25lX2FwcGVuZAk9IDB4N2QsCkBAIC03NzEsNyArNzc2LDggQEAgZW51bSBudm1lX29wY29k
ZSB7CiAJCW52bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfcmVzdl9yZWxlYXNlKSwJXAogCQludm1l
X29wY29kZV9uYW1lKG52bWVfY21kX3pvbmVfbWdtdF9zZW5kKSwJXAogCQludm1lX29wY29kZV9u
YW1lKG52bWVfY21kX3pvbmVfbWdtdF9yZWN2KSwJXAotCQludm1lX29wY29kZV9uYW1lKG52bWVf
Y21kX3pvbmVfYXBwZW5kKSkKKwkJbnZtZV9vcGNvZGVfbmFtZShudm1lX2NtZF96b25lX2FwcGVu
ZCksCQlcCisJCW52bWVfb3Bjb2RlX25hbWUobnZtZV9jbWRfY29weSkpCiAKIAogCkBAIC05NDUs
NiArOTUxLDM2IEBAIHN0cnVjdCBudm1lX2RzbV9yYW5nZSB7CiAJX19sZTY0CQkJc2xiYTsKIH07
CiAKK3N0cnVjdCBudm1lX2NvcHlfY29tbWFuZCB7CisJX191OCAgICAgICAgICAgICAgICAgICAg
b3Bjb2RlOworCV9fdTggICAgICAgICAgICAgICAgICAgIGZsYWdzOworCV9fdTE2ICAgICAgICAg
ICAgICAgICAgIGNvbW1hbmRfaWQ7CisJX19sZTMyICAgICAgICAgICAgICAgICAgbnNpZDsKKwlf
X3U2NCAgICAgICAgICAgICAgICAgICByc3ZkMjsKKwlfX2xlNjQgICAgICAgICAgICAgICAgICBt
ZXRhZGF0YTsKKwl1bmlvbiBudm1lX2RhdGFfcHRyICAgICBkcHRyOworCV9fbGU2NCAgICAgICAg
ICAgICAgICAgIHNkbGJhOworCV9fdTgJCQlucl9yYW5nZTsKKwlfX3U4CQkJcnN2ZDEyOworCV9f
bGUxNiAgICAgICAgICAgICAgICAgIGNvbnRyb2w7CisJX19sZTE2ICAgICAgICAgICAgICAgICAg
cnN2ZDEzOworCV9fbGUxNgkJCWRzcGVjOworCV9fbGUzMiAgICAgICAgICAgICAgICAgIGlsYnJ0
OworCV9fbGUxNiAgICAgICAgICAgICAgICAgIGxiYXQ7CisJX19sZTE2ICAgICAgICAgICAgICAg
ICAgbGJhdG07Cit9OworCitzdHJ1Y3QgbnZtZV9jb3B5X3JhbmdlIHsKKwlfX2xlNjQJCQlyc3Zk
MDsKKwlfX2xlNjQJCQlzbGJhOworCV9fbGUxNgkJCW5sYjsKKwlfX2xlMTYJCQlyc3ZkMTg7CisJ
X19sZTMyCQkJcnN2ZDIwOworCV9fbGUzMgkJCWVpbGJydDsKKwlfX2xlMTYJCQllbGJhdDsKKwlf
X2xlMTYJCQllbGJhdG07Cit9OworCiBzdHJ1Y3QgbnZtZV93cml0ZV96ZXJvZXNfY21kIHsKIAlf
X3U4CQkJb3Bjb2RlOwogCV9fdTgJCQlmbGFnczsKQEAgLTE0OTksNiArMTUzNSw3IEBAIHN0cnVj
dCBudm1lX2NvbW1hbmQgewogCQlzdHJ1Y3QgbnZtZV9kb3dubG9hZF9maXJtd2FyZSBkbGZ3Owog
CQlzdHJ1Y3QgbnZtZV9mb3JtYXRfY21kIGZvcm1hdDsKIAkJc3RydWN0IG52bWVfZHNtX2NtZCBk
c207CisJCXN0cnVjdCBudm1lX2NvcHlfY29tbWFuZCBjb3B5OwogCQlzdHJ1Y3QgbnZtZV93cml0
ZV96ZXJvZXNfY21kIHdyaXRlX3plcm9lczsKIAkJc3RydWN0IG52bWVfem9uZV9tZ210X3NlbmRf
Y21kIHptczsKIAkJc3RydWN0IG52bWVfem9uZV9tZ210X3JlY3ZfY21kIHptcjsKLS0gCjIuMzUu
MS41MDAuZ2I4OTZmNzI5ZTIKCi0tCmRtLWRldmVsIG1haWxpbmcgbGlzdApkbS1kZXZlbEByZWRo
YXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21haWxtYW4vbGlzdGluZm8vZG0tZGV2
ZWwK

