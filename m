Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 67A9D1F03CE
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:22:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402951;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=xiSgFkyQv21JK8tJKGaeaRzAh3uQFEu/UyZCyAGdejc=;
	b=ZFUPeV+BeP/vJ/r4RDOLUmH7A/b2d5nJE2Ylo/rTx5tU4i21uStXcCb52vpgsqjlTSBoHe
	TXEWbq8Jv64UBvrhQrz61cHXsyRtWytoShLn6wpvZh57N40F1N3oUH0lDLbA+7kMYfF0Fa
	EyVAZtEMLwU9CsnF1A7VUkw1Htn+Tms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-UMHkMIscOgqd3i-OevFVWQ-1; Fri, 05 Jun 2020 20:22:29 -0400
X-MC-Unique: UMHkMIscOgqd3i-OevFVWQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C839819057A7;
	Sat,  6 Jun 2020 00:22:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A5C115C663;
	Sat,  6 Jun 2020 00:22:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 62BA7B3498;
	Sat,  6 Jun 2020 00:22:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0557mssU006063 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 5 Jun 2020 03:48:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 48F5F2029F6F; Fri,  5 Jun 2020 07:48:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 332942017F02
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEDF6800294
	for <dm-devel@redhat.com>; Fri,  5 Jun 2020 07:48:51 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-389-v0ZoIg67PS-8MRqPHeiGbA-1; Fri, 05 Jun 2020 03:48:49 -0400
X-MC-Unique: v0ZoIg67PS-8MRqPHeiGbA-1
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id 69455CA57FB6EB25590F;
	Fri,  5 Jun 2020 15:32:35 +0800 (CST)
Received: from code-website.localdomain (10.175.104.175) by
	DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 5 Jun 2020 15:32:27 +0800
From: yangerkun <yangerkun@huawei.com>
To: <bgurney@redhat.com>, <agk@redhat.com>, <snitzer@redhat.com>
Date: Fri, 5 Jun 2020 15:32:00 +0800
Message-ID: <20200605073201.1742675-2-yangerkun@huawei.com>
In-Reply-To: <20200605073201.1742675-1-yangerkun@huawei.com>
References: <20200605073201.1742675-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.104.175]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0557mssU006063
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 05 Jun 2020 09:30:21 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [RFC 1/2] dm dust: add interface to list all badblocks
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This interface may help anyone want to know all badblocks without query
block one by one.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/md/dm-dust.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index ff03b90072c5..903c0d158c6e 100644
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
+	DMINFO("%s: badblocks list as below:", __func__);
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
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

