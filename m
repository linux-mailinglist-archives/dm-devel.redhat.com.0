Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 15A7A2936AE
	for <lists+dm-devel@lfdr.de>; Tue, 20 Oct 2020 10:22:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-lB-pOgkMPOafyEdud3EFMw-1; Tue, 20 Oct 2020 04:22:50 -0400
X-MC-Unique: lB-pOgkMPOafyEdud3EFMw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 100F11087D64;
	Tue, 20 Oct 2020 08:22:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE04D282E1;
	Tue, 20 Oct 2020 08:22:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98EF18C7BC;
	Tue, 20 Oct 2020 08:22:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09JBK773022426 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 19 Oct 2020 07:20:07 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 44D8612EC0E; Mon, 19 Oct 2020 11:20:07 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E7AD12EC0A
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 11:20:05 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE8348008A5
	for <dm-devel@redhat.com>; Mon, 19 Oct 2020 11:20:04 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-517-JXCCbM9AN_mdrXpzdJMJMw-1;
	Mon, 19 Oct 2020 07:20:00 -0400
X-MC-Unique: JXCCbM9AN_mdrXpzdJMJMw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 9C463B2E8;
	Mon, 19 Oct 2020 11:19:59 +0000 (UTC)
From: Anthony Iliopoulos <ailiop@suse.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 19 Oct 2020 13:20:16 +0200
Message-Id: <20201019112017.18544-3-ailiop@suse.com>
In-Reply-To: <20201019112017.18544-1-ailiop@suse.com>
References: <20201019112017.18544-1-ailiop@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09JBK773022426
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Tue, 20 Oct 2020 04:22:10 -0400
Cc: dm-devel@redhat.com
Subject: [dm-devel] [PATCH 2/3] libmultipath: fix compilation on systems
	without systemd
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hide set_max_checkint_from_watchdog and its invocation completely behind
ifdefs to avoid breaking compilation on non-systemd environments.
Otherwise gcc bails out due to -Werror since it detects an unused
parameter to the function.

Signed-off-by: Anthony Iliopoulos <ailiop@suse.com>
---
 libmultipath/config.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index b4d87689eab3..658bec8b81c7 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -696,9 +696,9 @@ process_config_dir(struct config *conf, char *dir)
 	pthread_cleanup_pop(1);
 }
 
+#ifdef USE_SYSTEMD
 static void set_max_checkint_from_watchdog(struct config *conf)
 {
-#ifdef USE_SYSTEMD
 	char *envp = getenv("WATCHDOG_USEC");
 	unsigned long checkint;
 
@@ -714,8 +714,8 @@ static void set_max_checkint_from_watchdog(struct config *conf)
 		condlog(3, "enabling watchdog, interval %ld", checkint);
 		conf->use_watchdog = true;
 	}
-#endif
 }
+#endif
 
 struct config *
 load_config (char * file)
@@ -789,7 +789,9 @@ load_config (char * file)
 	/*
 	 * fill the voids left in the config file
 	 */
+#ifdef USE_SYSTEMD
 	set_max_checkint_from_watchdog(conf);
+#endif
 	if (conf->max_checkint == 0) {
 		if (conf->checkint == CHECKINT_UNDEF)
 			conf->checkint = DEFAULT_CHECKINT;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

