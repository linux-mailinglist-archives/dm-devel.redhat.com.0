Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [63.128.21.74])
	by mail.lfdr.de (Postfix) with ESMTP id 956D3193747
	for <lists+dm-devel@lfdr.de>; Thu, 26 Mar 2020 05:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585196605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G+gJAXq7TCSAY0nyu2poirJOf+0x4/A+AWsEribns8c=;
	b=eRnTIA2HnOoX8L/XsZ9wOift5dDdgiGJs1sPUROBobvFrYxhqm2CVek11ZVAah9TK59iAz
	3taTkX9gE1D0aaLxXtQdNStTP5+qWLLn8K4ngsLiJHsSYt82ZFZDB4uOETIQ84mygFfbKh
	Mj9AxniRP/LZxEuBxBQuRRP8lRyMnv0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-HTEyl9cpPumT0bAdz80usA-1; Thu, 26 Mar 2020 00:23:23 -0400
X-MC-Unique: HTEyl9cpPumT0bAdz80usA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D08381005512;
	Thu, 26 Mar 2020 04:23:17 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A846894B5A;
	Thu, 26 Mar 2020 04:23:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1B3C18A023;
	Thu, 26 Mar 2020 04:23:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02Q4Mu7n003811 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 00:22:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E254C94B42; Thu, 26 Mar 2020 04:22:56 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 38B34953B3;
	Thu, 26 Mar 2020 04:22:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02Q4Mq2S023760; 
	Wed, 25 Mar 2020 23:22:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02Q4Mqw0023759;
	Wed, 25 Mar 2020 23:22:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 25 Mar 2020 23:22:48 -0500
Message-Id: <1585196568-23714-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
References: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/3] libmultipath: allow force reload with no
	active paths
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the partition information has changed on multipath devices (say,
because it was updated on another node that has access to the same
storage), users expect that running "multipathd reconfigure" will update
that.  However, if the checkers for the multipath device are pending for
too long when the the device is reconfigured, multipathd will give up
waiting for them, and refuse to reload the device, since there are no
active paths. This means that no kpartx update will be triggered.

Multipath is fully capable of reloading a multipath device that has no
active paths. This has been possible for years. If multipath is supposed
to reload the device, it should do so, even if there are no active paths.

Generally, when multipath is force reloaded, kpartx will be updated.
However when a device is reloaded with no paths, the udev rules won't
run kpartx.  But they also weren't running kpartx when the first valid
path appeared, even though the dm activation rules get run in this case.
This changes 11-dm-mpath.rules to run kpartx when a device goes from no
usable paths to having usable paths.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/configure.c    | 6 ------
 multipath/11-dm-mpath.rules | 2 +-
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index c95848a0..96c79610 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -710,12 +710,6 @@ select_action (struct multipath * mpp, vector curmp, int force_reload)
 		return;
 	}
 
-	if (pathcount(mpp, PATH_UP) == 0) {
-		mpp->action = ACT_IMPOSSIBLE;
-		condlog(3, "%s: set ACT_IMPOSSIBLE (no usable path)",
-			mpp->alias);
-		return;
-	}
 	if (force_reload) {
 		mpp->force_udev_reload = 1;
 		mpp->action = ACT_RELOAD;
diff --git a/multipath/11-dm-mpath.rules b/multipath/11-dm-mpath.rules
index 07320a14..cd522e8c 100644
--- a/multipath/11-dm-mpath.rules
+++ b/multipath/11-dm-mpath.rules
@@ -75,7 +75,7 @@ ENV{MPATH_DEVICE_READY}=="0", ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="1"
 ENV{MPATH_DEVICE_READY}!="0", ENV{.MPATH_DEVICE_READY_OLD}=="0",\
 	ENV{DM_UDEV_DISABLE_OTHER_RULES_FLAG}="$env{DM_DISABLE_OTHER_RULES_FLAG_OLD}",\
 	ENV{DM_DISABLE_OTHER_RULES_FLAG_OLD}="",\
-	ENV{DM_ACTIVATION}="1"
+	ENV{DM_ACTIVATION}="1", ENV{MPATH_UNCHANGED}="0"
 
 # The code to check multipath state ends here. We need to set
 # properties and symlinks regardless whether the map is usable or
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

