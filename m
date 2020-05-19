Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 771261D9D8A
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 19:10:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589908206;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=3vDyJImHLBN67e5Ihr3UaahHQMaspBpuaMdGiPXvaYc=;
	b=JF4v1BGeP8JGYnqpeFV23Gd2NLuY55Vxap6iLKamjrhRfbsVqVYo2IXuUHR2qPXTYRp6dw
	BY/AJRKwFC83JIJ96KeF+KcHOH25c4s3FysT4IG17fZc37VSLRH1fI2R8OIp0t8+Ulk+eX
	+qUlr+zUsS9PjDmheSAYVmOvnGfx+hs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-IndoFlLKOFGvqHXZ_srpvg-1; Tue, 19 May 2020 13:09:34 -0400
X-MC-Unique: IndoFlLKOFGvqHXZ_srpvg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01FABBFCB;
	Tue, 19 May 2020 17:09:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D68696F7F9;
	Tue, 19 May 2020 17:09:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 976131809547;
	Tue, 19 May 2020 17:09:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04JH8vLd011775 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 13:08:57 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03D5760C05; Tue, 19 May 2020 17:08:57 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A9CF760BE1;
	Tue, 19 May 2020 17:08:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04JH8qAX007514; 
	Tue, 19 May 2020 12:08:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04JH8pvd007513;
	Tue, 19 May 2020 12:08:51 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 19 May 2020 12:08:44 -0500
Message-Id: <1589908125-7456-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
References: <1589908125-7456-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 5/6] libmultipath: simplify failed wwid code
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The (is|mark|unmark)_failed_wwid code is needlessly complicated.
Locking a file is necssary if multiple processes could otherwise be
writing to it at the same time. That is not the case with the
failed_wwids files. They can simply be empty files in a directory.  Even
with all the locking in place, two processes accessing or modifying a
file at the same time will still race. And even without the locking, if
two processes try to access or modify a file at the same time, they will
both see a reasonable result, and will leave the files in a valid state
afterwards.

Instead of doing all the locking work (which made it necessary to write
a file, even just to check if a file existed), simply check for files
with lstat(), create them with open(), and remove them with unlink().

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/wwids.c | 131 ++++++++++++++++++-------------------------
 1 file changed, 56 insertions(+), 75 deletions(-)

diff --git a/libmultipath/wwids.c b/libmultipath/wwids.c
index 637cb0ab..aab5da8a 100644
--- a/libmultipath/wwids.c
+++ b/libmultipath/wwids.c
@@ -6,6 +6,7 @@
 #include <stdio.h>
 #include <sys/types.h>
 #include <sys/stat.h>
+#include <fcntl.h>
 
 #include "util.h"
 #include "checkers.h"
@@ -348,109 +349,89 @@ remember_wwid(char *wwid)
 }
 
 static const char shm_dir[] = MULTIPATH_SHM_BASE "failed_wwids";
-static const char shm_lock[] = ".lock";
-static const char shm_header[] = "multipath shm lock file, don't edit";
-static char _shm_lock_path[sizeof(shm_dir)+sizeof(shm_lock)];
-static const char *shm_lock_path = &_shm_lock_path[0];
 
-static void init_shm_paths(void)
+static void print_failed_wwid_result(const char * msg, const char *wwid, int r)
 {
-	snprintf(_shm_lock_path, sizeof(_shm_lock_path),
-		 "%s/%s", shm_dir, shm_lock);
+	switch(r) {
+	case WWID_FAILED_ERROR:
+		condlog(1, "%s: %s: %m", msg, wwid);
+		return;
+	case WWID_IS_FAILED:
+	case WWID_IS_NOT_FAILED:
+		condlog(4, "%s: %s is %s", msg, wwid,
+			r == WWID_IS_FAILED ? "failed" : "good");
+		return;
+	case WWID_FAILED_CHANGED:
+		condlog(3, "%s: %s", msg, wwid);
+	}
 }
 
