Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 20CAE1CE846
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236836;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=TpRy37auGksStHK1bQZD/Brff//1ItsYyQxgPKbDDSs=;
	b=gNMq78LU1oKAKYM++rhWWqf3E/WZjmFesvnZab4p5liTPikXl11/iW82RmlY0NgaKK2ljP
	XrSFbjeq6JwK3IadpSimJnTRw3Xx40D6WSeNSvQ/nCHsDHm8+bwoCWEQwYXHnhseuw/dyj
	odRE28Uh6d/Fy0xtWbT+E+wmUYcwcEQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-77pWpakIMiSDT2FV52QYVQ-1; Mon, 11 May 2020 18:40:33 -0400
X-MC-Unique: 77pWpakIMiSDT2FV52QYVQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FDC780572F;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D0C66C79A;
	Mon, 11 May 2020 22:40:24 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 18AAD4E565;
	Mon, 11 May 2020 22:40:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMdxjP016065 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:39:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 98E992016F2C; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93CEB2026E1C
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C1CBE811768
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-342-fqf2YHncPZCri9oIeNhfeQ-1;
	Mon, 11 May 2020 18:39:54 -0400
X-MC-Unique: fqf2YHncPZCri9oIeNhfeQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 14BC1ADE3;
	Mon, 11 May 2020 22:39:55 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:22 +0200
Message-Id: <20200511223931.18261-3-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMdxjP016065
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 02/11] multipath-tools: Makefile.inc: separate
	out OPTFLAGS
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

OPTFLAGS is what distribution builds would typically override. That
should not include the warning flags we use.

Moreover, in the definition of CFLAGS, put $(CFLAGS) first to make it
easier for the user to spot her input in the build logs.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile.inc | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Makefile.inc b/Makefile.inc
index d4d1e0dd..7a59db85 100644
--- a/Makefile.inc
+++ b/Makefile.inc
@@ -93,14 +93,14 @@ STACKPROT := $(call TEST_CC_OPTION,-fstack-protector-strong,-fstack-protector)
 ERROR_DISCARDED_QUALIFIERS := $(call TEST_CC_OPTION,-Werror=discarded-qualifiers,)
 WNOCLOBBERED := $(call TEST_CC_OPTION,-Wno-clobbered,)
 
-OPTFLAGS	= -O2 -g -pipe -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
+OPTFLAGS	:= -O2 -g $(STACKPROT) --param=ssp-buffer-size=4
+WARNFLAGS	:= -Werror -Wall -Wextra -Wformat=2 -Werror=implicit-int \
 		  -Werror=implicit-function-declaration -Werror=format-security \
-		  $(WNOCLOBBERED) \
-		  -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS) \
-		  $(STACKPROT) --param=ssp-buffer-size=4
+		  $(WNOCLOBBERED) -Werror=cast-qual $(ERROR_DISCARDED_QUALIFIERS)
 CPPFLAGS	:= -Wp,-D_FORTIFY_SOURCE=2 
-CFLAGS		:= $(OPTFLAGS) -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
-		   -MMD -MP $(CFLAGS)
+CFLAGS		:= $(CFLAGS) $(OPTFLAGS) $(WARNFLAGS) -pipe \
+		   -DBIN_DIR=\"$(bindir)\" -DLIB_STRING=\"${LIB}\" -DRUN_DIR=\"${RUN}\" \
+		   -MMD -MP
 BIN_CFLAGS	= -fPIE -DPIE
 LIB_CFLAGS	= -fPIC
 SHARED_FLAGS	= -shared
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

