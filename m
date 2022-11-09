Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C511623612
	for <lists+dm-devel@lfdr.de>; Wed,  9 Nov 2022 22:50:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1668030598;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NWtoTqVj4D93apiHcIGdkU8AOkSPdl3WdPDpY3R9Xp0=;
	b=P2RbalFDl45ZOkdZG+W9KYUuN0oMj82m0oKYgklhj5ll+XaoqnH9MubJgNk2yOdtlypFu6
	9TeeakWsH23MPoBTTOGkZe1YPJO8vFDI2qgr4xx4JbT3XVUkfXYTs4ftMEEHjmGXJZIaAM
	iEgWMWuGENnK3z3YZL9Krb3KsOpzlPE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-65-ofrYBKamMLe7hjN2wu6hOQ-1; Wed, 09 Nov 2022 16:49:56 -0500
X-MC-Unique: ofrYBKamMLe7hjN2wu6hOQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27E8E185A78B;
	Wed,  9 Nov 2022 21:49:54 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 022A74C819;
	Wed,  9 Nov 2022 21:49:51 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8C5131946A5E;
	Wed,  9 Nov 2022 21:49:50 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 061D719465BA
 for <dm-devel@listman.corp.redhat.com>; Wed,  9 Nov 2022 21:49:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ECC4E1415119; Wed,  9 Nov 2022 21:49:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D75EF140EBF5;
 Wed,  9 Nov 2022 21:49:48 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2A9LnlPu009476;
 Wed, 9 Nov 2022 15:49:47 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2A9LnlVs009475;
 Wed, 9 Nov 2022 15:49:47 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  9 Nov 2022 15:49:42 -0600
Message-Id: <1668030583-9428-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1668030583-9428-1-git-send-email-bmarzins@redhat.com>
References: <1668030583-9428-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Subject: [dm-devel] [PATCH 2/3] multipathd: don't initialize the field width
 in show_path()
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's not used, so don't set it up.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/cli_handlers.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 5f0dd04e..e65fb75c 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -67,12 +67,7 @@ static int
 show_path (struct strbuf *reply, struct vectors *vecs, struct path *pp,
 	   char *style)
 {
-	fieldwidth_t *width __attribute__((cleanup(cleanup_ucharp))) = NULL;
-
-	if ((width = alloc_path_layout()) == NULL)
-		return 1;
-	get_path_layout(vecs->pathvec, 1, width);
-	if (snprint_path(reply, style, pp, 0) < 0)
+	if (snprint_path(reply, style, pp, NULL) < 0)
 		return 1;
 	return 0;
 }
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

