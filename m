Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id BE10037FC74
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 19:24:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620926648;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=wcIvDwmi/TK2BS2APZ+iH0nket7dU0BE8f0g4yFCbkg=;
	b=andT3VISKPJc2Sdn53FI5pQuxSvuKBFlLnDLu6N5t5W5luHAotm6Udl7qG8Seyn1Uw5ySM
	OCzjmMiRa4Ps0vjFyAJb12wDC2YASbf4+ckfoOTbTG9VbAtPBnQD/48veft5i6N5xX+Cjh
	6EViqs4OMn7gOOTlvJuz5qzFtezZyRk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-g5HZPh2SPBuVkSDYHQHcSw-1; Thu, 13 May 2021 13:24:04 -0400
X-MC-Unique: g5HZPh2SPBuVkSDYHQHcSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CB8D5192780A;
	Thu, 13 May 2021 17:23:39 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75F0BE174;
	Thu, 13 May 2021 17:23:39 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 462211800BB4;
	Thu, 13 May 2021 17:23:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DHNSPa005696 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 13:23:28 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0973E10016F9; Thu, 13 May 2021 17:23:28 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A279100763D;
	Thu, 13 May 2021 17:23:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DHNL4o012083; 
	Thu, 13 May 2021 12:23:21 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DHNLI2012082;
	Thu, 13 May 2021 12:23:21 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 13 May 2021 12:23:13 -0500
Message-Id: <1620926595-12029-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
References: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/6] multipath: free vectors in configure
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

configure() can retry multiple times, each time reallocing a maps and
paths vector, and leaking the previous ones. Fix this by always freeing
the vectors before configure() exits. Found by coverity.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/multipath/main.c b/multipath/main.c
index ef89c7cf..8fc0e15f 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -466,7 +466,6 @@ configure (struct config *conf, enum mpath_cmds cmd,
 	 */
 	curmp = vector_alloc();
 	pathvec = vector_alloc();
-	atexit(cleanup_vecs);
 
 	if (!curmp || !pathvec) {
 		condlog(0, "can not allocate memory");
@@ -578,6 +577,11 @@ out:
 	if (refwwid)
 		FREE(refwwid);
 
+	free_multipathvec(curmp, KEEP_PATHS);
+	vecs.mpvec = NULL;
+	free_pathvec(pathvec, FREE_PATHS);
+	vecs.pathvec = NULL;
+
 	return r;
 }
 
@@ -823,6 +827,7 @@ main (int argc, char *argv[])
 	conf = get_multipath_config();
 	conf->retrigger_tries = 0;
 	conf->force_sync = 1;
+	atexit(cleanup_vecs);
 	while ((arg = getopt(argc, argv, ":adDcChl::eFfM:v:p:b:BrR:itTquUwW")) != EOF ) {
 		switch(arg) {
 		case 1: printf("optarg : %s\n",optarg);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

