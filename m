Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDDA164FBB
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 21:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582143740;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rUQneirjbXc6ffDjcV+F/+9qmGavEMxuwqyNBr/Xmpc=;
	b=iccUgDBGq8Q0m3QVbJYWq1TwCDSxHjVZJ2OQ/cuMDmInua/g+K2ziJ8gMFXT8fu3yix7pp
	jQcZBq5WJJNFUmA5oVjpxpCAUBmdDf5XTwvEc5s1oIJ/eIpRQGJYgz7wa24R1xrHbG0/y+
	YOYtjAxOnJShchmQbPmQqLdzTVonzRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-Kfg_0wJDN7KOXN9eEHoISQ-1; Wed, 19 Feb 2020 15:22:18 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9102A8014CC;
	Wed, 19 Feb 2020 20:22:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 16BE919756;
	Wed, 19 Feb 2020 20:22:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 436A035B0D;
	Wed, 19 Feb 2020 20:22:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JKLsMi031269 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 15:21:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B616610027BE; Wed, 19 Feb 2020 20:21:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 28A5510013A1;
	Wed, 19 Feb 2020 20:21:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01JKLlPp020930; 
	Wed, 19 Feb 2020 14:21:48 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01JKLlTZ020929;
	Wed, 19 Feb 2020 14:21:47 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 14:21:41 -0600
Message-Id: <1582143705-20886-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582143705-20886-1-git-send-email-bmarzins@redhat.com>
References: <1582143705-20886-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/5] multipath: fix issues found by compiling
	with gcc 10
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: Kfg_0wJDN7KOXN9eEHoISQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 kpartx/dasd.c        |  6 +++---
 libmultipath/print.c | 16 ++++++++--------
 multipath/main.c     |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index 1486ccaa..14b9d3aa 100644
--- a/kpartx/dasd.c
+++ b/kpartx/dasd.c
@@ -186,7 +186,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 		goto out;
 	}
 
-	if ((!info.FBA_layout) && (!strcmp(info.type, "ECKD")))
+	if ((!info.FBA_layout) && (!memcmp(info.type, "ECKD", 4)))
 		memcpy (&vlabel, data, sizeof(vlabel));
 	else {
 		bzero(&vlabel,4);
@@ -216,7 +216,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 		sp[0].size  = size - sp[0].start;
 		retval = 1;
 	} else if ((strncmp(type, "VOL1", 4) == 0) &&
-		(!info.FBA_layout) && (!strcmp(info.type, "ECKD"))) {
+		(!info.FBA_layout) && (!memcmp(info.type, "ECKD",4))) {
 		/*
 		 * New style VOL1 labeled disk
 		 */
@@ -265,7 +265,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 			if (vlabel.ldl_version == 0xf2) {
 				fmt_size = sectors512(vlabel.formatted_blocks,
 						      blocksize);
-			} else if (!strcmp(info.type, "ECKD")) {
+			} else if (!memcmp(info.type, "ECKD",4)) {
 				/* formatted w/o large volume support */
 				fmt_size = geo.cylinders * geo.heads
 					* geo.sectors * (blocksize >> 9);
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 1858d8ea..56f86b2f 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -29,6 +29,7 @@
 #include "uevent.h"
 #include "debug.h"
 #include "discovery.h"
+#include "util.h"
 
 #define MAX(x,y) (((x) > (y)) ? (x) : (y))
 #define MIN(x,y) (((x) > (y)) ? (y) : (x))
@@ -2032,7 +2033,6 @@ int snprint_devices(struct config *conf, char * buff, int len,
 	struct dirent *blkdev;
 	struct stat statbuf;
 	char devpath[PATH_MAX];
-	char *devptr;
 	int threshold = MAX_LINE_LEN;
 	int fwd = 0;
 	int r;
@@ -2048,15 +2048,14 @@ int snprint_devices(struct config *conf, char * buff, int len,
 	}
 	fwd += snprintf(buff + fwd, len - fwd, "available block devices:\n");
 
-	strcpy(devpath,"/sys/block/");
 	while ((blkdev = readdir(blkdir)) != NULL) {
 		if ((strcmp(blkdev->d_name,".") == 0) ||
 		    (strcmp(blkdev->d_name,"..") == 0))
 			continue;
 
-		devptr = devpath + 11;
-		*devptr = '\0';
-		strncat(devptr, blkdev->d_name, PATH_MAX-12);
+		if (safe_sprintf(devpath, "/sys/block/%s", blkdev->d_name))
+			continue;
+
 		if (stat(devpath, &statbuf) < 0)
 			continue;
 
@@ -2068,11 +2067,12 @@ int snprint_devices(struct config *conf, char * buff, int len,
 			return len;
 		}
 
-		fwd += snprintf(buff + fwd, len - fwd, "    %s", devptr);
-		pp = find_path_by_dev(vecs->pathvec, devptr);
+		fwd += snprintf(buff + fwd, len - fwd, "    %s",
+				blkdev->d_name);
+		pp = find_path_by_dev(vecs->pathvec, blkdev->d_name);
 		if (!pp) {
 			r = filter_devnode(conf->blist_devnode,
-					   conf->elist_devnode, devptr);
+					   conf->elist_devnode, blkdev->d_name);
 			if (r > 0)
 				fwd += snprintf(buff + fwd, len - fwd,
 						" devnode blacklisted, unmonitored");
diff --git a/multipath/main.c b/multipath/main.c
index 15007752..cf9d2a28 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -1025,7 +1025,7 @@ main (int argc, char *argv[])
 		if (!dev)
 			goto out;
 
-		strncpy(dev, argv[optind], FILE_NAME_SIZE);
+		strlcpy(dev, argv[optind], FILE_NAME_SIZE);
 		if (dev_type != DEV_UEVENT)
 			dev_type = get_dev_type(dev);
 		if (dev_type == DEV_NONE) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

