Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 91A1E3DAE7E
	for <lists+dm-devel@lfdr.de>; Thu, 29 Jul 2021 23:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627595264;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=H09IgJ9KDnJf5MuWqfx3mEHjXqsxH6+UMvGJUqC4Lu0=;
	b=GUsVTZWx8l0QxwuSkd4Lz0ryLgrah1pgUlVcnVhl73BRaqTZO6fLk/kLmQRsiGC7xHbzY1
	R33ywXJKtR1fmwyGcv93mKVgSuzcCNpbfUEpRjehRM8Is+27Q6xqlzh/0fHzfYox+4hjFI
	6Pru/iu7YTgEBhX/Vp0EJePSdEonQ6s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-PUWuwk7FNHOGKp4suXiAFQ-1; Thu, 29 Jul 2021 17:47:31 -0400
X-MC-Unique: PUWuwk7FNHOGKp4suXiAFQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BA907190B2A3;
	Thu, 29 Jul 2021 21:47:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 95AFF5D9CA;
	Thu, 29 Jul 2021 21:47:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4CDD3180BAB2;
	Thu, 29 Jul 2021 21:47:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TLkHx8030926 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 17:46:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9E90418AD4; Thu, 29 Jul 2021 21:46:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B4A786E0B7;
	Thu, 29 Jul 2021 21:46:11 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16TLkA2A020026; 
	Thu, 29 Jul 2021 16:46:10 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16TLk9VN020025;
	Thu, 29 Jul 2021 16:46:09 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 29 Jul 2021 16:46:02 -0500
Message-Id: <1627595165-19980-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
References: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 2/5] mpathpersist: fail commands when no usable
	paths exist
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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

