Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 07053491D3E
	for <lists+dm-devel@lfdr.de>; Tue, 18 Jan 2022 04:29:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1642476542;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+Od6e7qRxMCrXQLfQh5IHRcIvhG9PsydFfjVH3UlpBE=;
	b=KmISegh7E7MjI+7JuCVhy5AQgpBjoFhFflGprUBG4WM8XPzWoisVd66mbJmJUPjQ2ugv2u
	FZQmobJFp2hQec31gehxheZMQQId9P/84TH+k2R7U/z+6A5P3vOxyNnY+HeKmsjec3PGFL
	lzlIcYL8hVOOP6XqwhSvPdZIdpab24s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-18-1Shyhc_PMoup-cV_Jkn7BQ-1; Mon, 17 Jan 2022 22:28:03 -0500
X-MC-Unique: 1Shyhc_PMoup-cV_Jkn7BQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22F3B1475B;
	Tue, 18 Jan 2022 03:27:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01BB746986;
	Tue, 18 Jan 2022 03:27:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B1CEF1809CB8;
	Tue, 18 Jan 2022 03:27:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20I3RkXv028837 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 17 Jan 2022 22:27:46 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C437646982; Tue, 18 Jan 2022 03:27:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 96E994697F;
	Tue, 18 Jan 2022 03:27:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 20I3RZ5c006016; 
	Mon, 17 Jan 2022 21:27:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 20I3RZUm006015;
	Mon, 17 Jan 2022 21:27:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon, 17 Jan 2022 21:27:31 -0600
Message-Id: <1642476453-5974-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1642476453-5974-1-git-send-email-bmarzins@redhat.com>
References: <1642476453-5974-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/3] libmultipath: fix disassemble status for
	historical-service-time PS
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

The historical-service-time path selector prints out 2 path group status
arguments. This is the only path selector that uses the group status
arguments. All the others only have path status arguments.
disassemble_status() was expecting the number of group status arguments
to always be zero, causing it to fail at disassembling the status of
devices that use historical-service-time path selector. Now multipath
actually checks the number of group arguments, and skips them.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dmparser.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index 24ba4ac3..50d13c08 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -436,9 +436,19 @@ int disassemble_status(const char *params, struct multipath *mpp)
 		free(word);
 
 		/*
-		 * PG Status (discarded, would be '0' anyway)
+		 * Path Selector Group Arguments
 		 */
-		p += get_word(p, NULL);
+		p += get_word(p, &word);
+
+		if (!word)
+			return 1;
+
+		num_pg_args = atoi(word);
+		free(word);
+
+		/* Ignore ps group arguments */
+		for (j = 0; j < num_pg_args; j++)
+			p += get_word(p, NULL);
 
 		p += get_word(p, &word);
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

