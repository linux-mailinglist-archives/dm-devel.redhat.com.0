Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 09AFB2F707D
	for <lists+dm-devel@lfdr.de>; Fri, 15 Jan 2021 03:21:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610677268;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NF1lb0JNb1FKB3L3UmRDr6TmvQGKXtmn/GfoPOBBsgg=;
	b=TuHmVyBi3tXaOgEEJWxObk0Vq2sPQb/C92ft5V4FYRg9YvGK8/XzNjvGZqLZhemCn8X6bB
	97Luf9wAhl49SXD8ZCu6pWWBsVFm5lUTMP7Hh6G6EFRkjkJMrKIiVoKLNGaJ9muhW/xYC0
	a8gmwdzhLEjh9Ol7q1bzvj1ItLOcot0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-6xN-r3PiMNmm6kKb7-WuIA-1; Thu, 14 Jan 2021 21:21:05 -0500
X-MC-Unique: 6xN-r3PiMNmm6kKb7-WuIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6CC0180A0A4;
	Fri, 15 Jan 2021 02:20:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 814145D739;
	Fri, 15 Jan 2021 02:20:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E523F180954D;
	Fri, 15 Jan 2021 02:20:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10F2KaGq031002 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 14 Jan 2021 21:20:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 9331571D52; Fri, 15 Jan 2021 02:20:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C6CB63746;
	Fri, 15 Jan 2021 02:20:33 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 10F2KWYC023604; 
	Thu, 14 Jan 2021 20:20:32 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 10F2KVr1023603;
	Thu, 14 Jan 2021 20:20:31 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 14 Jan 2021 20:20:25 -0600
Message-Id: <1610677227-23550-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
References: <1610677227-23550-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/6] multipathd: use get_monotonic_time() in
	io_err_stat code
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of calling clock_gettime(), and dealing with failure
conditions, just call get_monotonic_time().

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/io_err_stat.c | 34 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 23 deletions(-)

diff --git a/libmultipath/io_err_stat.c b/libmultipath/io_err_stat.c
index 775e7259..92871f40 100644
--- a/libmultipath/io_err_stat.c
+++ b/libmultipath/io_err_stat.c
@@ -295,8 +295,7 @@ int io_err_stat_handle_pathfail(struct path *path)
 	 * the repeated count threshold and time frame, we assume a path
 	 * which fails at least twice within 60 seconds is flaky.
 	 */
-	if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0)
-		return 1;
+	get_monotonic_time(&curr_time);
 	if (path->io_err_pathfail_cnt == 0) {
 		path->io_err_pathfail_cnt++;
 		path->io_err_pathfail_starttime = curr_time.tv_sec;
@@ -352,9 +351,9 @@ int need_io_err_check(struct path *pp)
 	}
 	if (pp->io_err_pathfail_cnt != PATH_IO_ERR_WAITING_TO_CHECK)
 		return 1;
-	if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0 ||
-	    (curr_time.tv_sec - pp->io_err_dis_reinstate_time) >
-			pp->mpp->marginal_path_err_recheck_gap_time) {
+	get_monotonic_time(&curr_time);
+	if ((curr_time.tv_sec - pp->io_err_dis_reinstate_time) >
+	    pp->mpp->marginal_path_err_recheck_gap_time) {
 		io_err_stat_log(4, "%s: reschedule checking after %d seconds",
 				pp->dev,
 				pp->mpp->marginal_path_err_recheck_gap_time);
@@ -400,8 +399,7 @@ static int io_err_stat_time_up(struct io_err_stat_path *pp)
 {
 	struct timespec currtime, difftime;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &currtime) != 0)
-		return 0;
+	get_monotonic_time(&currtime);
 	timespecsub(&currtime, &pp->start_time, &difftime);
 	if (difftime.tv_sec < pp->total_time)
 		return 0;
@@ -414,8 +412,7 @@ static void end_io_err_stat(struct io_err_stat_path *pp)
 	struct path *path;
 	double err_rate;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &currtime) != 0)
-		currtime = pp->start_time;
+	get_monotonic_time(&currtime);
 
 	io_err_stat_log(4, "%s: check end", pp->devname);
 
@@ -464,11 +461,7 @@ static int send_each_async_io(struct dio_ctx *ct, int fd, char *dev)
 			ct->io_starttime.tv_sec == 0) {
 		struct iocb *ios[1] = { &ct->io };
 
-		if (clock_gettime(CLOCK_MONOTONIC, &ct->io_starttime) != 0) {
-			ct->io_starttime.tv_sec = 0;
-			ct->io_starttime.tv_nsec = 0;
-			return rc;
-		}
+		get_monotonic_time(&ct->io_starttime);
 		io_prep_pread(&ct->io, fd, ct->buf, ct->blksize, 0);
 		if (io_submit(ioctx, 1, ios) != 1) {
 			io_err_stat_log(5, "%s: io_submit error %i",
@@ -487,8 +480,7 @@ static void send_batch_async_ios(struct io_err_stat_path *pp)
 	struct dio_ctx *ct;
 	struct timespec currtime, difftime;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &currtime) != 0)
-		return;
+	get_monotonic_time(&currtime);
 	/*
 	 * Give a free time for all IO to complete or timeout
 	 */
@@ -503,11 +495,8 @@ static void send_batch_async_ios(struct io_err_stat_path *pp)
 		if (!send_each_async_io(ct, pp->fd, pp->devname))
 			pp->io_nr++;
 	}
-	if (pp->start_time.tv_sec == 0 && pp->start_time.tv_nsec == 0 &&
-		clock_gettime(CLOCK_MONOTONIC, &pp->start_time)) {
-		pp->start_time.tv_sec = 0;
-		pp->start_time.tv_nsec = 0;
-	}
+	if (pp->start_time.tv_sec == 0 && pp->start_time.tv_nsec == 0)
+		get_monotonic_time(&pp->start_time);
 }
 
 static int try_to_cancel_timeout_io(struct dio_ctx *ct, struct timespec *t,
@@ -546,8 +535,7 @@ static void poll_async_io_timeout(void)
 	int		rc = PATH_UNCHECKED;
 	int		i, j;
 
-	if (clock_gettime(CLOCK_MONOTONIC, &curr_time) != 0)
-		return;
+	get_monotonic_time(&curr_time);
 	vector_foreach_slot(io_err_pathvec, pp, i) {
 		for (j = 0; j < CONCUR_NR_EVENT; j++) {
 			rc = try_to_cancel_timeout_io(pp->dio_ctx_array + j,
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

