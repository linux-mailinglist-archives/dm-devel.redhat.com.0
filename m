Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC1B163D4C
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:55:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095303;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ODMzNQQyeekb98jepTGZEUDvIzIKc+H2IpEvzXydEok=;
	b=SPk3FKALYifSeAptOjp1Fw+7c4O3qjJMoFCbJsbYrMDOi25nUGbatvSa78karzMzj7Yh0Q
	4UhiAZ3lPbC5NjZQdd2EkQydxBHmlsNvJ89ZZCwBXBBNE2+RAxQ4lKryw2fvAB1HDI1hJ4
	pkTBy96fmxO7G630dBkh9Gew5CZUD7s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-fWU_ide3OJqlbXKMlt2InA-1; Wed, 19 Feb 2020 01:55:01 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DFF60107ACC5;
	Wed, 19 Feb 2020 06:54:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B566C60C84;
	Wed, 19 Feb 2020 06:54:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4EBF435AF3;
	Wed, 19 Feb 2020 06:54:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6sb1v016773 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:54:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id BF94B90F57; Wed, 19 Feb 2020 06:54:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C97955C112;
	Wed, 19 Feb 2020 06:54:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6sZks010321; 
	Wed, 19 Feb 2020 00:54:35 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6sY5v010320;
	Wed, 19 Feb 2020 00:54:34 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:54:29 -0600
Message-Id: <1582095273-10279-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/5] multipath: fix issues found by compiling
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: fWU_ide3OJqlbXKMlt2InA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 kpartx/dasd.c        | 6 +++---
 libmultipath/print.c | 3 ++-
 multipath/main.c     | 2 +-
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/kpartx/dasd.c b/kpartx/dasd.c
index 1486ccaa..57305825 100644
--- a/kpartx/dasd.c
+++ b/kpartx/dasd.c
@@ -186,7 +186,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 		goto out;
 	}
 
-	if ((!info.FBA_layout) && (!strcmp(info.type, "ECKD")))
+	if ((!info.FBA_layout) && (!strncmp(info.type, "ECKD", 4)))
 		memcpy (&vlabel, data, sizeof(vlabel));
 	else {
 		bzero(&vlabel,4);
@@ -216,7 +216,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 		sp[0].size  = size - sp[0].start;
 		retval = 1;
 	} else if ((strncmp(type, "VOL1", 4) == 0) &&
-		(!info.FBA_layout) && (!strcmp(info.type, "ECKD"))) {
+		(!info.FBA_layout) && (!strncmp(info.type, "ECKD",4))) {
 		/*
 		 * New style VOL1 labeled disk
 		 */
@@ -265,7 +265,7 @@ read_dasd_pt(int fd, __attribute__((unused)) struct slice all,
 			if (vlabel.ldl_version == 0xf2) {
 				fmt_size = sectors512(vlabel.formatted_blocks,
 						      blocksize);
-			} else if (!strcmp(info.type, "ECKD")) {
+			} else if (!strncmp(info.type, "ECKD",4)) {
 				/* formatted w/o large volume support */
 				fmt_size = geo.cylinders * geo.heads
 					* geo.sectors * (blocksize >> 9);
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 1858d8ea..55b19195 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -29,6 +29,7 @@
 #include "uevent.h"
 #include "debug.h"
 #include "discovery.h"
+#include "util.h"
 
 #define MAX(x,y) (((x) > (y)) ? (x) : (y))
 #define MIN(x,y) (((x) > (y)) ? (y) : (x))
@@ -2056,7 +2057,7 @@ int snprint_devices(struct config *conf, char * buff, int len,
 
 		devptr = devpath + 11;
 		*devptr = '\0';
-		strncat(devptr, blkdev->d_name, PATH_MAX-12);
+		strlcpy(devptr, blkdev->d_name, PATH_MAX-11);
 		if (stat(devpath, &statbuf) < 0)
 			continue;
 
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

