Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 86FB537AAF6
	for <lists+dm-devel@lfdr.de>; Tue, 11 May 2021 17:41:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620747715;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wsTnWRfSK3/02utm64LwXvEYxqcYkGW5j2GdqW0hdj4=;
	b=MZAoKI4BICFj+ty9w0M/8PgPfUlHbWgVTLo1vdhPOr+MSMKYfSvvrVLug73ola5PwD8QUs
	x6zYROETt4kjEVICZV3Snm79PSgyt7iNj48cyQTm7bYQ4+U2AHGSolbTiwuT7EJbgEIa0a
	Wj5al7TlGCLWuZym+iW9Uv04x6XqhpY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-nyXpX8DvMyCCW6abl5lklA-1; Tue, 11 May 2021 11:41:53 -0400
X-MC-Unique: nyXpX8DvMyCCW6abl5lklA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F98AFC84;
	Tue, 11 May 2021 15:41:46 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD8016268E;
	Tue, 11 May 2021 15:41:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6F77E4EA6C;
	Tue, 11 May 2021 15:41:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BFfBXj008923 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 11:41:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5899E9D62; Tue, 11 May 2021 15:41:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F117A54351;
	Tue, 11 May 2021 15:41:00 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 14BFf0K2015010; Tue, 11 May 2021 11:41:00 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 14BFf0tV015006; Tue, 11 May 2021 11:41:00 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Tue, 11 May 2021 11:41:00 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.2105111140010.14870@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: fix sparse warnings
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the types __le* instead of __u* to fix sparse warnings.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c
+++ linux-2.6/drivers/md/dm-integrity.c
@@ -66,14 +66,14 @@ struct superblock {
 	__u8 magic[8];
 	__u8 version;
 	__u8 log2_interleave_sectors;
-	__u16 integrity_tag_size;
-	__u32 journal_sections;
-	__u64 provided_data_sectors;	/* userspace uses this value */
-	__u32 flags;
+	__le16 integrity_tag_size;
+	__le32 journal_sections;
+	__le64 provided_data_sectors;	/* userspace uses this value */
+	__le32 flags;
 	__u8 log2_sectors_per_block;
 	__u8 log2_blocks_per_bitmap_bit;
 	__u8 pad[2];
-	__u64 recalc_sector;
+	__le64 recalc_sector;
 	__u8 pad2[8];
 	__u8 salt[SALT_SIZE];
 };
@@ -86,16 +86,16 @@ struct superblock {
 
 #define	JOURNAL_ENTRY_ROUNDUP		8
 
-typedef __u64 commit_id_t;
+typedef __le64 commit_id_t;
 #define JOURNAL_MAC_PER_SECTOR		8
 
 struct journal_entry {
 	union {
 		struct {
-			__u32 sector_lo;
-			__u32 sector_hi;
+			__le32 sector_lo;
+			__le32 sector_hi;
 		} s;
-		__u64 sector;
+		__le64 sector;
 	} u;
 	commit_id_t last_bytes[];
 	/* __u8 tag[0]; */
@@ -806,7 +806,7 @@ static void section_mac(struct dm_integr
 	}
 
 	if (ic->sb->flags & cpu_to_le32(SB_FLAG_FIXED_HMAC)) {
-		uint64_t section_le;
+		__le64 section_le;
 
 		r = crypto_shash_update(desc, (__u8 *)&ic->sb->salt, SALT_SIZE);
 		if (unlikely(r < 0)) {
@@ -1640,7 +1640,7 @@ static void integrity_end_io(struct bio
 static void integrity_sector_checksum(struct dm_integrity_c *ic, sector_t sector,
 				      const char *data, char *result)
 {
-	__u64 sector_le = cpu_to_le64(sector);
+	__le64 sector_le = cpu_to_le64(sector);
 	SHASH_DESC_ON_STACK(req, ic->internal_hash);
 	int r;
 	unsigned digest_size;
@@ -3826,7 +3826,7 @@ static int create_journal(struct dm_inte
 			for (i = 0; i < ic->journal_sections; i++) {
 				struct scatterlist sg;
 				struct skcipher_request *section_req;
-				__u32 section_le = cpu_to_le32(i);
+				__le32 section_le = cpu_to_le32(i);
 
 				memset(crypt_iv, 0x00, ivsize);
 				memset(crypt_data, 0x00, crypt_len);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

