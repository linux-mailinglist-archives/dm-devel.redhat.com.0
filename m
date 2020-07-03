Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5AFBE213083
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:38:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593736737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=JftNNNbMY4hAVe9JjATDfYxvmSMHQuYOI8ZFhYo+kkE=;
	b=gkfHToe8gtukXJisuRLG4DfCKA6YM4YVEA+0sKn4gKBpgBnhsDM9bPQPBlCr4Nx5uhIMzs
	1kd5ZKYeyNcrJe477hB0pBx040oi9+dl1LxDmAeXF16z/Chl06KdZ1ZYMLA9rGvSjesD69
	KMh1q60yszz1jc4iYsTCc6XNQGz/a3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-0o0nuQrQO_eMFmYK2lNJDw-1; Thu, 02 Jul 2020 20:38:54 -0400
X-MC-Unique: 0o0nuQrQO_eMFmYK2lNJDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBEAC107ACF4;
	Fri,  3 Jul 2020 00:38:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B79561985;
	Fri,  3 Jul 2020 00:38:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B9BD1809547;
	Fri,  3 Jul 2020 00:38:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0630cZjv019295 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:38:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 33E292B5BA; Fri,  3 Jul 2020 00:38:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 808C32B5B7;
	Fri,  3 Jul 2020 00:38:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0630cVqU014266; 
	Thu, 2 Jul 2020 19:38:31 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0630cUdW014265;
	Thu, 2 Jul 2020 19:38:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:38:26 -0500
Message-Id: <1593736707-14216-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
References: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/4] kpartx: handle alternate bsd disklabel
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Reviewed-by: Martin Wilck <mwilck@suse.com>
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

