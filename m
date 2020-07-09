Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A6D0E219E4E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-nwztZwuMOTS1_fF3P-ykoA-1; Thu, 09 Jul 2020 06:52:45 -0400
X-MC-Unique: nwztZwuMOTS1_fF3P-ykoA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 416801083E90;
	Thu,  9 Jul 2020 10:52:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1CD5DBA45;
	Thu,  9 Jul 2020 10:52:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CC10F1806B0B;
	Thu,  9 Jul 2020 10:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqKsd000609 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0E4682156A59; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1052166BA4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:18 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DD9F38EF3A5
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-453-hwLzXwLSOZeiDoVYv-N2ew-1;
	Thu, 09 Jul 2020 06:52:13 -0400
X-MC-Unique: hwLzXwLSOZeiDoVYv-N2ew-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id AF40DAE44;
	Thu,  9 Jul 2020 10:52:11 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:25 +0200
Message-Id: <20200709105145.9211-2-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqKsd000609
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 54/74] libmultipath: protect use of pp->udev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We could never be 100% certain that pp->udev was always set.
With the upcoming change, we can be even less certain. Always
check pp->udev before using it.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c              | 11 +++++++++--
 libmultipath/prioritizers/alua_rtpg.c |  6 ++++--
 libmultipath/structs_vec.c            |  2 +-
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index caabfef..c202d58 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -339,7 +339,10 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	struct udev_device *parent, *tgtdev;
 	int host, channel, tgtid = -1;
 
-	parent = udev_device_get_parent_with_subsystem_devtype(pp->udev, "scsi", "scsi_device");
+	if (!pp->udev)
+		return 1;
+	parent = udev_device_get_parent_with_subsystem_devtype(pp->udev,
+							 "scsi", "scsi_device");
 	if (!parent)
 		return 1;
 	/* Check for SAS */
@@ -1378,7 +1381,8 @@ nvme_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 	const char *attr_path = NULL;
 	const char *attr;
 
-	attr_path = udev_device_get_sysname(pp->udev);
+	if (pp->udev)
+		attr_path = udev_device_get_sysname(pp->udev);
 	if (!attr_path)
 		return PATHINFO_FAILED;
 
@@ -1958,6 +1962,9 @@ static ssize_t uid_fallback(struct path *pp, int path_state,
 		}
 	} else if (pp->bus == SYSFS_BUS_NVME) {
 		char value[256];
+
+		if (!pp->udev)
+			return -1;
 		len = sysfs_attr_get_value(pp->udev, "wwid", value,
 					   sizeof(value));
 		if (len <= 0)
diff --git a/libmultipath/prioritizers/alua_rtpg.c b/libmultipath/prioritizers/alua_rtpg.c
index bbf5aac..420a2e3 100644
--- a/libmultipath/prioritizers/alua_rtpg.c
+++ b/libmultipath/prioritizers/alua_rtpg.c
@@ -188,9 +188,11 @@ retry:
 int do_inquiry(const struct path *pp, int evpd, unsigned int codepage,
 	       void *resp, int resplen, unsigned int timeout)
 {
-	struct udev_device *ud;
+	struct udev_device *ud = NULL;
 
-	ud = udev_device_get_parent_with_subsystem_devtype(pp->udev, "scsi",
+	if (pp->udev)
+		ud = udev_device_get_parent_with_subsystem_devtype(pp->udev,
+								   "scsi",
 							   "scsi_device");
 	if (ud != NULL) {
 		int rc;
diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index bc47d1e..0b8c548 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -494,7 +494,7 @@ int verify_paths(struct multipath *mpp, struct vectors *vecs)
 		/*
 		 * see if path is in sysfs
 		 */
-		if (sysfs_attr_get_value(pp->udev, "dev",
+		if (!pp->udev || sysfs_attr_get_value(pp->udev, "dev",
 					 pp->dev_t, BLK_DEV_SIZE) < 0) {
 			if (pp->state != PATH_DOWN) {
 				condlog(1, "%s: removing valid path %s in state %d",
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

