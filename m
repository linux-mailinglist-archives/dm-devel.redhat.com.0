Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 3E01B15388A
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929135;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=g1xlHCKwf4+5yWgn76MW0ZjcDXZsVvkMi2wv5KuIDpg=;
	b=F/irDChkYgX6IfGDGbzmS1QzSLQDUOXT5+rmFrF70g+KTJlaWoZuIDe5cxO7CBWtorY7x7
	vM361DB3lyPohYqaT32z09JrOvbjmOcv7NZ2v665Tn5ib5f72hzco7wx7S6d7urToFoqCn
	S6jBjMmcNpLNemzZ98olwsmHDbC0JpU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-209-Xs5D6GxkOpyXkhLbnIJKfw-1; Wed, 05 Feb 2020 13:58:52 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65F12801A15;
	Wed,  5 Feb 2020 18:58:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34D138DC13;
	Wed,  5 Feb 2020 18:58:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1A901803C41;
	Wed,  5 Feb 2020 18:58:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015Iwb3E019471 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 04FCB859D2; Wed,  5 Feb 2020 18:58:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E38AB859C5;
	Wed,  5 Feb 2020 18:58:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwZAb032737; 
	Wed, 5 Feb 2020 12:58:35 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwZEC032725;
	Wed, 5 Feb 2020 12:58:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:15 -0600
Message-Id: <1580929100-32572-13-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 12/17] libmultipath: change failed path prio
	timeout
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Xs5D6GxkOpyXkhLbnIJKfw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

multipath will try to get the priority from a PATH_DOWN path, if the
path doesn't currently have a valid priority. However, if the priority
code needs to contact the device to get the priority, this is likely to
fail for PATH_DOWN paths.  This code dates back to when multipathd could
not easily reload device tables with failed paths, so getting the
correct priority was important to have a correctly configured device.
Now multipathd can simply reload the device to move the path to the
correct pathgroup when the path comes back up.  Since there are a number
of prioritizers that don't require talking to the device, multipath
shouldn't completely skip attempting to get the priority of these paths,
but it should set a small timeout, so that it isn't hanging in the
case where it needs to contact a device through a failed path.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 14 ++++++--------
 libmultipath/prio.c      |  6 +++---
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index bee5b77b..5e88d980 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1667,11 +1667,10 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
 }
 
 static int
-get_prio (struct path * pp)
+get_prio (struct path * pp, int timeout)
 {
 	struct prio * p;
 	struct config *conf;
-	int checker_timeout;
 	int old_prio;
 
 	if (!pp)
@@ -1690,11 +1689,8 @@ get_prio (struct path * pp)
 			return 1;
 		}
 	}
-	conf = get_multipath_config();
-	checker_timeout = conf->checker_timeout;
-	put_multipath_config(conf);
 	old_prio = pp->priority;
-	pp->priority = prio_getprio(p, pp, checker_timeout);
+	pp->priority = prio_getprio(p, pp, timeout);
 	if (pp->priority < 0) {
 		/* this changes pp->offline, but why not */
 		int state = path_offline(pp);
@@ -2101,11 +2097,13 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 
 	 /*
 	  * Retrieve path priority, even for PATH_DOWN paths if it has never
-	  * been successfully obtained before.
+	  * been successfully obtained before. If path is down don't try
+	  * for too long.
 	  */
 	if ((mask & DI_PRIO) && path_state == PATH_UP && strlen(pp->wwid)) {
 		if (pp->state != PATH_DOWN || pp->priority == PRIO_UNDEF) {
-			get_prio(pp);
+			get_prio(pp, (pp->state != PATH_DOWN)?
+				     (conf->checker_timeout * 1000) : 10);
 		}
 	}
 
diff --git a/libmultipath/prio.c b/libmultipath/prio.c
index 87de1f97..194563c4 100644
--- a/libmultipath/prio.c
+++ b/libmultipath/prio.c
@@ -10,11 +10,11 @@
 
 static LIST_HEAD(prioritizers);
 
-unsigned int get_prio_timeout(unsigned int checker_timeout,
+unsigned int get_prio_timeout(unsigned int timeout_ms,
 			      unsigned int default_timeout)
 {
-	if (checker_timeout)
-		return checker_timeout * 1000;
+	if (timeout_ms)
+		return timeout_ms;
 	return default_timeout;
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

