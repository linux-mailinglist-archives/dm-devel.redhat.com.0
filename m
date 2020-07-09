Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id B3325219D79
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-CW2HN8_zMbKZlBxnOTjL1g-1; Thu, 09 Jul 2020 06:17:43 -0400
X-MC-Unique: CW2HN8_zMbKZlBxnOTjL1g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62B42107ACF8;
	Thu,  9 Jul 2020 10:17:34 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 858871002394;
	Thu,  9 Jul 2020 10:17:33 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41571180530A;
	Thu,  9 Jul 2020 10:17:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH1w4029469 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 38AFA208DD80; Thu,  9 Jul 2020 10:17:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 33FF02026D67
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:01 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F1FE800A18
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:01 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-164-CeDZkHZyMtWSB2RkQ80s0g-1;
	Thu, 09 Jul 2020 06:16:58 -0400
X-MC-Unique: CeDZkHZyMtWSB2RkQ80s0g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id DC1AEADC0;
	Thu,  9 Jul 2020 10:16:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:13 +0200
Message-Id: <20200709101620.6786-29-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH1w4029469
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 28/35] libmultipath: snprint_devices(): use
	udev_enumerate
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Rather than hand-coding the device enumeration, use udev as we do elsewhere,
too. While at it, improve the overflow detection.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/print.c | 75 ++++++++++++++++++++------------------------
 libmultipath/print.h |  2 +-
 2 files changed, 35 insertions(+), 42 deletions(-)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index 298b376..fb94f86 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -2026,65 +2026,58 @@ int snprint_status(char *buff, int len, const struct vectors *vecs)
 	return fwd;
 }
 
-int snprint_devices(struct config *conf, char * buff, int len,
+int snprint_devices(struct config *conf, char *buff, size_t len,
 		    const struct vectors *vecs)
 {
-	DIR *blkdir;
-	struct dirent *blkdev;
-	struct stat statbuf;
-	char devpath[PATH_MAX];
-	int threshold = MAX_LINE_LEN;
-	int fwd = 0;
+	size_t fwd = 0;
 	int r;
+	struct udev_enumerate *enm;
+	struct udev_list_entry *item, *first;
 
 	struct path * pp;
 
-	if (!(blkdir = opendir("/sys/block")))
+	enm = udev_enumerate_new(udev);
+	if (!enm)
 		return 1;
+	udev_enumerate_add_match_subsystem(enm, "block");
 
-	if ((len - fwd - threshold) <= 0) {
-		closedir(blkdir);
-		return len;
-	}
 	fwd += snprintf(buff + fwd, len - fwd, "available block devices:\n");
+	r = udev_enumerate_scan_devices(enm);
+	if (r < 0)
+		goto out;
 
-	while ((blkdev = readdir(blkdir)) != NULL) {
-		if ((strcmp(blkdev->d_name,".") == 0) ||
-		    (strcmp(blkdev->d_name,"..") == 0))
-			continue;
-
-		if (safe_sprintf(devpath, "/sys/block/%s", blkdev->d_name))
-			continue;
-
-		if (stat(devpath, &statbuf) < 0)
-			continue;
+	first = udev_enumerate_get_list_entry(enm);
+	udev_list_entry_foreach(item, first) {
+		const char *path, *devname, *status;
+		struct udev_device *u_dev;
 
-		if (S_ISDIR(statbuf.st_mode) == 0)
-			continue;
+		path = udev_list_entry_get_name(item);
+		u_dev = udev_device_new_from_syspath(udev, path);
+		devname = udev_device_get_sysname(u_dev);
 
-		if ((len - fwd - threshold)  <= 0) {
-			closedir(blkdir);
-			return len;
-		}
+		fwd += snprintf(buff + fwd, len - fwd, "    %s", devname);
+		if (fwd >= len)
+			break;
 
-		fwd += snprintf(buff + fwd, len - fwd, "    %s",
-				blkdev->d_name);
-		pp = find_path_by_dev(vecs->pathvec, blkdev->d_name);
+		pp = find_path_by_dev(vecs->pathvec, devname);
 		if (!pp) {
 			r = filter_devnode(conf->blist_devnode,
-					   conf->elist_devnode, blkdev->d_name);
+					   conf->elist_devnode,
+					   devname);
 			if (r > 0)
-				fwd += snprintf(buff + fwd, len - fwd,
-						" devnode blacklisted, unmonitored");
-			else if (r <= 0)
-				fwd += snprintf(buff + fwd, len - fwd,
-						" devnode whitelisted, unmonitored");
+				status = "devnode blacklisted, unmonitored";
+			else
+				status = "devnode whitelisted, unmonitored";
 		} else
-			fwd += snprintf(buff + fwd, len - fwd,
-					" devnode whitelisted, monitored");
-		fwd += snprintf(buff + fwd, len - fwd, "\n");
+			status = " devnode whitelisted, monitored";
+
+		fwd += snprintf(buff + fwd, len - fwd, " %s\n", status);
+		udev_device_unref(u_dev);
+		if (fwd >= len)
+			break;
 	}
-	closedir(blkdir);
+out:
+	udev_enumerate_unref(enm);
 
 	if (fwd >= len)
 		return len;
diff --git a/libmultipath/print.h b/libmultipath/print.h
index e8260d0..0042cef 100644
--- a/libmultipath/print.h
+++ b/libmultipath/print.h
@@ -129,7 +129,7 @@ int snprint_multipath_map_json (char * buff, int len,
 int snprint_blacklist_report (struct config *, char *, int);
 int snprint_wildcards (char *, int);
 int snprint_status (char *, int, const struct vectors *);
-int snprint_devices (struct config *, char *, int, const struct vectors *);
+int snprint_devices (struct config *, char *, size_t, const struct vectors *);
 int snprint_path_serial (char *, size_t, const struct path *);
 int snprint_host_wwnn (char *, size_t, const struct path *);
 int snprint_host_wwpn (char *, size_t, const struct path *);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

