Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2E26C45F
	for <lists+dm-devel@lfdr.de>; Wed, 16 Sep 2020 17:39:58 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-jKi_pnZlNC6r6yAinSCwYw-1; Wed, 16 Sep 2020 11:39:54 -0400
X-MC-Unique: jKi_pnZlNC6r6yAinSCwYw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8949657072;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 686F17BE5B;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 21171183D02F;
	Wed, 16 Sep 2020 15:39:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08GFdWPs024194 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Sep 2020 11:39:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 03CDA2157F26; Wed, 16 Sep 2020 15:39:32 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F32812166B27
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9F2118AE94A
	for <dm-devel@redhat.com>; Wed, 16 Sep 2020 15:39:31 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-560-nHS0nuZpNrSBf5V-gjW65w-1;
	Wed, 16 Sep 2020 11:39:29 -0400
X-MC-Unique: nHS0nuZpNrSBf5V-gjW65w-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A3029B331;
	Wed, 16 Sep 2020 15:39:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 16 Sep 2020 17:37:14 +0200
Message-Id: <20200916153718.582-16-mwilck@suse.com>
In-Reply-To: <20200916153718.582-1-mwilck@suse.com>
References: <20200916153718.582-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 08GFdWPs024194
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 15/19] multipath: use {get_put}_multipath_config
	from libmultipath
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

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipath/main.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 650977c..2f5ddd9 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -68,7 +68,6 @@
 
 int logsink;
 struct udev *udev;
-struct config *multipath_conf;
 
 /*
  * Return values of configure(), check_path_valid(), and main().
@@ -79,16 +78,6 @@ enum {
 	RTVL_RETRY, /* returned by configure(), not by main() */
 };
 
-struct config *get_multipath_config(void)
-{
-	return multipath_conf;
-}
-
-void put_multipath_config(__attribute__((unused)) void *arg)
-{
-	/* Noop for now */
-}
-
 static int
 dump_config (struct config *conf, vector hwes, vector mpvec)
 {
@@ -826,10 +815,9 @@ main (int argc, char *argv[])
 
 	udev = udev_new();
 	logsink = 0;
-	conf = load_config(DEFAULT_CONFIGFILE);
-	if (!conf)
+	if (init_config(DEFAULT_CONFIGFILE))
 		exit(RTVL_FAIL);
-	multipath_conf = conf;
+	conf = get_multipath_config();
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
 	while ((arg = getopt(argc, argv, ":adDcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
@@ -1081,8 +1069,8 @@ out_free_config:
 	 * the logging function (dm_write_log()), which is called there,
 	 * references the config.
 	 */
-	free_config(conf);
-	conf = NULL;
+	put_multipath_config(conf);
+	uninit_config();
 	udev_unref(udev);
 	if (dev)
 		FREE(dev);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

