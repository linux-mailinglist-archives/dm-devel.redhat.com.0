Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 9F8E11D8EEA
	for <lists+dm-devel@lfdr.de>; Tue, 19 May 2020 06:57:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589864255;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wjtqtLFGRPZ0srzNTn1Ng8smGQRwH9hDH7rZTIyo7UQ=;
	b=c8GEqqAuRHyipb6XT/ne6SEK1vZljBx4epP62WHzyJT2gYkjTyzkezQnwEiKCTI/2k5rcB
	KzCRx4ufv+H/uIbjNzOFQG/uACFjH3dByl8GU84Djt3iiqG/C9k4F/Vim0uPS71lpIxEp7
	nwJQ7d2r0zPbS0uTXHqpiU9Y6mlHPJc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-u_Y9Ad0AOxyeSMBHwQ47Vw-1; Tue, 19 May 2020 00:57:33 -0400
X-MC-Unique: u_Y9Ad0AOxyeSMBHwQ47Vw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 937A7107ACF3;
	Tue, 19 May 2020 04:57:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 512C35C1BB;
	Tue, 19 May 2020 04:57:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CDD714ED3C;
	Tue, 19 May 2020 04:57:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04J4vGpQ019146 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 19 May 2020 00:57:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7617F1002394; Tue, 19 May 2020 04:57:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9347110013D9;
	Tue, 19 May 2020 04:57:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 04J4vCtW001409; 
	Mon, 18 May 2020 23:57:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 04J4vB5k001408;
	Mon, 18 May 2020 23:57:11 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 18 May 2020 23:57:04 -0500
Message-Id: <1589864228-1363-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
References: <1589864228-1363-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/6] libmultipath: make sysfs_is_multipathed
	able to return wwid
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

sysfs_is_multipathed reads the wwid of the dm device holding a path to
check if its a multipath device.  Add code to optinally set pp->wwid to
that wwid.  This will be used by a future patch.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/sysfs.c | 24 +++++++++++++++++++-----
 libmultipath/sysfs.h |  2 +-
 multipath/main.c     |  7 ++++---
 3 files changed, 24 insertions(+), 9 deletions(-)

diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
index 62ec2ed7..12a82d95 100644
--- a/libmultipath/sysfs.c
+++ b/libmultipath/sysfs.c
@@ -295,7 +295,7 @@ static int select_dm_devs(const struct dirent *di)
 	return fnmatch("dm-*", di->d_name, FNM_FILE_NAME) == 0;
 }
 
-bool sysfs_is_multipathed(const struct path *pp)
+bool sysfs_is_multipathed(struct path *pp, bool set_wwid)
 {
 	char pathbuf[PATH_MAX];
 	struct scandir_result sr;
@@ -325,7 +325,7 @@ bool sysfs_is_multipathed(const struct path *pp)
 	for (i = 0; i < r && !found; i++) {
 		long fd;
 		int nr;
-		char uuid[6];
+		char uuid[WWID_SIZE + UUID_PREFIX_LEN];
 
 		if (safe_snprintf(pathbuf + n, sizeof(pathbuf) - n,
 				  "/%s/dm/uuid", di[i]->d_name))
@@ -339,12 +339,26 @@ bool sysfs_is_multipathed(const struct path *pp)
 
 		pthread_cleanup_push(close_fd, (void *)fd);
 		nr = read(fd, uuid, sizeof(uuid));
-		if (nr == sizeof(uuid) && !memcmp(uuid, "mpath-", sizeof(uuid)))
+		if (nr > (int)UUID_PREFIX_LEN &&
+		    !memcmp(uuid, UUID_PREFIX, UUID_PREFIX_LEN))
 			found = true;
 		else if (nr < 0) {
-			condlog(1, "%s: error reading from %s: %s",
-				__func__, pathbuf, strerror(errno));
+			condlog(1, "%s: error reading from %s: %m",
+				__func__, pathbuf);
 		}
+		if (found && set_wwid) {
+			nr -= UUID_PREFIX_LEN;
+			memcpy(pp->wwid, uuid + UUID_PREFIX_LEN, nr);
+			if (nr == WWID_SIZE) {
+				condlog(4, "%s: overflow while reading from %s",
+					__func__, pathbuf);
+				pp->wwid[0] = '\0';
+			} else {
+				pp->wwid[nr] = '\0';
+				strchop(pp->wwid);
+			}
+                }
+
 		pthread_cleanup_pop(1);
 	}
 	pthread_cleanup_pop(1);
diff --git a/libmultipath/sysfs.h b/libmultipath/sysfs.h
index 9ae30b39..72b39ab2 100644
--- a/libmultipath/sysfs.h
+++ b/libmultipath/sysfs.h
@@ -14,5 +14,5 @@ ssize_t sysfs_bin_attr_get_value(struct udev_device *dev, const char *attr_name,
 				 unsigned char * value, size_t value_len);
 int sysfs_get_size (struct path *pp, unsigned long long * size);
 int sysfs_check_holders(char * check_devt, char * new_devt);
-bool sysfs_is_multipathed(const struct path *pp);
+bool sysfs_is_multipathed(struct path *pp, bool set_wwid);
 #endif
diff --git a/multipath/main.c b/multipath/main.c
index 78822ee1..f25b8693 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -640,7 +640,8 @@ configure (struct config *conf, enum mpath_cmds cmd,
 			 * Shortcut for find_multipaths smart:
 			 * Quick check if path is already multipathed.
 			 */
-			if (sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0))) {
+			if (sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0),
+						 false)) {
 				r = RTVL_YES;
 				goto print_valid;
 			}
@@ -749,8 +750,8 @@ configure (struct config *conf, enum mpath_cmds cmd,
 			/*
 			 * Check if we raced with multipathd
 			 */
-			r = sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0)) ?
-				RTVL_YES : RTVL_NO;
+			r = sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0),
+						 false) ? RTVL_YES : RTVL_NO;
 		}
 		goto print_valid;
 	}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

