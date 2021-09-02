Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id D2BE03FF6C9
	for <lists+dm-devel@lfdr.de>; Fri,  3 Sep 2021 00:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630620201;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9q9TUUjYekL5/PNCa1ZyN6LdAyNkDpdzXf8cGOr8D7Y=;
	b=Xb0is9E+HW69/kj9thCtNe9Y1GqOLffAkcZ2JhqRYdsRBwinpejFfrTk1gN/QXlkBOPVff
	EuFDz1KhmuAG6mQru5ZZVRnPnyoGVwMOL1SAA4qjjQMkgJiyHfqCGPzpIo6T9GwALg9biL
	wp7dRbXqmw3AAC3Ht1oLQe4ZrQWMbNc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-352-HgfxE5vcO2C8uQu4coJW1g-1; Thu, 02 Sep 2021 18:03:20 -0400
X-MC-Unique: HgfxE5vcO2C8uQu4coJW1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0599B6D254;
	Thu,  2 Sep 2021 22:03:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D19573CC5;
	Thu,  2 Sep 2021 22:03:13 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90E6C4EEA1;
	Thu,  2 Sep 2021 22:03:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 182LvxjK013358 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 2 Sep 2021 17:57:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 869B96A8F8; Thu,  2 Sep 2021 21:57:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7222169322;
	Thu,  2 Sep 2021 21:57:59 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 182Lvvel012311; 
	Thu, 2 Sep 2021 16:57:57 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 182Lvvc3012310;
	Thu, 2 Sep 2021 16:57:57 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  2 Sep 2021 16:57:48 -0500
Message-Id: <1630619869-12251-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
References: <1630619869-12251-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 5/6] libmultipath: deal with dynamic
	PTHREAD_STACK_MIN
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

Starting in glibc-2.34 (commit 5d98a7da), PTHREAD_STACK_MIN is defined
as sysconf(_SC_THREAD_STACK_MIN) if _GNU_SOURCE is defined. sysconf()
returns a long and can, at least in theory, return -1.  This change
causes compilation to fail in setup_thread_attr() due to a comparision
with different signedness, since stacksize is a size_t.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/util.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/util.c b/libmultipath/util.c
index e2fafe85..ea858409 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -223,8 +223,8 @@ setup_thread_attr(pthread_attr_t *attr, size_t stacksize, int detached)
 
 	ret = pthread_attr_init(attr);
 	assert(ret == 0);
-	if (stacksize < PTHREAD_STACK_MIN)
-		stacksize = PTHREAD_STACK_MIN;
+	if (PTHREAD_STACK_MIN > 0 && stacksize < (size_t)PTHREAD_STACK_MIN)
+		stacksize = (size_t)PTHREAD_STACK_MIN;
 	ret = pthread_attr_setstacksize(attr, stacksize);
 	assert(ret == 0);
 	if (detached) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

