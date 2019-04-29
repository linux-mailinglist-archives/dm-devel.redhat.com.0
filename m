Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 10724E330
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:25 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4A05730BC654;
	Mon, 29 Apr 2019 12:58:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBB56A688;
	Mon, 29 Apr 2019 12:58:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A557618089D2;
	Mon, 29 Apr 2019 12:58:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvxhi023650 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6DE0D69317; Mon, 29 Apr 2019 12:57:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D47D17257;
	Mon, 29 Apr 2019 12:57:59 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5r2-00081M-LM; Mon, 29 Apr 2019 14:57:57 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:44 +0200
Message-Id: <20190429125744.763120000@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:23 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-docs.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 07/10] dm-integrity: update documentation
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Mon, 29 Apr 2019 12:58:23 +0000 (UTC)

Update documentation with the "meta_device" parameter and flags.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 Documentation/device-mapper/dm-integrity.txt |   10 +++++++++-
 drivers/md/dm-integrity.c                    |    4 +++-
 2 files changed, 12 insertions(+), 2 deletions(-)

Index: linux-2.6/Documentation/device-mapper/dm-integrity.txt
===================================================================
--- linux-2.6.orig/Documentation/device-mapper/dm-integrity.txt	2019-04-26 16:29:56.000000000 +0200
+++ linux-2.6/Documentation/device-mapper/dm-integrity.txt	2019-04-26 17:12:29.000000000 +0200
@@ -79,6 +79,10 @@ interleave_sectors:number
 	a power of two. If the device is already formatted, the value from
 	the superblock is used.
 
+meta_device:device
+	Don't interleave the data and metadata on on device. Use a
+	separate device for metadata.
+
 buffer_sectors:number
 	The number of sectors in one buffer. The value is rounded down to
 	a power of two.
@@ -167,7 +171,11 @@ The layout of the formatted block device
 	  provides (i.e. the size of the device minus the size of all
 	  metadata and padding). The user of this target should not send
 	  bios that access data beyond the "provided data sectors" limit.
-	* flags - a flag is set if journal_mac is used
+	* flags
+	  SB_FLAG_HAVE_JOURNAL_MAC - a flag is set if journal_mac is used
+	  SB_FLAG_RECALCULATING - recalculating is in progress
+	* log2(sectors per block)
+	* a position where recalculating finished
 * journal
 	The journal is divided into sections, each section contains:
 	* metadata area (4kiB), it contains journal entries
Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-26 16:29:03.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-26 17:13:19.000000000 +0200
@@ -3093,10 +3093,12 @@ bad:
  *		buffer_sectors
  *		journal_watermark
  *		commit_time
+ *		meta_device
+ *		block_size
  *		internal_hash
  *		journal_crypt
  *		journal_mac
- *		block_size
+ *		recalculate
  */
 static int dm_integrity_ctr(struct dm_target *ti, unsigned argc, char **argv)
 {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
