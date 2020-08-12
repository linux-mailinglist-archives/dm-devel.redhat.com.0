Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 21B162428D1
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-275-SJao333JO_K2sZYP6K7-8g-1; Wed, 12 Aug 2020 07:36:26 -0400
X-MC-Unique: SJao333JO_K2sZYP6K7-8g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 95A46102CC4B;
	Wed, 12 Aug 2020 11:36:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E3A46FEFE;
	Wed, 12 Aug 2020 11:36:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 28FD99A8A2;
	Wed, 12 Aug 2020 11:36:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBaHY8028999 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3A53C2157F25; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 36A9C2166BA4
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E6F31033654
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-172-dZd2eTUtMYa3lMJ8zOzvMA-1;
	Wed, 12 Aug 2020 07:36:12 -0400
X-MC-Unique: dZd2eTUtMYa3lMJ8zOzvMA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C2A29B712;
	Wed, 12 Aug 2020 11:36:32 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:35:58 +0200
Message-Id: <20200812113601.26658-2-mwilck@suse.com>
In-Reply-To: <20200812113601.26658-1-mwilck@suse.com>
References: <20200812113601.26658-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBaHY8028999
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 81/84] multipath: check_path_valid():
	eliminate some failure modes
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

The memory allocations can fail, and pathvec is not needed until the
path_discovery() call. Eliminate the failure modes by not setting up
pathvec before it's actually needed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 9d6b482..9e65070 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -637,15 +637,6 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
 			 minor(devt));
 	}
 
-	pathvec = vector_alloc();
-	if (!pathvec)
-		goto fail;
-
-	if (store_path(pathvec, pp) != 0) {
-		free_path(pp);
-		goto fail;
-	}
-
 	if ((r == PATH_IS_VALID || r == PATH_IS_MAYBE_VALID) &&
 	    released_to_systemd())
 		r = PATH_IS_NOT_VALID;
@@ -684,6 +675,15 @@ check_path_valid(const char *name, struct config *conf, bool is_uevent)
 		goto out;
 	}
 
+	pathvec = vector_alloc();
+	if (!pathvec)
+		goto fail;
+
+	if (store_path(pathvec, pp) != 0) {
+		free_path(pp);
+		goto fail;
+	}
+
 	/* For find_multipaths = SMART, if there is more than one path
 	 * matching the refwwid, then the path is valid */
 	if (path_discovery(pathvec, DI_SYSFS | DI_WWID) < 0)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

