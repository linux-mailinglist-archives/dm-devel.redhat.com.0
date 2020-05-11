Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 8F1151CE84B
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236868;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=LNevtTbl/5bJ/VqQYZi7ZL+YzAKXnc2GbuggYQzRaN0=;
	b=Q+hoP4+3/X/C9fZqdPl82EoTSjyTltxkIMX28EI9WzHL0/ZYO6LYo8G7YCt9G8uNit0n+I
	kiC4Mjgz0iHgFrwAVxkTPhUVda+PkwcSIvk0Uu+T17jzpJ3w4In55/CHqZ/im81C9xvloT
	HfnubIQHdFML2dzm9PIsXZXNicLGQUc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-z-hdcrzqPu-UyOgz68IMzQ-1; Mon, 11 May 2020 18:40:34 -0400
X-MC-Unique: z-hdcrzqPu-UyOgz68IMzQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59CC11009456;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 371806199C;
	Mon, 11 May 2020 22:40:25 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D93661809554;
	Mon, 11 May 2020 22:40:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMe0Jl016092 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AA74A2156A3C; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6FBF2156A22
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9292580CDAF
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:40:00 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-494-9eRXBPTZN7KwYhV93Fl9sA-1;
	Mon, 11 May 2020 18:39:56 -0400
X-MC-Unique: 9eRXBPTZN7KwYhV93Fl9sA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 14E68AE70;
	Mon, 11 May 2020 22:39:57 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:29 +0200
Message-Id: <20200511223931.18261-10-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMe0Jl016092
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 09/11] multipath tools tests/Makefile: Fix
	OBJDEPS for hwtable-test
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

OBJDEPS needs to list object files that _call_ functions we want
to wrap, but it should _not_ list the object files where these
functions are defined; otherwise the linker might resolve these
symbols before they can be wrapped.

(Observed on i586 with gcc 9.3.1, ld 2.34.0, where wrapping
prio_getprio() doesn't work with prio.o in OBJDEPS).

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/Makefile b/tests/Makefile
index 028c9ea7..1b8706a7 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -41,7 +41,7 @@ endif
 dmevents-test_LIBDEPS = -lpthread -ldevmapper -lurcu
 hwtable-test_TESTDEPS := test-lib.o
 hwtable-test_OBJDEPS := ../libmultipath/discovery.o ../libmultipath/blacklist.o \
-	../libmultipath/prio.o ../libmultipath/callout.o ../libmultipath/structs.o
+	../libmultipath/structs.o
 hwtable-test_LIBDEPS := -ludev -lpthread -ldl
 blacklist-test_TESTDEPS := test-log.o
 blacklist-test_OBJDEPS := ../libmultipath/blacklist.o
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

