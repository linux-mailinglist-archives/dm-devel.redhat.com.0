Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id BF7411D099A
	for <lists+dm-devel@lfdr.de>; Wed, 13 May 2020 09:10:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589353848;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rfT6QlXC9FmnfQogvC/B557V3SrRarSV+UhfR8WifPI=;
	b=BQia6MMXQpU6dJcaWU28eclkl++YAvexSH+blAqNILph8tohXYJlE/yL1MH+RMnVa2oxTy
	1rTCVrbQptcHiarwRKpqDP1LR80OnoYJKMKSSxCMh7yyaD2Avy+K7BdXt5CJEbXyk5hpPp
	uCEypj6/9NPuEeGevE+lL/U8z3plRS0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-g0R_x4ZHMdeKeUMPnArPGA-1; Wed, 13 May 2020 03:10:46 -0400
X-MC-Unique: g0R_x4ZHMdeKeUMPnArPGA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7520C107B7C4;
	Wed, 13 May 2020 07:10:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 282D45D9C5;
	Wed, 13 May 2020 07:10:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7C0151809543;
	Wed, 13 May 2020 07:10:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D78pi7025950 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 03:08:51 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5A4B0110E8C; Wed, 13 May 2020 07:08:51 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CB053DD
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:08:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 91E05101A526
	for <dm-devel@redhat.com>; Wed, 13 May 2020 07:08:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-183-Y9qLLyflOaqdrThU8h8dyA-1;
	Wed, 13 May 2020 03:08:46 -0400
X-MC-Unique: Y9qLLyflOaqdrThU8h8dyA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 8497FAFEC;
	Wed, 13 May 2020 07:08:47 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Wed, 13 May 2020 09:08:43 +0200
Message-Id: <20200513070843.71528-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] device-mapper: use dynamic debug instead of
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch to use dynamic debug to avoid having recompile the kernel
just to enable debugging messages.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/linux/device-mapper.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index e2d506dd805e..3d4365fd3001 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -556,13 +556,8 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
 #define DMINFO(fmt, ...) pr_info(DM_FMT(fmt), ##__VA_ARGS__)
 #define DMINFO_LIMIT(fmt, ...) pr_info_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
 
-#ifdef CONFIG_DM_DEBUG
-#define DMDEBUG(fmt, ...) printk(KERN_DEBUG DM_FMT(fmt), ##__VA_ARGS__)
+#define DMDEBUG(fmt, ...) pr_debug(DM_FMT(fmt), ##__VA_ARGS__)
 #define DMDEBUG_LIMIT(fmt, ...) pr_debug_ratelimited(DM_FMT(fmt), ##__VA_ARGS__)
-#else
-#define DMDEBUG(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
-#define DMDEBUG_LIMIT(fmt, ...) no_printk(fmt, ##__VA_ARGS__)
-#endif
 
 #define DMEMIT(x...) sz += ((sz >= maxlen) ? \
 			  0 : scnprintf(result + sz, maxlen - sz, x))
-- 
2.25.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

