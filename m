Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C12F01CA6F1
	for <lists+dm-devel@lfdr.de>; Fri,  8 May 2020 11:19:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588929597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=OUeLmxPRafInQ5EYEzrG93UufrqYnSHdZUfX3c/YPpE=;
	b=UPMvDhr6nmMkkkst82mXuiMkNgsv7bduz20TRCvegKvwljtHX5GvivLQ+r1MUU0tYcpTSF
	mmi4MQfTljMsQaivi+mHYvv/+s5tKHACBh1EN9xjM1ol5vxeFKjTQjv5DtK3x/+SGL7z9F
	AI3Z6U2TZk/Ts4qhSUhwH/giEJzxhOQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-CXPhuNBCNQqvUhkUNeMqNw-1; Fri, 08 May 2020 05:19:56 -0400
X-MC-Unique: CXPhuNBCNQqvUhkUNeMqNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FA8319057A0;
	Fri,  8 May 2020 09:19:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2848060FB9;
	Fri,  8 May 2020 09:19:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5B53C1809543;
	Fri,  8 May 2020 09:19:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0489JgqO002078 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 May 2020 05:19:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DD4E92029F62; Fri,  8 May 2020 09:19:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D9B482029F61
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:19:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7193101A525
	for <dm-devel@redhat.com>; Fri,  8 May 2020 09:19:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-10-t_hXK3ViPJaDxa4kqXABoQ-1;
	Fri, 08 May 2020 05:19:34 -0400
X-MC-Unique: t_hXK3ViPJaDxa4kqXABoQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 5E79DAD1E;
	Fri,  8 May 2020 09:19:35 +0000 (UTC)
From: Hannes Reinecke <hare@suse.de>
To: Mike Snitzer <snitzer@redhat.com>
Date: Fri,  8 May 2020 11:19:30 +0200
Message-Id: <20200508091930.40910-1-hare@suse.de>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0489JgqO002078
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] device-mapper: use dynamic debug instead of
	config option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Debugging device-mapper via the DMDEBUG() call is currently depending
on the CONFIG_DM_DEBUG option and needs a recompilation to activate.
This patch replaces the config option with dynamic debugging to
enable debugging without recompilation.

Signed-off-by: Hannes Reinecke <hare@suse.de>
---
 include/linux/device-mapper.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/include/linux/device-mapper.h b/include/linux/device-mapper.h
index af48d9da3916..6df78be3637e 100644
--- a/include/linux/device-mapper.h
+++ b/include/linux/device-mapper.h
@@ -557,13 +557,8 @@ void *dm_vcalloc(unsigned long nmemb, unsigned long elem_size);
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

