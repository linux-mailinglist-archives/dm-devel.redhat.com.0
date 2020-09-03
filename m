Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 520EE25BAC0
	for <lists+dm-devel@lfdr.de>; Thu,  3 Sep 2020 08:02:33 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-sykhGwduNsirvKz-ApwhoA-1; Thu, 03 Sep 2020 02:02:30 -0400
X-MC-Unique: sykhGwduNsirvKz-ApwhoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89AA61084CA3;
	Thu,  3 Sep 2020 06:02:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6629C70C2D;
	Thu,  3 Sep 2020 06:02:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EE1579DBA;
	Thu,  3 Sep 2020 06:02:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08362LLd004084 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 3 Sep 2020 02:02:21 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F38192028CCE; Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EED86200AE75
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D518918AE947
	for <dm-devel@redhat.com>; Thu,  3 Sep 2020 06:02:20 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-252-va6-OtYnP4mf35zdWzUcPg-1; Thu, 03 Sep 2020 02:02:19 -0400
X-MC-Unique: va6-OtYnP4mf35zdWzUcPg-1
Received: from [2001:4bb8:184:af1:c70:4a89:bc61:2] (helo=localhost)
	by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDhze-0007OE-HE; Thu, 03 Sep 2020 05:41:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Thu,  3 Sep 2020 07:40:56 +0200
Message-Id: <20200903054104.228829-2-hch@lst.de>
In-Reply-To: <20200903054104.228829-1-hch@lst.de>
References: <20200903054104.228829-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
	casper.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-raid@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-ide@vger.kernel.org,
	dm-devel@redhat.com, target-devel@vger.kernel.org, drbd-dev@tron.linbit.com
Subject: [dm-devel] [PATCH 1/9] Documentation/hdio: fix up obscure
	bd_contains references
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bd_contains is an implementation detail and should not be mentioned in
a userspace API documentation.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 Documentation/userspace-api/ioctl/hdio.rst | 24 +++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/hdio.rst b/Documentation/userspace-api/ioctl/hdio.rst
index e822e3dff1769b..817371bf94e948 100644
--- a/Documentation/userspace-api/ioctl/hdio.rst
+++ b/Documentation/userspace-api/ioctl/hdio.rst
@@ -181,7 +181,7 @@ HDIO_SET_UNMASKINTR
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY	Controller busy
@@ -231,7 +231,7 @@ HDIO_SET_MULTCOUNT
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range supported by disk.
 	  - EBUSY	Controller busy or blockmode already set.
@@ -295,7 +295,7 @@ HDIO_GET_IDENTITY
 		the ATA specification.
 
 	error returns:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - ENOMSG	IDENTIFY DEVICE information not available
 
 	notes:
@@ -355,7 +355,7 @@ HDIO_SET_KEEPSETTINGS
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY		Controller busy
@@ -1055,7 +1055,7 @@ HDIO_SET_32BIT
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 3]
 	  - EBUSY	Controller busy
@@ -1085,7 +1085,7 @@ HDIO_SET_NOWERR
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY		Controller busy
@@ -1113,7 +1113,7 @@ HDIO_SET_DMA
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY	Controller busy
@@ -1141,7 +1141,7 @@ HDIO_SET_PIO_MODE
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 255]
 	  - EBUSY	Controller busy
@@ -1237,7 +1237,7 @@ HDIO_SET_WCACHE
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY	Controller busy
@@ -1265,7 +1265,7 @@ HDIO_SET_ACOUSTIC
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 254]
 	  - EBUSY	Controller busy
@@ -1305,7 +1305,7 @@ HDIO_SET_ADDRESS
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 2]
 	  - EBUSY		Controller busy
@@ -1331,7 +1331,7 @@ HDIO_SET_IDE_SCSI
 
 
 	error return:
-	  - EINVAL	(bdev != bdev->bd_contains) (not sure what this means)
+	  - EINVAL	Called on a partition instead of the whole disk device
 	  - EACCES	Access denied:  requires CAP_SYS_ADMIN
 	  - EINVAL	value out of range [0 1]
 	  - EBUSY	Controller busy
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

