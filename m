Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E65A0362C10
	for <lists+dm-devel@lfdr.de>; Sat, 17 Apr 2021 01:55:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1618617330;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ujhYwXpnU+WXzZam0SORo2DRgzluClacimk7P5DEh5g=;
	b=SFrdxLpagej1iKWgIkcm8w92S2gB6BX2PyrukhuQnoGARRkhhjgBcJggfl1c9xcSNVVeIC
	PCzYmoNRtLVwzNsYhYTbt4xhfhabKSy4rp+XaPX8U3vIWKsN56dsRfKAih/2BtQ+2ybxwe
	zbIxTU1iSCBz3oaQW9qU8C9i/AeEnak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-JgJWXDAlOUSt2JzgKBuXHQ-1; Fri, 16 Apr 2021 19:55:27 -0400
X-MC-Unique: JgJWXDAlOUSt2JzgKBuXHQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F55B6D4EC;
	Fri, 16 Apr 2021 23:55:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0F245D9C0;
	Fri, 16 Apr 2021 23:55:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CEF844A5B;
	Fri, 16 Apr 2021 23:55:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 13GNreJK018879 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Apr 2021 19:53:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 724CB2138BCA; Fri, 16 Apr 2021 23:53:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B27A2138BC6
	for <dm-devel@redhat.com>; Fri, 16 Apr 2021 23:53:34 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 886F7101A52C
	for <dm-devel@redhat.com>; Fri, 16 Apr 2021 23:53:34 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
	[209.85.219.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-118-n_Lg1vW7OMi6wIT3ZE5w7A-1; Fri, 16 Apr 2021 19:53:32 -0400
X-MC-Unique: n_Lg1vW7OMi6wIT3ZE5w7A-1
Received: by mail-qv1-f45.google.com with SMTP id i9so14119134qvo.3;
	Fri, 16 Apr 2021 16:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=TPYpDSq8Mf6GV23A4rg39jSHse9EX5i3mfgaOsbHzoU=;
	b=FuPS9kRXhelkrBZtb5w7+tLvn+hSf713bwMG4ck1MB++uOXN5UFToh6UZ+Wi0X2hLd
	twmPfth0ohnWkxXcmj/xk7ZB+Qq4cDhyDkpCMcfM2wUsTPHUI4/z5KTJKMr12gEs71bp
	x6z7AIw9vII+N+Z9be7qYLmN2klCZahqljbQ4he5+5Km//0E18yO/1p/oe+O1Zf7wkHY
	KsieTqYKFplHfEt7apzkICQez+lMY86mhqrkewekOe+d8N6P0nBVExHJDvS9MsuYuH3K
	S8oqUioWlPoHne6EucrG+tI4iMc+Kv8Mf+XpFQwARfupVidIXUucQgF/7bmvLgRTEgVJ
	vhYw==
X-Gm-Message-State: AOAM532LAdJdLppxbuuYBycTNsjWQa3/6TTZnYqhFNkT01RLCTPzKcfv
	8w0tikad1R3vC7Z1R+oYSXw=
X-Google-Smtp-Source: ABdhPJwbSaN8dqhGfKHuFj1wuJyFMhfU+pYxWICW3qhsOj3SwzeXkdQVt1y3wjQ6z92Mt6gOTZGp7w==
X-Received: by 2002:a05:6214:1470:: with SMTP id
	c16mr11115642qvy.60.1618617212158; 
	Fri, 16 Apr 2021 16:53:32 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	o23sm5037866qtp.55.2021.04.16.16.53.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 16 Apr 2021 16:53:31 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Date: Fri, 16 Apr 2021 19:53:27 -0400
Message-Id: <20210416235329.49234-2-snitzer@redhat.com>
In-Reply-To: <20210416235329.49234-1-snitzer@redhat.com>
References: <20210416235329.49234-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	linux-nvme@lists.infradead.org
Subject: [dm-devel] [PATCH v4 1/3] nvme: return BLK_STS_DO_NOT_RETRY if the
	DNR bit is set
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the DNR bit is set we should not retry the command.

We care about the retryable vs not retryable distinction at the block
layer so propagate the equivalent of the DNR bit by introducing
BLK_STS_DO_NOT_RETRY. Update blk_path_error() to _not_ retry if it
is set.

This change runs with the suggestion made here:
https://lore.kernel.org/linux-nvme/20190813170144.GA10269@lst.de/

Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Mike Snitzer <snitzer@redhat.com>
Reviewed-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Hannes Reinecke <hare@suse.de>
---
 drivers/nvme/host/core.c  | 3 +++
 include/linux/blk_types.h | 8 ++++++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 0896e21642be..540d6fd8ffef 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -237,6 +237,9 @@ static void nvme_delete_ctrl_sync(struct nvme_ctrl *ctrl)
 
 static blk_status_t nvme_error_status(u16 status)
 {
+	if (unlikely(status & NVME_SC_DNR))
+		return BLK_STS_DO_NOT_RETRY;
+
 	switch (status & 0x7ff) {
 	case NVME_SC_SUCCESS:
 		return BLK_STS_OK;
diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
index db026b6ec15a..1ca724948c56 100644
--- a/include/linux/blk_types.h
+++ b/include/linux/blk_types.h
@@ -142,6 +142,13 @@ typedef u8 __bitwise blk_status_t;
  */
 #define BLK_STS_ZONE_ACTIVE_RESOURCE	((__force blk_status_t)16)
 
+/*
+ * BLK_STS_DO_NOT_RETRY is returned from the driver in the completion path
+ * if the device returns a status indicating that if the same command is
+ * re-submitted it is expected to fail.
+ */
+#define BLK_STS_DO_NOT_RETRY	((__force blk_status_t)17)
+
 /**
  * blk_path_error - returns true if error may be path related
  * @error: status the request was completed with
@@ -157,6 +164,7 @@ typedef u8 __bitwise blk_status_t;
 static inline bool blk_path_error(blk_status_t error)
 {
 	switch (error) {
+	case BLK_STS_DO_NOT_RETRY:
 	case BLK_STS_NOTSUPP:
 	case BLK_STS_NOSPC:
 	case BLK_STS_TARGET:
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

