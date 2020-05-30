Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 543B91E9FFE
	for <lists+dm-devel@lfdr.de>; Mon,  1 Jun 2020 10:26:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590999974;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=BV/W3/WNwIoKlIlxCXsiOny6q6Pf2yI9GdUNbl1zCEo=;
	b=AO0IsWpILIr7TnURBS4yNcp47E9IWp0y+V/rIkA0JAuo6NdZrkxtDfJ41JLYk9Zn3uP3Nc
	vTfQ5489bj8t2vPug2X4r2uUzWX7+r9j0I02ka7bhz6XCjKjt5asJh5bUAYfE2x5dpYR81
	irGU52k6h3ygqQ3cCtdmgwxokGmC/Yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-yQKxMkWTMKmGlfcajYcBSw-1; Mon, 01 Jun 2020 04:26:11 -0400
X-MC-Unique: yQKxMkWTMKmGlfcajYcBSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 71C6C8005AA;
	Mon,  1 Jun 2020 08:26:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CAE19C4F;
	Mon,  1 Jun 2020 08:26:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C56A77F21E;
	Mon,  1 Jun 2020 08:25:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04U9DNMS002925 for <dm-devel@listman.util.phx.redhat.com>;
	Sat, 30 May 2020 05:13:23 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A28C7202696B; Sat, 30 May 2020 09:13:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9306F2026DFD
	for <dm-devel@redhat.com>; Sat, 30 May 2020 09:13:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 96A95805BC5
	for <dm-devel@redhat.com>; Sat, 30 May 2020 09:13:21 +0000 (UTC)
Received: from sender4-pp-o92.zoho.com (sender4-pp-o92.zoho.com
	[136.143.188.92]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-269--xNN9rPhNzaybMyHfXw43Q-1; Sat, 30 May 2020 05:13:18 -0400
X-MC-Unique: -xNN9rPhNzaybMyHfXw43Q-1
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=InSRFFHZIqX5BX2gNEKPbW6KoxBQbmgcqpQKevNkSbLk3Rp/XFOi4xHgQMXIFTpOVJSsXvYqF+w7
	cCkb6XYMW+vTeqt0AdF5HHBhOC4uJZsDaLTpct4MtdqpwwAr0+LN
Received: from YEHS1XPF1D05WL.lenovo.com (111.197.250.66 [111.197.250.66]) by
	mx.zohomail.com with SMTPS id 1590829993582376.40498152393263;
	Sat, 30 May 2020 02:13:13 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Sat, 30 May 2020 17:12:50 +0800
Message-Id: <20200530091250.58420-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 01 Jun 2020 04:25:39 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH] dm writecache: reinitialize lru in writeback
	instead of endio
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Huaisheng Ye <yehs1@lenovo.com>

When wc_entry has been removed from wbl->list in writeback, it will
be not used again except waiting to be set free in writecache_free_entry.

That is a little of annoying, it has to reinitialize lru of wc_entry
in endio before calling writecache_free_entry.

Using list_del_init instead of list_del in writeback for simpler code.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 7bbc21b..66f3a3b 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1519,7 +1519,6 @@ static void __writecache_endio_pmem(struct dm_writecache *wc, struct list_head *
 			e = wb->wc_list[i];
 			BUG_ON(!e->write_in_progress);
 			e->write_in_progress = false;
-			INIT_LIST_HEAD(&e->lru);
 			if (!writecache_has_error(wc))
 				writecache_free_entry(wc, e);
 			BUG_ON(!wc->writeback_size);
@@ -1555,7 +1554,6 @@ static void __writecache_endio_ssd(struct dm_writecache *wc, struct list_head *l
 		do {
 			BUG_ON(!e->write_in_progress);
 			e->write_in_progress = false;
-			INIT_LIST_HEAD(&e->lru);
 			if (!writecache_has_error(wc))
 				writecache_free_entry(wc, e);
 
@@ -1654,7 +1652,7 @@ static void __writecache_writeback_pmem(struct dm_writecache *wc, struct writeba
 	while (wbl->size) {
 		wbl->size--;
 		e = container_of(wbl->list.prev, struct wc_entry, lru);
-		list_del(&e->lru);
+		list_del_init(&e->lru);
 
 		max_pages = e->wc_list_contiguous;
 
@@ -1685,7 +1683,7 @@ static void __writecache_writeback_pmem(struct dm_writecache *wc, struct writeba
 			if (!wc_add_block(wb, f, GFP_NOWAIT | __GFP_NOWARN))
 				break;
 			wbl->size--;
-			list_del(&f->lru);
+			list_del_init(&f->lru);
 			wb->wc_list[wb->wc_list_n++] = f;
 			e = f;
 		}
@@ -1712,7 +1710,7 @@ static void __writecache_writeback_ssd(struct dm_writecache *wc, struct writebac
 
 		wbl->size--;
 		e = container_of(wbl->list.prev, struct wc_entry, lru);
-		list_del(&e->lru);
+		list_del_init(&e->lru);
 
 		n_sectors = e->wc_list_contiguous << (wc->block_size_bits - SECTOR_SHIFT);
 
@@ -1732,7 +1730,7 @@ static void __writecache_writeback_ssd(struct dm_writecache *wc, struct writebac
 			wbl->size--;
 			f = container_of(wbl->list.prev, struct wc_entry, lru);
 			BUG_ON(f != e + 1);
-			list_del(&f->lru);
+			list_del_init(&f->lru);
 			e = f;
 		}
 
-- 
1.8.3.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

