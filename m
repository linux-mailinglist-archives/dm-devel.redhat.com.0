Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id F3B221CE842
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=oXfU2UX+dlZDg/FNgYGPVEYD8o/m3n0OO8Obw46FPr4=;
	b=FAM04Cmlhh2+gMIqXujqDlhZoY0LIQujRxeMzFdDVT+gH2WBKwyEi0KGIQcv4yYbVW9DSS
	SKbAGk0UjmKG2rWtRSI+Z63NUQgXOILFlEk7Lpwgw+puZxL2tlSxBpL182Ov/gh04EAs+c
	X7uOpa8MJGKQeeZoV7dLBjBx5Gq5lN8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-253-zs4GE4DYNPyqu0OFPR0K4g-1; Mon, 11 May 2020 18:40:30 -0400
X-MC-Unique: zs4GE4DYNPyqu0OFPR0K4g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D60C98018A2;
	Mon, 11 May 2020 22:40:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A0FE477F2E;
	Mon, 11 May 2020 22:40:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6268E4CAA0;
	Mon, 11 May 2020 22:40:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMdxfd016059 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:39:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 4C90E2156A3B; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 48E4B2156A22
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CAA6811E77
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:57 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-218-iDW3ed2vP6Sk_Zq0ZOtRbQ-1;
	Mon, 11 May 2020 18:39:54 -0400
X-MC-Unique: iDW3ed2vP6Sk_Zq0ZOtRbQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 975B9AE3A;
	Mon, 11 May 2020 22:39:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:24 +0200
Message-Id: <20200511223931.18261-5-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMdxfd016059
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 04/11] multipath-tools: Makefile.inc: set
	-Wno-error=clobbered
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

We need to ignore -Wclobbered because gcc has trouble dealing with glibc's
implementation of pthread_cleanup_push().

For some variants of gcc, -Wno-clobbered alone isn't enough if -Werror is also
set. Compilation with -Wno-error=clobbered works, though.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.inc b/Makefile.inc
index 671dd1ca..e7256e3a 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -91,7 +91,7 @@ TEST_CC_OPTION = $(shell \
 
 STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
-WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered,)
+WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered -Wno-error=clobbered,)
 
 OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
 WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

