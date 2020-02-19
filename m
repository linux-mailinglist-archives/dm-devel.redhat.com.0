Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 84B3B164FC0
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 21:23:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582143786;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=VTh81z+ksbJv48uEkR5Sj8DJrOj5O2DcffL2YmY9LOo=;
	b=B4jRIdl2SJ9zdAbe3mzYeBctJh0sIiqOr6v7ipBO7nxOnTTj+9/jifq49hER0v8TzLYyOs
	MRmONOpvV/hKiEmksuyDgWwvhXW3wSWjUvawdqIT3g4kkhRQX7ks3OFRzqbnwwmlJsPfMr
	/1T8Vgp381p0E7LlnAlgfT3NfgOpzJg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-NRKpnawUMnewZmN79dWWyQ-1; Wed, 19 Feb 2020 15:22:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B6A3213FF;
	Wed, 19 Feb 2020 20:22:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 811A419756;
	Wed, 19 Feb 2020 20:22:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F1BAC18089CE;
	Wed, 19 Feb 2020 20:22:14 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01JKLsca031261 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 15:21:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3EF5719C4F; Wed, 19 Feb 2020 20:21:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8922F19756;
	Wed, 19 Feb 2020 20:21:51 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01JKLod9020938; 
	Wed, 19 Feb 2020 14:21:50 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01JKLnA2020937;
	Wed, 19 Feb 2020 14:21:49 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 14:21:43 -0600
Message-Id: <1582143705-20886-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582143705-20886-1-git-send-email-bmarzins@redhat.com>
References: <1582143705-20886-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/5] libmultipath: change loading and
	resetting in directio
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: NRKpnawUMnewZmN79dWWyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The directio checker previously made sure to always keep an aio_group
around after loading or resetting the checker. There is no need to do
this, and removing this code simplifies the checker.  With this change,
there is no longer a need for a load or unload checker function, only a
reset function which is run when the checker is reset or unloaded.
Changing this broke a number of tests, so the unit tests have been
updated as well.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers.c          |  26 ++---
 libmultipath/checkers.h          |   2 +-
 libmultipath/checkers/directio.c |  43 +-------
 tests/directio.c                 | 177 +++++++++++++------------------
 4 files changed, 81 insertions(+), 167 deletions(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index 5c7d3004..8d2be8a9 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -18,9 +18,7 @@ struct checker_class {
 	int (*init)(struct checker *);       /* to allocate the context */
 	int (*mp_init)(struct checker *);    /* to allocate the mpcontext */
 	void (*free)(struct checker *);      /* to free the context */
-	int (*load)(void);                   /* to allocate global variables */
-	void (*unload)(void);                /* to free global variables */
-	int (*reset)(void);		     /* to reset the global variables */
+	void (*reset)(void);		     /* to reset the global variables */
 	const char **msgtable;
 	short msgtable_size;
 };
@@ -69,8 +67,8 @@ void free_checker_class(struct checker_class *c)
 	}
 	condlog(3, "unloading %s checker", c->name);
 	list_del(&c->node);
