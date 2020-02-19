Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id B7251163D4A
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:54:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095297;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=InggKBOUgL32zYu5IjcNctPQ81VUr5NwYrIin3OHZvs=;
	b=TF0o8EqgCZVhZIj0pZeWAgi+Oe/KFBHzWZipPhpJlTJI3pNVBGJDAi2IvYDHTcvJkrotj+
	FEBq0yZlUiLrVtwpT0CeP7hFo2dsQWwFbhx+mC25IwOibtc3dSFZRyIHYwkv2F/zg9PbAv
	uS7Vb3oHvUsLjp7If8BBH1HLCPcv1fU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-nopZQE6lPnymkwItbt1o7w-1; Wed, 19 Feb 2020 01:54:55 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E201B1857347;
	Wed, 19 Feb 2020 06:54:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CBEF190F69;
	Wed, 19 Feb 2020 06:54:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84CE635AE1;
	Wed, 19 Feb 2020 06:54:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6sefL016794 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:54:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC44E90526; Wed, 19 Feb 2020 06:54:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5431F90089;
	Wed, 19 Feb 2020 06:54:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6sbSv010325; 
	Wed, 19 Feb 2020 00:54:37 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6saKv010324;
	Wed, 19 Feb 2020 00:54:36 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:54:30 -0600
Message-Id: <1582095273-10279-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/5] libmultipath: turn pp->vpd_data into a
	pointer
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: nopZQE6lPnymkwItbt1o7w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of always allocating space in the path structure for vpd_data,
only allocte it when necessary.

Also, fix comments on vpd tests

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 17 +++++++++++++++--
 libmultipath/print.c     |  4 ++--
 libmultipath/structs.c   |  3 +++
 libmultipath/structs.h   |  2 +-
 tests/vpd.c              |  3 ++-
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 23a7889c..ee3290cd 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1649,8 +1649,21 @@ scsi_ioctl_pathinfo (struct path * pp, int mask)
 	select_vpd_vendor_id(pp);
 	vpd_id = pp->vpd_vendor_id;
 
-	if (vpd_id != VPD_VP_UNDEF && get_vpd_sgio(pp->fd, vpd_vendor_pages[vpd_id].pg, vpd_id, pp->vpd_data, sizeof(pp->vpd_data)) < 0)
-		condlog(3, "%s: failed to get extra vpd data", pp->dev);
+	if (vpd_id != VPD_VP_UNDEF) {
+		char vpd_data[VPD_DATA_SIZE] = {0};
+
+		if (get_vpd_sgio(pp->fd, vpd_vendor_pages[vpd_id].pg, vpd_id,
+		    vpd_data, sizeof(vpd_data)) < 0)
+			condlog(3, "%s: failed to get extra vpd data", pp->dev);
+		else {
+			vpd_data[VPD_DATA_SIZE - 1] = '\0';
+			if (pp->vpd_data)
+				free(pp->vpd_data);
+			pp->vpd_data = strdup(vpd_data);
+			if (!pp->vpd_data)
+				condlog(0, "%s: failed to allocate space for vpd data", pp->dev);
+		}
+	}
 
 	parent = pp->udev;
 	while (parent) {
diff --git a/libmultipath/print.c b/libmultipath/print.c
index 55b19195..feb3993e 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -371,7 +371,7 @@ snprint_multipath_vpd_data(char * buff, size_t len,
 
 	vector_foreach_slot(mpp->pg, pgp, i)
 		vector_foreach_slot(pgp->paths, pp, j)
-			if (strlen(pp->vpd_data))
+			if (pp->vpd_data)
 				return snprintf(buff, len, "%s", pp->vpd_data);
 	return snprintf(buff, len, "[undef]");
 }
@@ -710,7 +710,7 @@ snprint_path_marginal(char * buff, size_t len, const struct path * pp)
 static int
 snprint_path_vpd_data(char * buff, size_t len, const struct path * pp)
 {
-	if (strlen(pp->vpd_data) > 0)
+	if (pp->vpd_data)
 		return snprintf(buff, len, "%s", pp->vpd_data);
 	return snprintf(buff, len, "[undef]");
 }
diff --git a/libmultipath/structs.c b/libmultipath/structs.c
index cc931e4e..2dd378c4 100644
--- a/libmultipath/structs.c
+++ b/libmultipath/structs.c
@@ -131,6 +131,9 @@ free_path (struct path * pp)
 		udev_device_unref(pp->udev);
 		pp->udev = NULL;
 	}
+	if (pp->vpd_data)
+		free(pp->vpd_data);
+
 	vector_free(pp->hwe);
 
 	FREE(pp);
diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index b7a01220..9bd39eb1 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -269,7 +269,7 @@ struct path {
 	char rev[PATH_REV_SIZE];
 	char serial[SERIAL_SIZE];
 	char tgt_node_name[NODE_NAME_SIZE];
-	char vpd_data[VPD_DATA_SIZE];
+	char *vpd_data;
 	unsigned long long size;
 	unsigned int checkint;
 	unsigned int tick;
diff --git a/tests/vpd.c b/tests/vpd.c
index 0331c487..3cbad811 100644
--- a/tests/vpd.c
+++ b/tests/vpd.c
@@ -520,8 +520,9 @@ static void test_vpd_eui_ ## len ## _ ## wlen ## _ ## sml(void **state)	\
 	n = create_vpd83(vt->vpdbuf, sizeof(vt->vpdbuf), test_id,	\
 			 2, 0, len);					\
 	if (sml) {							\
-		/* overwrite the page side to DEFAULT_SGIO_LEN + 1 */	\
+		/* overwrite the page size to DEFAULT_SGIO_LEN + 1 */	\
 		put_unaligned_be16(255, vt->vpdbuf + 2);		\
+		/* this causes get_vpd_sgio to do a second ioctl */	\
 		will_return(__wrap_ioctl, n);				\
 		will_return(__wrap_ioctl, vt->vpdbuf);			\
 	}								\
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

