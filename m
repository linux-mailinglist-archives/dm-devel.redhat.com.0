Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C25770E7CD
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 23:47:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684878427;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GZ46UTpJ9OI9sUZCNudIzUEM/2u7LmRSdK4WicLikIQ=;
	b=bct7VbJDQta3UDZb6132KmzY2N743hUP8ICeL5K+nP8x2cU/a4k24XGXQObcZkaz8SFLs4
	CXeqigi164rVC5mI7DoAM6KwrmO4jIvvkmPeXiqW5e+9HW3CJIiVQb3m5xTDfZSVuj8UWX
	5FiB4iszw7FlbbXAINS2dgWS/FRb+YQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-267-pLL4Bxc3Od-JyrZ137CWMg-1; Tue, 23 May 2023 17:46:41 -0400
X-MC-Unique: pLL4Bxc3Od-JyrZ137CWMg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E5EC2814250;
	Tue, 23 May 2023 21:46:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DAA18162;
	Tue, 23 May 2023 21:46:38 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 2925D19465BD;
	Tue, 23 May 2023 21:46:38 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B387419465B6
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 21:46:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9304F482060; Tue, 23 May 2023 21:46:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89D97492B00
 for <dm-devel@redhat.com>; Tue, 23 May 2023 21:46:36 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61A59101B041
 for <dm-devel@redhat.com>; Tue, 23 May 2023 21:46:36 +0000 (UTC)
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-GBhnEuVEPpe5ZgXmTF4Nww-1; Tue, 23 May 2023 17:46:35 -0400
X-MC-Unique: GBhnEuVEPpe5ZgXmTF4Nww-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-62380ffb993so1570526d6.1
 for <dm-devel@redhat.com>; Tue, 23 May 2023 14:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684878394; x=1687470394;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XS5zRFpqtwMZyGCSSC3V+iRwMmB4U9RK+jldD0pCdto=;
 b=hpEvnjdlwjvJFRa5GDFMaMhg126Phpm6rdNUdID0FlI8/RyoO/3oVIbrYyUe1bRp3j
 sKdytE8O22NbDTiNZGD3N6cGaq3mfMEqvnlkRq/CxnFOiJGvKbSzcIIKDYButYN1O7z/
 PxBUaHjujMCt6/FE9B7G6UbSIqJV9o9dH+RvVemjEd9nX1YRwiIXNklOCKWl1OfJS9+a
 GjMoYkCQsClUYK9+N9iFzDhHWApte991YKJ7+tNpwGKS/THE3Wr6VHOGsmO07X/M8azH
 eV5KJjwAmOnfu+V/66quqLWA9QF3lhnyGoXTR8+EH/kR669SO8RflBD4KwM8zHdq1HMX
 OhoA==
X-Gm-Message-State: AC+VfDxvIwZZjsMCZLcnv17SiepFqxmb6YQtrdXTPdPSVImvnxNNfIaB
 Nleiqz9cRe/zPVfhlrEoKQ5clKKPWUVJi4zlnLvuKfEXjtUzHXyes14EpOQGvGIUPA7nLkMYWxF
 dFpw7O3jCmOnycJhhNWosoiGUsv6QtFtiB1iRVTi4MDcMLxgkHUF/o14CNgCN+w1Yay7m2HD6
X-Received: by 2002:ad4:5be5:0:b0:623:640d:2b30 with SMTP id
 k5-20020ad45be5000000b00623640d2b30mr24445789qvc.52.1684878392359; 
 Tue, 23 May 2023 14:46:32 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cwYvm649e9eAtJS/u8rF3lsAMJlyv85qgwK4gbmsVV04bpah5Q0JYrBX+idmVizTJ8rGT9Q==
X-Received: by 2002:ad4:5be5:0:b0:623:640d:2b30 with SMTP id
 k5-20020ad45be5000000b00623640d2b30mr24445704qvc.52.1684878390513; 
 Tue, 23 May 2023 14:46:30 -0700 (PDT)
Received: from bf36-1.. (173-166-2-198-newengland.hfc.comcastbusiness.net.
 [173.166.2.198]) by smtp.gmail.com with ESMTPSA id
 el14-20020ad459ce000000b0062119a7a7a3sm3086780qvb.4.2023.05.23.14.46.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 14:46:30 -0700 (PDT)
From: "J. corwin Coburn" <corwin@redhat.com>
To: dm-devel@redhat.com,
	linux-block@vger.kernel.org
Date: Tue, 23 May 2023 17:45:25 -0400
Message-Id: <20230523214539.226387-26-corwin@redhat.com>
In-Reply-To: <20230523214539.226387-1-corwin@redhat.com>
References: <20230523214539.226387-1-corwin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH v2 25/39] Add vdo_slab.
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Most of the vdo volume belongs to the slab depot. The depot contains a
collection of slabs. The slabs can be up to 32GB, and are divided into
three sections. Most of a slab consists of a linear sequence of 4K blocks.
These blocks are used either to store data, or to hold portions of the
block map (see subsequent patches). In addition to the data blocks, each
slab has a set of reference counters, using 1 byte for each data block.
Finally each slab has a journal. Reference updates are written to the slab
journal, which is written out one block at a time as each block fills. A
copy of the reference counters is kept in memory, and are written out a
block at a time, in oldest-dirtied-order whenever there is a need to
reclaim slab journal space. The journal is used both to ensure that the
main recovery journal (see subsequent patches) can regularly free up space,
and also to amortize the cost of updating individual reference blocks.

This patch adds the slab structure as well as the slab journal and
reference counters.

Signed-off-by: J. corwin Coburn <corwin@redhat.com>
---
 drivers/md/dm-vdo/slab-depot.c | 2458 ++++++++++++++++++++++++++++++++
 drivers/md/dm-vdo/slab-depot.h |  253 ++++
 2 files changed, 2711 insertions(+)
 create mode 100644 drivers/md/dm-vdo/slab-depot.c
 create mode 100644 drivers/md/dm-vdo/slab-depot.h

