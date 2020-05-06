Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3191C6A25
	for <lists+dm-devel@lfdr.de>; Wed,  6 May 2020 09:37:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1588750629;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Yhu1P1mKsSHqjmLKmGDBIdW9VMZGOCECCF2WvVbxEDQ=;
	b=isuJz/vaRyeFs7IrrtVZMDA34BYXy3XmkvczlY6VyBPNSZ+2GXq8/sUlICADAk+Kmyaa7/
	SvfdOodcGuGFgCvq9pUu9XAcTkCJrLIoa/3pDLHigE12DRERZb5o3RSNn4jnEnN+jM9TLX
	/UjN9ePyjQXf96/ZjM9AZy3amBqtSjU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-mKqTsb32N6e-zdnEpby3JQ-1; Wed, 06 May 2020 03:37:06 -0400
X-MC-Unique: mKqTsb32N6e-zdnEpby3JQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 222EE1895A2A;
	Wed,  6 May 2020 07:37:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DDAC56246F;
	Wed,  6 May 2020 07:36:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8618B1809542;
	Wed,  6 May 2020 07:36:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0467aXfu006993 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 May 2020 03:36:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 07FD12166B27; Wed,  6 May 2020 07:36:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 045EA2157F25
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:36:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13CE91859160
	for <dm-devel@redhat.com>; Wed,  6 May 2020 07:36:31 +0000 (UTC)
Received: from mx.mylinuxtime.de (mx.mylinuxtime.de [195.201.174.144])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-201-agVFjB6hPmKPVLlXQQd2YA-1; Wed, 06 May 2020 03:36:28 -0400
X-MC-Unique: agVFjB6hPmKPVLlXQQd2YA-1
Received: from leda.eworm.de (p54B7927E.dip0.t-ipconnect.de [84.183.146.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
	server-digest SHA256) (No client certificate requested)
	by mx.mylinuxtime.de (Postfix) with ESMTPSA id 120EF100935;
	Wed,  6 May 2020 09:36:24 +0200 (CEST)
Received: by leda.eworm.de (Postfix, from userid 1000)
	id 814A11202F0; Wed,  6 May 2020 09:35:53 +0200 (CEST)
From: Christian Hesse <list@eworm.de>
To: dm-devel@redhat.com
Date: Wed,  6 May 2020 09:35:47 +0200
Message-Id: <20200506073548.41756-1-list@eworm.de>
MIME-Version: 1.0
X-Spam-Status: No, score=2.20
X-Spamd-Bar: ++
X-Rspamd-Server: mx
X-Spam-Level: **
X-Stat-Signature: e1rfi1dfu5uwp77akh9fwpmqkieohn9j
X-Rspamd-Queue-Id: 120EF100935
X-Spamd-Result: default: False [2.20 / 15.00]; ARC_NA(0.00)[];
	GENERIC_REPUTATION(0.00)[-0.39567649543278];
	FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
	R_MISSING_CHARSET(2.50)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_GOOD(-0.10)[text/plain]; BROKEN_CONTENT_TYPE(1.50)[];
	NEURAL_HAM_LONG(-2.85)[-0.950]; DKIM_SIGNED(0.00)[];
	NEURAL_HAM_SHORT(-0.15)[-0.146]; RCPT_COUNT_TWO(0.00)[2];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[list@eworm.de,eworm@leda.eworm.de];
	RCVD_COUNT_ZERO(0.00)[0]; MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:3320, ipnet:84.128.0.0/10, country:DE];
	FROM_NEQ_ENVFROM(0.00)[list@eworm.de,eworm@leda.eworm.de]
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0467aXfu006993
X-loop: dm-devel@redhat.com
Cc: Christian Hesse <mail@eworm.de>
Subject: [dm-devel] [PATCH 1/2] libmpathpersist: depend on libmultipath
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

From: Christian Hesse <mail@eworm.de>

Without this the build fails with:

/usr/bin/ld: cannot find -lmultipath

Signed-off-by: Christian Hesse <mail@eworm.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 1dee3680..ba1d73ba 100644
--- a/Makefile
+++ b/Makefile
@@ -28,7 +28,7 @@ all:	$(BUILDDIRS)
 $(BUILDDIRS):
 	$(MAKE) -C $@
 
-multipath multipathd mpathpersist: libmultipath
+libmpathpersist multipath multipathd mpathpersist: libmultipath
 mpathpersist:  libmpathpersist
 
 $(BUILDDIRS.clean):


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

