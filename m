Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3C72978C6
	for <lists+dm-devel@lfdr.de>; Fri, 23 Oct 2020 23:23:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603488179;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=i0K/f3Q0k9xyt10KVoN99lgFfQ9r4vU4VLs5lrcH+Dw=;
	b=PQzo+B2OHhMUiiIzPUq6vEB9BwfCt+Ofw1oaJKzRfJ3C7u2k3G2znQbkltVg/TKR32z50w
	UPfgNlF/Zinl8WfKztyU+9PyODZ9JDsa9qHNiOYNyvPmds17oFAVvmIwnPRF3vokGHpAOy
	CNQyIiwAFgE74TbkqICOFa9N/+flLzk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-7NDYy-sjOkC_hRNyQVZGxg-1; Fri, 23 Oct 2020 17:22:57 -0400
X-MC-Unique: 7NDYy-sjOkC_hRNyQVZGxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A78D5804B76;
	Fri, 23 Oct 2020 21:22:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65A9F5B4B1;
	Fri, 23 Oct 2020 21:22:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C28180B657;
	Fri, 23 Oct 2020 21:22:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09NLFEkd027779 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 23 Oct 2020 17:15:14 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 57D9860C84; Fri, 23 Oct 2020 21:15:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4287660CCC;
	Fri, 23 Oct 2020 21:15:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09NLFCYZ012597; 
	Fri, 23 Oct 2020 16:15:12 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09NLFCXO012596;
	Fri, 23 Oct 2020 16:15:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 23 Oct 2020 16:15:06 -0500
Message-Id: <1603487708-12547-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
References: <1603487708-12547-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/5] multipathd: remove redundant vector_free()
	int configure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
index 0cf8a264..e114bab7 100644
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

