Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 12F5822F903
	for <lists+dm-devel@lfdr.de>; Mon, 27 Jul 2020 21:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1595877964;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=erH5kpIygUkpFLj7Iq5gqbQaNLG11I3IXzXJd5LTQqI=;
	b=icrRPLLRGUEMqnWSNh2i60prXFgwJ8LsEEtFe8efInUPrIiK6081vM5nWtL1duLXIu7h1s
	mq1sEDgGiB7kDi2M+n0vimvCuMJ68wCzXNm3vrU6GgpDuRycsybOMQeXtaTnaegtnEIoIu
	+X8rmijU9HUXoCrIX/+Wx3yNAg4o5Y4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-KJ9Kq-sePTuaH5L0Xy-Zbg-1; Mon, 27 Jul 2020 15:25:01 -0400
X-MC-Unique: KJ9Kq-sePTuaH5L0Xy-Zbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E7C780046C;
	Mon, 27 Jul 2020 19:24:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CDD7190E6B;
	Mon, 27 Jul 2020 19:24:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 75DDD1809557;
	Mon, 27 Jul 2020 19:24:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 06RJOgdd024731 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 27 Jul 2020 15:24:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A16A760C87; Mon, 27 Jul 2020 19:24:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3F5660FC2;
	Mon, 27 Jul 2020 19:24:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 06RJOcBX005655; 
	Mon, 27 Jul 2020 14:24:38 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 06RJObl1005654;
	Mon, 27 Jul 2020 14:24:37 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 27 Jul 2020 14:24:28 -0500
Message-Id: <1595877868-5595-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
References: <1595877868-5595-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 6/6] multipath: deal with delegation failures
	correctly
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

delegate_to_multipathd() was returning success, even if the multipathd
command failed. Also, if the command was set to fail with NOT_DELEGATED,
it shouldn't print any errors, since multipath will try to issue to
command itself.

Fixes: "multipath: delegate flushing maps to multipathd"
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/main.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/multipath/main.c b/multipath/main.c
index 4c43314e..3da692dc 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -861,9 +861,12 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 		goto out;
 	}
 
-	if (reply != NULL && *reply != '\0' && strcmp(reply, "ok\n"))
-		printf("%s", reply);
-	r = DELEGATE_OK;
+	if (reply != NULL && *reply != '\0') {
+		if (strcmp(reply, "fail\n"))
+			r = DELEGATE_OK;
+		if (r != NOT_DELEGATED && strcmp(reply, "ok\n"))
+			printf("%s", reply);
+	}
 
 out:
 	FREE(reply);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

