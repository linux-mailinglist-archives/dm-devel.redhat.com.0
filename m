Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E2EB0252AF9
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 12:00:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-x1YeHOZWNHKsdhWpeWuj1Q-1; Wed, 26 Aug 2020 06:00:29 -0400
X-MC-Unique: x1YeHOZWNHKsdhWpeWuj1Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8D27A10ABDBA;
	Wed, 26 Aug 2020 10:00:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E7617D87D;
	Wed, 26 Aug 2020 10:00:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB73E668E7;
	Wed, 26 Aug 2020 10:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QA01ED032483 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 06:00:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id CEFDA10064FD; Wed, 26 Aug 2020 09:59:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 30119114B9AC
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 77EBC805F5A
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-510-7QHjraHONoKpDxPPKhCmeg-1;
	Wed, 26 Aug 2020 05:59:51 -0400
X-MC-Unique: 7QHjraHONoKpDxPPKhCmeg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 32B39AD6F;
	Wed, 26 Aug 2020 10:00:20 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 26 Aug 2020 11:59:03 +0200
Message-Id: <20200826095907.5576-7-mwilck@suse.com>
In-Reply-To: <20200826095907.5576-1-mwilck@suse.com>
References: <20200826095907.5576-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07QA01ED032483
X-loop: dm-devel@redhat.com
Cc: lixiaokeng <lixiaokeng@huawei.com>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 06/10] libmultipath: fix memory leak in ble
	handlers
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Since patch "libmultipath fix a memory leak in set_ble_device",
strings are strdup'd in set_ble_device() and store_ble(). The
passed string must therefore be freed in the handlers in dict.c.

Fixes: ("libmultipath fix a memory leak in set_ble_device")
Cc: lixiaokeng <lixiaokeng@huawei.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dict.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index be3029c..feabae5 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -1499,7 +1499,8 @@ blacklist_exceptions_handler(struct config *conf, vector strvec)
 static int								\
 ble_ ## option ## _handler (struct config *conf, vector strvec)		\
 {									\
-	char * buff;							\
+	char *buff;							\
+	int rc;								\
 									\
 	if (!conf->option)						\
 		return 1;						\
@@ -1508,7 +1509,9 @@ ble_ ## option ## _handler (struct config *conf, vector strvec)		\
 	if (!buff)							\
 		return 1;						\
 									\
-	return store_ble(conf->option, buff, ORIGIN_CONFIG);		\
+	rc = store_ble(conf->option, buff, ORIGIN_CONFIG);		\
+	free(buff);							\
+	return rc;							\
 }
 
 #define declare_ble_device_handler(name, option, vend, prod)		\
@@ -1516,6 +1519,7 @@ static int								\
 ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
 {									\
 	char * buff;							\
+	int rc;								\
 									\
 	if (!conf->option)						\
 		return 1;						\
@@ -1524,7 +1528,9 @@ ble_ ## option ## _ ## name ## _handler (struct config *conf, vector strvec) \
 	if (!buff)							\
 		return 1;						\
 									\
-	return set_ble_device(conf->option, vend, prod, ORIGIN_CONFIG);	\
+	rc = set_ble_device(conf->option, vend, prod, ORIGIN_CONFIG);	\
+	free(buff);							\
+	return rc;							\
 }
 
 declare_ble_handler(blist_devnode)
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

