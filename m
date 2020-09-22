Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0D259273899
	for <lists+dm-devel@lfdr.de>; Tue, 22 Sep 2020 04:33:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600742009;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FKR3xstk80tqogR6NEYCKkjHiXbRBuNdPkjr3/jMWnw=;
	b=SYPQDm3jedQRDyFtdGEpxdz4rUD7cNw8T2pAVhr3kmQzGkFwvTQl8XCu724RPzPxcdOAPE
	D2r3TEAE6IfKUixEwAwefj0FDd9BWpb67E5AUZNBE7GCNoeL8yzo5tZnBlt+wwSbIarO7T
	olrFE6DtullaPXT+ZK8+ZRtGuy5Ar4o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-SWwNO-yVO5q9IGLI8c-kKg-1; Mon, 21 Sep 2020 22:33:26 -0400
X-MC-Unique: SWwNO-yVO5q9IGLI8c-kKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C4C07807331;
	Tue, 22 Sep 2020 02:33:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6AF27BC5;
	Tue, 22 Sep 2020 02:33:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F125C8C7CA;
	Tue, 22 Sep 2020 02:33:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08M2XCIF017737 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 22:33:13 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DB52310F8E21; Tue, 22 Sep 2020 02:33:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D5CD110F8E1D
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB49B101A568
	for <dm-devel@redhat.com>; Tue, 22 Sep 2020 02:33:12 +0000 (UTC)
Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com
	[209.85.219.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-158-5IQG9prOMCiKIysQ-OpvHA-1; Mon, 21 Sep 2020 22:33:01 -0400
X-MC-Unique: 5IQG9prOMCiKIysQ-OpvHA-1
Received: by mail-qv1-f66.google.com with SMTP id db4so8745536qvb.4;
	Mon, 21 Sep 2020 19:33:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=f+wJtsaJ4ki6kX0/25dbRuxCZ8RWAvelZliZZZPY1wA=;
	b=DJ58Y/7NuRy9w1MoeT0H07OIMB50iZUcvbeuFwGIWXGGDSZsuBnqRlYPWCaPnupgsZ
	5TNv+1/grxAf2KuXt5oLWYp6ba6hiLhfPZ2kqHiN5ghSXv0KteUdGtJyCKlDOiT52zFs
	GykmuZim261KoLSthxrWUvUcI290DLcpzwJIkOZkCxD8DpcWp2jQ/D/vPXttCQrHKJTC
	PfVQosAoBHtkEQ7PaiQ5yzBlHuQ76sTDbbCX+nfN1GqnosIYnF2xOVeDX6uqPvl6Hb73
	JVfORRRBLmxLNdRYfUdjFR5jNpS/MZuR7IzMdI4Z6ibeaxsr4Ju04G4ccJpHqmz7FNVA
	mWbw==
X-Gm-Message-State: AOAM532PFrHVB9+FgccF2AMNVnPO8qXf5hkG0K08UGaaZY6mi5DFXNWZ
	WqcPztA+0L3MlmeA12taieQotgme93evZQ==
X-Google-Smtp-Source: ABdhPJybaXDHibBnryCpvlu+eGdLlFYEy/iKvGW8mgApZ21WrhLkuUCAuLFUgOC/psmohYQMDaM4ag==
X-Received: by 2002:ad4:500c:: with SMTP id s12mr3583015qvo.7.1600741980589;
	Mon, 21 Sep 2020 19:33:00 -0700 (PDT)
Received: from localhost (pool-68-160-176-52.bstnma.fios.verizon.net.
	[68.160.176.52]) by smtp.gmail.com with ESMTPSA id
	16sm10783248qks.102.2020.09.21.19.32.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 21 Sep 2020 19:32:59 -0700 (PDT)
From: Mike Snitzer <snitzer@redhat.com>
To: Jens Axboe <axboe@kernel.dk>
Date: Mon, 21 Sep 2020 22:32:50 -0400
Message-Id: <20200922023251.47712-6-snitzer@redhat.com>
In-Reply-To: <20200922023251.47712-1-snitzer@redhat.com>
References: <20200922023251.47712-1-snitzer@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: linux-block@vger.kernel.org, dm-devel@redhat.com,
	Vijayendra Suman <vijayendra.suman@oracle.com>,
	Ming Lei <ming.lei@redhat.com>
Subject: [dm-devel] [PATCH v3 5/6] dm table: stack 'chunk_sectors' limit to
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
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
index 229f461e7def..3f4e7c7912a2 100644
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
@@ -1506,6 +1507,10 @@ int dm_calculate_queue_limits(struct dm_table *table,
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

