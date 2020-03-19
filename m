Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5095718B995
	for <lists+dm-devel@lfdr.de>; Thu, 19 Mar 2020 15:41:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584628877;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LEPbmg7VC3PSFWzkYIu8VcwAVZIT9kHrE5C1TOTxnWI=;
	b=FEORQSmD/DF0aJ8ja79yz8ecxoUQD4CYcPdQfI5vO495v5u2hIdKHM7rFz6911tFiu5g7f
	j2G6tmRCJmW0EKReg9qF1ot4nnnJt3WRy/VMI/FUq9/0AJA07L3bQAVnZFZmVvoPVTDHbJ
	U94nu5iChoEHMGrLPRu+N5heW3htwxc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-bYs51qSmNcW0B4KXU7Sp0Q-1; Thu, 19 Mar 2020 10:41:15 -0400
X-MC-Unique: bYs51qSmNcW0B4KXU7Sp0Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA83E8018A3;
	Thu, 19 Mar 2020 14:41:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D23AC6269F;
	Thu, 19 Mar 2020 14:41:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EEFE18089C8;
	Thu, 19 Mar 2020 14:40:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02JEe2tc010249 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 19 Mar 2020 10:40:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 09BC25DA81; Thu, 19 Mar 2020 14:40:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 582265D9E2;
	Thu, 19 Mar 2020 14:39:59 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 02JEdw7W001647; Thu, 19 Mar 2020 10:39:58 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 02JEdweH001642; Thu, 19 Mar 2020 10:39:58 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 19 Mar 2020 10:39:58 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
Message-ID: <alpine.LRH.2.02.2003191035170.1262@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: fix a crash with unusually large
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi

I've found a bug in dm-integrity - if the user specified tag size greater 
than HASH_MAX_DIGESTSIZE (and lower or equal than MAX_TAG_SIZE), it 
crashes if the kmalloc call in integrity_metadata fails.

I'm still not sure how to fix it: we can extend the size of the array 
checksums_onstack (but the extended array takes 424 bytes - which may be 
too large).

Or, we can restrict ic->tag_size to HASH_MAX_DIGESTSIZE, but it may break 
some existing volumes where the user is using larger tag_size.

What do you think would be better?

Mikulas





From: Mikulas Patocka <mpatocka@redhat.com>

If the user specifies tag size larger than HASH_MAX_DIGESTSIZE, there's a
crash in integrity_metadata.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-19 15:28:14.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-19 15:30:08.000000000 +0100
@@ -1519,7 +1519,7 @@ static void integrity_metadata(struct wo
 		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
 		char *checksums;
 		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
-		char checksums_onstack[HASH_MAX_DIGESTSIZE];
+		char checksums_onstack[max(HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		unsigned sectors_to_process = dio->range.n_sectors;
 		sector_t sector = dio->range.logical_sector;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

