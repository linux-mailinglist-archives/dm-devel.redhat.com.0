Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 701B61F1889
	for <lists+dm-devel@lfdr.de>; Mon,  8 Jun 2020 14:12:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591618333;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HRH5622GK53ELAhIow7ekeJc4DGC/92q9mGnusjs2NI=;
	b=ci/AMHeuHTFooCKcShx9VasVmFVHzIcIQHjK4nqWe0KOIaJrV7XvOpkJcf/icaz2oMoR4/
	EPMAj7phJaPiikwm4KaLYDsNUFaxj3ljKTGScKUeFlpoLKWNxa+nHBuagL5rdbP18Ma5hM
	vBQ1lNKbUdM+RfwV0rNbDv5ND9RzIJM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-WBxVw2S9PV2VgmejxHfuQQ-1; Mon, 08 Jun 2020 08:12:11 -0400
X-MC-Unique: WBxVw2S9PV2VgmejxHfuQQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1517010C2E15;
	Mon,  8 Jun 2020 12:11:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E650C7BA09;
	Mon,  8 Jun 2020 12:11:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7215914CF3;
	Mon,  8 Jun 2020 12:11:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0588cXKO019780 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 8 Jun 2020 04:38:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 30C192029F78; Mon,  8 Jun 2020 08:38:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CF112029F6F
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 08:38:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8A8928007D9
	for <dm-devel@redhat.com>; Mon,  8 Jun 2020 08:38:30 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-484-F3i0EakaNymIH-Wm3qkMCA-1; Mon, 08 Jun 2020 04:38:27 -0400
X-MC-Unique: F3i0EakaNymIH-Wm3qkMCA-1
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id B99A6F025B8186699B03;
	Mon,  8 Jun 2020 16:38:21 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
	DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 8 Jun 2020 16:38:11 +0800
From: yangerkun <yangerkun@huawei.com>
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>
Date: Mon, 8 Jun 2020 16:45:12 +0800
Message-ID: <20200608084513.115671-2-yangerkun@huawei.com>
In-Reply-To: <20200608084513.115671-1-yangerkun@huawei.com>
References: <20200608084513.115671-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0588cXKO019780
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 08 Jun 2020 08:11:03 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH 1/2] dm dust: add interface to list all badblocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This interface may help anyone want to know all badblocks without query
block one by one.

Signed-off-by: yangerkun <yangerkun@huawei.com>
Reviewed-by: Bryan Gurney <bgurney@redhat.com>
---
 drivers/md/dm-dust.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index ff03b90072c5..da5c10605c59 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -280,6 +280,24 @@ static int dust_clear_badblocks(struct dust_device *dd)
 	return 0;
 }
 
+static void dust_list_badblocks(struct dust_device *dd)
+{
+	unsigned long flags;
+	struct rb_root badblocklist;
+	struct rb_node *node;
+	struct badblock *bblk;
+
+	DMINFO("%s: badblocks list below:", __func__);
+	spin_lock_irqsave(&dd->dust_lock, flags);
+	badblocklist = dd->badblocklist;
+	for (node = rb_first(&badblocklist); node; node = rb_next(node)) {
+		bblk = rb_entry(node, struct badblock, node);
+		DMINFO("bad block: %llu", bblk->bb);
+	}
+	spin_unlock_irqrestore(&dd->dust_lock, flags);
+	DMINFO("%s: badblocks list end.", __func__);
+}
+
 /*
  * Target parameters:
  *
@@ -422,6 +440,9 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 			else
 				dd->quiet_mode = false;
 			r = 0;
+		} else if (!strcasecmp(argv[0], "listbadblocks")) {
+			dust_list_badblocks(dd);
+			r = 0;
 		} else {
 			invalid_msg = true;
 		}
-- 
2.23.0.rc2.8.gff66981f45


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

