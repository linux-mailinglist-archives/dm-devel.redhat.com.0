Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EF15964D1DE
	for <lists+dm-devel@lfdr.de>; Wed, 14 Dec 2022 22:39:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671053944;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ENjY3XtwQ9vApLz8RiCTgMSU7HSfnRMubOuXQqK2PwU=;
	b=JZCuo7+MYOoAV4UqxUViispkStD50ye6oTl7BoBQyPWa2QfImaDgZ6aVYBySBBdufvZQq2
	ardQB2PLuKpmRnD7vy2vEfIMHG6XAJnEppyzc6vU/FZ70MSLqiwJgHo2Lcfb3uTNbKBfal
	fP8LVoWys88K45TLP6NJCA0xiDM29VI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-E0oFIFLrMNe6Ben3Acx7Zg-1; Wed, 14 Dec 2022 16:39:03 -0500
X-MC-Unique: E0oFIFLrMNe6Ben3Acx7Zg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D80E2380606F;
	Wed, 14 Dec 2022 21:39:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D45982166B2C;
	Wed, 14 Dec 2022 21:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 29B5A1946A72;
	Wed, 14 Dec 2022 21:38:48 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 673E31946A41
 for <dm-devel@listman.corp.redhat.com>; Wed, 14 Dec 2022 21:38:27 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id F2928400D79D; Wed, 14 Dec 2022 21:38:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D404740C945A;
 Wed, 14 Dec 2022 21:38:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2BELcP89014971;
 Wed, 14 Dec 2022 15:38:25 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2BELcP0n014970;
 Wed, 14 Dec 2022 15:38:25 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 14 Dec 2022 15:38:20 -0600
Message-Id: <1671053900-14923-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1671053900-14923-1-git-send-email-bmarzins@redhat.com>
References: <1671053900-14923-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH V2 3/3] libmutipath: validate the argument count
 of config strings
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The features, path_selector, and hardware_handler config options pass
their strings directly into the kernel.  If users omit the argument
counts from these strings, or use the wrong value, the kernel's table
parsing gets completely messed up, and the error messages it prints
don't reflect what actully went wrong. To avoid messing up the
kernel table parsing, verify that these strings correctly set the
argument count to the number of arguments they have.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dict.c | 110 ++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 101 insertions(+), 9 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index f4233882..2e9b45f9 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -116,6 +116,58 @@ set_str(vector strvec, void *ptr, const char *file, int line_nr)
 	return 0;
 }
 
+static int
+set_arg_str(vector strvec, void *ptr, int count_idx, const char *file,
+	    int line_nr)
+{
+	char **str_ptr = (char **)ptr;
+	char *old_str = *str_ptr;
+	const char * const spaces = " \f\r\t\v";
+	char *p, *end;
+	int idx = -1;
+	long int count = -1;
+
+	*str_ptr = set_value(strvec);
+	if (!*str_ptr) {
+		free(old_str);
+		return 1;
+	}
+	p = *str_ptr;
+	while (*p != '\0') {
+		p += strspn(p, spaces);
+		if (*p == '\0')
+			break;
+		idx += 1;
+		if (idx == count_idx) {
+			errno = 0;
+			count = strtol(p, &end, 10);
+			if (errno == ERANGE || end == p ||
+			    !(isspace(*end) || *end == '\0')) {
+				count = -1;
+				break;
+			}
+		}
+		p += strcspn(p, spaces);
+	}
+	if (count < 0) {
+		condlog(1, "%s line %d, missing argument count for %s",
+			file, line_nr, (char*)VECTOR_SLOT(strvec, 0));
+		goto fail;
+	}
+	if (count != idx - count_idx) {
+		condlog(1, "%s line %d, invalid argument count for %s:, got '%ld' expected '%d'",
+			file, line_nr, (char*)VECTOR_SLOT(strvec, 0), count,
+			idx - count_idx);
+		goto fail;
+	}
+	free(old_str);
+	return 0;
+fail:
+	free(*str_ptr);
+	*str_ptr = old_str;
+	return 0;
+}
+
 static int
 set_path(vector strvec, void *ptr, const char *file, int line_nr)
 {
@@ -288,6 +340,14 @@ def_ ## option ## _handler (struct config *conf, vector strvec,         \
 	return set_int(strvec, &conf->option, minval, maxval, file, line_nr); \
 }
 
+#define declare_def_arg_str_handler(option, count_idx)			\
+static int								\
+def_ ## option ## _handler (struct config *conf, vector strvec,		\
+			    const char *file, int line_nr)		\
+{									\
+	return set_arg_str(strvec, &conf->option, count_idx, file, line_nr); \
+}
+
 #define declare_def_snprint(option, function)				\
 static int								\
 snprint_def_ ## option (struct config *conf, struct strbuf *buff,	\
