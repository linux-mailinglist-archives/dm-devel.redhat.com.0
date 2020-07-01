Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D7481211639
	for <lists+dm-devel@lfdr.de>; Thu,  2 Jul 2020 00:43:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593643426;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QrPNIXmEtumeUVrw1ma8hqK5SXFJqCqF1u/8LGmJd1g=;
	b=alPJrpnBMKF//zN0CL1YB0OfrwTnG0AwUZHWc8Vp3WAW0eRT3ireXqxNSNvFEbNowLIIBy
	Og9alrzFceuzbdR5Sq6pEP2JSUwnsMp0LQliPdgciFsCXs/pHtzbV03ki7LdSfUP2LvOuS
	yQ5yLIVxUbNFgBBYSivJ/rMNXqx6rAM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-E5rtdbHQPTyxpO04D_yzCw-1; Wed, 01 Jul 2020 18:43:44 -0400
X-MC-Unique: E5rtdbHQPTyxpO04D_yzCw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6BB15802ED6;
	Wed,  1 Jul 2020 22:43:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CE5773FC5;
	Wed,  1 Jul 2020 22:43:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0EE0E6C9C6;
	Wed,  1 Jul 2020 22:43:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 061MdiEv020034 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Jul 2020 18:39:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1B7CF5C1C5; Wed,  1 Jul 2020 22:39:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 273CA5C1BB;
	Wed,  1 Jul 2020 22:39:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 061Mddg3006256; 
	Wed, 1 Jul 2020 17:39:40 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 061Mddas006255;
	Wed, 1 Jul 2020 17:39:39 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  1 Jul 2020 17:39:35 -0500
Message-Id: <1593643176-6206-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
References: <1593643176-6206-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/4] kpartx: handle alternate bsd disklabel
	location
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bsd disk labels can either be at the start of the second sector, or 64
bytes into the first sector, but kpartx only handled the first case.
However the second case is what parted creates, and what the linux
kernel partition code expects.  kpartx should handle both cases.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 kpartx/bsd.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/kpartx/bsd.c b/kpartx/bsd.c
index 0e661fbc..950b0f92 100644
--- a/kpartx/bsd.c
+++ b/kpartx/bsd.c
@@ -1,6 +1,7 @@
 #include "kpartx.h"
 #include <stdio.h>
 
+#define BSD_LABEL_OFFSET	64
 #define BSD_DISKMAGIC	(0x82564557UL)	/* The disk magic number */
 #define XBSD_MAXPARTITIONS	16
 #define BSD_FS_UNUSED		0
@@ -60,8 +61,19 @@ read_bsd_pt(int fd, struct slice all, struct slice *sp, unsigned int ns) {
 		return -1;
 
 	l = (struct bsd_disklabel *) bp;
-	if (l->d_magic != BSD_DISKMAGIC)
-		return -1;
+	if (l->d_magic != BSD_DISKMAGIC) {
+		/*
+		 * BSD disklabels can also start 64 bytes offset from the
+		 * start of the first sector
+		 */
+		bp = getblock(fd, offset);
+		if (bp == NULL)
+			return -1;
+
+		l = (struct bsd_disklabel *)(bp + 64);
+		if (l->d_magic != BSD_DISKMAGIC)
+			return -1;
+	}
 
 	max_partitions = 16;
 	if (l->d_npartitions < max_partitions)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

