Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id E98739CA31
	for <lists+dm-devel@lfdr.de>; Mon, 26 Aug 2019 09:24:55 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DDB16308FBFC;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB2085C72E;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6388E180BA9B;
	Mon, 26 Aug 2019 07:24:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x7P7PGUu025011 for <dm-devel@listman.util.phx.redhat.com>;
	Sun, 25 Aug 2019 03:25:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0AB465D713; Sun, 25 Aug 2019 07:25:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F12415D6A3;
	Sun, 25 Aug 2019 07:25:15 +0000 (UTC)
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com
	[136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81F4BC049E10;
	Sun, 25 Aug 2019 07:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1566717910; cv=none; d=zoho.com; s=zohoarc; 
	b=SJpPVL1y/fFECRiorlnRKTcsvUGgqfPM0WCrlkRXq8+ksnLCjUjhcIUt5HbILFyAwN83keYNb1iiCZPha5JSnCw777qcvl0QGgkKThpwDmVYpZhQvTljG69SAy5OVPLKDPN8eO9KTK7SrPtB4VBKdknWrMNvTuMlxav37Bb1KgA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zoho.com;
	s=zohoarc; t=1566717910;
	h=Cc:Date:From:In-Reply-To:Message-ID:References:Subject:To:ARC-Authentication-Results;
	bh=JbPeKwL0y9K5o8QvWTYI+guOBqyfTVLeLMRqF8VDqWc=; 
	b=bEMCgOUh1pBeKMb/u7u3grM3ujaZVzGTOPRRROtLXOs3C3/3x7mZdsFrbsIq2pGe74AtMToDOtvkZuomTBAhmPmKfyWGqBWVcWtiwcn2hXIRFUzPEa2aJA681FW6sXyAzmOXXM6jmWXvqeHo7Z3cGHAzMDlRGQEqXVYPn84DaNI=
ARC-Authentication-Results: i=1; mx.zoho.com; dkim=pass  header.i=zoho.com;
	spf=pass  smtp.mailfrom=yehs2007@zoho.com;
	dmarc=pass header.from=<yehs2007@zoho.com>
	header.from=<yehs2007@zoho.com>
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id:in-reply-to:references; 
	b=i7y2aEyOHh/la9dU3CPx42PbzlTdsTP9AIatWSaev26MhvxazXL9kgiLtuYSGKE0vaAVtr7CacPu
	UxeGSKrTnyEcL66hHrbYbIu4R8iV5qlMuOhCWOOUWmaib0WCiuuq  
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1566717910; 
	s=zm2019; d=zoho.com; i=yehs2007@zoho.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	l=3969; bh=JbPeKwL0y9K5o8QvWTYI+guOBqyfTVLeLMRqF8VDqWc=;
	b=pu/b7LyNmYvufL43cLjOm9uc6q7eI2PfNoaarhXUjd/qlCh2Hi2xduAPONT5OyO7
	rofiHB/FJvRmrIOJRH42WcnkP/TxtGQNeZNa4V/HbXxJi0nrMlKVBvj+1YqyZRu/bej
	1qq2aaLi8arB2HnAeusARLo0U0rhRbhoqewsZhnU=
Received: from YEHS1XR3054QMS.lenovo.com (123.120.58.107 [123.120.58.107]) by
	mx.zohomail.com with SMTPS id 15667179088951020.9475134769934;
	Sun, 25 Aug 2019 00:25:08 -0700 (PDT)
From: Huaisheng Ye <yehs2007@zoho.com>
To: mpatocka@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Sun, 25 Aug 2019 15:24:33 +0800
Message-Id: <20190825072433.2628-4-yehs2007@zoho.com>
In-Reply-To: <20190825072433.2628-1-yehs2007@zoho.com>
References: <20190825072433.2628-1-yehs2007@zoho.com>
X-ZohoMailClient: External
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 238
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.31]); Sun, 25 Aug 2019 07:25:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Sun, 25 Aug 2019 07:25:15 +0000 (UTC) for IP:'136.143.188.95'
	DOMAIN:'sender4-pp-o95.zoho.com' HELO:'sender4-pp-o95.zoho.com'
	FROM:'yehs2007@zoho.com' RCPT:''
X-RedHat-Spam-Score: 0.151  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,
	SPF_PASS) 136.143.188.95 sender4-pp-o95.zoho.com 136.143.188.95
	sender4-pp-o95.zoho.com <yehs2007@zoho.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 26 Aug 2019 03:24:39 -0400
Cc: prarit@redhat.com, dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	tyu1@lenovo.com, Huaisheng Ye <yehs1@lenovo.com>
Subject: [dm-devel] [PATCH 3/3] dm writecache: optimize performance by
	sorting the blocks for writeback_all
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 26 Aug 2019 07:24:54 +0000 (UTC)

