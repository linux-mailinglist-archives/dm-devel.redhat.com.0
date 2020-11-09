Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id CD4F92AC924
	for <lists+dm-devel@lfdr.de>; Tue, 10 Nov 2020 00:13:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604963599;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=zh+5hIIzTM0AvP62C6fRm67YyTpJbiRsRr8rYXBqQaQ=;
	b=gtjHx1aE6aOSV32cPjL9QYZ7pdblOTCUrwAc91+OSLwUTWJFcwcnNhQv5sOT2VU5zw9xDg
	HKlvOmZnGSTPmsEkwEm559oS015yHhNDtZPCp8QrYeNbVpOcWnzogwtco8IqUWLhcf/F15
	A1x3z4nYSJfA/JEnDnXCL1WVmfVXv9I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-AWLIzo-kMoWlWhyTypIghQ-1; Mon, 09 Nov 2020 18:13:18 -0500
X-MC-Unique: AWLIzo-kMoWlWhyTypIghQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC45064158;
	Mon,  9 Nov 2020 23:13:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C40CD62A14;
	Mon,  9 Nov 2020 23:13:07 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C91D018037CC;
	Mon,  9 Nov 2020 23:12:59 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A9NCl0B001835 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 9 Nov 2020 18:12:48 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF7805C5B0; Mon,  9 Nov 2020 23:12:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8ED25C1DA;
	Mon,  9 Nov 2020 23:12:44 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A9NChC9031945; 
	Mon, 9 Nov 2020 17:12:43 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A9NCgxn031944;
	Mon, 9 Nov 2020 17:12:42 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Mon,  9 Nov 2020 17:12:42 -0600
Message-Id: <1604963562-31905-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] mpathpersist: Fix Register and Ignore with 0x00
	SARK
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Register and Ignore command is run with sg_persist, if a 0x00
Service Action Reservation Key is given or the --param-sark option is
not used at all, sg_persist will clear the registration.  mpathpersist
will fail with an error.  This patch fixes mpathpersist to work like
sg_persist in this case.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmpathpersist/mpath_persist.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmpathpersist/mpath_persist.c b/libmpathpersist/mpath_persist.c
index 79322e86..703f8e13 100644
--- a/libmpathpersist/mpath_persist.c
+++ b/libmpathpersist/mpath_persist.c
@@ -289,8 +289,8 @@ int __mpath_persistent_reserve_out ( int fd, int rq_servact, int rq_scope,
 	put_multipath_config(conf);
 
 	memcpy(&prkey, paramp->sa_key, 8);
-	if (mpp->prkey_source == PRKEY_SOURCE_FILE && prkey &&
-	    ((!get_be64(mpp->reservation_key) &&
+	if (mpp->prkey_source == PRKEY_SOURCE_FILE &&
+	    ((!get_be64(mpp->reservation_key) && prkey &&
 	      rq_servact == MPATH_PROUT_REG_SA) ||
 	     rq_servact == MPATH_PROUT_REG_IGN_SA)) {
 		memcpy(&mpp->reservation_key, paramp->sa_key, 8);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

