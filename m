Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EB97B1FDA29
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439907;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J9gbNmcFP49PY9FDFALzjtfGyTnvqH14YqXOTHSsKhY=;
	b=KW7sL0o9+JsFVwm+3yUrKCrWcNCi+DX/4EfgDQxlAw1ps19pMnwXSRXG1jX9T4ck5lc4CO
	Mht0/cOG1Geg1fP+OA7y+XTyDECd84t7wqPQjEFGnOmRaGoN/3poIvta9jPDFTEW29Zu2k
	Vi7PDO0H1mJdKn4wageeLP0BzlF0Qb4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-LHiL-fK1Pwyv8JJs7DIUuw-1; Wed, 17 Jun 2020 20:25:05 -0400
X-MC-Unique: LHiL-fK1Pwyv8JJs7DIUuw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 184A38014D4;
	Thu, 18 Jun 2020 00:25:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 266755EE0E;
	Thu, 18 Jun 2020 00:24:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1F556833BD;
	Thu, 18 Jun 2020 00:24:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0OZbJ026500 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:35 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D2A21002393; Thu, 18 Jun 2020 00:24:35 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E48F1002388;
	Thu, 18 Jun 2020 00:24:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OWBG018477; 
	Wed, 17 Jun 2020 19:24:32 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OVbB018476;
	Wed, 17 Jun 2020 19:24:31 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:23 -0500
Message-Id: <1592439867-18427-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/7] libmultipath: make dm_flush_maps only return
	0 on success
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

dm_flush_maps() returned both 0 and 1 on error, depending on which part
of the function it was in, but the caller was always treating 0 as a
success. Make dm_flush_maps() always return 1 on error and 0 on success.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index b44f7545..682c0038 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -993,13 +993,13 @@ dm_flush_map_nopaths(const char * mapname, int deferred_remove)
 
 int dm_flush_maps (int retries)
 {
-	int r = 0;
+	int r = 1;
 	struct dm_task *dmt;
 	struct dm_names *names;
 	unsigned next = 0;
 
 	if (!(dmt = libmp_dm_task_create (DM_DEVICE_LIST)))
-		return 0;
+		return r;
 
 	dm_task_no_open_count(dmt);
 
@@ -1012,6 +1012,7 @@ int dm_flush_maps (int retries)
 	if (!names->dev)
 		goto out;
 
+	r = 0;
 	do {
 		r |= dm_suspend_and_flush_map(names->name, retries);
 		next = names->next;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

