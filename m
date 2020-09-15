Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7D00826AA79
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 19:24:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600190674;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5lfHneloTlqUw3fe0nrXEVzNVCnLRFKSUIUAoVID4sI=;
	b=XFyUf3ltsksIyPiYSXtlyhX07eGpuZ1c+iHb88bkiYYBTjlA9rk4028Hq7O7isqQuRbKVW
	O7CxsRM4EiI70wtW8k8cRUYxmF9SrJHsxe9T7UeKE0fNp9HfKGgHlMyrfdV0UBGIRoX6TU
	CC+Gj8AqHHNgIdjINBIO3tpY/S2dVAs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-329-47-Iv48eMjO92Qsx8nOUAA-1; Tue, 15 Sep 2020 13:24:31 -0400
X-MC-Unique: 47-Iv48eMjO92Qsx8nOUAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B06F410BBECB;
	Tue, 15 Sep 2020 17:24:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B4A878801;
	Tue, 15 Sep 2020 17:24:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 47BA2183D021;
	Tue, 15 Sep 2020 17:24:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FHOA2S003158 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 13:24:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 259D3200A4F3; Tue, 15 Sep 2020 17:24:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CC6920244F7
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:07 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE154101A540
	for <dm-devel@redhat.com>; Tue, 15 Sep 2020 17:24:07 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-326-_h5yJLx-M2-w3d_ZqpFdTQ-1; Tue, 15 Sep 2020 13:24:03 -0400
X-MC-Unique: _h5yJLx-M2-w3d_ZqpFdTQ-1
Received: by mail-qk1-f195.google.com with SMTP id d20so5061903qka.5;
	Tue, 15 Sep 2020 10:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=dqwxkVTd5/jHYQSEXF8VtnLj+gaZ69idekW/tSuak/4=;
	b=YU+TBHcUEXlJGqDEY1JcLNrRW9i0Z/MG5TOPKhgzCOc5qellCyEfQCTuapSlwokFSu
	w56iW2+jToKMYHtgrnIIvjvgwJL8KOcTmEsh5I8zXxRk3amVXwKTwOGiJ087O2cfLehk
	L69Ox+QrTCdl4Weq0K7cFwO9JxPH6Zs3MS4qEETCUg8/5sTMBiF9OEHcFEpzTq1u++Ab
	yfU1t8eCs54zZg+fJQ9sjBf/YqDwuOLFwJ76ryh7HzArhQuo/fpkbVce/KD0EIi7xBrM
	Q7CfjQpt/b7RCdUQew4N6nWYmEfw02w7NGVlbMi+z5nAAyUy5DP8bHuQjVylSa4SvJ3x
	R9Mw==
X-Gm-Message-State: AOAM532gwFUK8MegnMabd0sRbgIb43MWzgRUBZF0UEs90DrrEq9z5oYb
	PJWgayq+p/t+GL5wHrqTS2M=
X-Google-Smtp-Source: ABdhPJxiR4Ue6DgxQjUkZ0Cqffe6uNtsKfw0d7romunYOFP/MQ/XemUbad9vhcfTDChNaw/ffFS7Ng==
X-Received: by 2002:a05:620a:34c:: with SMTP id
	t12mr18171543qkm.431.1600190642969; 
	Tue, 15 Sep 2020 10:24:02 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	d9sm18088289qtg.51.2020.09.15.10.24.02
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 15 Sep 2020 10:24:02 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Tue, 15 Sep 2020 13:23:56 -0400
Message-Id: <20200915172357.83215-4-snitzer@redhat.com>
In-Reply-To: <20200915172357.83215-1-snitzer@redhat.com>
References: <20200915172357.83215-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v2 3/4] dm table: stack 'chunk_sectors' limit to
	account for target-specific splitting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If target set ti->max_io_len it must be used when stacking
DM device's queue_limits to establish a 'chunk_sectors' that is
compatible with the IO stack.

By using lcm_not_zero() care is taken to avoid blindly overriding the
chunk_sectors limit stacked up by blk_stack_limits().

Signed-off-by: Mike Snitzer <snitzer@redhat.com>
---
 drivers/md/dm-table.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 5edc3079e7c1..248c5a1074a7 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -18,6 +18,7 @@
 #include <linux/mutex.h>
 #include <linux/delay.h>
 #include <linux/atomic.h>
+#include <linux/lcm.h>
 #include <linux/blk-mq.h>
 #include <linux/mount.h>
 #include <linux/dax.h>
@@ -1502,6 +1503,10 @@ int dm_calculate_queue_limits(struct dm_table *table,
 			zone_sectors = ti_limits.chunk_sectors;
 		}
 
+		/* Stack chunk_sectors if target-specific splitting is required */
+		if (ti->max_io_len)
+			ti_limits.chunk_sectors = lcm_not_zero(ti->max_io_len,
+							       ti_limits.chunk_sectors);
 		/* Set I/O hints portion of queue limits */
 		if (ti->type->io_hints)
 			ti->type->io_hints(ti, &ti_limits);
-- 
2.15.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

