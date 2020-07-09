Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id C150A219DFF
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-Mc5ppVO3Mf-5vM_xUMmEmA-1; Thu, 09 Jul 2020 06:37:06 -0400
X-MC-Unique: Mc5ppVO3Mf-5vM_xUMmEmA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9E38108BD0B;
	Thu,  9 Jul 2020 10:36:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA4115DAA0;
	Thu,  9 Jul 2020 10:36:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 752FD93F81;
	Thu,  9 Jul 2020 10:36:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069Aam0L031601 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D65752166BA4; Thu,  9 Jul 2020 10:36:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D28C62166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B16E68EF3A5
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-231--qOh-7hPMDijc1HAzaq56A-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: -qOh-7hPMDijc1HAzaq56A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 76B3DAE7A;
	Thu,  9 Jul 2020 10:36:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:16 +0200
Message-Id: <20200709103623.8302-6-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069Aam0L031601
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 47/54] libmultipath: get_refwwid(): use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

If get_refwwid is called with a dev_t argument, there's no point in converting
it into a devname first. If the device doesn't exist, get_udev_device() will fail.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 75e11fd..e8d6db8 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1414,17 +1414,15 @@ int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 
 	if (dev_type == DEV_DEVT) {
 		strchop(dev);
-		if (devt2devname(buff, FILE_NAME_SIZE, dev)) {
-			condlog(0, "%s: cannot find block device\n", dev);
-			return 1;
-		}
-		pp = find_path_by_dev(pathvec, buff);
+		pp = find_path_by_devt(pathvec, dev);
 		if (!pp) {
 			struct udev_device *udevice =
 				get_udev_device(dev, dev_type);
 
-			if (!udevice)
+			if (!udevice) {
+				condlog(0, "%s: cannot find block device", dev);
 				return 1;
+			}
 
 			conf = get_multipath_config();
 			pthread_cleanup_push(put_multipath_config, conf);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

