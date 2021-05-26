Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id D825A391A38
	for <lists+dm-devel@lfdr.de>; Wed, 26 May 2021 16:30:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1622039435;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fCgjoeexBIu0NO55Mx9zCQ7LJ+PdcJTYVymQQ6oBTyg=;
	b=KJZJIBhUUMPETTAk6W9q+DwjcZj7Wcj7k+iIn01NyPzt2y4iT/kXhxk+N7OubS6qjPoTRY
	khm1iA8CK28e/nTIeUd39Way09DGE3SU1uIbmhjNr3bsBWHuRaqzi88av7Uijybk6+jzFJ
	UtkGKIr7+fsu1DnzH8MexdasFsM8wVQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-huTYtNPUOcuOzuNNCE6ZZg-1; Wed, 26 May 2021 10:30:33 -0400
X-MC-Unique: huTYtNPUOcuOzuNNCE6ZZg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CDA848B8D15;
	Wed, 26 May 2021 14:29:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A65B10016F8;
	Wed, 26 May 2021 14:29:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2B74A1800BB8;
	Wed, 26 May 2021 14:29:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14QETj4r030031 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 May 2021 10:29:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C2B85100AE43; Wed, 26 May 2021 14:29:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EC411007606;
	Wed, 26 May 2021 14:29:45 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 14QETj88029417; Wed, 26 May 2021 10:29:45 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 14QETj2Y029413; Wed, 26 May 2021 10:29:45 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Wed, 26 May 2021 10:29:45 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2105261028530.26988@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: don't split bios on block
 boundary when overwriting cache content
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If dm-writecache overwrote existing cached data, it would split the
incoming bio to many block-sized bios. The I/O scheduler would reassemble
these bios into one large request. This split and reassemble causes
performance degradation.

This patch avoids splitting the bio if the target area that is being
overwritten is contiguous.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c
+++ linux-2.6/drivers/md/dm-writecache.c
@@ -1360,14 +1360,18 @@ read_next_block:
 	} else {
 		do {
 			bool found_entry = false;
+			bool search_used = false;
 			if (writecache_has_error(wc))
 				goto unlock_error;
 			e = writecache_find_entry(wc, bio->bi_iter.bi_sector, 0);
 			if (e) {
-				if (!writecache_entry_is_committed(wc, e))
+				if (!writecache_entry_is_committed(wc, e)) {
+					search_used = true;
 					goto bio_copy;
+				}
 				if (!WC_MODE_PMEM(wc) && !e->write_in_progress) {
 					wc->overwrote_committed = true;
+					search_used = true;
 					goto bio_copy;
 				}
 				found_entry = true;
@@ -1404,13 +1408,30 @@ bio_copy:
 				sector_t current_cache_sec = start_cache_sec + (bio_size >> SECTOR_SHIFT);
 
 				while (bio_size < bio->bi_iter.bi_size) {
-					struct wc_entry *f = writecache_pop_from_freelist(wc, current_cache_sec);
-					if (!f)
-						break;
-					write_original_sector_seq_count(wc, f, bio->bi_iter.bi_sector +
-									(bio_size >> SECTOR_SHIFT), wc->seq_count);
-					writecache_insert_entry(wc, f);
-					wc->uncommitted_blocks++;
+					if (!search_used) {
+						struct wc_entry *f = writecache_pop_from_freelist(wc, current_cache_sec);
+						if (!f)
+							break;
+						write_original_sector_seq_count(wc, f, bio->bi_iter.bi_sector +
+										(bio_size >> SECTOR_SHIFT), wc->seq_count);
+						writecache_insert_entry(wc, f);
+						wc->uncommitted_blocks++;
+					} else {
+						struct wc_entry *f;
+						struct rb_node *next = rb_next(&e->rb_node);
+						if (!next)
+							break;
+						f = container_of(next, struct wc_entry, rb_node);
+						if (f != e + 1)
+							break;
+						if (read_original_sector(wc, f) != read_original_sector(wc, e) + (wc->block_size >> SECTOR_SHIFT))
+							break;
+						if (unlikely(f->write_in_progress))
+							break;
+						if (writecache_entry_is_committed(wc, f))
+							wc->overwrote_committed = true;
+						e = f;
+					}
 					bio_size += wc->block_size;
 					current_cache_sec += wc->block_size >> SECTOR_SHIFT;
 				}

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

