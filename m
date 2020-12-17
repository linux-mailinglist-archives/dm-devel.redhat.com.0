Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 84E552DDB9D
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 23:52:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608245528;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=vkKZ8KCaYg0Fw4T/mmyvsf8ixZK4nJGjcCNNyZLvDEo=;
	b=bKlphtZjkQicMoITmJjGN6oh4Y5NJ76k2R+auQ+TV8suRwgzJ0WLaXo53ecVo2urXj3vgK
	1HBTXYLKw/nZzbuabwHX7Xea0M3dDv1SSN4i+krhTf18pQ1mkd4BGGOYOrTbm8Erw8YJdV
	2GeWa2u2/QWEjCSxeJdtTgUhhCV/X38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-JwMfZy4nM5avZVFBCzddQg-1; Thu, 17 Dec 2020 17:51:36 -0500
X-MC-Unique: JwMfZy4nM5avZVFBCzddQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5D5F81005586;
	Thu, 17 Dec 2020 22:51:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D422110013C0;
	Thu, 17 Dec 2020 22:51:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1E6B14BB7B;
	Thu, 17 Dec 2020 22:51:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHMpBNh008327 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 17:51:11 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5336919EF2; Thu, 17 Dec 2020 22:51:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9E98B2BFEE;
	Thu, 17 Dec 2020 22:51:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BHMp7OV001863; 
	Thu, 17 Dec 2020 16:51:07 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BHMp7uf001862;
	Thu, 17 Dec 2020 16:51:07 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 17 Dec 2020 16:51:01 -0600
Message-Id: <1608245463-1746-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1608245463-1746-1-git-send-email-bmarzins@redhat.com>
References: <1608245463-1746-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 3/5] multipathd: remove redundant
	vector_free() int configure
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

remove_maps(vecs) already calls vector_free(vecs->mpvec)

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index b6a5f5b7..2eab4854 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2634,14 +2634,10 @@ configure (struct vectors * vecs)
 	}
 
 	/*
-	 * purge dm of old maps
+	 * purge dm of old maps and save new set of maps formed by
+	 * considering current path state
 	 */
 	remove_maps(vecs);
-
-	/*
-	 * save new set of maps formed by considering current path state
-	 */
-	vector_free(vecs->mpvec);
 	vecs->mpvec = mpvec;
 
 	/*
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

