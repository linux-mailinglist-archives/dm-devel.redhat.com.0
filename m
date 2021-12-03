Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF4D466F24
	for <lists+dm-devel@lfdr.de>; Fri,  3 Dec 2021 02:34:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638495291;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=U2RBsc3EWk5Yy1EeoB6ctqT52NBZ63yTqOYv+rvJGCU=;
	b=a/CRjKJcIk5hAx+6NFPnikhT2cZ/1E8FacsIkv1+6vacnf1Isfd1a7zt3Lm8tx472qmCks
	dMsmLgg0jzsCzfjUqHxCN8PbYQSY6YACmEtnc/0vM7wUdNjNImcLKChiGWMGxkpNhkn6ei
	i37qE29GJFsLiz86nZ7OCDuNX8R0BK4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-kjOvDDgfMCOwAsdeozK7pQ-1; Thu, 02 Dec 2021 20:34:49 -0500
X-MC-Unique: kjOvDDgfMCOwAsdeozK7pQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B4DA2100C664;
	Fri,  3 Dec 2021 01:34:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9636645D66;
	Fri,  3 Dec 2021 01:34:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4815A4BB7C;
	Fri,  3 Dec 2021 01:34:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B31YOcI028498 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Dec 2021 20:34:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7E4B8196F9; Fri,  3 Dec 2021 01:34:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE012196E6;
	Fri,  3 Dec 2021 01:34:15 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1B31YEi7015781; 
	Thu, 2 Dec 2021 19:34:14 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1B31YEca015780;
	Thu, 2 Dec 2021 19:34:14 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Dec 2021 19:34:10 -0600
Message-Id: <1638495252-15739-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1638495252-15739-1-git-send-email-bmarzins@redhat.com>
References: <1638495252-15739-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: keep existing dm_info if you
	fail to get a new one
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are reasons that dm_get_info() can fail other than the multipath
device not existing. If there is an existing dm_info structure and the
call fails, don't free it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/devmapper.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index c0eb3351..6d24a2be 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -1590,22 +1590,26 @@ alloc_dminfo (void)
 }
 
 int
-dm_get_info (const char * mapname, struct dm_info ** dmi)
+dm_get_info (const char * mapname, struct dm_info ** dmi_p)
 {
+	struct dm_info *dmi = NULL;
+
 	if (!mapname)
 		return 1;
 
-	if (!*dmi)
-		*dmi = alloc_dminfo();
-
-	if (!*dmi)
-		return 1;
+	if (!*dmi_p) {
+		dmi = alloc_dminfo();
+		if (!dmi)
+			return 1;
+	} else
+		dmi = *dmi_p;
 
-	if (do_get_info(mapname, *dmi) != 0) {
-		free(*dmi);
-		*dmi = NULL;
+	if (do_get_info(mapname, dmi) != 0) {
+		if (!*dmi_p)
+			free(dmi);
 		return 1;
-	}
+	} else if (!*dmi_p)
+		*dmi_p = dmi;
 	return 0;
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

