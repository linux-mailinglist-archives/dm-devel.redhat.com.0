Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7ECB816A1FC
	for <lists+dm-devel@lfdr.de>; Mon, 24 Feb 2020 10:21:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582536093;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sUkQvGINSJVf7e3V6cC/OZ5G9uZJTqByqZwE6peuidw=;
	b=FB28oQjQ5hGwfNbGCrezwzlPW+CJaj7obX+VxAF91KY/1FGWAthNm8ajPIjf2qkMCpWa6D
	Ra3eqn4fz3/dCw0b1fKWigRXJmlFxgZdg1q0NngdiBgfZV0GrcpNQgUs6hP9bDjLE2J5k2
	vnC/jGyZOb4iTyPuT1+DcCLHV3+d8Z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-VmqBLm6wNm20G12p64Rk7Q-1; Mon, 24 Feb 2020 04:21:31 -0500
X-MC-Unique: VmqBLm6wNm20G12p64Rk7Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 293181882CE1;
	Mon, 24 Feb 2020 09:21:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F1DF385781;
	Mon, 24 Feb 2020 09:21:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 83D89182B011;
	Mon, 24 Feb 2020 09:21:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01O9KrKh001982 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Feb 2020 04:20:53 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B9D745DA76; Mon, 24 Feb 2020 09:20:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (ovpn-205-115.brq.redhat.com
	[10.40.205.115])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7605E5D9CD;
	Mon, 24 Feb 2020 09:20:53 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1j69v0-0001WN-Ue; Mon, 24 Feb 2020 10:20:51 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 24 Feb 2020 10:20:50 +0100
Message-Id: <20200224092050.670786680@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 24 Feb 2020 10:20:31 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, 
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Alasdair Kergon <agk@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 4/7] dm writecache: do direct write if the cache
	is full
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename=dm-writecache-direct-write.patch

If the cache device is full, we do a direct write to the origin device.
Note that we must not do it if the written block is already in the cache.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-writecache.c |   13 +++++++++++++
 1 file changed, 13 insertions(+)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-02-23 18:15:56.000000000 +0100
+++ linux-2.6/drivers/md/dm-writecache.c	2020-02-23 18:15:56.000000000 +0100
@@ -1194,6 +1194,7 @@ read_next_block:
 		}
 	} else {
 		do {
+			bool found_entry = false;
 			if (writecache_has_error(wc))
 				goto unlock_error;
 			e = writecache_find_entry(wc, bio->bi_iter.bi_sector, 0);
@@ -1204,9 +1205,21 @@ read_next_block:
 					wc->overwrote_committed = true;
 					goto bio_copy;
 				}
+				found_entry = true;
 			}
 			e = writecache_pop_from_freelist(wc, (sector_t)-1);
 			if (unlikely(!e)) {
+				if (!found_entry) {
+					e = writecache_find_entry(wc, bio->bi_iter.bi_sector, WFE_RETURN_FOLLOWING);
+					if (e) {
+						sector_t next_boundary = read_original_sector(wc, e) - bio->bi_iter.bi_sector;
+						BUG_ON(!next_boundary);
+						if (next_boundary < bio->bi_iter.bi_size >> SECTOR_SHIFT) {
+							dm_accept_partial_bio(bio, next_boundary);
+						}
+					}
+					goto unlock_remap_origin;
+				}
 				writecache_wait_on_freelist(wc);
 				continue;
 			}

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

