Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id A8C8A1401C5
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:19:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227549;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=l7OVQlDj6XpBlicYM4lwDKq8J6lh4GG7FlQUmxFEtxM=;
	b=Ka8GB01A9NIHjDJgGf0PYKfyfmR0MtXJWwUezww0RIoIevDUzEYGUDJmjdBDeNcJm6ytP7
	c9Yc2Zu+BKiRzS99ZQR9OQK9xRtRcKbF6Y5e7hw7WUXyre0XHVRH8QseAFs0xl2imjBB25
	6jRxFw6tKL+/8965Oa4hFGrplezEfKY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-ibzfgC4dO3Wp2V82cF0EvA-1; Thu, 16 Jan 2020 21:19:08 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50C8F18AAFB1;
	Fri, 17 Jan 2020 02:18:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A8575D9C9;
	Fri, 17 Jan 2020 02:18:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B15A38708B;
	Fri, 17 Jan 2020 02:18:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IhEp030726 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6BCE438B; Fri, 17 Jan 2020 02:18:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E12619C5B;
	Fri, 17 Jan 2020 02:18:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IdZm017281; 
	Thu, 16 Jan 2020 20:18:39 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2IdMn017280;
	Thu, 16 Jan 2020 20:18:39 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:16 -0600
Message-Id: <1579227500-17196-12-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 11/15] libmultipath: change failed path prio
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: ibzfgC4dO3Wp2V82cF0EvA-1
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
 libmultipath/prio.c      |  2 +-
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 1ab093f4..2c331db8 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1661,11 +1661,10 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
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
@@ -1684,11 +1683,8 @@ get_prio (struct path * pp)
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
@@ -2095,11 +2091,13 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 
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
index 87de1f97..21c1b092 100644
--- a/libmultipath/prio.c
+++ b/libmultipath/prio.c
@@ -14,7 +14,7 @@ unsigned int get_prio_timeout(unsigned int checker_timeout,
 			      unsigned int default_timeout)
 {
 	if (checker_timeout)
-		return checker_timeout * 1000;
+		return checker_timeout;
 	return default_timeout;
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

