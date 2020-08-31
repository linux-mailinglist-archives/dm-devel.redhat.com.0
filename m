Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 58200257A51
	for <lists+dm-devel@lfdr.de>; Mon, 31 Aug 2020 15:26:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598880382;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5n8l5TvzQLu8kE0TFbvYBK0sOIvxFzmA6ORYURbCU5Q=;
	b=JGkdp/kiUysSmkO27Cb19UXi0O4TUuulWQsoY7+mc1tM/4RRW26GTQHW8VwT+lPHSD/JV0
	cn4/cvf+J83WHO5jOK1grCX5/1gjwtVPrTfvDH+1y/KLDp0gSQ8bZLDs1y+UAREpfkg95g
	WqYzXQKMndT7zGom/xEjfPveVR9iigo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-Vb4FKTZnPre7OxExuPSevA-1; Mon, 31 Aug 2020 09:26:19 -0400
X-MC-Unique: Vb4FKTZnPre7OxExuPSevA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1461107B27D;
	Mon, 31 Aug 2020 13:26:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1602C5C230;
	Mon, 31 Aug 2020 13:26:06 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B0C8D18A0B64;
	Mon, 31 Aug 2020 13:25:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07VDPiTq025928 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 31 Aug 2020 09:25:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C80F21A886; Mon, 31 Aug 2020 13:25:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ADA5C19C4F;
	Mon, 31 Aug 2020 13:25:41 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 07VDPfAE005808; Mon, 31 Aug 2020 09:25:41 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 07VDPfic005804; Mon, 31 Aug 2020 09:25:41 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 31 Aug 2020 09:25:41 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: David Teigland <teigland@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
In-Reply-To: <20200828200906.GB17233@redhat.com>
Message-ID: <alpine.LRH.2.02.2008310921420.3813@file01.intranet.prod.int.rdu2.redhat.com>
References: <20200828200906.GB17233@redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Corey Marthaler <cmarthal@redhat.com>
Subject: [dm-devel] [PATCH] Re: bug 1872049 - integrity bitmap
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 28 Aug 2020, David Teigland wrote:

> Hi Mikulas, it looks to me like this bz could be a problem with the bitmap
> mode, since both Corey and I have seen unrepaired data without any crash,
> and the same tests work fine with journal mode.  One clue might be that I
> did not see the problem if the corruption occured while the LV was
> inactive.

Hi

Here I'm submitting a patch for this bug. Try it.

Mikulas



From: Mikulas Patocka <mpatocka@redhat.com>
Subject: [PATCH] dm-integrity: fix error reporting in bitmap mode after creation

The dm-integrity target did not report errors in bitmap mode just after
creation. The reason is that the function integrity_recalc didn't clean up
ic->recalc_bitmap as it proceeded with recalculation. This patch makes it
update the bitmap.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v5.2+
Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")

---
 drivers/md/dm-integrity.c |   12 ++++++++++++
 1 file changed, 12 insertions(+)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-08-31 13:59:43.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2020-08-31 14:24:17.000000000 +0200
@@ -2487,6 +2487,7 @@ next_chunk:
 	range.logical_sector = le64_to_cpu(ic->sb->recalc_sector);
 	if (unlikely(range.logical_sector >= ic->provided_data_sectors)) {
 		if (ic->mode == 'B') {
+			block_bitmap_op(ic, ic->recalc_bitmap, 0, ic->provided_data_sectors, BITMAP_OP_CLEAR);
 			DEBUG_print("queue_delayed_work: bitmap_flush_work\n");
 			queue_delayed_work(ic->commit_wq, &ic->bitmap_flush_work, 0);
 		}
@@ -2564,6 +2565,17 @@ next_chunk:
 		goto err;
 	}
 
+	if (ic->mode == 'B') {
+		sector_t start, end;
+		start = range.logical_sector
+			>> (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit)
+			<< (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit);
+		end = (range.logical_sector + range.n_sectors)
+			>> (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit)
+			<< (ic->sb->log2_sectors_per_block + ic->log2_blocks_per_bitmap_bit);
+		block_bitmap_op(ic, ic->recalc_bitmap, start, end - start, BITMAP_OP_CLEAR);
+	}
+
 advance_and_next:
 	cond_resched();
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

