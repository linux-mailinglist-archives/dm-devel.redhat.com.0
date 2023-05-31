Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BCF718106
	for <lists+dm-devel@lfdr.de>; Wed, 31 May 2023 15:07:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685538459;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dRWoqiCS7k6LBZxPO+TNJweHv7fl2VkGUBkKsSn/qZs=;
	b=EMdSM+QTQhnVKmCKbQt5fdboh9WCX/1dRoWR4YKaudabAP5Bqc31oxrrEqLaR68cisYWpl
	ZJuiOnRB8+hyVDwZ1dCPqDz99FTUUXupnYXQdRSNOctzhOVTG2hw/5kizg93Z50P+69O63
	CAgCZQ4Tmfmvl6zywFpGxtAFmRTRTvo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-vCNgsYe0M3OOEBhd-_EEKQ-1; Wed, 31 May 2023 09:07:37 -0400
X-MC-Unique: vCNgsYe0M3OOEBhd-_EEKQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07A391019C87;
	Wed, 31 May 2023 13:07:34 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E675440C6EC4;
	Wed, 31 May 2023 13:07:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id A64A619451C8;
	Wed, 31 May 2023 13:07:16 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 703CC1946595
 for <dm-devel@listman.corp.redhat.com>; Wed, 31 May 2023 12:57:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 52B8040CFD45; Wed, 31 May 2023 12:57:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B86840CFD46
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:57:34 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 30C96101B041
 for <dm-devel@redhat.com>; Wed, 31 May 2023 12:57:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-FyOUiOHJPCWOO4FRJFB1yQ-1; Wed, 31 May 2023 08:57:32 -0400
X-MC-Unique: FyOUiOHJPCWOO4FRJFB1yQ-1
Received: from [2001:4bb8:182:6d06:2e49:a56:513a:92ee] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q4LOF-00HS45-0A; Wed, 31 May 2023 12:57:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Wed, 31 May 2023 14:55:32 +0200
Message-Id: <20230531125535.676098-22-hch@lst.de>
In-Reply-To: <20230531125535.676098-1-hch@lst.de>
References: <20230531125535.676098-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Subject: [dm-devel] [PATCH 21/24] PM: hibernate: don't use early_lookup_bdev
 in resume_store
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Loic Poulain <loic.poulain@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

resume_store is a sysfs attribute written during normal kernel runtime,
and it should not use the early_lookup_bdev API that bypasses all normal
path based permission checking, and might cause problems with certain
container environments renaming devices.

Switch to lookup_bdev, which does a normal path lookup instead, and fall
back to trying to parse a numeric dev_t just like early_lookup_bdev did.

Note that this strictly speaking changes the kernel ABI as the PARTUUID=
and PARTLABEL= style syntax is now not available during a running
systems.  They never were intended for that, but this breaks things
we'll have to figure out a way to make them available again.  But if
avoidable in any way I'd rather avoid that.

Fixes: 421a5fa1a6cf ("PM / hibernate: use name_to_dev_t to parse resume")
Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Rafael J. Wysocki <rafael@kernel.org>
---
 kernel/power/hibernate.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index c52dedb9f7c8e8..7ae95ec72f9902 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -1178,7 +1178,23 @@ static ssize_t resume_store(struct kobject *kobj, struct kobj_attribute *attr,
 	if (!name)
 		return -ENOMEM;
 
-	error = early_lookup_bdev(name, &dev);
+	error = lookup_bdev(name, &dev);
+	if (error) {
+		unsigned maj, min, offset;
+		char *p, dummy;
+
+		if (sscanf(name, "%u:%u%c", &maj, &min, &dummy) == 2 ||
+		    sscanf(name, "%u:%u:%u:%c", &maj, &min, &offset,
+				&dummy) == 3) {
+			dev = MKDEV(maj, min);
+			if (maj != MAJOR(dev) || min != MINOR(dev))
+				error = -EINVAL;
+		} else {
+			dev = new_decode_dev(simple_strtoul(name, &p, 16));
+			if (*p)
+				error = -EINVAL;
+		}
+	}
 	kfree(name);
 	if (error)
 		return error;
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

