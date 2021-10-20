Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2264353B9
	for <lists+dm-devel@lfdr.de>; Wed, 20 Oct 2021 21:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634757609;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FIMQ0NNqtD8B3aWbQWegRVHNCibzf/OyIiEuCKfQQkg=;
	b=Fabl/0p0vAwUjXJfd77fyHtP+zndp9bfEEB+Tl8EH5Nwav6gbIYuLOHBmeP3BXIbtJFHz1
	2iHtnhRzVnIihO51G1ER+u1E//07Xx+RJ7rKXF6+vtUazw2ijsvHo1FcfPG6+w7fdgTpc/
	LwQSOKZXWeTk2R3McVcP/X1mbzT7d1c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-53Vgj_XWMPikyOU5Aj0Gew-1; Wed, 20 Oct 2021 15:20:06 -0400
X-MC-Unique: 53Vgj_XWMPikyOU5Aj0Gew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6A929CC63F;
	Wed, 20 Oct 2021 19:19:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7DED5E9D5;
	Wed, 20 Oct 2021 19:19:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0C0461832DD2;
	Wed, 20 Oct 2021 19:19:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJFRbn000587 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:15:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 74C045D6D7; Wed, 20 Oct 2021 19:15:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F6835F4ED;
	Wed, 20 Oct 2021 19:15:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 19KJFPZW006061; 
	Wed, 20 Oct 2021 14:15:25 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 19KJFPIU006060;
	Wed, 20 Oct 2021 14:15:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 20 Oct 2021 14:15:17 -0500
Message-Id: <1634757322-6015-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
References: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/7] libmultipath: skip unneeded steps to get
	path name
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The path already must have a udev device at this point, so it just
needs to copy the sysname from it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/structs_vec.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index e52db0c4..4d56107a 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -1,6 +1,7 @@
 #include <stdio.h>
 #include <string.h>
 #include <unistd.h>
+#include <libudev.h>
 
 #include "util.h"
 #include "checkers.h"
@@ -174,8 +175,8 @@ bool update_pathvec_from_dm(vector pathvec, struct multipath *mpp,
 				} else {
 					int rc;
 
-					devt2devname(pp->dev, sizeof(pp->dev),
-						     pp->dev_t);
+					strlcpy(pp->dev, udev_device_get_sysname(pp->udev),
+						sizeof(pp->dev));
 					conf = get_multipath_config();
 					pthread_cleanup_push(put_multipath_config,
 							     conf);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

