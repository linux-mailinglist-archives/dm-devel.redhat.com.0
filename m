Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB7B2EF627
	for <lists+dm-devel@lfdr.de>; Fri,  8 Jan 2021 18:01:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-Zqs2GJf1ODiAjn81ok45og-1; Fri, 08 Jan 2021 12:01:46 -0500
X-MC-Unique: Zqs2GJf1ODiAjn81ok45og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6F095801817;
	Fri,  8 Jan 2021 17:01:40 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C5862954;
	Fri,  8 Jan 2021 17:01:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 684AD4E590;
	Fri,  8 Jan 2021 17:01:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 108H1OL3022597 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 8 Jan 2021 12:01:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 380F32166B2F; Fri,  8 Jan 2021 17:01:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 329FA2166B29
	for <dm-devel@redhat.com>; Fri,  8 Jan 2021 17:01:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D70EB858281
	for <dm-devel@redhat.com>; Fri,  8 Jan 2021 17:01:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-171-OIYCIzfXMBet1L5SW4FkyA-1;
	Fri, 08 Jan 2021 12:01:16 -0500
X-MC-Unique: OIYCIzfXMBet1L5SW4FkyA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8AAB5AD57;
	Fri,  8 Jan 2021 17:01:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri,  8 Jan 2021 18:00:42 +0100
Message-Id: <20210108170044.7883-2-mwilck@suse.com>
In-Reply-To: <20210108170044.7883-1-mwilck@suse.com>
References: <20210108170044.7883-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 108H1OL3022597
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: select_action(): skip
	is_mpp_known_to_udev() test
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This test is now superseded by the check introduced in
0d66e03 ("libmultipath: force map reload if udev incomplete").

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index d9fd9cb..999f310 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -635,15 +635,6 @@ trigger_paths_udev_change(struct multipath *mpp, bool is_mpath)
 	mpp->needs_paths_uevent = 0;
 }
 
-static int
-is_mpp_known_to_udev(const struct multipath *mpp)
-{
-	struct udev_device *udd = get_udev_for_mpp(mpp);
-	int ret = (udd != NULL);
-	udev_device_unref(udd);
-	return ret;
-}
-
 static int
 sysfs_set_max_sectors_kb(struct multipath *mpp, int is_reload)
 {
@@ -865,12 +856,6 @@ void select_action (struct multipath *mpp, const struct _vector *curmp,
 			mpp->alias);
 		return;
 	}
-	if (!is_mpp_known_to_udev(cmpp)) {
-		mpp->action = ACT_RELOAD;
-		condlog(3, "%s: set ACT_RELOAD (udev device not initialized)",
-			mpp->alias);
-		return;
-	}
 	mpp->action = ACT_NOTHING;
 	condlog(3, "%s: set ACT_NOTHING (map unchanged)",
 		mpp->alias);
-- 
2.29.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

