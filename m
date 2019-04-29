Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 32007E32E
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:20 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DEAD73082128;
	Mon, 29 Apr 2019 12:58:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3016443B;
	Mon, 29 Apr 2019 12:58:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 235F218089D2;
	Mon, 29 Apr 2019 12:58:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvukq023623 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A64316A68A; Mon, 29 Apr 2019 12:57:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E79968B3A;
	Mon, 29 Apr 2019 12:57:54 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5qx-00081A-J3; Mon, 29 Apr 2019 14:57:52 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:39 +0200
Message-Id: <20190429125739.682320200@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:19 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-journal_rw.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 03/10] dm-integrity: introduce rw_journal_sectors
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 29 Apr 2019 12:58:18 +0000 (UTC)

Introduce a function rw_journal_sectors that takess sector and length as
its arguments instead of a section and the number of sections.

This functions will be used in further patches.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-03-25 16:04:46.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2019-03-25 16:08:31.000000000 +0100
@@ -761,12 +761,12 @@ static void complete_journal_io(unsigned
 	complete_journal_op(comp);
 }
 
-static void rw_journal(struct dm_integrity_c *ic, int op, int op_flags, unsigned section,
-		       unsigned n_sections, struct journal_completion *comp)
+static void rw_journal_sectors(struct dm_integrity_c *ic, int op, int op_flags,
+			       unsigned sector, unsigned n_sectors, struct journal_completion *comp)
 {
 	struct dm_io_request io_req;
 	struct dm_io_region io_loc;
-	unsigned sector, n_sectors, pl_index, pl_offset;
+	unsigned pl_index, pl_offset;
 	int r;
 
 	if (unlikely(dm_integrity_failed(ic))) {
@@ -775,9 +775,6 @@ static void rw_journal(struct dm_integri
 		return;
 	}
 
-	sector = section * ic->journal_section_sectors;
-	n_sectors = n_sections * ic->journal_section_sectors;
-
 	pl_index = sector >> (PAGE_SHIFT - SECTOR_SHIFT);
 	pl_offset = (sector << SECTOR_SHIFT) & (PAGE_SIZE - 1);
 
@@ -810,6 +807,17 @@ static void rw_journal(struct dm_integri
 	}
 }
 
+static void rw_journal(struct dm_integrity_c *ic, int op, int op_flags, unsigned section,
+		       unsigned n_sections, struct journal_completion *comp)
+{
+	unsigned sector, n_sectors;
+
+	sector = section * ic->journal_section_sectors;
+	n_sectors = n_sections * ic->journal_section_sectors;
+
+	rw_journal_sectors(ic, op, op_flags, sector, n_sectors, comp);
+}
+
 static void write_journal(struct dm_integrity_c *ic, unsigned commit_start, unsigned commit_sections)
 {
 	struct journal_completion io_comp;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
