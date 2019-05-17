Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id BD17622091
	for <lists+dm-devel@lfdr.de>; Sat, 18 May 2019 00:59:10 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 787D0F74C3;
	Fri, 17 May 2019 22:59:08 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AEDEE1972A;
	Fri, 17 May 2019 22:59:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 43CA01806B12;
	Fri, 17 May 2019 22:59:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x4HMvbLV004841 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 17 May 2019 18:57:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 58875611CA; Fri, 17 May 2019 22:57:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 516BD60852;
	Fri, 17 May 2019 22:57:37 +0000 (UTC)
Received: from smtp2.provo.novell.com (smtp2.provo.novell.com [137.65.250.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 117787FDF9;
	Fri, 17 May 2019 22:57:36 +0000 (UTC)
Received: from apollon.suse.de.de (prva10-snat226-1.provo.novell.com
	[137.65.226.35])
	by smtp2.provo.novell.com with ESMTP (TLS encrypted);
	Fri, 17 May 2019 16:57:28 -0600
From: Martin Wilck <mwilck@suse.com>
To: Benjamin Marzinski <bmarzins@redhat.com>
Date: Sat, 18 May 2019 00:57:03 +0200
Message-Id: <20190517225703.16295-8-mwilck@suse.com>
In-Reply-To: <20190517225703.16295-1-mwilck@suse.com>
References: <20190517225703.16295-1-mwilck@suse.com>
MIME-Version: 1.0
X-Greylist: Sender passed SPF test, Sender IP whitelisted by DNSRBL, ACL 216
	matched, not delayed by milter-greylist-4.5.16 (mx1.redhat.com
	[10.5.110.27]); Fri, 17 May 2019 22:57:36 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Fri, 17 May 2019 22:57:36 +0000 (UTC) for IP:'137.65.250.81'
	DOMAIN:'smtp2.provo.novell.com' HELO:'smtp2.provo.novell.com'
	FROM:'mwilck@suse.com' RCPT:''
X-RedHat-Spam-Score: -2.3  (RCVD_IN_DNSWL_MED, SPF_HELO_NONE,
	SPF_PASS) 137.65.250.81 smtp2.provo.novell.com
	137.65.250.81 smtp2.provo.novell.com <mwilck@suse.com>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: dbond@redhat.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [RFC PATCH 7/7] libmpathpersist: don't bother with
	priorities
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.38]); Fri, 17 May 2019 22:59:09 +0000 (UTC)

We send our PR commands to every active path, regardless of priority.
Thus we can save the effort to obtain priorities.
---
 libmpathpersist/mpath_persist.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index ce72da67..599c5e9e 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -114,12 +114,6 @@ updatepaths (struct multipath * mpp)
 				pathinfo(pp, conf, DI_CHECKER);
 				put_multipath_config(conf);
 			}
-
-			if (pp->priority == PRIO_UNDEF) {
-				conf = get_multipath_config();
-				pathinfo(pp, conf, DI_PRIO);
-				put_multipath_config(conf);
-			}
 		}
 	}
 	return 0;
@@ -413,7 +407,6 @@ get_mpvec (vector curmp, vector pathvec, char * refwwid)
 		 * about them
 		 */
 		updatepaths(mpp);
-		mpp->bestpg = select_path_group (mpp);
 		disassemble_status (status, mpp);
 
 	}
-- 
2.21.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
