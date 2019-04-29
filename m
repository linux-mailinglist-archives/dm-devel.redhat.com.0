Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D1E327
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:11 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA9443084242;
	Mon, 29 Apr 2019 12:58:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8D01001DD9;
	Mon, 29 Apr 2019 12:58:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E74FF18089D1;
	Mon, 29 Apr 2019 12:58:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvwPj023640 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2EC3D6A682; Mon, 29 Apr 2019 12:57:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE90768B3E;
	Mon, 29 Apr 2019 12:57:57 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5r1-00081J-Cb; Mon, 29 Apr 2019 14:57:56 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:43 +0200
Message-Id: <20190429125743.476270200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:22 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-add_new_range_and_wait.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 06/10] dm-integrity: introduce a function
	add_new_range_and_wait
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 29 Apr 2019 12:58:10 +0000 (UTC)

Introduce a function add_new_range_and_wait in order to avoid repetitive
code. It will be used in the following patch.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-16 21:22:31.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-16 21:22:31.000000000 +0200
@@ -1001,6 +1001,12 @@ static void wait_and_add_new_range(struc
 	} while (unlikely(new_range->waiting));
 }
 
+static void add_new_range_and_wait(struct dm_integrity_c *ic, struct dm_integrity_range *new_range)
+{
+	if (unlikely(!add_new_range(ic, new_range, true)))
+		wait_and_add_new_range(ic, new_range);
+}
+
 static void init_journal_node(struct journal_node *node)
 {
 	RB_CLEAR_NODE(&node->node);
@@ -1995,8 +2001,7 @@ static void do_journal_write(struct dm_i
 			io->range.n_sectors = (k - j) << ic->sb->log2_sectors_per_block;
 
 			spin_lock_irq(&ic->endio_wait.lock);
-			if (unlikely(!add_new_range(ic, &io->range, true)))
-				wait_and_add_new_range(ic, &io->range);
+			add_new_range_and_wait(ic, &io->range);
 
 			if (likely(!from_replay)) {
 				struct journal_node *section_node = &ic->journal_tree[i * ic->journal_section_entries];
@@ -2155,8 +2160,7 @@ next_chunk:
 	if (!ic->meta_dev)
 		range.n_sectors = min(range.n_sectors, ((sector_t)1U << ic->sb->log2_interleave_sectors) - (unsigned)offset);
 
-	if (unlikely(!add_new_range(ic, &range, true)))
-		wait_and_add_new_range(ic, &range);
+	add_new_range_and_wait(ic, &range);
 
 	spin_unlock_irq(&ic->endio_wait.lock);
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
