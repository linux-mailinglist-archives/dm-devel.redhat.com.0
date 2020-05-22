Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 205451DE10B
	for <lists+dm-devel@lfdr.de>; Fri, 22 May 2020 09:32:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590132754;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ikww/ypNncy2lINnaUzWoYxWwL8oedQp1aFGZOonczs=;
	b=HGcv5FqzKiOzMSGNL79T2nO6uVE02CV+whMvhNxx4NTWSyJIxE0v+0+cXdFX0NBklHtB6/
	/TVK2e+O0Nw8ZDYLfQaaStQGT0B5N+L3CSI/x3pYZQMWTWaZchwZASRjjvaXx17kdDYCyh
	nLRqrBZ16I3D8gW0cTmX0gr1gVy+cDc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-KLjd5FmYNtSA92PxcIoU3Q-1; Fri, 22 May 2020 03:32:32 -0400
X-MC-Unique: KLjd5FmYNtSA92PxcIoU3Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E68B780183C;
	Fri, 22 May 2020 07:32:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 709365D9CD;
	Fri, 22 May 2020 07:32:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1C3D54D0C;
	Fri, 22 May 2020 07:32:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04M7WJ8U009032 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 May 2020 03:32:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9F28BF11D1; Fri, 22 May 2020 07:32:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B6D8F103B
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:32:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8E2708ECB29
	for <dm-devel@redhat.com>; Fri, 22 May 2020 07:32:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-362-Zx58IniYMOSNJQ-ls1Xczg-1;
	Fri, 22 May 2020 03:32:13 -0400
X-MC-Unique: Zx58IniYMOSNJQ-ls1Xczg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 0E84FB9C5;
	Fri, 22 May 2020 07:32:14 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri, 22 May 2020 09:32:09 +0200
Message-Id: <20200522073209.78681-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Hannes@suse.de, Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-zoned: remove leftover hunk for switching to
	sequential zones
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove a leftover hunk to switch from sequential zones to random
zones when selecting a reclaim zone; the logic has moved into the
caller and this patch is now pointless.

Fixes: 34f5affd04c4 ("dm zoned: separate random and cache zones")
Signed-off-by: Hannes Reinecke <hare@suse.de.
---
 drivers/md/dm-zoned-metadata.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/md/dm-zoned-metadata.c b/drivers/md/dm-zoned-metadata.c
index db0dc2b5d44d..4a2e351365c5 100644
--- a/drivers/md/dm-zoned-metadata.c
+++ b/drivers/md/dm-zoned-metadata.c
@@ -2111,14 +2111,6 @@ struct dm_zone *dmz_alloc_zone(struct dmz_metadata *zmd, unsigned long flags)
 		 */
 		if (!(flags & DMZ_ALLOC_RECLAIM))
 			return NULL;
-		/*
-		 * Use sequential write zones if we started off with random
-		 * zones and the list is empty
-		 */
-		if (list == &zmd->unmap_rnd_list) {
-			list = &zmd->unmap_seq_list;
-			goto again;
-		}
 		/*
 		 * Fallback to the reserved sequential zones
 		 */
-- 
2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

