Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F98E22095
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:48 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D6B4530842B0;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 914C45B08F;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1BD331806B13;
	Fri, 17 May 2019 22:59:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvUHC004807 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:30 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A14DD8161; Fri, 17 May 2019 22:57:30 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.40])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CD0F1972A;
	Fri, 17 May 2019 22:57:28 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 24E4E308429D;
	Fri, 17 May 2019 22:57:27 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:23 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:57:00 +0200
Message-Id: <20190517225703.16295-5-mwilck@suse.com>
In-Reply-To: <20190517225703.16295-1-mwilck@suse.com>
References: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.40]); Fri, 17 May 2019 22:57:27 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]);
	Fri, 17 May 2019 22:57:27 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.40
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 4/7] libmpathpersist: updatepaths: deal with
	missing pp->udev
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Fri, 17 May 2019 22:59:46 +0000 (UTC)

We will change the data structure initialization to a lazy
approach, where pp->udev isn't necessarily initialized
when get_mpvec() is called. Deal with it.
---
 libmpathpersist/mpath_persist.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 6505774f..fee1db72 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -16,6 +16,7 @@
 #include "config.h"
 #include "switchgroup.h"
 #include "discovery.h"
+#include "configure.h"
 #include "dmparser.h"
 #include <ctype.h>
 #include "propsel.h"
@@ -96,6 +97,17 @@ updatepaths (struct multipath * mpp)
 				continue;
 			}
 			pp->mpp = mpp;
+			if (pp->udev == NULL) {
+				pp->udev = get_udev_device(pp->dev_t, DEV_DEVT);
+				if (pp->udev == NULL) {
+					pp->state = PATH_DOWN;
+					continue;
+				}
+				conf = get_multipath_config();
+				pathinfo(pp, conf, DI_SYSFS|DI_CHECKER);
+				put_multipath_config(conf);
+				continue;
+			}
 			if (pp->state == PATH_UNCHECKED ||
 					pp->state == PATH_WILD) {
 				conf = get_multipath_config();
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
