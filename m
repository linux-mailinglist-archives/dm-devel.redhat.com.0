Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 566D1153896
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 20:00:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929230;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Hjprga6LysN8BLV96sdwqazizBPNenSQh5haz5qoprk=;
	b=hBFt9jsOKxLK09xgOM3+RUO6P3REtiNb3RnzfGBFVqR69qmL6+7kQDHISrkF3m+yF7dqFu
	4a+rZvWz6b9dEA9+eOZDfEhAeQR/iAKiYoYCMwu41Xy2mAueFUdNTa59WGfSRwDolVgp+u
	uJaRpvDpYn9aQkZYf8Dc7ICRmZ8N170=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-Q3fCbFXnN_iQADr6uNCfwg-1; Wed, 05 Feb 2020 13:59:00 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530D0801A1E;
	Wed,  5 Feb 2020 18:58:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E185C554;
	Wed,  5 Feb 2020 18:58:53 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD8BC866A5;
	Wed,  5 Feb 2020 18:58:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwdoW019499 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:39 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7EC45790DD; Wed,  5 Feb 2020 18:58:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A651790C4;
	Wed,  5 Feb 2020 18:58:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwcKa000330; 
	Wed, 5 Feb 2020 12:58:38 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwbQ5000317;
	Wed, 5 Feb 2020 12:58:37 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:17 -0600
Message-Id: <1580929100-32572-15-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 14/17] libmultipath: add new checker class
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: Q3fCbFXnN_iQADr6uNCfwg-1
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

