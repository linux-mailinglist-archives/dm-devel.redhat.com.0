Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5022B28F794
	for <lists+dm-devel@lfdr.de>; Thu, 15 Oct 2020 19:22:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1602782545;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=mGWrtjo1va21xHYowtXbDVuOHzg/LhSGWNZ+JB6vuLw=;
	b=A16wzakCOB3u/1YPaPDLaCXXOqFRyw86tk2tBBxtPGThO4X5ZmVTKLX9y/Kp2PZA/OpKak
	tWaq+f1tc5XRxD1mu2G2ShNarzQC//Nr8ypaoOOFQVfd+ay5J4RZJPGU9R0rmJCp4uFuSZ
	B5XyETbOM4gz/zcxfI8XcCe4AYQHBQ4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-276-0xk8GJrMNJ6qMUea8P-9sA-1; Thu, 15 Oct 2020 13:22:23 -0400
X-MC-Unique: 0xk8GJrMNJ6qMUea8P-9sA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E77EC80363A;
	Thu, 15 Oct 2020 17:22:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D2726EE48;
	Thu, 15 Oct 2020 17:22:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C3E305810D;
	Thu, 15 Oct 2020 17:22:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09FHLlnS002433 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 15 Oct 2020 13:21:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A95EB5D9DD; Thu, 15 Oct 2020 17:21:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
	(file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C51E15D9D5;
	Thu, 15 Oct 2020 17:21:44 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP
	id 09FHLi0b013250; Thu, 15 Oct 2020 13:21:44 -0400
Received: from localhost (mpatocka@localhost)
	by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with
	ESMTP id 09FHLirJ013246; Thu, 15 Oct 2020 13:21:44 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
	owned process doing -bs
Date: Thu, 15 Oct 2020 13:21:44 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2010151320500.13173@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH] dm integrity: don't use drivers that have
 CRYPTO_ALG_ALLOCATES_MEMORY
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is follow-up of the patch cd74693870fb748d812867ba49af733d689a3604.

Don't use crypto drivers that have the flag CRYPTO_ALG_ALLOCATES_MEMORY
set. These drivers allocate memory and thus they are unsuitable for block
I/O processing.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-integrity.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-integrity.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-integrity.c	2020-09-15 12:38:45.949985000 +0200
+++ linux-2.6/drivers/md/dm-integrity.c	2020-10-15 19:17:43.649999000 +0200
@@ -3462,7 +3462,7 @@ static int get_mac(struct crypto_shash *
 	int r;
 
 	if (a->alg_string) {
-		*hash = crypto_alloc_shash(a->alg_string, 0, 0);
+		*hash = crypto_alloc_shash(a->alg_string, 0, CRYPTO_ALG_ALLOCATES_MEMORY);
 		if (IS_ERR(*hash)) {
 			*error = error_alg;
 			r = PTR_ERR(*hash);
@@ -3519,7 +3519,7 @@ static int create_journal(struct dm_inte
 		struct journal_completion comp;
 
 		comp.ic = ic;
-		ic->journal_crypt = crypto_alloc_skcipher(ic->journal_crypt_alg.alg_string, 0, 0);
+		ic->journal_crypt = crypto_alloc_skcipher(ic->journal_crypt_alg.alg_string, 0, CRYPTO_ALG_ALLOCATES_MEMORY);
 		if (IS_ERR(ic->journal_crypt)) {
 			*error = "Invalid journal cipher";
 			r = PTR_ERR(ic->journal_crypt);

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

