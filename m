Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0386B24223E
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183322;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FjJuOkucTbqOLTd+OyHtJuj7yRhocY1tt8vW8yTqSm8=;
	b=Geh9l5GV9H4sZcrF/hxLekqFS0XABqfo2mmDuB1VuGSCXzW2l5fE7quckMa4C0fX02mjfE
	a4bzId8vYFBWN1Y+IXXTG/9f5DVgLnd7ZyNNNW1vCNJ3QNIouLjmYF0XZ91qdfZ+abMwcz
	V01fJtZ+KtwBD2haCSX1rGXdt4n8vxQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-7_N3d290PSS-Xp75RNCCcg-1; Tue, 11 Aug 2020 18:01:59 -0400
X-MC-Unique: 7_N3d290PSS-Xp75RNCCcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E331E918;
	Tue, 11 Aug 2020 22:01:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D78BC5FC3B;
	Tue, 11 Aug 2020 22:01:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 53FE895467;
	Tue, 11 Aug 2020 22:01:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwx2h009206 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6664887D63; Tue, 11 Aug 2020 21:58:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E63D5F1EF;
	Tue, 11 Aug 2020 21:58:56 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwswL015867; 
	Tue, 11 Aug 2020 16:58:54 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLws2L015866;
	Tue, 11 Aug 2020 16:58:54 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:43 -0500
Message-Id: <1597183123-15797-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 8/8] multipathd: log reason for calling domap()
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When multipathd calls domap(), it should also print the reason on log
level 2, it already does this on every code path except when domap is
called by the path_checker.  Also, if __setup_multipath deletes the
device, it should log that.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 2b0e2734..ee44d0fe 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -414,7 +414,7 @@ int __setup_multipath(struct vectors *vecs, struct multipath *mpp,
 {
 	if (dm_get_info(mpp->alias, &mpp->dmi)) {
 		/* Error accessing table */
-		condlog(3, "%s: cannot access table", mpp->alias);
+		condlog(2, "%s: cannot access table", mpp->alias);
 		goto out;
 	}
 
@@ -2252,13 +2252,18 @@ check_path (struct vectors * vecs, struct path * pp, unsigned int ticks)
 	 */
 	condlog(4, "path prio refresh");
 
-	if (marginal_changed)
+	if (marginal_changed) {
+		condlog(2, "%s: path is %s marginal", pp->dev,
+			(pp->marginal)? "now" : "no longer");
 		update_path_groups(pp->mpp, vecs, 1);
+	}
 	else if (update_prio(pp, new_path_up) &&
 	    (pp->mpp->pgpolicyfn == (pgpolicyfn *)group_by_prio) &&
-	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE)
+	     pp->mpp->pgfailback == -FAILBACK_IMMEDIATE) {
+		condlog(2, "%s: path priorities changed. reloading",
+			pp->mpp->alias);
 		update_path_groups(pp->mpp, vecs, !new_path_up);
-	else if (need_switch_pathgroup(pp->mpp, 0)) {
+	} else if (need_switch_pathgroup(pp->mpp, 0)) {
 		if (pp->mpp->pgfailback > 0 &&
 		    (new_path_up || pp->mpp->failback_tick <= 0))
 			pp->mpp->failback_tick =
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

