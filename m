Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B60E32F
	for <lists+dm-devel@lfdr.de>; Mon, 29 Apr 2019 14:58:22 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AD772308404B;
	Mon, 29 Apr 2019 12:58:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E81F5D6A9;
	Mon, 29 Apr 2019 12:58:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 05A8418089D2;
	Mon, 29 Apr 2019 12:58:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x3TCvvUR023630 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 29 Apr 2019 08:57:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 686676972F; Mon, 29 Apr 2019 12:57:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from leontynka.twibright.com (unknown [10.40.205.178])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2298A17257;
	Mon, 29 Apr 2019 12:57:55 +0000 (UTC)
Received: from debian-a64.vm ([192.168.208.2])
	by leontynka.twibright.com with smtp (Exim 4.89)
	(envelope-from <mpatocka@redhat.com>)
	id 1hL5qy-00081D-Rh; Mon, 29 Apr 2019 14:57:53 +0200
Received: by debian-a64.vm (sSMTP sendmail emulation);
	Mon, 29 Apr 2019 14:57:41 +0200
Message-Id: <20190429125740.951884280@debian-a64.vm>
User-Agent: quilt/0.65
Date: Mon, 29 Apr 2019 14:57:20 +0200
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair G Kergon <agk@redhat.com>,
	Heinz Mauelshagen <heinzm@redhat.com>, Milan Broz <mbroz@redhat.com>,
	Ondrej Kozina <okozina@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline; filename=dm-integrity-alloc-page-list.patch
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Mikulas Patocka <mpatocka@redhat.com>
Subject: [dm-devel] [PATCH 04/10] dm-ingerity: pass size to
	dm_integrity_alloc_page_list
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Mon, 29 Apr 2019 12:58:21 +0000 (UTC)

Pass size to dm_integrity_alloc_page_list. The following patches will need
a size that is different from ic->journal_pages.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |   30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2019-04-09 14:01:48.000000000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2019-04-09 14:01:48.000000000 +0200
@@ -2677,37 +2677,37 @@ static void dm_integrity_set(struct dm_t
 	blk_queue_max_integrity_segments(disk->queue, UINT_MAX);
 }
 
-static void dm_integrity_free_page_list(struct dm_integrity_c *ic, struct page_list *pl)
+static void dm_integrity_free_page_list(struct page_list *pl)
 {
 	unsigned i;
 
 	if (!pl)
 		return;
-	for (i = 0; i < ic->journal_pages; i++)
-		if (pl[i].page)
-			__free_page(pl[i].page);
+	for (i = 0; pl[i].page; i++)
+		__free_page(pl[i].page);
 	kvfree(pl);
 }
 
-static struct page_list *dm_integrity_alloc_page_list(struct dm_integrity_c *ic)
+static struct page_list *dm_integrity_alloc_page_list(unsigned n_pages)
 {
-	size_t page_list_desc_size = ic->journal_pages * sizeof(struct page_list);
 	struct page_list *pl;
 	unsigned i;
 
-	pl = kvmalloc(page_list_desc_size, GFP_KERNEL | __GFP_ZERO);
+	pl = kvmalloc_array(n_pages + 1, sizeof(struct page_list), GFP_KERNEL | __GFP_ZERO);
 	if (!pl)
 		return NULL;
 
-	for (i = 0; i < ic->journal_pages; i++) {
+	for (i = 0; i < n_pages; i++) {
 		pl[i].page = alloc_page(GFP_KERNEL);
 		if (!pl[i].page) {
-			dm_integrity_free_page_list(ic, pl);
+			dm_integrity_free_page_list(pl);
 			return NULL;
 		}
 		if (i)
 			pl[i - 1].next = &pl[i];
 	}
+	pl[i].page = NULL;
+	pl[i].next = NULL;
 
 	return pl;
 }
@@ -2860,7 +2860,7 @@ static int create_journal(struct dm_inte
 	}
 	ic->journal_pages = journal_pages;
 
-	ic->journal = dm_integrity_alloc_page_list(ic);
+	ic->journal = dm_integrity_alloc_page_list(ic->journal_pages);
 	if (!ic->journal) {
 		*error = "Could not allocate memory for journal";
 		r = -ENOMEM;
@@ -2892,7 +2892,7 @@ static int create_journal(struct dm_inte
 		DEBUG_print("cipher %s, block size %u iv size %u\n",
 			    ic->journal_crypt_alg.alg_string, blocksize, ivsize);
 
-		ic->journal_io = dm_integrity_alloc_page_list(ic);
+		ic->journal_io = dm_integrity_alloc_page_list(ic->journal_pages);
 		if (!ic->journal_io) {
 			*error = "Could not allocate memory for journal io";
 			r = -ENOMEM;
@@ -2916,7 +2916,7 @@ static int create_journal(struct dm_inte
 				goto bad;
 			}
 
-			ic->journal_xor = dm_integrity_alloc_page_list(ic);
+			ic->journal_xor = dm_integrity_alloc_page_list(ic->journal_pages);
 			if (!ic->journal_xor) {
 				*error = "Could not allocate memory for journal xor";
 				r = -ENOMEM;
@@ -3571,9 +3571,9 @@ static void dm_integrity_dtr(struct dm_t
 		dm_put_device(ti, ic->dev);
 	if (ic->meta_dev)
 		dm_put_device(ti, ic->meta_dev);
-	dm_integrity_free_page_list(ic, ic->journal);
-	dm_integrity_free_page_list(ic, ic->journal_io);
-	dm_integrity_free_page_list(ic, ic->journal_xor);
+	dm_integrity_free_page_list(ic->journal);
+	dm_integrity_free_page_list(ic->journal_io);
+	dm_integrity_free_page_list(ic->journal_xor);
 	if (ic->journal_scatterlist)
 		dm_integrity_free_journal_scatterlist(ic, ic->journal_scatterlist);
 	if (ic->journal_io_scatterlist)

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
