Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 160DD213082
	for <lists+dm-devel@lfdr.de>; Fri,  3 Jul 2020 02:38:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593736737;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wFXlzZzDkCvOgCE0WsKubnCVGf73CuJzWd9I8C/VjyQ=;
	b=X7FKI3wSzB2HX8MBAhHX4mf280bE4VUIiGoNuuirszfCCKv5+atMbvs5lPTImwl5RjHLnK
	PQgMHgrNjHqJc2AQ3Xd//dkXXTlTqL5/kOIXuD8duPlyYny4T+8AJ4eFYZ7oOIGntfZFv+
	yvnEV2boHuwKVZAg81I4aJ8lrNNs4IA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-322-qLp0XylvM7aINIlD0pugyg-1; Thu, 02 Jul 2020 20:38:54 -0400
X-MC-Unique: qLp0XylvM7aINIlD0pugyg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8414180040A;
	Fri,  3 Jul 2020 00:38:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 66797778A8;
	Fri,  3 Jul 2020 00:38:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C97701809554;
	Fri,  3 Jul 2020 00:38:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0630cXMD019284 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Jul 2020 20:38:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 703296111F; Fri,  3 Jul 2020 00:38:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9DB81610FD;
	Fri,  3 Jul 2020 00:38:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0630cTgW014258; 
	Thu, 2 Jul 2020 19:38:29 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0630cTZt014257;
	Thu, 2 Jul 2020 19:38:29 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Jul 2020 19:38:24 -0500
Message-Id: <1593736707-14216-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
References: <1593736707-14216-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <mwilck@suse.com>, Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/4] libmultipath: fix sysfs dev_loss_tmo
	parsing
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dev_loss_tmo is a u32 value. However the kernel sysfs code prints it as
a signed integer. This means that if dev_loss_tmo is above INT_MAX, the
sysfs value will be a negative number. Parsing this was causing
sysfs_set_rport_tmo() to fail.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index ffec5162..83a41a4a 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -583,7 +583,7 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 	struct udev_device *rport_dev = NULL;
 	char value[16], *eptr;
 	char rport_id[32];
-	unsigned long long tmo = 0;
+	unsigned int tmo;
 	int ret;
 
 	sprintf(rport_id, "rport-%d:%d-%d",
@@ -607,8 +607,8 @@ sysfs_set_rport_tmo(struct multipath *mpp, struct path *pp)
 			"error %d", rport_id, -ret);
 		goto out;
 	}
-	tmo = strtoull(value, &eptr, 0);
-	if (value == eptr || tmo == ULLONG_MAX) {
+	tmo = strtoul(value, &eptr, 0);
+	if (value == eptr) {
 		condlog(0, "%s: Cannot parse dev_loss_tmo "
 			"attribute '%s'", rport_id, value);
 		goto out;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

