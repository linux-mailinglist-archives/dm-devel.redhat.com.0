Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE1F456629
	for <lists+dm-devel@lfdr.de>; Fri, 19 Nov 2021 00:05:45 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-474-Doof_OzhNduYdrkzuer4tg-1; Thu, 18 Nov 2021 18:05:43 -0500
X-MC-Unique: Doof_OzhNduYdrkzuer4tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72DA71054F9B;
	Thu, 18 Nov 2021 23:05:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 50AB65D9DE;
	Thu, 18 Nov 2021 23:05:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2BEF14EA2A;
	Thu, 18 Nov 2021 23:05:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AIMx3J1002019 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 18 Nov 2021 17:59:03 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id B4CC91121314; Thu, 18 Nov 2021 22:59:03 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B0AA21121319
	for <dm-devel@redhat.com>; Thu, 18 Nov 2021 22:59:03 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9A3A48022F4
	for <dm-devel@redhat.com>; Thu, 18 Nov 2021 22:59:03 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-284-29SX8dg7PCiQCCfT-6Z3bQ-1; Thu, 18 Nov 2021 17:59:01 -0500
X-MC-Unique: 29SX8dg7PCiQCCfT-6Z3bQ-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 58E0B1FD3B;
	Thu, 18 Nov 2021 22:59:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F8A213B11;
	Thu, 18 Nov 2021 22:59:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id qJ/AAbTalmGHPAAAMHmgww
	(envelope-from <mwilck@suse.com>); Thu, 18 Nov 2021 22:59:00 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 18 Nov 2021 23:58:02 +0100
Message-Id: <20211118225840.19810-11-mwilck@suse.com>
In-Reply-To: <20211118225840.19810-1-mwilck@suse.com>
References: <20211118225840.19810-1-mwilck@suse.com>
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
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1AIMx3J1002019
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 10/48] multipathd: add prototype for
	cli_handler functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Use a typedef instead of spelling out the function type everywhere.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 multipathd/cli.c |  6 +++---
 multipathd/cli.h | 10 ++++++----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/multipathd/cli.c b/multipathd/cli.c
index 4d6c37c..5213813 100644
--- a/multipathd/cli.c
+++ b/multipathd/cli.c
@@ -65,7 +65,7 @@ out:
 }
 
 int
-add_handler (uint64_t fp, int (*fn)(void *, char **, int *, void *))
+add_handler (uint64_t fp, cli_handler *fn)
 {
 	struct handler * h;
 
@@ -100,7 +100,7 @@ find_handler (uint64_t fp)
 }
 
 int
-set_handler_callback (uint64_t fp, int (*fn)(void *, char **, int *, void *))
+set_handler_callback (uint64_t fp, cli_handler *fn)
 {
 	struct handler * h = find_handler(fp);
 
@@ -112,7 +112,7 @@ set_handler_callback (uint64_t fp, int (*fn)(void *, char **, int *, void *))
 }
 
 int
-set_unlocked_handler_callback (uint64_t fp,int (*fn)(void *, char **, int *, void *))
+set_unlocked_handler_callback (uint64_t fp, cli_handler *fn)
 {
 	struct handler * h = find_handler(fp);
 
diff --git a/multipathd/cli.h b/multipathd/cli.h
index 1e8948a..3dac1b4 100644
--- a/multipathd/cli.h
+++ b/multipathd/cli.h
@@ -124,16 +124,18 @@ struct key {
 	int has_param;
 };
 
+typedef int (cli_handler)(void *keywords, char **reply, int *len, void *data);
+
 struct handler {
 	uint64_t fingerprint;
 	int locked;
-	int (*fn)(void *, char **, int *, void *);
+	cli_handler *fn;
 };
 
 int alloc_handlers (void);
-int add_handler (uint64_t fp, int (*fn)(void *, char **, int *, void *));
-int set_handler_callback (uint64_t fp, int (*fn)(void *, char **, int *, void *));
-int set_unlocked_handler_callback (uint64_t fp, int (*fn)(void *, char **, int *, void *));
+int add_handler (uint64_t fp, cli_handler *fn);
+int set_handler_callback (uint64_t fp, cli_handler *fn);
+int set_unlocked_handler_callback (uint64_t fp, cli_handler *fn);
 int parse_cmd (char * cmd, char ** reply, int * len, void *, int);
 int load_keys (void);
 char * get_keyparam (vector v, uint64_t code);
-- 
2.33.1


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

