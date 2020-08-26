Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 01D4A252AFA
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 12:00:34 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-P6KUPgoyO9iQjMh9Xg28Zg-1; Wed, 26 Aug 2020 06:00:31 -0400
X-MC-Unique: P6KUPgoyO9iQjMh9Xg28Zg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1CE2A18B9F84;
	Wed, 26 Aug 2020 10:00:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EBB635D9F1;
	Wed, 26 Aug 2020 10:00:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A3DF3668E7;
	Wed, 26 Aug 2020 10:00:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QA01fI032482 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 06:00:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 21D84205F3A1; Wed, 26 Aug 2020 09:59:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 020F3205EB19
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CEE2C182C3C2
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:55 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-356-7h3OAxMSN9GNUCcVPixbNw-1;
	Wed, 26 Aug 2020 05:59:51 -0400
X-MC-Unique: 7h3OAxMSN9GNUCcVPixbNw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6CD01AD7F;
	Wed, 26 Aug 2020 10:00:20 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 26 Aug 2020 11:59:04 +0200
Message-Id: <20200826095907.5576-8-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07QA01fI032482
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 07/10] libmultipath: fix enable_foreign memory
	leak
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
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

enable_foreign wasn't freed in free_config(). Do it, and make
sure it's always a malloc'd string.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c | 2 ++
 multipath/main.c      | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index 86b6733..b9bdbdb 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -631,6 +631,8 @@ free_config (struct config * conf)
 
 	if (conf->config_dir)
 		FREE(conf->config_dir);
+	if (conf->enable_foreign)
+		FREE(conf->enable_foreign);
 
 	free_blacklist(conf->blist_devnode);
 	free_blacklist(conf->blist_wwid);
diff --git a/multipath/main.c b/multipath/main.c
index 80bc4b5..004bce5 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -997,7 +997,7 @@ main (int argc, char *argv[])
 	}
 
 	if ((cmd == CMD_LIST_SHORT || cmd == CMD_LIST_LONG) && enable_foreign)
-		conf->enable_foreign = "";
+		conf->enable_foreign = strdup("");
 
 	/* Failing here is non-fatal */
 	init_foreign(conf->multipath_dir, conf->enable_foreign);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

