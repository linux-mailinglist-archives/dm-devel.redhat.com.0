Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8375B3A87FF
	for <lists+dm-devel@lfdr.de>; Tue, 15 Jun 2021 19:46:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623779182;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=uYEzejil6E0c52wfwyh8yNF/crkdTE2wf7QMHETVHt8=;
	b=eAtIhlXEGdQT6sRilO4xCaxeknXtG23T5jrQ2RvZgmszgf2hMX9bdYSiWP5J2m8b8SPl6P
	yEZQqRXCBJ0xgj12PKm7Hp5zecENxfyVS1LxmjZMUT1DvptcZGjYBBQuLebdAZjX6S6wGB
	fSROi1Z3Bpp3VSNKXLjiqfwQHs26UKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-NFM6wty7P26PrzTfXqoljQ-1; Tue, 15 Jun 2021 13:46:20 -0400
X-MC-Unique: NFM6wty7P26PrzTfXqoljQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FA43801B12;
	Tue, 15 Jun 2021 17:46:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3B715C1C2;
	Tue, 15 Jun 2021 17:46:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 91CC91809CAD;
	Tue, 15 Jun 2021 17:46:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15FHjun1000997 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Jun 2021 13:45:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6E1705C233; Tue, 15 Jun 2021 17:45:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EE1A5C1C2;
	Tue, 15 Jun 2021 17:45:56 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 15FHjtWe000851; Tue, 15 Jun 2021 13:45:55 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 15FHjtGX000848; Tue, 15 Jun 2021 13:45:55 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 15 Jun 2021 13:45:55 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2106151312170.29600@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: Heinz Mauelshagen <heinzm@redhat.com>, dm-devel@redhat.com,
	Joe Thornber <thornber@redhat.com>
Subject: [dm-devel] [PATCH] dm-writecache: fix missing flush to the origin
	device
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm-writecache: fix missing flush to the origin device

The patch d53f1fafec9d086f1c5166436abefdaef30e0363 ("dm writecache: do
direct write if the cache is full") changed dm-writecache, so that it
writes directly to the origin device if the cache is full. Unfortunatelly,
it doesn't forward flush requests to the origin device, so that there is a
bug where flushes are being ignored.

This patch adds missing flush forwarding.

For PMEM mode, we fix this bug by disabling direct writes to the origin
device, because it performs better.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# v5.7+
Fixes: d53f1fafec9d ("dm writecache: do direct write if the cache is full")

Index: linux/drivers/md/dm-writecache.c
===================================================================
--- linux.orig/drivers/md/dm-writecache.c
+++ linux/drivers/md/dm-writecache.c
@@ -1297,8 +1297,12 @@ static int writecache_map(struct dm_targ
 			writecache_flush(wc);
 			if (writecache_has_error(wc))
 				goto unlock_error;
+			if (unlikely(wc->cleaner))
+				goto unlock_remap_origin;
 			goto unlock_submit;
 		} else {
+			if (dm_bio_get_target_bio_nr(bio))
+				goto unlock_remap_origin;
 			writecache_offload_bio(wc, bio);
 			goto unlock_return;
 		}
@@ -1377,7 +1381,7 @@ read_next_block:
 			}
 			e = writecache_pop_from_freelist(wc, (sector_t)-1);
 			if (unlikely(!e)) {
-				if (!found_entry) {
+				if (!WC_MODE_PMEM(wc) && !found_entry) {
 direct_write:
 					e = writecache_find_entry(wc, bio->bi_iter.bi_sector, WFE_RETURN_FOLLOWING);
 					if (e) {
@@ -2479,7 +2483,7 @@ overflow:
 		goto bad;
 	}
 
-	ti->num_flush_bios = 1;
+	ti->num_flush_bios = WC_MODE_PMEM(wc) ? 1 : 2;
 	ti->flush_supported = true;
 	ti->num_discard_bios = 1;
 

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

