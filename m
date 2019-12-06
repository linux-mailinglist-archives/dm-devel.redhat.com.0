Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 020F1116D38
	for <lists+dm-devel@lfdr.de>; Mon,  9 Dec 2019 13:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575895218;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vTvGSTevbsJ1MHblyYe4LR6wow6+pQyTwCusHSLcmeQ=;
	b=aRlP7Gy+QMj99IYpZvYpa3Jt3hlz6exEwFwYQC1oRcf7GxYyTwTDQxYv5nGP/pXl+UVNcP
	Z2NHdEOgpAhx8ZxaW13bPJeAVvd1b8Yb6EjpByZISp+d5aU5RQmFd96dUs/eZoOgBwbBZh
	ZgNeXuVZavjRZ/oiojRF5/WhxvrvAWc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-354VJokPMEKt-_DoXp_zow-1; Mon, 09 Dec 2019 07:40:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A4A55800D53;
	Mon,  9 Dec 2019 12:40:07 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAB3D6E3FC;
	Mon,  9 Dec 2019 12:40:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8162683548;
	Mon,  9 Dec 2019 12:39:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB6J3b8o003903 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 6 Dec 2019 14:03:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 81D652166B2E; Fri,  6 Dec 2019 19:03:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7D55D2166B2D
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 19:03:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3592F803B4A
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 19:03:35 +0000 (UTC)
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
	[192.185.198.26]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-ZhkzB3zIPQ2jZ61FrufRKQ-1; Fri, 06 Dec 2019 14:03:32 -0500
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
	by gateway30.websitewelcome.com (Postfix) with ESMTP id 1BA46C641
	for <dm-devel@redhat.com>; Fri,  6 Dec 2019 13:03:31 -0600 (CST)
Received: from host2059.hostmonster.com ([67.20.112.233]) by cmsmtp with SMTP
	id dIt0iCWSbqNtvdIt0iwJaZ; Fri, 06 Dec 2019 13:03:31 -0600
X-Authority-Reason: nr=8
Received: from [196.157.133.43] (port=14881 helo=[192.168.100.132])
	by host2059.hostmonster.com with esmtpsa
	(TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92)
	(envelope-from <mmokhtar@petasan.org>)
	id 1idIsz-003fgS-Vu; Fri, 06 Dec 2019 12:03:30 -0700
From: Maged Mokhtar <mmokhtar@petasan.org>
To: mpatocka@redhat.com
Message-ID: <598c7c64-9b11-3407-2060-8d43b1ef1241@petasan.org>
Date: Fri, 6 Dec 2019 21:03:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - host2059.hostmonster.com
X-AntiAbuse: Original Domain - redhat.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - petasan.org
X-BWhitelist: no
X-Source-IP: 196.157.133.43
X-Source-L: No
X-Exim-ID: 1idIsz-003fgS-Vu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.100.132]) [196.157.133.43]:14881
X-Source-Auth: mmokhtar@petasan.org
X-Email-Count: 2
X-Source-Cap: cGV0YXNhbm87cGV0YXNhbm87aG9zdDIwNTkuaG9zdG1vbnN0ZXIuY29t
X-Local-Domain: yes
X-MC-Unique: ZhkzB3zIPQ2jZ61FrufRKQ-1
X-MC-Unique: 354VJokPMEKt-_DoXp_zow-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 09 Dec 2019 07:39:31 -0500
Cc: dm-devel@redhat.com
Subject: [dm-devel]  [PATCH] dm writecache: SB remove seq_count
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit

Removes seq_count from super block. Currently the super block gets 
written in each commit to update the seq_count which is just used when 
the target is restarted/resumed. This extra iop has a performance impact 
on small block size writes which do FUA/sync on every request. A 4k sync 
write currently requires 3 write ops: submitted data, metadata + super 
block seq_count update, removal of seq_count update reduces required 
write ops to 2.

Rebuild of seq_count at start/resumption can be done quickly by looping 
through memory entry metadata within the resume() function.

Signed-off-by: Maged Mokhtar <mmokhtar@petasan.org>
---
  drivers/md/dm-writecache.c |   56 ++++++++++++++++++++++++++---------
  1 file changed, 42 insertions(+), 14 deletions(-)

