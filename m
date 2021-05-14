Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD33A381180
	for <lists+dm-devel@lfdr.de>; Fri, 14 May 2021 22:11:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621023098;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MrMboESLP6K0GIIA10rhW2P+cBo+4wI+nRzAFMLUJGU=;
	b=EiKQXpCWGb+LMLhkfWLf5psRqv2xc1/fUeraDEr+TiLuWHteYV+RpDflxbuKqqm6A91J6e
	Lu6tsHD8oMW5cyGG3/NJUqpsGDAworlYVL6DB17KHrChKg5r8uS+yr2PlihnB4jlyoaUII
	bo4nUQAXwsSdpGK/+vfRjtXqP425pkQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-8z5-1DopNtewuVxPXbE4uw-1; Fri, 14 May 2021 16:11:35 -0400
X-MC-Unique: 8z5-1DopNtewuVxPXbE4uw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E28A107ACF4;
	Fri, 14 May 2021 20:11:27 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6A88654466;
	Fri, 14 May 2021 20:11:27 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 220C157DE8;
	Fri, 14 May 2021 20:11:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14EKBASV010862 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 16:11:10 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 1A2D310016FD; Fri, 14 May 2021 20:11:10 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 35FE210016F2;
	Fri, 14 May 2021 20:11:06 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14EKB4kJ020065; 
	Fri, 14 May 2021 15:11:04 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14EKB4Kv020064;
	Fri, 14 May 2021 15:11:04 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 14 May 2021 15:10:58 -0500
Message-Id: <1621023060-20011-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1621023060-20011-1-git-send-email-bmarzins@redhat.com>
References: <1621023060-20011-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 4/6] multipath: free vectors in configure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Reviewed-by: Martin Wilck <mwilck@suse.com>
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

