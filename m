Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8660729036C
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:45:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-jPubwZGTP7qk1aZsWCSwkQ-1; Fri, 16 Oct 2020 06:45:54 -0400
X-MC-Unique: jPubwZGTP7qk1aZsWCSwkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05A3918A823F;
	Fri, 16 Oct 2020 10:45:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D614D7667A;
	Fri, 16 Oct 2020 10:45:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 933391832FC2;
	Fri, 16 Oct 2020 10:45:47 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAjMJX020836 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD54E12D8B8; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8C5416C2E0
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82A36801184
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:45:22 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-112-38dmOTL1Op67BzXIIsvkKw-1;
	Fri, 16 Oct 2020 06:45:19 -0400
X-MC-Unique: 38dmOTL1Op67BzXIIsvkKw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 20DC0AF68;
	Fri, 16 Oct 2020 10:45:18 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:44:59 +0200
Message-Id: <20201016104501.8700-28-mwilck@suse.com>
In-Reply-To: <20201016104501.8700-1-mwilck@suse.com>
References: <20201016104501.8700-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAjMJX020836
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 27/29] multipathd: common code for "-k" and
	command args
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

'multipathd -k"cmd"' and 'multipath cmd' are the same thing.
Treat it with common code.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 37 +++++++++++++++++++------------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 725a10b..0cf8a26 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3303,6 +3303,8 @@ main (int argc, char *argv[])
 	int err;
 	int foreground = 0;
 	struct config *conf;
+	char *opt_k_arg = NULL;
+	bool opt_k = false;
 
 	ANNOTATE_BENIGN_RACE_SIZED(&multipath_conf, sizeof(multipath_conf),
 				   "Manipulated through RCU");
@@ -3350,16 +3352,9 @@ main (int argc, char *argv[])
 			logsink = LOGSINK_STDERR_WITHOUT_TIME;
 			break;
 		case 'k':
-			logsink = 0;
-			conf = load_config(DEFAULT_CONFIGFILE);
-			if (!conf)
-				exit(1);
-			if (verbosity)
-				libmp_verbosity = verbosity;
-			uxsock_timeout = conf->uxsock_timeout;
-			err = uxclnt(optarg, uxsock_timeout + 100);
-			free_config(conf);
-			return err;
+			opt_k = true;
+			opt_k_arg = optarg;
+			break;
 		case 'B':
 			bindings_read_only = 1;
 			break;
@@ -3375,7 +3370,7 @@ main (int argc, char *argv[])
 			exit(1);
 		}
 	}
-	if (optind < argc) {
+	if (opt_k || optind < argc) {
 		char cmd[CMDSIZE];
 		char * s = cmd;
 		char * c = s;
@@ -3390,14 +3385,20 @@ main (int argc, char *argv[])
 			libmp_verbosity = verbosity;
 		uxsock_timeout = conf->uxsock_timeout;
 		memset(cmd, 0x0, CMDSIZE);
-		while (optind < argc) {
-			if (strchr(argv[optind], ' '))
-				c += snprintf(c, s + CMDSIZE - c, "\"%s\" ", argv[optind]);
-			else
-				c += snprintf(c, s + CMDSIZE - c, "%s ", argv[optind]);
-			optind++;
+		if (opt_k)
+			s = opt_k_arg;
+		else {
+			while (optind < argc) {
+				if (strchr(argv[optind], ' '))
+					c += snprintf(c, s + CMDSIZE - c,
+						      "\"%s\" ", argv[optind]);
+				else
+					c += snprintf(c, s + CMDSIZE - c,
+						      "%s ", argv[optind]);
+				optind++;
+			}
+			c += snprintf(c, s + CMDSIZE - c, "\n");
 		}
-		c += snprintf(c, s + CMDSIZE - c, "\n");
 		err = uxclnt(s, uxsock_timeout + 100);
 		free_config(conf);
 		return err;
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

