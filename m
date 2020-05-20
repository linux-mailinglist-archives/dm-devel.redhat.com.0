Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id DF1EA1DC06A
	for <lists+dm-devel@lfdr.de>; Wed, 20 May 2020 22:45:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1590007505;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5/f/6dIQsJ1clXTYqbACWwJtwbsX8pMLilWaPOhnsaA=;
	b=hCB15SoiuFQCx6We9SJBiFmdHUIKPBcA9Ho7YaXqWzDwSsICDPYsw4S/qNJg+NwiGGyZpK
	/Zbk3cIMeppDK+MpwQc/7U1+uL+ThbPk3yySoXyMWuZBVioZtz1PGmYEsy6dd8SOhxIfLM
	GYAt4IwwskJbUOZMowgWV3r931DmDZg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-Diaei-CRMqCir__r5wbARw-1; Wed, 20 May 2020 16:45:01 -0400
X-MC-Unique: Diaei-CRMqCir__r5wbARw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 86815800688;
	Wed, 20 May 2020 20:44:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D724F5D9CA;
	Wed, 20 May 2020 20:44:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 750A21809543;
	Wed, 20 May 2020 20:44:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04KKhiqJ032693 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 May 2020 16:43:44 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CB34D202683E; Wed, 20 May 2020 20:43:43 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C1FD0202696B
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:43:41 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D060880067A
	for <dm-devel@redhat.com>; Wed, 20 May 2020 20:43:41 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-166-0DpqQLaHMnihgbOATOW_EA-1;
	Wed, 20 May 2020 16:43:36 -0400
X-MC-Unique: 0DpqQLaHMnihgbOATOW_EA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id C266FC11C;
	Wed, 20 May 2020 20:43:37 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Xose Vazquez Perez <xose.vazquez@gmail.com>
Date: Wed, 20 May 2020 22:43:13 +0200
Message-Id: <20200520204313.29708-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04KKhiqJ032693
X-loop: dm-devel@redhat.com
Cc: Gris Ge <fge@redhat.com>, dm-devel@redhat.com,
	"mail@eworm.de" <mail@eworm.de>
Subject: [dm-devel] [PATCH] fix boolean value with json-c 0.14
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: "mail@eworm.de" <mail@eworm.de>

Upstream json-c removed the TRUE and FALSE defines in commit
0992aac61f8b087efd7094e9ac2b84fa9c040fcd.


Signed-off-by: Christian Hesse <mail@eworm.de>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libdmmp/libdmmp_private.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

---
mwilck: Resent from Christian's patch from 2020-04-25.
Changes wrt original patch:
 - Use stdbool.h, and keep the error message unchanged.

(Resent, as I forgot to cc dm-devel. Sorry!)

diff --git a/libdmmp/libdmmp_private.h b/libdmmp/libdmmp_private.h
index ac85b63f..b1a6ddea 100644
--- a/libdmmp/libdmmp_private.h
+++ b/libdmmp/libdmmp_private.h
@@ -30,6 +30,7 @@
 #include <stdint.h>
 #include <string.h>
 #include <assert.h>
+#include <stdbool.h>
 #include <json.h>
 
 #include "libdmmp/libdmmp.h"
@@ -82,7 +83,7 @@ static out_type func_name(struct dmmp_context *ctx, const char *var_name) { \
 do { \
 	json_type j_type = json_type_null; \
 	json_object *j_obj_tmp = NULL; \
-	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != TRUE) { \
+	if (json_object_object_get_ex(j_obj, key, &j_obj_tmp) != true) { \
 		_error(ctx, "Invalid JSON output from multipathd IPC: " \
 		       "key '%s' not found", key); \
 		rc = DMMP_ERR_IPC_ERROR; \
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

