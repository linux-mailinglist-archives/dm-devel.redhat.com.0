Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BF3CB3AF582
	for <lists+dm-devel@lfdr.de>; Mon, 21 Jun 2021 20:48:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624301334;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oSoJPrQecjEWLuyBoeMWuQyBax1d4Osx+fvg7souBSo=;
	b=bHt8MC8W0Qz0Mn0nfUacZXVlkaai+XCsy/dtpUXbZOh4PciQDtxvaCCmr+6CMp5yQTWkbK
	/CGgG2C8AeVrZOXg14444PlyCFnObPbxNLwvvpJLH02JZG71iEdqkkG2F4RS9sDsgXaYuT
	2Q0UQYd2VZWjXBGPlnIdTLsdPtuhmo4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-5ICvnFIINUSci2Sp_oullg-1; Mon, 21 Jun 2021 14:48:53 -0400
X-MC-Unique: 5ICvnFIINUSci2Sp_oullg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 003251084F53;
	Mon, 21 Jun 2021 18:48:47 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B939E69CB4;
	Mon, 21 Jun 2021 18:48:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 269881809C99;
	Mon, 21 Jun 2021 18:48:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 15LImXCI015241 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 21 Jun 2021 14:48:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A8AB5DA2D; Mon, 21 Jun 2021 18:48:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 001845D9CA;
	Mon, 21 Jun 2021 18:48:29 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 15LImT0B027985; Mon, 21 Jun 2021 14:48:29 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 15LImTpg027981; Mon, 21 Jun 2021 14:48:29 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Mon, 21 Jun 2021 14:48:29 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>, Alasdair Kergon <agk@redhat.com>
Message-ID: <alpine.LRH.2.02.2106211447120.27222@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm-writecache: write at least 4k when committing
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

SSDs perform badly with sub-4k writes (because they perfrorm 
read-modify-write internally), so make sure that we write at least 4k when 
committing.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 991bd8d7bc78 ("dm writecache: commit just one block, not a full page")

Index: linux/drivers/md/dm-writecache.c
===================================================================
--- linux.orig/drivers/md/dm-writecache.c
+++ linux/drivers/md/dm-writecache.c
@@ -533,7 +533,11 @@ static void ssd_commit_superblock(struct
 
 	region.bdev = wc->ssd_dev->bdev;
 	region.sector = 0;
-	region.count = wc->block_size >> SECTOR_SHIFT;
+	region.count = max(4096U, wc->block_size) >> SECTOR_SHIFT;
+
+	if (unlikely(region.sector + region.count > wc->metadata_sectors))
+		region.count = wc->metadata_sectors - region.sector;
+
 	region.sector += wc->start_sector;
 
 	req.bi_op = REQ_OP_WRITE;

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

