Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E734516A1F3
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536087;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rFgdxHEbcluviUpHLNue9WCp/8wjEozl73KA30eOLVY=;
	b=FWgdVefxAy5rM2RcnLB3D1BzMIYGLWuc0Mkb/REIzqSiJEnczaJW03FptN7csjqyXTO4Ux
	CcDdmQx6Li9+cBAblsONs/yEF4wXvgM6WCklxZxWaHd7mCzKfhaMSYGkryMlhusAf7H13+
	Xz4gzryOXnlnIMYSJIROhl2XL71dHzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-pT7j-iv2MyydrbqM7TP6Eg-1; Mon, 24 Feb 2020 04:21:24 -0500
X-MC-Unique: pT7j-iv2MyydrbqM7TP6Eg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34F9F107B276;
	Mon, 24 Feb 2020 09:21:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 03F1E90769;
	Mon, 24 Feb 2020 09:21:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79C1C860E9;
	Mon, 24 Feb 2020 09:21:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9Krwa001987 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DAB521001B3F; Mon, 24 Feb 2020 09:20:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D171001902;
	Mon, 24 Feb 2020 09:20:50 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69uy-0001WH-FM; Mon, 24 Feb 2020 10:20:49 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:48 +0100
Message-Id: <20200224092048.192812200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:29 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: Corey Marthaler <cmarthal@redhat.com>, dm-devel@redhat.com,
	Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 2/7] dm-writecache: fix a crash when unloading
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
Content-Disposition: inline; filename=dm-writecache-drain-workqueue.patch

This patch fixes a crash in writecache_writeback when replacing the
dm-writecache target:

 general protection fault: 0000 [#1] SMP PTI
 CPU: 28 PID: 6388 Comm: kworker/28:2 Kdump: loaded Tainted: G        W        --------- -t - 4.18.0-173.el8.x86_64 #1
 Hardware name: Dell Inc. PowerEdge R830/0VVT0H, BIOS 1.8.0 05/28/2018
 Workqueue: writecache-writeback writecache_writeback [dm_writecache]
 RIP: 0010:writecache_writeback+0x10c/0x820 [dm_writecache]
 Code: d8 fe ff ff 0f 87 7e 02 00 00 48 83 44 24 28 01 48 8b 44 24 28 48
 83 f8 40 0f 87 47 02 00 00 48 8b 83 a0 fe ff ff 4c 8d 60 e8 <41> f6 44 24
 2a 01 0f 85 16 02 00 00 49 8b 44 24 38 48 39 43 d0 0f
 RSP: 0018:ffffb0e4e323fdd0 EFLAGS: 00010283
 RAX: dead000000000200 RBX: ffff8c410d89f188 RCX: ffff8c41387edf01
 RDX: 0000000000000000 RSI: ffff8c41387edf00 RDI: 0000000000000000
 RBP: ffffb0e4e323fe90 R08: ffff8c413f9aa238 R09: 0000000000000000
 R10: 0000000000000000 R11: 00011f203dfb3b00 R12: dead0000000001e8
 R13: 0000000000000000 R14: ffff8c408e9d2900 R15: ffff8c410d89f190
 FS:  0000000000000000(0000) GS:ffff8c413f980000(0000) knlGS:0000000000000000
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 00005608dcd82000 CR3: 0000001cba20a005 CR4: 00000000003606e0
 DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
 DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
 Call Trace:
  ? blk_finish_plug+0x21/0x2e
  ? do_work+0xc4/0xf0 [dm_mod]
  process_one_work+0x1a7/0x3b0
  worker_thread+0x30/0x390
  ? create_worker+0x1a0/0x1a0
  kthread+0x112/0x130
  ? kthread_flush_work_fn+0x10/0x10
  ret_from_fork+0x35/0x40

writecache_suspend calls flush_workqueue(wc->writeback_wq) - this function
flushes the current work. However, the workqueue may re-queue itself and
flush_workqueue doesn't wait for re-queued works to finish. Because of
this - the function writecache_writeback continues execution after the
device was suspended and then concurrently with writecache_dtr, causing
the crash.

We must use drain_workqueue - that waits until the work and all re-queued
works finish.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# 4.18+
Fixes: 48debafe4f2f ("dm: add writecache target")
Reported-by: Corey Marthaler <cmarthal@redhat.com>
Depends-on: ("dm: report suspended device during destroy")

---
 drivers/md/dm-writecache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-02-21 13:14:25.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-02-21 13:17:49.000000000 +0100
@@ -842,7 +842,7 @@ static void writecache_suspend(struct dm
 	}
 	wc_unlock(wc);
 
-	flush_workqueue(wc->writeback_wq);
+	drain_workqueue(wc->writeback_wq);
 
 	wc_lock(wc);
 	if (flush_on_suspend)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

