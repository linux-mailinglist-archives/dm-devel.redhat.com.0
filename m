Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE4E5A9CA0
	for <lists+dm-devel@lfdr.de>; Thu,  1 Sep 2022 18:10:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1662048625;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Mex6s3AGTH0P82t3cqvjcyXmYVxtDN58jcUVndhvfEg=;
	b=f7/F8j3WhCT9AYHdJLD5kiCs8286u8B/XO3GhVVLSGCcQN8etGxKpIo1+mh828Osc9Nl66
	CCszO03a36TFWzkh3iMUKoWQxjAeEANvGAGTbNvQuI5P/7R1qAhQjWHxUAiM9HC21qA8P3
	j2phpJiZ54WK0HotmaPoC66ulCIesXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-546-PZP_o96vOuqYvMwI-szFOg-1; Thu, 01 Sep 2022 12:10:23 -0400
X-MC-Unique: PZP_o96vOuqYvMwI-szFOg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8EBCD80A0BC;
	Thu,  1 Sep 2022 16:10:18 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8F94E40E7F28;
	Thu,  1 Sep 2022 16:10:15 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 6EDB4194B945;
	Thu,  1 Sep 2022 16:10:15 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id D950C194B97A
 for <dm-devel@listman.corp.redhat.com>; Thu,  1 Sep 2022 16:10:13 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id C6AF9492CA4; Thu,  1 Sep 2022 16:10:13 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C3248492CA2
 for <dm-devel@redhat.com>; Thu,  1 Sep 2022 16:10:13 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ABE48101E9BA
 for <dm-devel@redhat.com>; Thu,  1 Sep 2022 16:10:13 +0000 (UTC)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_128_GCM_SHA256) id us-mta-648-XvjW8UBhMQmkxWi8G89Yaw-1; Thu,
 01 Sep 2022 12:10:10 -0400
X-MC-Unique: XvjW8UBhMQmkxWi8G89Yaw-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8FAB422B32;
 Thu,  1 Sep 2022 16:10:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B8AD13A79;
 Thu,  1 Sep 2022 16:10:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MLH1FF/ZEGMPDQAAMHmgww
 (envelope-from <mwilck@suse.com>); Thu, 01 Sep 2022 16:10:07 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  1 Sep 2022 18:09:41 +0200
Message-Id: <20220901160952.2167-6-mwilck@suse.com>
In-Reply-To: <20220901160952.2167-1-mwilck@suse.com>
References: <20220901160952.2167-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Subject: [dm-devel] [PATCH 05/16] libdmmp: Makefile: create man3dir
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
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Without this "make install" may fail.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libdmmp/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libdmmp/Makefile b/libdmmp/Makefile
index 2e99b3e..e458925 100644
--- a/libdmmp/Makefile
+++ b/libdmmp/Makefile
@@ -45,6 +45,7 @@ install:
 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
 	perl -i -pe 's|__INCLUDEDIR__|$(includedir)|g' \
 		$(DESTDIR)$(pkgconfdir)/$(PKGFILE)
+	$(INSTALL_PROGRAM) -d 755 $(DESTDIR)$(man3dir)
 	$(INSTALL_PROGRAM) -m 644 -t $(DESTDIR)$(man3dir) docs/man/*.3
 
 uninstall:
-- 
2.37.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

