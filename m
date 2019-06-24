Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 35687505C9
	for <lists+dm-devel@lfdr.de>; Mon, 24 Jun 2019 11:31:35 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BD7B1308124D;
	Mon, 24 Jun 2019 09:31:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8BFB15D720;
	Mon, 24 Jun 2019 09:31:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1CDF5206D3;
	Mon, 24 Jun 2019 09:31:32 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x5O9TgZ1005689 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Jun 2019 05:29:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 89ACD1001B29; Mon, 24 Jun 2019 09:29:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B93E1001B07;
	Mon, 24 Jun 2019 09:29:40 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A2D60368E6;
	Mon, 24 Jun 2019 09:29:31 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-2.provo.novell.com
	[137.65.226.36])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Mon, 24 Jun 2019 03:29:26 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>,
	Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 24 Jun 2019 11:27:51 +0200
Message-Id: <20190624092756.7769-27-mwilck@suse.com>
In-Reply-To: <20190624092756.7769-1-mwilck@suse.com>
References: <20190624092756.7769-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.30]); Mon, 24 Jun 2019 09:29:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]);
	Mon, 24 Jun 2019 09:29:32 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.30
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 25/30] libmultipath: get_uid: straighten the
	fallback logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Mon, 24 Jun 2019 09:31:33 +0000 (UTC)

The code had two distinct fallback paths, with non-obvious logic.
Try to straighten it out. The "allow_fallback" logic from
ffaf9477d115 "multipathd: Don't use fallback code after getting wwid"
should only apply in the case where get_udev_uid() failed, not
if it wasn't even tried. Moreover, uid_attribute is hardly ever NULL
since ffaf9477; allow the user to set it to the empty string to
skip udev-based WWID determination. This is rather not meant for
production, but it's useful for testing. Finally, only set "origin"
to "udev" if a WWID was actually retrieved from udev.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/discovery.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index b10afdef..d7eaee68 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1876,20 +1876,20 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 			len = strlen(pp->wwid);
 		origin = "callout";
 	} else {
+		bool udev_available = udev && pp->uid_attribute
+			&& *pp->uid_attribute;
 
-		if (udev && pp->uid_attribute) {
+		if (udev_available) {
 			len = get_udev_uid(pp, pp->uid_attribute, udev);
-			origin = "udev";
 			if (len <= 0)
 				condlog(1,
 					"%s: failed to get udev uid: %s",
 					pp->dev, strerror(-len));
-
-		} else if (pp->bus == SYSFS_BUS_SCSI) {
-			len = get_vpd_uid(pp);
-			origin = "sysfs";
+			else
+				origin = "udev";
 		}
-		if (len <= 0 && allow_fallback && has_uid_fallback(pp)) {
+		if ((!udev_available || (len <= 0 && allow_fallback))
+		    && has_uid_fallback(pp)) {
 			used_fallback = 1;
 			len = uid_fallback(pp, path_state, &origin);
 		}
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
