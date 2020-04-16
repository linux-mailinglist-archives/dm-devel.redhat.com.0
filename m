Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 671CB1AD662
	for <lists+dm-devel@lfdr.de>; Fri, 17 Apr 2020 08:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1587105859;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G2fPXyaICOhi/gXCO82ChyO7pU2sdx+zpVCDNqB3LBQ=;
	b=TG3QAi+oeMx0fdGPA9WJrmVBUH69OyxIiFRJBkB29OQqBZk7wW0eWv2YS/aRmxwAwOFxvV
	JLZA5F7ZGZeaLuCnulT1VsqaD204ArVODML1hU+DKki+MPiKBx1pAesyu5C0FPNGkLGjl3
	1XVTdkq25RI0hmxH/4ygdUjmGjQ0fsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-HywKgAVQOvW9_IdtPWNSNg-1; Fri, 17 Apr 2020 02:44:16 -0400
X-MC-Unique: HywKgAVQOvW9_IdtPWNSNg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 456ED1084424;
	Fri, 17 Apr 2020 06:44:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3A3319757;
	Fri, 17 Apr 2020 06:44:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1620E934FB;
	Fri, 17 Apr 2020 06:44:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 03GLDuUC002325 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Apr 2020 17:13:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2F11E2166B28; Thu, 16 Apr 2020 21:13:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AF7C2166B2C
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 21:13:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4246C8007DD
	for <dm-devel@redhat.com>; Thu, 16 Apr 2020 21:13:53 +0000 (UTC)
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
	[46.235.227.227]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-3-ZCdvf9M4Nsu4ommHdEm6Vw-1; Thu, 16 Apr 2020 17:13:48 -0400
X-MC-Unique: ZCdvf9M4Nsu4ommHdEm6Vw-1
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: krisman) with ESMTPSA id C50C02A23DF
From: Gabriel Krisman Bertazi <krisman@collabora.com>
To: agk@redhat.com, snitzer@redhat.com
Date: Thu, 16 Apr 2020 17:13:35 -0400
Message-Id: <20200416211336.2423618-2-krisman@collabora.com>
In-Reply-To: <20200416211336.2423618-1-krisman@collabora.com>
References: <20200416211336.2423618-1-krisman@collabora.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 03GLDuUC002325
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 17 Apr 2020 02:43:50 -0400
Cc: linux-kernel@vger.kernel.org, khazhy@google.com, song@kernel.org,
	dm-devel@redhat.com, kernel@collabora.com,
	Gabriel Krisman Bertazi <krisman@collabora.com>
Subject: [dm-devel] [PATCH 1/2] md: Expose struct request to path selector
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Khazhismel Kumykov <khazhy@google.com>

This allows a path selector to access metadata such as request start and
end time.  nr_bytes is retained for end_io, as blk_rq_bytes represents
the number of bytes *left* in a request, and is 0 after a request is
finished.

Signed-off-by: Khazhismel Kumykov <khazhy@google.com>
Co-developed-by: Gabriel Krisman Bertazi <krisman@collabora.com>
Signed-off-by: Gabriel Krisman Bertazi <krisman@collabora.com>
---
 drivers/md/dm-mpath.c         | 12 ++++++++++--
 drivers/md/dm-path-selector.h |  6 ++++++
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-mpath.c b/drivers/md/dm-mpath.c
index 2bc18c9c3abc..0cdd3a939d41 100644
--- a/drivers/md/dm-mpath.c
+++ b/drivers/md/dm-mpath.c
@@ -546,7 +546,12 @@ static int multipath_clone_and_map(struct dm_target *ti, struct request *rq,
 	clone->cmd_flags |= REQ_FAILFAST_TRANSPORT;
 	*__clone = clone;
 
-	if (pgpath->pg->ps.type->start_io)
+	if (pgpath->pg->ps.type->start_io_rq)
+		pgpath->pg->ps.type->start_io_rq(&pgpath->pg->ps,
+					      &pgpath->path,
+					      clone ?: rq,
+					      nr_bytes);
+	else if (pgpath->pg->ps.type->start_io)
 		pgpath->pg->ps.type->start_io(&pgpath->pg->ps,
 					      &pgpath->path,
 					      nr_bytes);
@@ -1614,7 +1619,10 @@ static int multipath_end_io(struct dm_target *ti, struct request *clone,
 	if (pgpath) {
 		struct path_selector *ps = &pgpath->pg->ps;
 
-		if (ps->type->end_io)
+		if (ps->type->end_io_rq)
+			ps->type->end_io_rq(ps, &pgpath->path,
+					 clone, mpio->nr_bytes);
+		else if (ps->type->end_io)
 			ps->type->end_io(ps, &pgpath->path, mpio->nr_bytes);
 	}
 
diff --git a/drivers/md/dm-path-selector.h b/drivers/md/dm-path-selector.h
index b6eb5365b1a4..98b6c9d4e21f 100644
--- a/drivers/md/dm-path-selector.h
+++ b/drivers/md/dm-path-selector.h
@@ -12,6 +12,7 @@
 #ifndef	DM_PATH_SELECTOR_H
 #define	DM_PATH_SELECTOR_H
 
+#include <linux/blkdev.h>
 #include <linux/device-mapper.h>
 
 #include "dm-mpath.h"
@@ -75,6 +76,11 @@ struct path_selector_type {
 			 size_t nr_bytes);
 	int (*end_io) (struct path_selector *ps, struct dm_path *path,
 		       size_t nr_bytes);
+
+	int (*start_io_rq)(struct path_selector *ps, struct dm_path *path,
+			   const struct request *rq, size_t nr_bytes);
+	int (*end_io_rq)(struct path_selector *ps, struct dm_path *path,
+			 const struct request *rq, size_t nr_bytes);
 };
 
 /* Register a path selector */
-- 
2.26.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

