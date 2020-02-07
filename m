Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 78A76155F9A
	for <lists+dm-devel@lfdr.de>; Fri,  7 Feb 2020 21:27:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581107248;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U5lt9I3L5dTzewuT3x++YUndEc3ZdlIBwMbamM4D1v4=;
	b=Gjh6Rv4hfoNdvlj+0vRp7fKyOdCtjrMVZyeNtMknfGYOlhIB+AwKWB4aYPuTVBqOMNK28D
	06qIkccl+TNDgo2szGJQtEopbvspafphLOkPgYs2w9wydE62VbdElLaRK/2Kcvl61uj9R1
	jUO65sFh/32Ag7FihyzD7PYmskfqwFU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-lkqIIwoFOVKc3-vZv0eDhw-1; Fri, 07 Feb 2020 15:27:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66FFC1902EA4;
	Fri,  7 Feb 2020 20:27:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 394F187B00;
	Fri,  7 Feb 2020 20:27:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88167866B5;
	Fri,  7 Feb 2020 20:27:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 017KR5Wg019034 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 7 Feb 2020 15:27:05 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D115B60C05; Fri,  7 Feb 2020 20:27:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from horse.redhat.com (unknown [10.18.25.35])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0885D60BF7;
	Fri,  7 Feb 2020 20:27:03 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
	id 9664B2257D5; Fri,  7 Feb 2020 15:27:02 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: linux-fsdevel@vger.kernel.org, linux-nvdimm@lists.01.org,
	hch@infradead.org, dan.j.williams@intel.com
Date: Fri,  7 Feb 2020 15:26:48 -0500
Message-Id: <20200207202652.1439-4-vgoyal@redhat.com>
In-Reply-To: <20200207202652.1439-1-vgoyal@redhat.com>
References: <20200207202652.1439-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: vishal.l.verma@intel.com, dm-devel@redhat.com, vgoyal@redhat.com
Subject: [dm-devel] [PATCH v3 3/7] dax,
	pmem: Add a dax operation zero_page_range
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
X-MC-Unique: lkqIIwoFOVKc3-vZv0eDhw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a dax operation zero_page_range, to zero a range of memory. This will
also clear any poison in the range being zeroed.

As of now, zeroing of up to one page is allowed in a single call. There
are no callers which are trying to zero more than a page in a single call.
Once we grow the callers which zero more than a page in single call, we
can add that support. Primary reason for not doing that yet is that this
will add little complexity in dm implementation where a range might be
spanning multiple underlying targets and one will have to split the range
into multiple sub ranges and call zero_page_range() on individual targets.

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 drivers/dax/super.c   | 19 +++++++++++++++++++
 drivers/nvdimm/pmem.c | 15 +++++++++++++++
 include/linux/dax.h   |  3 +++
 3 files changed, 37 insertions(+)

diff --git a/drivers/dax/super.c b/drivers/dax/super.c
index 26a654dbc69a..31ee0b47b4ed 100644
--- a/drivers/dax/super.c
+++ b/drivers/dax/super.c
@@ -344,6 +344,25 @@ size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 }
 EXPORT_SYMBOL_GPL(dax_copy_to_iter);
 
+int dax_zero_page_range(struct dax_device *dax_dev, u64 offset, size_t len)
+{
+	if (!dax_alive(dax_dev))
+		return -ENXIO;
+
+	if (!dax_dev->ops->zero_page_range)
+		return -EOPNOTSUPP;
+	/*
+	 * There are no callers that want to zero across a page boundary as of
+	 * now. Once users are there, this check can be removed after the
+	 * device mapper code has been updated to split ranges across targets.
+	 */
+	if (offset_in_page(offset) + len > PAGE_SIZE)
+		return -EIO;
+
+	return dax_dev->ops->zero_page_range(dax_dev, offset, len);
+}
+EXPORT_SYMBOL_GPL(dax_zero_page_range);
+
 #ifdef CONFIG_ARCH_HAS_PMEM_API
 void arch_wb_cache_pmem(void *addr, size_t size);
 void dax_flush(struct dax_device *dax_dev, void *addr, size_t size)
diff --git a/drivers/nvdimm/pmem.c b/drivers/nvdimm/pmem.c
index 281fe04d25fd..0def7dc8e487 100644
--- a/drivers/nvdimm/pmem.c
+++ b/drivers/nvdimm/pmem.c
@@ -299,6 +299,20 @@ static const struct block_device_operations pmem_fops = {
 	.revalidate_disk =	nvdimm_revalidate_disk,
 };
 
+static int pmem_dax_zero_page_range(struct dax_device *dax_dev, u64 offset,
+				    size_t len)
+{
+	int rc;
+	struct pmem_device *pmem = dax_get_private(dax_dev);
+	struct page *page = ZERO_PAGE(0);
+
+	rc = pmem_do_write(pmem, page, 0, offset, len);
+	if (rc > 0)
+		return -EIO;
+
+	return 0;
+}
+
 static long pmem_dax_direct_access(struct dax_device *dax_dev,
 		pgoff_t pgoff, long nr_pages, void **kaddr, pfn_t *pfn)
 {
@@ -330,6 +344,7 @@ static const struct dax_operations pmem_dax_ops = {
 	.dax_supported = generic_fsdax_supported,
 	.copy_from_iter = pmem_copy_from_iter,
 	.copy_to_iter = pmem_copy_to_iter,
+	.zero_page_range = pmem_dax_zero_page_range,
 };
 
 static const struct attribute_group *pmem_attribute_groups[] = {
diff --git a/include/linux/dax.h b/include/linux/dax.h
index 9bd8528bd305..a555f0aeb7bd 100644
--- a/include/linux/dax.h
+++ b/include/linux/dax.h
@@ -34,6 +34,8 @@ struct dax_operations {
 	/* copy_to_iter: required operation for fs-dax direct-i/o */
 	size_t (*copy_to_iter)(struct dax_device *, pgoff_t, void *, size_t,
 			struct iov_iter *);
+	/* zero_page_range: required operation. Zero range with-in a page  */
+	int (*zero_page_range)(struct dax_device *, u64, size_t);
 };
 
 extern struct attribute_group dax_attribute_group;
@@ -209,6 +211,7 @@ size_t dax_copy_from_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 		size_t bytes, struct iov_iter *i);
 size_t dax_copy_to_iter(struct dax_device *dax_dev, pgoff_t pgoff, void *addr,
 		size_t bytes, struct iov_iter *i);
+int dax_zero_page_range(struct dax_device *dax_dev, u64 offset, size_t len);
 void dax_flush(struct dax_device *dax_dev, void *addr, size_t size);
 
 ssize_t dax_iomap_rw(struct kiocb *iocb, struct iov_iter *iter,
-- 
2.20.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

