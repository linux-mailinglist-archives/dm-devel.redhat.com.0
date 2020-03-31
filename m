Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 372231989C2
	for <lists+dm-devel@lfdr.de>; Tue, 31 Mar 2020 04:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585620097;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dvaayZCgTduG4NDJM4QGgo+bfrF12nYDk4kITyZe/vM=;
	b=i5kbU4m2PTq5jzbXFlIHzDLPlXuP5YbJWMEX075oUQrmrqHQMMyN5JZNBQmW11x0Yd0y8K
	eA0Pf/+oqBfjFpkCmAxFcxM0Y6TQiXi0/PzScb88OEmsGXF2E1UzSQZiX3Bt2Y11uKYW/5
	6u5P/Exr96yFMQFPsm6w+pFwBuocOp4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-467-C47iU-66P2CN-KaIj71NUg-1; Mon, 30 Mar 2020 22:01:35 -0400
X-MC-Unique: C47iU-66P2CN-KaIj71NUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60F67100726C;
	Tue, 31 Mar 2020 02:01:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1BCB95DA60;
	Tue, 31 Mar 2020 02:01:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5F67F1809567;
	Tue, 31 Mar 2020 02:01:28 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02V2138O032334 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 30 Mar 2020 22:01:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 373FB5C21B; Tue, 31 Mar 2020 02:01:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F5F35C1D8;
	Tue, 31 Mar 2020 02:01:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02V20xlO027162; 
	Mon, 30 Mar 2020 21:00:59 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02V20w1s027161;
	Mon, 30 Mar 2020 21:00:58 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 30 Mar 2020 21:00:54 -0500
Message-Id: <1585620055-27112-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
References: <1585620055-27112-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC Patch 2/3] libmultipath: make sysfs_is_multipathed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

sysfs_is_multipathed reads the wwid of the dm device holding a path to
check if its a multipath device.  Add code to optinally set pp->wwid to
that wwid.  This will be used by a future patch.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/sysfs.c | 22 +++++++++++++++++++---
 libmultipath/sysfs.h |  2 +-
 multipath/main.c     |  7 ++++---
 3 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/libmultipath/sysfs.c b/libmultipath/sysfs.c
index 62ec2ed7..034f082f 100644
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
@@ -342,9 +342,25 @@ bool sysfs_is_multipathed(const struct path *pp)
 		if (nr == sizeof(uuid) && !memcmp(uuid, "mpath-", sizeof(uuid)))
 			found = true;
 		else if (nr < 0) {
-			condlog(1, "%s: error reading from %s: %s",
-				__func__, pathbuf, strerror(errno));
+			condlog(1, "%s: error reading from %s: %m",
+				__func__, pathbuf);
 		}
+		if (found && set_wwid) {
+			nr = read(fd, pp->wwid, WWID_SIZE);
+			if (nr < 0) {
+				condlog(1, "%s: error reading from %s: %m",
+					__func__, pathbuf);
+				pp->wwid[0] = '\0';
+			} else if (nr == WWID_SIZE) {
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
index cf9d2a28..545ead87 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -638,7 +638,8 @@ configure (struct config *conf, enum mpath_cmds cmd,
 			 * Shortcut for find_multipaths smart:
 			 * Quick check if path is already multipathed.
 			 */
-			if (sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0))) {
+			if (sysfs_is_multipathed(VECTOR_SLOT(pathvec, 0),
+						 false)) {
 				r = RTVL_YES;
 				goto print_valid;
 			}
@@ -747,8 +748,8 @@ configure (struct config *conf, enum mpath_cmds cmd,
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

