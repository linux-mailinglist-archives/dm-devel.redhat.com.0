Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E746E6D2B
	for <lists+dm-devel@lfdr.de>; Tue, 18 Apr 2023 21:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681847823;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TM8655/zne7d8CPlcyji+k1eWmfwLnqweIPAcP1zdHg=;
	b=J5MjofuH+y2SKKpduZT6Xy1gyIcOXvhAXiVQlTMLqsBDZodWhkmifMlAjZVcEuK4vZCHsl
	oM756JhovCqqbCiMYvHW0gNNE9XlFD4zdco6EcrmfnlPmNEux2VC5q8Ce+C+c0sv3rs/YF
	Bgb3FCKJZt1cjSIaIrlUuz2MC5Smlwo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-7lzE3e6dOcWdIQvejVthLw-1; Tue, 18 Apr 2023 15:56:14 -0400
X-MC-Unique: 7lzE3e6dOcWdIQvejVthLw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 88D3185A5B1;
	Tue, 18 Apr 2023 19:56:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 70ADCC15BAE;
	Tue, 18 Apr 2023 19:56:11 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E85FD19465A8;
	Tue, 18 Apr 2023 19:56:10 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id A37F7194658F
 for <dm-devel@listman.corp.redhat.com>; Tue, 18 Apr 2023 19:56:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 903291121319; Tue, 18 Apr 2023 19:56:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 817661121315;
 Tue, 18 Apr 2023 19:56:09 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 33IJu93a030174; Tue, 18 Apr 2023 15:56:09 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 33IJu99u030170; Tue, 18 Apr 2023 15:56:09 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Tue, 18 Apr 2023 15:56:09 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.21.2304181555410.30044@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.21 (LRH 202 2017-01-01)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH 1/5] dm flakey: fix trailing space in the table
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't return a trailing in the output of STATUSTYPE_TABLE.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm-flakey.c |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

Index: linux-2.6/drivers/md/dm-flakey.c
===================================================================
--- linux-2.6.orig/drivers/md/dm-flakey.c
+++ linux-2.6/drivers/md/dm-flakey.c
@@ -430,21 +430,21 @@ static void flakey_status(struct dm_targ
 		break;
 
 	case STATUSTYPE_TABLE:
-		DMEMIT("%s %llu %u %u ", fc->dev->name,
+		DMEMIT("%s %llu %u %u", fc->dev->name,
 		       (unsigned long long)fc->start, fc->up_interval,
 		       fc->down_interval);
 
 		drop_writes = test_bit(DROP_WRITES, &fc->flags);
 		error_writes = test_bit(ERROR_WRITES, &fc->flags);
-		DMEMIT("%u ", drop_writes + error_writes + (fc->corrupt_bio_byte > 0) * 5);
+		DMEMIT(" %u", drop_writes + error_writes + (fc->corrupt_bio_byte > 0) * 5);
 
 		if (drop_writes)
-			DMEMIT("drop_writes ");
+			DMEMIT(" drop_writes");
 		else if (error_writes)
-			DMEMIT("error_writes ");
+			DMEMIT(" error_writes");
 
 		if (fc->corrupt_bio_byte)
-			DMEMIT("corrupt_bio_byte %u %c %u %u ",
+			DMEMIT(" corrupt_bio_byte %u %c %u %u",
 			       fc->corrupt_bio_byte,
 			       (fc->corrupt_bio_rw == WRITE) ? 'w' : 'r',
 			       fc->corrupt_bio_value, fc->corrupt_bio_flags);

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

