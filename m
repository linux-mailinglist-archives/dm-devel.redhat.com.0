Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D4B961766C4
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583187680;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FuzHSygIjdFVQPOYmVtnmObSxKtQLnxdX3adpoegiIE=;
	b=IbWHX/ZbQ5f87H9SYCIJMU7QtvqjvtXIwQ3KDRGoyktrmH1VAKwPVMMDptUVt9QVsRm3rr
	g4Z24bD2DIXJBilgy4ukExgkBkHXpxMA99GTCYnwJd7obL5LAykyb8eb4Chy2CPNHUE5XW
	5qzqSr2rGMkk7/LJI3JaCwcdiRrEbbA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-lXQTilbUM7egG4Xk9O-RQg-1; Mon, 02 Mar 2020 17:21:18 -0500
X-MC-Unique: lXQTilbUM7egG4Xk9O-RQg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B80931083E8A;
	Mon,  2 Mar 2020 22:21:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 668B95C28D;
	Mon,  2 Mar 2020 22:21:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0A6E784481;
	Mon,  2 Mar 2020 22:21:07 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022MKwX1003563 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 17:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id C85B0DBF2F; Mon,  2 Mar 2020 22:20:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C46DEDBF26
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 27437101A55D
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-294-CKNs5ZO5OwGNoU6bB2I2FA-1;
	Mon, 02 Mar 2020 17:20:55 -0500
X-MC-Unique: CKNs5ZO5OwGNoU6bB2I2FA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B60E7B339;
	Mon,  2 Mar 2020 22:20:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  2 Mar 2020 23:20:24 +0100
Message-Id: <20200302222025.21022-4-mwilck@suse.com>
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
References: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022MKwX1003563
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 3/4] tests/Makefile: add test_clean target
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This is a convenience target to remove only the test output files.
It's useful for those tests which require root permissions to run,
as "make" doesn't delete the .out file if a test fails (we could
force "make" to do so, but we don't want to do that, because usually
we want to inspect the output file when a test has failed). With
test_clean, we can run "make" as normal user, then "make test_clean"
and finally run "make" as root again.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index 5f6583a0..77ff3249 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -67,8 +67,11 @@ lib/libchecktur.so:
 
 OBJS = $(TESTS:%=%.o) test-lib.o
 
-clean: dep_clean
-	$(RM) $(TESTS:%=%-test) $(TESTS:%=%.out) $(OBJS) *.o.wrap
+test_clean:
+	$(RM) $(TESTS:%=%.out)
+
+clean: test_clean dep_clean
+	$(RM) $(TESTS:%=%-test) $(OBJS) *.o.wrap
 	$(RM) -rf lib
 
 .SECONDARY: $(OBJS)
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

