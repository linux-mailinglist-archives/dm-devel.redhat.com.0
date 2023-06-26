Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5128F73E272
	for <lists+dm-devel@lfdr.de>; Mon, 26 Jun 2023 16:50:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687791049;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=96vBmk4XVYgIPH8Akhozy8osIyKb1PaFHWDYgvQ6OYI=;
	b=a1Oh6abRl+opKlQB95K4/vsltwoaHiMBl3OVR+BK5/V+DxjZfhw9UrnaL1pL1GikoU7FL0
	VOxqTiLeYrK/faQc280mNvvfI5yMXH2P772CJ4dlH6pfyR3CVDko1cAmkg1VMgaD2Xcc3h
	8Y3tGC12VYUcAqnWQn43DYbH/3Fgy6Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-vm42Z0eFPlmKY3O2Ekyo3g-1; Mon, 26 Jun 2023 10:50:32 -0400
X-MC-Unique: vm42Z0eFPlmKY3O2Ekyo3g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1D9A10726B8;
	Mon, 26 Jun 2023 14:49:31 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6C6352166B27;
	Mon, 26 Jun 2023 14:49:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id CD5701946A6B;
	Mon, 26 Jun 2023 14:49:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 92B55194658C
 for <dm-devel@listman.corp.redhat.com>; Mon, 26 Jun 2023 14:48:53 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C9AAC40C2063; Mon, 26 Jun 2023 14:48:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C2B1440C2071;
 Mon, 26 Jun 2023 14:48:53 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 56E2230C0457; Mon, 26 Jun 2023 14:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 543523F7CF; Mon, 26 Jun 2023 16:48:40 +0200 (CEST)
Date: Mon, 26 Jun 2023 16:48:40 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <98371eb9-cfb8-1cc8-6027-cdc52ebcf4ac@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH] dm: get rid of workarounds for __vmalloc and
 kvmalloc
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
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the past, the function __vmalloc didn't respect the GFP flags - it
allocated memory with the provided gfp flags, but it allocated page tables
with GFP_KERNEL. This was fixed in the commit
451769ebb7e792c3404db53b3c2a422990de654e, so the memalloc_noio_save /
memalloc_noio_restore workaround is no longer needed.

The function kvmalloc didn't like flags different from GFP_KERNEL. This 
was fixed in the commit a421ef303008b0ceee2cfc625c3246fa7654b0ca, so we 
can call kvmalloc with GFP_NOIO.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-bufio.c |   17 -----------------
 drivers/md/dm-ioctl.c |    5 +----
 2 files changed, 1 insertion(+), 21 deletions(-)

Index: linux-2.6/drivers/md/dm-bufio.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-bufio.c
+++ linux-2.6/drivers/md/dm-bufio.c
@@ -1157,23 +1157,6 @@ static void *alloc_buffer_data(struct dm
 
 	*data_mode = DATA_MODE_VMALLOC;
 
-	/*
-	 * __vmalloc allocates the data pages and auxiliary structures with
-	 * gfp_flags that were specified, but pagetables are always allocated
-	 * with GFP_KERNEL, no matter what was specified as gfp_mask.
-	 *
-	 * Consequently, we must set per-process flag PF_MEMALLOC_NOIO so that
-	 * all allocations done by this process (including pagetables) are done
-	 * as if GFP_NOIO was specified.
-	 */
-	if (gfp_mask & __GFP_NORETRY) {
-		unsigned int noio_flag = memalloc_noio_save();
-		void *ptr = __vmalloc(c->block_size, gfp_mask);
-
-		memalloc_noio_restore(noio_flag);
-		return ptr;
-	}
-
 	return __vmalloc(c->block_size, gfp_mask);
 }
 
Index: linux-2.6/drivers/md/dm-ioctl.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-ioctl.c
+++ linux-2.6/drivers/md/dm-ioctl.c
@@ -1877,7 +1877,6 @@ static int copy_params(struct dm_ioctl _
 	struct dm_ioctl *dmi;
 	int secure_data;
 	const size_t minimum_data_size = offsetof(struct dm_ioctl, data);
-	unsigned int noio_flag;
 
 	if (copy_from_user(param_kernel, user, minimum_data_size))
 		return -EFAULT;
@@ -1904,9 +1903,7 @@ static int copy_params(struct dm_ioctl _
 	 * Use kmalloc() rather than vmalloc() when we can.
 	 */
 	dmi = NULL;
-	noio_flag = memalloc_noio_save();
-	dmi = kvmalloc(param_kernel->data_size, GFP_KERNEL | __GFP_HIGH);
-	memalloc_noio_restore(noio_flag);
+	dmi = kvmalloc(param_kernel->data_size, GFP_NOIO | __GFP_HIGH);
 
 	if (!dmi) {
 		if (secure_data && clear_user(user, param_kernel->data_size))
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

