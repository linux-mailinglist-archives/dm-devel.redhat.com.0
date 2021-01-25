Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 50B523026D9
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 16:27:44 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-wUqDlLG0Ow2ZeIq8YTpAzg-1; Mon, 25 Jan 2021 10:27:40 -0500
X-MC-Unique: wUqDlLG0Ow2ZeIq8YTpAzg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0D0FA1572A;
	Mon, 25 Jan 2021 15:27:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C1E260C5D;
	Mon, 25 Jan 2021 15:27:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4B0384E58E;
	Mon, 25 Jan 2021 15:27:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10PFNSEr013386 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 25 Jan 2021 10:23:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C689C5D224; Mon, 25 Jan 2021 15:23:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C14DA5D225
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 15:23:25 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C96C9187504C
	for <dm-devel@redhat.com>; Mon, 25 Jan 2021 15:23:25 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-291-hKpe4UTTP8Ghb8B_dSDOJQ-1;
	Mon, 25 Jan 2021 10:23:20 -0500
X-MC-Unique: hKpe4UTTP8Ghb8B_dSDOJQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4241EB9D5;
	Mon, 25 Jan 2021 15:23:19 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>, lixiaokeng@huawei.com
Date: Mon, 25 Jan 2021 16:23:04 +0100
Message-Id: <20210125152304.28024-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 10PFNSEr013386
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: snprint_devices(): avoid NULL
	dereference
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

All libudev functions may return NULL. Watch out for it.

Fixes: d041258 ("libmultipath: snprint_devices(): use udev_enumerate"
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/print.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index 19de2c7..8151e11 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -2055,8 +2055,16 @@ int snprint_devices(struct config *conf, char *buff, size_t len,
 		struct udev_device *u_dev;
 
 		path = udev_list_entry_get_name(item);
+		if (!path)
+			continue;
 		u_dev = udev_device_new_from_syspath(udev, path);
+		if (!u_dev)
+			continue;
 		devname = udev_device_get_sysname(u_dev);
+		if (!devname) {
+			udev_device_unref(u_dev);
+			continue;
+		}
 
 		fwd += snprintf(buff + fwd, len - fwd, "    %s", devname);
 		if (fwd >= len)
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

