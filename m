Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5744B8066
	for <lists+dm-devel@lfdr.de>; Wed, 16 Feb 2022 07:15:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644992132;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=rSt6PvlxRwIIHG6+soD+yin3FZVrIt2SMxeLRRqxSQk=;
	b=daPC1mogZRtvgb17oFjHGdLpX9+Z7kM8LA3YvRJ2k64VsQNlKZIx8f2hrvu3+zj+W84uLc
	talDX52iNCyRgL47Xq6zf4lBAhhcuoiD0zrT1APdcghl+7fxbZpg/cDE1Ix4FLvonakp9U
	GzrSJ6r0Y7w4FawuavU5wLWrHK4dgNQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-OMsKho0zN8-L3C6BjEoQWA-1; Wed, 16 Feb 2022 01:15:29 -0500
X-MC-Unique: OMsKho0zN8-L3C6BjEoQWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DEAEA801B04;
	Wed, 16 Feb 2022 06:15:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 034B84E2D5;
	Wed, 16 Feb 2022 06:15:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A8C7E4BB7C;
	Wed, 16 Feb 2022 06:15:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21G6CgST017197 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 16 Feb 2022 01:12:43 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EF9935DBAE; Wed, 16 Feb 2022 06:12:42 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4123F5DB99;
	Wed, 16 Feb 2022 06:12:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 21G6CUqW007786; 
	Wed, 16 Feb 2022 00:12:30 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 21G6CTuM007785;
	Wed, 16 Feb 2022 00:12:29 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 16 Feb 2022 00:12:29 -0600
Message-Id: <1644991949-7748-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: fix printing native nvme multipath
	topology.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since commit 2f05df4 ("libmultipath: use strbuf in print.c"), when
multipath prints the topology of native nvme devices, instead of
printing the multipath device information, it prints "w [G]:d s". This
is because nvme_style() switched from calling snprintf(), which supports
format specifiers, to append_strbuf_str(), which doesn't, while still
keeping the same string, "%%w [%%G]:%%d %%s". Remove the extra percent
signs, since they don't need to be escaped in append_strbuf_str().

Fixes: 2f05df4 ("libmultipath: use strbuf in print.c")
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/foreign/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/foreign/nvme.c b/libmultipath/foreign/nvme.c
index 499b881d..838e1164 100644
--- a/libmultipath/foreign/nvme.c
+++ b/libmultipath/foreign/nvme.c
@@ -337,7 +337,7 @@ static int snprint_nvme_pg(const struct gen_pathgroup *gmp,
 static int nvme_style(__attribute__((unused)) const struct gen_multipath* gm,
 		      struct strbuf *buf, __attribute__((unused)) int verbosity)
 {
-	return append_strbuf_str(buf, "%%w [%%G]:%%d %%s");
+	return append_strbuf_str(buf, "%w [%G]:%d %s");
 }
 
 static const struct gen_multipath_ops nvme_map_ops = {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

