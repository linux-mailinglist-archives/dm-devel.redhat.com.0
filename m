Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 78D9A219DFA
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:00 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-277-Ook09AeZOdiAr3Yj1rJJrA-1; Thu, 09 Jul 2020 06:36:57 -0400
X-MC-Unique: Ook09AeZOdiAr3Yj1rJJrA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12F39107BEFF;
	Thu,  9 Jul 2020 10:36:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E2D5710013C2;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 70D1D1809547;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AalZL031571 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AC82C217B436; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A471B217B435
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D597856A59
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-139-QHat-VeLMbamBFHxuMQP0Q-1;
	Thu, 09 Jul 2020 06:36:42 -0400
X-MC-Unique: QHat-VeLMbamBFHxuMQP0Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id EF4C5AE6F;
	Thu,  9 Jul 2020 10:36:40 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:14 +0200
Message-Id: <20200709103623.8302-4-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AalZL031571
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 45/54] libmultipath: path_discover(): use
	find_path_by_devt()
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

In path_discover(), it's actually expected that a the path to be discovered is
not already in pathvec. So, do search by devt in the first place rather than
searching twice.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index e26aae2..5f4ebf0 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -125,27 +125,19 @@ static int
 path_discover (vector pathvec, struct config * conf,
 	       struct udev_device *udevice, int flag)
 {
-	struct path * pp;
-	const char * devname;
-
-	devname = udev_device_get_sysname(udevice);
-	if (!devname)
-		return PATHINFO_FAILED;
-
-	pp = find_path_by_dev(pathvec, devname);
-	if (!pp) {
-		char devt[BLK_DEV_SIZE];
-		dev_t devnum = udev_device_get_devnum(udevice);
+	struct path *pp;
+	char devt[BLK_DEV_SIZE];
+	dev_t devnum = udev_device_get_devnum(udevice);
 
-		snprintf(devt, BLK_DEV_SIZE, "%d:%d",
-			 major(devnum), minor(devnum));
-		pp = find_path_by_devt(pathvec, devt);
-		if (!pp)
-			return store_pathinfo(pathvec, conf,
-					      udevice, flag | DI_BLACKLIST,
-					      NULL);
-	}
-	return pathinfo(pp, conf, flag);
+	snprintf(devt, BLK_DEV_SIZE, "%d:%d",
+		 major(devnum), minor(devnum));
+	pp = find_path_by_devt(pathvec, devt);
+	if (!pp)
+		return store_pathinfo(pathvec, conf,
+				      udevice, flag | DI_BLACKLIST,
+				      NULL);
+	else
+		return pathinfo(pp, conf, flag);
 }
 
 static void cleanup_udev_enumerate_ptr(void *arg)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

