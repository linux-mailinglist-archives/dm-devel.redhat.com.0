Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F77B680D
	for <lists+dm-devel@lfdr.de>; Tue,  3 Oct 2023 13:35:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696332915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RIgd3Xsd1A8JZ/GJonGI8TlrY8/8O/f0Q9oiv/CgBbQ=;
	b=AJJ5AYumjOY/pQwH8oi3xeSzhc2XitrWtnGnldCX6Kc/wPKEiSR0yGPaHjRlXmkWj2ZzSh
	v2JSsPHkDWHY/cOy6dO9OWXrVQtIDnw3ppO148w5SHnOkyXAIl/+zrJesPThdv9nBWqlNB
	NX/NjUP/FIbf8oTiIKMqI5VojjISTyo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-549-q1KZMW7EP82k6KAG9_ptlA-1; Tue, 03 Oct 2023 07:35:11 -0400
X-MC-Unique: q1KZMW7EP82k6KAG9_ptlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF239101AA44;
	Tue,  3 Oct 2023 11:35:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E376B1054FC1;
	Tue,  3 Oct 2023 11:34:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA91B19465B6;
	Tue,  3 Oct 2023 11:34:55 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id EE054194658D
 for <dm-devel@listman.corp.redhat.com>; Tue,  3 Oct 2023 11:34:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A743640103C; Tue,  3 Oct 2023 11:34:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file1-rdu.file-001.prod.rdu2.dc.redhat.com (unknown
 [10.11.5.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FE13493113;
 Tue,  3 Oct 2023 11:34:54 +0000 (UTC)
Received: by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix,
 from userid 12668)
 id 8407D30C1C0A; Tue,  3 Oct 2023 11:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by file1-rdu.file-001.prod.rdu2.dc.redhat.com (Postfix) with ESMTP id
 7FAA03FB77; Tue,  3 Oct 2023 13:34:54 +0200 (CEST)
Date: Tue, 3 Oct 2023 13:34:54 +0200 (CEST)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <fe5f5bc-5a62-3f2e-c869-63795e10655e@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Subject: [dm-devel] [PATCH] dm: make __send_duplicate_bios return unsigned
 int
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

All the callers cast the value returned by __send_duplicate_bios to
unsigned int type, so we can return unsigned int as well.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 drivers/md/dm.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

Index: linux-2.6/drivers/md/dm.c
===================================================================
--- linux-2.6.orig/drivers/md/dm.c
+++ linux-2.6/drivers/md/dm.c
@@ -1506,8 +1506,8 @@ static void alloc_multiple_bios(struct b
 	}
 }
 
-static int __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
-				 unsigned int num_bios, unsigned int *len)
+static unsigned int __send_duplicate_bios(struct clone_info *ci, struct dm_target *ti,
+					  unsigned int num_bios, unsigned int *len)
 {
 	struct bio_list blist = BIO_EMPTY_LIST;
 	struct bio *clone;
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

