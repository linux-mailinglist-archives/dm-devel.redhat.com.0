Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 524EC1D8EED
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 06:57:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589864257;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1X59tQRdRWRjBr93goQo1Sh4gzrkYwIXlCvMkKYrW8E=;
	b=CuPJfoRPFVTJbOpkRAI40jEB7TuhDrICpo9J6umIuZnlSgpyPUs/PYb7SlF0+XBmbq8efd
	T7mgdp4Qg3OlJaVZWoEWCw6IQAIz/vNi47a+JFd/BJ439Pfd8MTHyTZsdM4lzQp8u8bP4C
	8Wc84hPjJdro8xM1Wb8xBdTTCbO2bjc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-SlUnsbzEM8u9yal2pC7sPg-1; Tue, 19 May 2020 00:57:34 -0400
X-MC-Unique: SlUnsbzEM8u9yal2pC7sPg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F8E71009445;
	Tue, 19 May 2020 04:57:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E493D5C1C5;
	Tue, 19 May 2020 04:57:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A814F4ED3C;
	Tue, 19 May 2020 04:57:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J4vJIQ019183 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 00:57:19 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D92BF5D9E2; Tue, 19 May 2020 04:57:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C3AEA5D9DD;
	Tue, 19 May 2020 04:57:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04J4vIQT001425; 
	Mon, 18 May 2020 23:57:18 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04J4vHD7001424;
	Mon, 18 May 2020 23:57:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 18 May 2020 23:57:08 -0500
Message-Id: <1589864228-1363-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
References: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/6] libmultipath: use atomic linkat() in
	mark_failed_wwid()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This keeps (almost) the simplicity of the previous patch, while
making sure that the return value of mark_failed_wwid()
(WWID_FAILED_CHANGED vs. WWID_FAILED_UNCHANGED) is correct, even
if several processes access this WWID at the same time.

Signed-off-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/wwids.c | 42 +++++++++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index da55924b..c7a16636 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -374,7 +374,7 @@ int is_failed_wwid(const char *wwid)
 
 	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
 		condlog(1, "%s: path name overflow", __func__);
-		return -1;
+		return WWID_FAILED_ERROR;
 	}
 
 	if (lstat(path, &st) == 0)
@@ -390,27 +390,43 @@ int is_failed_wwid(const char *wwid)
 
 int mark_failed_wwid(const char *wwid)
 {
-	char path[PATH_MAX];
-	int r, fd;
+	char tmpfile[WWID_SIZE + 2 * sizeof(long) + 1];
+	int r = WWID_FAILED_ERROR, fd, dfd;
 
-	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
-		condlog(1, "%s: path name overflow", __func__);
-		return -1;
+	dfd = open(shm_dir, O_RDONLY|O_DIRECTORY);
+	if (dfd == -1 && errno == ENOENT) {
+		char path[sizeof(shm_dir) + 2];
+
+		/* arg for ensure_directories_exist() must not end with "/" */
+		safe_sprintf(path, "%s/_", shm_dir);
+		ensure_directories_exist(path, 0700);
+		dfd = open(shm_dir, O_RDONLY|O_DIRECTORY);
 	}
-	if (ensure_directories_exist(path, 0700) < 0) {
-		condlog(1, "%s: can't setup directories", __func__);
-		return -1;
+	if (dfd == -1) {
+		condlog(1, "%s: can't setup %s: %m", __func__, shm_dir);
+		return WWID_FAILED_ERROR;
 	}
 
-	fd = open(path, O_RDONLY | O_CREAT | O_EXCL, S_IRUSR);
-	if (fd >= 0) {
+	safe_sprintf(tmpfile, "%s.%lx", wwid, (long)getpid());
+	fd = openat(dfd, tmpfile, O_RDONLY | O_CREAT | O_EXCL, S_IRUSR);
+	if (fd >= 0)
 		close(fd);
+	else
+		goto out_closedir;
+
+	if (linkat(dfd, tmpfile, dfd, wwid, 0) == 0)
 		r = WWID_FAILED_CHANGED;
-	} else if (errno == EEXIST)
+	else if (errno == EEXIST)
 		r = WWID_FAILED_UNCHANGED;
 	else
 		r = WWID_FAILED_ERROR;
 
+	if (unlinkat(dfd, tmpfile, 0) == -1)
+		condlog(2, "%s: failed to unlink %s/%s: %m",
+			__func__, shm_dir, tmpfile);
+
+out_closedir:
+	close(dfd);
 	print_failed_wwid_result("mark_failed", wwid, r);
 	return r;
 }
@@ -422,7 +438,7 @@ int unmark_failed_wwid(const char *wwid)
 
 	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
 		condlog(1, "%s: path name overflow", __func__);
-		return -1;
+		return WWID_FAILED_ERROR;
 	}
 
 	if (unlink(path) == 0)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

