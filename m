Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF89163D4D
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:55:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095306;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eoBfkoQVukejLiFpA62pOxCDfv2Ib7Gapm0/BX2qRQk=;
	b=WMmQ6xagyhK14YNOL8J8OSJdxmpyIY5US8ZMBpxIbpqIV5dWuUK9LkdhRtYyYiYjTzgFui
	/R1148IepR8IF/SKNwV4elQKQm6JOxgMlyq+8bk9N9+LLMy5yknwPe650k7zWv4Q+bwMHE
	RR5AhfYPb0+Bc93lcjCzzyh192Yk/MA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-YEXKKrOgO3ucol-tRqH4-A-1; Wed, 19 Feb 2020 01:55:00 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DB2DF13F8;
	Wed, 19 Feb 2020 06:54:54 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AE22E60C84;
	Wed, 19 Feb 2020 06:54:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 46E661803C40;
	Wed, 19 Feb 2020 06:54:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6sj1h016824 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:54:45 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5149519757; Wed, 19 Feb 2020 06:54:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C667919756;
	Wed, 19 Feb 2020 06:54:42 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6sfiU010337; 
	Wed, 19 Feb 2020 00:54:41 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6sfNB010336;
	Wed, 19 Feb 2020 00:54:41 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:54:33 -0600
Message-Id: <1582095273-10279-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 5/5] libmultipath: cleanup old issues with
	directio checker
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
X-MC-Unique: YEXKKrOgO3ucol-tRqH4-A-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The directio checker manually aligns its directio buffer, instead of
using posix_memalign(). It also defaults the block size for the read to
512, which may be too small for 4k devices, and it only waits for 5 ns
for IO completion before giving up and setting the path to pending,
which means that in will virtually always set the path to pending on the
check when the IO is issued.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/directio.c | 13 ++++---------
 tests/directio.c                 |  1 -
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
index 649961a4..503519e2 100644
--- a/libmultipath/checkers/directio.c
+++ b/libmultipath/checkers/directio.c
@@ -38,7 +38,6 @@ struct async_req {
 	struct iocb io;
 	unsigned int blksize;
 	unsigned char *	buf;
-	unsigned char * ptr;
 	struct list_head node;
 	int state; /* PATH_REMOVED means this is an orphan */
 };
@@ -174,7 +173,7 @@ int libcheck_init (struct checker * c)
 
 	if (ioctl(c->fd, BLKBSZGET, &req->blksize) < 0) {
 		c->msgid = MSG_DIRECTIO_BLOCKSIZE;
-		req->blksize = 512;
+		req->blksize = 4096;
 	}
 	if (req->blksize > 4096) {
 		/*
@@ -185,8 +184,7 @@ int libcheck_init (struct checker * c)
 	if (!req->blksize)
 		goto out;
 
-	req->buf = (unsigned char *)malloc(req->blksize + pgsize);
-	if (!req->buf)
+	if (posix_memalign((void **)&req->buf, pgsize, req->blksize) != 0)
 		goto out;
 
 	flags = fcntl(c->fd, F_GETFL);
@@ -199,9 +197,6 @@ int libcheck_init (struct checker * c)
 		ct->reset_flags = 1;
 	}
 
-	req->ptr = (unsigned char *) (((unsigned long)req->buf + pgsize - 1) &
-		  (~(pgsize - 1)));
-
 	/* Successfully initialized, return the context. */
 	ct->req = req;
 	c->context = (void *) ct;
@@ -298,7 +293,7 @@ get_events(struct aio_group *aio_grp, struct timespec *timeout)
 static int
 check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 {
-	struct timespec	timeout = { .tv_nsec = 5 };
+	struct timespec	timeout = { .tv_nsec = 1000 };
 	struct stat	sb;
 	int		rc;
 	long		r;
@@ -323,7 +318,7 @@ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 
 		LOG(3, "starting new request");
 		memset(&ct->req->io, 0, sizeof(struct iocb));
-		io_prep_pread(&ct->req->io, fd, ct->req->ptr,
+		io_prep_pread(&ct->req->io, fd, ct->req->buf,
 			      ct->req->blksize, 0);
 		ct->req->state = PATH_PENDING;
 		if (io_submit(ct->aio_grp->ioctx, 1, ios) != 1) {
diff --git a/tests/directio.c b/tests/directio.c
index 23fd2da9..3cd7a520 100644
--- a/tests/directio.c
+++ b/tests/directio.c
@@ -23,7 +23,6 @@
 #include <stddef.h>
 #include <setjmp.h>
 #include <stdlib.h>
-#define UNIT_TESTING /* enable memory testing in directio.c */
 #include <cmocka.h>
 #include "globals.c"
 #include "../libmultipath/checkers/directio.c"
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

