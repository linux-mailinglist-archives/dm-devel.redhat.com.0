Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8A637153884
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:58:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929125;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=GJsEqj0gIf3eqSGYrZiE9AHS77WbLQMxat+Fqd6QXCM=;
	b=ZD09UuxDkn1I4QW99p0dCYYVXc5LsNSi4ukceQ7ug5cG+sUJO91MrGm+oN05R7/09hr3l/
	Komo8fQkVFVn5WGrjZ+dOH1VNLZtkrV8AR6I8Y9A47IBE8dID24IfXdnlQsWRwdnX8CZRu
	ks9LbjRCV5qdIgadaIqaSlg0d2tUWi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-BZdM2-mOOvmbIfbcLuXhpw-1; Wed, 05 Feb 2020 13:58:42 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C8B9C107B103;
	Wed,  5 Feb 2020 18:58:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34658859C5;
	Wed,  5 Feb 2020 18:58:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40A4385CEE;
	Wed,  5 Feb 2020 18:58:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwR3A019380 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:27 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 657BD5C28C; Wed,  5 Feb 2020 18:58:27 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D7B925C1B2;
	Wed,  5 Feb 2020 18:58:24 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwNwV032620; 
	Wed, 5 Feb 2020 12:58:23 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwNnb032619;
	Wed, 5 Feb 2020 12:58:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:05 -0600
Message-Id: <1580929100-32572-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 02/17] multipathd: staticify uxlsnr
	variables/functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: BZdM2-mOOvmbIfbcLuXhpw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/uxlsnr.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/multipathd/uxlsnr.c b/multipathd/uxlsnr.c
index 020d7a9b..1c5ce9d2 100644
--- a/multipathd/uxlsnr.c
+++ b/multipathd/uxlsnr.c
@@ -40,7 +40,7 @@
 #include "cli.h"
 #include "uxlsnr.h"
 
-struct timespec sleep_time = {5, 0};
+static struct timespec sleep_time = {5, 0};
 
 struct client {
 	struct list_head node;
@@ -49,9 +49,9 @@ struct client {
 
 #define MIN_POLLS 1023
 
-LIST_HEAD(clients);
-pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
-struct pollfd *polls;
+static LIST_HEAD(clients);
+static pthread_mutex_t client_lock = PTHREAD_MUTEX_INITIALIZER;
+static struct pollfd *polls;
 static int notify_fd = -1;
 static char *watch_config_dir;
 
@@ -122,13 +122,13 @@ static void dead_client(struct client *c)
 	pthread_cleanup_pop(1);
 }
 
-void free_polls (void)
+static void free_polls (void)
 {
 	if (polls)
 		FREE(polls);
 }
 
-void check_timeout(struct timespec start_time, char *inbuf,
+static void check_timeout(struct timespec start_time, char *inbuf,
 		   unsigned int timeout)
 {
 	struct timespec diff_time, end_time;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

