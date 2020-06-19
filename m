Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 73A3C2008DB
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570364;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=t510zDM39bvRGXMcbEXaaSX2t1AXKgcTkyrRa2bsz94=;
	b=Qz7x31t9Uhe7LV0NQD6sg2c8kk39xTt8uRsALVMFdno5ris2d1FmmyfSPw5WLzO8J3QPIY
	SJhE6H/gDrn6G/E4js6bvOUqpd/HKw6B7zFpYGwwN76Ios29H/BFCaSGuBMVegEQGkFhPg
	gO8h+E0e6Hu3LBckhsY89NhxKdfmMjw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-F_HvzaM_OKm0s-G29VBttg-1; Fri, 19 Jun 2020 08:39:21 -0400
X-MC-Unique: F_HvzaM_OKm0s-G29VBttg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 750C7835B5D;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EAAD60BF4;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 03DCE1809563;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05JCbDI9027939 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 19 Jun 2020 08:37:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D6F4120267F2; Fri, 19 Jun 2020 12:37:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D27B22026D67
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD02F85A5B1
	for <dm-devel@redhat.com>; Fri, 19 Jun 2020 12:37:10 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-111-m1K6iqKsNK6Gn1tR8edPyg-1; Fri, 19 Jun 2020 08:37:06 -0400
X-MC-Unique: m1K6iqKsNK6Gn1tR8edPyg-1
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id C49D843E98CED32B0845;
	Fri, 19 Jun 2020 20:36:59 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server
	id 14.3.487.0; Fri, 19 Jun 2020 20:36:53 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Fri, 19 Jun 2020 20:38:02 +0800
Message-ID: <20200619123803.1441373-4-yangerkun@huawei.com>
In-Reply-To: <20200619123803.1441373-1-yangerkun@huawei.com>
References: <20200619123803.1441373-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05JCbDI9027939
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v3 3/4] dm dust: add interface to list all
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This interface may help anyone who want to know all badblocks without
query block for each.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/md/dm-dust.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index a0c75c104de0..2ad8fc9293e0 100644
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
+		DMEMIT("null");
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