-	if (c->unload)
-		c->unload();
+	if (c->reset)
+		c->reset();
 	if (c->handle) {
 		if (dlclose(c->handle) != 0) {
 			condlog(0, "Cannot unload checker %s: %s",
@@ -103,16 +101,14 @@ static struct checker_class *checker_class_lookup(const char *name)
 	return NULL;
 }
 
-int reset_checker_classes(void)
+void reset_checker_classes(void)
 {
-	int ret = 0;
 	struct checker_class *c;
 
 	list_for_each_entry(c, &checkers, node) {
 		if (c->reset)
-			ret = ret? ret : c->reset();
+			c->reset();
 	}
-	return ret;
 }
 
 static struct checker_class *add_checker_class(const char *multipath_dir,
@@ -159,10 +155,8 @@ static struct checker_class *add_checker_class(const char *multipath_dir,
 		goto out;
 
 	c->mp_init = (int (*)(struct checker *)) dlsym(c->handle, "libcheck_mp_init");
-	c->load = (int (*)(void)) dlsym(c->handle, "libcheck_load");
-	c->unload = (void (*)(void)) dlsym(c->handle, "libcheck_unload");
-	c->reset = (int (*)(void)) dlsym(c->handle, "libcheck_reset");
-	/* These 4 functions can be NULL. call dlerror() to clear out any
+	c->reset = (void (*)(void)) dlsym(c->handle, "libcheck_reset");
+	/* These 2 functions can be NULL. call dlerror() to clear out any
 	 * error string */
 	dlerror();
 
@@ -189,12 +183,6 @@ static struct checker_class *add_checker_class(const char *multipath_dir,
 	condlog(3, "checker %s: message table size = %d",
 		c->name, c->msgtable_size);
 
-	if (c->load && c->load() != 0) {
-		condlog(0, "%s: failed to load checker", c->name);
-		c->unload = NULL;
-		goto out;
-	}
-
 done:
 	c->sync = 1;
 	list_add(&c->node, &checkers);
diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
index d9930467..b458118d 100644
--- a/libmultipath/checkers.h
+++ b/libmultipath/checkers.h
@@ -150,7 +150,7 @@ void checker_disable (struct checker *);
 int checker_check (struct checker *, int);
 int checker_is_sync(const struct checker *);
 const char *checker_name (const struct checker *);
-int reset_checker_classes(void);
+void reset_checker_classes(void);
 /*
  * This returns a string that's best prepended with "$NAME checker",
  * where $NAME is the return value of checker_name().
diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
index 813e61e2..6ad7c885 100644
--- a/libmultipath/checkers/directio.c
+++ b/libmultipath/checkers/directio.c
@@ -138,23 +138,11 @@ check_orphaned_group(struct aio_group *aio_grp)
 		return;
 	list_for_each(item, &aio_grp->orphans)
 		count++;
-	if (count >= AIO_GROUP_SIZE) {
+	if (count >= AIO_GROUP_SIZE)
 		remove_aio_group(aio_grp);
-		if (list_empty(&aio_grp_list))
-			add_aio_group();
-	}
 }
 
-int libcheck_load (void)
-{
-	if (add_aio_group() == NULL) {
-		LOG(1, "libcheck_load failed: %s", strerror(errno));
-		return 1;
-	}
-	return 0;
-}
-
-void libcheck_unload (void)
+void libcheck_reset (void)
 {
 	struct aio_group *aio_grp, *tmp;
 
@@ -162,33 +150,6 @@ void libcheck_unload (void)
 		remove_aio_group(aio_grp);
 }
 
-int libcheck_reset (void)
-{
-	struct aio_group *aio_grp, *tmp, *reset_grp = NULL;
-
-	/* If a clean existing aio_group exists, use that. Otherwise add a
-	 * new one */
-	list_for_each_entry(aio_grp, &aio_grp_list, node) {
-		if (aio_grp->holders == 0 &&
-		    list_empty(&aio_grp->orphans)) {
-			reset_grp = aio_grp;
-			break;
-		}
-	}
-	if (!reset_grp)
-		reset_grp = add_aio_group();
-	if (!reset_grp) {
-		LOG(1, "checker reset failed");
-		return 1;
-	}
-
-	list_for_each_entry_safe(aio_grp, tmp, &aio_grp_list, node) {
-		if (aio_grp != reset_grp)
-			remove_aio_group(aio_grp);
-	}
-	return 0;
-}
-
 int libcheck_init (struct checker * c)
 {
 	unsigned long pgsize = getpagesize();
diff --git a/tests/directio.c b/tests/directio.c
index 236c514b..23fd2da9 100644
--- a/tests/directio.c
+++ b/tests/directio.c
@@ -217,7 +217,7 @@ void do_check_state(struct checker *c, int sync, int timeout, int chk_state)
 	memset(mock_events, 0, sizeof(mock_events));
 }
 
-void do_libcheck_unload(int nr_aio_grps)
+void do_libcheck_reset(int nr_aio_grps)
 {
 	int count = 0;
 	struct aio_group *aio_grp;
@@ -227,7 +227,7 @@ void do_libcheck_unload(int nr_aio_grps)
 	assert_int_equal(count, nr_aio_grps);
 	for (count = 0; count < nr_aio_grps; count++)
 		will_return(__wrap_io_destroy, 0);
-	libcheck_unload();
+	libcheck_reset();
 	assert_true(list_empty(&aio_grp_list));
 	assert_int_equal(ioctx_count, 0);
 }
@@ -278,31 +278,38 @@ static void check_aio_grp(struct aio_group *aio_grp, int holders,
 	assert_int_equal(orphans, count);
 }
 
-static void do_libcheck_load(void)
+/* simple resetting test */
+static void test_reset(void **state)
 {
-	int count = 0;
-	struct aio_group *aio_grp;
-
 	assert_true(list_empty(&aio_grp_list));
-	will_return(__wrap_io_setup, 0);
-	assert_int_equal(libcheck_load(), 0);
-	list_for_each_entry(aio_grp, &aio_grp_list, node) {
-		assert_int_equal(aio_grp->holders, 0);
-		count++;
-	}
-	assert_int_equal(count, 1);
+	do_libcheck_reset(0);
 }
 
-/* simple loading resetting and unloading test */
-static void test_load_reset_unload(void **state)
+/* tests initializing, then resetting, and then initializing again */
+static void test_init_reset_init(void **state)
 {
-	struct list_head *item;
-	do_libcheck_load();
-	item = aio_grp_list.next;
-	assert_int_equal(libcheck_reset(), 0);
-	assert_false(list_empty(&aio_grp_list));
-	assert_true(item == aio_grp_list.next);
-	do_libcheck_unload(1);
+	struct checker c = {0};
+	struct aio_group *aio_grp, *tmp_grp;
+
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
+	do_libcheck_init(&c, 4096, NULL);
+	aio_grp = get_aio_grp(&c);
+	check_aio_grp(aio_grp, 1, 0);
+	list_for_each_entry(tmp_grp, &aio_grp_list, node)
+		assert_ptr_equal(aio_grp, tmp_grp);
+	libcheck_free(&c);
+	check_aio_grp(aio_grp, 0, 0);
+	do_libcheck_reset(1);
+	will_return(__wrap_io_setup, 0);
+	do_libcheck_init(&c, 4096, NULL);
+	aio_grp = get_aio_grp(&c);
+	check_aio_grp(aio_grp, 1, 0);
+	list_for_each_entry(tmp_grp, &aio_grp_list, node)
+		assert_ptr_equal(aio_grp, tmp_grp);
+	libcheck_free(&c);
+	check_aio_grp(aio_grp, 0, 0);
+	do_libcheck_reset(1);
 }
 
 /* test initializing and then freeing 4096 checkers */
@@ -312,8 +319,8 @@ static void test_init_free(void **state)
 	struct checker c[4096] = {0};
 	struct aio_group *aio_grp;
 
-	do_libcheck_load();
-	aio_grp = list_entry(aio_grp_list.next, typeof(*aio_grp), node);
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
@@ -328,7 +335,7 @@ static void test_init_free(void **state)
 			do_libcheck_init(&c[i], 4096, NULL);
 		ct = (struct directio_context *)c[i].context;
 		assert_non_null(ct->aio_grp);
-		if (i && (i & 1023) == 0)
+		if ((i & 1023) == 0)
 			aio_grp = ct->aio_grp;
 		else {
 			assert_ptr_equal(ct->aio_grp, aio_grp);
@@ -346,17 +353,9 @@ static void test_init_free(void **state)
 		libcheck_free(&c[i]);
 		assert_int_equal(aio_grp->holders, 1023 - (i & 1023));
 	}
-	count = 0;
-	list_for_each_entry(aio_grp, &aio_grp_list, node) {
+	list_for_each_entry(aio_grp, &aio_grp_list, node)
 		assert_int_equal(aio_grp->holders, 0);
-		count++;
-	}
-	assert_int_equal(count, 4);
-	will_return(__wrap_io_destroy, 0);
-	will_return(__wrap_io_destroy, 0);
-	will_return(__wrap_io_destroy, 0);
-	assert_int_equal(libcheck_reset(), 0);
-	do_libcheck_unload(1);
+	do_libcheck_reset(4);
 }
 
 /* check mixed initializing and freeing 4096 checkers */
@@ -366,7 +365,8 @@ static void test_multi_init_free(void **state)
 	struct checker c[4096] = {0};
 	struct aio_group *aio_grp;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
 	will_return(__wrap_io_setup, 0);
@@ -396,7 +396,7 @@ static void test_multi_init_free(void **state)
 			i++;
 		}
 	}
-	do_libcheck_unload(4);
+	do_libcheck_reset(4);
 }
 
 /* simple single checker sync test */
