Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 55C782008D6
	for <lists+dm-devel@lfdr.de>; Fri, 19 Jun 2020 14:39:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592570362;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=kM9fAuRlhWWpL0soZeBRfotAojLrNl1nf1gWpoyP+xE=;
	b=Z2s5TIoFXIFi7zb5pOrc9O0ZxBcnoUiRe541LZpJUfAe9xo2KZlkCAnSLt4mUbgS0JpuJq
	3t2dhc9nnSJ4j3j+Abg2NAsCI9SPwEJMj1p/CQCl5FCsdsaWbwcB69QuFTtsGT4JSvNiod
	2XKOZdNo8fW7slwdjGiuw1mZdHxaiBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-joYwFwwoNTO60noSwDNwEw-1; Fri, 19 Jun 2020 08:39:19 -0400
X-MC-Unique: joYwFwwoNTO60noSwDNwEw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4838D18A8233;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2528C5C1D0;
	Fri, 19 Jun 2020 12:39:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BCB321809561;
	Fri, 19 Jun 2020 12:39:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I95XQV029492 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Jun 2020 05:05:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DC44F11921A5; Thu, 18 Jun 2020 09:05:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D727D11921A7
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D89E48007A4
	for <dm-devel@redhat.com>; Thu, 18 Jun 2020 09:05:30 +0000 (UTC)
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-430-HltVY57zN9qhxPhcLfOuzA-1; Thu, 18 Jun 2020 05:05:23 -0400
X-MC-Unique: HltVY57zN9qhxPhcLfOuzA-1
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
	by Forcepoint Email with ESMTP id 9EB5596EC8DAF21BE5C3;
	Thu, 18 Jun 2020 17:05:19 +0800 (CST)
Received: from code-website.localdomain (10.175.127.227) by
	DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server
	id 14.3.487.0; Thu, 18 Jun 2020 17:05:09 +0800
From: yangerkun <yangerkun@huawei.com>
To: <snitzer@redhat.com>, <bgurney@redhat.com>, <agk@redhat.com>,
	<bmr@redhat.com>
Date: Thu, 18 Jun 2020 17:06:19 +0800
Message-ID: <20200618090620.3517530-2-yangerkun@huawei.com>
In-Reply-To: <20200618090620.3517530-1-yangerkun@huawei.com>
References: <20200618090620.3517530-1-yangerkun@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 05I95XQV029492
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 19 Jun 2020 08:38:54 -0400
Cc: dm-devel@redhat.com, yangerkun@huawei.com
Subject: [dm-devel] [PATCH v2 1/2] dm dust: list badblock in dust_status
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

List all bad blocks may help user check the status of dust. We add this
logical in dust_status, which will return result to user directly.

Signed-off-by: yangerkun <yangerkun@huawei.com>
---
 drivers/md/dm-dust.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/md/dm-dust.c b/drivers/md/dm-dust.c
index ff03b90072c5..f96adb240adc 100644
--- a/drivers/md/dm-dust.c
+++ b/drivers/md/dm-dust.c
@@ -478,6 +478,30 @@ static int dust_message(struct dm_target *ti, unsigned int argc, char **argv,
 	return r;
 }
 
+static void dust_list_badblocks(struct dust_device *dd, char *result, unsigned int maxlen,
+				unsigned int *sz_ptr)
+{
+	unsigned long flags;
+	struct rb_root badblocklist;
+	struct rb_node *node;
+	struct badblock *bblk;
+	unsigned int sz = *sz_ptr;
+	int num = 0;
+
+	DMEMIT(" badblocks list:");
+	spin_lock_irqsave(&dd->dust_lock, flags);
+	badblocklist = dd->badblocklist;
+	for (node = rb_first(&badblocklist); node; node = rb_next(node)) {
+		bblk = rb_entry(node, struct badblock, node);
+		DMEMIT(" %llu", bblk->bb);
+		num++;
+	}
+
+	spin_unlock_irqrestore(&dd->dust_lock, flags);
+	if (!num)
+		DMEMIT(" null");
+}
+
 static void dust_status(struct dm_target *ti, status_type_t type,
 			unsigned int status_flags, char *result, unsigned int maxlen)
 {
@@ -489,6 +513,7 @@ static void dust_status(struct dm_target *ti, status_type_t type,
 		DMEMIT("%s %s %s", dd->dev->name,
 		       dd->fail_read_on_bb ? "fail_read_on_bad_block" : "bypass",
 		       dd->quiet_mode ? "quiet" : "verbose");
+		dust_list_badblocks(dd, result, maxlen, &sz);
 		break;
 
 	case STATUSTYPE_TABLE:
-- 
2.25.4


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

