Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 65B57386C42
	for <lists+dm-devel@lfdr.de>; Mon, 17 May 2021 23:29:38 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-1tcWJFOENs6EqV_xdmgwFw-1; Mon, 17 May 2021 17:29:34 -0400
X-MC-Unique: 1tcWJFOENs6EqV_xdmgwFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6241005D52;
	Mon, 17 May 2021 21:29:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF9A15C1A1;
	Mon, 17 May 2021 21:29:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A882E5534B;
	Mon, 17 May 2021 21:29:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HLTGg8031634 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 17:29:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 31356216FD5E; Mon, 17 May 2021 21:29:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A87D216FD47
	for <dm-devel@redhat.com>; Mon, 17 May 2021 21:29:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4543F857AA4
	for <dm-devel@redhat.com>; Mon, 17 May 2021 21:29:13 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-79-_oMXAakkPx2uBWiqQdxU1Q-1;
	Mon, 17 May 2021 17:29:09 -0400
X-MC-Unique: _oMXAakkPx2uBWiqQdxU1Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7F780B12C;
	Mon, 17 May 2021 21:29:07 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Mon, 17 May 2021 23:27:24 +0200
Message-Id: <20210517212727.25229-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 14HLTGg8031634
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/4] multipathd: cli_handlers: cleanup setting
	reply length
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Create a macro for setting the reply length for string literals
correctly, and use it where necessary.

In cli_del_path(), don't change the function's return code
if just the buffer allocation for the reply failed.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli_handlers.c | 33 ++++++++++++---------------------
 1 file changed, 12 insertions(+), 21 deletions(-)

diff --git a/multipathd/cli_handlers.c b/multipathd/cli_handlers.c
index 6765fcf..9606494 100644
--- a/multipathd/cli_handlers.c
+++ b/multipathd/cli_handlers.c
@@ -32,6 +32,12 @@
 #include "foreign.h"
 #include "cli_handlers.h"
 
+#define SET_REPLY_AND_LEN(__rep, __len, string_literal)			\
+	do {								\
+		*(__rep) = strdup(string_literal);			\
+		*(__len) = *(__rep) ? sizeof(string_literal) : 0;	\
+	} while (0)
+
 int
 show_paths (char ** r, int * len, struct vectors * vecs, char * style,
 	    int pretty)
@@ -802,8 +808,7 @@ cli_add_path (void * v, char ** reply, int * len, void * data)
 	}
 	return ev_add_path(pp, vecs, 1);
 blacklisted:
-	*reply = strdup("blacklisted\n");
-	*len = strlen(*reply) + 1;
+	SET_REPLY_AND_LEN(reply, len, "blacklisted\n");
 	condlog(2, "%s: path blacklisted", param);
 	return 0;
 }
@@ -824,23 +829,10 @@ cli_del_path (void * v, char ** reply, int * len, void * data)
 		return 1;
 	}
 	ret = ev_remove_path(pp, vecs, 1);
-	if (ret == REMOVE_PATH_DELAY) {
-		*reply = strdup("delayed\n");
-		if (*reply)
-			*len = strlen(*reply) + 1;
-		else {
-			*len = 0;
-			ret = REMOVE_PATH_FAILURE;
-		}
-	} else if (ret == REMOVE_PATH_MAP_ERROR) {
-		*reply = strdup("map reload error. removed\n");
-		if (*reply)
-			*len = strlen(*reply) + 1;
-		else {
-			*len = 0;
-			ret = REMOVE_PATH_FAILURE;
-		}
-	}
+	if (ret == REMOVE_PATH_DELAY)
+		SET_REPLY_AND_LEN(reply, len, "delayed\n");
+	else if (ret == REMOVE_PATH_MAP_ERROR)
+		SET_REPLY_AND_LEN(reply, len, "map reload error. removed\n");
 	return (ret == REMOVE_PATH_FAILURE);
 }
 
@@ -865,8 +857,7 @@ cli_add_map (void * v, char ** reply, int * len, void * data)
 		invalid = 1;
 	pthread_cleanup_pop(1);
 	if (invalid) {
-		*reply = strdup("blacklisted\n");
-		*len = strlen(*reply) + 1;
+		SET_REPLY_AND_LEN(reply, len, "blacklisted\n");
 		condlog(2, "%s: map blacklisted", param);
 		return 1;
 	}
-- 
2.31.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

