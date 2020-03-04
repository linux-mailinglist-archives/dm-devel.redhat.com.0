Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4FF617A226
	for <lists+dm-devel@lfdr.de>; Thu,  5 Mar 2020 10:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583399975;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vb8hrgPQWIRmG89qC0itQ5TNTDRQ2CjBn+N+DNW8Fjo=;
	b=ibfejKPjV7YTeFNGiYOt/qNQ8vrn24Gyh0sBR49TbZPvBjQaOQzuq1l3X14lm+d2JRwhA6
	vmZGmNpv1Nnfhu9ryR30zn7bSTxcHYgN8o7yZ7h2R5xb516MWxL+ND6W/wEe/BaeELR/3U
	7oCrqYzBHw3WZeEnY1Vhkl28gJf8BTM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-kjyEu0HEMjCjlxxbe66uDA-1; Thu, 05 Mar 2020 04:19:33 -0500
X-MC-Unique: kjyEu0HEMjCjlxxbe66uDA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F581005512;
	Thu,  5 Mar 2020 09:19:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F0190CF0;
	Thu,  5 Mar 2020 09:19:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA1C98449D;
	Thu,  5 Mar 2020 09:19:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 024GeJqx023160 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Mar 2020 11:40:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E2F57100D89; Wed,  4 Mar 2020 16:40:18 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF5F8108BD8
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 16:40:16 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 45AE6185A790
	for <dm-devel@redhat.com>; Wed,  4 Mar 2020 16:40:16 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-183-UFt_esZ5NDiBRmFv_J9wXw-1; Wed, 04 Mar 2020 11:39:59 -0500
