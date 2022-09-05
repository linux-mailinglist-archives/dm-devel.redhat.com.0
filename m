Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4332C5AD631
	for <lists+dm-devel@lfdr.de>; Mon,  5 Sep 2022 17:21:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662391314;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=q6l2ZDPCcPSxqOcM+mjdNfoSnb35Ex8irHTIy/pV/GE=;
	b=hpCTVmpZSuchApqmrrBccuFc9lnUEnZwMG7NhaBbYpNCr2FjMX4gZzYEyhb6licae+WqSA
	d8rIXpIzquNRVMPf3W8zcwi7QQUjuzNeoPHEX32jCE4qu9VSCJ2Bx2XvVqOgllqumxzcU2
	RearmTTuyduSAyrc5pcw0rb3gghPy1c=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-B5TYXF0qNLO6FRTBAfEDEA-1; Mon, 05 Sep 2022 11:21:52 -0400
X-MC-Unique: B5TYXF0qNLO6FRTBAfEDEA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D96753814946;
	Mon,  5 Sep 2022 15:21:49 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 775141415137;
	Mon,  5 Sep 2022 15:21:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 56DDB194037D;
	Mon,  5 Sep 2022 15:21:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 8D5081946A47
 for <dm-devel@listman.corp.redhat.com>; Mon,  5 Sep 2022 15:21:40 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 70AD8945D7; Mon,  5 Sep 2022 15:21:40 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from file01.intranet.prod.int.rdu2.redhat.com
 (file01.intranet.prod.int.rdu2.redhat.com [10.11.5.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 67355945D0;
 Mon,  5 Sep 2022 15:21:40 +0000 (UTC)
Received: from file01.intranet.prod.int.rdu2.redhat.com (localhost [127.0.0.1])
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4) with ESMTP id
 285FLeLL008673; Mon, 5 Sep 2022 11:21:40 -0400
Received: from localhost (mpatocka@localhost)
 by file01.intranet.prod.int.rdu2.redhat.com (8.14.4/8.14.4/Submit) with ESMTP
 id 285FLeVv008669; Mon, 5 Sep 2022 11:21:40 -0400
X-Authentication-Warning: file01.intranet.prod.int.rdu2.redhat.com: mpatocka
 owned process doing -bs
Date: Mon, 5 Sep 2022 11:21:40 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
X-X-Sender: mpatocka@file01.intranet.prod.int.rdu2.redhat.com
To: Mike Snitzer <msnitzer@redhat.com>
Message-ID: <alpine.LRH.2.02.2209051120510.8614@file01.intranet.prod.int.rdu2.redhat.com>
User-Agent: Alpine 2.02 (LRH 1266 2009-07-14)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Subject: [dm-devel] [PATCH 1/2] mm: export is_vmalloc_or_module_addr
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Export is_vmalloc_or_module_addr - we will need it in device mapper to
determine if the error string is statically or dynamically allocated.

Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>

---
 mm/vmalloc.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-dm/mm/vmalloc.c
===================================================================
--- linux-dm.orig/mm/vmalloc.c	2022-09-05 13:29:57.000000000 +0200
+++ linux-dm/mm/vmalloc.c	2022-09-05 14:30:51.000000000 +0200
@@ -637,6 +637,7 @@ int is_vmalloc_or_module_addr(const void
 #endif
 	return is_vmalloc_addr(x);
 }
+EXPORT_SYMBOL(is_vmalloc_or_module_addr);
 
 /*
  * Walk a vmap address to the struct page it maps. Huge vmap mappings will
--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