@@ -406,12 +406,13 @@ static void test_check_state_simple(void **state)
 	struct async_req *req;
 	int res = 0;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	do_libcheck_init(&c, 4096, &req);
 	return_io_getevents_nr(NULL, 1, &req, &res);
 	do_check_state(&c, 1, 30, PATH_UP);
 	libcheck_free(&c);
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test sync timeout */
@@ -420,7 +421,8 @@ static void test_check_state_timeout(void **state)
 	struct checker c = {0};
 	struct aio_group *aio_grp;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	do_libcheck_init(&c, 4096, NULL);
 	aio_grp = get_aio_grp(&c);
 	return_io_getevents_none();
@@ -433,7 +435,7 @@ static void test_check_state_timeout(void **state)
 	will_return(__wrap_io_cancel, 0);
 #endif
 	libcheck_free(&c);
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test async timeout */
@@ -442,7 +444,8 @@ static void test_check_state_async_timeout(void **state)
 	struct checker c = {0};
 	struct aio_group *aio_grp;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	do_libcheck_init(&c, 4096, NULL);
 	aio_grp = get_aio_grp(&c);
 	return_io_getevents_none();
@@ -459,7 +462,7 @@ static void test_check_state_async_timeout(void **state)
 	will_return(__wrap_io_cancel, 0);
 #endif
 	libcheck_free(&c);
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test freeing checkers with outstanding requests */
@@ -470,7 +473,8 @@ static void test_free_with_pending(void **state)
 	struct async_req *req;
 	int res = 0;
 