From: Huaisheng Ye <yehs1@lenovo.com>

During the process of writeback, the blocks, which have been placed in wbl.list
for writeback soon, are partially ordered for the contiguous ones.

When writeback_all has been set, for most cases, also by default, there will be
a lot of blocks in pmem need to writeback at the same time.
For this case, we could optimize the performance by sorting all blocks in
wbl.list. writecache_writeback doesn't need to get blocks from the tail of
wc->lru, whereas from the first rb_node from the rb_tree.

The benefit is that, writecache_writeback doesn't need to have any cost to sort
the blocks, because of all blocks are incremental originally in rb_tree.
There will be a writecache_flush when writeback_all begins to work, that will
eliminate duplicate blocks in cache by committed/uncommitted.

Testing platform: Thinksystem SR630 with persistent memory.
The cache comes from pmem, which has 1006MB size. The origin device is HDD, 2GB
of which for using.

Testing steps:
 1) dmsetup create mycache --table '0 4194304 writecache p /dev/sdb1 /dev/pmem4  4096 0'
 2) fio -filename=/dev/mapper/mycache -direct=1 -iodepth=20 -rw=randwrite
 -ioengine=libaio -bs=4k -loops=1  -size=2g -group_reporting -name=mytest1
 3) time dmsetup message /dev/mapper/mycache 0 flush

Here is the results below,
With the patch:
 # fio -filename=/dev/mapper/mycache -direct=1 -iodepth=20 -rw=randwrite
 -ioengine=libaio -bs=4k -loops=1  -size=2g -group_reporting -name=mytest1
   iops        : min= 1582, max=199470, avg=5305.94, stdev=21273.44, samples=197
 # time dmsetup message /dev/mapper/mycache 0 flush
real	0m44.020s
user	0m0.002s
sys	0m0.003s

Without the patch:
 # fio -filename=/dev/mapper/mycache -direct=1 -iodepth=20 -rw=randwrite
 -ioengine=libaio -bs=4k -loops=1  -size=2g -group_reporting -name=mytest1
   iops        : min= 1202, max=197650, avg=4968.67, stdev=20480.17, samples=211
 # time dmsetup message /dev/mapper/mycache 0 flush
real	1m39.221s
user	0m0.001s
sys	0m0.003s

I also have checked the data accuracy with this patch by making EXT4 filesystem
on mycache, then mount it for checking md5 of files on that.
The test result is positive, with this patch it could save more than half of time
when writeback_all.

Signed-off-by: Huaisheng Ye <yehs1@lenovo.com>
---
 drivers/md/dm-writecache.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-writecache.c b/drivers/md/dm-writecache.c
index 3643084..c481947 100644
--- a/drivers/md/dm-writecache.c
+++ b/drivers/md/dm-writecache.c
@@ -1560,7 +1560,7 @@ static void writecache_writeback(struct work_struct *work)
 {
 	struct dm_writecache *wc = container_of(work, struct dm_writecache, writeback_work);
 	struct blk_plug plug;
-	struct wc_entry *e, *f, *g;
+	struct wc_entry *f, *g, *e = NULL;
 	struct rb_node *node, *next_node;
 	struct list_head skipped;
 	struct writeback_list wbl;
@@ -1597,7 +1597,14 @@ static void writecache_writeback(struct work_struct *work)
 			break;
 		}
 
-		e = container_of(wc->lru.prev, struct wc_entry, lru);
+		if (unlikely(wc->writeback_all)) {
+			if (unlikely(!e)) {
+				writecache_flush(wc);
+				e = container_of(rb_first(&wc->tree), struct wc_entry, rb_node);
+			} else
+				e = g;
+		} else
+			e = container_of(wc->lru.prev, struct wc_entry, lru);
 		BUG_ON(e->write_in_progress);
 		if (unlikely(!writecache_entry_is_committed(wc, e))) {
 			writecache_flush(wc);
@@ -1658,8 +1665,14 @@ static void writecache_writeback(struct work_struct *work)
 			g->wc_list_contiguous = BIO_MAX_PAGES;
 			f = g;
 			e->wc_list_contiguous++;
-			if (unlikely(e->wc_list_contiguous == BIO_MAX_PAGES))
+			if (unlikely(e->wc_list_contiguous == BIO_MAX_PAGES)) {
+				if (unlikely(wc->writeback_all)) {
+					next_node = rb_next(&f->rb_node);
+					if (likely(next_node))
+						g = container_of(next_node, struct wc_entry, rb_node);
+				}
 				break;
+			}
 		}
 		cond_resched();
 	}
-- 
1.8.3.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
