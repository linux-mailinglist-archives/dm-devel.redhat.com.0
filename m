Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B9682772FF
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 15:46:29 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-YrLzE543OZW3AN0zgINYWg-1; Thu, 24 Sep 2020 09:46:24 -0400
X-MC-Unique: YrLzE543OZW3AN0zgINYWg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 69BAA10A7AEA;
	Thu, 24 Sep 2020 13:46:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 43D475C1C7;
	Thu, 24 Sep 2020 13:46:16 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F25F68C7A4;
	Thu, 24 Sep 2020 13:46:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08ODfmP2026902 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 09:41:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D395A1006180; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CF41F112D170
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B47F1900C63
	for <dm-devel@redhat.com>; Thu, 24 Sep 2020 13:41:48 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-288-dZWD9eYIM9GW990dekTTsA-1;
	Thu, 24 Sep 2020 09:41:43 -0400
X-MC-Unique: dZWD9eYIM9GW990dekTTsA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 8306DB190;
	Thu, 24 Sep 2020 13:41:42 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 24 Sep 2020 15:40:51 +0200
Message-Id: <20200924134054.14632-21-mwilck@suse.com>
In-Reply-To: <20200924134054.14632-1-mwilck@suse.com>
References: <20200924134054.14632-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08ODfmP2026902
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 20/23] multipath: use atexit() for cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 39 ++++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 21 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 9ae46ed..049a36f 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -452,13 +452,21 @@ static bool released_to_systemd(void)
 	return ret;
 }
 
+static void cleanup_vecs(__attribute__((unused)) int dummy, void *arg)
+{
+	struct vectors *vecs = arg;
+
+	free_multipathvec(vecs->mpvec, KEEP_PATHS);
+	free_pathvec(vecs->pathvec, FREE_PATHS);
+}
+
 static int
 configure (struct config *conf, enum mpath_cmds cmd,
 	   enum devtypes dev_type, char *devpath)
 {
 	vector curmp = NULL;
 	vector pathvec = NULL;
-	struct vectors vecs;
+	static struct vectors vecs;
 	int r = RTVL_FAIL, rc;
 	int di_flag = 0;
 	char * refwwid = NULL;
@@ -469,6 +477,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
 	 */
 	curmp = vector_alloc();
 	pathvec = vector_alloc();
+	on_exit(cleanup_vecs, &vecs);
 
 	if (!curmp || !pathvec) {
 		condlog(0, "can not allocate memory");
@@ -580,9 +589,6 @@ out:
 	if (refwwid)
 		FREE(refwwid);
 
-	free_multipathvec(curmp, KEEP_PATHS);
-	free_pathvec(pathvec, FREE_PATHS);
-
 	return r;
 }
 
@@ -808,9 +814,13 @@ main (int argc, char *argv[])
 	bool enable_foreign = false;
 
 	libmultipath_init();
+	if (atexit(dm_lib_exit) || atexit(libmultipath_exit))
+		condlog(1, "failed to register cleanup handler for libmultipath: %m");
 	logsink = 0;
 	if (init_config(DEFAULT_CONFIGFILE))
 		exit(RTVL_FAIL);
+	if (atexit(uninit_config))
+		condlog(1, "failed to register cleanup handler for config: %m");
 	conf = get_multipath_config();
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
@@ -887,7 +897,7 @@ main (int argc, char *argv[])
 			break;
 		case 't':
 			r = dump_config(conf, NULL, NULL) ? RTVL_FAIL : RTVL_OK;
-			goto out_free_config;
+			goto out;
 		case 'T':
 			cmd = CMD_DUMP_CONFIG;
 			break;
@@ -1048,26 +1058,13 @@ main (int argc, char *argv[])
 		condlog(3, "restart multipath configuration process");
 
 out:
-	dm_lib_exit();
-
-	cleanup_foreign();
-	cleanup_prio();
-	cleanup_checkers();
+	put_multipath_config(conf);
+	if (dev)
+		FREE(dev);
 
 	if (dev_type == DEV_UEVENT)
 		closelog();
 
-out_free_config:
-	/*
-	 * Freeing config must be done after dm_lib_exit(), because
-	 * the logging function (dm_write_log()), which is called there,
-	 * references the config.
-	 */
-	put_multipath_config(conf);
-	uninit_config();
-	libmultipath_exit();
-	if (dev)
-		FREE(dev);
 #ifdef _DEBUG_
 	dbg_free_final(NULL);
 #endif
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

