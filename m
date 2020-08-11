Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id D7C4B242241
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 00:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597183329;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L1dL20lGpdVGPZXsqEFmnkeUUR5mMHJtFoT6hsHAE7c=;
	b=Wb3AQVS14iieuANPQrEbZg9cVPuSXov28Jsmh+yak4fyvj71RzzlmRXXN5qjpgl+sq1b+5
	L4jMj1STsIsbDpRAMkM8BdPdciH+TdYslfcmp/aWkHTM7uqbUP8OEqWB9nlqWAzSKtj4OK
	na1wrbQaT3AxgUq6IstLLhgZxf0IG5Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-r0oPj7rrPjiaPDTKBZW2iQ-1; Tue, 11 Aug 2020 18:01:05 -0400
X-MC-Unique: r0oPj7rrPjiaPDTKBZW2iQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 382A9800493;
	Tue, 11 Aug 2020 22:00:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 10A3010016E8;
	Tue, 11 Aug 2020 22:00:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BEDE64EDB6;
	Tue, 11 Aug 2020 22:00:56 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07BLwrHa009158 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 11 Aug 2020 17:58:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 986CB8AD05; Tue, 11 Aug 2020 21:58:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D4C8BB04;
	Tue, 11 Aug 2020 21:58:53 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 07BLwp4S015859; 
	Tue, 11 Aug 2020 16:58:52 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 07BLwp8K015858;
	Tue, 11 Aug 2020 16:58:51 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 11 Aug 2020 16:58:41 -0500
Message-Id: <1597183123-15797-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
References: <1597183123-15797-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 6/8] multipath: deal with delegation failures
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

delegate_to_multipathd() was returning success, even if the multipathd
command failed. Also, if the command was set to fail with NOT_DELEGATED,
it shouldn't print any errors, since multipath will try to issue the
command itself.

Fixes: "multipath: delegate flushing maps to multipathd"
Reviewed-by: Martin Wilck <mwilck@suse.com>
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

