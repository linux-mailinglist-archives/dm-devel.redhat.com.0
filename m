Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 55E80219D81
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-hAP2-tODNUyOVkcPXCPccQ-1; Thu, 09 Jul 2020 06:17:50 -0400
X-MC-Unique: hAP2-tODNUyOVkcPXCPccQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4831E1085980;
	Thu,  9 Jul 2020 10:17:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A21CC0096;
	Thu,  9 Jul 2020 10:17:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30C9D1809557;
	Thu,  9 Jul 2020 10:17:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH3Xb029559 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:03 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 46A47114B2F8; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423F5114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2447C800A18
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-91-MDPx2u4dORqKhq5PsZ1Hrw-1;
	Thu, 09 Jul 2020 06:16:58 -0400
X-MC-Unique: MDPx2u4dORqKhq5PsZ1Hrw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 19CADB07D;
	Thu,  9 Jul 2020 10:16:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:14 +0200
Message-Id: <20200709101620.6786-30-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH3Xb029559
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 29/35] libmultipath: snprint_devices(): print
	hidden/foreign status
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

The "hidden" and "claimed by foreign" properties take precedence
over blacklisting/whitelisting in pathinfo(). We should take
this into account when printing the device list.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/print.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index fb94f86..ea95d69 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -30,6 +30,7 @@
 #include "debug.h"
 #include "discovery.h"
 #include "util.h"
+#include "foreign.h"
 
 #define MAX(x,y) (((x) > (y)) ? (x) : (y))
 #define MIN(x,y) (((x) > (y)) ? (y) : (x))
@@ -2061,13 +2062,23 @@ int snprint_devices(struct config *conf, char *buff, size_t len,
 
 		pp = find_path_by_dev(vecs->pathvec, devname);
 		if (!pp) {
-			r = filter_devnode(conf->blist_devnode,
-					   conf->elist_devnode,
-					   devname);
-			if (r > 0)
-				status = "devnode blacklisted, unmonitored";
-			else
-				status = "devnode whitelisted, unmonitored";
+			const char *hidden;
+
+			hidden = udev_device_get_sysattr_value(u_dev,
+							       "hidden");
+			if (hidden && !strcmp(hidden, "1"))
+				status = "hidden, unmonitored";
+			else if (is_claimed_by_foreign(u_dev))
+				status = "foreign, monitored";
+			else {
+				r = filter_devnode(conf->blist_devnode,
+						   conf->elist_devnode,
+						   devname);
+				if (r > 0)
+					status = "devnode blacklisted, unmonitored";
+				else
+					status = "devnode whitelisted, unmonitored";
+			}
 		} else
 			status = " devnode whitelisted, monitored";
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

