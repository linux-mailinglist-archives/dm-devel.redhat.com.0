Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A496E6D30
	for <lists+dm-devel@lfdr.de>; Tue, 18 Apr 2023 21:57:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681847873;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i/FPSZbqaMrUxmPrb4d3TUzwY0qghQClGM+4/AUXb7c=;
	b=XgrlFsqoPzUJX8vn4UZsDFCp1qTjvkJlnn4JtXIacbaYQUpHKSBjZqYpPPUqqlnnbDHSgT
	g4H9wdZFdcpEOIR+XiRDmizGlNkpHW7LOnFg3XVexZxqCkXZuASUIl3o5Wdd5RwZYhggUz
	Y/znuWNDYkf3tOCRGhQeA3F6KR1iwCY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-531-poAc0WjPPw2i180MZhs_qQ-1; Tue, 18 Apr 2023 15:57:51 -0400
X-MC-Unique: poAc0WjPPw2i180MZhs_qQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BA6C800047;
	Tue, 18 Apr 2023 19:57:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C587F492C3E;
	Tue, 18 Apr 2023 19:57:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 44F7719465A8;
	Tue, 18 Apr 2023 19:57:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7F4A5194658F
 for <dm-devel@listman.corp.redhat.com>; Tue, 18 Apr 2023 19:57:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6F8FEC15BAE; Tue, 18 Apr 2023 19:57:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 62198C15BAD;
 Tue, 18 Apr 2023 19:57:47 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 33IJvle4030275; Tue, 18 Apr 2023 15:57:47 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 33IJvlHT030271; Tue, 18 Apr 2023 15:57:47 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 18 Apr 2023 15:57:47 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.21.2304181557210.30044@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [PATCH 4/5] dm flakey: fix a crash with invalid table
 line
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This command will crash with NULL pointer dereference.
dmsetup create flakey --table "0 `blockdev --getsize /dev/ram0` flakey /dev/ram0 0 0 1 2 corrupt_bio_byte 512"

We fix the crash by checking if arg_name is non-NULL before comparing it.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
Cc: stable@vger.kernel.org

---
 drivers/md/dm-flakey.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm-flakey.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-flakey.c
+++ linux-2.6/drivers/md/dm-flakey.c
@@ -137,9 +137,9 @@ static int parse_features(struct dm_arg_
 			 * Direction r or w?
 			 */
 			arg_name = dm_shift_arg(as);
-			if (!strcasecmp(arg_name, "w"))
+			if (arg_name && !strcasecmp(arg_name, "w"))
 				fc->corrupt_bio_rw = WRITE;
-			else if (!strcasecmp(arg_name, "r"))
+			else if (arg_name && !strcasecmp(arg_name, "r"))
 				fc->corrupt_bio_rw = READ;
 			else {
 				ti->error = "Invalid corrupt bio direction (r or w)";

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

