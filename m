Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D309767607
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jul 2023 21:06:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690571189;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iV8fNpOGPvBWF8a6/XIbDja4eBnmqs4oEvhSzrLM0lo=;
	b=cc7Am7/D2Fy+XhhKTc2n815ke/anUZi6QiqvfN1XWYQCHQ3TbHO2/NJ32ZPslgmC1u3G1x
	JPOjwMwc432ioF3RtHsIFoEKtkG23XuNEqdVdnx2Bdam1n3RUQEOo7pvFZVZ+SBpuikkPi
	drmf/qPDWRRI6kO11u8aLMV5GNOkpiE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-93-uBo8dUUXNmCK83qbHuuOPg-1; Fri, 28 Jul 2023 15:06:26 -0400
X-MC-Unique: uBo8dUUXNmCK83qbHuuOPg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 880621044591;
	Fri, 28 Jul 2023 19:06:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6D693145414E;
	Fri, 28 Jul 2023 19:06:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4FEC519452D8;
	Fri, 28 Jul 2023 19:06:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 68180194658C
 for <dm-devel@listman.corp.redhat.com>; Fri, 28 Jul 2023 19:06:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 59BD1C584E0; Fri, 28 Jul 2023 19:06:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 43BD2C584E8;
 Fri, 28 Jul 2023 19:06:13 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 36SJ67Xw008338;
 Fri, 28 Jul 2023 14:06:07 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 36SJ670D008337;
 Fri, 28 Jul 2023 14:06:07 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 28 Jul 2023 14:05:55 -0500
Message-Id: <1690571155-8283-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
References: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [RFC PATCH 4/4] libmultipath: fix timeouts for
 path_latency prioritizer
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
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The path_latency prioritizer didn't call get_prio_timeout, so that the
timeout could possibly be 0. Also, it was assuming that the timeout was
in seconds, instead of milliseconds.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/prioritizers/path_latency.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/libmultipath/prioritizers/path_latency.c b/libmultipath/prioritizers/path_latency.c
index 2f5be9b9..d48535d2 100644
--- a/libmultipath/prioritizers/path_latency.c
+++ b/libmultipath/prioritizers/path_latency.c
@@ -107,7 +107,7 @@ static void cleanup_directio_read(int fd, char *buf, int restore_flags)
 static int do_directio_read(int fd, unsigned int timeout, char *buf, int sz)
 {
 	fd_set read_fds;
-	struct timeval tm = { .tv_sec = timeout };
+	struct timeval tm = { .tv_sec = timeout / 1000 };
 	int ret;
 	int num_read;
 
@@ -247,7 +247,8 @@ int getprio(struct path *pp, char *args, unsigned int timeout)
 
 		(void)clock_gettime(CLOCK_MONOTONIC, &tv_before);
 
-		if (do_directio_read(pp->fd, timeout, buf, blksize)) {
+		if (do_directio_read(pp->fd, get_prio_timeout(pp, timeout),
+				     buf, blksize)) {
 			pp_pl_log(0, "%s: path down", pp->dev);
 			cleanup_directio_read(pp->fd, buf, restore_flags);
 			return -1;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

