Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 5EFB72719BB
	for <lists+dm-devel@lfdr.de>; Mon, 21 Sep 2020 06:01:47 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-8kPpK4jHP1C-2nr4EGNuTw-1; Mon, 21 Sep 2020 00:01:44 -0400
X-MC-Unique: 8kPpK4jHP1C-2nr4EGNuTw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A51F71074647;
	Mon, 21 Sep 2020 04:01:29 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4217C60C11;
	Mon, 21 Sep 2020 04:01:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6CE138C7AD;
	Mon, 21 Sep 2020 04:01:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08L411rQ026437 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Sep 2020 00:01:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8C88F2157F24; Mon, 21 Sep 2020 04:01:01 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 86D5C2166B28
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 04:00:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7AC0D858296
	for <dm-devel@redhat.com>; Mon, 21 Sep 2020 04:00:59 +0000 (UTC)
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-556-nZVBTWovOAiDb2s9-EWlCQ-1; Mon, 21 Sep 2020 00:00:53 -0400
X-MC-Unique: nZVBTWovOAiDb2s9-EWlCQ-1
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
	by Forcepoint Email with ESMTP id CC0A3BF035D4329B1700;
	Mon, 21 Sep 2020 12:00:49 +0800 (CST)
Received: from [10.174.178.208] (10.174.178.208) by
	DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server
	id 14.3.487.0; Mon, 21 Sep 2020 12:00:40 +0800
To: Martin Wilck <mwilck@suse.com>, Benjamin Marzinski <bmarzins@redhat.com>, 
	Christophe Varoqui <christophe.varoqui@opensvc.com>, dm-devel mailing list
	<dm-devel@redhat.com>
From: lixiaokeng <lixiaokeng@huawei.com>
Message-ID: <be54400a-5da9-8444-c473-562d675b10f3@huawei.com>
Date: Mon, 21 Sep 2020 12:00:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
X-Originating-IP: [10.174.178.208]
X-CFilter-Loop: Reflected
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: dm-devel@redhat.com
Cc: linfeilong <linfeilong@huawei.com>,
	"liuzhiqiang \(I\)" <liuzhiqiang26@huawei.com>
Subject: [dm-devel] [PATCH v2] libmultipath: check udev_device_get_* return
 value to avoid segfault
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
Content-Language: en-GB

The udev_device_get_* function may return NULL, and it will be
deregerenced in str* and sscanf func. We check the return value
to avoid segfault. Fix all.

Signed-off-by:Lixiaokeng<lixiaokeng@huawei.com>
Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
Signed-off-by: Linfeilong <linfeilong@huawei.com>
---
 libmultipath/configure.c    |  4 +++-
 libmultipath/discovery.c    |  9 +++++++--
 libmultipath/foreign/nvme.c | 10 +++++++---
 3 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 213dbe48..83693eeb 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -531,6 +531,7 @@ static void trigger_partitions_udev_change(struct udev_device *dev,
 {
 	struct udev_enumerate *part_enum;
 	struct udev_list_entry *item;
+	const char *devtype;

 	part_enum = udev_enumerate_new(udev);
 	if (!part_enum)
@@ -551,7 +552,8 @@ static void trigger_partitions_udev_change(struct udev_device *dev,
 		if (!part)
 			continue;

-		if (!strcmp("partition", udev_device_get_devtype(part))) {
+		devtype = udev_device_get_devtype(part);
+		if (devtype && !strcmp("partition", devtype)) {
 			condlog(4, "%s: triggering %s event for %s", __func__,
 				action, syspath);
 			sysfs_attr_set_value(part, "uevent", action, len);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 3f1b1d71..2f301ac4 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -356,7 +356,7 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 		tgtdev = udev_device_get_parent(parent);
 		while (tgtdev) {
 			tgtname = udev_device_get_sysname(tgtdev);
-			if (sscanf(tgtname, "end_device-%d:%d",
+			if (tgtname && sscanf(tgtname, "end_device-%d:%d",
 				   &host, &tgtid) == 2)
 				break;
 			tgtdev = udev_device_get_parent(tgtdev);
@@ -389,7 +389,7 @@ sysfs_get_tgt_nodename(struct path *pp, char *node)
 	/* Check for FibreChannel */
 	tgtdev = udev_device_get_parent(parent);
 	value = udev_device_get_sysname(tgtdev);
-	if (sscanf(value, "rport-%d:%d-%d",
+	if (value && sscanf(value, "rport-%d:%d-%d",
 		   &host, &channel, &tgtid) == 3) {
 		tgtdev = udev_device_new_from_subsystem_sysname(udev,
 				"fc_remote_ports", value);
@@ -519,6 +519,9 @@ int sysfs_get_host_pci_name(const struct path *pp, char *pci_name)
 		 */
 		value = udev_device_get_sysname(parent);

+		if (!value)
+			return 1;
+
 		strncpy(pci_name, value, SLOT_NAME_SIZE);
 		udev_device_unref(hostdev);
 		return 0;
@@ -1468,6 +1471,8 @@ ccw_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 	 * host / bus / target / lun
 	 */
 	attr_path = udev_device_get_sysname(parent);
+	if (!attr_path)
+		return PATHINFO_FAILED;
 	pp->sg_id.lun = 0;
 	if (sscanf(attr_path, "%i.%i.%x",
 		   &pp->sg_id.host_no,
diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index 0bc5106e..b726be2a 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -482,6 +482,7 @@ _find_path_by_syspath(struct nvme_map *map, const char *syspath)
 	struct nvme_pathgroup *pg;
 	char real[PATH_MAX];
 	const char *ppath;
+	const char *psyspath;
 	int i;

 	ppath = realpath(syspath, real);
@@ -493,8 +494,8 @@ _find_path_by_syspath(struct nvme_map *map, const char *syspath)
 	vector_foreach_slot(&map->pgvec, pg, i) {
 		struct nvme_path *path = nvme_pg_to_path(pg);

-		if (!strcmp(ppath,
-			    udev_device_get_syspath(path->udev)))
+		psyspath = udev_device_get_syspath(path->udev);
+		if (psyspath && !strcmp(ppath, psyspath))
 			return path;
 	}
 	condlog(4, "%s: %s: %s not found", __func__, THIS, ppath);
@@ -538,6 +539,7 @@ struct udev_device *get_ctrl_blkdev(const struct context *ctx,
 	struct udev_list_entry *item;
 	struct udev_device *blkdev = NULL;
 	struct udev_enumerate *enm = udev_enumerate_new(ctx->udev);
+	const char *devtype;

 	if (enm == NULL)
 		return NULL;
@@ -562,7 +564,9 @@ struct udev_device *get_ctrl_blkdev(const struct context *ctx,
 					   udev_list_entry_get_name(item));
 		if (tmp == NULL)
 			continue;
-		if (!strcmp(udev_device_get_devtype(tmp), "disk")) {
+
+		devtype = udev_device_get_devtype(tmp);
+		if (devtype && !strcmp(devtype, "disk")) {
 			blkdev = tmp;
 			break;
 		} else
-- 

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

