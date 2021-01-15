Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 5D7DD2F707B
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jan 2021 03:21:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610677266;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dJUi8OxVmaE2n9AuOu52dNsMXpUO2bYmylrLlNbQ6V4=;
	b=XC14GwFHwgD8MjS4eCREn1H/g3gLx8pcfUojpZPW3DIgu76rSfV49/+ju2Cwo/MvwFUqIO
	CTzdkh21yLUXnRMyaxObM/Kqe49xh4rq4smI3I6rFUh/TT2gHfK9m44OUqvG0nvOJqzpG5
	V5igvv6WN65z23TMpn4wQlM3wzM/mg4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-Y0U1eIcsOVWxRDBeTIdqqg-1; Thu, 14 Jan 2021 21:21:03 -0500
X-MC-Unique: Y0U1eIcsOVWxRDBeTIdqqg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A27E21005D74;
	Fri, 15 Jan 2021 02:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C6E25D9F4;
	Fri, 15 Jan 2021 02:20:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 826FB180954D;
	Fri, 15 Jan 2021 02:20:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10F2Kak3030997 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 21:20:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 85D4071D52; Fri, 15 Jan 2021 02:20:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6E49A71C87;
	Fri, 15 Jan 2021 02:20:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10F2KXvB023608; 
	Thu, 14 Jan 2021 20:20:33 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10F2KWNP023607;
	Thu, 14 Jan 2021 20:20:32 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 14 Jan 2021 20:20:26 -0600
Message-Id: <1610677227-23550-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
References: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 5/6] multipathd: combine free_io_err_stat_path
	and destroy_directio_ctx
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

destroy_directio_ctx() is only called from free_io_err_stat_path(), and
free_io_err_stat_path() is very short, so combine them.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/io_err_stat.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 92871f40..bf78a236 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -161,12 +161,15 @@ fail_close:
 	return 1;
 }
 
-static void destroy_directio_ctx(struct io_err_stat_path *p)
+static void free_io_err_stat_path(struct io_err_stat_path *p)
 {
 	int i;
 
-	if (!p || !p->dio_ctx_array)
+	if (!p)
 		return;
+	if (!p->dio_ctx_array)
+		goto free_path;
+
 	cancel_inflight_io(p);
 
 	for (i = 0; i < CONCUR_NR_EVENT; i++)
@@ -175,6 +178,8 @@ static void destroy_directio_ctx(struct io_err_stat_path *p)
 
 	if (p->fd > 0)
 		close(p->fd);
+free_path:
+	FREE(p);
 }
 
 static struct io_err_stat_path *alloc_io_err_stat_path(void)
@@ -197,11 +202,6 @@ static struct io_err_stat_path *alloc_io_err_stat_path(void)
 	return p;
 }
 
-static void free_io_err_stat_path(struct io_err_stat_path *p)
-{
-	FREE(p);
-}
-
 static void free_io_err_pathvec(void)
 {
 	struct io_err_stat_path *path;
@@ -211,10 +211,8 @@ static void free_io_err_pathvec(void)
 	pthread_cleanup_push(cleanup_mutex, &io_err_pathvec_lock);
 	if (!io_err_pathvec)
 		goto out;
-	vector_foreach_slot(io_err_pathvec, path, i) {
-		destroy_directio_ctx(path);
+	vector_foreach_slot(io_err_pathvec, path, i)
 		free_io_err_stat_path(path);
-	}
 	vector_free(io_err_pathvec);
 	io_err_pathvec = NULL;
 out:
@@ -250,7 +248,7 @@ static int enqueue_io_err_stat_by_path(struct path *path)
 		goto free_ioerr_path;
 	pthread_mutex_lock(&io_err_pathvec_lock);
 	if (!vector_alloc_slot(io_err_pathvec))
-		goto unlock_destroy;
+		goto unlock_pathvec;
 	vector_set_slot(io_err_pathvec, p);
 	pthread_mutex_unlock(&io_err_pathvec_lock);
 
@@ -258,9 +256,8 @@ static int enqueue_io_err_stat_by_path(struct path *path)
 			path->mpp->alias, path->dev);
 	return 0;
 
-unlock_destroy:
+unlock_pathvec:
 	pthread_mutex_unlock(&io_err_pathvec_lock);
-	destroy_directio_ctx(p);
 free_ioerr_path:
 	free_io_err_stat_path(p);
 
@@ -637,7 +634,6 @@ static void service_paths(void)
 	vector_foreach_slot_backwards(tmp_pathvec, pp, i) {
 		end_io_err_stat(pp);
 		vector_del_slot(tmp_pathvec, i);
-		destroy_directio_ctx(pp);
 		free_io_err_stat_path(pp);
 	}
 	vector_reset(tmp_pathvec);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

