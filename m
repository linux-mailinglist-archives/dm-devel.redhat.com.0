Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1B27B2A5E6F
	for <lists+dm-devel@lfdr.de>; Wed,  4 Nov 2020 07:59:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604473185;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NZJ+2baWnoHF7KvjtGm5gGss8HUPyg2afmkOaTw0Kmc=;
	b=Z0GxMLC77oDOsoI2WRZ7xnRvGuXH+mAi/XOEEd285V55/VWGdDAApIRPIFq6OIkYGZ3AA+
	9K9wtGKl1FZD9ae9q1w78yZYj75A/mGGtKFeIwzLNrV+TS8G5/V4cLs8/KOSstr0yNIrRQ
	4END/ksGiWAzFlQLWalyESWNRwyYC4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-r_YDNxUENLS1anlKaRfatw-1; Wed, 04 Nov 2020 01:59:42 -0500
X-MC-Unique: r_YDNxUENLS1anlKaRfatw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 473F664097;
	Wed,  4 Nov 2020 06:59:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 200DF10027AA;
	Wed,  4 Nov 2020 06:59:37 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A1CC81800FF5;
	Wed,  4 Nov 2020 06:59:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A46sLXR017347 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 01:54:21 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2ABA310589A0; Wed,  4 Nov 2020 06:54:21 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0602410027AA;
	Wed,  4 Nov 2020 06:54:20 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A46sIVT022484; 
	Wed, 4 Nov 2020 00:54:18 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A46sIOt022483;
	Wed, 4 Nov 2020 00:54:18 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  4 Nov 2020 00:54:09 -0600
Message-Id: <1604472849-22422-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
References: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/6] libmultipath: don't dlclose tur checker
	DSO
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The multipathd tur checker thread is designed to be able to finish at
any time, even after the tur checker itself has been freed. The
multipathd shutdown code makes sure all the checkers have been freed
before freeing the checker_class and calling dlclose() to unload the
DSO, but this doesn't guarantee that the checker threads have finished.
If one hasn't, the DSO will get unloaded while the thread still running
code from it, causing a segfault. Unfortunately, it's not possible to be
sure that all tur checker threads have ended during shutdown, without
making them joinable.

However, since libmultipath will never be reinitialized after it has
been uninitialzed, not dlclosing the tur checker DSO once a thread is
started has minimal cost (keeping the DSO code around until the program
exits, which usually happens right after freeing the checkers).

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers.c           | 10 +++++++++-
 libmultipath/checkers.h           |  1 +
 libmultipath/checkers/tur.c       |  1 +
 libmultipath/libmultipath.version |  5 +++++
 4 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index 18b1f5eb..35a17f8c 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -22,6 +22,7 @@ struct checker_class {
 	void (*reset)(void);		     /* to reset the global variables */
 	const char **msgtable;
 	short msgtable_size;
+	int keep_dso;
 };
 
 static const char *checker_state_names[PATH_MAX_STATE] = {
@@ -74,7 +75,7 @@ void free_checker_class(struct checker_class *c)
 	list_del(&c->node);
 	if (c->reset)
 		c->reset();
-	if (c->handle) {
+	if (c->handle && !c->keep_dso) {
 		if (dlclose(c->handle) != 0) {
 			condlog(0, "Cannot unload checker %s: %s",
 				c->name, dlerror());
@@ -197,6 +198,13 @@ out:
 	return NULL;
 }
 
+void checker_keep_dso(struct checker * c)
+{
+	if (!c || !c->cls)
+		return;
+	c->cls->keep_dso = 1;
+}
+
 void checker_set_fd (struct checker * c, int fd)
 {
 	if (!c)
diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
index 9d5f90b9..af5a4006 100644
--- a/libmultipath/checkers.h
+++ b/libmultipath/checkers.h
@@ -146,6 +146,7 @@ void checker_reset (struct checker *);
 void checker_set_sync (struct checker *);
 void checker_set_async (struct checker *);
 void checker_set_fd (struct checker *, int);
+void checker_keep_dso(struct checker *c);
 void checker_enable (struct checker *);
 void checker_disable (struct checker *);
 int checker_check (struct checker *, int);
diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
index e886fcf8..fd58d62a 100644
--- a/libmultipath/checkers/tur.c
+++ b/libmultipath/checkers/tur.c
@@ -394,6 +394,7 @@ int libcheck_check(struct checker * c)
 		uatomic_set(&ct->running, 1);
 		tur_set_async_timeout(c);
 		setup_thread_attr(&attr, 32 * 1024, 1);
+		checker_keep_dso(c);
 		r = pthread_create(&ct->thread, &attr, tur_thread, ct);
 		pthread_attr_destroy(&attr);
 		if (r) {
diff --git a/libmultipath/libmultipath.version b/libmultipath/libmultipath.version
index 2e3583f5..04eea300 100644
--- a/libmultipath/libmultipath.version
+++ b/libmultipath/libmultipath.version
@@ -270,3 +270,8 @@ global:
 	dm_prereq;
 	skip_libmp_dm_init;
 } LIBMULTIPATH_4.1.0;
+
+LIBMULTIPATH_4.3.0 {
+global:
+	checker_keep_dso;
+} LIBMULTIPATH_4.2.0;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

