Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id C941D3AE5F0
	for <lists+dm-devel@lfdr.de>; Mon, 21 Jun 2021 11:23:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624267389;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CEvtnSMBdT4SbeJCHyJ24wE40JlhjPxsuoZ6JtMLX98=;
	b=FcwT8zALa0GAtwEdbyz7JPzzUrHW1qJzlgtLQB/aHtLFwDyNUqi60Jxb8EMCLKERd9ZqP7
	ufw8YTknN68l1VCfPZdQISX87wW2bRn2/h9ksQItMADLoaousLhOuyvVRbStG6jMY5JUkK
	cCIawhez58rGvoQR0VKFoexDNi0tNlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-4J8xmgr0NmSsprI1XsqWGA-1; Mon, 21 Jun 2021 05:23:08 -0400
X-MC-Unique: 4J8xmgr0NmSsprI1XsqWGA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46565804145;
	Mon, 21 Jun 2021 09:23:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 229D860871;
	Mon, 21 Jun 2021 09:23:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1D9C18095C2;
	Mon, 21 Jun 2021 09:22:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15L9MPCj027298 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 05:22:25 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D9A6F69CB4; Mon, 21 Jun 2021 09:22:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C5A460BD9;
	Mon, 21 Jun 2021 09:22:22 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 15L9MLxr011239; Mon, 21 Jun 2021 05:22:21 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 15L9MLte011235; Mon, 21 Jun 2021 05:22:21 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 21 Jun 2021 05:22:21 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2106210519230.10954@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: Joe Thornber <thornber@redhat.com>, Heinz Mauelshagen <heinzm@redhat.com>,
	dm-devel@redhat.com, David Teigland <teigland@redhat.com>,
	Zdenek Kabelac <zkabelac@redhat.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH] dm-writecache: add a "metadata_only" parameter
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch adds a "metadata_only" parameter. When it is present, only
metadata are promoted to the cache. It improves performance in the "git
checkout" benchmark from 341s to 312s.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux/drivers/md/dm-writecache.c
===================================================================
--- linux.orig/drivers/md/dm-writecache.c
+++ linux/drivers/md/dm-writecache.c
@@ -171,6 +171,7 @@ struct dm_writecache {
 	bool flush_on_suspend:1;
 	bool cleaner:1;
 	bool cleaner_set:1;
+	bool metadata_only:1;
 
 	unsigned high_wm_percent_value;
 	unsigned low_wm_percent_value;
@@ -1297,7 +1298,7 @@ static int writecache_map(struct dm_targ
 			writecache_flush(wc);
 			if (writecache_has_error(wc))
 				goto unlock_error;
-			if (unlikely(wc->cleaner))
+			if (unlikely(wc->cleaner) || unlikely(wc->metadata_only))
 				goto unlock_remap_origin;
 			goto unlock_submit;
 		} else {
@@ -1376,7 +1377,7 @@ read_next_block:
 				}
 				found_entry = true;
 			} else {
-				if (unlikely(wc->cleaner))
+				if (unlikely(wc->cleaner) || (wc->metadata_only && !(bio->bi_opf & REQ_META)))
 					goto direct_write;
 			}
 			e = writecache_pop_from_freelist(wc, (sector_t)-1);
@@ -2090,7 +2091,7 @@ static int writecache_ctr(struct dm_targ
 	struct wc_memory_superblock s;
 
 	static struct dm_arg _args[] = {
-		{0, 16, "Invalid number of feature args"},
+		{0, 17, "Invalid number of feature args"},
 	};
 
 	as.argc = argc;
@@ -2317,6 +2318,8 @@ static int writecache_ctr(struct dm_targ
 				wc->writeback_fua = false;
 				wc->writeback_fua_set = true;
 			} else goto invalid_optional;
+		} else if (!strcasecmp(string, "metadata_only")) {
+			wc->metadata_only = true;
 		} else {
 invalid_optional:
 			r = -EINVAL;
@@ -2540,6 +2543,8 @@ static void writecache_status(struct dm_
 			extra_args++;
 		if (wc->writeback_fua_set)
 			extra_args++;
+		if (wc->metadata_only)
+			extra_args++;
 
 		DMEMIT("%u", extra_args);
 		if (wc->start_sector_set)
@@ -2560,13 +2565,15 @@ static void writecache_status(struct dm_
 			DMEMIT(" cleaner");
 		if (wc->writeback_fua_set)
 			DMEMIT(" %sfua", wc->writeback_fua ? "" : "no");
+		if (wc->metadata_only)
+			DMEMIT(" metadata_only");
 		break;
 	}
 }
 
 static struct target_type writecache_target = {
 	.name			= "writecache",
-	.version		= {1, 4, 0},
+	.version		= {1, 5, 0},
 	.module			= THIS_MODULE,
 	.ctr			= writecache_ctr,
 	.dtr			= writecache_dtr,

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

