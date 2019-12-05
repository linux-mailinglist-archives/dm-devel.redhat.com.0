Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7172C11490F
	for <lists+dm-devel@lfdr.de>; Thu,  5 Dec 2019 23:09:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1575583780;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FBd52GzqUwK0WJO3yDWbHhacDsI1y82rkt+eyf/9IfU=;
	b=DLqIgaSenCkSQqT7nSaLjt7sNMWcZG/w9Qqd6d3AB0U6fse0rG/J5M8ke1tLnBZ2CThi3S
	XDLJcM1djsKdfEXvv2j/ovM+TJz1cCpBm9VwSmS3zNraO2yfy/4drZK76VlVFvJZDloQd+
	bCx3lkEPP3NHd8gCdJ4bnC5xK7jXAjk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-c-QxUu7fMjGhNYdIWYrRTQ-1; Thu, 05 Dec 2019 17:09:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 836D918A8C84;
	Thu,  5 Dec 2019 22:09:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 550205C1BB;
	Thu,  5 Dec 2019 22:09:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 76D4441F07;
	Thu,  5 Dec 2019 22:09:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xB5M9Ok4020566 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 5 Dec 2019 17:09:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A9C04691BF; Thu,  5 Dec 2019 22:09:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (unknown [10.18.25.106])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D86B667E52;
	Thu,  5 Dec 2019 22:09:19 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Thu,  5 Dec 2019 17:08:37 -0500
Message-Id: <1575583717-12502-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH] dm dust: change ret to r in dust_map_write
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: c-QxUu7fMjGhNYdIWYrRTQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the dust_map_write() function, change the return code variable
"ret" to "r", to match the convention of the other device-mapper
targets.

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index eb37584427a4..ff03b90072c5 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -207,16 +207,16 @@ static int dust_map_write(struct dust_device *dd, sector_t thisblock,
 			  bool fail_read_on_bb)
 {
 	unsigned long flags;
-	int ret = DM_MAPIO_REMAPPED;
+	int r = DM_MAPIO_REMAPPED;
 
 	if (fail_read_on_bb) {
 		thisblock >>= dd->sect_per_block_shift;
 		spin_lock_irqsave(&dd->dust_lock, flags);
-		ret = __dust_map_write(dd, thisblock);
+		r = __dust_map_write(dd, thisblock);
 		spin_unlock_irqrestore(&dd->dust_lock, flags);
 	}
 
-	return ret;
+	return r;
 }
 
 static int dust_map(struct dm_target *ti, struct bio *bio)
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

