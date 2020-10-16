Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 36AAE290307
	for <lists+dm-devel@lfdr.de>; Fri, 16 Oct 2020 12:44:10 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-yS_diuciP3u4aRzH8sB2CA-1; Fri, 16 Oct 2020 06:44:05 -0400
X-MC-Unique: yS_diuciP3u4aRzH8sB2CA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BFE8801FC6;
	Fri, 16 Oct 2020 10:43:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A15773667;
	Fri, 16 Oct 2020 10:43:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B3B11181A872;
	Fri, 16 Oct 2020 10:43:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09GAhrba020164 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 16 Oct 2020 06:43:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4801C124579; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 423A916C2DB
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29472800186
	for <dm-devel@redhat.com>; Fri, 16 Oct 2020 10:43:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-555-YyeJfaovNyGAzI48g9gQxw-1;
	Fri, 16 Oct 2020 06:43:49 -0400
X-MC-Unique: YyeJfaovNyGAzI48g9gQxw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F032DAF2C;
	Fri, 16 Oct 2020 10:43:47 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 16 Oct 2020 12:43:20 +0200
Message-Id: <20201016104329.8337-13-mwilck@suse.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 09GAhrba020164
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 12/21] libmultipath: constify file argument in
	config parser
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

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/config.c | 3 +--
 libmultipath/config.h | 2 +-
 libmultipath/parser.c | 9 +++++----
 libmultipath/parser.h | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/libmultipath/config.c b/libmultipath/config.c
index df0f8f4..5c91a09 100644
--- a/libmultipath/config.c
+++ b/libmultipath/config.c
@@ -719,8 +719,7 @@ static void set_max_checkint_from_watchdog(struct config *conf)
 }
 #endif
 
-struct config *
-load_config (char * file)
+struct config *load_config(const char *file)
 {
 	struct config *conf = alloc_config();
 
diff --git a/libmultipath/config.h b/libmultipath/config.h
index 7af1984..ace403b 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -251,7 +251,7 @@ void free_mptable (vector mptable);
 
 int store_hwe (vector hwtable, struct hwentry *);
 
-struct config *load_config (char * file);
+struct config *load_config (const char *file);
 struct config * alloc_config (void);
 void free_config (struct config * conf);
 extern struct config *get_multipath_config(void);
diff --git a/libmultipath/parser.c b/libmultipath/parser.c
index ed6d5d6..163ffbc 100644
--- a/libmultipath/parser.c
+++ b/libmultipath/parser.c
@@ -390,7 +390,7 @@ oom:
 /* non-recursive configuration stream handler */
 static int kw_level = 0;
 
-int warn_on_duplicates(vector uniques, char *str, char *file)
+int warn_on_duplicates(vector uniques, char *str, const char *file)
 {
 	char *tmp;
 	int i;
@@ -434,7 +434,7 @@ is_sublevel_keyword(char *str)
 }
 
 int
-validate_config_strvec(vector strvec, char *file)
+validate_config_strvec(vector strvec, const char *file)
 {
 	char *str = NULL;
 	int i;
@@ -499,7 +499,8 @@ validate_config_strvec(vector strvec, char *file)
 }
 
 static int
-process_stream(struct config *conf, FILE *stream, vector keywords, char *file)
+process_stream(struct config *conf, FILE *stream, vector keywords,
+	       const char *file)
 {
 	int i;
 	int r = 0, t;
@@ -584,7 +585,7 @@ out:
 
 /* Data initialization */
 int
-process_file(struct config *conf, char *file)
+process_file(struct config *conf, const char *file)
 {
 	int r;
 	FILE *stream;
diff --git a/libmultipath/parser.h b/libmultipath/parser.h
index 62906e9..06666cc 100644
--- a/libmultipath/parser.h
+++ b/libmultipath/parser.h
@@ -77,7 +77,7 @@ extern void dump_keywords(vector keydump, int level);
 extern void free_keywords(vector keywords);
 extern vector alloc_strvec(char *string);
 extern void *set_value(vector strvec);
-extern int process_file(struct config *conf, char *conf_file);
+extern int process_file(struct config *conf, const char *conf_file);
 extern struct keyword * find_keyword(vector keywords, vector v, char * name);
 int snprint_keyword(char *buff, int len, char *fmt, struct keyword *kw,
 		    const void *data);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

