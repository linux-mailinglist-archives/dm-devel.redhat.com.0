Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF5515388C
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:59:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929140;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6/q+fUsG2yXbCJAprPzoPbIeFzjOREG1Wikor49JAtg=;
	b=Vqzi8SJgnYZcOXoMFNWYkj64j466vLhj5ZNwzb4thlAMPP2Z7cxSWxCFNv2CJZSFZWLo9J
	8cNEXSiIvURpuCuOU7WEJyM3Q6Tl0sC7GHFVlK8eepSVCjCqhkrI2eYzHBpxslDwpcAmyj
	2XcxANo9oCX+j9aHtSZ+61XNTgxCxPg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-259-QHuJgVXZOny-HUqMXlaqkg-1; Wed, 05 Feb 2020 13:58:58 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3344D189F762;
	Wed,  5 Feb 2020 18:58:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 04E015C54A;
	Wed,  5 Feb 2020 18:58:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90EA5866A2;
	Wed,  5 Feb 2020 18:58:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwZJ3019466 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C5785790C4; Wed,  5 Feb 2020 18:58:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AF2DE790D4;
	Wed,  5 Feb 2020 18:58:35 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwYwT032722; 
	Wed, 5 Feb 2020 12:58:34 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwYvl032721;
	Wed, 5 Feb 2020 12:58:34 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:14 -0600
Message-Id: <1580929100-32572-12-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 11/17] libmultipath: change how the checker
	async is set
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: QHuJgVXZOny-HUqMXlaqkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The way that the checkers async mode worked in multipathd didn't make
much sense. When multipathd starts up, all checker classes are in the
sync mode, and any pathinfo() calls on devices would run the checker in
sync mode. However, the First time a checker class was used in
checkerloop, it would set that checker class to async (assuming
force_sync wasn't set).  After that, no matter when a checker from that
class was called, it would always run in async mode.  Multipathd doesn't
need to run checkers in sync mode at all, so don't.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c |  2 +-
 libmultipath/discovery.c        | 10 ++++------
 multipath/main.c                |  1 +
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 603cfc3b..b2238f00 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -47,7 +47,7 @@ mpath_lib_init (void)
 		condlog(0, "Failed to initialize multipath config.");
 		return NULL;
 	}
-
+	conf->force_sync = 1;
 	set_max_fds(conf->max_fds);
 
 	return conf;
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index c2311b66..bee5b77b 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1649,12 +1649,10 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
 	if (pp->mpp && !c->mpcontext)
 		checker_mp_init(c, &pp->mpp->mpcontext);
 	checker_clear_message(c);
-	if (daemon) {
-		if (conf->force_sync == 0)
-			checker_set_async(c);
-		else
-			checker_set_sync(c);
-	}
+	if (conf->force_sync == 0)
+		checker_set_async(c);
+	else
+		checker_set_sync(c);
 	if (!conf->checker_timeout &&
 	    sysfs_get_timeout(pp, &(c->timeout)) <= 0)
 		c->timeout = DEF_TIMEOUT;
diff --git a/multipath/main.c b/multipath/main.c
index 4f4d8e89..aebabd9b 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -905,6 +905,7 @@ main (int argc, char *argv[])
 		exit(RTVL_FAIL);
 	multipath_conf = conf;
 	conf->retrigger_tries = 0;
+	conf->force_sync = 1;
 	while ((arg = getopt(argc, argv, ":adcChl::FfM:v:p:b:BrR:itTquUwW")) != EOF ) {
 		switch(arg) {
 		case 1: printf("optarg : %s\n",optarg);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

