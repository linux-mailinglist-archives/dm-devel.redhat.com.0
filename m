Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 6075618EBFA
	for <lists+dm-devel@lfdr.de>; Sun, 22 Mar 2020 20:45:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584906309;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6bcZirJuVzENjvt08HbsxSSm+H5eyGFmlSQzEkCGBkA=;
	b=UzgpQCFD2zWzA1uBwFapYHaouwD3EqqZXyJORevTQOwrgHUqtnEX5tK6yUgnz2V1eZJ1vW
	fj7D1eb0W8QQhcjfq++5+LRvxlfh/jmFRxjhhcWr8WIohgFvK0+fSvmscswhLXuJG5Z/Wk
	7GW5sMnMMRvqVZrnG12M3EVjgF4awCY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-mfs9TxH4N2i9LsMDmnIfig-1; Sun, 22 Mar 2020 15:45:06 -0400
X-MC-Unique: mfs9TxH4N2i9LsMDmnIfig-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7101A189D6C0;
	Sun, 22 Mar 2020 19:45:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0C5A194963;
	Sun, 22 Mar 2020 19:45:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2F4D31809567;
	Sun, 22 Mar 2020 19:44:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02MJiRa9025793 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 22 Mar 2020 15:44:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0FB271001F43; Sun, 22 Mar 2020 19:44:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.192.116])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1B5B91001E91;
	Sun, 22 Mar 2020 19:44:24 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.92)
	(envelope-from <mpatocka@redhat.com>)
	id 1jG6WC-0005xk-8s; Sun, 22 Mar 2020 20:44:21 +0100
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Sun, 22 Mar 2020 20:44:20 +0100
Message-Id: <20200322194420.008882760@debian-a64.vm>
User-Agent: quilt/0.65
Date: Sun, 22 Mar 2020 20:42:21 +0100
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, David Teigland <teigland@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 1/7] dm-integrity: fix a crash with unusually
	large tag size
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
Content-Disposition: inline; filename=dm-integrity-fix-crash.patch

If the user specifies tag size larger than HASH_MAX_DIGESTSIZE, there's a
crash in integrity_metadata.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-integrity.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-03-19 15:28:14.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-03-19 19:16:36.000000000 +0100
@@ -1519,7 +1519,7 @@ static void integrity_metadata(struct wo
 		struct bio *bio = dm_bio_from_per_bio_data(dio, sizeof(struct dm_integrity_io));
 		char *checksums;
 		unsigned extra_space = unlikely(digest_size > ic->tag_size) ? digest_size - ic->tag_size : 0;
-		char checksums_onstack[HASH_MAX_DIGESTSIZE];
+		char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 		unsigned sectors_to_process = dio->range.n_sectors;
 		sector_t sector = dio->range.logical_sector;
 
@@ -1748,7 +1748,7 @@ retry_kmap:
 				} while (++s < ic->sectors_per_block);
 #ifdef INTERNAL_VERIFY
 				if (ic->internal_hash) {
-					char checksums_onstack[max(HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
+					char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
 
 					integrity_sector_checksum(ic, logical_sector, mem + bv.bv_offset, checksums_onstack);
 					if (unlikely(memcmp(checksums_onstack, journal_entry_tag(ic, je), ic->tag_size))) {

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

