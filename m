Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 204E3E32D
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:17 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2BC003086204;
	Mon, 29 Apr 2019 12:58:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 077361779E;
	Mon, 29 Apr 2019 12:58:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8C1223FB13;
	Mon, 29 Apr 2019 12:58:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvtsk023610 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 36C9F1001E85; Mon, 29 Apr 2019 12:57:55 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CEEF21001DD9;
	Mon, 29 Apr 2019 12:57:52 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5qw-000817-AT; Mon, 29 Apr 2019 14:57:51 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:38 +0200
Message-Id: <20190429125738.430881080@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:18 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-hide-unused-parameters.patch
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 02/10] dm-integrity: dont report unused options
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
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Mon, 29 Apr 2019 12:58:15 +0000 (UTC)

If we are not journaling, don't report journaling options in the table
status.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-09 14:01:43.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-09 14:01:43.000000000 +0200
@@ -2468,10 +2468,12 @@ static void dm_integrity_status(struct d
 		__u64 watermark_percentage = (__u64)(ic->journal_entries - ic->free_sectors_threshold) * 100;
 		watermark_percentage += ic->journal_entries / 2;
 		do_div(watermark_percentage, ic->journal_entries);
-		arg_count = 5;
+		arg_count = 3;
 		arg_count += !!ic->meta_dev;
 		arg_count += ic->sectors_per_block != 1;
 		arg_count += !!(ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING));
+		arg_count += ic->mode == 'J';
+		arg_count += ic->mode == 'J';
 		arg_count += !!ic->internal_hash_alg.alg_string;
 		arg_count += !!ic->journal_crypt_alg.alg_string;
 		arg_count += !!ic->journal_mac_alg.alg_string;
@@ -2486,8 +2488,10 @@ static void dm_integrity_status(struct d
 		DMEMIT(" journal_sectors:%u", ic->initial_sectors - SB_SECTORS);
 		DMEMIT(" interleave_sectors:%u", 1U << ic->sb->log2_interleave_sectors);
 		DMEMIT(" buffer_sectors:%u", 1U << ic->log2_buffer_sectors);
-		DMEMIT(" journal_watermark:%u", (unsigned)watermark_percentage);
-		DMEMIT(" commit_time:%u", ic->autocommit_msec);
+		if (ic->mode == 'J') {
+			DMEMIT(" journal_watermark:%u", (unsigned)watermark_percentage);
+			DMEMIT(" commit_time:%u", ic->autocommit_msec);
+		}
 
 #define EMIT_ALG(a, n)							\
 		do {							\

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
