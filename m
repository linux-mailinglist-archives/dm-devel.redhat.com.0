Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 354E92DC61F
	for <lists+dm-devel@lfdr.de>; Wed, 16 Dec 2020 19:19:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-10-Pm7uWJ8KNwaI0UazhpNyfA-1; Wed, 16 Dec 2020 13:19:19 -0500
X-MC-Unique: Pm7uWJ8KNwaI0UazhpNyfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47C008144FF;
	Wed, 16 Dec 2020 18:19:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 254B46362B;
	Wed, 16 Dec 2020 18:19:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D962C50035;
	Wed, 16 Dec 2020 18:19:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BGIIeJi018095 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Dec 2020 13:18:40 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DC7002166B2D; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7CBC2166B27
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C448582DFE3
	for <dm-devel@redhat.com>; Wed, 16 Dec 2020 18:18:39 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-321-35ectKEVPIiD0GY_3_JnRg-1;
	Wed, 16 Dec 2020 13:18:35 -0500
X-MC-Unique: 35ectKEVPIiD0GY_3_JnRg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 739ECB19B;
	Wed, 16 Dec 2020 18:18:33 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Dec 2020 19:16:59 +0100
Message-Id: <20201216181708.22224-21-mwilck@suse.com>
In-Reply-To: <20201216181708.22224-1-mwilck@suse.com>
References: <20201216181708.22224-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0BGIIeJi018095
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 20/29] multipath: use atexit() for cleanup
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 37 ++++++++++++++++---------------------
 1 file changed, 16 insertions(+), 21 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 9ae46ed..1949a1c 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -452,13 +452,19 @@ static bool released_to_systemd(void)
 	return ret;
 }
 
+static struct vectors vecs;
+static void cleanup_vecs(void)
+{
+	free_multipathvec(vecs.mpvec, KEEP_PATHS);
+	free_pathvec(vecs.pathvec, FREE_PATHS);
+}
+
 static int
 configure (struct config *conf, enum mpath_cmds cmd,
 	   enum devtypes dev_type, char *devpath)
 {
 	vector curmp = NULL;
 	vector pathvec = NULL;
-	struct vectors vecs;
 	int r = RTVL_FAIL, rc;
 	int di_flag = 0;
 	char * refwwid = NULL;
@@ -469,6 +475,7 @@ configure (struct config *conf, enum mpath_cmds cmd,
 	 */
 	curmp = vector_alloc();
 	pathvec = vector_alloc();
+	atexit(cleanup_vecs);
 
 	if (!curmp || !pathvec) {
 		condlog(0, "can not allocate memory");
@@ -580,9 +587,6 @@ out:
 	if (refwwid)
 		FREE(refwwid);
 
-	free_multipathvec(curmp, KEEP_PATHS);
-	free_pathvec(pathvec, FREE_PATHS);
-
 	return r;
 }
 
@@ -808,9 +812,13 @@ main (int argc, char *argv[])
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
@@ -887,7 +895,7 @@ main (int argc, char *argv[])
 			break;
 		case 't':
 			r = dump_config(conf, NULL, NULL) ? RTVL_FAIL : RTVL_OK;
-			goto out_free_config;
+			goto out;
 		case 'T':
 			cmd = CMD_DUMP_CONFIG;
 			break;
@@ -1048,26 +1056,13 @@ main (int argc, char *argv[])
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
2.29.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

