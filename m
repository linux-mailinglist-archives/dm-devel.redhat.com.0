Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F35767605
	for <lists+dm-devel@lfdr.de>; Fri, 28 Jul 2023 21:06:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690571188;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PSYAiZjvTlqfumFbctQcQJCLnyYycCWgl8WZjdGMLY8=;
	b=eoGD5GnnA7YiZlIyWPJa6Z56QtP2D0ZXr6cFLxJ9R7mutuIifMuxTkHdO1c7C78hK2orWI
	b184z9EdVn2LmNrffUslDgPUg8ckuScOdBwQCiPRjpFp9YyAbZv07Emu751E9ljIh4+mgr
	+XtDBlCxePfZWvH37PUz6JPZQJdYPnY=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-50BVH-EYOceHGgzN-kpjgA-1; Fri, 28 Jul 2023 15:06:23 -0400
X-MC-Unique: 50BVH-EYOceHGgzN-kpjgA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 093CA3C100CC;
	Fri, 28 Jul 2023 19:06:14 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 53E66207B2DF;
	Fri, 28 Jul 2023 19:06:08 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 4B1E719451C9;
	Fri, 28 Jul 2023 19:06:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 37B1B194658C
 for <dm-devel@listman.corp.redhat.com>; Fri, 28 Jul 2023 19:06:05 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 178BCC584E3; Fri, 28 Jul 2023 19:06:05 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F2E9DC584E0;
 Fri, 28 Jul 2023 19:06:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 36SJ5xnT008325;
 Fri, 28 Jul 2023 14:05:59 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 36SJ5xeR008324;
 Fri, 28 Jul 2023 14:05:59 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 28 Jul 2023 14:05:52 -0500
Message-Id: <1690571155-8283-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
References: <1690571155-8283-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Subject: [dm-devel] [RFC PATCH 1/4] libmultipath: don't bother to reset
 default timeout value
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

by the time get_state() is rechecking the sysfs timeout value,
c->timeout has already been set.  The only reason why this check exists
is to deal with the possiblity that the sysfs value has changed. If the
sysfs value doesn't exist (which likely means that the device is not a
scsi device), then there's no reason to reset the default value, since
that can't have changed.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 5626d48d..2b1a11d5 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1965,9 +1965,8 @@ get_state (struct path * pp, struct config *conf, int daemon, int oldstate)
 		checker_set_async(c);
 	else
 		checker_set_sync(c);
-	if (!conf->checker_timeout &&
-	    sysfs_get_timeout(pp, &(c->timeout)) <= 0)
-		c->timeout = DEF_TIMEOUT;
+	if (!conf->checker_timeout)
+	    sysfs_get_timeout(pp, &(c->timeout));
 	state = checker_check(c, oldstate);
 	condlog(3, "%s: %s state = %s", pp->dev,
 		checker_name(c), checker_state_name(state));
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

