Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5424515388B
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:59:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929139;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TGzU9fjk/Fr5/dIUvIPXS3+b+gLBDdiMEaNhA+DKPnk=;
	b=ITnxVhbr3Vvoqz7hso1c8pgvelPgokemUgjPhzMBOs3JxOz9oIwIauuWX9qI1PmOD7Dy0i
	hILTC+fMvmxgfFm+2YSyVTVPZ9CU1xXXdgKbNIi9GcirF6SNfB+2IGr6bhX3Z5meJkA4Dp
	reK4NUGDV9xvQvITmLy/HxbDZLH+jy8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-F4NevX_rM-iz9zPoucQrJA-1; Wed, 05 Feb 2020 13:58:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 161AB8018D8;
	Wed,  5 Feb 2020 18:58:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D75211001DD8;
	Wed,  5 Feb 2020 18:58:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 55D8D1803C41;
	Wed,  5 Feb 2020 18:58:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwSkd019390 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B182E60C63; Wed,  5 Feb 2020 18:58:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DBF960C05;
	Wed,  5 Feb 2020 18:58:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwOZn032625; 
	Wed, 5 Feb 2020 12:58:25 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwO0o032624;
	Wed, 5 Feb 2020 12:58:24 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:06 -0600
Message-Id: <1580929100-32572-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 03/17] libmultipath: fix leak in foreign code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: F4NevX_rM-iz9zPoucQrJA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If scandir fails or finds no foreign libraries, enable_re needs to be
freed before exitting.

Fixes: 8d03eda4 'multipath.conf: add "enable_foreign" parameter'
Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/foreign.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/libmultipath/foreign.c b/libmultipath/foreign.c
index 4b34e141..68e9a9b8 100644
--- a/libmultipath/foreign.c
+++ b/libmultipath/foreign.c
@@ -129,7 +129,7 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 	char pathbuf[PATH_MAX];
 	struct dirent **di;
 	struct scandir_result sr;
-	int r, i;
+	int r, i, ret = 0;
 	regex_t *enable_re = NULL;
 
 	foreigns = vector_alloc();
@@ -157,13 +157,15 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 	if (r == 0) {
 		condlog(3, "%s: no foreign multipath libraries found",
 			__func__);
-		return 0;
+		ret = 0;
+		goto out;
 	} else if (r < 0) {
 		r = errno;
 		condlog(1, "%s: error %d scanning foreign multipath libraries",
 			__func__, r);
 		_cleanup_foreign();
-		return -r;
+		ret = -r;
+		goto out;
 	}
 
 	sr.di = di;
@@ -250,8 +252,9 @@ static int _init_foreign(const char *multipath_dir, const char *enable)
 		free_foreign(fgn);
 	}
 	pthread_cleanup_pop(1); /* free_scandir_result */
+out:
 	pthread_cleanup_pop(1); /* free_pre */
-	return 0;
+	return ret;
 }
 
 int init_foreign(const char *multipath_dir, const char *enable)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

