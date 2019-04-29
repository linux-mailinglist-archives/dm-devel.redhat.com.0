Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id CA40FE32A
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:14 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 85E6636893;
	Mon, 29 Apr 2019 12:58:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 54B0C177AC;
	Mon, 29 Apr 2019 12:58:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D62883FB13;
	Mon, 29 Apr 2019 12:58:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCw2aJ023680 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:58:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1762B69705; Mon, 29 Apr 2019 12:58:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBFE817257;
	Mon, 29 Apr 2019 12:58:01 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5r5-00081S-8R; Mon, 29 Apr 2019 14:58:00 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:47 +0200
Message-Id: <20190429125747.302611800@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:25 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-bitmap-reboot.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 09/10] dm-integrity: handle machine reboot in
	bitmap mode
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 29 Apr 2019 12:58:13 +0000 (UTC)

When we are in bitmap mode, we need to clear the bitmap when we are
rebooting. This patch adds the reboot hook.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-27 10:28:35.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-27 10:28:35.000000000 +0200
@@ -15,6 +15,7 @@
 #include <linux/rbtree.h>
 #include <linux/delay.h>
 #include <linux/random.h>
+#include <linux/reboot.h>
 #include <crypto/hash.h>
 #include <crypto/skcipher.h>
 #include <linux/async_tx.h>
@@ -257,6 +258,8 @@ struct dm_integrity_c {
 	struct alg_spec journal_mac_alg;
 
 	atomic64_t number_of_mismatches;
+
+	struct notifier_block reboot_notifier;
 };
 
 struct dm_integrity_range {
@@ -2717,11 +2720,27 @@ clear_journal:
 		init_journal_node(&ic->journal_tree[i]);
 }
 
+static int dm_integrity_reboot(struct notifier_block *n, unsigned long code, void *x)
+{
+	struct dm_integrity_c *ic = container_of(n, struct dm_integrity_c, reboot_notifier);
+
+	if (ic->mode == 'B') {
+		DEBUG_print("dm_integrity_reboot\n");
+		cancel_delayed_work_sync(&ic->bitmap_flush_work);
+		queue_delayed_work(ic->commit_wq, &ic->bitmap_flush_work, 0);
+		flush_workqueue(ic->commit_wq);
+	}
+
+	return NOTIFY_DONE;
+}
+
 static void dm_integrity_postsuspend(struct dm_target *ti)
 {
 	struct dm_integrity_c *ic = (struct dm_integrity_c *)ti->private;
 	int r;
 
+	WARN_ON(unregister_reboot_notifier(&ic->reboot_notifier));
+
 	del_timer_sync(&ic->autocommit_timer);
 
 	WRITE_ONCE(ic->suspending, 1);
@@ -2829,6 +2848,11 @@ static void dm_integrity_resume(struct d
 			recalc_write_super(ic);
 		}
 	}
+
+	ic->reboot_notifier.notifier_call = dm_integrity_reboot;
+	ic->reboot_notifier.next = NULL;
+	ic->reboot_notifier.priority = INT_MAX - 1;	/* be notified after md and before hardware drivers */
+	WARN_ON(register_reboot_notifier(&ic->reboot_notifier));
 }
 
 static void dm_integrity_status(struct dm_target *ti, status_type_t type,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
