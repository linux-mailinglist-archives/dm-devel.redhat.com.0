Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 7182622F8FD
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 21:25:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595877908;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r/cbY2ElW6saw2Asj5W0aVc7MFfxVuShzf292Uuy2PU=;
	b=WQc3POOheWP+E17zWZxK8/AMYqGw/WGcMNkworzV9JeR7OsRVo/ZcsgWdjTQwwlFoOrLaH
	kWIWDk0Uyqv6n0N3s5nHVzpUdvO2GtcVotfn97U/8f9dJys8H70twENMnhLEIBxC78/mp/
	ADKGUbBSFhg1AMRpKHfVHTpIuNhYu6A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-fIfqNYNbNBCvET6p9HbQig-1; Mon, 27 Jul 2020 15:25:05 -0400
X-MC-Unique: fIfqNYNbNBCvET6p9HbQig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1188D1005510;
	Mon, 27 Jul 2020 19:24:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E28FD19D82;
	Mon, 27 Jul 2020 19:24:56 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98623A3599;
	Mon, 27 Jul 2020 19:24:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJOfak024724 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:24:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DCF635D9FC; Mon, 27 Jul 2020 19:24:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DBBE5D9E8;
	Mon, 27 Jul 2020 19:24:38 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RJOavO005651; 
	Mon, 27 Jul 2020 14:24:37 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RJOaJF005650;
	Mon, 27 Jul 2020 14:24:36 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 27 Jul 2020 14:24:27 -0500
Message-Id: <1595877868-5595-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 5/6] libmultipath: deal with flushing no maps
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

dm_flush_maps() was failing if there were no device-mapper devices at
all, instead of returning success, since there is nothing to do.

Fixes: "libmultipath: make dm_flush_maps only return 0 on success"
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index 126cd728..b8199cb5 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1024,10 +1024,10 @@ int dm_flush_maps (int need_suspend, int retries)
 	if (!(names = dm_task_get_names (dmt)))
 		goto out;
 
+	r = 0;
 	if (!names->dev)
 		goto out;
 
-	r = 0;
 	do {
 		if (need_suspend)
 			r |= dm_suspend_and_flush_map(names->name, retries);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

