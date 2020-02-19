Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 4D50F163D4E
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:56:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095363;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=5dpQms4AtYEvGDz49s6xhGAdo+Ua/Cz/ZhpLWHlP0iQ=;
	b=NAUsY2EGUX8oQ+5hwdSmXQnH88kX6vJHRRGiVzBUkQiLx6QZWQNs/KXBtMffT5pggLmn0Z
	rvLmLYBToeAZO2TIWk6IOQ5TuUsVEdh5bOj/h3g0ATfYi/5kadY2G1Ey1zKjYc5TBQt1+P
	z9WGD8wmR0lzyCSEs37y//XcpHiV+kY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-XBTpXD1wOFqGDcADVIybkQ-1; Wed, 19 Feb 2020 01:54:59 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11A27185734D;
	Wed, 19 Feb 2020 06:54:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDE5460C84;
	Wed, 19 Feb 2020 06:54:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5ECDC1803C40;
	Wed, 19 Feb 2020 06:54:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6siMi016815 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:54:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 32CFA60BE1; Wed, 19 Feb 2020 06:54:44 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5044460C87;
	Wed, 19 Feb 2020 06:54:41 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6sef3010333; 
	Wed, 19 Feb 2020 00:54:40 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6sdth010332;
	Wed, 19 Feb 2020 00:54:39 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:54:32 -0600
Message-Id: <1582095273-10279-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
References: <1582095273-10279-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 4/5] libmultipath: change directio get_events()
	timeout handling
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
X-MC-Unique: XBTpXD1wOFqGDcADVIybkQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

get_events() used a NULL or a zeroed timeout to mean "don't wait".
io_getevents() uses a NULL timeout to mean "wait forever" and a
zeroed timeout to mean "don't wait". Make get_events() work like
io_getevents().

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/directio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/libmultipath/checkers/directio.c b/libmultipath/checkers/directio.c
index 6ad7c885..649961a4 100644
--- a/libmultipath/checkers/directio.c
+++ b/libmultipath/checkers/directio.c
@@ -262,7 +262,7 @@ get_events(struct aio_group *aio_grp, struct timespec *timeout)
 	struct io_event events[128];
 	int i, nr, got_events = 0;
 	struct timespec zero_timeout = {0};
-	struct timespec *timep = (timeout)? timeout : &zero_timeout;
+	struct timespec *timep = timeout;
 
 	do {
 		errno = 0;
@@ -303,7 +303,6 @@ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 	int		rc;
 	long		r;
 	struct timespec currtime, endtime;
-	struct timespec *timep = &timeout;
 
 	if (fstat(fd, &sb) == 0) {
 		LOG(4, "called for %x", (unsigned) sb.st_rdev);
@@ -339,18 +338,19 @@ check_state(int fd, struct directio_context *ct, int sync, int timeout_secs)
 	endtime.tv_nsec += timeout.tv_nsec;
 	normalize_timespec(&endtime);
 	while(1) {
-		r = get_events(ct->aio_grp, timep);
+		r = get_events(ct->aio_grp, &timeout);
 
 		if (ct->req->state != PATH_PENDING) {
 			ct->running = 0;
 			return ct->req->state;
-		} else if (r == 0 || !timep)
+		} else if (r == 0 ||
+			   (timeout.tv_sec == 0 && timeout.tv_nsec == 0))
 			break;
 
 		get_monotonic_time(&currtime);
 		timespecsub(&endtime, &currtime, &timeout);
 		if (timeout.tv_sec < 0)
-			timep = NULL;
+			timeout.tv_sec = timeout.tv_nsec = 0;
 	}
 	if (ct->running > timeout_secs || sync) {
 		struct io_event event;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