@@ -340,6 +400,17 @@ hw_ ## option ## _handler (struct config *conf, vector strvec,		\
 	return set_int(strvec, &hwe->option, minval, maxval, file, line_nr); \
 }
 
+#define declare_hw_arg_str_handler(option, count_idx)			\
+static int								\
+hw_ ## option ## _handler (struct config *conf, vector strvec,		\
+			    const char *file, int line_nr)		\
+{									\
+	struct hwentry * hwe = VECTOR_LAST_SLOT(conf->hwtable);		\
+	if (!hwe)							\
+		return 1;						\
+	return set_arg_str(strvec, &hwe->option, count_idx, file, line_nr); \
+}
+
 
 #define declare_hw_snprint(option, function)				\
 static int								\
@@ -371,6 +442,16 @@ ovr_ ## option ## _handler (struct config *conf, vector strvec,		\
 		       file, line_nr); \
 }
 
+#define declare_ovr_arg_str_handler(option, count_idx)			\
+static int								\
+ovr_ ## option ## _handler (struct config *conf, vector strvec,		\
+			    const char *file, int line_nr)		\
+{									\
+	if (!conf->overrides)						\
+		return 1;						\
+	return set_arg_str(strvec, &conf->overrides->option, count_idx, file, line_nr); \
+}
+
 #define declare_ovr_snprint(option, function)				\
 static int								\
 snprint_ovr_ ## option (struct config *conf, struct strbuf *buff,	\
@@ -401,6 +482,17 @@ mp_ ## option ## _handler (struct config *conf, vector strvec,		\
 	return set_int(strvec, &mpe->option, minval, maxval, file, line_nr); \
 }
 
+#define declare_mp_arg_str_handler(option, count_idx)			\
+static int								\
+mp_ ## option ## _handler (struct config *conf, vector strvec,		\
+			    const char *file, int line_nr)		\
+{									\
+	struct mpentry * mpe = VECTOR_LAST_SLOT(conf->mptable);		\
+	if (!mpe)							\
+		return 1;						\
+	return set_arg_str(strvec, &mpe->option, count_idx, file, line_nr); \
+}
+
 #define declare_mp_snprint(option, function)				\
 static int								\
 snprint_mp_ ## option (struct config *conf, struct strbuf *buff,	\
@@ -584,13 +676,13 @@ snprint_def_marginal_pathgroups(struct config *conf, struct strbuf *buff,
 }
 
 
-declare_def_handler(selector, set_str)
+declare_def_arg_str_handler(selector, 1)
 declare_def_snprint_defstr(selector, print_str, DEFAULT_SELECTOR)
-declare_hw_handler(selector, set_str)
+declare_hw_arg_str_handler(selector, 1)
 declare_hw_snprint(selector, print_str)
-declare_ovr_handler(selector, set_str)
+declare_ovr_arg_str_handler(selector, 1)
 declare_ovr_snprint(selector, print_str)
-declare_mp_handler(selector, set_str)
+declare_mp_arg_str_handler(selector, 1)
 declare_mp_snprint(selector, print_str)
 
 static int snprint_uid_attrs(struct config *conf, struct strbuf *buff,
@@ -663,13 +755,13 @@ declare_hw_snprint(prio_args, print_str)
 declare_mp_handler(prio_args, set_str)
 declare_mp_snprint(prio_args, print_str)
 
-declare_def_handler(features, set_str)
+declare_def_arg_str_handler(features, 0)
 declare_def_snprint_defstr(features, print_str, DEFAULT_FEATURES)
-declare_ovr_handler(features, set_str)
+declare_ovr_arg_str_handler(features, 0)
 declare_ovr_snprint(features, print_str)
-declare_hw_handler(features, set_str)
+declare_hw_arg_str_handler(features, 0)
 declare_hw_snprint(features, print_str)
-declare_mp_handler(features, set_str)
+declare_mp_arg_str_handler(features, 0)
 declare_mp_snprint(features, print_str)
 
 declare_def_handler(checker_name, set_str)
@@ -1821,7 +1913,7 @@ declare_hw_snprint(revision, print_str)
 declare_hw_handler(bl_product, set_str)
 declare_hw_snprint(bl_product, print_str)
 
-declare_hw_handler(hwhandler, set_str)
+declare_hw_arg_str_handler(hwhandler, 0)
 declare_hw_snprint(hwhandler, print_str)
 
 /*
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

