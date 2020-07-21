Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 360F4227B90
	for <lists+dm-devel@lfdr.de>; Tue, 21 Jul 2020 11:19:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595323196;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=B37NI9CL8m+Xs89BT0HF5sizXLl+EAibMaGjkCsEOb4=;
	b=bWFK+UUmZ8ebley6XExWl/spz9rHFsKvQZ5Q9myIu4qIHF2ir9TbBws/5BFn6iWt/XqlOq
	zYTM85SYZzfsGSYPcjUA0RVG59y1F/L0H4uHD86UZoBLC1QxzKw3ECPJn76C3/RxN+OlqV
	FBTc3kof9okfmHXNJ2Qls7auGvSBy2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-55-6Om2XnyXPS6aszWvCqpCWA-1; Tue, 21 Jul 2020 05:19:52 -0400
X-MC-Unique: 6Om2XnyXPS6aszWvCqpCWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D26D9800688;
	Tue, 21 Jul 2020 09:19:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB8F619934;
	Tue, 21 Jul 2020 09:19:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DAE69A15C;
	Tue, 21 Jul 2020 09:19:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06L9Cw05007904 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 21 Jul 2020 05:12:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9BE07EF81; Tue, 21 Jul 2020 09:12:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9085A72AC6;
	Tue, 21 Jul 2020 09:12:55 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 06L9CtqV007057; Tue, 21 Jul 2020 05:12:55 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 06L9CsdG007049; Tue, 21 Jul 2020 05:12:54 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 21 Jul 2020 05:12:54 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Hugh Dickins <hughd@google.com>
Message-ID: <alpine.LRH.2.02.2007210510230.6959@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: linux-mm@kvack.org, dm-devel@redhat.com,
	Zdenek Kabelac <zkabelac@redhat.com>
Subject: [dm-devel] [PATCH] shmfs: don't allocate pages on read
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: MULTIPART/MIXED; BOUNDARY="185206533-396230313-1595322775=:6959"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
--185206533-396230313-1595322775=:6959
Content-Type: TEXT/PLAIN; charset=ISO-8859-2
Content-Transfer-Encoding: 8BIT

Hi

Do we still need the patch a0ee5ec520ede?

We are using the loop device for testing and when we read something from 
the loop device, it allocates the pages on the underlying shmfs 
filesystem. See this example:

# mkdir -p /mnt/test
# mount -t tmpfs /dev/null /mnt/test
# cd /mnt/test
# truncate -s 1GiB file
# du -hs file
0       file
# losetup /dev/loop0 file
# du -hs file
1,1M    file
# dd if=/dev/loop0 of=/dev/null
2097152+0 záznamů přečteno
2097152+0 záznamů zapsáno
1073741824 bajtů (1,1 GB, 1,0 GiB) zkopírováno, 4,06865 s, 264 MB/s
# du -hs file
1,0G    file

This patch turns off the allocation on read.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 mm/shmem.c |    8 --------
 1 file changed, 8 deletions(-)

Index: linux-2.6/mm/shmem.c
===================================================================
--- linux-2.6.orig/mm/shmem.c	2020-06-29 14:50:06.000000000 +0200
+++ linux-2.6/mm/shmem.c	2020-07-16 19:22:58.000000000 +0200
@@ -2507,14 +2507,6 @@ static ssize_t shmem_file_read_iter(stru
 	ssize_t retval = 0;
 	loff_t *ppos = &iocb->ki_pos;
 
-	/*
-	 * Might this read be for a stacking filesystem?  Then when reading
-	 * holes of a sparse file, we actually need to allocate those pages,
-	 * and even mark them dirty, so it cannot exceed the max_blocks limit.
-	 */
-	if (!iter_is_iovec(to))
-		sgp = SGP_CACHE;
-
 	index = *ppos >> PAGE_SHIFT;
 	offset = *ppos & ~PAGE_MASK;
 
--185206533-396230313-1595322775=:6959
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
--185206533-396230313-1595322775=:6959--

