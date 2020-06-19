Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B77252019AF
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 19:46:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592588812;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EaKhw8raxp9y7DRYpuY6pOA6QvVwtqf6jZvev+cLiXA=;
	b=Ps1z50132stjC6bud6b9UAFhsT6lYL8xqEVwt8UFB8HRLaGGCvggdfrM/0vcndIPq7u7WA
	+5fV88fVYuUHgTm+SemYGuhJz4SqhOKvyHksxO8D2u8VMHVweR/Jy7QnGeC3gBDMRx0L4F
	gjqsGAOWKFnT2z8XNWs6E+lpbo0IDxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-IITwjDXZOKGgbc_h2xK0QA-1; Fri, 19 Jun 2020 13:46:50 -0400
X-MC-Unique: IITwjDXZOKGgbc_h2xK0QA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AED4F835B46;
	Fri, 19 Jun 2020 17:46:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EF1A71677;
	Fri, 19 Jun 2020 17:46:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0466B833BD;
	Fri, 19 Jun 2020 17:46:39 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JHhEOm005391 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 13:43:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 75AF85BAC9; Fri, 19 Jun 2020 17:43:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C5025EE0E;
	Fri, 19 Jun 2020 17:43:08 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 13:43:04 -0400
Message-Id: <1592588584-25942-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH] dm dust: add __func__ to queryblocks and
	clearbadblocks DMEMIT calls
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index 2ad8fc9293e0..e08f955dfe7b 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -148,9 +148,9 @@ static int dust_query_block(struct dust_device *dd, unsigned long long block, ch
 	spin_lock_irqsave(&dd->dust_lock, flags);
 	bblock = dust_rb_search(&dd->badblocklist, block);
 	if (bblock != NULL)
-		DMEMIT("block %llu found in badblocklist", block);
+		DMEMIT("%s: block %llu found in badblocklist", __func__, block);
 	else
-		DMEMIT("block %llu not found in badblocklist", block);
+		DMEMIT("%s: block %llu not found in badblocklist", __func__, block);
 	spin_unlock_irqrestore(&dd->dust_lock, flags);
 
 	return 1;
@@ -277,9 +277,9 @@ static int dust_clear_badblocks(struct dust_device *dd, char *result, unsigned i
 	spin_unlock_irqrestore(&dd->dust_lock, flags);
 
 	if (!__dust_clear_badblocks(&badblocklist, badblock_count))
-		DMEMIT("no badblocks found");
+		DMEMIT("%s: no badblocks found", __func__);
 	else
-		DMEMIT("badblocks cleared");
+		DMEMIT("%s: badblocks cleared", __func__);
 
 	return 1;
 }
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

