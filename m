Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 7697B70E7AF
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 23:46:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684878385;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fD/Ywx+IaBWrf5cjw1tNaK8xYh4bSrPyFgzHMfOcBJU=;
	b=S5Yu/nD6aYCZnW1GNjN5BYlakfj5SLdu5y6fFEIXHITWlJArDaMGP6DAw4wZ64M5EauMWF
	FVT6zKk3CABUewp0YKk7nHVadxnhsvX5Mb53I1b5WGeoauk2fYV3QSTBYt+PLMiOnIQWu6
	fHpwDWZkjruqTPQoRmhJnCzNj9crs3s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-dn6ZTQF-NpaaB5FVH2xajA-1; Tue, 23 May 2023 17:46:22 -0400
X-MC-Unique: dn6ZTQF-NpaaB5FVH2xajA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0A4B98007D9;
	Tue, 23 May 2023 21:46:20 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E76CA40CFD45;
	Tue, 23 May 2023 21:46:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id B1C7219465BC;
	Tue, 23 May 2023 21:46:19 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 4723519465A8
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 21:46:18 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 294A240D1B60; Tue, 23 May 2023 21:46:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 212B040D1B69
 for <dm-devel@redhat.com>; Tue, 23 May 2023 21:46:18 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EDB4D185A7AB
 for <dm-devel@redhat.com>; Tue, 23 May 2023 21:46:17 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-Fb7rhPkJMouYZ1Gi6ZY5fw-1; Tue, 23 May 2023 17:46:15 -0400
X-MC-Unique: Fb7rhPkJMouYZ1Gi6ZY5fw-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-751409fae81so55641785a.1
 for <dm-devel@redhat.com>; Tue, 23 May 2023 14:46:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878375; x=1687470375;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9rLm7uhUe0e7M80o45H78QPWG8f4bfD+U06FJPEuCqI=;
 b=d5VROUo+8ujtsFsd9x2KdMn/zneUbiNx/EhRg/xKhEhOp6CmXVaPf51L0+JvfL0h+X
 Ba9hK+p1Vp1lhh7a8SXIkokWI2RltJNSKWKTxLPVMdU/ZWTNcSXiHFvV7miarRm/rmZQ
 IDdzYKPXTY+4bCOxmTHO8tSiicV259daNBQqeTjlEYHJX7voC3pXOoCWrRDmfEsWdttX
 re3LLYB9eVRSBMDDQWm7Zjcei7gjCfJyR4Y9Ns3bdl50RfEmAW9FEH0MYWCumDCCKJOI
 5tET5+Shnrxd7GNHb/udIWU5wUREhNiQp/q7TWdxJvccg2tFcb32dxr5byAiSIG2Hjgr
 w/Ew==
X-Gm-Message-State: AC+VfDwkVYtV2N/83KkrbGF0Ky1mD3VhpmF8dsrL+hs1TxI9SXw1IU0f
 6/bLg5jzbnTsdLUXeO1L6fNegd0Z4ki++QpkthhEsDpTdFlpX3vnEK0ytrq0j8aKzwZ5xD8Nx8g
 TlI2wD4BFjNHZ9bdX3wiVcO3S9k61F0hdrRJbDkNnKuKC3hWGKtyGqsUKur01xGMoTNn4uYU7
X-Received: by 2002:a05:620a:2232:b0:75b:23a1:462 with SMTP id
 n18-20020a05620a223200b0075b23a10462mr5252578qkh.40.1684878374258; 
 Tue, 23 May 2023 14:46:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5cy9zG9K/9o20xXiE2X6VeDD2OU+zYJhbl1AGmBd0Awg+lx+KJ+qT227A5czyY2yrzs/f86g==
X-Received: by 2002:a05:620a:2232:b0:75b:23a1:462 with SMTP id
 n18-20020a05620a223200b0075b23a10462mr5252542qkh.40.1684878373537; 
 Tue, 23 May 2023 14:46:13 -0700 (PDT)
