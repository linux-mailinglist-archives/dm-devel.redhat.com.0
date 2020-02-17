Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 72BBF1612C0
	for <lists+dm-devel@lfdr.de>; Mon, 17 Feb 2020 14:12:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1581945126;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=I+7bjFSW8SHpsc9tnf0az0LOgx9uYTZg0/opBO/AZNQ=;
	b=iB+0aiOKG60Lr43w6H+1PY7JXjZ9e2TwTV+6o7R00eDOh/21NeYZQu1Fk2Pb3QbS9PyIXS
	gWvx0Z6+iLJcgGZucoQqgloSbsR/hZzBkl9stbbD4H9ZD+2duTeU+L0bVmsxJQdv5d9tQU
	Y7cVXrANmycqyL7zf/Nv6IRXyO2Vb3M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-ZcoOuTzqOaKx5N5Z6giIeQ-1; Mon, 17 Feb 2020 08:12:04 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2FCB91005514;
	Mon, 17 Feb 2020 13:11:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B1719051E;
	Mon, 17 Feb 2020 13:11:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEB3635AE1;
	Mon, 17 Feb 2020 13:11:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01HDBcVN003469 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Feb 2020 08:11:38 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 362025DA87; Mon, 17 Feb 2020 13:11:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AEEC5D9CA;
	Mon, 17 Feb 2020 13:11:35 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 01HDBZti022308; Mon, 17 Feb 2020 08:11:35 -0500
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 01HDBZYg022304; Mon, 17 Feb 2020 08:11:35 -0500
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 17 Feb 2020 08:11:35 -0500 (EST)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Ondrej Kozina <okozina@redhat.com>,
	Milan Broz <mbroz@redhat.com>, David Teigland <teigland@redhat.com>,
	Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.2002170809280.18605@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-integrity: fix invalid table returned
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
X-MC-Unique: ZcoOuTzqOaKx5N5Z6giIeQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the flag SB_FLAG_RECALCULATE is present in the superblock, but it was
not specified on the command line (i.e. ic->recalculate_flag is false),
dm-integrity would return invalid table line - the reported number of
arguments would not match the real number.

This patch fixes the argument mismatch.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Reported-by: Ondrej Kozina <okozina@redhat.com>
Cc: stable@vger.kernel.org	# v5.2+
Fixes: 468dfca38b1a ("dm integrity: add a bitmap mode")

---
 drivers/md/dm-integrity.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-02-14 17:19:16.000000000 +0100
+++ linux-2.6/drivers/md/dm-integrity.c	2020-02-17 13:58:05.000000000 +0100
@@ -2982,7 +2982,7 @@ static void dm_integrity_status(struct d
 			DMEMIT(" meta_device:%s", ic->meta_dev->name);
 		if (ic->sectors_per_block != 1)
 			DMEMIT(" block_size:%u", ic->sectors_per_block << SECTOR_SHIFT);
-		if (ic->recalculate_flag)
+		if (ic->sb->flags & cpu_to_le32(SB_FLAG_RECALCULATING))
 			DMEMIT(" recalculate");
 		DMEMIT(" journal_sectors:%u", ic->initial_sectors - SB_SECTORS);
 		DMEMIT(" interleave_sectors:%u", 1U << ic->sb->log2_interleave_sectors);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

