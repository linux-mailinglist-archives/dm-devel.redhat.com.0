Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BFBA825CD20
	for <lists+dm-devel@lfdr.de>; Fri,  4 Sep 2020 00:07:14 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-AwecPU4MNgG8TqOLpIhyCQ-1; Thu, 03 Sep 2020 18:07:11 -0400
X-MC-Unique: AwecPU4MNgG8TqOLpIhyCQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2475F807336;
	Thu,  3 Sep 2020 22:07:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4BB37E40C;
	Thu,  3 Sep 2020 22:07:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 81D1879DAA;
	Thu,  3 Sep 2020 22:06:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 083M6Ztg025647 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 18:06:36 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CF886F6CBC; Thu,  3 Sep 2020 22:06:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D0DF7FBE
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 22:06:33 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 614A4800296
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 22:06:33 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-480-kAbuL4I3Md-0zkmprG1G2Q-1; Thu, 03 Sep 2020 18:06:31 -0400
X-MC-Unique: kAbuL4I3Md-0zkmprG1G2Q-1
Received: by mail-pf1-f174.google.com with SMTP id k15so3418559pfc.12
	for <dm-devel@redhat.com>; Thu, 03 Sep 2020 15:06:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:content-transfer-encoding:mime-version
	:subject:message-id:date:to;
	bh=NOB0XxKFqylLUTpgMkWkzbm2NaEJ4jL0D7Kk4Vr8OI8=;
	b=LI8Ry3CKMAljMpD0ltvmVyNIa+y59n6+uctfdn8E2LSjsk6rojDAYM+kE8255Psm7h
	vkZpCUpfaGAcDBiR/ljDwpMUmdFF8RReUTZnSPITC91YeWq1Yk7gZWsIPBrNbXZrxNta
	x98AOMWJgYUPdyKszGj5tJK8b3xUGVx420LK2YcfFOQ6hjVTTdhQgTm2H52oh746Tsu/
	mmAwhKveQUotyX7Fj3LF5D9/1TGLz5KMiNNgl/8c/IBvEF2rMfAvt9E7Dq/N+Dul5gjX
	HuOAFF2u5Ix8TvAz31oCn6lN49j9+t3iEIg3dcnStTEioJTKj/NokrlpougqZyWED3jM
	UZOQ==
X-Gm-Message-State: AOAM530IrvAu02DvrsLZM6QtkvEd7aQ3cv/2ZFUn1KA0T3Caf16msFIH
	WR61ZaQ8V/Qr0gyxsSDhx3FXLQJVWsPoOfx4OYbG8B+J+P6u3ZeiBYIFY6Ks1EX8vTqGNWjTr7g
	/STcu9IJgFjq96t3YoIhvt7iYxXdEMalrCJBpoqj323fRBU1zUXibq4KzeH5lvOkjViuHeQ==
X-Google-Smtp-Source: ABdhPJx41GEKejXGfmKdi7te2CQbS4u+LKzPsADVv+rtmDcJWI+GQMwcVOSZ8YRX5VKO3DvzGy72Zg==
X-Received: by 2002:a63:4921:: with SMTP id w33mr4367227pga.199.1599170789104; 
	Thu, 03 Sep 2020 15:06:29 -0700 (PDT)