Received: from bf36-1.. (173-166-2-198-newengland.hfc.comcastbusiness.net.
 [173.166.2.198]) by smtp.gmail.com with ESMTPSA id
 x3-20020ae9e903000000b007592af6fce6sm2234465qkf.43.2023.05.23.14.46.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 14:46:13 -0700 (PDT)
From: "J. corwin Coburn" <corwin@redhat.com>
To: dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Tue, 23 May 2023 17:45:18 -0400
Message-Id: <20230523214539.226387-19-corwin@redhat.com>
In-Reply-To: <20230523214539.226387-1-corwin@redhat.com>
References: <20230523214539.226387-1-corwin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH v2 18/39] Add vio,
 the request object for vdo metadata.
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
Cc: vdo-devel@redhat.com, "J. corwin Coburn" <corwin@redhat.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: J. corwin Coburn <corwin@redhat.com>
---
 drivers/md/dm-vdo/vio.c | 525 ++++++++++++++++++++++++++++++++++++++++
 drivers/md/dm-vdo/vio.h | 221 +++++++++++++++++
 2 files changed, 746 insertions(+)
 create mode 100644 drivers/md/dm-vdo/vio.c
 create mode 100644 drivers/md/dm-vdo/vio.h

diff --git a/drivers/md/dm-vdo/vio.c b/drivers/md/dm-vdo/vio.c
new file mode 100644
index 00000000000..8c3bb0d67b6
--- /dev/null
+++ b/drivers/md/dm-vdo/vio.c
@@ -0,0 +1,525 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright Red Hat
+ */
+
+#include "vio.h"
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/kernel.h>
+#include <linux/ratelimit.h>
+
+#include "logger.h"
+#include "memory-alloc.h"
+#include "permassert.h"
+
+#include "constants.h"
+#include "io-submitter.h"
+#include "vdo.h"
+
+/* A vio_pool is a collection of preallocated vios. */
+struct vio_pool {
+	/** The number of objects managed by the pool */
+	size_t size;
+	/** The list of objects which are available */
+	struct list_head available;
+	/** The queue of requestors waiting for objects from the pool */
+	struct wait_queue waiting;
+	/** The number of objects currently in use */
+	size_t busy_count;
+	/** The list of objects which are in use */
+	struct list_head busy;
+	/** The ID of the thread on which this pool may be used */
+	thread_id_t thread_id;
+	/** The buffer backing the pool's vios */
+	char *buffer;
+	/** The pool entries */
+	struct pooled_vio vios[];
+};
+
+physical_block_number_t pbn_from_vio_bio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct vdo *vdo = vio->completion.vdo;
+	physical_block_number_t pbn = bio->bi_iter.bi_sector / VDO_SECTORS_PER_BLOCK;
+
+	return ((pbn == VDO_GEOMETRY_BLOCK_LOCATION) ? pbn : pbn + vdo->geometry.bio_offset);
+}
+
+static int create_multi_block_bio(block_count_t size, struct bio **bio_ptr)
+{
+	struct bio *bio = NULL;
+	int result;
+
+	result = UDS_ALLOCATE_EXTENDED(struct bio, size + 1, struct bio_vec, "bio", &bio);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	*bio_ptr = bio;
+	return VDO_SUCCESS;
+}
+
+int vdo_create_bio(struct bio **bio_ptr)
+{
+	return create_multi_block_bio(1, bio_ptr);
+}
+
+void vdo_free_bio(struct bio *bio)
+{
+	if (bio == NULL)
+		return;
+
+	bio_uninit(bio);
+	UDS_FREE(UDS_FORGET(bio));
+}
+
+int allocate_vio_components(struct vdo *vdo,
+			    enum vio_type vio_type,
+			    enum vio_priority priority,
+			    void *parent,
+			    unsigned int block_count,
+			    char *data,
+			    struct vio *vio)
+{
+	struct bio *bio;
+	int result;
+
+	result = ASSERT(block_count <= MAX_BLOCKS_PER_VIO,
+			"block count %u does not exceed maximum %u",
+			block_count,
+			MAX_BLOCKS_PER_VIO);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	result = ASSERT(((vio_type != VIO_TYPE_UNINITIALIZED) && (vio_type != VIO_TYPE_DATA)),
+			"%d is a metadata type",
+			vio_type);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	result = create_multi_block_bio(block_count, &bio);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	initialize_vio(vio, bio, block_count, vio_type, priority, vdo);
+	vio->completion.parent = parent;
+	vio->data = data;
+	return VDO_SUCCESS;
+}
+
+/**
+ * create_multi_block_metadata_vio() - Create a vio.
+ * @vdo: The vdo on which the vio will operate.
+ * @vio_type: The type of vio to create.
+ * @priority: The relative priority to assign to the vio.
+ * @parent: The parent of the vio.
+ * @block_count: The size of the vio in blocks.
+ * @data: The buffer.
+ * @vio_ptr: A pointer to hold the new vio.
+ *
+ * Return: VDO_SUCCESS or an error.
+ */
+int create_multi_block_metadata_vio(struct vdo *vdo,
+				    enum vio_type vio_type,
+				    enum vio_priority priority,
+				    void *parent,
+				    unsigned int block_count,
+				    char *data,
+				    struct vio **vio_ptr)
+{
+	struct vio *vio;
+	int result;
+
+	/* If struct vio grows past 256 bytes, we'll lose benefits of VDOSTORY-176. */
+	STATIC_ASSERT(sizeof(struct vio) <= 256);
+
+	/*
+	 * Metadata vios should use direct allocation and not use the buffer pool, which is
+	 * reserved for submissions from the linux block layer.
+	 */
+	result = UDS_ALLOCATE(1, struct vio, __func__, &vio);
+	if (result != VDO_SUCCESS) {
+		uds_log_error("metadata vio allocation failure %d", result);
+		return result;
+	}
+
+	result = allocate_vio_components(vdo, vio_type, priority, parent, block_count, data, vio);
+	if (result != VDO_SUCCESS) {
+		UDS_FREE(vio);
+		return result;
+	}
+
+	*vio_ptr  = vio;
+	return VDO_SUCCESS;
+}
+
+/**
+ * free_vio_components() - Free the components of a vio embedded in a larger structure.
+ * @vio: The vio to destroy
+ */
+void free_vio_components(struct vio *vio)
+{
+	if (vio == NULL)
+		return;
+
+	BUG_ON(is_data_vio(vio));
+	vdo_free_bio(UDS_FORGET(vio->bio));
+}
+
+/**
+ * free_vio() - Destroy a vio.
+ * @vio: The vio to destroy.
+ */
+void free_vio(struct vio *vio)
+{
+	free_vio_components(vio);
+	UDS_FREE(vio);
+}
+
+/* Set bio properties for a VDO read or write. */
+void vdo_set_bio_properties(struct bio *bio,
+			    struct vio *vio,
+			    bio_end_io_t callback,
+			    unsigned int bi_opf,
+			    physical_block_number_t pbn)
+{
+	struct vdo *vdo = vio->completion.vdo;
+	struct device_config *config = vdo->device_config;
+
+	pbn -= vdo->geometry.bio_offset;
+	vio->bio_zone = ((pbn / config->thread_counts.bio_rotation_interval) %
+			 config->thread_counts.bio_threads);
+
+	bio->bi_private = vio;
+	bio->bi_end_io = callback;
+	bio->bi_opf = bi_opf;
+	bio->bi_iter.bi_sector = pbn * VDO_SECTORS_PER_BLOCK;
+}
+
+/*
+ * Prepares the bio to perform IO with the specified buffer. May only be used on a VDO-allocated
+ * bio, as it assumes the bio wraps a 4k buffer that is 4k aligned, but there does not have to be a
+ * vio associated with the bio.
+ */
+int vio_reset_bio(struct vio *vio,
+		  char *data,
+		  bio_end_io_t callback,
+		  unsigned int bi_opf,
+		  physical_block_number_t pbn)
+{
+	int bvec_count, offset, len, i;
+	struct bio *bio = vio->bio;
+
+	bio_reset(bio, bio->bi_bdev, bi_opf);
+	vdo_set_bio_properties(bio, vio, callback, bi_opf, pbn);
+	if (data == NULL)
+		return VDO_SUCCESS;
+
+	bio->bi_io_vec = bio->bi_inline_vecs;
+	bio->bi_max_vecs = vio->block_count + 1;
+	len = VDO_BLOCK_SIZE * vio->block_count;
+	offset = offset_in_page(data);
+	bvec_count = DIV_ROUND_UP(offset + len, PAGE_SIZE);
+
+	/*
+	 * If we knew that data was always on one page, or contiguous pages, we wouldn't need the
+	 * loop. But if we're using vmalloc, it's not impossible that the data is in different
+	 * pages that can't be merged in bio_add_page...
+	 */
+	for (i = 0; (i < bvec_count) && (len > 0); i++) {
+		struct page *page;
+		int bytes_added;
+		int bytes = PAGE_SIZE - offset;
+
+		if (bytes > len)
+			bytes = len;
+
+		page = is_vmalloc_addr(data) ? vmalloc_to_page(data) : virt_to_page(data);
+		bytes_added = bio_add_page(bio, page, bytes, offset);
+
+		if (bytes_added != bytes)
+			return uds_log_error_strerror(VDO_BIO_CREATION_FAILED,
+						      "Could only add %i bytes to bio",
+						       bytes_added);
+
+		data += bytes;
+		len -= bytes;
+		offset = 0;
+	}
+
+	return VDO_SUCCESS;
+}
+
+/**
+ * update_vio_error_stats() - Update per-vio error stats and log the error.
+ * @vio: The vio which got an error.
+ * @format: The format of the message to log (a printf style format).
+ */
+void update_vio_error_stats(struct vio *vio, const char *format, ...)
+{
+	static DEFINE_RATELIMIT_STATE(error_limiter,
+				      DEFAULT_RATELIMIT_INTERVAL,
+				      DEFAULT_RATELIMIT_BURST);
+	va_list args;
+	int priority;
+	struct vdo *vdo = vio->completion.vdo;
+
+	switch (vio->completion.result) {
+	case VDO_READ_ONLY:
+		atomic64_inc(&vdo->stats.read_only_error_count);
+		return;
+
+	case VDO_NO_SPACE:
+		atomic64_inc(&vdo->stats.no_space_error_count);
+		priority = UDS_LOG_DEBUG;
+		break;
+
+	default:
+		priority = UDS_LOG_ERR;
+	}
+
+	if (!__ratelimit(&error_limiter))
+		return;
+
+	va_start(args, format);
+	uds_vlog_strerror(priority, vio->completion.result, UDS_LOGGING_MODULE_NAME, format, args);
+	va_end(args);
+}
+
+void vio_record_metadata_io_error(struct vio *vio)
+{
+	const char *description;
+	physical_block_number_t pbn = pbn_from_vio_bio(vio->bio);
+
+	if (bio_op(vio->bio) == REQ_OP_READ)
+		description = "read";
+	else if ((vio->bio->bi_opf & REQ_PREFLUSH) == REQ_PREFLUSH)
+		description = (((vio->bio->bi_opf & REQ_FUA) == REQ_FUA) ?
+			       "write+preflush+fua" :
+			       "write+preflush");
+	else if ((vio->bio->bi_opf & REQ_FUA) == REQ_FUA)
+		description = "write+fua";
+	else
+		description = "write";
+
+	update_vio_error_stats(vio,
+			       "Completing %s vio of type %u for physical block %llu with error",
+			       description,
+			       vio->type,
+			       (unsigned long long) pbn);
+}
+
+/**
+ * make_vio_pool() - Create a new vio pool.
+ * @vdo: The vdo.
+ * @pool_size: The number of vios in the pool.
+ * @thread_id: The ID of the thread using this pool.
+ * @vio_type: The type of vios in the pool.
+ * @priority: The priority with which vios from the pool should be enqueued.
+ * @context: The context that each entry will have.
+ * @pool_ptr: The resulting pool.
+ *
+ * Return: A success or error code.
+ */
+int make_vio_pool(struct vdo *vdo,
+		  size_t pool_size,
+		  thread_id_t thread_id,
+		  enum vio_type vio_type,
+		  enum vio_priority priority,
+		  void *context,
+		  struct vio_pool **pool_ptr)
+{
+	struct vio_pool *pool;
+	char *ptr;
+	int result;
+
+	result = UDS_ALLOCATE_EXTENDED(struct vio_pool,
+				       pool_size,
+				       struct pooled_vio,
+				       __func__,
+				       &pool);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	pool->thread_id = thread_id;
+	INIT_LIST_HEAD(&pool->available);
+	INIT_LIST_HEAD(&pool->busy);
+
+	result = UDS_ALLOCATE(pool_size * VDO_BLOCK_SIZE, char, "VIO pool buffer", &pool->buffer);
+	if (result != VDO_SUCCESS) {
+		free_vio_pool(pool);
+		return result;
+	}
+
+	ptr = pool->buffer;
+	for (pool->size = 0; pool->size < pool_size; pool->size++, ptr += VDO_BLOCK_SIZE) {
+		struct pooled_vio *pooled = &pool->vios[pool->size];
+
+		result = allocate_vio_components(vdo,
+						 vio_type,
+						 priority,
+						 NULL,
+						 1,
+						 ptr,
+						 &pooled->vio);
+		if (result != VDO_SUCCESS) {
+			free_vio_pool(pool);
+			return result;
+		}
+
+		pooled->context = context;
+		list_add_tail(&pooled->pool_entry, &pool->available);
+	}
+
+	*pool_ptr = pool;
+	return VDO_SUCCESS;
+}
+
+/**
+ * free_vio_pool() - Destroy a vio pool.
+ * @pool: The pool to free.
+ */
+void free_vio_pool(struct vio_pool *pool)
+{
+	struct pooled_vio *pooled, *tmp;
+
+	if (pool == NULL)
+		return;
+
+	/* Remove all available vios from the object pool. */
+	ASSERT_LOG_ONLY(!vdo_has_waiters(&pool->waiting),
+			"VIO pool must not have any waiters when being freed");
+	ASSERT_LOG_ONLY((pool->busy_count == 0),
+			"VIO pool must not have %zu busy entries when being freed",
+			pool->busy_count);
+	ASSERT_LOG_ONLY(list_empty(&pool->busy),
+			"VIO pool must not have busy entries when being freed");
+
+	list_for_each_entry_safe(pooled, tmp, &pool->available, pool_entry) {
+		list_del(&pooled->pool_entry);
+		free_vio_components(&pooled->vio);
+		pool->size--;
+	}
+
+	ASSERT_LOG_ONLY(pool->size == 0,
+			"VIO pool must not have missing entries when being freed");
+
+	UDS_FREE(UDS_FORGET(pool->buffer));
+	UDS_FREE(pool);
+}
+
+/**
+ * is_vio_pool_busy() - Check whether an vio pool has outstanding entries.
+ *
+ * Return: true if the pool is busy.
+ */
+bool is_vio_pool_busy(struct vio_pool *pool)
+{
+	return (pool->busy_count != 0);
+}
+
+/**
+ * acquire_vio_from_pool() - Acquire a vio and buffer from the pool (asynchronous).
+ * @pool: The vio pool.
+ * @waiter: Object that is requesting a vio.
+ */
+void acquire_vio_from_pool(struct vio_pool *pool, struct waiter *waiter)
+{
+	struct pooled_vio *pooled;
+
+	ASSERT_LOG_ONLY((pool->thread_id == vdo_get_callback_thread_id()),
+			"acquire from active vio_pool called from correct thread");
+
+	if (list_empty(&pool->available)) {
+		vdo_enqueue_waiter(&pool->waiting, waiter);
+		return;
+	}
+
+	pooled = list_first_entry(&pool->available, struct pooled_vio, pool_entry);
+	pool->busy_count++;
+	list_move_tail(&pooled->pool_entry, &pool->busy);
+	(*waiter->callback)(waiter, pooled);
+}
+
+/**
+ * return_vio_to_pool() - Return a vio to the pool
+ * @pool: The vio pool.
+ * @vio: The pooled vio to return.
+ */
+void return_vio_to_pool(struct vio_pool *pool, struct pooled_vio *vio)
+{
+	ASSERT_LOG_ONLY((pool->thread_id == vdo_get_callback_thread_id()),
+			"vio pool entry returned on same thread as it was acquired");
+
+	vio->vio.completion.error_handler = NULL;
+	vio->vio.completion.parent = NULL;
+	if (vdo_has_waiters(&pool->waiting)) {
+		vdo_notify_next_waiter(&pool->waiting, NULL, vio);
+		return;
+	}
+
+	list_move_tail(&vio->pool_entry, &pool->available);
+	--pool->busy_count;
+}
+
+/*
+ * Various counting functions for statistics.
+ * These are used for bios coming into VDO, as well as bios generated by VDO.
+ */
+void vdo_count_bios(struct atomic_bio_stats *bio_stats, struct bio *bio)
+{
+	if (((bio->bi_opf & REQ_PREFLUSH) != 0) && (bio->bi_iter.bi_size == 0)) {
+		atomic64_inc(&bio_stats->empty_flush);
+		atomic64_inc(&bio_stats->flush);
+		return;
+	}
+
+	switch (bio_op(bio)) {
+	case REQ_OP_WRITE:
+		atomic64_inc(&bio_stats->write);
+		break;
+	case REQ_OP_READ:
+		atomic64_inc(&bio_stats->read);
+		break;
+	case REQ_OP_DISCARD:
+		atomic64_inc(&bio_stats->discard);
+		break;
+		/*
+		 * All other operations are filtered out in dmvdo.c, or not created by VDO, so
+		 * shouldn't exist.
+		 */
+	default:
+		ASSERT_LOG_ONLY(0, "Bio operation %d not a write, read, discard, or empty flush",
+				bio_op(bio));
+	}
+
+	if ((bio->bi_opf & REQ_PREFLUSH) != 0)
+		atomic64_inc(&bio_stats->flush);
+	if (bio->bi_opf & REQ_FUA)
+		atomic64_inc(&bio_stats->fua);
+}
+
+static void count_all_bios_completed(struct vio *vio, struct bio *bio)
+{
+	struct atomic_statistics *stats = &vio->completion.vdo->stats;
+
+	if (is_data_vio(vio)) {
+		vdo_count_bios(&stats->bios_out_completed, bio);
+		return;
+	}
+
+	vdo_count_bios(&stats->bios_meta_completed, bio);
+	if (vio->type == VIO_TYPE_RECOVERY_JOURNAL)
+		vdo_count_bios(&stats->bios_journal_completed, bio);
+	else if (vio->type == VIO_TYPE_BLOCK_MAP)
+		vdo_count_bios(&stats->bios_page_cache_completed, bio);
+}
+
+void vdo_count_completed_bios(struct bio *bio)
+{
+	struct vio *vio = (struct vio *) bio->bi_private;
+
+	atomic64_inc(&vio->completion.vdo->stats.bios_completed);
+	count_all_bios_completed(vio, bio);
+}
diff --git a/drivers/md/dm-vdo/vio.h b/drivers/md/dm-vdo/vio.h
new file mode 100644
index 00000000000..f39f568834e
--- /dev/null
+++ b/drivers/md/dm-vdo/vio.h
@@ -0,0 +1,221 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright Red Hat
+ */
+
+#ifndef VIO_H
+#define VIO_H
+
+#include <linux/bio.h>
+#include <linux/blkdev.h>
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <linux/list.h>
+
+#include "completion.h"
+#include "constants.h"
+#include "types.h"
+#include "vdo.h"
+
+enum {
+	MAX_BLOCKS_PER_VIO = (BIO_MAX_VECS << PAGE_SHIFT) / VDO_BLOCK_SIZE,
+};
+
+struct pooled_vio {
+	/* The underlying vio */
+	struct vio vio;
+	/* The list entry for chaining pooled vios together */
+	struct list_head list_entry;
+	/* The context set by the pool */
+	void *context;
+	/* The list entry used by the pool */
+	struct list_head pool_entry;
+};
+
+/**
+ * as_vio() - Convert a generic vdo_completion to a vio.
+ * @completion: The completion to convert.
+ *
+ * Return: The completion as a vio.
+ */
+static inline struct vio *as_vio(struct vdo_completion *completion)
+{
+	vdo_assert_completion_type(completion, VIO_COMPLETION);
+	return container_of(completion, struct vio, completion);
+}
+
+/**
+ * get_vio_bio_zone_thread_id() - Get the thread id of the bio zone in which a vio should submit
+ *                                its I/O.
+ * @vio: The vio.
+ *
+ * Return: The id of the bio zone thread the vio should use.
+ */
+static inline thread_id_t __must_check get_vio_bio_zone_thread_id(struct vio *vio)
+{
+	return vio->completion.vdo->thread_config.bio_threads[vio->bio_zone];
+}
+
+physical_block_number_t __must_check pbn_from_vio_bio(struct bio *bio);
+
+/**
+ * assert_vio_in_bio_zone() - Check that a vio is running on the correct thread for its bio zone.
+ * @vio: The vio to check.
+ */
+static inline void assert_vio_in_bio_zone(struct vio *vio)
+{
+	thread_id_t expected = get_vio_bio_zone_thread_id(vio);
+	thread_id_t thread_id = vdo_get_callback_thread_id();
+
+	ASSERT_LOG_ONLY((expected == thread_id),
+			"vio I/O for physical block %llu on thread %u, should be on bio zone thread %u",
+			(unsigned long long) pbn_from_vio_bio(vio->bio),
+			thread_id,
+			expected);
+}
+
+int vdo_create_bio(struct bio **bio_ptr);
+void vdo_free_bio(struct bio *bio);
+int allocate_vio_components(struct vdo *vdo,
+			    enum vio_type vio_type,
+			    enum vio_priority priority,
+			    void *parent,
+			    unsigned int block_count,
+			    char *data,
+			    struct vio *vio);
+int __must_check create_multi_block_metadata_vio(struct vdo *vdo,
+						 enum vio_type vio_type,
+						 enum vio_priority priority,
+						 void *parent,
+						 unsigned int block_count,
+						 char *data,
+						 struct vio **vio_ptr);
+
+static inline int __must_check
+create_metadata_vio(struct vdo *vdo,
+		    enum vio_type vio_type,
+		    enum vio_priority priority,
+		    void *parent,
+		    char *data,
+		    struct vio **vio_ptr)
+{
+	return create_multi_block_metadata_vio(vdo, vio_type, priority, parent, 1, data, vio_ptr);
+}
+
+void free_vio_components(struct vio *vio);
+void free_vio(struct vio *vio);
+
+/**
+ * initialize_vio() - Initialize a vio.
+ * @vio: The vio to initialize.
+ * @bio: The bio this vio should use for its I/O.
+ * @block_count: The size of this vio in vdo blocks.
+ * @vio_type: The vio type.
+ * @priority: The relative priority of the vio.
+ * @vdo: The vdo for this vio.
+ */
+static inline void initialize_vio(struct vio *vio,
+				  struct bio *bio,
+				  unsigned int block_count,
+				  enum vio_type vio_type,
+				  enum vio_priority priority,
+				  struct vdo *vdo)
+{
+	/* data_vio's may not span multiple blocks */
+	BUG_ON((vio_type == VIO_TYPE_DATA) && (block_count != 1));
+
+	vio->bio = bio;
+	vio->block_count = block_count;
+	vio->type = vio_type;
+	vio->priority = priority;
+	vdo_initialize_completion(&vio->completion, vdo, VIO_COMPLETION);
+}
+
+void vdo_set_bio_properties(struct bio *bio,
+			    struct vio *vio,
+			    bio_end_io_t callback,
+			    unsigned int bi_opf,
+			    physical_block_number_t pbn);
+
+int vio_reset_bio(struct vio *vio,
+		  char *data,
+		  bio_end_io_t callback,
+		  unsigned int bi_opf,
+		  physical_block_number_t pbn);
+
+void update_vio_error_stats(struct vio *vio, const char *format, ...)
+	__printf(2, 3);
+
+/**
+ * is_data_vio() - Check whether a vio is servicing an external data request.
+ * @vio: The vio to check.
+ */
+static inline bool is_data_vio(struct vio *vio)
+{
+	return (vio->type == VIO_TYPE_DATA);
+}
+
+/**
+ * get_metadata_priority() - Convert a vio's priority to a work item priority.
+ * @vio: The vio.
+ *
+ * Return: The priority with which to submit the vio's bio.
+ */
+static inline enum vdo_completion_priority get_metadata_priority(struct vio *vio)
+{
+	return ((vio->priority == VIO_PRIORITY_HIGH) ?
+		BIO_Q_HIGH_PRIORITY :
+		BIO_Q_METADATA_PRIORITY);
+}
+
+/**
+ * continue_vio() - Enqueue a vio to run its next callback.
+ * @vio: The vio to continue.
+ *
+ * Return: The result of the current operation.
+ */
+static inline void continue_vio(struct vio *vio, int result)
+{
+	if (unlikely(result != VDO_SUCCESS))
+		vdo_set_completion_result(&vio->completion, result);
+
+	vdo_enqueue_completion(&vio->completion, VDO_WORK_Q_DEFAULT_PRIORITY);
+}
+
+void vdo_count_bios(struct atomic_bio_stats *bio_stats, struct bio *bio);
+void vdo_count_completed_bios(struct bio *bio);
+
+/**
+ * continue_vio_after_io() - Continue a vio now that its I/O has returned.
+ */
+static inline void continue_vio_after_io(struct vio *vio, vdo_action *callback, thread_id_t thread)
+{
+	vdo_count_completed_bios(vio->bio);
+	vdo_set_completion_callback(&vio->completion, callback, thread);
+	continue_vio(vio, blk_status_to_errno(vio->bio->bi_status));
+}
+
+void vio_record_metadata_io_error(struct vio *vio);
+
+/* A vio_pool is a collection of preallocated vios used to write arbitrary metadata blocks. */
+
+static inline struct pooled_vio *vio_as_pooled_vio(struct vio *vio)
+{
+	return container_of(vio, struct pooled_vio, vio);
+}
+
+struct vio_pool;
+
+int __must_check make_vio_pool(struct vdo *vdo,
+			       size_t pool_size,
+			       thread_id_t thread_id,
+			       enum vio_type vio_type,
+			       enum vio_priority priority,
+			       void *context,
+			       struct vio_pool **pool_ptr);
+void free_vio_pool(struct vio_pool *pool);
+bool __must_check is_vio_pool_busy(struct vio_pool *pool);
+void acquire_vio_from_pool(struct vio_pool *pool, struct waiter *waiter);
+void return_vio_to_pool(struct vio_pool *pool, struct pooled_vio *vio);
+
+#endif /* VIO_H */
-- 
2.40.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