-        do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
         do_libcheck_init(&c[0], 4096, &req);
 	do_libcheck_init(&c[1], 4096, NULL);
         aio_grp = get_aio_grp(c);
@@ -491,7 +495,7 @@ static void test_free_with_pending(void **state)
 #else
         check_aio_grp(aio_grp, 0, 0);
 #endif
-        do_libcheck_unload(1);
+        do_libcheck_reset(1);
 }
 
 /* test removing orpahed aio_group on free */
@@ -501,7 +505,8 @@ static void test_orphaned_aio_group(void **state)
 	struct aio_group *aio_grp, *tmp_grp;
 	int i;
 
-        do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < AIO_GROUP_SIZE; i++) {
 		do_libcheck_init(&c[i], 4096, NULL);
 		return_io_getevents_none();
@@ -519,17 +524,10 @@ static void test_orphaned_aio_group(void **state)
 		if (i == AIO_GROUP_SIZE - 1) {
 			/* remove the orphaned group and create a new one */
 			will_return(__wrap_io_destroy, 0);
-			will_return(__wrap_io_setup, 0);
 		}
 		libcheck_free(&c[i]);
 	}
-	i = 0;
-	list_for_each_entry(tmp_grp, &aio_grp_list, node) {
-		i++;
-		check_aio_grp(aio_grp, 0, 0);
-	}
-	assert_int_equal(i, 1);
-        do_libcheck_unload(1);
+        do_libcheck_reset(0);
 }
 
 /* test sync timeout with failed cancel and cleanup by another
@@ -542,7 +540,8 @@ static void test_timeout_cancel_failed(void **state)
 	int res[] = {0,0};
 	int i;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < 2; i++)
 		do_libcheck_init(&c[i], 4096, &reqs[i]);
 	aio_grp = get_aio_grp(c);
@@ -563,7 +562,7 @@ static void test_timeout_cancel_failed(void **state)
 		assert_false(is_checker_running(&c[i]));
 		libcheck_free(&c[i]);
 	}
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test async timeout with failed cancel and cleanup by another
@@ -575,7 +574,8 @@ static void test_async_timeout_cancel_failed(void **state)
 	int res[] = {0,0};
 	int i;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < 2; i++)
 		do_libcheck_init(&c[i], 4096, &reqs[i]);
 	return_io_getevents_none();
@@ -605,7 +605,7 @@ static void test_async_timeout_cancel_failed(void **state)
 		assert_false(is_checker_running(&c[i]));
 		libcheck_free(&c[i]);
 	}
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test orphaning a request, and having another checker clean it up */
@@ -617,7 +617,8 @@ static void test_orphan_checker_cleanup(void **state)
 	struct aio_group *aio_grp;
 	int i;
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < 2; i++)
 		do_libcheck_init(&c[i], 4096, &reqs[i]);
 	aio_grp = get_aio_grp(c);
@@ -632,7 +633,7 @@ static void test_orphan_checker_cleanup(void **state)
 	check_aio_grp(aio_grp, 1, 0);
 	libcheck_free(&c[1]);
 	check_aio_grp(aio_grp, 0, 0);
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test orphaning a request, and having reset clean it up */
@@ -642,46 +643,8 @@ static void test_orphan_reset_cleanup(void **state)
 	struct aio_group *orphan_aio_grp, *tmp_aio_grp;
 	int found, count;
 