--- a/drivers/md/dm-writecache.c	2019-12-06 03:07:53.000000000 -0800
+++ b/drivers/md/dm-writecache.c	2019-12-06 09:25:45.000000000 -0800
@@ -52,7 +52,8 @@ do {								\
  #endif

  #define MEMORY_SUPERBLOCK_MAGIC		0x23489321
-#define MEMORY_SUPERBLOCK_VERSION	1
+#define MEMORY_SUPERBLOCK_VERSION_1	1
+#define MEMORY_SUPERBLOCK_VERSION_2	2

  struct wc_memory_entry {
  	__le64 original_sector;
@@ -67,7 +68,6 @@ struct wc_memory_superblock {
  			__le32 block_size;
  			__le32 pad;
  			__le64 n_blocks;
-			__le64 seq_count;
  		};
  		__le64 padding[8];
  	};
@@ -380,6 +380,41 @@ static uint64_t read_seq_count(struct dm
  #endif
  }

+static uint64_t read_last_seq_count(struct dm_writecache *wc)
+{
+	size_t b;
+	uint64_t last_seq_count = 0;
+	uint64_t seq_count;
+	__le64 empty = cpu_to_le64(-1);
+
+	if (WC_MODE_PMEM(wc)) {
+		struct wc_memory_entry wme;
+		for (b = 0; b < wc->n_blocks; b++) {
+			BUG_ON(memcpy_mcsafe(&wme, &sb(wc)->entries[b],
+				sizeof(struct wc_memory_entry)));
+			if (wme.seq_count != empty) {
+				seq_count = le64_to_cpu(wme.seq_count);
+				if (last_seq_count < seq_count)
+					last_seq_count = seq_count;
+			}
+		}
+	}
+	else {
+		struct wc_memory_entry *p = &sb(wc)->entries[0];
+		b = wc->n_blocks;
+		while (0 < b) {
+			if (p->seq_count != empty) {	
+				seq_count = le64_to_cpu(p->seq_count);
+				if (last_seq_count < seq_count)
+					last_seq_count = seq_count;
+			}
+			p++;		
+			b--;
+		}
+	}
+	return last_seq_count;
+}
+
  static void clear_seq_count(struct dm_writecache *wc, struct wc_entry *e)
  {
  #ifdef DM_WRITECACHE_HANDLE_HARDWARE_ERRORS
@@ -730,8 +765,6 @@ static void writecache_flush(struct dm_w
  		writecache_wait_for_ios(wc, WRITE);

  	wc->seq_count++;
-	pmem_assign(sb(wc)->seq_count, cpu_to_le64(wc->seq_count));
-	writecache_flush_region(wc, &sb(wc)->seq_count, sizeof sb(wc)->seq_count);
  	writecache_commit_flushed(wc);

  	wc->overwrote_committed = false;
@@ -876,7 +909,6 @@ static void writecache_resume(struct dm_
  	struct dm_writecache *wc = ti->private;
  	size_t b;
  	bool need_flush = false;
-	__le64 sb_seq_count;
  	int r;

  	wc_lock(wc);
@@ -894,12 +926,7 @@ static void writecache_resume(struct dm_
  	}
  	wc->freelist_size = 0;

-	r = memcpy_mcsafe(&sb_seq_count, &sb(wc)->seq_count, sizeof(uint64_t));
-	if (r) {
-		writecache_error(wc, r, "hardware memory error when reading 
superblock: %d", r);
-		sb_seq_count = cpu_to_le64(0);
-	}
-	wc->seq_count = le64_to_cpu(sb_seq_count);
+	wc->seq_count = read_last_seq_count(wc) + 1;

  #ifdef DM_WRITECACHE_HANDLE_HARDWARE_ERRORS
  	for (b = 0; b < wc->n_blocks; b++) {
@@ -1757,10 +1784,9 @@ static int init_memory(struct dm_writeca

  	for (b = 0; b < ARRAY_SIZE(sb(wc)->padding); b++)
  		pmem_assign(sb(wc)->padding[b], cpu_to_le64(0));
-	pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_VERSION));
+	pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_VERSION_2));
  	pmem_assign(sb(wc)->block_size, cpu_to_le32(wc->block_size));
  	pmem_assign(sb(wc)->n_blocks, cpu_to_le64(wc->n_blocks));
-	pmem_assign(sb(wc)->seq_count, cpu_to_le64(0));

  	for (b = 0; b < wc->n_blocks; b++)
  		write_original_sector_seq_count(wc, &wc->entries[b], -1, -1);
@@ -2159,11 +2185,13 @@ invalid_optional:
  		goto bad;
  	}

-	if (le32_to_cpu(s.version) != MEMORY_SUPERBLOCK_VERSION) {
+	if (le32_to_cpu(s.version) != MEMORY_SUPERBLOCK_VERSION_1 &&
+		le32_to_cpu(s.version) != MEMORY_SUPERBLOCK_VERSION_2) {
  		ti->error = "Invalid version in the superblock";
  		r = -EINVAL;
  		goto bad;
  	}
+	pmem_assign(sb(wc)->version, cpu_to_le32(MEMORY_SUPERBLOCK_VERSION_2));

  	if (le32_to_cpu(s.block_size) != wc->block_size) {
  		ti->error = "Block size does not match superblock";

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