Received: from localhost.localdomain ([192.30.189.3])
	by smtp.gmail.com with ESMTPSA id
	e7sm1997908pfm.114.2020.09.03.15.06.28 for <dm-devel@redhat.com>
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 03 Sep 2020 15:06:28 -0700 (PDT)
From: Brian Bunker <brian@purestorage.com>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.0.3\))
Message-Id: <748F6AC8-25D9-4F71-AAD5-7FF0CCB30C2F@purestorage.com>
Date: Thu, 3 Sep 2020 15:06:26 -0700
To: device-mapper development <dm-devel@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 083M6Ztg025647
X-loop: dm-devel@redhat.com
Subject: [dm-devel] kernel BUG at
	drivers/scsi/device_handler/scsi_dh_alua.c:662!
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.503
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8gYWxsLAoKV2UgaGF2ZSBhIGN1c3RvbWVyIHdobyBoYXMgaGl0IHRoaXMgbGluZS4gCgpJ
dCBjb21lcyBmcm9tIGhlcmUgKHNjc2lfZGhfYWx1YS5jIEFMVUFfREhfVkVSIOKAnDIuMCIpOgoK
cmN1X3JlYWRfbG9jaygpOwogbGlzdF9mb3JfZWFjaF9lbnRyeV9yY3UoaCwKCSZ0bXBfcGctPmRo
X2xpc3QsIG5vZGUpIHsKCS8qIGgtPnNkZXYgc2hvdWxkIGFsd2F5cyBiZSB2YWxpZCAqLwoJQlVH
X09OKCFoLT5zZGV2KTsKCWgtPnNkZXYtPmFjY2Vzc19zdGF0ZSA9IGRlc2NbMF07Cn0KcmN1X3Jl
YWRfdW5sb2NrKCk7CgpJdCBzZWVtcyBsaWtlIHRoaXMgY29kZSBpcyBzZW5kaW5nIGFuIFJUUEcg
cmVxdWVzdCBkb3duIGEgcGF0aCBhbmQgdGhlbiBpcyB0cnlpbmcgdG8gZ2V0IHRoZSBhY2Nlc3Mg
c3RhdGUgZm9yIHRoZQpvdGhlciBwYXRocyB0byB0aGlzIHNhbWUgbXVsdGlwYXRoIGRldmljZSBi
eSBsb29raW5nIGF0IHRoZSBTQ1NJIGRldmljZXMgZG93biB0aG9zZSBwYXRocy4gSW4gb3VyIGNh
c2Ugd2UgaGF2ZSAKYSByZWJvb3Qgb2YgYSBjb3VwbGUgb2Ygb3VyIGNvbnRyb2xsZXJzIHdoaWNo
IGxlYWRzIHRvIHRoZSBBTFVBIGRldmljZSBoYW5kbGVyIGRldGFjaGluZyBmcm9tIHRoZSBub3cg
dW5yZWFjaGFibGUKcGF0aHMuIAoKSSBjYW4gc2VlIHRoYXQgd2hlbiB0aGlzIGNvZGUgaXMgd29y
a2luZyB0aGF0IHRoaXMgY29kZSBnb2VzIHRocm91Z2ggdGhlIHJlbWFpbmluZyBwYXRocy4gRm9y
IGV4YW1wbGUsIGlmIEkgaGF2ZSA0CnBhdGhzIGluIHRoZSBiZWdpbm5pbmcgSSBjYW4gc2VlIHRo
YXQgdGhpcyBsb29wIGlzIGhpdCA0IHRpbWVzLiBXaGVuIEkgcmVib290IGEgY29udHJvbGxlciBh
bmQgZHJvcCB0byAyIHBhdGhzLCBmb3IKZXhhbXBsZSwgSSBzZWUgdGhpcyBjb2RlIGdvaW5nIHRo
cm91Z2ggdGhlIGxvb3AgMiB0aW1lcy4KCkhhcyB0aGlzIGJlZW4gc2VlbiBiZWZvcmU/IElzIHRo
ZXJlIGEgcG90ZW50aWFsIHJhY2UgYmV0d2VlbiB0aGUgQUxVQSBoYW5kbGVyIGRldGFjaCBhbmQg
dHJ5aW5nIGFjY2VzcyB0aGUKU0NTSSBkZXZpY2VzIGRvd24gdGhlIHBhdGhzIHdoaWNoIGhhdmUg
anVzdCBiZWVuIGRldGFjaGVkPwoKVGhlIHRpbWUgYmV0d2VlbiB0aGUgbGFzdCBkZXRhY2ggbG9n
Z2VkIGFuZCB0aGUgY3Jhc2ggaXMgYWJvdXQgMS8xMHRoIG9mIHNlY29uZDoKWyAxOTUzLjQ1MTIw
M10gc2NzaSAyOjA6MzoxODQ6IGFsdWE6IERldGFjaGVkClsgMTk1My40NTEyMTddIHNkIDI6MDox
OjE4NDogYWx1YTogcG9ydCBncm91cCAwMiBzdGF0ZSBBIG5vbi1wcmVmZXJyZWQgc3VwcG9ydHMg
dG9sVVNOQQpbIDE5NTMuNDY0NDQ1XSBzZCAyOjA6MjoxODQ6IGFsdWE6IHBvcnQgZ3JvdXAgMDMg
c3RhdGUgQSBub24tcHJlZmVycmVkIHN1cHBvcnRzIHRvbFVTTkEKWyAxOTUzLjQ3MzQ0M10gc2Qg
MjowOjI6MTg0OiBhbHVhOiBwb3J0IGdyb3VwIDAzIHN0YXRlIEEgbm9uLXByZWZlcnJlZCBzdXBw
b3J0cyB0b2xVU05BClsgMTk1My40ODIxMzRdIHNkIDI6MDoxOjE4NDogYWx1YTogcG9ydCBncm91
cCAwMiBzdGF0ZSBBIG5vbi1wcmVmZXJyZWQgc3VwcG9ydHMgdG9sVVNOQQpbIDE5NTMuNDkwOTc5
XSBzZCAyOjA6MjoxODQ6IGFsdWE6IHBvcnQgZ3JvdXAgMDMgc3RhdGUgQSBub24tcHJlZmVycmVk
IHN1cHBvcnRzIHRvbFVTTkEKWyAxOTUzLjQ5OTgzM10gc2QgMjowOjE6MTg0OiBhbHVhOiBwb3J0
IGdyb3VwIDAyIHN0YXRlIEEgbm9uLXByZWZlcnJlZCBzdXBwb3J0cyB0b2xVU05BClsgMTk1My41
MTg3OTNdIGRldmljZS1tYXBwZXI6IG11bHRpcGF0aDogRmFpbGluZyBwYXRoIDg6MTc2LgpbIDE5
NTMuNTI0ODU5XSBkZXZpY2UtbWFwcGVyOiBtdWx0aXBhdGg6IEZhaWxpbmcgcGF0aCA2ODo0OTYu
ClsgMTk1My41MzEwMDZdIGRldmljZS1tYXBwZXI6IG11bHRpcGF0aDogRmFpbGluZyBwYXRoIDY5
Ojc4NC4KWyAxOTUzLjUzNzE1Ml0gZGV2aWNlLW1hcHBlcjogbXVsdGlwYXRoOiBGYWlsaW5nIHBh
dGggMTMzOjgzMi4KWyAxOTUzLjU0MzM5MF0gZGV2aWNlLW1hcHBlcjogbXVsdGlwYXRoOiBGYWls
aW5nIHBhdGggODoxMTA0LgpbIDE5NTMuNTQ5NTQ0XSBkZXZpY2UtbWFwcGVyOiBtdWx0aXBhdGg6
IEZhaWxpbmcgcGF0aCA3MToxMTM2LgpbIDE5NTMuNTU1ODM1XSAtLS0tLS0tLS0tLS1bIGN1dCBo
ZXJlIF0tLS0tLS0tLS0tLS0KWyAxOTUzLjU2MDk5NV0ga2VybmVsIEJVRyBhdCBkcml2ZXJzL3Nj
c2kvZGV2aWNlX2hhbmRsZXIvc2NzaV9kaF9hbHVhLmM6NjYyIQoKRnVsbCBzdGFja3RyYWNlIGhl
cmU6ClsgMTk1My41NTU4MzVdIC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQpb
IDE5NTMuNTYwOTk1XSBrZXJuZWwgQlVHIGF0IGRyaXZlcnMvc2NzaS9kZXZpY2VfaGFuZGxlci9z
Y3NpX2RoX2FsdWEuYzo2NjIhClsgMTk1My41Njg1ODFdIGludmFsaWQgb3Bjb2RlOiAwMDAwIFsj
MV0gU01QIE5PUFRJClsgMTk1My41NzM2NDJdIENQVTogODIgUElEOiA5MTAxIENvbW06IGt3b3Jr
ZXIvODI6MSBLZHVtcDogbG9hZGVkIE5vdCB0YWludGVkIDUuNC4xNy0yMDExLjUuMy5lbDd1ZWsu
eDg2XzY0ICMyClsgMTk1My41ODQ1MTddIEhhcmR3YXJlIG5hbWU6IEhQRSBTdXBlcmRvbWUgRmxl
eC9TdXBlcmRvbWUgRmxleCwgQklPUyBCdW5kbGU6My4yNS40NiBTRlc6SVAxNDcuMDA3LjAwMi4x
MzIuMDAwLjIwMDQyMzIxMjUgMDQvMjMvMjAyMApbIDE5NTMuNTk3NTI4XSBXb3JrcXVldWU6IGth
bHVhZCBhbHVhX3J0cGdfd29yawpbIDE5NTMuNjAyMjk0XSBSSVA6IDAwMTA6YWx1YV9ydHBnKzB4
N2QzLzB4N2RjClsgMTk1My42MDY5NjRdIENvZGU6IDQ1IDg0IGM5IDBmIDg0IGFlIGZiIGZmIGZm
IDQ1IDg4IDhjIDI0IDU0IDAxIDAwIDAwIGU5IGIwIGZiIGZmIGZmIDQ5IGM3IDg0IDI0IDYwIDAx
IDAwIDAwIDAyIDAwIDAwIDAwIDQxIGIyIDBhIGU5IDZmIGZmIGZmIGZmIDwwZj4gMGIgZTggMTYg
NWQgYTUgZmYgMGYgMGIgMGYgMWYgNDAgMDAgMGYgMWYgNDQgMDAgMDAgNTUgNDggODkgZTUKWyAx
OTUzLjYyNzkyMl0gUlNQOiAwMDE4OmZmZmY5ZWU4ZTRhN2ZjZjAgRUZMQUdTOiAwMDAxMDA0Ngpb
IDE5NTMuNjMzNzU2XSBSQVg6IGZmZmY4YTVjYmE4NzFjMjggUkJYOiAwMDAwMDAwMDAwMDAwMDUw
IFJDWDogMDAwMDAwMDAwMDAwMDAwMApbIDE5NTMuNjQxNzIyXSBSRFg6IGZmZmY4YTYzNDI1MWJi
NDAgUlNJOiAwMDAwMDAwMDAwMDAwMDAyIFJESTogZmZmZjhhNWNiYTg3MWUyMApbIDE5NTMuNjQ5
NjgxXSBSQlA6IGZmZmY5ZWU4ZTRhN2ZkYTggUjA4OiAwMDAwMDAwMDAwMDAwMDA0IFIwOTogMDAw
MDAwMDAwMDAwMDAzYwpbIDE5NTMuNjU3NjQ1XSBSMTA6IDAwMDAwMDAwMDAwMDAwMDAgUjExOiBm
ZmZmOGFjMDhkZmY1MTAwIFIxMjogZmZmZjhhNWJjOTZkNWMwMApbIDE5NTMuNjY1NjEwXSBSMTM6
IGZmZmY4YTVjYmE4NzFjMDAgUjE0OiBmZmZmOGFiYjhjM2IxYTUwIFIxNTogZmZmZjhhNWNiYTg3
MWUyMApbIDE5NTMuNjczNTgxXSBGUzogIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjhh
Y2ZiZWI4MDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsgMTk1My42ODI2MTJdIENT
OiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWyAxOTUzLjY4
OTAyN10gQ1IyOiAwMDAwN2ZmZmY3ZmY0MDAwIENSMzogMDAwMDAwYWY0NDAwYTAwNCBDUjQ6IDAw
MDAwMDAwMDA3NjA2ZTAKWyAxOTUzLjY5Njk5Ml0gRFIwOiAwMDAwMDAwMDAwMDAwMDAwIERSMTog
MDAwMDAwMDAwMDAwMDAwMCBEUjI6IDAwMDAwMDAwMDAwMDAwMDAKWyAxOTUzLjcwNDk1OV0gRFIz
OiAwMDAwMDAwMDAwMDAwMDAwIERSNjogMDAwMDAwMDBmZmZlMGZmMCBEUjc6IDAwMDAwMDAwMDAw
MDA0MDAKWyAxOTUzLjcxMjkyNV0gUEtSVTogNTU1NTU1NTQKWyAxOTUzLjcxNTkzOF0gQ2FsbCBU
cmFjZToKWyAxOTUzLjcxODY3Nl0gID8gYWNjb3VudF9lbnRpdHlfZGVxdWV1ZSsweDgxLzB4YWQK
WyAxOTUzLjcyMzczNF0gIGFsdWFfcnRwZ193b3JrKzB4MjU3LzB4NTJjClsgMTk1My43MjgwMTJd
ICA/IHRyYWNpbmdfaXNfb24rMHgxNS8weDI4ClsgMTk1My43MzIyMDNdICA/IF9fc3dpdGNoX3Rv
X2FzbSsweDM2LzB4NjEKWyAxOTUzLjczNjU4Ml0gIHByb2Nlc3Nfb25lX3dvcmsrMHgxNzkvMHgz
ODkKWyAxOTUzLjc0MTA1MF0gIHdvcmtlcl90aHJlYWQrMHg0Zi8weDNkZgpbIDE5NTMuNzQ1MTQw
XSAga3RocmVhZCsweDEwNS8weDEzOApbIDE5NTMuNzQ4NzQ0XSAgPyBtYXhfYWN0aXZlX3N0b3Jl
KzB4ODAvMHg3YwpbIDE5NTMuNzUzMjIxXSAgPyBrdGhyZWFkX2JpbmQrMHgyMC8weDE1ClsgMTk1
My43NTczMDldICByZXRfZnJvbV9mb3JrKzB4MjQvMHgzNgpbIDE5NTMuNzYxMjk5XSBNb2R1bGVz
IGxpbmtlZCBpbjogcmRzX3RjcCByZHMgZnVzZSBidHJmcyB4b3IgenN0ZF9kZWNvbXByZXNzIHpz
dGRfY29tcHJlc3MgcmFpZDZfcHEgbXNkb3MgZXh0NCBqYmQyIGV4dDIgbWJjYWNoZSBuZnN2MyBu
ZnNfYWNsIG5mcyBsb2NrZCBncmFjZSBmc2NhY2hlIGJvbmRpbmcgaWJfaXNlcnQgaXNjc2lfdGFy
Z2V0X21vZCBpYl9zcnB0IHRhcmdldF9jb3JlX21vZCBpYl9zcnAgc2NzaV90cmFuc3BvcnRfc3Jw
IGliX2lwb2liIGliX3VtYWQgaW50ZWxfcmFwbF9tc3IgcnBjcmRtYSBzdW5ycGMgcmRtYV91Y20g
aWJfaXNlciByZG1hX2NtIGl3X2NtIGliX2NtIGxpYmlzY3NpIHNjc2lfdHJhbnNwb3J0X2lzY3Np
IGlUQ09fd2R0IGlUQ09fdmVuZG9yX3N1cHBvcnQgaW50ZWxfcmFwbF9jb21tb24geDg2X3BrZ190
ZW1wX3RoZXJtYWwgaW50ZWxfcG93ZXJjbGFtcCBjb3JldGVtcCBrdm1faW50ZWwga3ZtIGlycWJ5
cGFzcyBjcmN0MTBkaWZfcGNsbXVsIGNyYzMyX3BjbG11bCBnaGFzaF9jbG11bG5pX2ludGVsIGFl
c25pX2ludGVsIGNyeXB0b19zaW1kIGNyeXB0ZCBnbHVlX2hlbHBlciBwY3Nwa3IgaXhnYmUgbWRp
byBkY2EgdmZhdCBmYXQgYm54dF9yZSBpYl91dmVyYnMgaTQwZSBpYl9jb3JlIGlwbWlfc3NpZiBp
MmNfaTgwMSBscGNfaWNoIGpveWRldiBzZyB3bWkgaXBtaV9zaSBpcG1pX2RldmludGYgaXBtaV9t
c2doYW5kbGVyIGJpbmZtdF9taXNjIGlwX3RhYmxlcyB4ZnMgbGliY3JjMzJjIGRtX3F1ZXVlX2xl
bmd0aCBzcl9tb2QgY2Ryb20gc2RfbW9kIG1nYWcyMDAgdWFzIGRybV9rbXNfaGVscGVyIHN5c2Nv
cHlhcmVhIHVzYl9zdG9yYWdlIHN5c2ZpbGxyZWN0IGRtX211bHRpcGF0aCBzeXNpbWdibHQgZmJf
c3lzX2ZvcHMgZHJtX3ZyYW1faGVscGVyIHFsYTJ4eHggdHRtIGFoY2kgZHJtIG52bWVfZmMgYm54
dF9lbiBsaWJhaGNpIG1lZ2FyYWlkX3NhcyBudm1lX2ZhYnJpY3MgbGliYXRhIG52bWVfY29yZSBz
Y3NpX3RyYW5zcG9ydF9mYwpbIDE5NTMuNzYxMzU1XSAgaTJjX2FsZ29fYml0IGRtX21pcnJvciBk
bV9yZWdpb25faGFzaCBkbV9sb2cgZG1fbW9kCgpUaGFua3MsCkJyaWFuCgpCcmlhbiBCdW5rZXIK
U1cgRW5nCmJyaWFuQHB1cmVzdG9yYWdlLmNvbQoKCgoKLS0KZG0tZGV2ZWwgbWFpbGluZyBsaXN0
CmRtLWRldmVsQHJlZGhhdC5jb20KaHR0cHM6Ly93d3cucmVkaGF0LmNvbS9tYWlsbWFuL2xpc3Rp
bmZvL2RtLWRldmVs

