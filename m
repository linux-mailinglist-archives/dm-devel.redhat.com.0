Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B92861D2740
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 08:10:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589436610;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mGk4dPDKFa2YCzKLNsLGZnqbs01wud/LQSa/XTv47CA=;
	b=VXf9D81LBJK84FZ97pH+YHePLXRHmOI/TY3zSBCt4stM5w6OMfI6Dlw8yAXbtA/ThwBtmy
	86FQV3idt6v95EsbMmUN1hDqg+G4K8pS0BwkxPW3ansiQQ5TwEQdbFMO3kKn8hFDyYeA1g
	GHJ7JSfUdtB3F/lSkSdRla2xBXxufps=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-508-1wUn29fKNqidi6cK0o53ZA-1; Thu, 14 May 2020 02:10:04 -0400
X-MC-Unique: 1wUn29fKNqidi6cK0o53ZA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E212281CBEF;
	Thu, 14 May 2020 06:09:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1901B7D92B;
	Thu, 14 May 2020 06:09:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8B2C61809543;
	Thu, 14 May 2020 06:09:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04E69hJG028239 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 May 2020 02:09:43 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id F288B13AF4A; Thu, 14 May 2020 06:09:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB10113BF33
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:09:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5087C80028C
	for <dm-devel@redhat.com>; Thu, 14 May 2020 06:09:40 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-506-7yMdy59vNXC1Ys3JRRBqUg-1;
	Thu, 14 May 2020 02:09:35 -0400
X-MC-Unique: 7yMdy59vNXC1Ys3JRRBqUg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 038B9AD72;
	Thu, 14 May 2020 06:09:36 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Thu, 14 May 2020 08:09:28 +0200
Message-Id: <20200514060929.85469-2-hare@suse.de>
In-Reply-To: <20200514060929.85469-1-hare@suse.de>
References: <20200514060929.85469-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: Damien LeMoal <damien.lemoal@wdc.com>, dm-devel@redhat.com
Subject: [dm-devel] [PATCH 1/2] device-mapper: use dynamic debug instead of
	compile-time config option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch to use dynamic debug to avoid having recompile the kernel
just to enable debugging messages.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/linux/device-mapper.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index af48d9da3916..4694e1bb4196 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -557,12 +557,11 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
 #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
 #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
 
+#define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
 #ifdef CONFIG_DM_DEBUG
 #define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
-#define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
 #else
-#define DMDEBUG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
-#define DMDEBUG_LIMIT(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
+#define DMDEBUG(fmt, ...) pr_debug(DM_FMT(fmt), ##__VA_ARGS__)
 #endif
 
 #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
-- 
2.16.4

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

