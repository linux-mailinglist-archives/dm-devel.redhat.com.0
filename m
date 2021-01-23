Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 397E23015C3
	for <lists+dm-devel@lfdr.de>; Sat, 23 Jan 2021 15:20:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1611411645;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=SaCSxn9ykEJNNmzipJclxQDMpPU3wG5kz0VDX5lG7mw=;
	b=MdXVvjodE8IIMWqJNOWytih19T+M/b/8H8KtJ+MNdf9D0w/sUchF7CBbIvHA1hPhUPyC8i
	YrNbni4PNPOy49XVHBjituMu8Fzb7B2QpyTCdH5mfmRV4+NmBzknltzhcQvvxBQ5eBT/Kk
	g7TAMvvEQhlCjpxrR+AcJQukNUMmqDg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-186-FVvnRC-SPFeQh7sxDGMshg-1; Sat, 23 Jan 2021 09:20:43 -0500
X-MC-Unique: FVvnRC-SPFeQh7sxDGMshg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3B1E010054FF;
	Sat, 23 Jan 2021 14:20:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 262E59CA0;
	Sat, 23 Jan 2021 14:20:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 845A71809C9F;
	Sat, 23 Jan 2021 14:20:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10NEK0E0019435 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 23 Jan 2021 09:20:00 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 13EF360BFA; Sat, 23 Jan 2021 14:20:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B75B060BE2;
	Sat, 23 Jan 2021 14:19:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 10NEJumO005759; Sat, 23 Jan 2021 09:19:56 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 10NEJugM005755; Sat, 23 Jan 2021 09:19:56 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Sat, 23 Jan 2021 09:19:56 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: "J. Bruce Fields" <bfields@redhat.com>, Mike Snitzer <msnitzer@redhat.com>
In-Reply-To: <20210115224735.GD95264@pick.fieldses.org>
Message-ID: <alpine.LRH.2.02.2101230917360.5678@file01.intranet.prod.int.rdu2.redhat.com>
References: <alpine.LRH.2.02.2101131221260.5981@file01.intranet.prod.int.rdu2.redhat.com>
	<20210113202018.GF9978@pick.fieldses.org>
	<alpine.LRH.2.02.2101131540250.10680@file01.intranet.prod.int.rdu2.redhat.com>
	<20210113213746.GH9978@pick.fieldses.org>
	<20210113230849.GA42761@pick.fieldses.org>
	<20210114224239.GA63697@pick.fieldses.org>
	<20210115155840.GA95264@pick.fieldses.org>
	<20210115164016.GB95264@pick.fieldses.org>
	<alpine.LRH.2.02.2101151142550.30218@file01.intranet.prod.int.rdu2.redhat.com>
	<20210115204319.GC95264@pick.fieldses.org>
	<20210115224735.GD95264@pick.fieldses.org>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, David Teigland <teigland@redhat.com>
Subject: [dm-devel] [PATCH] dm writecache: fix performance degradation in
	ssd mode
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On Fri, 15 Jan 2021, J. Bruce Fields wrote:

> Any recommendations?  I spent some time with blktrace/blkparse/btt and
> can't make head or tails of them, I'm afraid.
> 
> --b.

Hi

Try this patch:


From: Mikulas Patocka <mpatocka@redhat.com>

Fix a thinko in ssd_commit_superblock. region.count is in sectors, not
bytes. This bug doesn't corrupt data, but it causes performance
degradation.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: dc8a01ae1dbd ("dm writecache: optimize superblock write")
Cc: stable@vger.kernel.org	# v5.7
Reported-by: J. Bruce Fields <bfields@redhat.com>

---
 drivers/md/dm-writecache.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2021-01-23 10:51:31.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2021-01-23 15:16:53.000000000 +0100
@@ -523,7 +523,7 @@ static void ssd_commit_superblock(struct
 
 	region.bdev = wc->ssd_dev->bdev;
 	region.sector = 0;
-	region.count = PAGE_SIZE;
+	region.count = PAGE_SIZE >> SECTOR_SHIFT;
 
 	if (unlikely(region.sector + region.count > wc->metadata_sectors))
 		region.count = wc->metadata_sectors - region.sector;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

