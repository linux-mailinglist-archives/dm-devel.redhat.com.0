Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D034FA484
	for <lists+dm-devel@lfdr.de>; Sat,  9 Apr 2022 06:55:44 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-KjpZKAuEPDWcbf_UzvOAJw-1; Sat, 09 Apr 2022 00:55:40 -0400
X-MC-Unique: KjpZKAuEPDWcbf_UzvOAJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82EA01C08DDA;
	Sat,  9 Apr 2022 04:55:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 37EA34047D30;
	Sat,  9 Apr 2022 04:55:37 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A0DC81940356;
	Sat,  9 Apr 2022 04:55:36 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 245B7194034D
 for <dm-devel@listman.corp.redhat.com>; Sat,  9 Apr 2022 04:55:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id DF37443E38A; Sat,  9 Apr 2022 04:55:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast09.extmail.prod.ext.rdu2.redhat.com [10.11.55.25])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DB04F43E38E
 for <dm-devel@redhat.com>; Sat,  9 Apr 2022 04:55:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C27EE29AB449
 for <dm-devel@redhat.com>; Sat,  9 Apr 2022 04:55:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-G0ygWA1GPjK7Utgy3EJYoA-1; Sat, 09 Apr 2022 00:55:25 -0400
X-MC-Unique: G0ygWA1GPjK7Utgy3EJYoA-1
Received: from 213-147-167-116.nat.highway.webapn.at ([213.147.167.116]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd33w-0020Yw-4P; Sat, 09 Apr 2022 04:51:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Sat,  9 Apr 2022 06:50:21 +0200
Message-Id: <20220409045043.23593-6-hch@lst.de>
In-Reply-To: <20220409045043.23593-1-hch@lst.de>
References: <20220409045043.23593-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Mimecast-Spam-Signature: yes
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH 05/27] drbd: use bdev based limit helpers in
 drbd_send_sizes
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
Cc: jfs-discussion@lists.sourceforge.net, linux-nvme@lists.infradead.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, drbd-dev@lists.linbit.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-scsi@vger.kernel.org, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org,
 linux-um@lists.infradead.org, nbd@other.debian.org,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-raid@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org,
 =?UTF-8?q?Christoph=20B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 ntfs3@lists.linux.dev, linux-btrfs@vger.kernel.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VXNlIHRoZSBiZGV2IGJhc2VkIGxpbWl0cyBoZWxwZXJzIHdoZXJlIHRoZXkgZXhpc3QuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQtYnk6IENocmlz
dG9waCBCw7ZobXdhbGRlciA8Y2hyaXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+Ci0tLQog
ZHJpdmVycy9ibG9jay9kcmJkL2RyYmRfbWFpbi5jIHwgMTIgKysrKysrKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyBiL2RyaXZlcnMvYmxvY2svZHJiZC9kcmJkX21h
aW4uYwppbmRleCAxMjYyZmUxYzMzNjE4Li5hYTJjMjFhZWI3NDdjIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMKKysrIGIvZHJpdmVycy9ibG9jay9kcmJkL2RyYmRf
bWFpbi5jCkBAIC05MjQsNyArOTI0LDkgQEAgaW50IGRyYmRfc2VuZF9zaXplcyhzdHJ1Y3QgZHJi
ZF9wZWVyX2RldmljZSAqcGVlcl9kZXZpY2UsIGludCB0cmlnZ2VyX3JlcGx5LCBlbnUKIAogCW1l
bXNldChwLCAwLCBwYWNrZXRfc2l6ZSk7CiAJaWYgKGdldF9sZGV2X2lmX3N0YXRlKGRldmljZSwg
RF9ORUdPVElBVElORykpIHsKLQkJc3RydWN0IHJlcXVlc3RfcXVldWUgKnEgPSBiZGV2X2dldF9x
dWV1ZShkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldik7CisJCXN0cnVjdCBibG9ja19kZXZpY2Ug
KmJkZXYgPSBkZXZpY2UtPmxkZXYtPmJhY2tpbmdfYmRldjsKKwkJc3RydWN0IHJlcXVlc3RfcXVl
dWUgKnEgPSBiZGV2X2dldF9xdWV1ZShiZGV2KTsKKwogCQlkX3NpemUgPSBkcmJkX2dldF9tYXhf
Y2FwYWNpdHkoZGV2aWNlLT5sZGV2KTsKIAkJcmN1X3JlYWRfbG9jaygpOwogCQl1X3NpemUgPSBy
Y3VfZGVyZWZlcmVuY2UoZGV2aWNlLT5sZGV2LT5kaXNrX2NvbmYpLT5kaXNrX3NpemU7CkBAIC05
MzMsMTMgKzkzNSwxMyBAQCBpbnQgZHJiZF9zZW5kX3NpemVzKHN0cnVjdCBkcmJkX3BlZXJfZGV2
aWNlICpwZWVyX2RldmljZSwgaW50IHRyaWdnZXJfcmVwbHksIGVudQogCQltYXhfYmlvX3NpemUg
PSBxdWV1ZV9tYXhfaHdfc2VjdG9ycyhxKSA8PCA5OwogCQltYXhfYmlvX3NpemUgPSBtaW4obWF4
X2Jpb19zaXplLCBEUkJEX01BWF9CSU9fU0laRSk7CiAJCXAtPnFsaW0tPnBoeXNpY2FsX2Jsb2Nr
X3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfcGh5c2ljYWxfYmxvY2tfc2l6ZShxKSk7CisJ
CQljcHVfdG9fYmUzMihiZGV2X3BoeXNpY2FsX2Jsb2NrX3NpemUoYmRldikpOwogCQlwLT5xbGlt
LT5sb2dpY2FsX2Jsb2NrX3NpemUgPQotCQkJY3B1X3RvX2JlMzIocXVldWVfbG9naWNhbF9ibG9j
a19zaXplKHEpKTsKKwkJCWNwdV90b19iZTMyKGJkZXZfbG9naWNhbF9ibG9ja19zaXplKGJkZXYp
KTsKIAkJcC0+cWxpbS0+YWxpZ25tZW50X29mZnNldCA9CiAJCQljcHVfdG9fYmUzMihxdWV1ZV9h
bGlnbm1lbnRfb2Zmc2V0KHEpKTsKLQkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIocXVl
dWVfaW9fbWluKHEpKTsKLQkJcC0+cWxpbS0+aW9fb3B0ID0gY3B1X3RvX2JlMzIocXVldWVfaW9f
b3B0KHEpKTsKKwkJcC0+cWxpbS0+aW9fbWluID0gY3B1X3RvX2JlMzIoYmRldl9pb19taW4oYmRl
dikpOworCQlwLT5xbGltLT5pb19vcHQgPSBjcHVfdG9fYmUzMihiZGV2X2lvX29wdChiZGV2KSk7
CiAJCXAtPnFsaW0tPmRpc2NhcmRfZW5hYmxlZCA9IGJsa19xdWV1ZV9kaXNjYXJkKHEpOwogCQlw
dXRfbGRldihkZXZpY2UpOwogCX0gZWxzZSB7Ci0tIAoyLjMwLjIKCi0tCmRtLWRldmVsIG1haWxp
bmcgbGlzdApkbS1kZXZlbEByZWRoYXQuY29tCmh0dHBzOi8vbGlzdG1hbi5yZWRoYXQuY29tL21h
aWxtYW4vbGlzdGluZm8vZG0tZGV2ZWwK

