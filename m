Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97174464E13
	for <lists+dm-devel@lfdr.de>; Wed,  1 Dec 2021 13:38:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-I2W_3BANMIaegBg7RJuK7g-1; Wed, 01 Dec 2021 07:37:36 -0500
X-MC-Unique: I2W_3BANMIaegBg7RJuK7g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4D8D71006AA5;
	Wed,  1 Dec 2021 12:37:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2DF2579448;
	Wed,  1 Dec 2021 12:37:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DA7F81809CB7;
	Wed,  1 Dec 2021 12:37:29 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
	[10.11.54.9])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1B1CbC3Y008737 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 1 Dec 2021 07:37:13 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CD396492C3B; Wed,  1 Dec 2021 12:37:12 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9513F492C38
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 12:37:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6538685A5A8
	for <dm-devel@redhat.com>; Wed,  1 Dec 2021 12:37:12 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-304-kU8nmxsVOGOeUgSEVCDgzg-1; Wed, 01 Dec 2021 07:37:10 -0500
X-MC-Unique: kU8nmxsVOGOeUgSEVCDgzg-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 7379E1FD5E;
	Wed,  1 Dec 2021 12:37:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E33013FF5;
	Wed,  1 Dec 2021 12:37:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id OO5nDXVsp2GGKAAAMHmgww
	(envelope-from <mwilck@suse.com>); Wed, 01 Dec 2021 12:37:09 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed,  1 Dec 2021 13:36:46 +0100
Message-Id: <20211201123650.16240-18-mwilck@suse.com>
In-Reply-To: <20211201123650.16240-1-mwilck@suse.com>
References: <20211201123650.16240-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1B1CbC3Y008737
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 17/21] multipathd (coverity): daemonize(): use
	dup2
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

Modify the file descriptors atomically usign dup2(), and make
sure to cleanup properly even in case of an error, and to not
close stdout/in/err if the program had been started with any of
them closed.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/main.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 36cc76f..7a57a79 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -3337,11 +3337,18 @@ failed:
 	return sd_notify_exit(exit_code);
 }
 
+static void cleanup_close(int *pfd)
+{
+	if (*pfd != -1 && *pfd != STDIN_FILENO && *pfd != STDOUT_FILENO &&
+	    *pfd != STDERR_FILENO)
+		close(*pfd);
+}
+
 static int
 daemonize(void)
 {
 	int pid;
-	int dev_null_fd;
+	int dev_null_fd __attribute__((cleanup(cleanup_close))) = -1;
 
 	if( (pid = fork()) < 0){
 		fprintf(stderr, "Failed first fork : %s\n", strerror(errno));
@@ -3367,25 +3374,21 @@ daemonize(void)
 		_exit(0);
 	}
 
-	close(STDIN_FILENO);
-	if (dup(dev_null_fd) < 0) {
-		fprintf(stderr, "cannot dup /dev/null to stdin : %s\n",
+	if (dup2(dev_null_fd, STDIN_FILENO) < 0) {
+		fprintf(stderr, "cannot dup2 /dev/null to stdin : %s\n",
 			strerror(errno));
 		_exit(0);
 	}
-	close(STDOUT_FILENO);
-	if (dup(dev_null_fd) < 0) {
-		fprintf(stderr, "cannot dup /dev/null to stdout : %s\n",
+	if (dup2(dev_null_fd, STDOUT_FILENO) < 0) {
+		fprintf(stderr, "cannot dup2 /dev/null to stdout : %s\n",
 			strerror(errno));
 		_exit(0);
 	}
-	close(STDERR_FILENO);
-	if (dup(dev_null_fd) < 0) {
+	if (dup2(dev_null_fd, STDERR_FILENO) < 0) {
 		fprintf(stderr, "cannot dup /dev/null to stderr : %s\n",
 			strerror(errno));
 		_exit(0);
 	}
-	close(dev_null_fd);
 	daemon_pid = getpid();
 	return 0;
 }
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

