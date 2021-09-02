Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0FC603FF6C7
	for <lists+dm-devel@lfdr.de>; Fri,  3 Sep 2021 00:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630620197;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=p19JDSE8AhzyMeoT5bWAvHyxNJaBlHns2VAvIip1GZo=;
	b=F0V8/xSDr6mkVZjk2y1+GDDAsU2opIkF0PYU+EIo+784uQeR+LjLOecfw2FxByRD65W1zL
	GYyR+IqUn+PEA2EkcvoIS8wdsueL69LQGtdo/ektgirpoEFcSa4wPZ33J569S+Ntvz+Lm+
	eu/4Add+/8jkPWzEyNpAAYCWklQbWY8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-HW6DjHoYNOqvJV7qCszJ6Q-1; Thu, 02 Sep 2021 18:03:15 -0400
X-MC-Unique: HW6DjHoYNOqvJV7qCszJ6Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E42E118766DC;
	Thu,  2 Sep 2021 22:03:09 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1BCA60BF1;
	Thu,  2 Sep 2021 22:03:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 722AD1806D0F;
	Thu,  2 Sep 2021 22:03:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182Lvwrc013347 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 17:57:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6C09F6A91F; Thu,  2 Sep 2021 21:57:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 843CC6A8F8;
	Thu,  2 Sep 2021 21:57:55 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 182LvrJZ012299; 
	Thu, 2 Sep 2021 16:57:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 182LvrTp012298;
	Thu, 2 Sep 2021 16:57:53 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Sep 2021 16:57:45 -0500
Message-Id: <1630619869-12251-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
References: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/6] mpathpersist: fail commands when no
	usable paths exist
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

"mpathpersist -oCK <reservation_key> <device>" will return success if it
is run on devices with no usable paths, but nothing is actually done.
The -L command will fail, but it should give up sooner, and with a more
helpful error message.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 190e9707..26710e79 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -604,7 +604,8 @@ int mpath_prout_common(struct multipath *mpp,int rq_servact, int rq_scope,
 			return ret ;
 		}
 	}
-	return MPATH_PR_SUCCESS;
+	condlog (0, "%s: no path available", mpp->wwid);
+	return MPATH_PR_DMMP_ERROR;
 }
 
 int send_prout_activepath(char * dev, int rq_servact, int rq_scope,
@@ -663,6 +664,11 @@ int mpath_prout_rel(struct multipath *mpp,int rq_servact, int rq_scope,
 
 	active_pathcount = count_active_paths(mpp);
 
+	if (active_pathcount == 0) {
+		condlog (0, "%s: no path available", mpp->wwid);
+		return MPATH_PR_DMMP_ERROR;
+	}
+
 	struct threadinfo thread[active_pathcount];
 	memset(thread, 0, sizeof(thread));
 	for (i = 0; i < active_pathcount; i++){
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

