Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 50FE116A211
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:23:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536185;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OX7qI5MVX+Gq5J1kROMbRp/tK/X09pKwsQT7EYQQSTQ=;
	b=IvhVBxTDVXfXdn5rak1lkwY9Ir/GK9h/JFkOK6YHdIOm5tFFjSASc6ZGgXHFdyWMV+qjp6
	36k3omefWsZOHQTt44+pANJpSsWxHD5vHj3GoQpMdKIE4w8IKuhaMXqkYRaxTv3VtSGQ6J
	P9NC+kdHUyJbPYw9Y7O6XfjNy6yetrM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-72wvrWW9O7C7CliJe5lp_Q-1; Mon, 24 Feb 2020 04:21:23 -0500
X-MC-Unique: 72wvrWW9O7C7CliJe5lp_Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83AC71882CE2;
	Mon, 24 Feb 2020 09:21:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 058B991854;
	Mon, 24 Feb 2020 09:21:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7B06F860EC;
	Mon, 24 Feb 2020 09:21:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9Kqht001967 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 774825DA7E; Mon, 24 Feb 2020 09:20:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AD0595D9C9;
	Mon, 24 Feb 2020 09:20:49 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69ux-0001WE-7e; Mon, 24 Feb 2020 10:20:48 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:47 +0100
Message-Id: <20200224092046.953935440@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:28 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 1/7] dm: report suspended device during destroy
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-suspended-on-unload.patch

The function dm_suspended returns true if the target is suspended.
However, when the target is being suspended during unload, it returns
false.

This patch makes dm_suspended return true after the presuspend hook before
the presuspend hook - just like during a normal suspend. It allows
simplifying the dm-integrity and dm-writecache targets so that they don't
have to maintain suspended flags on their own.

I tested it with the lvm2 testsuite and cryptsetup testsuite and the are
no regressions.

This patch should be backported to the stable kernels because the
following patch ("dm-writecache: fix a crash when unloading") depends on
it.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-integrity.c |   12 +++++-------
 drivers/md/dm.c           |    1 +
 2 files changed, 6 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c	2020-02-21 13:23:08.000000000 +0100
+++ linux-2.6/drivers/md/dm.c	2020-02-21 13:23:08.000000000 +0100
@@ -2368,6 +2368,7 @@ static void __dm_destroy(struct mapped_d
 	map = dm_get_live_table(md, &srcu_idx);
 	if (!dm_suspended_md(md)) {
 		dm_table_presuspend_targets(map);
+		set_bit(DMF_SUSPENDED, &md->flags);
 		dm_table_postsuspend_targets(map);
 	}
 	/* dm_put_live_table must be before msleep, otherwise deadlock is possible */
Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-02-21 13:23:08.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-02-21 13:35:41.000000000 +0100
@@ -201,12 +201,13 @@ struct dm_integrity_c {
 	__u8 log2_blocks_per_bitmap_bit;
 
 	unsigned char mode;
-	int suspending;
 
 	int failed;
 
 	struct crypto_shash *internal_hash;
 
+	struct dm_target *ti;
+
 	/* these variables are locked with endio_wait.lock */
 	struct rb_root in_progress;
 	struct list_head wait_list;
@@ -2320,7 +2321,7 @@ static void integrity_writer(struct work
 	unsigned prev_free_sectors;
 
 	/* the following test is not needed, but it tests the replay code */
-	if (READ_ONCE(ic->suspending) && !ic->meta_dev)
+	if (unlikely(dm_suspended(ic->ti)) && !ic->meta_dev)
 		return;
 
 	spin_lock_irq(&ic->endio_wait.lock);
@@ -2381,7 +2382,7 @@ static void integrity_recalc(struct work
 
 next_chunk:
 
-	if (unlikely(READ_ONCE(ic->suspending)))
+	if (unlikely(dm_suspended(ic->ti)))
 		goto unlock_ret;
 
 	range.logical_sector = le64_to_cpu(ic->sb->recalc_sector);
@@ -2809,8 +2810,6 @@ static void dm_integrity_postsuspend(str
 
 	del_timer_sync(&ic->autocommit_timer);
 
-	WRITE_ONCE(ic->suspending, 1);
-
 	if (ic->recalc_wq)
 		drain_workqueue(ic->recalc_wq);
 
@@ -2839,8 +2838,6 @@ static void dm_integrity_postsuspend(str
 #endif
 	}
 
-	WRITE_ONCE(ic->suspending, 0);
-
 	BUG_ON(!RB_EMPTY_ROOT(&ic->in_progress));
 
 	ic->journal_uptodate = true;
@@ -3651,6 +3648,7 @@ static int dm_integrity_ctr(struct dm_ta
 	}
 	ti->private = ic;
 	ti->per_io_data_size = sizeof(struct dm_integrity_io);
+	ic->ti = ti;
 
 	ic->in_progress = RB_ROOT;
 	INIT_LIST_HEAD(&ic->wait_list);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

