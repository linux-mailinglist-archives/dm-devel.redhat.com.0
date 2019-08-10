Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CA188C42
	for <lists+dm-devel@lfdr.de>; Sat, 10 Aug 2019 18:31:04 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B513B3083394;
	Sat, 10 Aug 2019 16:30:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60D6C5DD6F;
	Sat, 10 Aug 2019 16:30:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E1B0B18005B9;
	Sat, 10 Aug 2019 16:30:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7AGUUYW018769 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 10 Aug 2019 12:30:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEA261754F; Sat, 10 Aug 2019 16:30:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 378F61D0;
	Sat, 10 Aug 2019 16:30:28 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id x7AGURcM032077; Sat, 10 Aug 2019 12:30:27 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id x7AGURWu032073; Sat, 10 Aug 2019 12:30:27 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 10 Aug 2019 12:30:27 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Milan Broz <mbroz@redhat.com>, Mike Snitzer <msnitzer@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.1908101226540.31197@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm integrity: fix a crash due to
 journal_entry_get_sector(je) != logical_sector
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Sat, 10 Aug 2019 16:31:03 +0000 (UTC)

Fix a crash that was introduced by the commit 724376a04d1a. The crash is
reported here: https://gitlab.com/cryptsetup/cryptsetup/issues/468

When reading from the integrity device, the function
dm_integrity_map_continue calls find_journal_node to find out if the
location to read is present in the journal. Then, it calculates how many
sectors are consecutively stored in the journal. Then, it locks the range
with add_new_range and wait_and_add_new_range.

The problem is that during wait_and_add_new_range, we hold no locks (we
don't hold ic->endio_wait.lock and we don't hold a range lock), so the
journal may change arbitrarily while wait_and_add_new_range sleeps.

The code then goes to __journal_read_write and hits
BUG_ON(journal_entry_get_sector(je) != logical_sector); because the
journal has changed.

In order to fix this bug, we need to re-check the journal location after
wait_and_add_new_range. We restrict the length to one block in order to
not complicate the code too much.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v4.19+
Fixes: 724376a04d1a ("dm integrity: implement fair range locks")

---
 drivers/md/dm-integrity.c |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-08-10 11:56:01.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-08-10 12:14:54.000000000 +0200
@@ -1943,7 +1943,22 @@ offload_to_thread:
 			queue_work(ic->wait_wq, &dio->work);
 			return;
 		}
+		if (journal_read_pos != NOT_FOUND)
+			dio->range.n_sectors = ic->sectors_per_block;
 		wait_and_add_new_range(ic, &dio->range);
+		/*
+		 * wait_and_add_new_range drops the spinlock, so the journal
+		 * may have been changed arbitrarily. We need to recheck.
+		 * To simplify the code, we restrict I/O size to just one block.
+		 */
+		if (journal_read_pos != NOT_FOUND) {
+			sector_t next_sector;
+			unsigned new_pos = find_journal_node(ic, dio->range.logical_sector, &next_sector);
+			if (unlikely(new_pos != journal_read_pos)) {
+				remove_range_unlocked(ic, &dio->range);
+				goto retry;
+			}
+		}
 	}
 	spin_unlock_irq(&ic->endio_wait.lock);
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
