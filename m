Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A0FB93839E6
	for <lists+dm-devel@lfdr.de>; Mon, 17 May 2021 18:30:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621269041;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=MrMboESLP6K0GIIA10rhW2P+cBo+4wI+nRzAFMLUJGU=;
	b=VKSVcyhO/Vy0LGTcFpihxyx+6cVCkg72BXuCCrKC/VLF/Ov3DGQoxd6hxY85OXcgwEfpP0
	YM7ySmR47bIQIl+fRjR01cnaDYIq0GCSM6RBXtpqtaj7RHdPCiuEDSZ1T7ks7V6OYcCufC
	Q8rGHiJjfPTLLnCsyxfNDqEbg+QI/Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-LUzjpSBTPiyUBZKNnUXMzA-1; Mon, 17 May 2021 12:30:39 -0400
X-MC-Unique: LUzjpSBTPiyUBZKNnUXMzA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4ED5B107ACED;
	Mon, 17 May 2021 16:30:33 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08EAE5045A;
	Mon, 17 May 2021 16:30:32 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B998180B464;
	Mon, 17 May 2021 16:30:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14HGUGeD004795 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 May 2021 12:30:16 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C9F7C5D72F; Mon, 17 May 2021 16:30:16 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 65D115D749;
	Mon, 17 May 2021 16:30:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14HGU57o006334; 
	Mon, 17 May 2021 11:30:06 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14HGU52c006333;
	Mon, 17 May 2021 11:30:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 17 May 2021 11:29:57 -0500
Message-Id: <1621268999-6280-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1621268999-6280-1-git-send-email-bmarzins@redhat.com>
References: <1621268999-6280-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v4 4/6] multipath: free vectors in configure
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

