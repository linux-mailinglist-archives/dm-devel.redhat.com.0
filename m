Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 33C1629031E
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:45:06 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-tIFkeJOKMJG8WVEUB6fCxA-1; Fri, 16 Oct 2020 06:44:16 -0400
X-MC-Unique: tIFkeJOKMJG8WVEUB6fCxA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 481DD803651;
	Fri, 16 Oct 2020 10:44:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 284BF73671;
	Fri, 16 Oct 2020 10:44:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D9636181A88C;
	Fri, 16 Oct 2020 10:44:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhsbx020201 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 56E3A11CC22E; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F5FB11DBD71
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31A7F811E82
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:54 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-326-nVbIIofXMGOyYCtTo_gDuQ-1;
	Fri, 16 Oct 2020 06:43:51 -0400
X-MC-Unique: nVbIIofXMGOyYCtTo_gDuQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 985EAB2B3;
	Fri, 16 Oct 2020 10:43:49 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:43:26 +0200
Message-Id: <20201016104329.8337-19-mwilck@suse.com>
In-Reply-To: <20201016104329.8337-1-mwilck@suse.com>
References: <20201016104329.8337-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhsbx020201
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 18/21] multipath: remove logsink and udev
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We can use libmultipath's symbols now.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 4bbfce9..9ae46ed 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -66,9 +66,6 @@
 #include "valid.h"
 #include "alias.h"
 
-int logsink;
-struct udev *udev;
-
 /*
  * Return values of configure(), check_path_valid(), and main().
  */
@@ -810,7 +807,7 @@ main (int argc, char *argv[])
 	int retries = -1;
 	bool enable_foreign = false;
 
-	udev = udev_new();
+	libmultipath_init();
 	logsink = 0;
 	if (init_config(DEFAULT_CONFIGFILE))
 		exit(RTVL_FAIL);
@@ -1068,7 +1065,7 @@ out_free_config:
 	 */
 	put_multipath_config(conf);
 	uninit_config();
-	udev_unref(udev);
+	libmultipath_exit();
 	if (dev)
 		FREE(dev);
 #ifdef _DEBUG_
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