diff --git a/drivers/md/dm-vdo/slab-depot.c b/drivers/md/dm-vdo/slab-depot.c
new file mode 100644
index 00000000000..e98ad5a1a52
--- /dev/null
+++ b/drivers/md/dm-vdo/slab-depot.c
@@ -0,0 +1,2458 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright Red Hat
+ */
+
+#include "slab-depot.h"
+
+#include <linux/atomic.h>
+#include <linux/bio.h>
+#include <linux/log2.h>
+#include <linux/min_heap.h>
+#include <linux/minmax.h>
+
+#include "logger.h"
+#include "memory-alloc.h"
+#include "numeric.h"
+#include "permassert.h"
+#include "string-utils.h"
+
+#include "action-manager.h"
+#include "admin-state.h"
+#include "completion.h"
+#include "constants.h"
+#include "data-vio.h"
+#include "encodings.h"
+#include "io-submitter.h"
+#include "physical-zone.h"
+#include "priority-table.h"
+#include "recovery-journal.h"
+#include "repair.h"
+#include "status-codes.h"
+#include "types.h"
+#include "vdo.h"
+#include "vio.h"
+#include "wait-queue.h"
+
+static const u64 BYTES_PER_WORD = sizeof(u64);
+static const bool NORMAL_OPERATION = true;
+
+/**
+ * get_lock() - Get the lock object for a slab journal block by sequence number.
+ * @journal: vdo_slab journal to retrieve from.
+ * @sequence_number: Sequence number of the block.
+ *
+ * Return: The lock object for the given sequence number.
+ */
+static inline struct journal_lock * __must_check
+get_lock(struct slab_journal *journal, sequence_number_t sequence_number)
+{
+	return &journal->locks[sequence_number % journal->size];
+}
+
+static bool is_slab_open(struct vdo_slab *slab)
+{
+	return (!vdo_is_state_quiescing(&slab->state) && !vdo_is_state_quiescent(&slab->state));
+}
+
+/**
+ * must_make_entries_to_flush() - Check whether there are entry waiters which should delay a flush.
+ * @journal: The journal to check.
+ *
+ * Return: true if there are no entry waiters, or if the slab is unrecovered.
+ */
+static inline bool __must_check must_make_entries_to_flush(struct slab_journal *journal)
+{
+	return ((journal->slab->status != VDO_SLAB_REBUILDING) &&
+		vdo_has_waiters(&journal->entry_waiters));
+}
+
+/**
+ * is_reaping() - Check whether a reap is currently in progress.
+ * @journal: The journal which may be reaping.
+ *
+ * Return: true if the journal is reaping.
+ */
+static inline bool __must_check is_reaping(struct slab_journal *journal)
+{
+	return (journal->head != journal->unreapable);
+}
+
+/**
+ * initialize_tail_block() - Initialize tail block as a new block.
+ * @journal: The journal whose tail block is being initialized.
+ */
+static void initialize_tail_block(struct slab_journal *journal)
+{
+	struct slab_journal_block_header *header = &journal->tail_header;
+
+	header->sequence_number = journal->tail;
+	header->entry_count = 0;
+	header->has_block_map_increments = false;
+}
+
+/**
+ * initialize_journal_state() - Set all journal fields appropriately to start journaling.
+ * @journal: The journal to be reset, based on its tail sequence number.
+ */
+static void initialize_journal_state(struct slab_journal *journal)
+{
+	journal->unreapable = journal->head;
+	journal->reap_lock = get_lock(journal, journal->unreapable);
+	journal->next_commit = journal->tail;
+	journal->summarized = journal->last_summarized = journal->tail;
+	initialize_tail_block(journal);
+}
+
+/**
+ * block_is_full() - Check whether a journal block is full.
+ * @journal: The slab journal for the block.
+ *
+ * Return: true if the tail block is full.
+ */
+static bool __must_check block_is_full(struct slab_journal *journal)
+{
+	journal_entry_count_t count = journal->tail_header.entry_count;
+
+	return (journal->tail_header.has_block_map_increments ?
+		(journal->full_entries_per_block == count) :
+		(journal->entries_per_block == count));
+}
+
+static void add_entries(struct slab_journal *journal);
+static void update_tail_block_location(struct slab_journal *journal);
+static void release_journal_locks(struct waiter *waiter, void *context);
+
+/**
+ * is_slab_journal_blank() - Check whether a slab's journal is blank.
+ *
+ * A slab journal is blank if it has never had any entries recorded in it.
+ *
+ * Return: true if the slab's journal has never been modified.
+ */
+static bool is_slab_journal_blank(const struct vdo_slab *slab)
+{
+	return ((slab->journal.tail == 1) && (slab->journal.tail_header.entry_count == 0));
+}
+
+/**
+ * mark_slab_journal_dirty() - Put a slab journal on the dirty ring of its allocator in the correct
+ *                             order.
+ * @journal: The journal to be marked dirty.
+ * @lock: The recovery journal lock held by the slab journal.
+ */
+static void mark_slab_journal_dirty(struct slab_journal *journal, sequence_number_t lock)
+{
+	struct slab_journal *dirty_journal;
+	struct list_head *dirty_list = &journal->slab->allocator->dirty_slab_journals;
+
+	ASSERT_LOG_ONLY(journal->recovery_lock == 0, "slab journal was clean");
+
+	journal->recovery_lock = lock;
+	list_for_each_entry_reverse(dirty_journal, dirty_list, dirty_entry) {
+		if (dirty_journal->recovery_lock <= journal->recovery_lock)
+			break;
+	}
+
+	list_move_tail(&journal->dirty_entry, dirty_journal->dirty_entry.next);
+}
+
+static void mark_slab_journal_clean(struct slab_journal *journal)
+{
+	journal->recovery_lock = 0;
+	list_del_init(&journal->dirty_entry);
+}
+
+static void check_if_slab_drained(struct vdo_slab *slab)
+{
+	bool read_only;
+	struct slab_journal *journal = &slab->journal;
+	const struct admin_state_code *code;
+
+	if (!vdo_is_state_draining(&slab->state) ||
+	    must_make_entries_to_flush(journal) ||
+	    is_reaping(journal) ||
+	    journal->waiting_to_commit ||
+	    !list_empty(&journal->uncommitted_blocks) ||
+	    journal->updating_slab_summary ||
+	    (slab->active_count > 0))
+		return;
+
+	/* When not suspending or recovering, the slab must be clean. */
+	code = vdo_get_admin_state_code(&slab->state);
+	read_only = vdo_is_read_only(slab->allocator->depot->vdo);
+	if (!read_only &&
+	    vdo_has_waiters(&slab->dirty_blocks) &&
+	    (code != VDO_ADMIN_STATE_SUSPENDING) &&
+	    (code != VDO_ADMIN_STATE_RECOVERING))
+		return;
+
+	vdo_finish_draining_with_result(&slab->state, (read_only ? VDO_READ_ONLY : VDO_SUCCESS));
+}
+
+/**
+ * finish_reaping() - Actually advance the head of the journal now that any necessary flushes are
+ *                    complete.
+ * @journal: The journal to be reaped.
+ */
+static void finish_reaping(struct slab_journal *journal)
+{
+	journal->head = journal->unreapable;
+	add_entries(journal);
+	check_if_slab_drained(journal->slab);
+}
+
+static void reap_slab_journal(struct slab_journal *journal);
+
+/**
+ * complete_reaping() - Finish reaping now that we have flushed the lower layer and then try
+ *                      reaping again in case we deferred reaping due to an outstanding vio.
+ * @completion: The flush vio.
+ */
+static void complete_reaping(struct vdo_completion *completion)
+{
+	struct slab_journal *journal = completion->parent;
+
+	return_vio_to_pool(journal->slab->allocator->vio_pool,
+			   vio_as_pooled_vio(as_vio(UDS_FORGET(completion))));
+	finish_reaping(journal);
+	reap_slab_journal(journal);
+}
+
+/**
+ * handle_flush_error() - Handle an error flushing the lower layer.
+ * @completion: The flush vio.
+ */
+static void handle_flush_error(struct vdo_completion *completion)
+{
+	vio_record_metadata_io_error(as_vio(completion));
+	vdo_enter_read_only_mode(completion->vdo, completion->result);
+	complete_reaping(completion);
+}
+
+static void flush_endio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct slab_journal *journal = vio->completion.parent;
+
+	continue_vio_after_io(vio,
+			      complete_reaping,
+			      journal->slab->allocator->thread_id);
+}
+
+/**
+ * flush_for_reaping() - A waiter callback for getting a vio with which to flush the lower layer
+ *                       prior to reaping.
+ * @waiter: The journal as a flush waiter.
+ * @context: The newly acquired flush vio.
+ */
+static void flush_for_reaping(struct waiter *waiter, void *context)
+{
+	struct slab_journal *journal = container_of(waiter, struct slab_journal, flush_waiter);
+	struct pooled_vio *pooled = context;
+	struct vio *vio = &pooled->vio;
+
+	vio->completion.parent = journal;
+	submit_flush_vio(vio, flush_endio, handle_flush_error);
+}
+
+/**
+ * reap_slab_journal() - Conduct a reap on a slab journal to reclaim unreferenced blocks.
+ * @journal: The slab journal.
+ */
+static void reap_slab_journal(struct slab_journal *journal)
+{
+	bool reaped = false;
+
+	if (is_reaping(journal))
+		/* We already have a reap in progress so wait for it to finish. */
+		return;
+
+	if ((journal->slab->status != VDO_SLAB_REBUILT) ||
+	    !vdo_is_state_normal(&journal->slab->state) ||
+	    vdo_is_read_only(journal->slab->allocator->depot->vdo))
+		/*
+		 * We must not reap in the first two cases, and there's no point in read-only mode.
+		 */
+		return;
+
+	/*
+	 * Start reclaiming blocks only when the journal head has no references. Then stop when a
+	 * block is referenced or reap reaches the most recently written block, referenced by the
+	 * slab summary, which has the sequence number just before the tail.
+	 */
+	while ((journal->unreapable < journal->tail) && (journal->reap_lock->count == 0)) {
+		reaped = true;
+		journal->unreapable++;
+		journal->reap_lock++;
+		if (journal->reap_lock == &journal->locks[journal->size])
+			journal->reap_lock = &journal->locks[0];
+	}
+
+	if (!reaped)
+		return;
+
+	/*
+	 * It is never safe to reap a slab journal block without first issuing a flush, regardless
+	 * of whether a user flush has been received or not. In the absence of the flush, the
+	 * reference block write which released the locks allowing the slab journal to reap may not
+	 * be persisted. Although slab summary writes will eventually issue flushes, multiple slab
+	 * journal block writes can be issued while previous slab summary updates have not yet been
+	 * made. Even though those slab journal block writes will be ignored if the slab summary
+	 * update is not persisted, they may still overwrite the to-be-reaped slab journal block
+	 * resulting in a loss of reference count updates (VDO-2912).
+	 */
+	journal->flush_waiter.callback = flush_for_reaping;
+	acquire_vio_from_pool(journal->slab->allocator->vio_pool, &journal->flush_waiter);
+}
+
+/**
+ * adjust_slab_journal_block_reference() - Adjust the reference count for a slab journal block.
+ * @journal: The slab journal.
+ * @sequence_number: The journal sequence number of the referenced block.
+ * @adjustment: Amount to adjust the reference counter.
+ *
+ * Note that when the adjustment is negative, the slab journal will be reaped.
+ */
+static void
+adjust_slab_journal_block_reference(struct slab_journal *journal,
+				    sequence_number_t sequence_number,
+				    int adjustment)
+{
+	struct journal_lock *lock;
+
+	if (sequence_number == 0)
+		return;
+
+	if (journal->slab->status == VDO_SLAB_REPLAYING)
+		/* Locks should not be used during offline replay. */
+		return;
+
+	ASSERT_LOG_ONLY((adjustment != 0), "adjustment must be non-zero");
+	lock = get_lock(journal, sequence_number);
+	if (adjustment < 0)
+		ASSERT_LOG_ONLY((-adjustment <= lock->count),
+				"adjustment %d of lock count %u for slab journal block %llu must not underflow",
+				adjustment,
+				lock->count,
+				(unsigned long long) sequence_number);
+
+	lock->count += adjustment;
+	if (lock->count == 0)
+		reap_slab_journal(journal);
+}
+
+/**
+ * release_journal_locks() - Callback invoked after a slab summary update completes.
+ * @waiter: The slab summary waiter that has just been notified.
+ * @context: The result code of the update.
+ *
+ * Registered in the constructor on behalf of update_tail_block_location().
+ *
+ * Implements waiter_callback.
+ */
+static void release_journal_locks(struct waiter *waiter, void *context)
+{
+	sequence_number_t first, i;
+	struct slab_journal *journal =
+		container_of(waiter, struct slab_journal, slab_summary_waiter);
+	int result = *((int *)context);
+
+	if (result != VDO_SUCCESS) {
+		if (result != VDO_READ_ONLY)
+			/*
+			 * Don't bother logging what might be lots of errors if we are already in
+			 * read-only mode.
+			 */
+			uds_log_error_strerror(result,
+					       "failed slab summary update %llu",
+					       (unsigned long long) journal->summarized);
+
+		journal->updating_slab_summary = false;
+		vdo_enter_read_only_mode(journal->slab->allocator->depot->vdo, result);
+		check_if_slab_drained(journal->slab);
+		return;
+	}
+
+	if (journal->partial_write_in_progress && (journal->summarized == journal->tail)) {
+		journal->partial_write_in_progress = false;
+		add_entries(journal);
+	}
+
+	first = journal->last_summarized;
+	journal->last_summarized = journal->summarized;
+	for (i = journal->summarized - 1; i >= first; i--) {
+		/*
+		 * Release the lock the summarized block held on the recovery journal. (During
+		 * replay, recovery_start will always be 0.)
+		 */
+		if (journal->recovery_journal != NULL) {
+			zone_count_t zone_number = journal->slab->allocator->zone_number;
+
+			vdo_release_recovery_journal_block_reference(journal->recovery_journal,
+								     get_lock(journal, i)->recovery_start,
+								     VDO_ZONE_TYPE_PHYSICAL,
+								     zone_number);
+		}
+
+		/*
+		 * Release our own lock against reaping for blocks that are committed. (This
+		 * function will not change locks during replay.)
+		 */
+		adjust_slab_journal_block_reference(journal, i, -1);
+	}
+
+	journal->updating_slab_summary = false;
+
+	reap_slab_journal(journal);
+
+	/* Check if the slab summary needs to be updated again. */
+	update_tail_block_location(journal);
+}
+
+/**
+ * update_tail_block_location() - Update the tail block location in the slab summary, if necessary.
+ * @journal: The slab journal that is updating its tail block location.
+ */
+static void update_tail_block_location(struct slab_journal *journal)
+{
+	block_count_t free_block_count;
+	struct vdo_slab *slab = journal->slab;
+
+	if (journal->updating_slab_summary ||
+	    vdo_is_read_only(journal->slab->allocator->depot->vdo) ||
+	    (journal->last_summarized >= journal->next_commit)) {
+		check_if_slab_drained(slab);
+		return;
+	}
+
+	if (slab->status != VDO_SLAB_REBUILT) {
+		u8 hint = slab->allocator->summary_entries[slab->slab_number].fullness_hint;
+
+		free_block_count = ((block_count_t) hint) << slab->allocator->depot->hint_shift;
+	} else {
+		free_block_count = slab->free_blocks;
+	}
+
+	journal->summarized = journal->next_commit;
+	journal->updating_slab_summary = true;
+
+	/*
+	 * Update slab summary as dirty.
+	 * vdo_slab journal can only reap past sequence number 1 when all the ref counts for this
+	 * slab have been written to the layer. Therefore, indicate that the ref counts must be
+	 * loaded when the journal head has reaped past sequence number 1.
+	 */
+	update_slab_summary_entry(slab,
+				  &journal->slab_summary_waiter,
+				  journal->summarized % journal->size,
+				  (journal->head > 1),
+				  false,
+				  free_block_count);
+}
+
+/**
+ * reopen_slab_journal() - Reopen a slab's journal by emptying it and then adding pending entries.
+ */
+static void reopen_slab_journal(struct vdo_slab *slab)
+{
+	struct slab_journal *journal = &slab->journal;
+	sequence_number_t block;
+
+	ASSERT_LOG_ONLY(journal->tail_header.entry_count == 0,
+			"vdo_slab journal's active block empty before reopening");
+	journal->head = journal->tail;
+	initialize_journal_state(journal);
+
+	/* Ensure no locks are spuriously held on an empty journal. */
+	for (block = 1; block <= journal->size; block++)
+		ASSERT_LOG_ONLY((get_lock(journal, block)->count == 0),
+				"Scrubbed journal's block %llu is not locked",
+				(unsigned long long) block);
+
+	add_entries(journal);
+}
+
+static sequence_number_t get_committing_sequence_number(const struct pooled_vio *vio)
+{
+	const struct packed_slab_journal_block *block =
+		(const struct packed_slab_journal_block *) vio->vio.data;
+
+	return __le64_to_cpu(block->header.sequence_number);
+}
+
+/**
+ * complete_write() - Handle post-commit processing.
+ * @completion: The write vio as a completion.
+ *
+ * This is the callback registered by write_slab_journal_block().
+ */
+static void complete_write(struct vdo_completion *completion)
+{
+	int result = completion->result;
+	struct pooled_vio *pooled = vio_as_pooled_vio(as_vio(completion));
+	struct slab_journal *journal = completion->parent;
+	sequence_number_t committed = get_committing_sequence_number(pooled);
+
+	list_del_init(&pooled->list_entry);
+	return_vio_to_pool(journal->slab->allocator->vio_pool, UDS_FORGET(pooled));
+
+	if (result != VDO_SUCCESS) {
+		vio_record_metadata_io_error(as_vio(completion));
+		uds_log_error_strerror(result,
+				       "cannot write slab journal block %llu",
+				       (unsigned long long) committed);
+		vdo_enter_read_only_mode(journal->slab->allocator->depot->vdo, result);
+		check_if_slab_drained(journal->slab);
+		return;
+	}
+
+	WRITE_ONCE(journal->events->blocks_written, journal->events->blocks_written + 1);
+
+	if (list_empty(&journal->uncommitted_blocks)) {
+		/* If no blocks are outstanding, then the commit point is at the tail. */
+		journal->next_commit = journal->tail;
+	} else {
+		/* The commit point is always the beginning of the oldest incomplete block. */
+		pooled = container_of(journal->uncommitted_blocks.next,
+				      struct pooled_vio,
+				      list_entry);
+		journal->next_commit = get_committing_sequence_number(pooled);
+	}
+
+	update_tail_block_location(journal);
+}
+
+static void write_slab_journal_endio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct slab_journal *journal = vio->completion.parent;
+
+	continue_vio_after_io(vio, complete_write, journal->slab->allocator->thread_id);
+}
+
+/**
+ * write_slab_journal_block() - Write a slab journal block.
+ * @waiter: The vio pool waiter which was just notified.
+ * @context: The vio pool entry for the write.
+ *
+ * Callback from acquire_vio_from_pool() registered in commit_tail().
+ */
+static void write_slab_journal_block(struct waiter *waiter, void *context)
+{
+	struct pooled_vio *pooled = context;
+	struct vio *vio = &pooled->vio;
+	struct slab_journal *journal = container_of(waiter, struct slab_journal, resource_waiter);
+	struct slab_journal_block_header *header = &journal->tail_header;
+	int unused_entries = journal->entries_per_block - header->entry_count;
+	physical_block_number_t block_number;
+	const struct admin_state_code *operation;
+
+	header->head = journal->head;
+	list_add_tail(&pooled->list_entry, &journal->uncommitted_blocks);
+	vdo_pack_slab_journal_block_header(header, &journal->block->header);
+
+	/* Copy the tail block into the vio. */
+	memcpy(pooled->vio.data, journal->block, VDO_BLOCK_SIZE);
+
+	ASSERT_LOG_ONLY(unused_entries >= 0, "vdo_slab journal block is not overfull");
+	if (unused_entries > 0) {
+		/*
+		 * Release the per-entry locks for any unused entries in the block we are about to
+		 * write.
+		 */
+		adjust_slab_journal_block_reference(journal,
+						    header->sequence_number,
+						    -unused_entries);
+		journal->partial_write_in_progress = !block_is_full(journal);
+	}
+
+	block_number = journal->slab->journal_origin + (header->sequence_number % journal->size);
+	vio->completion.parent = journal;
+
+	/*
+	 * This block won't be read in recovery until the slab summary is updated to refer to it.
+	 * The slab summary update does a flush which is sufficient to protect us from VDO-2331.
+	 */
+	submit_metadata_vio(UDS_FORGET(vio),
+			    block_number,
+			    write_slab_journal_endio,
+			    complete_write,
+			    REQ_OP_WRITE);
+
+	/* Since the write is submitted, the tail block structure can be reused. */
+	journal->tail++;
+	initialize_tail_block(journal);
+	journal->waiting_to_commit = false;
+
+	operation = vdo_get_admin_state_code(&journal->slab->state);
+	if (operation == VDO_ADMIN_STATE_WAITING_FOR_RECOVERY) {
+		vdo_finish_operation(&journal->slab->state,
+				     (vdo_is_read_only(journal->slab->allocator->depot->vdo) ?
+				      VDO_READ_ONLY :
+				      VDO_SUCCESS));
+		return;
+	}
+
+	add_entries(journal);
+}
+
+/**
+ * commit_tail() - Commit the tail block of the slab journal.
+ * @journal: The journal whose tail block should be committed.
+ */
+static void commit_tail(struct slab_journal *journal)
+{
+	if ((journal->tail_header.entry_count == 0) && must_make_entries_to_flush(journal))
+		/*
+		 * There are no entries at the moment, but there are some waiters, so defer
+		 * initiating the flush until those entries are ready to write.
+		 */
+		return;
+
+	if (vdo_is_read_only(journal->slab->allocator->depot->vdo) ||
+	    journal->waiting_to_commit ||
+	    (journal->tail_header.entry_count == 0))
+		/*
+		 * There is nothing to do since the tail block is empty, or writing, or the journal
+		 * is in read-only mode.
+		 */
+		return;
+
+	/*
+	 * Since we are about to commit the tail block, this journal no longer needs to be on the
+	 * ring of journals which the recovery journal might ask to commit.
+	 */
+	mark_slab_journal_clean(journal);
+
+	journal->waiting_to_commit = true;
+
+	journal->resource_waiter.callback = write_slab_journal_block;
+	acquire_vio_from_pool(journal->slab->allocator->vio_pool, &journal->resource_waiter);
+}
+
+/**
+ * encode_slab_journal_entry() - Encode a slab journal entry.
+ * @tail_header: The unpacked header for the block.
+ * @payload: The journal block payload to hold the entry.
+ * @sbn: The slab block number of the entry to encode.
+ * @operation: The type of the entry.
+ * @increment: True if this is an increment.
+ *
+ * Exposed for unit tests.
+ */
+static void
+encode_slab_journal_entry(struct slab_journal_block_header *tail_header,
+			  slab_journal_payload *payload,
+			  slab_block_number sbn,
+			  enum journal_operation operation,
+			  bool increment)
+{
+	journal_entry_count_t entry_number = tail_header->entry_count++;
+
+	if (operation == VDO_JOURNAL_BLOCK_MAP_REMAPPING) {
+		if (!tail_header->has_block_map_increments) {
+			memset(payload->full_entries.entry_types,
+			       0,
+			       VDO_SLAB_JOURNAL_ENTRY_TYPES_SIZE);
+			tail_header->has_block_map_increments = true;
+		}
+
+		payload->full_entries.entry_types[entry_number / 8] |=
+			((u8)1 << (entry_number % 8));
+	}
+
+	vdo_pack_slab_journal_entry(&payload->entries[entry_number], sbn, increment);
+}
+
+/**
+ * expand_journal_point() - Convert a recovery journal journal_point which refers to both an
+ *                          increment and a decrement to a single point which refers to one or the
+ *                          other.
+ * @recovery_point: The journal point to convert.
+ * @increment: Whether the current entry is an increment.
+ *
+ * Return: The expanded journal point
+ *
+ * Because each data_vio has but a single recovery journal point, but may need to make both
+ * increment and decrement entries in the same slab journal. In order to distinguish the two
+ * entries, the entry count of the expanded journal point is twice the actual recovery journal
+ * entry count for increments, and one more than that for decrements.
+ */
+static struct journal_point
+expand_journal_point(struct journal_point recovery_point, bool increment)
+{
+	recovery_point.entry_count *= 2;
+	if (!increment)
+		recovery_point.entry_count++;
+
+	return recovery_point;
+}
+
+/**
+ * add_entry() - Actually add an entry to the slab journal, potentially firing off a write if a
+ *               block becomes full.
+ * @journal: The slab journal to append to.
+ * @pbn: The pbn being adjusted.
+ * @operation: The type of entry to make.
+ * @increment: True if this is an increment.
+ * @recovery_point: The expanded recovery point.
+ *
+ * This function is synchronous.
+ */
+static void add_entry(struct slab_journal *journal,
+		      physical_block_number_t pbn,
+		      enum journal_operation operation,
+		      bool increment,
+		      struct journal_point recovery_point)
+{
+	struct packed_slab_journal_block *block = journal->block;
+	int result;
+
+	result = ASSERT(vdo_before_journal_point(&journal->tail_header.recovery_point,
+						 &recovery_point),
+			"recovery journal point is monotonically increasing, recovery point: %llu.%u, block recovery point: %llu.%u",
+			(unsigned long long) recovery_point.sequence_number,
+			recovery_point.entry_count,
+			(unsigned long long) journal->tail_header.recovery_point.sequence_number,
+			journal->tail_header.recovery_point.entry_count);
+	if (result != VDO_SUCCESS) {
+		vdo_enter_read_only_mode(journal->slab->allocator->depot->vdo, result);
+		return;
+	}
+
+	if (operation == VDO_JOURNAL_BLOCK_MAP_REMAPPING) {
+		result = ASSERT((journal->tail_header.entry_count <
+				 journal->full_entries_per_block),
+				"block has room for full entries");
+		if (result != VDO_SUCCESS) {
+			vdo_enter_read_only_mode(journal->slab->allocator->depot->vdo, result);
+			return;
+		}
+	}
+
+	encode_slab_journal_entry(&journal->tail_header,
+				  &block->payload,
+				  pbn - journal->slab->start,
+				  operation,
+				  increment);
+	journal->tail_header.recovery_point = recovery_point;
+	if (block_is_full(journal))
+		commit_tail(journal);
+}
+
+static inline block_count_t journal_length(const struct slab_journal *journal)
+{
+	return journal->tail - journal->head;
+}
+
+/**
+ * vdo_attempt_replay_into_slab() - Replay a recovery journal entry into a slab's journal.
+ * @slab: The slab to play into.
+ * @pbn: The PBN for the entry.
+ * @operation: The type of entry to add.
+ * @increment: True if this entry is an increment.
+ * @recovery_point: The recovery journal point corresponding to this entry.
+ * @parent: The completion to notify when there is space to add the entry if the entry could not be
+ *          added immediately.
+ *
+ * Return: true if the entry was added immediately.
+ */
+bool vdo_attempt_replay_into_slab(struct vdo_slab *slab,
+				  physical_block_number_t pbn,
+				  enum journal_operation operation,
+				  bool increment,
+				  struct journal_point *recovery_point,
+				  struct vdo_completion *parent)
+{
+	struct slab_journal *journal = &slab->journal;
+	struct slab_journal_block_header *header = &journal->tail_header;
+	struct journal_point expanded = expand_journal_point(*recovery_point, increment);
+
+	/* Only accept entries after the current recovery point. */
+	if (!vdo_before_journal_point(&journal->tail_header.recovery_point, &expanded))
+		return true;
+
+	if ((header->entry_count >= journal->full_entries_per_block) &&
+	    (header->has_block_map_increments || (operation == VDO_JOURNAL_BLOCK_MAP_REMAPPING)))
+		/*
+		 * The tail block does not have room for the entry we are attempting to add so
+		 * commit the tail block now.
+		 */
+		commit_tail(journal);
+
+	if (journal->waiting_to_commit) {
+		vdo_start_operation_with_waiter(&journal->slab->state,
+						VDO_ADMIN_STATE_WAITING_FOR_RECOVERY,
+						parent,
+						NULL);
+		return false;
+	}
+
+	if (journal_length(journal) >= journal->size) {
+		/*
+		 * We must have reaped the current head before the crash, since the blocked
+		 * threshold keeps us from having more entries than fit in a slab journal; hence we
+		 * can just advance the head (and unreapable block), as needed.
+		 */
+		journal->head++;
+		journal->unreapable++;
+	}
+
+	if (journal->slab->status == VDO_SLAB_REBUILT)
+		journal->slab->status = VDO_SLAB_REPLAYING;
+
+	add_entry(journal, pbn, operation, increment, expanded);
+	return true;
+}
+
+/**
+ * requires_reaping() - Check whether the journal must be reaped before adding new entries.
+ * @journal: The journal to check.
+ *
+ * Return: true if the journal must be reaped.
+ */
+static bool requires_reaping(const struct slab_journal *journal)
+{
+	return (journal_length(journal) >= journal->blocking_threshold);
+}
+
+/** finish_summary_update() - A waiter callback that resets the writing state of a slab. */
+static void finish_summary_update(struct waiter *waiter, void *context)
+{
+	struct vdo_slab *slab = container_of(waiter, struct vdo_slab, summary_waiter);
+	int result = *((int *) context);
+
+	slab->active_count--;
+
+	if ((result != VDO_SUCCESS) && (result != VDO_READ_ONLY)) {
+		uds_log_error_strerror(result, "failed to update slab summary");
+		vdo_enter_read_only_mode(slab->allocator->depot->vdo, result);
+	}
+
+	check_if_slab_drained(slab);
+}
+
+static void write_reference_block(struct waiter *waiter, void *context);
+
+/**
+ * launch_reference_block_write() - Launch the write of a dirty reference block by first acquiring
+ *                                  a VIO for it from the pool.
+ * @waiter: The waiter of the block which is starting to write.
+ * @context: The parent slab of the block.
+ *
+ * This can be asynchronous since the writer will have to wait if all VIOs in the pool are
+ * currently in use.
+ */
+static void launch_reference_block_write(struct waiter *waiter, void *context)
+{
+	struct vdo_slab *slab = context;
+
+	if (vdo_is_read_only(slab->allocator->depot->vdo))
+		return;
+
+	slab->active_count++;
+	container_of(waiter, struct reference_block, waiter)->is_writing = true;
+	waiter->callback = write_reference_block;
+	acquire_vio_from_pool(slab->allocator->vio_pool, waiter);
+}
+
+static void save_dirty_reference_blocks(struct vdo_slab *slab)
+{
+	vdo_notify_all_waiters(&slab->dirty_blocks, launch_reference_block_write, slab);
+	check_if_slab_drained(slab);
+}
+
+/**
+ * finish_reference_block_write() - After a reference block has written, clean it, release its
+ *                                  locks, and return its VIO to the pool.
+ * @completion: The VIO that just finished writing.
+ */
+static void finish_reference_block_write(struct vdo_completion *completion)
+{
+	struct vio *vio = as_vio(completion);
+	struct pooled_vio *pooled = vio_as_pooled_vio(vio);
+	struct reference_block *block = completion->parent;
+	struct vdo_slab *slab = block->slab;
+	tail_block_offset_t offset;
+
+	slab->active_count--;
+
+	/* Release the slab journal lock. */
+	adjust_slab_journal_block_reference(&slab->journal,
+					    block->slab_journal_lock_to_release,
+					    -1);
+	return_vio_to_pool(slab->allocator->vio_pool, pooled);
+
+	/*
+	 * We can't clear the is_writing flag earlier as releasing the slab journal lock may cause
+	 * us to be dirtied again, but we don't want to double enqueue.
+	 */
+	block->is_writing = false;
+
+	if (vdo_is_read_only(completion->vdo)) {
+		check_if_slab_drained(slab);
+		return;
+	}
+
+	/* Re-queue the block if it was re-dirtied while it was writing. */
+	if (block->is_dirty) {
+		vdo_enqueue_waiter(&block->slab->dirty_blocks, &block->waiter);
+		if (vdo_is_state_draining(&slab->state))
+			/* We must be saving, and this block will otherwise not be relaunched. */
+			save_dirty_reference_blocks(slab);
+
+		return;
+	}
+
+	/*
+	 * Mark the slab as clean in the slab summary if there are no dirty or writing blocks
+	 * and no summary update in progress.
+	 */
+	if ((slab->active_count > 0) || vdo_has_waiters(&slab->dirty_blocks))
+		return;
+
+	offset = slab->allocator->summary_entries[slab->slab_number].tail_block_offset;
+	slab->active_count++;
+	slab->summary_waiter.callback = finish_summary_update;
+	update_slab_summary_entry(slab,
+				  &slab->summary_waiter,
+				  offset,
+				  true,
+				  true,
+				  slab->free_blocks);
+}
+
+/**
+ * get_reference_counters_for_block() - Find the reference counters for a given block.
+ * @block: The reference_block in question.
+ *
+ * Return: A pointer to the reference counters for this block.
+ */
+static vdo_refcount_t * __must_check
+get_reference_counters_for_block(struct reference_block *block)
+{
+	size_t block_index = block - block->slab->reference_blocks;
+
+	return &block->slab->counters[block_index * COUNTS_PER_BLOCK];
+}
+
+/**
+ * pack_reference_block() - Copy data from a reference block to a buffer ready to be written out.
+ * @block: The block to copy.
+ * @buffer: The char buffer to fill with the packed block.
+ */
+static void pack_reference_block(struct reference_block *block, void *buffer)
+{
+	struct packed_reference_block *packed = buffer;
+	vdo_refcount_t *counters = get_reference_counters_for_block(block);
+	sector_count_t i;
+	struct packed_journal_point commit_point;
+
+	vdo_pack_journal_point(&block->slab->slab_journal_point, &commit_point);
+
+	for (i = 0; i < VDO_SECTORS_PER_BLOCK; i++) {
+		packed->sectors[i].commit_point = commit_point;
+		memcpy(packed->sectors[i].counts,
+		       counters + (i * COUNTS_PER_SECTOR),
+		       (sizeof(vdo_refcount_t) * COUNTS_PER_SECTOR));
+	}
+}
+
+static void write_reference_block_endio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct reference_block *block = vio->completion.parent;
+	thread_id_t thread_id = block->slab->allocator->thread_id;
+
+	continue_vio_after_io(vio, finish_reference_block_write, thread_id);
+}
+
+/**
+ * handle_io_error() - Handle an I/O error reading or writing a reference count block.
+ * @completion: The VIO doing the I/O as a completion.
+ */
+static void handle_io_error(struct vdo_completion *completion)
+{
+	int result = completion->result;
+	struct vio *vio = as_vio(completion);
+	struct vdo_slab *slab = ((struct reference_block *) completion->parent)->slab;
+
+	vio_record_metadata_io_error(vio);
+	return_vio_to_pool(slab->allocator->vio_pool, vio_as_pooled_vio(vio));
+	slab->active_count--;
+	vdo_enter_read_only_mode(slab->allocator->depot->vdo, result);
+	check_if_slab_drained(slab);
+}
+
+/**
+ * write_reference_block() - After a dirty block waiter has gotten a VIO from the VIO pool, copy
+ *                           its counters and associated data into the VIO, and launch the write.
+ * @waiter: The waiter of the dirty block.
+ * @context: The VIO returned by the pool.
+ */
+static void write_reference_block(struct waiter *waiter, void *context)
+{
+	size_t block_offset;
+	physical_block_number_t pbn;
+	struct pooled_vio *pooled = context;
+	struct vdo_completion *completion = &pooled->vio.completion;
+	struct reference_block *block = container_of(waiter, struct reference_block, waiter);
+
+	pack_reference_block(block, pooled->vio.data);
+	block_offset = (block - block->slab->reference_blocks);
+	pbn = (block->slab->ref_counts_origin + block_offset);
+	block->slab_journal_lock_to_release = block->slab_journal_lock;
+	completion->parent = block;
+
+	/*
+	 * Mark the block as clean, since we won't be committing any updates that happen after this
+	 * moment. As long as VIO order is preserved, two VIOs updating this block at once will not
+	 * cause complications.
+	 */
+	block->is_dirty = false;
+
+	/*
+	 * Flush before writing to ensure that the recovery journal and slab journal entries which
+	 * cover this reference update are stable (VDO-2331).
+	 */
+	WRITE_ONCE(block->slab->allocator->ref_counts_statistics.blocks_written,
+		   block->slab->allocator->ref_counts_statistics.blocks_written + 1);
+
+	completion->callback_thread_id = ((struct block_allocator *) pooled->context)->thread_id;
+	submit_metadata_vio(&pooled->vio,
+			    pbn,
+			    write_reference_block_endio,
+			    handle_io_error,
+			    REQ_OP_WRITE | REQ_PREFLUSH);
+}
+
+static void reclaim_journal_space(struct slab_journal *journal)
+{
+	block_count_t length = journal_length(journal);
+	struct vdo_slab *slab = journal->slab;
+	block_count_t write_count = vdo_count_waiters(&slab->dirty_blocks);
+	block_count_t written;
+
+	if ((length < journal->flushing_threshold) || (write_count == 0))
+		return;
+
+	/* The slab journal is over the first threshold, schedule some reference block writes. */
+	WRITE_ONCE(journal->events->flush_count, journal->events->flush_count + 1);
+	if (length < journal->flushing_deadline)
+		/* Schedule more writes the closer to the deadline we get. */
+		write_count = max_t(block_count_t,
+				    write_count / (journal->flushing_deadline - length + 1),
+				    1);
+
+	for (written = 0; written < write_count; written++)
+		vdo_notify_next_waiter(&slab->dirty_blocks, launch_reference_block_write, slab);
+}
+
+/**
+ * reference_count_to_status() - Convert a reference count to a reference status.
+ * @count: The count to convert.
+ *
+ * Return: The appropriate reference status.
+ */
+static enum reference_status __must_check
+reference_count_to_status(vdo_refcount_t count)
+{
+	if (count == EMPTY_REFERENCE_COUNT)
+		return RS_FREE;
+	else if (count == 1)
+		return RS_SINGLE;
+	else if (count == PROVISIONAL_REFERENCE_COUNT)
+		return RS_PROVISIONAL;
+	else
+		return RS_SHARED;
+}
+
+/**
+ * dirty_block() - Mark a reference count block as dirty, potentially adding it to the dirty queue
+ *                 if it wasn't already dirty.
+ * @block: The reference block to mark as dirty.
+ */
+static void dirty_block(struct reference_block *block)
+{
+	if (block->is_dirty)
+		return;
+
+	block->is_dirty = true;
+	if (!block->is_writing)
+		vdo_enqueue_waiter(&block->slab->dirty_blocks, &block->waiter);
+}
+
+/**
+ * get_reference_block() - Get the reference block that covers the given block index.
+ */
+static struct reference_block * __must_check
+get_reference_block(struct vdo_slab *slab, slab_block_number index)
+{
+	return &slab->reference_blocks[index / COUNTS_PER_BLOCK];
+}
+
+/**
+ * slab_block_number_from_pbn() - Determine the index within the slab of a particular physical
+ *                                block number.
+ * @slab: The slab.
+ * @physical_block_number: The physical block number.
+ * @slab_block_number_ptr: A pointer to the slab block number.
+ *
+ * Return: VDO_SUCCESS or an error code.
+ */
+static int __must_check
+slab_block_number_from_pbn(struct vdo_slab *slab,
+			   physical_block_number_t physical_block_number,
+			   slab_block_number *slab_block_number_ptr)
+{
+	u64 slab_block_number;
+
+	if (physical_block_number < slab->start)
+		return VDO_OUT_OF_RANGE;
+
+	slab_block_number = physical_block_number - slab->start;
+	if (slab_block_number >= slab->allocator->depot->slab_config.data_blocks)
+		return VDO_OUT_OF_RANGE;
+
+	*slab_block_number_ptr = slab_block_number;
+	return VDO_SUCCESS;
+}
+
+/**
+ * get_reference_counter() - Get the reference counter that covers the given physical block number.
+ * @slab: The slab to query.
+ * @pbn: The physical block number.
+ * @counter_ptr: A pointer to the reference counter.
+ */
+static int __must_check
+get_reference_counter(struct vdo_slab *slab,
+		      physical_block_number_t pbn,
+		      vdo_refcount_t **counter_ptr)
+{
+	slab_block_number index;
+	int result = slab_block_number_from_pbn(slab, pbn, &index);
+
+	if (result != VDO_SUCCESS)
+		return result;
+
+	*counter_ptr = &slab->counters[index];
+
+	return VDO_SUCCESS;
+}
+
+static unsigned int calculate_slab_priority(struct vdo_slab *slab)
+{
+	block_count_t free_blocks = slab->free_blocks;
+	unsigned int unopened_slab_priority = slab->allocator->unopened_slab_priority;
+	unsigned int priority;
+
+	/*
+	 * Wholly full slabs must be the only ones with lowest priority, 0.
+	 *
+	 * Slabs that have never been opened (empty, newly initialized, and never been written to)
+	 * have lower priority than previously opened slabs that have a significant number of free
+	 * blocks. This ranking causes VDO to avoid writing physical blocks for the first time
+	 * unless there are very few free blocks that have been previously written to.
+	 *
+	 * Since VDO doesn't discard blocks currently, reusing previously written blocks makes VDO
+	 * a better client of any underlying storage that is thinly-provisioned (though discarding
+	 * would be better).
+	 *
+	 * For all other slabs, the priority is derived from the logarithm of the number of free
+	 * blocks. Slabs with the same order of magnitude of free blocks have the same priority.
+	 * With 2^23 blocks, the priority will range from 1 to 25. The reserved
+	 * unopened_slab_priority divides the range and is skipped by the logarithmic mapping.
+	 */
+
+	if (free_blocks == 0)
+		return 0;
+
+	if (is_slab_journal_blank(slab))
+		return unopened_slab_priority;
+
+	priority = (1 + ilog2(free_blocks));
+	return ((priority < unopened_slab_priority) ? priority : priority + 1);
+}
+
+/*
+ * Slabs are essentially prioritized by an approximation of the number of free blocks in the slab
+ * so slabs with lots of free blocks with be opened for allocation before slabs that have few free
+ * blocks.
+ */
+static void prioritize_slab(struct vdo_slab *slab)
+{
+	ASSERT_LOG_ONLY(list_empty(&slab->allocq_entry),
+			"a slab must not already be on a ring when prioritizing");
+	slab->priority = calculate_slab_priority(slab);
+	vdo_priority_table_enqueue(slab->allocator->prioritized_slabs,
+				   slab->priority,
+				   &slab->allocq_entry);
+}
+
+/**
+ * adjust_free_block_count() - Adjust the free block count and (if needed) reprioritize the slab.
+ * @increment: should be true if the free block count went up.
+ */
+static void adjust_free_block_count(struct vdo_slab *slab, bool increment)
+{
+	struct block_allocator *allocator = slab->allocator;
+
+	WRITE_ONCE(allocator->allocated_blocks,
+		   allocator->allocated_blocks + (increment ? -1 : 1));
+
+	/* The open slab doesn't need to be reprioritized until it is closed. */
+	if (slab == allocator->open_slab)
+		return;
+
+	/* Don't bother adjusting the priority table if unneeded. */
+	if (slab->priority == calculate_slab_priority(slab))
+		return;
+
+	/*
+	 * Reprioritize the slab to reflect the new free block count by removing it from the table
+	 * and re-enqueuing it with the new priority.
+	 */
+	vdo_priority_table_remove(allocator->prioritized_slabs, &slab->allocq_entry);
+	prioritize_slab(slab);
+}
+
+/**
+ * increment_for_data() - Increment the reference count for a data block.
+ * @slab: The slab which owns the block.
+ * @block: The reference block which contains the block being updated.
+ * @block_number: The block to update.
+ * @old_status: The reference status of the data block before this increment.
+ * @lock: The pbn_lock associated with this increment (may be NULL).
+ * @counter_ptr: A pointer to the count for the data block (in, out).
+ * @adjust_block_count: Whether to update the allocator's free block count.
+ *
+ * Return: VDO_SUCCESS or an error.
+ */
+static int increment_for_data(struct vdo_slab *slab,
+			      struct reference_block *block,
+			      slab_block_number block_number,
+			      enum reference_status old_status,
+			      struct pbn_lock *lock,
+			      vdo_refcount_t *counter_ptr,
+			      bool adjust_block_count)
+{
+	switch (old_status) {
+	case RS_FREE:
+		*counter_ptr = 1;
+		block->allocated_count++;
+		slab->free_blocks--;
+		if (adjust_block_count)
+			adjust_free_block_count(slab, false);
+
+		break;
+
+	case RS_PROVISIONAL:
+		*counter_ptr = 1;
+		break;
+
+	default:
+		/* Single or shared */
+		if (*counter_ptr >= MAXIMUM_REFERENCE_COUNT)
+			return uds_log_error_strerror(VDO_REF_COUNT_INVALID,
+						      "Incrementing a block already having 254 references (slab %u, offset %u)",
+						      slab->slab_number,
+						      block_number);
+		(*counter_ptr)++;
+	}
+
+	if (lock != NULL)
+		vdo_unassign_pbn_lock_provisional_reference(lock);
+	return VDO_SUCCESS;
+}
+
+/**
+ * decrement_for_data() - Decrement the reference count for a data block.
+ * @slab: The slab which owns the block.
+ * @block: The reference block which contains the block being updated.
+ * @block_number: The block to update.
+ * @old_status: The reference status of the data block before this decrement.
+ * @updater: The reference updater doing this operation in case we need to look up the pbn lock.
+ * @lock: The pbn_lock associated with the block being decremented (may be NULL).
+ * @counter_ptr: A pointer to the count for the data block (in, out).
+ * @adjust_block_count: Whether to update the allocator's free block count.
+ *
+ * Return: VDO_SUCCESS or an error.
+ */
+static int decrement_for_data(struct vdo_slab *slab,
+			      struct reference_block *block,
+			      slab_block_number block_number,
+			      enum reference_status old_status,
+			      struct reference_updater *updater,
+			      vdo_refcount_t *counter_ptr,
+			      bool adjust_block_count)
+{
+	switch (old_status) {
+	case RS_FREE:
+		return uds_log_error_strerror(VDO_REF_COUNT_INVALID,
+					      "Decrementing free block at offset %u in slab %u",
+					      block_number,
+					      slab->slab_number);
+
+	case RS_PROVISIONAL:
+	case RS_SINGLE:
+		if (updater->zpbn.zone != NULL) {
+			struct pbn_lock *lock = vdo_get_physical_zone_pbn_lock(updater->zpbn.zone,
+									       updater->zpbn.pbn);
+
+			if (lock != NULL) {
+				/*
+				 * There is a read lock on this block, so the block must not become
+				 * unreferenced.
+				 */
+				*counter_ptr = PROVISIONAL_REFERENCE_COUNT;
+				vdo_assign_pbn_lock_provisional_reference(lock);
+				break;
+			}
+		}
+
+		*counter_ptr = EMPTY_REFERENCE_COUNT;
+		block->allocated_count--;
+		slab->free_blocks++;
+		if (adjust_block_count)
+			adjust_free_block_count(slab, true);
+
+		break;
+
+	default:
+		/* Shared */
+		(*counter_ptr)--;
+	}
+
+	return VDO_SUCCESS;
+}
+
+/**
+ * increment_for_block_map() - Increment the reference count for a block map page.
+ * @slab: The slab which owns the block.
+ * @block: The reference block which contains the block being updated.
+ * @block_number: The block to update.
+ * @old_status: The reference status of the block before this increment.
+ * @lock: The pbn_lock associated with this increment (may be NULL).
+ * @normal_operation: Whether we are in normal operation vs. recovery or rebuild.
+ * @counter_ptr: A pointer to the count for the block (in, out).
+ * @adjust_block_count: Whether to update the allocator's free block count.
+ *
+ * All block map increments should be from provisional to MAXIMUM_REFERENCE_COUNT. Since block map
+ * blocks never dedupe they should never be adjusted from any other state. The adjustment always
+ * results in MAXIMUM_REFERENCE_COUNT as this value is used to prevent dedupe against block map
+ * blocks.
+ *
+ * Return: VDO_SUCCESS or an error.
+ */
+static int increment_for_block_map(struct vdo_slab *slab,
+				   struct reference_block *block,
+				   slab_block_number block_number,
+				   enum reference_status old_status,
+				   struct pbn_lock *lock,
+				   bool normal_operation,
+				   vdo_refcount_t *counter_ptr,
+				   bool adjust_block_count)
+{
+	switch (old_status) {
+	case RS_FREE:
+		if (normal_operation)
+			return uds_log_error_strerror(VDO_REF_COUNT_INVALID,
+						      "Incrementing unallocated block map block (slab %u, offset %u)",
+						      slab->slab_number,
+						      block_number);
+
+		*counter_ptr = MAXIMUM_REFERENCE_COUNT;
+		block->allocated_count++;
+		slab->free_blocks--;
+		if (adjust_block_count)
+			adjust_free_block_count(slab, false);
+
+		return VDO_SUCCESS;
+
+	case RS_PROVISIONAL:
+		if (!normal_operation)
+			return uds_log_error_strerror(VDO_REF_COUNT_INVALID,
+						      "Block map block had provisional reference during replay (slab %u, offset %u)",
+						      slab->slab_number,
+						      block_number);
+
+		*counter_ptr = MAXIMUM_REFERENCE_COUNT;
+		if (lock != NULL)
+			vdo_unassign_pbn_lock_provisional_reference(lock);
+		return VDO_SUCCESS;
+
+	default:
+		return uds_log_error_strerror(VDO_REF_COUNT_INVALID,
+					      "Incrementing a block map block which is already referenced %u times (slab %u, offset %u)",
+					      *counter_ptr,
+					      slab->slab_number,
+					      block_number);
+	}
+}
+
+static bool __must_check is_valid_journal_point(const struct journal_point *point)
+{
+	return ((point != NULL) && (point->sequence_number > 0));
+}
+
+/**
+ * update_reference_count() - Update the reference count of a block.
+ * @slab: The slab which owns the block.
+ * @block: The reference block which contains the block being updated.
+ * @block_number: The block to update.
+ * @slab_journal_point: The slab journal point at which this update is journaled.
+ * @updater: The reference updater.
+ * @normal_operation: Whether we are in normal operation vs. recovery or rebuild.
+ * @adjust_block_count: Whether to update the slab's free block count.
+ * @provisional_decrement_ptr: A pointer which will be set to true if this update was a decrement
+ *                             of a provisional reference.
+ *
+ * Return: VDO_SUCCESS or an error.
+ */
+static int
+update_reference_count(struct vdo_slab *slab,
+		       struct reference_block *block,
+		       slab_block_number block_number,
+		       const struct journal_point *slab_journal_point,
+		       struct reference_updater *updater,
+		       bool normal_operation,
+		       bool adjust_block_count,
+		       bool *provisional_decrement_ptr)
+{
+	vdo_refcount_t *counter_ptr = &slab->counters[block_number];
+	enum reference_status old_status = reference_count_to_status(*counter_ptr);
+	int result;
+
+	if (!updater->increment) {
+		result = decrement_for_data(slab,
+					    block,
+					    block_number,
+					    old_status,
+					    updater,
+					    counter_ptr,
+					    adjust_block_count);
+		if ((result == VDO_SUCCESS) && (old_status == RS_PROVISIONAL)) {
+			if (provisional_decrement_ptr != NULL)
+				*provisional_decrement_ptr = true;
+			return VDO_SUCCESS;
+		}
+	} else if (updater->operation == VDO_JOURNAL_DATA_REMAPPING) {
+		result = increment_for_data(slab,
+					    block,
+					    block_number,
+					    old_status,
+					    updater->lock,
+					    counter_ptr,
+					    adjust_block_count);
+	} else {
+		result = increment_for_block_map(slab,
+						 block,
+						 block_number,
+						 old_status,
+						 updater->lock,
+						 normal_operation,
+						 counter_ptr,
+						 adjust_block_count);
+	}
+
+	if (result != VDO_SUCCESS)
+		return result;
+
+	if (is_valid_journal_point(slab_journal_point))
+		slab->slab_journal_point = *slab_journal_point;
+
+	return VDO_SUCCESS;
+}
+
+static int __must_check
+adjust_reference_count(struct vdo_slab *slab,
+		       struct reference_updater *updater,
+		       const struct journal_point *slab_journal_point)
+{
+	slab_block_number block_number;
+	int result;
+	struct reference_block *block;
+	bool provisional_decrement = false;
+
+	if (!is_slab_open(slab))
+		return VDO_INVALID_ADMIN_STATE;
+
+	result = slab_block_number_from_pbn(slab, updater->zpbn.pbn, &block_number);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	block = get_reference_block(slab, block_number);
+	result = update_reference_count(slab,
+					block,
+					block_number,
+					slab_journal_point,
+					updater,
+					NORMAL_OPERATION,
+					true,
+					&provisional_decrement);
+	if ((result != VDO_SUCCESS) || provisional_decrement)
+		return result;
+
+	if (block->is_dirty && (block->slab_journal_lock > 0)) {
+		sequence_number_t entry_lock = slab_journal_point->sequence_number;
+		/*
+		 * This block is already dirty and a slab journal entry has been made for it since
+		 * the last time it was clean. We must release the per-entry slab journal lock for
+		 * the entry associated with the update we are now doing.
+		 */
+		result = ASSERT(is_valid_journal_point(slab_journal_point),
+				"Reference count adjustments need slab journal points.");
+		if (result != VDO_SUCCESS)
+			return result;
+
+		adjust_slab_journal_block_reference(&slab->journal, entry_lock, -1);
+		return VDO_SUCCESS;
+	}
+
+	/*
+	 * This may be the first time we are applying an update for which there is a slab journal
+	 * entry to this block since the block was cleaned. Therefore, we convert the per-entry
+	 * slab journal lock to an uncommitted reference block lock, if there is a per-entry lock.
+	 */
+	if (is_valid_journal_point(slab_journal_point))
+		block->slab_journal_lock = slab_journal_point->sequence_number;
+	else
+		block->slab_journal_lock = 0;
+
+	dirty_block(block);
+	return VDO_SUCCESS;
+}
+
+/**
+ * add_entry_from_waiter() - Add an entry to the slab journal.
+ * @waiter: The vio which should make an entry now.
+ * @context: The slab journal to make an entry in.
+ *
+ * This callback is invoked by add_entries() once it has determined that we are ready to make
+ * another entry in the slab journal. Implements waiter_callback.
+ */
+static void add_entry_from_waiter(struct waiter *waiter, void *context)
+{
+	int result;
+	struct reference_updater *updater = container_of(waiter, struct reference_updater, waiter);
+	struct data_vio *data_vio = data_vio_from_reference_updater(updater);
+	struct slab_journal *journal = context;
+	struct slab_journal_block_header *header = &journal->tail_header;
+	struct journal_point slab_journal_point = {
+		.sequence_number = header->sequence_number,
+		.entry_count = header->entry_count,
+	};
+	sequence_number_t recovery_block = data_vio->recovery_journal_point.sequence_number;
+
+	if (header->entry_count == 0) {
+		/*
+		 * This is the first entry in the current tail block, so get a lock on the recovery
+		 * journal which we will hold until this tail block is committed.
+		 */
+		get_lock(journal, header->sequence_number)->recovery_start = recovery_block;
+		if (journal->recovery_journal != NULL) {
+			zone_count_t zone_number = journal->slab->allocator->zone_number;
+
+			vdo_acquire_recovery_journal_block_reference(journal->recovery_journal,
+								     recovery_block,
+								     VDO_ZONE_TYPE_PHYSICAL,
+								     zone_number);
+		}
+
+		mark_slab_journal_dirty(journal, recovery_block);
+		reclaim_journal_space(journal);
+	}
+
+	add_entry(journal,
+		  updater->zpbn.pbn,
+		  updater->operation,
+		  updater->increment,
+		  expand_journal_point(data_vio->recovery_journal_point, updater->increment));
+
+	if (journal->slab->status != VDO_SLAB_REBUILT) {
+		/*
+		 * If the slab is unrecovered, scrubbing will take care of the count since the
+		 * update is now recorded in the journal.
+		 */
+		adjust_slab_journal_block_reference(journal,
+						    slab_journal_point.sequence_number,
+						    -1);
+		result = VDO_SUCCESS;
+	} else {
+		/* Now that an entry has been made in the slab journal, update the counter. */
+		result = adjust_reference_count(journal->slab, updater, &slab_journal_point);
+	}
+
+	if (updater->increment)
+		continue_data_vio_with_error(data_vio, result);
+	else
+		vdo_continue_completion(&data_vio->decrement_completion, result);
+}
+
+/**
+ * is_next_entry_a_block_map_increment() - Check whether the next entry to be made is a block map
+ *                                         increment.
+ * @journal: The journal.
+ *
+ * Return: true if the first entry waiter's operation is a block map increment.
+ */
+static inline bool is_next_entry_a_block_map_increment(struct slab_journal *journal)
+{
+	struct waiter *waiter = vdo_get_first_waiter(&journal->entry_waiters);
+	struct reference_updater *updater = container_of(waiter, struct reference_updater, waiter);
+
+	return (updater->operation == VDO_JOURNAL_BLOCK_MAP_REMAPPING);
+}
+
+/**
+ * add_entries() - Add as many entries as possible from the queue of vios waiting to make entries.
+ * @journal: The journal to which entries may be added.
+ *
+ * By processing the queue in order, we ensure that slab journal entries are made in the same order
+ * as recovery journal entries for the same increment or decrement.
+ */
+static void add_entries(struct slab_journal *journal)
+{
+	if (journal->adding_entries)
+		/* Protect against re-entrancy. */
+		return;
+
+	journal->adding_entries = true;
+	while (vdo_has_waiters(&journal->entry_waiters)) {
+		struct slab_journal_block_header *header = &journal->tail_header;
+
+		if (journal->partial_write_in_progress ||
+		    (journal->slab->status == VDO_SLAB_REBUILDING))
+			/*
+			 * Don't add entries while rebuilding or while a partial write is
+			 * outstanding (VDO-2399).
+			 */
+			break;
+
+		if (journal->waiting_to_commit) {
+			/*
+			 * If we are waiting for resources to write the tail block, and the tail
+			 * block is full, we can't make another entry.
+			 */
+			WRITE_ONCE(journal->events->tail_busy_count,
+				   journal->events->tail_busy_count + 1);
+			break;
+		} else if (is_next_entry_a_block_map_increment(journal) &&
+			   (header->entry_count >= journal->full_entries_per_block)) {
+			/*
+			 * The tail block does not have room for a block map increment, so commit
+			 * it now.
+			 */
+			commit_tail(journal);
+			if (journal->waiting_to_commit) {
+				WRITE_ONCE(journal->events->tail_busy_count,
+					   journal->events->tail_busy_count + 1);
+				break;
+			}
+		}
+
+		/* If the slab is over the blocking threshold, make the vio wait. */
+		if (requires_reaping(journal)) {
+			WRITE_ONCE(journal->events->blocked_count,
+				   journal->events->blocked_count + 1);
+			save_dirty_reference_blocks(journal->slab);
+			break;
+		}
+
+		if (header->entry_count == 0) {
+			struct journal_lock *lock = get_lock(journal, header->sequence_number);
+
+			/*
+			 * Check if the on disk slab journal is full. Because of the blocking and
+			 * scrubbing thresholds, this should never happen.
+			 */
+			if (lock->count > 0) {
+				ASSERT_LOG_ONLY((journal->head + journal->size) == journal->tail,
+						"New block has locks, but journal is not full");
+
+				/*
+				 * The blocking threshold must let the journal fill up if the new
+				 * block has locks; if the blocking threshold is smaller than the
+				 * journal size, the new block cannot possibly have locks already.
+				 */
+				ASSERT_LOG_ONLY((journal->blocking_threshold >= journal->size),
+						"New block can have locks already iff blocking threshold is at the end of the journal");
+
+				WRITE_ONCE(journal->events->disk_full_count,
+					   journal->events->disk_full_count + 1);
+				save_dirty_reference_blocks(journal->slab);
+				break;
+			}
+
+			/*
+			 * Don't allow the new block to be reaped until all of the reference count
+			 * blocks are written and the journal block has been fully committed as
+			 * well.
+			 */
+			lock->count = journal->entries_per_block + 1;
+
+			if (header->sequence_number == 1) {
+				struct vdo_slab *slab = journal->slab;
+				block_count_t i;
+
+				/*
+				 * This is the first entry in this slab journal, ever. Dirty all of
+				 * the reference count blocks. Each will acquire a lock on the tail
+				 * block so that the journal won't be reaped until the reference
+				 * counts are initialized. The lock acquisition must be done by the
+				 * ref_counts since here we don't know how many reference blocks
+				 * the ref_counts has.
+				 */
+				for (i = 0; i < slab->reference_block_count; i++) {
+					slab->reference_blocks[i].slab_journal_lock = 1;
+					dirty_block(&slab->reference_blocks[i]);
+				}
+
+				adjust_slab_journal_block_reference(journal,
+								    1,
+								    slab->reference_block_count);
+			}
+		}
+
+		vdo_notify_next_waiter(&journal->entry_waiters, add_entry_from_waiter, journal);
+	}
+
+	journal->adding_entries = false;
+
+	/* If there are no waiters, and we are flushing or saving, commit the tail block. */
+	if (vdo_is_state_draining(&journal->slab->state) &&
+	    !vdo_is_state_suspending(&journal->slab->state) &&
+	    !vdo_has_waiters(&journal->entry_waiters))
+		commit_tail(journal);
+}
+
+/**
+ * reset_search_cursor() - Reset the free block search back to the first reference counter in the
+ *                         first reference block of a slab.
+ */
+static void reset_search_cursor(struct vdo_slab *slab)
+{
+	struct search_cursor *cursor = &slab->search_cursor;
+
+	cursor->block = cursor->first_block;
+	cursor->index = 0;
+	/* Unit tests have slabs with only one reference block (and it's a runt). */
+	cursor->end_index = min_t(u32, COUNTS_PER_BLOCK, slab->block_count);
+}
+
+/**
+ * advance_search_cursor() - Advance the search cursor to the start of the next reference block in
+ *                           a slab,
+ *
+ * Wraps around to the first reference block if the current block is the last reference block.
+ *
+ * Return: true unless the cursor was at the last reference block.
+ */
+static bool advance_search_cursor(struct vdo_slab *slab)
+{
+	struct search_cursor *cursor = &slab->search_cursor;
+
+	/*
+	 * If we just finished searching the last reference block, then wrap back around to the
+	 * start of the array.
+	 */
+	if (cursor->block == cursor->last_block) {
+		reset_search_cursor(slab);
+		return false;
+	}
+
+	/* We're not already at the end, so advance to cursor to the next block. */
+	cursor->block++;
+	cursor->index = cursor->end_index;
+
+	if (cursor->block == cursor->last_block)
+		/* The last reference block will usually be a runt. */
+		cursor->end_index = slab->block_count;
+	else
+		cursor->end_index += COUNTS_PER_BLOCK;
+	return true;
+}
+
+/**
+ * replay_reference_count_change() - Replay the reference count adjustment from a slab journal
+ *                                   entry into the reference count for a block.
+ * @slab: The slab.
+ * @entry_point: The slab journal point for the entry.
+ * @entry: The slab journal entry being replayed.
+ *
+ * The adjustment will be ignored if it was already recorded in the reference count.
+ *
+ * Return: VDO_SUCCESS or an error code.
+ */
+static int
+replay_reference_count_change(struct vdo_slab *slab,
+			      const struct journal_point *entry_point,
+			      struct slab_journal_entry entry)
+{
+	int result;
+	struct reference_block *block = get_reference_block(slab, entry.sbn);
+	sector_count_t sector = (entry.sbn % COUNTS_PER_BLOCK) / COUNTS_PER_SECTOR;
+	struct reference_updater updater = {
+		.operation = entry.operation,
+		.increment = entry.increment,
+	};
+
+	if (!vdo_before_journal_point(&block->commit_points[sector], entry_point))
+		/* This entry is already reflected in the existing counts, so do nothing. */
+		return VDO_SUCCESS;
+
+	/* This entry is not yet counted in the reference counts. */
+	result = update_reference_count(slab,
+					block,
+					entry.sbn,
+					entry_point,
+					&updater,
+					!NORMAL_OPERATION,
+					false,
+					NULL);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	dirty_block(block);
+	return VDO_SUCCESS;
+}
+
+/**
+ * find_zero_byte_in_word() - Find the array index of the first zero byte in word-sized range of
+ *                            reference counters.
+ * @word_ptr: A pointer to the eight counter bytes to check.
+ * @start_index: The array index corresponding to word_ptr[0].
+ * @fail_index: The array index to return if no zero byte is found.
+ *
+ * The search does no bounds checking; the function relies on the array being sufficiently padded.
+ *
+ * Return: The array index of the first zero byte in the word, or the value passed as fail_index if
+ *         no zero byte was found.
+ */
+static inline slab_block_number
+find_zero_byte_in_word(const u8 *word_ptr,
+		       slab_block_number start_index,
+		       slab_block_number fail_index)
+{
+	u64 word = get_unaligned_le64(word_ptr);
+
+	/* This looks like a loop, but GCC will unroll the eight iterations for us. */
+	unsigned int offset;
+
+	for (offset = 0; offset < BYTES_PER_WORD; offset++) {
+		/* Assumes little-endian byte order, which we have on X86. */
+		if ((word & 0xFF) == 0)
+			return (start_index + offset);
+		word >>= 8;
+	}
+
+	return fail_index;
+}
+
+/**
+ * vdo_find_free_block() - Find the first block with a reference count of zero in the specified
+ *                         range of reference counter indexes.
+ * @slab: The slab counters to scan.
+ * @index_ptr: A pointer to hold the array index of the free block.
+ *
+ * Exposed for unit testing.
+ *
+ * Return: true if a free block was found in the specified range.
+ */
+static bool
+find_free_block(const struct vdo_slab *slab, slab_block_number *index_ptr)
+{
+	slab_block_number zero_index;
+	slab_block_number next_index = slab->search_cursor.index;
+	slab_block_number end_index = slab->search_cursor.end_index;
+	u8 *next_counter = &slab->counters[next_index];
+	u8 *end_counter = &slab->counters[end_index];
+
+	/*
+	 * Search every byte of the first unaligned word. (Array is padded so reading past end is
+	 * safe.)
+	 */
+	zero_index = find_zero_byte_in_word(next_counter, next_index, end_index);
+	if (zero_index < end_index) {
+		*index_ptr = zero_index;
+		return true;
+	}
+
+	/*
+	 * On architectures where unaligned word access is expensive, this would be a good place to
+	 * advance to an alignment boundary.
+	 */
+	next_index += BYTES_PER_WORD;
+	next_counter += BYTES_PER_WORD;
+
+	/*
+	 * Now we're word-aligned; check an word at a time until we find a word containing a zero.
+	 * (Array is padded so reading past end is safe.)
+	 */
+	while (next_counter < end_counter) {
+		/*
+		 * The following code is currently an exact copy of the code preceding the loop,
+		 * but if you try to merge them by using a do loop, it runs slower because a jump
+		 * instruction gets added at the start of the iteration.
+		 */
+		zero_index = find_zero_byte_in_word(next_counter, next_index, end_index);
+		if (zero_index < end_index) {
+			*index_ptr = zero_index;
+			return true;
+		}
+
+		next_index += BYTES_PER_WORD;
+		next_counter += BYTES_PER_WORD;
+	}
+
+	return false;
+}
+
+/**
+ * search_current_reference_block() - Search the reference block currently saved in the search
+ *                                    cursor for a reference count of zero, starting at the saved
+ *                                    counter index.
+ * @slab: The slab to search.
+ * @free_index_ptr: A pointer to receive the array index of the zero reference count.
+ *
+ * Return: true if an unreferenced counter was found.
+ */
+static bool search_current_reference_block(const struct vdo_slab *slab,
+					   slab_block_number *free_index_ptr)
+{
+	/* Don't bother searching if the current block is known to be full. */
+	return ((slab->search_cursor.block->allocated_count < COUNTS_PER_BLOCK) &&
+		find_free_block(slab, free_index_ptr));
+}
+
+/**
+ * search_reference_blocks() - Search each reference block for a reference count of zero.
+ * @slab: The slab to search.
+ * @free_index_ptr: A pointer to receive the array index of the zero reference count.
+ *
+ * Searches each reference block for a reference count of zero, starting at the reference block and
+ * counter index saved in the search cursor and searching up to the end of the last reference
+ * block. The search does not wrap.
+ *
+ * Return: true if an unreferenced counter was found.
+ */
+static bool
+search_reference_blocks(struct vdo_slab *slab, slab_block_number *free_index_ptr)
+{
+	/* Start searching at the saved search position in the current block. */
+	if (search_current_reference_block(slab, free_index_ptr))
+		return true;
+
+	/* Search each reference block up to the end of the slab. */
+	while (advance_search_cursor(slab))
+		if (search_current_reference_block(slab, free_index_ptr))
+			return true;
+
+	return false;
+}
+
+/**
+ * make_provisional_reference() - Do the bookkeeping for making a provisional reference.
+ */
+static void
+make_provisional_reference(struct vdo_slab *slab, slab_block_number block_number)
+{
+	struct reference_block *block = get_reference_block(slab, block_number);
+
+	/*
+	 * Make the initial transition from an unreferenced block to a
+	 * provisionally allocated block.
+	 */
+	slab->counters[block_number] = PROVISIONAL_REFERENCE_COUNT;
+
+	/* Account for the allocation. */
+	block->allocated_count++;
+	slab->free_blocks--;
+}
+
+/**
+ * dirty_all_reference_blocks() - Mark all reference count blocks in a slab as dirty.
+ */
+static void dirty_all_reference_blocks(struct vdo_slab *slab)
+{
+	block_count_t i;
+
+	for (i = 0; i < slab->reference_block_count; i++)
+		dirty_block(&slab->reference_blocks[i]);
+}
+
+/**
+ * clear_provisional_references() - Clear the provisional reference counts from a reference block.
+ * @block: The block to clear.
+ */
+static void clear_provisional_references(struct reference_block *block)
+{
+	vdo_refcount_t *counters = get_reference_counters_for_block(block);
+	block_count_t j;
+
+	for (j = 0; j < COUNTS_PER_BLOCK; j++) {
+		if (counters[j] == PROVISIONAL_REFERENCE_COUNT) {
+			counters[j] = EMPTY_REFERENCE_COUNT;
+			block->allocated_count--;
+		}
+	}
+}
+
+static inline bool journal_points_equal(struct journal_point first, struct journal_point second)
+{
+	return ((first.sequence_number == second.sequence_number) &&
+		(first.entry_count == second.entry_count));
+}
+
+/**
+ * unpack_reference_block() - Unpack reference counts blocks into the internal memory structure.
+ * @packed: The written reference block to be unpacked.
+ * @block: The internal reference block to be loaded.
+ */
+static void
+unpack_reference_block(struct packed_reference_block *packed, struct reference_block *block)
+{
+	block_count_t index;
+	sector_count_t i;
+	struct vdo_slab *slab = block->slab;
+	vdo_refcount_t *counters = get_reference_counters_for_block(block);
+
+	for (i = 0; i < VDO_SECTORS_PER_BLOCK; i++) {
+		struct packed_reference_sector *sector = &packed->sectors[i];
+
+		vdo_unpack_journal_point(&sector->commit_point, &block->commit_points[i]);
+		memcpy(counters + (i * COUNTS_PER_SECTOR),
+		       sector->counts,
+		       (sizeof(vdo_refcount_t) * COUNTS_PER_SECTOR));
+		/* The slab_journal_point must be the latest point found in any sector. */
+		if (vdo_before_journal_point(&slab->slab_journal_point, &block->commit_points[i]))
+			slab->slab_journal_point = block->commit_points[i];
+
+		if ((i > 0) &&
+		    !journal_points_equal(block->commit_points[0], block->commit_points[i])) {
+			size_t block_index = block - block->slab->reference_blocks;
+
+			uds_log_warning("Torn write detected in sector %u of reference block %zu of slab %u",
+					i,
+					block_index,
+					block->slab->slab_number);
+		}
+	}
+
+	block->allocated_count = 0;
+	for (index = 0; index < COUNTS_PER_BLOCK; index++)
+		if (counters[index] != EMPTY_REFERENCE_COUNT)
+			block->allocated_count++;
+}
+
+/**
+ * finish_reference_block_load() - After a reference block has been read, unpack it.
+ * @completion: The VIO that just finished reading.
+ */
+static void finish_reference_block_load(struct vdo_completion *completion)
+{
+	struct vio *vio = as_vio(completion);
+	struct pooled_vio *pooled = vio_as_pooled_vio(vio);
+	struct reference_block *block = completion->parent;
+	struct vdo_slab *slab = block->slab;
+
+	unpack_reference_block((struct packed_reference_block *) vio->data, block);
+	return_vio_to_pool(slab->allocator->vio_pool, pooled);
+	slab->active_count--;
+	clear_provisional_references(block);
+
+	slab->free_blocks -= block->allocated_count;
+	check_if_slab_drained(slab);
+}
+
+static void load_reference_block_endio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct reference_block *block = vio->completion.parent;
+
+	continue_vio_after_io(vio, finish_reference_block_load, block->slab->allocator->thread_id);
+}
+
+/**
+ * load_reference_block() - After a block waiter has gotten a VIO from the VIO pool, load the
+ *                          block.
+ * @waiter: The waiter of the block to load.
+ * @context: The VIO returned by the pool.
+ */
+static void load_reference_block(struct waiter *waiter, void *context)
+{
+	struct pooled_vio *pooled = context;
+	struct vio *vio = &pooled->vio;
+	struct reference_block *block = container_of(waiter, struct reference_block, waiter);
+	size_t block_offset = (block - block->slab->reference_blocks);
+
+	vio->completion.parent = block;
+	submit_metadata_vio(vio,
+			    block->slab->ref_counts_origin + block_offset,
+			    load_reference_block_endio,
+			    handle_io_error,
+			    REQ_OP_READ);
+}
+
+/**
+ * load_reference_blocks() - Load a slab's reference blocks from the underlying storage into a
+ *                           pre-allocated reference counter.
+ */
+static void load_reference_blocks(struct vdo_slab *slab)
+{
+	block_count_t i;
+
+	slab->free_blocks = slab->block_count;
+	slab->active_count = slab->reference_block_count;
+	for (i = 0; i < slab->reference_block_count; i++) {
+		struct waiter *waiter = &slab->reference_blocks[i].waiter;
+
+		waiter->callback = load_reference_block;
+		acquire_vio_from_pool(slab->allocator->vio_pool, waiter);
+	}
+}
+
+/**
+ * drain_slab() - Drain all reference count I/O.
+ *
+ * Depending upon the type of drain being performed (as recorded in the ref_count's vdo_slab), the
+ * reference blocks may be loaded from disk or dirty reference blocks may be written out.
+ */
+static void drain_slab(struct vdo_slab *slab)
+{
+	bool save;
+	bool load;
+	const struct admin_state_code *state = vdo_get_admin_state_code(&slab->state);
+
+	if (state == VDO_ADMIN_STATE_SUSPENDING)
+		return;
+
+	if ((state != VDO_ADMIN_STATE_REBUILDING) && (state != VDO_ADMIN_STATE_SAVE_FOR_SCRUBBING))
+		commit_tail(&slab->journal);
+
+	if ((state == VDO_ADMIN_STATE_RECOVERING) || (slab->counters == NULL))
+		return;
+
+	save = false;
+	load = slab->allocator->summary_entries[slab->slab_number].load_ref_counts;
+	if (state == VDO_ADMIN_STATE_SCRUBBING) {
+		if (load) {
+			load_reference_blocks(slab);
+			return;
+		}
+	} else if (state == VDO_ADMIN_STATE_SAVE_FOR_SCRUBBING) {
+		if (!load)
+			/* These reference counts were never written, so mark them all dirty. */
+			dirty_all_reference_blocks(slab);
+
+		save = true;
+	} else if (state == VDO_ADMIN_STATE_REBUILDING) {
+		/*
+		 * Write out the counters if the slab has written them before, or it has any
+		 * non-zero reference counts, or there are any slab journal blocks.
+		 */
+		block_count_t data_blocks = slab->allocator->depot->slab_config.data_blocks;
+
+		if (load ||
+		    (slab->free_blocks != data_blocks) ||
+		    !is_slab_journal_blank(slab)) {
+			dirty_all_reference_blocks(slab);
+			save = true;
+		}
+	} else if (state == VDO_ADMIN_STATE_SAVING) {
+		save = (slab->status == VDO_SLAB_REBUILT);
+	} else {
+		vdo_finish_draining_with_result(&slab->state, VDO_SUCCESS);
+		return;
+	}
+
+	if (save)
+		save_dirty_reference_blocks(slab);
+}
+
+static int allocate_slab_counters(struct vdo_slab *slab)
+{
+	int result;
+	size_t index, bytes;
+
+	result = ASSERT(slab->reference_blocks == NULL,
+			"vdo_slab %u doesn't allocate refcounts twice",
+			slab->slab_number);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	result = UDS_ALLOCATE(slab->reference_block_count,
+			      struct reference_block,
+			      __func__,
+			      &slab->reference_blocks);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	/*
+	 * Allocate such that the runt slab has a full-length memory array, plus a little padding
+	 * so we can word-search even at the very end.
+	 */
+	bytes = (slab->reference_block_count * COUNTS_PER_BLOCK) + (2 * BYTES_PER_WORD);
+	result = UDS_ALLOCATE(bytes, vdo_refcount_t, "ref counts array", &slab->counters);
+	if (result != UDS_SUCCESS) {
+		UDS_FREE(UDS_FORGET(slab->reference_blocks));
+		return result;
+	}
+
+	slab->search_cursor.first_block = slab->reference_blocks;
+	slab->search_cursor.last_block = &slab->reference_blocks[slab->reference_block_count - 1];
+	reset_search_cursor(slab);
+
+	for (index = 0; index < slab->reference_block_count; index++) {
+		slab->reference_blocks[index] = (struct reference_block) {
+			.slab = slab,
+		};
+	}
+
+	return VDO_SUCCESS;
+}
+
+static int allocate_counters_if_clean(struct vdo_slab *slab)
+{
+	if (vdo_is_state_clean_load(&slab->state))
+		return allocate_slab_counters(slab);
+
+	return VDO_SUCCESS;
+}
+
+static void finish_loading_journal(struct vdo_completion *completion)
+{
+	struct vio *vio = as_vio(completion);
+	struct slab_journal *journal = completion->parent;
+	struct vdo_slab *slab = journal->slab;
+	struct packed_slab_journal_block *block = (struct packed_slab_journal_block *) vio->data;
+	struct slab_journal_block_header header;
+
+	vdo_unpack_slab_journal_block_header(&block->header, &header);
+
+	/* FIXME: should it be an error if the following conditional fails? */
+	if ((header.metadata_type == VDO_METADATA_SLAB_JOURNAL) &&
+	    (header.nonce == slab->allocator->nonce)) {
+		journal->tail = header.sequence_number + 1;
+
+		/*
+		 * If the slab is clean, this implies the slab journal is empty, so advance the
+		 * head appropriately.
+		 */
+		journal->head = (slab->allocator->summary_entries[slab->slab_number].is_dirty ?
+				 header.head :
+				 journal->tail);
+		journal->tail_header = header;
+		initialize_journal_state(journal);
+	}
+
+	return_vio_to_pool(slab->allocator->vio_pool, vio_as_pooled_vio(vio));
+	vdo_finish_loading_with_result(&slab->state, allocate_counters_if_clean(slab));
+}
+
+static void read_slab_journal_tail_endio(struct bio *bio)
+{
+	struct vio *vio = bio->bi_private;
+	struct slab_journal *journal = vio->completion.parent;
+
+	continue_vio_after_io(vio, finish_loading_journal, journal->slab->allocator->thread_id);
+}
+
+static void handle_load_error(struct vdo_completion *completion)
+{
+	int result = completion->result;
+	struct slab_journal *journal = completion->parent;
+	struct vio *vio = as_vio(completion);
+
+	vio_record_metadata_io_error(vio);
+	return_vio_to_pool(journal->slab->allocator->vio_pool, vio_as_pooled_vio(vio));
+	vdo_finish_loading_with_result(&journal->slab->state, result);
+}
+
+/**
+ * read_slab_journal_tail() - Read the slab journal tail block by using a vio acquired from the vio
+ *                            pool.
+ * @waiter: The vio pool waiter which has just been notified.
+ * @context: The vio pool entry given to the waiter.
+ *
+ * This is the success callback from acquire_vio_from_pool() when loading a slab journal.
+ */
+static void read_slab_journal_tail(struct waiter *waiter, void *context)
+{
+	struct slab_journal *journal = container_of(waiter, struct slab_journal, resource_waiter);
+	struct vdo_slab *slab = journal->slab;
+	struct pooled_vio *pooled = context;
+	struct vio *vio = &pooled->vio;
+	tail_block_offset_t last_commit_point =
+		slab->allocator->summary_entries[slab->slab_number].tail_block_offset;
+
+	/*
+	 * Slab summary keeps the commit point offset, so the tail block is the block before that.
+	 * Calculation supports small journals in unit tests.
+	 */
+	tail_block_offset_t tail_block = ((last_commit_point == 0) ?
+					  (tail_block_offset_t)(journal->size - 1) :
+					  (last_commit_point - 1));
+
+	vio->completion.parent = journal;
+	vio->completion.callback_thread_id = slab->allocator->thread_id;
+	submit_metadata_vio(vio,
+			    slab->journal_origin + tail_block,
+			    read_slab_journal_tail_endio,
+			    handle_load_error,
+			    REQ_OP_READ);
+}
+
+/**
+ * load_slab_journal() - Load a slab's journal by reading the journal's tail.
+ */
+static void load_slab_journal(struct vdo_slab *slab)
+{
+	struct slab_journal *journal = &slab->journal;
+	tail_block_offset_t last_commit_point;
+
+	last_commit_point = slab->allocator->summary_entries[slab->slab_number].tail_block_offset;
+	if ((last_commit_point == 0) &&
+	    !slab->allocator->summary_entries[slab->slab_number].load_ref_counts) {
+		/*
+		 * This slab claims that it has a tail block at (journal->size - 1), but a head of
+		 * 1. This is impossible, due to the scrubbing threshold, on a real system, so
+		 * don't bother reading the (bogus) data off disk.
+		 */
+		ASSERT_LOG_ONLY(((journal->size < 16) ||
+				 (journal->scrubbing_threshold < (journal->size - 1))),
+				"Scrubbing threshold protects against reads of unwritten slab journal blocks");
+		vdo_finish_loading_with_result(&slab->state, allocate_counters_if_clean(slab));
+		return;
+	}
+
+	journal->resource_waiter.callback = read_slab_journal_tail;
+	acquire_vio_from_pool(slab->allocator->vio_pool, &journal->resource_waiter);
+}
+
+static void free_slab(struct vdo_slab *slab)
+{
+	if (slab == NULL)
+		return;
+
+	list_del(&slab->allocq_entry);
+	UDS_FREE(UDS_FORGET(slab->journal.block));
+	UDS_FREE(UDS_FORGET(slab->journal.locks));
+	UDS_FREE(UDS_FORGET(slab->counters));
+	UDS_FREE(UDS_FORGET(slab->reference_blocks));
+	UDS_FREE(slab);
+}
+
+static int initialize_slab_journal(struct vdo_slab *slab)
+{
+	struct slab_journal *journal = &slab->journal;
+	const struct slab_config *slab_config = &slab->allocator->depot->slab_config;
+	int result;
+
+	result = UDS_ALLOCATE(slab_config->slab_journal_blocks,
+			      struct journal_lock,
+			      __func__,
+			      &journal->locks);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	result = UDS_ALLOCATE(VDO_BLOCK_SIZE,
+			      char,
+			      "struct packed_slab_journal_block",
+			      (char **) &journal->block);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	journal->slab = slab;
+	journal->size = slab_config->slab_journal_blocks;
+	journal->flushing_threshold = slab_config->slab_journal_flushing_threshold;
+	journal->blocking_threshold = slab_config->slab_journal_blocking_threshold;
+	journal->scrubbing_threshold = slab_config->slab_journal_scrubbing_threshold;
+	journal->entries_per_block = VDO_SLAB_JOURNAL_ENTRIES_PER_BLOCK;
+	journal->full_entries_per_block = VDO_SLAB_JOURNAL_FULL_ENTRIES_PER_BLOCK;
+	journal->events = &slab->allocator->slab_journal_statistics;
+	journal->recovery_journal = slab->allocator->depot->vdo->recovery_journal;
+	journal->tail = 1;
+	journal->head = 1;
+
+	journal->flushing_deadline = journal->flushing_threshold;
+	/*
+	 * Set there to be some time between the deadline and the blocking threshold, so that
+	 * hopefully all are done before blocking.
+	 */
+	if ((journal->blocking_threshold - journal->flushing_threshold) > 5)
+		journal->flushing_deadline = journal->blocking_threshold - 5;
+
+	journal->slab_summary_waiter.callback = release_journal_locks;
+
+	INIT_LIST_HEAD(&journal->dirty_entry);
+	INIT_LIST_HEAD(&journal->uncommitted_blocks);
+
+	journal->tail_header.nonce = slab->allocator->nonce;
+	journal->tail_header.metadata_type = VDO_METADATA_SLAB_JOURNAL;
+	initialize_journal_state(journal);
+	return VDO_SUCCESS;
+}
+
+/**
+ * make_slab() - Construct a new, empty slab.
+ * @slab_origin: The physical block number within the block allocator partition of the first block
+ *               in the slab.
+ * @allocator: The block allocator to which the slab belongs.
+ * @slab_number: The slab number of the slab.
+ * @is_new: true if this slab is being allocated as part of a resize.
+ * @slab_ptr: A pointer to receive the new slab.
+ *
+ * Return: VDO_SUCCESS or an error code.
+ */
+static int __must_check
+make_slab(physical_block_number_t slab_origin,
+	  struct block_allocator *allocator,
+	  slab_count_t slab_number,
+	  bool is_new,
+	  struct vdo_slab **slab_ptr)
+{
+	const struct slab_config *slab_config = &allocator->depot->slab_config;
+	struct vdo_slab *slab;
+	int result;
+
+	result = UDS_ALLOCATE(1, struct vdo_slab, __func__, &slab);
+	if (result != VDO_SUCCESS)
+		return result;
+
+	*slab = (struct vdo_slab) {
+		.allocator = allocator,
+		.start = slab_origin,
+		.end = slab_origin + slab_config->slab_blocks,
+		.slab_number = slab_number,
+		.ref_counts_origin = slab_origin + slab_config->data_blocks,
+		.journal_origin = vdo_get_slab_journal_start_block(slab_config, slab_origin),
+		.block_count = slab_config->data_blocks,
+		.free_blocks = slab_config->data_blocks,
+		.reference_block_count =
+			vdo_get_saved_reference_count_size(slab_config->data_blocks),
+	};
+	INIT_LIST_HEAD(&slab->allocq_entry);
+
+	result = initialize_slab_journal(slab);
+	if (result != VDO_SUCCESS) {
+		free_slab(slab);
+		return result;
+	}
+
+	if (is_new) {
+		vdo_set_admin_state_code(&slab->state, VDO_ADMIN_STATE_NEW);
+		result = allocate_slab_counters(slab);
+		if (result != VDO_SUCCESS) {
+			free_slab(slab);
+			return result;
+		}
+	} else {
+		vdo_set_admin_state_code(&slab->state, VDO_ADMIN_STATE_NORMAL_OPERATION);
+	}
+
+	*slab_ptr = slab;
+	return VDO_SUCCESS;
+}
+
diff --git a/drivers/md/dm-vdo/slab-depot.h b/drivers/md/dm-vdo/slab-depot.h
new file mode 100644
index 00000000000..509804e3dac
--- /dev/null
+++ b/drivers/md/dm-vdo/slab-depot.h
@@ -0,0 +1,253 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright Red Hat
+ */
+
+#ifndef VDO_SLAB_DEPOT_H
+#define VDO_SLAB_DEPOT_H
+
+#include <linux/atomic.h>
+#include <linux/dm-kcopyd.h>
+#include <linux/list.h>
+
+#include "numeric.h"
+
+#include "admin-state.h"
+#include "completion.h"
+#include "data-vio.h"
+#include "encodings.h"
+#include "physical-zone.h"
+#include "priority-table.h"
+#include "recovery-journal.h"
+#include "statistics.h"
+#include "types.h"
+#include "vio.h"
+#include "wait-queue.h"
+
+/*
+ * Represents the possible status of a block.
+ */
+enum reference_status {
+	RS_FREE, /* this block is free */
+	RS_SINGLE, /* this block is singly-referenced */
+	RS_SHARED, /* this block is shared */
+	RS_PROVISIONAL /* this block is provisionally allocated */
+};
+
+struct vdo_slab;
+
+struct journal_lock {
+	u16 count;
+	sequence_number_t recovery_start;
+};
+
+struct slab_journal {
+	/* A waiter object for getting a VIO pool entry */
+	struct waiter resource_waiter;
+	/* A waiter object for updating the slab summary */
+	struct waiter slab_summary_waiter;
+	/* A waiter object for getting a vio with which to flush */
+	struct waiter flush_waiter;
+	/* The queue of VIOs waiting to make an entry */
+	struct wait_queue entry_waiters;
+	/* The parent slab reference of this journal */
+	struct vdo_slab *slab;
+
+	/* Whether a tail block commit is pending */
+	bool waiting_to_commit;
+	/* Whether the journal is updating the slab summary */
+	bool updating_slab_summary;
+	/* Whether the journal is adding entries from the entry_waiters queue */
+	bool adding_entries;
+	/* Whether a partial write is in progress */
+	bool partial_write_in_progress;
+
+	/* The oldest block in the journal on disk */
+	sequence_number_t head;
+	/* The oldest block in the journal which may not be reaped */
+	sequence_number_t unreapable;
+	/* The end of the half-open interval of the active journal */
+	sequence_number_t tail;
+	/* The next journal block to be committed */
+	sequence_number_t next_commit;
+	/* The tail sequence number that is written in the slab summary */
+	sequence_number_t summarized;
+	/* The tail sequence number that was last summarized in slab summary */
+	sequence_number_t last_summarized;
+
+	/* The sequence number of the recovery journal lock */
+	sequence_number_t recovery_lock;
+
+	/*
+	 * The number of entries which fit in a single block. Can't use the constant because unit
+	 * tests change this number.
+	 */
+	journal_entry_count_t entries_per_block;
+	/*
+	 * The number of full entries which fit in a single block. Can't use the constant because
+	 * unit tests change this number.
+	 */
+	journal_entry_count_t full_entries_per_block;
+
+	/* The recovery journal of the VDO (slab journal holds locks on it) */
+	struct recovery_journal *recovery_journal;
+
+	/* The statistics shared by all slab journals in our physical zone */
+	struct slab_journal_statistics *events;
+	/* A list of the VIO pool entries for outstanding journal block writes */
+	struct list_head uncommitted_blocks;
+
+	/*
+	 * The current tail block header state. This will be packed into the block just before it
+	 * is written.
+	 */
+	struct slab_journal_block_header tail_header;
+	/* A pointer to a block-sized buffer holding the packed block data */
+	struct packed_slab_journal_block *block;
+
+	/* The number of blocks in the on-disk journal */
+	block_count_t size;
+	/* The number of blocks at which to start pushing reference blocks */
+	block_count_t flushing_threshold;
+	/* The number of blocks at which all reference blocks should be writing */
+	block_count_t flushing_deadline;
+	/* The number of blocks at which to wait for reference blocks to write */
+	block_count_t blocking_threshold;
+	/* The number of blocks at which to scrub the slab before coming online */
+	block_count_t scrubbing_threshold;
+
+	/* This list entry is for block_allocator to keep a queue of dirty journals */
+	struct list_head dirty_entry;
+
+	/* The lock for the oldest unreaped block of the journal */
+	struct journal_lock *reap_lock;
+	/* The locks for each on disk block */
+	struct journal_lock *locks;
+};
+
+/*
+ * Reference_block structure
+ *
+ * Blocks are used as a proxy, permitting saves of partial refcounts.
+ */
+struct reference_block {
+	/* This block waits on the ref_counts to tell it to write */
+	struct waiter waiter;
+	/* The slab to which this reference_block belongs */
+	struct vdo_slab *slab;
+	/* The number of references in this block that represent allocations */
+	block_size_t allocated_count;
+	/* The slab journal block on which this block must hold a lock */
+	sequence_number_t slab_journal_lock;
+	/* The slab journal block which should be released when this block is committed */
+	sequence_number_t slab_journal_lock_to_release;
+	/* The point up to which each sector is accurate on disk */
+	struct journal_point commit_points[VDO_SECTORS_PER_BLOCK];
+	/* Whether this block has been modified since it was written to disk */
+	bool is_dirty;
+	/* Whether this block is currently writing */
+	bool is_writing;
+};
+
+/* The search_cursor represents the saved position of a free block search. */
+struct search_cursor {
+	/* The reference block containing the current search index */
+	struct reference_block *block;
+	/* The position at which to start searching for the next free counter */
+	slab_block_number index;
+	/* The position just past the last valid counter in the current block */
+	slab_block_number end_index;
+
+	/* A pointer to the first reference block in the slab */
+	struct reference_block *first_block;
+	/* A pointer to the last reference block in the slab */
+	struct reference_block *last_block;
+};
+
+enum slab_rebuild_status {
+	VDO_SLAB_REBUILT,
+	VDO_SLAB_REPLAYING,
+	VDO_SLAB_REQUIRES_SCRUBBING,
+	VDO_SLAB_REQUIRES_HIGH_PRIORITY_SCRUBBING,
+	VDO_SLAB_REBUILDING,
+};
+
+/*
+ * This is the type declaration for the vdo_slab type. A vdo_slab currently consists of a run of
+ * 2^23 data blocks, but that will soon change to dedicate a small number of those blocks for
+ * metadata storage for the reference counts and slab journal for the slab.
+ *
+ * A reference count is maintained for each physical block number. The vast majority of blocks have
+ * a very small reference count (usually 0 or 1). For references less than or equal to MAXIMUM_REFS
+ * (254) the reference count is stored in counters[pbn].
+ */
+struct vdo_slab {
+	/* A list entry to queue this slab in a block_allocator list */
+	struct list_head allocq_entry;
+
+	/* The struct block_allocator that owns this slab */
+	struct block_allocator *allocator;
+
+	/* The journal for this slab */
+	struct slab_journal journal;
+
+	/* The slab number of this slab */
+	slab_count_t slab_number;
+	/* The offset in the allocator partition of the first block in this slab */
+	physical_block_number_t start;
+	/* The offset of the first block past the end of this slab */
+	physical_block_number_t end;
+	/* The starting translated PBN of the slab journal */
+	physical_block_number_t journal_origin;
+	/* The starting translated PBN of the reference counts */
+	physical_block_number_t ref_counts_origin;
+
+	/* The administrative state of the slab */
+	struct admin_state state;
+	/* The status of the slab */
+	enum slab_rebuild_status status;
+	/* Whether the slab was ever queued for scrubbing */
+	bool was_queued_for_scrubbing;
+
+	/* The priority at which this slab has been queued for allocation */
+	u8 priority;
+
+	/* Fields beyond this point are the reference counts for the data blocks in this slab. */
+	/* The size of the counters array */
+	u32 block_count;
+	/* The number of free blocks */
+	u32 free_blocks;
+	/* The array of reference counts */
+	vdo_refcount_t *counters; /* use UDS_ALLOCATE to align data ptr */
+
+	/* The saved block pointer and array indexes for the free block search */
+	struct search_cursor search_cursor;
+
+	/* A list of the dirty blocks waiting to be written out */
+	struct wait_queue dirty_blocks;
+	/* The number of blocks which are currently writing */
+	size_t active_count;
+
+	/* A waiter object for updating the slab summary */
+	struct waiter summary_waiter;
+
+	/* The latest slab journal for which there has been a reference count update */
+	struct journal_point slab_journal_point;
+
+	/* The number of reference count blocks */
+	u32 reference_block_count;
+	/* reference count block array */
+	struct reference_block *reference_blocks;
+};
+
+bool __must_check
+vdo_attempt_replay_into_slab(struct vdo_slab *slab,
+			     physical_block_number_t pbn,
+			     enum journal_operation operation,
+			     bool increment,
+			     struct journal_point *recovery_point,
+			     struct vdo_completion *parent);
+
+void vdo_notify_slab_journals_are_recovered(struct vdo_completion *completion);
+
+#endif /* VDO_SLAB_DEPOT_H */
-- 
2.40.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