-	do_libcheck_load();
-	do_libcheck_init(&c, 4096, NULL);
-	orphan_aio_grp = get_aio_grp(&c);
-	return_io_getevents_none();
-	do_check_state(&c, 0, 30, PATH_PENDING);
-	will_return(__wrap_io_cancel, -1);
-	check_aio_grp(orphan_aio_grp, 1, 0);
-	libcheck_free(&c);
-	check_aio_grp(orphan_aio_grp, 1, 1);
-	found = count = 0;
-	list_for_each_entry(tmp_aio_grp, &aio_grp_list, node) {
-		count++;
-		if (tmp_aio_grp == orphan_aio_grp)
-			found = 1;
-	}
-	assert_int_equal(count, 1);
-	assert_int_equal(found, 1);
+	assert_true(list_empty(&aio_grp_list));
 	will_return(__wrap_io_setup, 0);
-	will_return(__wrap_io_destroy, 0);
-	assert_int_equal(libcheck_reset(), 0);
-	found = count = 0;
-	list_for_each_entry(tmp_aio_grp, &aio_grp_list, node) {
-		count++;
-		check_aio_grp(tmp_aio_grp, 0, 0);
-		if (tmp_aio_grp == orphan_aio_grp)
-			found = 1;
-	}
-	assert_int_equal(count, 1);
-	assert_int_equal(found, 0);
-	do_libcheck_unload(1);
-}
-
-/* test orphaning a request, and having unload clean it up */
-static void test_orphan_unload_cleanup(void **state)
-{
-	struct checker c;
-	struct aio_group *orphan_aio_grp, *tmp_aio_grp;
-	int found, count;
-
-	do_libcheck_load();
 	do_libcheck_init(&c, 4096, NULL);
 	orphan_aio_grp = get_aio_grp(&c);
 	return_io_getevents_none();
@@ -698,7 +661,7 @@ static void test_orphan_unload_cleanup(void **state)
 	}
 	assert_int_equal(count, 1);
 	assert_int_equal(found, 1);
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test checkers with different blocksizes */
@@ -716,7 +679,8 @@ static void test_check_state_blksize(void **state)
 	int chk_state[] = {PATH_UP, PATH_DOWN, PATH_UP};
 #endif
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < 3; i++)
 		do_libcheck_init(&c[i], blksize[i], &reqs[i]);
 	for (i = 0; i < 3; i++) {
@@ -727,7 +691,7 @@ static void test_check_state_blksize(void **state)
 		assert_false(is_checker_running(&c[i]));
 		libcheck_free(&c[i]);
 	}
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 /* test async checkers pending and getting resovled by another checker
@@ -739,7 +703,8 @@ static void test_check_state_async(void **state)
 	struct async_req *reqs[257];
 	int res[257] = {0};
 
-	do_libcheck_load();
+	assert_true(list_empty(&aio_grp_list));
+	will_return(__wrap_io_setup, 0);
 	for (i = 0; i < 257; i++)
 		do_libcheck_init(&c[i], 4096, &reqs[i]);
 	for (i = 0; i < 256; i++) {
@@ -757,7 +722,7 @@ static void test_check_state_async(void **state)
 		assert_false(is_checker_running(&c[i]));
 		libcheck_free(&c[i]);
 	}
-	do_libcheck_unload(1);
+	do_libcheck_reset(1);
 }
 
 static int setup(void **state)
@@ -782,7 +747,8 @@ static int teardown(void **state)
 int test_directio(void)
 {
 	const struct CMUnitTest tests[] = {
-		cmocka_unit_test(test_load_reset_unload),
+		cmocka_unit_test(test_reset),
+		cmocka_unit_test(test_init_reset_init),
 		cmocka_unit_test(test_init_free),
 		cmocka_unit_test(test_multi_init_free),
 		cmocka_unit_test(test_check_state_simple),
@@ -793,7 +759,6 @@ int test_directio(void)
 		cmocka_unit_test(test_async_timeout_cancel_failed),
 		cmocka_unit_test(test_orphan_checker_cleanup),
 		cmocka_unit_test(test_orphan_reset_cleanup),
-		cmocka_unit_test(test_orphan_unload_cleanup),
 		cmocka_unit_test(test_check_state_blksize),
 		cmocka_unit_test(test_check_state_async),
 		cmocka_unit_test(test_orphaned_aio_group),
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

