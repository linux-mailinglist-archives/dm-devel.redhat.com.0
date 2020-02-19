Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 97598163D47
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:51:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095079;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+VUb42Wz/VlP19rk1Z3xKqsgfGiiAegDAfShJE025Uw=;
	b=YyDO1Xwh5b69yGO1iFzlBMdMsTdR4bskNcrxFPZyRQiMUdpnGZCEFPvvC2QZOHTDBpCbmI
	bsQsjoDJuwRkE+R0IJG218z0ZjZZ727Tc/aoutSrBpKYw+trilaiHqIjn7Fl41PXINMfSX
	o/BuxchPO27r0zUXPOcefOP5EHibG1g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-85-uXcVJbpbPjCj4oRHuclZAw-1; Wed, 19 Feb 2020 01:49:27 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E00A8018A1;
	Wed, 19 Feb 2020 06:49:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 350F45C13C;
	Wed, 19 Feb 2020 06:49:18 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B7BAD18089D0;
	Wed, 19 Feb 2020 06:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6n4o2015946 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:49:04 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0FA5590526; Wed, 19 Feb 2020 06:49:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E0DB190089;
	Wed, 19 Feb 2020 06:49:03 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6n22l009973; 
	Wed, 19 Feb 2020 00:49:02 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6n1k6009972;
	Wed, 19 Feb 2020 00:49:01 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:35 -0600
Message-Id: <1582094920-9883-14-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 13/18] libmultipath: add new checker class
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: uXcVJbpbPjCj4oRHuclZAw-1
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

Reviewed-by: Martin Wilck <mwilck@suse.com>
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
index e607acf3..8baf9abe 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2575,6 +2575,7 @@ reconfigure (struct vectors * vecs)
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