X-MC-Unique: UFt_esZ5NDiBRmFv_J9wXw-1
Received: from localhost (unknown [IPv6:2610:98:8005::7c7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested) (Authenticated sender: krisman)
	by bhuna.collabora.co.uk (Postfix) with ESMTPSA id A34E5277952;
	Wed,  4 Mar 2020 16:39:57 +0000 (GMT)
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com
Date: Wed,  4 Mar 2020 11:39:53 -0500
Message-Id: <20200304163953.578311-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 024GeJqx023160
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 05 Mar 2020 04:18:51 -0500
Cc: Tahsin Erdogan <tahsin@google.com>, snitzer@redhat.com,
	Khazhismel Kumykov <khazhy@google.com>, dm-devel@redhat.com,
	kernel@collabora.com, Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [dm-devel] [PATCH] iscsi: do not wait for IOs in dm shrinker
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Tahsin Erdogan <tahsin@google.com>

If something goes wrong with an iscsi session, the problem is reported
to giscsid via a netlink message. Then, giscsid tries to add a new device
and destroy the old one. During old device destruction, the pending ios
get completed with an error. Without destroying the device the io
operations are stuck forever.

If dm shrinker is invoked with __GFP_IO, shrinker gets blocked waiting for
the pending ios to complete. So, if the giscsid repair path ends up
doing a memory allocation with __GFP_IO enabled, it could end up in a
deadlock because the iscsi io cannot be completed until giscsid can do its
job and giscsid cannot do its job until the io completes.

Even worse, the deadlock can also occur even if giscsid avoids __GFP_IO
in all paths. For instance, if giscsid tries to grab a mutex held by
another thread and that thread invokes the shrinker we again may enter a
deadlock. Here is a scenario stitched from multiple bugs that
demonstrates how the deadlock can occur:

iSCSI-write
        holding: rx_queue_mutex
        waiting: uevent_sock_mutex

        kobject_uevent_env+0x1bd/0x419
        kobject_uevent+0xb/0xd
        device_add+0x48a/0x678
        scsi_add_host_with_dma+0xc5/0x22d
        iscsi_host_add+0x53/0x55
        iscsi_sw_tcp_session_create+0xa6/0x129
        iscsi_if_rx+0x100/0x1247
        netlink_unicast+0x213/0x4f0
        netlink_sendmsg+0x230/0x3c0

iscsi_fail iscsi_conn_failure
        waiting: rx_queue_mutex

        schedule_preempt_disabled+0x325/0x734
        __mutex_lock_slowpath+0x18b/0x230
        mutex_lock+0x22/0x40
        iscsi_conn_failure+0x42/0x149
        worker_thread+0x24a/0xbc0

EventManager_
        holding: uevent_sock_mutex
        waiting: dm_bufio_client->lock

        dm_bufio_lock+0xe/0x10
        shrink+0x34/0xf7
        shrink_slab+0x177/0x5d0
        do_try_to_free_pages+0x129/0x470
        try_to_free_mem_cgroup_pages+0x14f/0x210
        memcg_kmem_newpage_charge+0xa6d/0x13b0
        __alloc_pages_nodemask+0x4a3/0x1a70
        fallback_alloc+0x1b2/0x36c
        __kmalloc_node_track_caller+0xb9/0x10d0
        __alloc_skb+0x83/0x2f0
        kobject_uevent_env+0x26b/0x419
        dm_kobject_uevent+0x70/0x79
        dev_suspend+0x1a9/0x1e7
        ctl_ioctl+0x3e9/0x411
        dm_ctl_ioctl+0x13/0x17
        do_vfs_ioctl+0xb3/0x460
        SyS_ioctl+0x5e/0x90

MemcgReclaimerD"
        holding: dm_bufio_client->lock
        waiting: stuck io to finish (needs iscsi_fail thread to progress)

        schedule at ffffffffbd603618
        io_schedule at ffffffffbd603ba4
        do_io_schedule at ffffffffbdaf0d94
        __wait_on_bit at ffffffffbd6008a6
        out_of_line_wait_on_bit at ffffffffbd600960
        wait_on_bit.constprop.10 at ffffffffbdaf0f17
        __make_buffer_clean at ffffffffbdaf18ba
        __cleanup_old_buffer at ffffffffbdaf192f
        shrink at ffffffffbdaf19fd
        do_shrink_slab at ffffffffbd6ec000
        shrink_slab at ffffffffbd6ec24a
        do_try_to_free_pages at ffffffffbd6eda09
        try_to_free_mem_cgroup_pages at ffffffffbd6ede7e
        mem_cgroup_resize_limit at ffffffffbd7024c0
        mem_cgroup_write at ffffffffbd703149
        cgroup_file_write at ffffffffbd6d9c6e
        sys_write at ffffffffbd6662ea
        system_call_fastpath at ffffffffbdbc34a2

Co-developed-by: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
Signed-off-by: Tahsin Erdogan <tahsin@google.com>
Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-bufio.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/md/dm-bufio.c b/drivers/md/dm-bufio.c
index 2d519c223562..4c4f80e894b6 100644
--- a/drivers/md/dm-bufio.c
+++ b/drivers/md/dm-bufio.c
@@ -1516,18 +1516,16 @@ static void drop_buffers(struct dm_bufio_client *c)
  * We may not be able to evict this buffer if IO pending or the client
  * is still using it.  Caller is expected to know buffer is too old.
  *
- * And if GFP_NOFS is used, we must not do any I/O because we hold
- * dm_bufio_clients_lock and we would risk deadlock if the I/O gets
- * rerouted to different bufio client.
+ * We must not do any I/O because we hold dm_bufio_clients_lock and we
+ * would risk deadlock if the I/O gets rerouted to different bufio
+ * client.
  */
-static bool __try_evict_buffer(struct dm_buffer *b, gfp_t gfp)
+static bool __try_evict_buffer(struct dm_buffer *b)
 {
-	if (!(gfp & __GFP_FS)) {
-		if (test_bit(B_READING, &b->state) ||
-		    test_bit(B_WRITING, &b->state) ||
-		    test_bit(B_DIRTY, &b->state))
-			return false;
-	}
+	if (test_bit(B_READING, &b->state) ||
+	    test_bit(B_WRITING, &b->state) ||
+	    test_bit(B_DIRTY, &b->state))
+		return false;
 
 	if (b->hold_count)
 		return false;
@@ -1549,8 +1547,7 @@ static unsigned long get_retain_buffers(struct dm_bufio_client *c)
 	return retain_bytes;
 }
 
-static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan,
-			    gfp_t gfp_mask)
+static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan)
 {
 	int l;
 	struct dm_buffer *b, *tmp;
@@ -1561,7 +1558,7 @@ static unsigned long __scan(struct dm_bufio_client *c, unsigned long nr_to_scan,
 
 	for (l = 0; l < LIST_SIZE; l++) {
 		list_for_each_entry_safe_reverse(b, tmp, &c->lru[l], lru_list) {
-			if (__try_evict_buffer(b, gfp_mask))
+			if (__try_evict_buffer(b))
 				freed++;
 			if (!--nr_to_scan || ((count - freed) <= retain_target))
 				return freed;
@@ -1578,12 +1575,10 @@ dm_bufio_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	unsigned long freed;
 
 	c = container_of(shrink, struct dm_bufio_client, shrinker);
-	if (sc->gfp_mask & __GFP_FS)
-		dm_bufio_lock(c);
-	else if (!dm_bufio_trylock(c))
+	if (!dm_bufio_trylock(c))
 		return SHRINK_STOP;
 
-	freed  = __scan(c, sc->nr_to_scan, sc->gfp_mask);
+	freed  = __scan(c, sc->nr_to_scan);
 	dm_bufio_unlock(c);
 	return freed;
 }
@@ -1811,7 +1806,7 @@ static void __evict_old_buffers(struct dm_bufio_client *c, unsigned long age_hz)
 		if (!older_than(b, age_hz))
 			break;
 
-		if (__try_evict_buffer(b, 0))
+		if (__try_evict_buffer(b))
 			count--;
 
 		cond_resched();
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

