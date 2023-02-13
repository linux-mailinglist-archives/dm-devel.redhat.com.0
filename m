Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5F369519F
	for <lists+dm-devel@lfdr.de>; Mon, 13 Feb 2023 21:15:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1676319338;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Eaa7njgmQhT6M3yYS8pU9r3aGneahx/GYM8UTzBcT2Y=;
	b=BuSFGiOMFWnfG99WnzBpASjNtEzwgARr8iOCIZaIIDDdbgC36wnEizgpoDOluW8zwZHdUZ
	GzjWLkiUcNULOZ7GaHPeKiNCsXv4/Dfa8Uh26zF86r+WZdiGFDsJauiBx3Vf0r8wBNCff8
	Su7pHMSFuYPocG/zAsjZmz5UadcXeeU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-569-v6xDrphHMZWzPQew42cAMw-1; Mon, 13 Feb 2023 15:15:34 -0500
X-MC-Unique: v6xDrphHMZWzPQew42cAMw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 135C310AF7D0;
	Mon, 13 Feb 2023 20:15:19 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F1550492B04;
	Mon, 13 Feb 2023 20:15:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E531F194658F;
	Mon, 13 Feb 2023 20:15:18 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 66E0B1946586
 for <dm-devel@listman.corp.redhat.com>; Mon, 13 Feb 2023 20:15:17 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 4BC3C140EBF4; Mon, 13 Feb 2023 20:15:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 44972140EBF6
 for <dm-devel@redhat.com>; Mon, 13 Feb 2023 20:15:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2A8C71C06EC8
 for <dm-devel@redhat.com>; Mon, 13 Feb 2023 20:15:15 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com
 [209.85.160.179]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-572-Id0dkQ1hOkCkxg5a9Gd_3w-1; Mon, 13 Feb 2023 15:15:13 -0500
X-MC-Unique: Id0dkQ1hOkCkxg5a9Gd_3w-1
Received: by mail-qt1-f179.google.com with SMTP id w3so15181570qts.7
 for <dm-devel@redhat.com>; Mon, 13 Feb 2023 12:15:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=If/RbXbAnwJCisYL2ZmF3j8lLm0zoAHbJl38oUt3GBg=;
 b=Y1uCnqRO96GU3AwzI1ktT06kmUfkvrd1u1xaem9DLu5wWAIkqcCy+nR85ODnQBIShP
 xVee87Jeanjv8zfppB7CPxszjS02dBYuDgsCmymvE+I+h+JIef7m7w+en4GIQC7sRsoU
 WbK4IjrZldyUIg2xtZzUSFEQoZJ8FQQjThA9HxDAyaFEfHYY1kKU6i+8nymJtqDYbAe7
 jDAyePTG8UjaV4VzPUEGSrP/MpJKuwvY04PyhWD2c1fVKiFg1Tf1O36e2b6RkhOczxig
 kBzTFxE4yRw8kpudVbJLpPlwjeqKH+UcasqL4mOMZYqN5AFrb93Y6MtAaJklr5MPv0/O
 TQAg==
X-Gm-Message-State: AO0yUKUPcM3bgI3SSMO8RV1Z5jUtqKhsezGhTDg+NvSrENt1aXYQK7jE
 IZgM8uDLJ5Hnlpo3Jvd0zI0v/q6poC5fmhnunYkt/1m96rbyu0SDNXuw0empGkPgIb22aUsPCso
 mFmuKSZu6MlUPl08B1AJrczNYT6pjfynRtvMoqWPSmOOic2TxvmVbbFOCDpWDsfrDrXiP2w==
X-Google-Smtp-Source: AK7set/TqUzkcn0fikBVTpb1Zvn+ZZaIRuIBxJhTsfyhwlRBfUGSOEIXjml1bBFSmLkGNlI8obdf5g==
X-Received: by 2002:ac8:7dc7:0:b0:3ba:1113:751a with SMTP id
 c7-20020ac87dc7000000b003ba1113751amr44278721qte.67.1676319312224; 
 Mon, 13 Feb 2023 12:15:12 -0800 (PST)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net.
 [68.160.166.30]) by smtp.gmail.com with ESMTPSA id
 d19-20020ac86153000000b003ba2a15f93dsm9887491qtm.26.2023.02.13.12.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 12:15:11 -0800 (PST)
From: Mike Snitzer <snitzer@kernel.org>
To: dm-devel@redhat.com
Date: Mon, 13 Feb 2023 15:13:49 -0500
Message-Id: <20230213201401.45973-28-snitzer@kernel.org>
In-Reply-To: <20230213201401.45973-1-snitzer@kernel.org>
References: <20230213201401.45973-1-snitzer@kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 27/39] dm: avoid inline filenames
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
Cc: ebiggers@kernel.org, Heinz Mauelshagen <heinzm@redhat.com>,
 Mike Snitzer <snitzer@kernel.org>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Heinz Mauelshagen <heinzm@redhat.com>

Signed-off-by: Heinz Mauelshagen <heinzm@redhat.com>
Signed-off-by: Mike Snitzer <snitzer@kernel.org>
---
 drivers/md/dm-ima.c  | 3 +--
 drivers/md/dm-ima.h  | 3 +--
 drivers/md/dm-init.c | 1 -
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/md/dm-ima.c b/drivers/md/dm-ima.c
index a1bd7cd52b1b..acfb7a7d83cb 100644
--- a/drivers/md/dm-ima.c
+++ b/drivers/md/dm-ima.c
@@ -4,8 +4,7 @@
  *
  * Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
  *
- * File: dm-ima.c
- *       Enables IMA measurements for DM targets
+ * Enables IMA measurements for DM targets
  */
 
 #include "dm-core.h"
diff --git a/drivers/md/dm-ima.h b/drivers/md/dm-ima.h
index e6e9c075dcc9..d819e64031a8 100644
--- a/drivers/md/dm-ima.h
+++ b/drivers/md/dm-ima.h
@@ -4,8 +4,7 @@
  *
  * Author: Tushar Sugandhi <tusharsu@linux.microsoft.com>
  *
- * File: dm-ima.h
- *       Header file for device mapper IMA measurements.
+ * Header file for device mapper IMA measurements.
  */
 
 #ifndef DM_IMA_H
diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index 52362453ab58..42227ca3abe2 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -1,6 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * dm-init.c
  * Copyright (C) 2017 The Chromium OS Authors <chromium-os-dev@chromium.org>
  *
  * This file is released under the GPLv2.
-- 
2.37.0 (Apple Git-136)

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

