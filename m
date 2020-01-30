Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id ECA1314DFFA
	for <lists+dm-devel@lfdr.de>; Thu, 30 Jan 2020 18:35:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580405707;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=X2xbUmtEgJQfoB1qGenfsrS4jRSbPwjaiPyXwEBFT24=;
	b=R5jH11stGbHU4ffshQyrLL4dIBN6v5fiuRjtSkF+m3BtE2L/4DK1T10zP5Sd0G2VGTDq6c
	6p3VUUivw3qyrkiCbL+8HY/Sro95Ik8061ln9cM9QCTF9NTC1cGtrQkZ5UfzF9WA6uXBIi
	79XMNjPyfVIqw0UjPbrIb+7XzYu5ZDY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-9zNyZmVaOXikS964eLEtEw-1; Thu, 30 Jan 2020 12:35:04 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 648A4107ACCC;
	Thu, 30 Jan 2020 17:34:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4193E1001B23;
	Thu, 30 Jan 2020 17:34:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8B818579D;
	Thu, 30 Jan 2020 17:34:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00UHYYTx003446 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 30 Jan 2020 12:34:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 950711001B23; Thu, 30 Jan 2020 17:34:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-84.brq.redhat.com
	[10.40.205.84])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B6ADD1001B11;
	Thu, 30 Jan 2020 17:34:31 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1ixDi1-0002Bs-9w; Thu, 30 Jan 2020 18:34:30 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Thu, 30 Jan 2020 18:34:19 +0100
Message-Id: <20200130173419.055035960@debian-a64.vm>
User-Agent: quilt/0.65
Date: Thu, 30 Jan 2020 18:25:42 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 3/3] dm-integrity: change the size of the device
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: 9zNyZmVaOXikS964eLEtEw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-integrity-change-size.patch

If the size of the underlying device changes, we want to change the size
of the integrity device too.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-01-30 17:33:30.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-01-30 17:33:30.000000000 +0100
@@ -2851,6 +2851,13 @@ static void dm_integrity_resume(struct d
 	int r;
 	DEBUG_print("resume\n");
 
+	if (ic->provided_data_sectors != le64_to_cpu(ic->sb->provided_data_sectors)) {
+		ic->sb->provided_data_sectors = cpu_to_le64(ic->provided_data_sectors);
+		r = sync_rw_sb(ic, REQ_OP_WRITE, REQ_FUA);
+		if (unlikely(r))
+			dm_integrity_io_error(ic, "writing superblock", r);
+	}
+
 	if (ic->sb->flags & cpu_to_le32(SB_FLAG_DIRTY_BITMAP)) {
 		DEBUG_print("resume dirty_bitmap\n");
 		rw_journal_sectors(ic, REQ_OP_READ, 0, 0,
@@ -3937,16 +3944,16 @@ static int dm_integrity_ctr(struct dm_ta
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
 
@@ -4217,7 +4224,7 @@ static void dm_integrity_dtr(struct dm_t
 
 static struct target_type integrity_target = {
 	.name			= "integrity",
-	.version		= {1, 4, 0},
+	.version		= {1, 5, 0},
 	.module			= THIS_MODULE,
 	.features		= DM_TARGET_SINGLETON | DM_TARGET_INTEGRITY,
 	.ctr			= dm_integrity_ctr,

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

