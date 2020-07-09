Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D570F219E5E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:53:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-RCS_5xbTODuN5FG5-JLMqw-1; Thu, 09 Jul 2020 06:52:45 -0400
X-MC-Unique: RCS_5xbTODuN5FG5-JLMqw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC9A31083E87;
	Thu,  9 Jul 2020 10:52:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD5D05DAA0;
	Thu,  9 Jul 2020 10:52:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 896A2180BA96;
	Thu,  9 Jul 2020 10:52:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqM6Y000705 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6564E5F257; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 617EC5F248
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A00C858EE4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-323-402DBEz2NhaBxFXcyZpS4Q-1;
	Thu, 09 Jul 2020 06:52:17 -0400
X-MC-Unique: 402DBEz2NhaBxFXcyZpS4Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id BA78BAE7A;
	Thu,  9 Jul 2020 10:52:14 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:39 +0200
Message-Id: <20200709105145.9211-16-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqM6Y000705
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 68/74] libmultipath: disassemble_map(): require
	non-NULL pathvec
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We would fail in store_path() at the latest if pathvec was NULL.
And all callers set pathvec anyway.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 7fcd76e..e6f2cbe 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -6,6 +6,7 @@
 #include <stdio.h>
 #include <stdlib.h>
 #include <string.h>
+#include <assert.h>
 
 #include "checkers.h"
 #include "vector.h"
@@ -137,6 +138,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 	struct path * pp;
 	struct pathgroup * pgp;
 
+	assert(pathvec != NULL);
 	p = params;
 
 	condlog(4, "%s: disassemble map [%s]", mpp->alias, params);
@@ -295,8 +297,7 @@ int disassemble_map(vector pathvec, char *params, struct multipath *mpp,
 				devname[0] = '\0';
 			}
 
-			if (pathvec)
-				pp = find_path_by_devt(pathvec, word);
+			pp = find_path_by_devt(pathvec, word);
 
 			if (!pp) {
 				pp = alloc_path();
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

