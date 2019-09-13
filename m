Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BAFB27E0
	for <lists+dm-devel@lfdr.de>; Sat, 14 Sep 2019 00:04:50 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5489D2D6A0B;
	Fri, 13 Sep 2019 22:04:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ECF0E6092D;
	Fri, 13 Sep 2019 22:04:46 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3E9A0180221D;
	Fri, 13 Sep 2019 22:04:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x8DM4HHd031677 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 13 Sep 2019 18:04:17 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7E89F45B1; Fri, 13 Sep 2019 22:04:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE4DF194BB;
	Fri, 13 Sep 2019 22:04:14 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id x8DM4DV3024038; 
	Fri, 13 Sep 2019 17:04:13 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id x8DM4CMq024037;
	Fri, 13 Sep 2019 17:04:12 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 13 Sep 2019 17:04:04 -0500
Message-Id: <1568412244-23982-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
References: <1568412244-23982-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/4] libmultipath: fix mpcontext initialization
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.29]); Fri, 13 Sep 2019 22:04:48 +0000 (UTC)

If a path is discovered before there is a multipath device for it to
belong to, the checker will not have its mpcontext initialized, even if
that path later belongs to a multipath device. A checker's mpcontext is
only set when the checker is selected, and is set to NULL if there is no
multipath device associated with the path. This only impacts the emc
checker. However, it makes the emc checker unable to determine if a
passive path is connected to an inactive snapshot or not.

This can be solved by adding a new checker class function, mp_init().
This is called when the checker is first initialized, and whenever the
checker is called, if the checker's mpcontext hasn't been initialized.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers.c              | 27 +++++++++++++++++++++++++--
 libmultipath/checkers.h              |  1 +
 libmultipath/checkers/emc_clariion.c |  7 +++++++
 libmultipath/discovery.c             |  2 ++
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/libmultipath/checkers.c b/libmultipath/checkers.c
index f4fdcae9..a08bf418 100644
--- a/libmultipath/checkers.c
+++ b/libmultipath/checkers.c
@@ -16,6 +16,7 @@ struct checker_class {
 	char name[CHECKER_NAME_LEN];
 	int (*check)(struct checker *);
 	int (*init)(struct checker *);       /* to allocate the context */
+	int (*mp_init)(struct checker *);    /* to allocate the mpcontext */
 	void (*free)(struct checker *);      /* to free the context */
 	const char **msgtable;
 	short msgtable_size;
@@ -140,6 +141,10 @@ static struct checker_class *add_checker_class(const char *multipath_dir,
 	if (!c->init)
 		goto out;
 
+	c->mp_init = (int (*)(struct checker *)) dlsym(c->handle, "libcheck_mp_init");
+	/* NULL mp_init is o.k. call dlerror() to clear out any error string */
+	dlerror();
+
 	c->free = (void (*)(struct checker *)) dlsym(c->handle, "libcheck_free");
 	errstr = dlerror();
 	if (errstr != NULL)
@@ -212,8 +217,26 @@ int checker_init (struct checker * c, void ** mpctxt_addr)
 	if (!c || !c->cls)
 		return 1;
 	c->mpcontext = mpctxt_addr;
-	if (c->cls->init)
-		return c->cls->init(c);
+	if (c->cls->init && c->cls->init(c) != 0)
+		return 1;
+	if (mpctxt_addr && *mpctxt_addr == NULL && c->cls->mp_init &&
+	    c->cls->mp_init(c) != 0) /* continue even if mp_init fails */
+		c->mpcontext = NULL;
+	return 0;
+}
+
+int checker_mp_init(struct checker * c, void ** mpctxt_addr)
+{
+	if (!c || !c->cls)
+		return 1;
+	if (c->mpcontext || !mpctxt_addr)
+		return 0;
+	c->mpcontext = mpctxt_addr;
+	if (*mpctxt_addr == NULL && c->cls->mp_init &&
+	    c->cls->mp_init(c) != 0) {
+		c->mpcontext = NULL;
+		return 1;
+	}
 	return 0;
 }
 
diff --git a/libmultipath/checkers.h b/libmultipath/checkers.h
index dab197f9..5237e7ec 100644
--- a/libmultipath/checkers.h
+++ b/libmultipath/checkers.h
@@ -138,6 +138,7 @@ const char *checker_state_name(int);
 int init_checkers(const char *);
 void cleanup_checkers (void);
 int checker_init (struct checker *, void **);
+int checker_mp_init(struct checker *, void **);
 void checker_clear (struct checker *);
 void checker_put (struct checker *);
 void checker_reset (struct checker *);
diff --git a/libmultipath/checkers/emc_clariion.c b/libmultipath/checkers/emc_clariion.c
index 6fc89113..5cd63aca 100644
--- a/libmultipath/checkers/emc_clariion.c
+++ b/libmultipath/checkers/emc_clariion.c
@@ -107,11 +107,18 @@ int libcheck_init (struct checker * c)
 		return 1;
 	((struct emc_clariion_checker_path_context *)c->context)->wwn_set = 0;
 
+	return 0;
+}
+
+int libcheck_mp_init (struct checker * c)
+{
 	/*
 	 * Allocate and initialize the multi-path global context.
 	 */
 	if (c->mpcontext && *c->mpcontext == NULL) {
 		void * mpctxt = malloc(sizeof(int));
+		if (!mpctxt)
+			return 1;
 		*c->mpcontext = mpctxt;
 		CLR_INACTIVE_SNAP(c);
 	}
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index acca466c..72f455e8 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1608,6 +1608,8 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
 			return PATH_UNCHECKED;
 		}
 	}
+	if (pp->mpp && !c->mpcontext)
+		checker_mp_init(c, &pp->mpp->mpcontext);
 	checker_clear_message(c);
 	if (daemon) {
 		if (conf->force_sync == 0)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
