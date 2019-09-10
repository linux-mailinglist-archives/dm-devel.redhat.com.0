Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 9976CAF2FB
	for <lists+dm-devel@lfdr.de>; Wed, 11 Sep 2019 00:40:12 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2C78F10CC1F1;
	Tue, 10 Sep 2019 22:40:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A114B1001B05;
	Tue, 10 Sep 2019 22:40:08 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 308C01800B74;
	Tue, 10 Sep 2019 22:39:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8AMdRDq030072 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 10 Sep 2019 18:39:27 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 859505C224; Tue, 10 Sep 2019 22:39:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F0C65C21E;
	Tue, 10 Sep 2019 22:39:24 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8AMdNOG009385; 
	Tue, 10 Sep 2019 17:39:23 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8AMdNsJ009384;
	Tue, 10 Sep 2019 17:39:23 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 10 Sep 2019 17:39:18 -0500
Message-Id: <1568155161-9343-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
References: <1568155161-9343-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] mpathpersist: remove broken/unused code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Tue, 10 Sep 2019 22:40:11 +0000 (UTC)

The test for an empty pp->dev in updatepaths() dates back to when
disassemble_map() didn't fill in pp->dev for newly added paths, and it
was meant to catch paths that got added by disassemble_map().  With the
mpathpersist speedup code, all paths get added by disassemble_map().
However, disassemble_map() now calls devt2devname() to set pp->dev if
possible.  This means that there is no point in calling devt2devname()
again in updatepaths(). If for some reason it did return success, the
current code would still fail, since it doesn't set pp->udev in this
code path. The best thing to do if disassemble_map() couldn't set
pp->dev is simply to fail the path.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 53022f5b..603cfc3b 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -82,18 +82,10 @@ updatepaths (struct multipath * mpp)
 
 		vector_foreach_slot (pgp->paths, pp, j){
 			if (!strlen(pp->dev)){
-				if (devt2devname(pp->dev, FILE_NAME_SIZE,
-						 pp->dev_t)){
-					/*
-					 * path is not in sysfs anymore
-					 */
-					pp->state = PATH_DOWN;
-					continue;
-				}
-				pp->mpp = mpp;
-				conf = get_multipath_config();
-				pathinfo(pp, conf, DI_ALL);
-				put_multipath_config(conf);
+				/*
+				 * path is not in sysfs anymore
+				 */
+				pp->state = PATH_DOWN;
 				continue;
 			}
 			pp->mpp = mpp;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
