Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 114D62500AF
	for <lists+dm-devel@lfdr.de>; Mon, 24 Aug 2020 17:15:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598282154;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FCa73I/GJRQe7RG8fjurMPVMrqnRV1ITeQtUOf1pjL4=;
	b=EJmA51tFFkmJK6/1TY85G8aYDkJc6175K8cKPLVDDYxW/dxp6iH1OcM5Z6mW7WBYlcC8zG
	MEDUHLQ/+0ElMP5XKigUehTDpcja3h84n/hTLu3yamDvCW0y6Ls/uLKdF4g4xJEAiih13s
	ghS7M6pVPk01eLHczsz860Uzkbei+aw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-zLn_GldBNXSvsnfOkwuYwg-1; Mon, 24 Aug 2020 11:15:50 -0400
X-MC-Unique: zLn_GldBNXSvsnfOkwuYwg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E817F81F010;
	Mon, 24 Aug 2020 15:15:43 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CFA435C1C4;
	Mon, 24 Aug 2020 15:15:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97CE718A0B64;
	Mon, 24 Aug 2020 15:15:33 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07OF9rPG023860 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 24 Aug 2020 11:09:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2DE7969294; Mon, 24 Aug 2020 15:09:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8CCCD5FC18;
	Mon, 24 Aug 2020 15:09:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 07OF9lp7026538; Mon, 24 Aug 2020 11:09:47 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 07OF9liJ026534; Mon, 24 Aug 2020 11:09:47 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 24 Aug 2020 11:09:47 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2008241106190.26379@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: handle partitions on persistent
 memory correctly
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch fixes handling partitions in the dm-writecache target. The
function dax_direct_access doesn't take partitions into account, it always
maps pages from the beginning of the device. Therefore, we must get the
partition offset using the function get_start_sect and add it to the page
offsets passed to dax_direct_access.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org	# 4.18+
Fixes: 48debafe4f2f ("dm: add writecache target")

---
 drivers/md/dm-writecache.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-writecache.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-writecache.c	2020-08-19 15:04:21.499999000 +0200
+++ linux-2.6/drivers/md/dm-writecache.c	2020-08-24 17:07:54.169999000 +0200
@@ -231,6 +231,7 @@ static int persistent_memory_claim(struc
 	pfn_t pfn;
 	int id;
 	struct page **pages;
+	sector_t offset;
 
 	wc->memory_vmapped = false;
 
@@ -245,9 +246,16 @@ static int persistent_memory_claim(struc
 		goto err1;
 	}
 
+	offset = get_start_sect(wc->ssd_dev->bdev);
+	if (offset & (PAGE_SIZE / 512 - 1)) {
+		r = -EINVAL;
+		goto err1;
+	}
+	offset >>= PAGE_SHIFT - 9;
+
 	id = dax_read_lock();
 
-	da = dax_direct_access(wc->ssd_dev->dax_dev, 0, p, &wc->memory_map, &pfn);
+	da = dax_direct_access(wc->ssd_dev->dax_dev, offset, p, &wc->memory_map, &pfn);
 	if (da < 0) {
 		wc->memory_map = NULL;
 		r = da;
@@ -269,7 +277,7 @@ static int persistent_memory_claim(struc
 		i = 0;
 		do {
 			long daa;
-			daa = dax_direct_access(wc->ssd_dev->dax_dev, i, p - i,
+			daa = dax_direct_access(wc->ssd_dev->dax_dev, offset + i, p - i,
 						NULL, &pfn);
 			if (daa <= 0) {
 				r = daa ? daa : -EINVAL;

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

