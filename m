Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1735587DB
	for <lists+dm-devel@lfdr.de>; Thu, 23 Jun 2022 20:53:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656010421;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PLMZ+Y6gz7NVOBiVpqQ47RDNpIPpnNJtKJtG+m4BUlk=;
	b=dIB/AFOu2mgrHCMp73Xxq4VuG3kKBjSouDZdH4liRmbn710ZeSejak3pac/jsApyNbwpOI
	gpLVv1TVA2Jzqi4AAgxQReSVSEr9lRqwWwrAB9sN7wlmWSKA4e4c0LwQNmbiIraPoO6bqT
	5nEb2xxgj2imHP62vtM0nA7Hydm7rDU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-WRzBSwKMMv-yDqCPZsnXaQ-1; Thu, 23 Jun 2022 14:53:37 -0400
X-MC-Unique: WRzBSwKMMv-yDqCPZsnXaQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4BC90811E80;
	Thu, 23 Jun 2022 18:53:33 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7D767492CA7;
	Thu, 23 Jun 2022 18:53:28 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id D6BF0194B964;
	Thu, 23 Jun 2022 18:53:26 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C64E2194B95A
 for <dm-devel@listman.corp.redhat.com>; Thu, 23 Jun 2022 18:53:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id AE8FC2166B2A; Thu, 23 Jun 2022 18:53:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A51EA2166B26;
 Thu, 23 Jun 2022 18:53:25 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 25NIrPZ1011508; Thu, 23 Jun 2022 14:53:25 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 25NIrPVm011504; Thu, 23 Jun 2022 14:53:25 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Thu, 23 Jun 2022 14:53:25 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2206231449340.11302@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Subject: [dm-devel] [PATCH] dm mirror: fix regression caused by
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: dm-devel@redhat.com
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The commit 85e123c27d5c introduced a regression on 64-bit architectures in
the lvm testsuite tests lvcreate-mirror, mirror-names and
vgsplit-operation.

If the device is shrunk, we need to clear log bits beyond the end of the 
device. The code clears bits up to a 32-bit boundary and then calculates 
lc->sync_count by summing set bits up to a 64-bit boundary (that commit 
changed that; previously, this boundary was 32-bit too). So, it was using 
some non-zeroed bits in the calculation and this caused misbehavior.

We fix this bug by clearing bits up to BITS_PER_LONG boundary.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Fixes: 85e123c27d5c ("dm mirror log: round up region bitmap size to BITS_PER_LONG")
Cc: stable@vger.kernel.org

---
 drivers/md/dm-log.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/drivers/md/dm-log.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-log.c	2022-06-23 20:32:05.000000000 +0200
+++ linux-2.6/drivers/md/dm-log.c	2022-06-23 20:33:42.000000000 +0200
@@ -615,7 +615,7 @@ static int disk_resume(struct dm_dirty_l
 			log_clear_bit(lc, lc->clean_bits, i);
 
 	/* clear any old bits -- device has shrunk */
-	for (i = lc->region_count; i % (sizeof(*lc->clean_bits) << BYTE_SHIFT); i++)
+	for (i = lc->region_count; i % BITS_PER_LONG; i++)
 		log_clear_bit(lc, lc->clean_bits, i);
 
 	/* copy clean across to sync */
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

