Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C12B41401D4
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:21:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227681;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=d+abaKa/pXf8XGQkU/FCM16qAuK+94pIGVINZB3uIRo=;
	b=RwoY6aJ6Ywubz28etLGoK0NDUPRCizBzqG0k/FQ1NDUGT9oLjeYVIEi1IJnMGHK/Qs1JAz
	y3TyAE7dzyARAOVe9PgQJokW9o5/Ddel+zg0XcfxaJLrtWq/belAVk8XDkIL8XqwxTpltk
	heMDELMKhwEsuz5HoEgIOC5AlG23yyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-2EiBlHc4PQS_0jdMR73SUQ-1; Thu, 16 Jan 2020 21:18:55 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE245DB22;
	Fri, 17 Jan 2020 02:18:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7A76806B9;
	Fri, 17 Jan 2020 02:18:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 17B97845C1;
	Fri, 17 Jan 2020 02:18:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2ISGb030601 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:28 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2CFF487ECD; Fri, 17 Jan 2020 02:18:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 91ADB89D03;
	Fri, 17 Jan 2020 02:18:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IOFP017244; 
	Thu, 16 Jan 2020 20:18:24 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2INSt017243;
	Thu, 16 Jan 2020 20:18:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:07 -0600
Message-Id: <1579227500-17196-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 02/15] libmultipath: fix leak in foreign code
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
X-MC-Unique: 2EiBlHc4PQS_0jdMR73SUQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If scandir fails or finds no foreign libraries, enable_re needs to be
freed before exitting.

Fixes: 8d03eda4 'multipath.conf: add "enable_foreign" parameter'
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

