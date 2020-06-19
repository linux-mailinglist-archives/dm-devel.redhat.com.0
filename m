Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 36A4B201CF4
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 23:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592601188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VsltEaMOsuVLJw7+lJMMkGewDzr+7px14nkfd6Dpte4=;
	b=MpMMwhWBu0/fY5gtnJOnAO4LU0u/DxpjiYNFwuBdwriCWjXq/LWu+uvu9+lxQhIRtzS0Bb
	pWfGpaUBZPB/+n0qIPciZ1a8KDbP0C2BYG4/b1TCocfe2u0++BWE0Mf+S5ZBMWMxHSYku6
	rU73ysHW3QzrY0TQRKEmiugtMA31/Z8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-7Ed1k4X8PMiwSaF1DZwaGg-1; Fri, 19 Jun 2020 17:13:05 -0400
X-MC-Unique: 7Ed1k4X8PMiwSaF1DZwaGg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53EA010059A1;
	Fri, 19 Jun 2020 21:13:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B5A419C4F;
	Fri, 19 Jun 2020 21:13:00 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C1506833C9;
	Fri, 19 Jun 2020 21:12:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JLCuIk006307 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 17:12:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5BD2319934; Fri, 19 Jun 2020 21:12:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from bgurney.remote.csb (ovpn-115-194.rdu2.redhat.com
	[10.10.115.194])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CCD119C4F;
	Fri, 19 Jun 2020 21:12:49 +0000 (UTC)
From: Bryan Gurney <bgurney@redhat.com>
To: dm-devel@redhat.com, snitzer@redhat.com, agk@redhat.com
Date: Fri, 19 Jun 2020 17:12:42 -0400
Message-Id: <1592601162-4107-1-git-send-email-bgurney@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: yangerkun <yangerkun@huawei.com>, Bryan Gurney <bgurney@redhat.com>
Subject: [dm-devel] [PATCH v4 3/4] dm dust: add interface to list all
	badblocks
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: yangerkun <yangerkun@huawei.com>

From: yangerkun <yangerkun@huawei.com>

This interface may help anyone who want to know all badblocks without
query block for each.

[Bryan: DMEMIT an empty list if no blocks are in the bad block list.]

Signed-off-by: yangerkun <yangerkun@huawei.com>
Signed-off-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index f1f2dd6a4e84..f7be00a54268 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -284,6 +284,31 @@ static int dust_clear_badblocks(struct dust_device *dd, char *result, unsigned i
 	return 1;
 }
 
+static int dust_list_badblocks(struct dust_device *dd, char *result, unsigned int maxlen,
+				unsigned int *sz_ptr)
+{
+	unsigned long flags;
+	struct rb_root badblocklist;
+	struct rb_node *node;
+	struct badblock *bblk;
+	unsigned int sz = *sz_ptr;
+	unsigned long long num = 0;
+
+	spin_lock_irqsave(&dd->dust_lock, flags);
+	badblocklist = dd->badblocklist;
+	for (node = rb_first(&badblocklist); node; node = rb_next(node)) {
+		bblk = rb_entry(node, struct badblock, node);
+		DMEMIT("%llu\n", bblk->bb);
+		num++;
+	}
+
+	spin_unlock_irqrestore(&dd->dust_lock, flags);
+	if (!num)
+		DMEMIT("");
+
+	return 1;
+}
+
 /*
  * Target parameters:
  *
@@ -427,6 +452,8 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 			else
 				dd->quiet_mode = false;
 			r = 0;
+		} else if (!strcasecmp(argv[0], "listbadblocks")) {
+			r = dust_list_badblocks(dd, result, maxlen, &sz);
 		} else {
 			invalid_msg = true;
 		}
-- 
2.25.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

