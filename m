Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id F0C222A5E77
	for <lists+dm-devel@lfdr.de>; Wed,  4 Nov 2020 08:01:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604473263;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=UjK4PUluibxzUskhca9s2E7bsuXY0ZfRYhqqT1QkvZU=;
	b=PyoiZukSZ9et4RfWwjtW9+M6BklSsLsihwe3kvQ0YHebHjwcXaKbuGANDtH6+tCDtHGpF5
	1+4kJn/nZoCEVo8jzbTf+VvxrEycMqXSk6axyo9VhwSHjhFVLk9MGkb/cVNczCNupxiQPo
	I9/UYuvl3o4rJPD2Oi2DFcG5mtNYrHI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-ku35sWpJMAC9HCqswdJ3MA-1; Wed, 04 Nov 2020 02:00:41 -0500
X-MC-Unique: ku35sWpJMAC9HCqswdJ3MA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED5E2804742;
	Wed,  4 Nov 2020 07:00:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4FCA21E84;
	Wed,  4 Nov 2020 07:00:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 486C418199F6;
	Wed,  4 Nov 2020 07:00:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A46sJpD017322 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 01:54:19 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3B4941002D61; Wed,  4 Nov 2020 06:54:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3CC10589A0;
	Wed,  4 Nov 2020 06:54:16 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A46sEoi022472; 
	Wed, 4 Nov 2020 00:54:14 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A46sE37022471;
	Wed, 4 Nov 2020 00:54:14 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  4 Nov 2020 00:54:06 -0600
Message-Id: <1604472849-22422-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
References: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/6] multipathd: remove redundant
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

remove_maps(vecs) already calls vector_free(vecs->mpvec)

Reviewed-by: Martin Wilck <mwilck@suse.com>
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

