Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id B180C219D6E
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-364-LTPKnWRzNvaMgZqa-ibW9g-1; Thu, 09 Jul 2020 06:17:33 -0400
X-MC-Unique: LTPKnWRzNvaMgZqa-ibW9g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 894CA107AD74;
	Thu,  9 Jul 2020 10:17:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6878E5C1C3;
	Thu,  9 Jul 2020 10:17:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 2941993F8E;
	Thu,  9 Jul 2020 10:17:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGwrL029359 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 490A21000DAA; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 443E8100405E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 07F2A80CC5D
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-371--0mdAivwOlmgjrULJLhniA-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: -0mdAivwOlmgjrULJLhniA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3804FB080;
	Thu,  9 Jul 2020 10:16:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:55 +0200
Message-Id: <20200709101620.6786-11-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGwrL029359
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 10/35] libmultipath: util: constify function
	arguments
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

Use "const" for function arguments where possible.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c |  2 +-
 libmultipath/util.c     | 12 ++++++------
 libmultipath/util.h     | 10 +++++-----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index b856a07..27581cd 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -18,7 +18,7 @@
 #define WORD_SIZE 64
 
 static int
-merge_words(char **dst, char *word)
+merge_words(char **dst, const char *word)
 {
 	char * p = *dst;
 	int len, dstlen;
diff --git a/libmultipath/util.c b/libmultipath/util.c
index 46cacd4..957fb97 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -53,7 +53,7 @@ basenamecpy (const char *src, char *dst, size_t size)
 }
 
 int
-filepresent (char * run) {
+filepresent (const char *run) {
 	struct stat buf;
 
 	if(!stat(run, &buf))
@@ -61,7 +61,7 @@ filepresent (char * run) {
 	return 0;
 }
 
-char *get_next_string(char **temp, char *split_char)
+char *get_next_string(char **temp, const char *split_char)
 {
 	char *token = NULL;
 	token = strsep(temp, split_char);
@@ -71,9 +71,9 @@ char *get_next_string(char **temp, char *split_char)
 }
 
 int
-get_word (char * sentence, char ** word)
+get_word (const char *sentence, char **word)
 {
-	char * p;
+	const char *p;
 	int len;
 	int skip = 0;
 
@@ -316,7 +316,7 @@ int get_linux_version_code(void)
 	return _linux_version_code;
 }
 
-int parse_prkey(char *ptr, uint64_t *prkey)
+int parse_prkey(const char *ptr, uint64_t *prkey)
 {
 	if (!ptr)
 		return 1;
@@ -333,7 +333,7 @@ int parse_prkey(char *ptr, uint64_t *prkey)
 	return 0;
 }
 
-int parse_prkey_flags(char *ptr, uint64_t *prkey, uint8_t *flags)
+int parse_prkey_flags(const char *ptr, uint64_t *prkey, uint8_t *flags)
 {
 	char *flagstr;
 
diff --git a/libmultipath/util.h b/libmultipath/util.h
index ec6de6d..ae18d8b 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -12,9 +12,9 @@
 
 size_t strchop(char *);
 int basenamecpy (const char *src, char *dst, size_t size);
-int filepresent (char * run);
-char *get_next_string(char **temp, char *split_char);
-int get_word (char * sentence, char ** word);
+int filepresent (const char *run);
+char *get_next_string(char **temp, const char *split_char);
+int get_word (const char * sentence, char ** word);
 size_t strlcpy(char *dst, const char *src, size_t size);
 size_t strlcat(char *dst, const char *src, size_t size);
 int devt2devname (char *, int, const char *);
@@ -23,8 +23,8 @@ char *convert_dev(char *dev, int is_path_device);
 void setup_thread_attr(pthread_attr_t *attr, size_t stacksize, int detached);
 int systemd_service_enabled(const char *dev);
 int get_linux_version_code(void);
-int parse_prkey(char *ptr, uint64_t *prkey);
-int parse_prkey_flags(char *ptr, uint64_t *prkey, uint8_t *flags);
+int parse_prkey(const char *ptr, uint64_t *prkey);
+int parse_prkey_flags(const char *ptr, uint64_t *prkey, uint8_t *flags);
 int safe_write(int fd, const void *buf, size_t count);
 void set_max_fds(rlim_t max_fds);
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

