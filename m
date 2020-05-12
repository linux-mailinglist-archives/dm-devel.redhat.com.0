Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8D51CFF7F
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 22:39:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589315980;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=m7PhKlBmWpv+hjTmckiflXYY7Ia7LFEQJ8ANFAYbHmg=;
	b=ae1I3wBx3I2bFSrJG+H9+rMbBRQVRM3QxbUCgk5v/B1b5ynwkyICtuxulDYIKOdTYq0sY5
	SqpBCT4FgQ5u0NRnJ4eY/ej/Dn92BosCdZiqfSsHb/+UvloCbccImKgNXOtx3JTjyykKVL
	r1YzTq3ukWHCg3mMqbqEFNB60V/YSVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-_pJuZ6ygO6uUEM0lV9gtow-1; Tue, 12 May 2020 16:39:37 -0400
X-MC-Unique: _pJuZ6ygO6uUEM0lV9gtow-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA1218A0761;
	Tue, 12 May 2020 20:39:32 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8995E5D9DD;
	Tue, 12 May 2020 20:39:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3B4AE1809543;
	Tue, 12 May 2020 20:39:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04CKcwkV018747 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 12 May 2020 16:38:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8B97610F9AB; Tue, 12 May 2020 20:38:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 87E79110E8A
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74A74185A78B
	for <dm-devel@redhat.com>; Tue, 12 May 2020 20:38:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-12-KM9Gpq1fOsG63h87WJFkAQ-1;
	Tue, 12 May 2020 16:38:52 -0400
X-MC-Unique: KM9Gpq1fOsG63h87WJFkAQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id B8894AD07;
	Tue, 12 May 2020 20:38:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 22:38:22 +0200
Message-Id: <20200512203822.18910-3-mwilck@suse.com>
In-Reply-To: <20200512203822.18910-1-mwilck@suse.com>
References: <20200512203822.18910-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04CKcwkV018747
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>, dm-devel@redhat.com,
	Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/2] multipath-tools Makefile: add install
	dependency
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

$(libdir) must exist before running "make install" on prioritizer, checker,
and foreign libraries.

Cc: Christian Hesse <mail@eworm.de>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index fec3b73b..8bcaba66 100644
--- a/Makefile
+++ b/Makefile
@@ -32,6 +32,10 @@ libmultipath libdmmp: libmpathcmd
 libmpathpersist multipath multipathd: libmultipath
 mpathpersist multipathd:  libmpathpersist
 
+libmultipath/checkers.install \
+	libmultipath/prioritizers.install \
+	libmultipath/foreign.install: libmultipath.install
+
 $(BUILDDIRS.clean):
 	$(MAKE) -C ${@:.clean=} clean
 
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

