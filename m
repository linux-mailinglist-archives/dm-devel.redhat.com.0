Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C050D44DBD5
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 19:54:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636656881;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=sT+Nj9qvyCy6uilhWBM1o2aCJvMAZeb3ptbi6CmFY9Q=;
	b=CLACG8U/4r2SjT8en/Ea8WlOUISpXEJPZrSmRoLiRvMvTSpWnS1dmzvFYfm1i0+kFWI1Je
	4L3LIXNYlo35L8TXPJLLUO7QueJNULaE2KMORU65J5/BhO2UKxkAOlikB2FYSsTesDvnVq
	zj04pGDUWxmVMRW7ThZor+L9DH6ZI9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-KU1yAIgQNXy9N34uVw7O-Q-1; Thu, 11 Nov 2021 13:54:38 -0500
X-MC-Unique: KU1yAIgQNXy9N34uVw7O-Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C2251006AA6;
	Thu, 11 Nov 2021 18:54:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B1F21048127;
	Thu, 11 Nov 2021 18:54:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8F5D1832DD2;
	Thu, 11 Nov 2021 18:54:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1ABIs4t7027749 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 11 Nov 2021 13:54:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 684925C1D5; Thu, 11 Nov 2021 18:54:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 362175C3DF;
	Thu, 11 Nov 2021 18:54:00 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1ABIrv7u026109; 
	Thu, 11 Nov 2021 12:53:58 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1ABIrvk7026108;
	Thu, 11 Nov 2021 12:53:57 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 11 Nov 2021 12:53:45 -0600
Message-Id: <1636656832-26062-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1636656832-26062-1-git-send-email-bmarzins@redhat.com>
References: <1636656832-26062-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 2/9] libmultipath: use typedef for keyword
	handler function
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't keep writing out the function type.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/parser.c |  6 +++---
 libmultipath/parser.h | 15 ++++++---------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/libmultipath/parser.c b/libmultipath/parser.c
index 611054f7..ebe1cbd9 100644
--- a/libmultipath/parser.c
+++ b/libmultipath/parser.c
@@ -33,7 +33,7 @@ static int line_nr;
 
 int
 keyword_alloc(vector keywords, char *string,
-	      int (*handler) (struct config *, vector),
+	      handler_fn *handler,
 	      print_fn *print,
 	      int unique)
 {
@@ -72,7 +72,7 @@ install_sublevel_end(void)
 
 int
 _install_keyword(vector keywords, char *string,
-		 int (*handler) (struct config *, vector),
+		 handler_fn *handler,
 		 print_fn *print,
 		 int unique)
 {
@@ -558,7 +558,7 @@ process_stream(struct config *conf, FILE *stream, vector keywords,
 						goto out;
 				}
 				if (keyword->handler) {
-				    t = (*keyword->handler) (conf, strvec);
+				    t = keyword->handler(conf, strvec);
 					r += t;
 					if (t)
 						condlog(1, "multipath.conf +%d, parsing failed: %s",
diff --git a/libmultipath/parser.h b/libmultipath/parser.h
index b43d46f8..3452bde1 100644
--- a/libmultipath/parser.h
+++ b/libmultipath/parser.h
@@ -43,10 +43,11 @@ struct strbuf;
 
 /* keyword definition */
 typedef int print_fn(struct config *, struct strbuf *, const void *);
+typedef int handler_fn(struct config *, vector);
 
 struct keyword {
 	char *string;
-	int (*handler) (struct config *, vector);
+	handler_fn *handler;
 	print_fn *print;
 	vector sub;
 	int unique;
@@ -62,18 +63,14 @@ struct keyword {
 	for (i = 0; i < (k)->sub->allocated && ((p) = (k)->sub->slot[i]); i++)
 
 /* Prototypes */
-extern int keyword_alloc(vector keywords, char *string,
-			 int (*handler) (struct config *, vector),
-			 print_fn *print,
-			 int unique);
+extern int keyword_alloc(vector keywords, char *string, handler_fn *handler,
+			 print_fn *print, int unique);
 #define install_keyword_root(str, h) keyword_alloc(keywords, str, h, NULL, 1)
 extern void install_sublevel(void);
 extern void install_sublevel_end(void);
 
-extern int _install_keyword(vector keywords, char *string,
-			    int (*handler) (struct config *, vector),
-			    print_fn *print,
-			    int unique);
+extern int _install_keyword(vector keywords, char *string, handler_fn *handler,
+			    print_fn *print, int unique);
 #define install_keyword(str, vec, pri) _install_keyword(keywords, str, vec, pri, 1)
 #define install_keyword_multi(str, vec, pri) _install_keyword(keywords, str, vec, pri, 0)
 extern void dump_keywords(vector keydump, int level);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

