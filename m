Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 3E4FE242235
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183241;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=EClosdCfQpUgnI3qegGtuBLjOeAoVkZXNHphV7OBx8Y=;
	b=PcL3Q3BBXWtk1Hc/XMsWVl8/9/HKR4mkDwaZ8I3hCpcrrqETaXq9hO6W+lbQ9ZbfVTUhmZ
	iCGq/DQ/K0iGD59xy8eANo/60UabEBx6YOJJoNoJkleHvffd1VRfG21tbcx1cyN88Zp+OF
	NbuMfEBC3mSCACCYrNQ/5TW9D3qvC3w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-231-W6Kfc69sOfGCOBiTmhDLQg-1; Tue, 11 Aug 2020 18:00:38 -0400
X-MC-Unique: W6Kfc69sOfGCOBiTmhDLQg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34CE7107ACCA;
	Tue, 11 Aug 2020 22:00:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39B5F5DE4A;
	Tue, 11 Aug 2020 22:00:30 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5316497529;
	Tue, 11 Aug 2020 22:00:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwsqd009179 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:55 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EFF9B8AD0F; Tue, 11 Aug 2020 21:58:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DB9768AD05;
	Tue, 11 Aug 2020 21:58:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwrGb015863; 
	Tue, 11 Aug 2020 16:58:53 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwqwn015862;
	Tue, 11 Aug 2020 16:58:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:42 -0500
Message-Id: <1597183123-15797-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 7/8] multipathd: unset mpp->hwe when removing
	map
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the map doesn't unset its hwe pointer before orphaning all the paths,
multipathd will print a warning message in orphan_path() because of
commit "libmultipath: warn if freeing path that holds mpp->hwe".

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/structs_vec.c | 1 +
 multipathd/main.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/libmultipath/structs_vec.c b/libmultipath/structs_vec.c
index ede14297..103ea11e 100644
--- a/libmultipath/structs_vec.c
+++ b/libmultipath/structs_vec.c
@@ -129,6 +129,7 @@ remove_map(struct multipath * mpp, struct vectors * vecs, int purge_vec)
 	/*
 	 * clear references to this map
 	 */
+	mpp->hwe = NULL;
 	orphan_paths(vecs->pathvec, mpp, "map removed internally");
 
 	if (purge_vec &&
diff --git a/multipathd/main.c b/multipathd/main.c
index f014d2a1..2b0e2734 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -666,6 +666,7 @@ flush_map(struct multipath * mpp, struct vectors * vecs, int nopaths)
 		condlog(2, "%s: map flushed", mpp->alias);
 	}
 
+	mpp->hwe = NULL;
 	orphan_paths(vecs->pathvec, mpp, "map flushed");
 	remove_map_and_stop_waiter(mpp, vecs);
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

