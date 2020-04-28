Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id A5D591BBAD6
	for <lists+dm-devel@lfdr.de>; Tue, 28 Apr 2020 12:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588068592;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=c3bTTDIbcmHl/v6eXav1OGZn51FpmEqK2gxjyTU7Jzc=;
	b=dup0dXf2Ol4ifn4g74JqiAcbTPf/RfvJka6cBZz2zYEaDGLc74MDk25mG3G+DVLPowKuFW
	p+1gHDxWgiYg5WaCEZlGltb3TidafmU7WDc9hlW5hQ0IBONPXy4raG3Rzpp41ML4PEpLfA
	80znVnmnidPWLtdTMp6xqKd/DlvW/0U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-255-NPH0Bt5ANKWnx0mSo5jfEw-1; Tue, 28 Apr 2020 06:09:50 -0400
X-MC-Unique: NPH0Bt5ANKWnx0mSo5jfEw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D8AF1009441;
	Tue, 28 Apr 2020 10:09:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E76E5D9E2;
	Tue, 28 Apr 2020 10:09:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3AB7B4CA94;
	Tue, 28 Apr 2020 10:09:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03S0dPTW010461 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Apr 2020 20:39:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E1BC76379C; Tue, 28 Apr 2020 00:39:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCF2D63538
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:39:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D221833B47
	for <dm-devel@redhat.com>; Tue, 28 Apr 2020 00:39:21 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-402-YVqd_IlePOyuRogciLX-HQ-1; Mon, 27 Apr 2020 20:39:18 -0400
X-MC-Unique: YVqd_IlePOyuRogciLX-HQ-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id 8D9442A0FEC
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Mon, 27 Apr 2020 20:39:11 -0400
Message-Id: <20200428003911.222717-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03S0dPTW010461
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 28 Apr 2020 06:09:31 -0400
Cc: dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [dm-devel] [PATCH] dm: multipath: Use updated MPATHF_QUEUE_IO on
	mapping for BIO-based mpath
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When adding devices that don't have a scsi_dh on a BIO based multipath,
I was able to consistently hit the warning below and lock-up the system.

The problem is that __map_bio reads the flag before it potentially being
modified by choose_pgpath, and ends up using the older value.

The WARN_ON below is not trivially linked to the issue. It goes like
this: The activate_path delayed_work is not initialized for non-scsi_dh
devices, but we always set MPATHF_QUEUE_IO, asking for initialization.
That is fine, since MPATHF_QUEUE_IO would be cleared in choose_pgpath.
Nevertheless, only for BIO-based mpath, we cache the flag before calling
choose_pgpath, and use the older version when deciding if we should
initialize the path.  Therefore, we end up trying to initialize the
paths, and calling the non-initialized activate_path work.

[   82.437100] ------------[ cut here ]------------
[   82.437659] WARNING: CPU: 3 PID: 602 at kernel/workqueue.c:1624
  __queue_delayed_work+0x71/0x90
[   82.438436] Modules linked in:
[   82.438911] CPU: 3 PID: 602 Comm: systemd-udevd Not tainted 5.6.0-rc6+ #339
[   82.439680] RIP: 0010:__queue_delayed_work+0x71/0x90
[   82.440287] Code: c1 48 89 4a 50 81 ff 00 02 00 00 75 2a 4c 89 cf e9
94 d6 07 00 e9 7f e9 ff ff 0f 0b eb c7 0f 0b 48 81 7a 58 40 74 a8 94 74
a7 <0f> 0b 48 83 7a 48 00 74 a5 0f 0b eb a1 89 fe 4c 89 cf e9 c8 c4 07
[   82.441719] RSP: 0018:ffffb738803977c0 EFLAGS: 00010007
[   82.442121] RAX: ffffa086389f9740 RBX: 0000000000000002 RCX: 0000000000000000
[   82.442718] RDX: ffffa086350dd930 RSI: ffffa0863d76f600 RDI: 0000000000000200
[   82.443484] RBP: 0000000000000200 R08: 0000000000000000 R09: ffffa086350dd970
[   82.444128] R10: 0000000000000000 R11: 0000000000000000 R12: ffffa086350dd930
[   82.444773] R13: ffffa0863d76f600 R14: 0000000000000000 R15: ffffa08636738008
[   82.445427] FS:  00007f6abfe9dd40(0000) GS:ffffa0863dd80000(0000) knlGS:00000
[   82.446040] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   82.446478] CR2: 0000557d288db4e8 CR3: 0000000078b36000 CR4: 00000000000006e0
[   82.447104] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[   82.447561] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
[   82.448012] Call Trace:
[   82.448164]  queue_delayed_work_on+0x6d/0x80
[   82.448472]  __pg_init_all_paths+0x7b/0xf0
[   82.448714]  pg_init_all_paths+0x26/0x40
[   82.448980]  __multipath_map_bio.isra.0+0x84/0x210
[   82.449267]  __map_bio+0x3c/0x1f0
[   82.449468]  __split_and_process_non_flush+0x14a/0x1b0
[   82.449775]  __split_and_process_bio+0xde/0x340
[   82.450045]  ? dm_get_live_table+0x5/0xb0
[   82.450278]  dm_process_bio+0x98/0x290
[   82.450518]  dm_make_request+0x54/0x120
[   82.450778]  generic_make_request+0xd2/0x3e0
[   82.451038]  ? submit_bio+0x3c/0x150
[   82.451278]  submit_bio+0x3c/0x150
[   82.451492]  mpage_readpages+0x129/0x160
[   82.451756]  ? bdev_evict_inode+0x1d0/0x1d0
[   82.452033]  read_pages+0x72/0x170
[   82.452260]  __do_page_cache_readahead+0x1ba/0x1d0
[   82.452624]  force_page_cache_readahead+0x96/0x110
[   82.452903]  generic_file_read_iter+0x84f/0xae0
[   82.453192]  ? __seccomp_filter+0x7c/0x670
[   82.453547]  new_sync_read+0x10e/0x190
[   82.453883]  vfs_read+0x9d/0x150
[   82.454172]  ksys_read+0x65/0xe0
[   82.454466]  do_syscall_64+0x4e/0x210
[   82.454828]  entry_SYSCALL_64_after_hwframe+0x49/0xbe
[...]
[   82.462501] ---[ end trace bb39975e9cf45daa ]---

Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index f9b6a7a68bec..f5e7f8e88767 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -589,6 +589,11 @@ static struct pgpath *__map_bio(struct multipath *m, struct bio *bio)
 	if (!pgpath || !queue_io)
 		pgpath = choose_pgpath(m, bio->bi_iter.bi_size);
 
+	/*
+	 * MPATHF_QUEUE_IO might have been cleared by choose_pgpath.
+	 */
+	queue_io = test_bit(MPATHF_QUEUE_IO, &m->flags);
+
 	if ((pgpath && queue_io) ||
 	    (!pgpath && test_bit(MPATHF_QUEUE_IF_NO_PATH, &m->flags))) {
 		/* Queue for the daemon to resubmit */
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

