Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 6533D219D7E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:53 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-167-vKxjFG3FNxuSwmHtc4ozNw-1; Thu, 09 Jul 2020 06:17:50 -0400
X-MC-Unique: vKxjFG3FNxuSwmHtc4ozNw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6588005B0;
	Thu,  9 Jul 2020 10:17:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6ABF45C3E7;
	Thu,  9 Jul 2020 10:17:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C37F1809557;
	Thu,  9 Jul 2020 10:17:42 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH5ZA029594 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CAE372156A59; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C698F2156A54
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A7B1D83B9F0
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:05 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-432-9ZKwrOXNMh6G7txUUjCzgQ-1;
	Thu, 09 Jul 2020 06:16:59 -0400
X-MC-Unique: 9ZKwrOXNMh6G7txUUjCzgQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 87A35B084;
	Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:16 +0200
Message-Id: <20200709101620.6786-32-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH5ZA029594
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 31/35] libmultipath: alloc_path_with_pathinfo():
	treat devname overflow as error
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is to be consistent with store_path_with_pathinfo(). It's not strictly
necessary; we _could_ proceed in both functions even in the unlikely case
that the device name overflows, because we use pp->dev mainly for log
messages. However, a device node name that causes an overflow for
FILE_NAME_SIZE = 256 should be considered pathologic anyway.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 10b5a28..81a3fad 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -64,6 +64,7 @@ alloc_path_with_pathinfo (struct config *conf, struct udev_device *udevice,
 
 	if (safe_sprintf(pp->dev, "%s", devname)) {
 		condlog(0, "pp->dev too small");
+		err = 1;
 	} else {
 		pp->udev = udev_device_ref(udevice);
 		err = pathinfo(pp, conf, flag | DI_BLACKLIST);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