-static pthread_once_t shm_path_once = PTHREAD_ONCE_INIT;
-
-static int multipath_shm_open(bool rw)
+int is_failed_wwid(const char *wwid)
 {
-	int fd;
-	int can_write;
-
-	pthread_once(&shm_path_once, init_shm_paths);
-	fd = open_file(shm_lock_path, &can_write, shm_header);
+	struct stat st;
+	char path[PATH_MAX];
+	int r;
 
-	if (fd >= 0 && rw && !can_write) {
-		close(fd);
-		condlog(1, "failed to open %s for writing", shm_dir);
+	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
+		condlog(1, "%s: path name overflow", __func__);
 		return -1;
 	}
 
-	return fd;
-}
-
-static void multipath_shm_close(void *arg)
-{
-	long fd = (long)arg;
+	if (lstat(path, &st) == 0)
+		r = WWID_IS_FAILED;
+	else if (errno == ENOENT)
+		r = WWID_IS_NOT_FAILED;
+	else
+		r = WWID_FAILED_ERROR;
 
-	close(fd);
-	unlink(shm_lock_path);
+	print_failed_wwid_result("is_failed", wwid, r);
+	return r;
 }
 
-static int _failed_wwid_op(const char *wwid, bool rw,
-			   int (*func)(const char *), const char *msg)
+int mark_failed_wwid(const char *wwid)
 {
 	char path[PATH_MAX];
-	long lockfd;
-	int r = -1;
+	int r, fd;
 
 	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
 		condlog(1, "%s: path name overflow", __func__);
 		return -1;
 	}
-
-	lockfd = multipath_shm_open(rw);
-	if (lockfd == -1)
+	if (ensure_directories_exist(path, 0700) < 0) {
+		condlog(1, "%s: can't setup directories", __func__);
 		return -1;
+	}
 
-	pthread_cleanup_push(multipath_shm_close, (void *)lockfd);
-	r = func(path);
-	pthread_cleanup_pop(1);
-
-	if (r == WWID_FAILED_ERROR)
-		condlog(1, "%s: %s: %s", msg, wwid, strerror(errno));
-	else if (r == WWID_FAILED_CHANGED)
-		condlog(3, "%s: %s", msg, wwid);
-	else if (!rw)
-		condlog(4, "%s: %s is %s", msg, wwid,
-			r == WWID_IS_FAILED ? "failed" : "good");
+	fd = open(path, O_RDONLY | O_CREAT | O_EXCL, S_IRUSR);
+	if (fd >= 0) {
+		close(fd);
+		r = WWID_FAILED_CHANGED;
+	} else if (errno == EEXIST)
+		r = WWID_FAILED_UNCHANGED;
+	else
+		r = WWID_FAILED_ERROR;
 
+	print_failed_wwid_result("mark_failed", wwid, r);
 	return r;
 }
 
-static int _is_failed(const char *path)
+int unmark_failed_wwid(const char *wwid)
 {
-	struct stat st;
+	char path[PATH_MAX];
+	int r;
 
-	if (lstat(path, &st) == 0)
-		return WWID_IS_FAILED;
+	if (safe_sprintf(path, "%s/%s", shm_dir, wwid)) {
+		condlog(1, "%s: path name overflow", __func__);
+		return -1;
+	}
+
+	if (unlink(path) == 0)
+		r = WWID_FAILED_CHANGED;
 	else if (errno == ENOENT)
-		return WWID_IS_NOT_FAILED;
+		r = WWID_FAILED_UNCHANGED;
 	else
-		return WWID_FAILED_ERROR;
-}
-
-static int _mark_failed(const char *path)
-{
-	/* Called from _failed_wwid_op: we know that shm_lock_path exists */
-	if (_is_failed(path) == WWID_IS_FAILED)
-		return WWID_FAILED_UNCHANGED;
-	return (link(shm_lock_path, path) == 0 ? WWID_FAILED_CHANGED :
-		WWID_FAILED_ERROR);
-}
+		r = WWID_FAILED_ERROR;
 
-static int _unmark_failed(const char *path)
-{
-	if (_is_failed(path) == WWID_IS_NOT_FAILED)
-		return WWID_FAILED_UNCHANGED;
-	return (unlink(path) == 0 ? WWID_FAILED_CHANGED : WWID_FAILED_ERROR);
-}
-
-#define declare_failed_wwid_op(op, rw) \
-int op ## _wwid(const char *wwid) \
-{ \
-	return _failed_wwid_op(wwid, (rw), _ ## op, #op); \
+	print_failed_wwid_result("unmark_failed", wwid, r);
+	return r;
 }
-
-declare_failed_wwid_op(is_failed, false)
-declare_failed_wwid_op(mark_failed, true)
-declare_failed_wwid_op(unmark_failed, true)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

