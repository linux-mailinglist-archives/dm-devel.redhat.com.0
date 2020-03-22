Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id B1DF318EBFF
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906317;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iuinvitivE9/wwJuREY40FgVi83Xrj+69aASTfroRIw=;
	b=aWr8bg6O03BjbXbr8GBPZOlOpKGh/0WcDveNoR8hhQk1CFeqTocDWfKG8mOjAM9//5qNhV
	ZYzPn9AI0iQCfp+6hW4vjSYzc8wSkOx019SNh2llheMGh/p8YVnTRyEFEQhc/8H/lp9soT
	ZhpwizwXsUU6gXQuQ63KIeC55dM+Wm0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-DuMYEsT_O7G-limDKA3JTw-1; Sun, 22 Mar 2020 15:45:15 -0400
X-MC-Unique: DuMYEsT_O7G-limDKA3JTw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 849FA8010C7;
	Sun, 22 Mar 2020 19:45:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 46CAA38D;
	Sun, 22 Mar 2020 19:45:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 96CE318089D6;
	Sun, 22 Mar 2020 19:45:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiT8Y025818 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3C92B7E318; Sun, 22 Mar 2020 19:44:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E6D5C5C1DE;
	Sun, 22 Mar 2020 19:44:28 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WH-0005xx-EV; Sun, 22 Mar 2020 20:44:26 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:25 +0100
Message-Id: <20200322194425.177041480@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:25 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 5/7] dm-integrity: change the size of the device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-integrity-change-size.patch

If the size of the underlying device changes, we want to change the size
of the integrity device too.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-20 17:39:47.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-20 17:39:47.000000000 +0100
@@ -2833,8 +2833,26 @@ static void dm_integrity_resume(struct d
 {
 	struct dm_integrity_c *ic = (struct dm_integrity_c *)ti->private;
 	int r;
+	__u64 old_provided_data_sectors = le64_to_cpu(ic->sb->provided_data_sectors);
 	DEBUG_print("resume\n");
 
+	if (ic->provided_data_sectors != old_provided_data_sectors) {
+		if (ic->provided_data_sectors > old_provided_data_sectors &&
+		    ic->mode == 'B' &&
+		    ic->sb->log2_blocks_per_bitmap_bit == ic->log2_blocks_per_bitmap_bit) {
+			rw_journal_sectors(ic, REQ_OP_READ, 0, 0,
+					   ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
+			block_bitmap_op(ic, ic->journal, old_provided_data_sectors, ic->provided_data_sectors - old_provided_data_sectors, BITMAP_OP_SET);
+			rw_journal_sectors(ic, REQ_OP_WRITE, REQ_FUA | REQ_SYNC, 0,
+					   ic->n_bitmap_blocks * (BITMAP_BLOCK_SIZE >> SECTOR_SHIFT), NULL);
+		}
+
+		ic->sb->provided_data_sectors = cpu_to_le64(ic->provided_data_sectors);
+		r = sync_rw_sb(ic, REQ_OP_WRITE, REQ_FUA);
+		if (unlikely(r))
+			dm_integrity_io_error(ic, "writing superblock", r);
+	}
+
 	if (ic->sb->flags & cpu_to_le32(SB_FLAG_DIRTY_BITMAP)) {
 		DEBUG_print("resume dirty_bitmap\n");
 		rw_journal_sectors(ic, REQ_OP_READ, 0, 0,
@@ -3937,16 +3955,16 @@ static int dm_integrity_ctr(struct dm_ta
 			goto bad;
 		}
 	}
-	ic->provided_data_sectors = le64_to_cpu(ic->sb->provided_data_sectors);
-	if (ic->provided_data_sectors != le64_to_cpu(ic->sb->provided_data_sectors)) {
-		/* test for overflow */
+	if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_HAVE_JOURNAL_MAC)) != !!ic->journal_mac_alg.alg_string) {
 		r = -EINVAL;
-		ti->error = "The superblock has 64-bit device size, but the kernel was compiled with 32-bit sectors";
+		ti->error = "Journal mac mismatch";
 		goto bad;
 	}
-	if (!!(ic->sb->flags & cpu_to_le32(SB_FLAG_HAVE_JOURNAL_MAC)) != !!ic->journal_mac_alg.alg_string) {
+
+	get_provided_data_sectors(ic);
+	if (!ic->provided_data_sectors) {
 		r = -EINVAL;
-		ti->error = "Journal mac mismatch";
+		ti->error = "The device is too small";
 		goto bad;
 	}
 
@@ -4218,7 +4236,7 @@ static void dm_integrity_dtr(struct dm_t
 
 static struct target_type integrity_target = {
 	.name			= "integrity",
-	.version		= {1, 5, 0},
+	.version		= {1, 6, 0},
 	.module			= THIS_MODULE,
 	.features		= DM_TARGET_SINGLETON | DM_TARGET_INTEGRITY,
 	.ctr			= dm_integrity_ctr,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

