Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5B820219D7B
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:50 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-Vgj2EtlEOqOvmNr1quh39A-1; Thu, 09 Jul 2020 06:17:46 -0400
X-MC-Unique: Vgj2EtlEOqOvmNr1quh39A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28339107B096;
	Thu,  9 Jul 2020 10:17:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08BAB5D9DD;
	Thu,  9 Jul 2020 10:17:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B4F031809557;
	Thu,  9 Jul 2020 10:17:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH2n5029506 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 685052157F24; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 644E82166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 432F0800897
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-232-SoyCydWGMKGPm3IYRxWr-g-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: SoyCydWGMKGPm3IYRxWr-g-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D745FB0B7;
	Thu,  9 Jul 2020 10:16:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:08 +0200
Message-Id: <20200709101620.6786-24-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH2n5029506
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 23/35] libmultipath: make sysfs_pathinfo() static
	and use const
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

... for the hwtable argument.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 5d4bf7d..c692026 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1284,7 +1284,7 @@ get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
 }
 
 static int
-scsi_sysfs_pathinfo (struct path * pp, vector hwtable)
+scsi_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 {
 	struct udev_device *parent;
 	const char *attr_path = NULL;
@@ -1351,7 +1351,7 @@ scsi_sysfs_pathinfo (struct path * pp, vector hwtable)
 }
 
 static int
-nvme_sysfs_pathinfo (struct path * pp, vector hwtable)
+nvme_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 {
 	struct udev_device *parent;
 	const char *attr_path = NULL;
@@ -1396,7 +1396,7 @@ nvme_sysfs_pathinfo (struct path * pp, vector hwtable)
 }
 
 static int
-ccw_sysfs_pathinfo (struct path * pp, vector hwtable)
+ccw_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 {
 	struct udev_device *parent;
 	char attr_buff[NAME_SIZE];
@@ -1455,7 +1455,7 @@ ccw_sysfs_pathinfo (struct path * pp, vector hwtable)
 }
 
 static int
-cciss_sysfs_pathinfo (struct path * pp, vector hwtable)
+cciss_sysfs_pathinfo (struct path *pp, const struct _vector *hwtable)
 {
 	const char * attr_path = NULL;
 	struct udev_device *parent;
@@ -1609,8 +1609,8 @@ path_offline (struct path * pp)
 	return PATH_DOWN;
 }
 
-int
-sysfs_pathinfo(struct path * pp, vector hwtable)
+static int
+sysfs_pathinfo(struct path *pp, const struct _vector *hwtable)
 {
 	int r = common_sysfs_pathinfo(pp);
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

