Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD9F5858BC
	for <lists+dm-devel@lfdr.de>; Sat, 30 Jul 2022 07:13:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659158020;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RYTzVso86DC+x+nrn6TswE73jmgUkJNXZw0LTNuwlQg=;
	b=XKWqEH8O9dfS9LK/NFxQp801WqWXRAaTwfzxXa5xHTs45l+9mYal6c3q7quYFjPvQNpc+a
	yOys4CB1rIJnxoW1O/cpbOx3UwBchfW67LfxUPk7BkRyks0/NhU9cfjoyKqQ2X9loPSnup
	3en+GmIeLsFgskoRkcjTm/MIaX9X4vs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-RurfOVLlOkqbSuToRDTBKw-1; Sat, 30 Jul 2022 01:13:38 -0400
X-MC-Unique: RurfOVLlOkqbSuToRDTBKw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DB7048041B5;
	Sat, 30 Jul 2022 05:13:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C5F1AC3598C;
	Sat, 30 Jul 2022 05:13:35 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 70C4818F83C6;
	Sat, 30 Jul 2022 05:13:14 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 5E9A61923A93
 for <dm-devel@listman.corp.redhat.com>; Sat, 30 Jul 2022 05:13:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 53C422026D07; Sat, 30 Jul 2022 05:13:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 411CD2026D64;
 Sat, 30 Jul 2022 05:13:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26U5DBl0024147;
 Sat, 30 Jul 2022 00:13:12 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26U5DA7b024144;
 Sat, 30 Jul 2022 00:13:10 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Sat, 30 Jul 2022 00:13:00 -0500
Message-Id: <1659157980-24079-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1659157980-24079-1-git-send-email-bmarzins@redhat.com>
References: <1659157980-24079-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [dm-devel] [PATCH 6/6] multipathd: Don't check if timespec.tv_sec
 is zero
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: Wu Guanghao <wuguanghao3@huawei.com>,
 device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

checking if tv_sec is 0 is a holdover from before we had
get_monotonic_time(), when we used to zero out tv_sec on failure.
Also, use normalize_timespec() to simplify setting the sleep time.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/main.c | 62 ++++++++++++++++++++---------------------------
 1 file changed, 26 insertions(+), 36 deletions(-)

diff --git a/multipathd/main.c b/multipathd/main.c
index 78374377..5c2a7272 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -2589,16 +2589,11 @@ checkerloop (void *ap)
 			break;
 
 		get_monotonic_time(&start_time);
-		if (start_time.tv_sec && last_time.tv_sec) {
-			timespecsub(&start_time, &last_time, &diff_time);
-			condlog(4, "tick (%ld.%06lu secs)",
-				(long)diff_time.tv_sec, diff_time.tv_nsec / 1000);
-			last_time = start_time;
-			ticks = diff_time.tv_sec;
-		} else {
-			ticks = 1;
-			condlog(4, "tick (%d ticks)", ticks);
-		}
+		timespecsub(&start_time, &last_time, &diff_time);
+		condlog(4, "tick (%ld.%06lu secs)",
+			(long)diff_time.tv_sec, diff_time.tv_nsec / 1000);
+		last_time = start_time;
+		ticks = diff_time.tv_sec;
 #ifdef USE_SYSTEMD
 		if (use_watchdog)
 			sd_notify(0, "WATCHDOG=1");
@@ -2688,26 +2683,23 @@ unlock:
 			lock_cleanup_pop(vecs->lock);
 		}
 
-		diff_time.tv_nsec = 0;
-		if (start_time.tv_sec) {
-			get_monotonic_time(&end_time);
-			timespecsub(&end_time, &start_time, &diff_time);
-			if (num_paths) {
-				unsigned int max_checkint;
-
-				condlog(4, "checked %d path%s in %ld.%06lu secs",
-					num_paths, num_paths > 1 ? "s" : "",
-					(long)diff_time.tv_sec,
-					diff_time.tv_nsec / 1000);
-				conf = get_multipath_config();
-				max_checkint = conf->max_checkint;
-				put_multipath_config(conf);
-				if (diff_time.tv_sec > (time_t)max_checkint)
-					condlog(1, "path checkers took longer "
-						"than %ld seconds, consider "
-						"increasing max_polling_interval",
-						(long)diff_time.tv_sec);
-			}
+		get_monotonic_time(&end_time);
+		timespecsub(&end_time, &start_time, &diff_time);
+		if (num_paths) {
+			unsigned int max_checkint;
+
+			condlog(4, "checked %d path%s in %ld.%06lu secs",
+				num_paths, num_paths > 1 ? "s" : "",
+				(long)diff_time.tv_sec,
+				diff_time.tv_nsec / 1000);
+			conf = get_multipath_config();
+			max_checkint = conf->max_checkint;
+			put_multipath_config(conf);
+			if (diff_time.tv_sec > (time_t)max_checkint)
+				condlog(1, "path checkers took longer "
+					"than %ld seconds, consider "
+					"increasing max_polling_interval",
+					(long)diff_time.tv_sec);
 		}
 
 		if (foreign_tick == 0) {
@@ -2725,12 +2717,10 @@ unlock:
 		if (!strict_timing)
 			sleep(1);
 		else {
-			if (diff_time.tv_nsec) {
-				diff_time.tv_sec = 0;
-				diff_time.tv_nsec =
-				     1000UL * 1000 * 1000 - diff_time.tv_nsec;
-			} else
-				diff_time.tv_sec = 1;
+			diff_time.tv_sec = 0;
+			diff_time.tv_nsec =
+			     1000UL * 1000 * 1000 - diff_time.tv_nsec;
+			normalize_timespec(&diff_time);
 
 			condlog(3, "waiting for %ld.%06lu secs",
 				(long)diff_time.tv_sec,
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

