Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B829270D825
	for <lists+dm-devel@lfdr.de>; Tue, 23 May 2023 11:00:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684832404;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CHosrflB0KbKY5rJL5BEi6htXpCKycI79gTEkVMAWsM=;
	b=hT+5mAKyMUjE5CIxSgBwIw9yanfUPvj3xjN91JCVcGeBCdrKqPiVO1uARPjkLtWHRYB7Gs
	QyHpWQComMzhgXqwB4aDvGPBvNGiqDL1h/8kBi5bRaCJOgCqtfqkWrj96HsrLBVV0gWgT4
	jIjkdmYFhjUFaAHJgXLRNL3JzrXbTCE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-a3AyqaKdPZ--OHHJv7QkHA-1; Tue, 23 May 2023 04:59:59 -0400
X-MC-Unique: a3AyqaKdPZ--OHHJv7QkHA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BED5929ABA1C;
	Tue, 23 May 2023 08:59:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A27062166B25;
	Tue, 23 May 2023 08:59:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4BE1319465B9;
	Tue, 23 May 2023 08:59:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 89B101946595
 for <dm-devel@listman.corp.redhat.com>; Tue, 23 May 2023 08:59:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 69F11492B00; Tue, 23 May 2023 08:59:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast07.extmail.prod.ext.rdu2.redhat.com [10.11.55.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 61898482060
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:59:54 +0000 (UTC)
Received: from us-smtp-inbound-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 469223C17C6E
 for <dm-devel@redhat.com>; Tue, 23 May 2023 08:59:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-5OgvlyN0PKmh_6lgpR1xgA-1; Tue, 23 May 2023 04:59:52 -0400
X-MC-Unique: 5OgvlyN0PKmh_6lgpR1xgA-1
Received: from [2001:4bb8:188:23b2:6ade:85c9:530f:6eb0] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1q1Mim-009GvU-0T; Tue, 23 May 2023 07:46:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 23 May 2023 09:45:25 +0200
Message-Id: <20230523074535.249802-15-hch@lst.de>
In-Reply-To: <20230523074535.249802-1-hch@lst.de>
References: <20230523074535.249802-1-hch@lst.de>
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Subject: [dm-devel] [PATCH 14/24] init: clear root_wait on all invalid root=
 strings
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
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 Joern Engel <joern@lazybastard.org>, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, Mike Snitzer <snitzer@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-mtd@lists.infradead.org
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of only clearing root_wait in devt_from_partuuid when the UUID
format was invalid, do that in parse_root_device for all strings that
failed to parse.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 init/do_mounts.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/init/do_mounts.c b/init/do_mounts.c
index f1953aeb321978..0b36a5f39ee8e2 100644
--- a/init/do_mounts.c
+++ b/init/do_mounts.c
@@ -112,14 +112,14 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
 
 		/* Explicitly fail on poor PARTUUID syntax. */
 		if (sscanf(slash + 1, "PARTNROFF=%d%c", &offset, &c) != 1)
-			goto clear_root_wait;
+			goto out_invalid;
 		cmp.len = slash - uuid_str;
 	} else {
 		cmp.len = strlen(uuid_str);
 	}
 
 	if (!cmp.len)
-		goto clear_root_wait;
+		goto out_invalid;
 
 	dev = class_find_device(&block_class, NULL, &cmp, &match_dev_by_uuid);
 	if (!dev)
@@ -139,12 +139,9 @@ static int devt_from_partuuid(const char *uuid_str, dev_t *devt)
 	put_device(dev);
 	return 0;
 
-clear_root_wait:
+out_invalid:
 	pr_err("VFS: PARTUUID= is invalid.\n"
 	       "Expected PARTUUID=<valid-uuid-id>[/PARTNROFF=%%d]\n");
-	if (root_wait)
-		pr_err("Disabling rootwait; root= is invalid.\n");
-	root_wait = 0;
 	return -EINVAL;
 }
 
@@ -611,6 +608,7 @@ static void __init wait_for_root(char *root_device_name)
 
 static dev_t __init parse_root_device(char *root_device_name)
 {
+	int error;
 	dev_t dev;
 
 	if (!strncmp(root_device_name, "mtd", 3) ||
@@ -623,8 +621,14 @@ static dev_t __init parse_root_device(char *root_device_name)
 	if (strcmp(root_device_name, "/dev/ram") == 0)
 		return Root_RAM0;
 
-	if (early_lookup_bdev(root_device_name, &dev))
+	error = early_lookup_bdev(root_device_name, &dev);
+	if (error) {
+		if (error == -EINVAL && root_wait) {
+			pr_err("Disabling rootwait; root= is invalid.\n");
+			root_wait = 0;
+		}
 		return 0;
+	}
 	return dev;
 }
 
-- 
2.39.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

