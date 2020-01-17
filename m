Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 279FF1401D2
	for <lists+dm-devel@lfdr.de>; Fri, 17 Jan 2020 03:21:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579227671;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=qO/Fg4puZriSvo2aTSOE0UTtKzy9QOjr9h7w1AbK8Z8=;
	b=fuod+L1+SxRXfqzbMMVruqPbAdEcI75wiFc32XT6AbDadiaXCO0kiV+qYCjnTfRnxdKZA1
	O7DkUmypcbFRG7dTOdeoQ8yyfojQRk7BfWOfESP69zGaoQoLTkLG5gtWDauzgaAtw/u43x
	FF/ZFYTRmNPxTOlVIr6E8L6T2aC11gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-206-XeAIPKvEOSeKK4VCSbH7wQ-1; Thu, 16 Jan 2020 21:19:09 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6DD0018AAFB2;
	Fri, 17 Jan 2020 02:18:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DF01460FC2;
	Fri, 17 Jan 2020 02:18:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6B2BE8708A;
	Fri, 17 Jan 2020 02:18:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00H2IkMR030745 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 21:18:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 970199A84; Fri, 17 Jan 2020 02:18:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8DB37BA4B;
	Fri, 17 Jan 2020 02:18:45 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 00H2IiXY017289; 
	Thu, 16 Jan 2020 20:18:44 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 00H2Ihhn017288;
	Thu, 16 Jan 2020 20:18:43 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 16 Jan 2020 20:18:18 -0600
Message-Id: <1579227500-17196-14-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
References: <1579227500-17196-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 13/15] libmultipath: add new checker class
	functions
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: XeAIPKvEOSeKK4VCSbH7wQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This commit adds the optional functions libcheck_load, libcheck_unload,
and libcheck_reset. libcheck_load is called when a checker is first
loaded, libcheck_unload is called when it is unloaded, and
libcheck_reset is called during reconfigure, after all the current
paths have been removed. They are designed to setup, reset, and destroy
global state that all checkers of this class use. They will be used
in future commits.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers.c | 29 ++++++++++++++++++++++++++++-
 libmultipath/checkers.h |  1 +
 multipathd/main.c       |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index a08bf418..5c7d3004 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -18,6 +18,9 @@ struct checker_class {
 	int (*init)(struct checker *);       /* to allocate the context */
 	int (*mp_init)(struct checker *);    /* to allocate the mpcontext */
 	void (*free)(struct checker *);      /* to free the context */
+	int (*load)(void);                   /* to allocate global variables */
+	void (*unload)(void);                /* to free global variables */
+	int (*reset)(void);		     /* to reset the global variables */
 	const char **msgtable;
 	short msgtable_size;
 };
@@ -66,6 +69,8 @@ void free_checker_class(struct checker_class *c)
 	}
 	condlog(3, "unloading %s checker", c->name);
 	list_del(&c->node);
+	if (c->unload)
+		c->unload();
 	if (c->handle) {
 		if (dlclose(c->handle) != 0) {
 			condlog(0, "Cannot unload checker %s: %s",
@@ -98,6 +103,18 @@ static struct checker_class *checker_class_lookup(const char *name)
 	return NULL;
 }
 
+int reset_checker_classes(void)
+{
+	int ret = 0;
+	struct checker_class *c;
+
+	list_for_each_entry(c, &checkers, node) {
+		if (c->reset)
+			ret = ret? ret : c->reset();
+	}
+	return ret;
+}
+
 static struct checker_class *add_checker_class(const char *multipath_dir,
 					       const char *name)
 {
@@ -142,7 +159,11 @@ static struct checker_class *add_checker_class(const char *multipath_dir,
 		goto out;
 
 	c->mp_init = (int (*)(struct checker *)) dlsym(c->handle, "libcheck_mp_init");
-	/* NULL mp_init is o.k. call dlerror() to clear out any error string */
+	c->load = (int (*)(void)) dlsym(c->handle, "libcheck_load");
+	c->unload = (void (*)(void)) dlsym(c->handle, "libcheck_unload");
+	c->reset = (int (*)(void)) dlsym(c->handle, "libcheck_reset");
+	/* These 4 functions can be NULL. call dlerror() to clear out any
+	 * error string */
 	dlerror();
 
 	c->free = (void (*)(struct checker *)) dlsym(c->handle, "libcheck_free");
@@ -168,6 +189,12 @@ static struct checker_class *add_checker_class(const char *multipath_dir,
 	condlog(3, "checker %s: message table size = %d",
 		c->name, c->msgtable_size);
 
+	if (c->load && c->load() != 0) {
+		condlog(0, "%s: failed to load checker", c->name);
+		c->unload = NULL;
+		goto out;
+	}
+
 done:
 	c->sync = 1;
 	list_add(&c->node, &checkers);
diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
index 5237e7ec..d9930467 100644
--- a/libmultipath/checkers.h
+++ b/libmultipath/checkers.h
@@ -150,6 +150,7 @@ void checker_disable (struct checker *);
 int checker_check (struct checker *, int);
 int checker_is_sync(const struct checker *);
 const char *checker_name (const struct checker *);
+int reset_checker_classes(void);
 /*
  * This returns a string that's best prepended with "$NAME checker",
  * where $NAME is the return value of checker_name().
diff --git a/multipathd/main.c b/multipathd/main.c
index 9e01cfaa..8ee8a77d 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2607,6 +2607,7 @@ reconfigure (struct vectors * vecs)
 	vecs->pathvec = NULL;
 	delete_all_foreign();
 
+	reset_checker_classes();
 	/* Re-read any timezone changes */
 	tzset();
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

