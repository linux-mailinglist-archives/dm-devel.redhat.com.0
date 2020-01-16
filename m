Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5053513FBBE
	for <lists+dm-devel@lfdr.de>; Thu, 16 Jan 2020 22:55:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1579211713;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=0VAXGh5+Bq4ykoXCr25PTcztwcKNFx/FwYNBhi242zE=;
	b=g4RMbzrLU2rNltYaVhERVQyImzhaMMLtF6agSvzgnwbpRZxkGufpff/zAHEx+6TOUS0fOt
	2r/aYWtIg64Pzq+pCDaZ4qVkb4wB7weapf/QYO4wuDT7YsjJEhprxtpsNy2QGGC9AUq6Wt
	hxqLxdwW0z8FRRKS3lvoTVS1XCk6lKU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-155-pPohYb8GMbWVuaoa_jNuvg-1; Thu, 16 Jan 2020 16:55:11 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C5A9183B546;
	Thu, 16 Jan 2020 21:55:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 701DA5C1D8;
	Thu, 16 Jan 2020 21:54:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BD5D118089CD;
	Thu, 16 Jan 2020 21:54:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 00GLsHVG018472 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 16 Jan 2020 16:54:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 756E310065CA; Thu, 16 Jan 2020 21:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7175410065DD
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 21:54:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A38A2802A7B
	for <dm-devel@redhat.com>; Thu, 16 Jan 2020 21:54:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-357-9_NraC6mMiKhJRk4ABH15w-1;
	Thu, 16 Jan 2020 16:54:13 -0500
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id D2FC1BAC1;
	Thu, 16 Jan 2020 21:54:11 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu, 16 Jan 2020 22:55:14 +0100
Message-Id: <20200116215514.20718-1-mwilck@suse.com>
MIME-Version: 1.0
X-MC-Unique: 9_NraC6mMiKhJRk4ABH15w-1
X-MC-Unique: pPohYb8GMbWVuaoa_jNuvg-1
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 00GLsHVG018472
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: fix compilation with -fno-common
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

This never-used variable must be declared extern in order to avoid
a link stage error with -fno-common.
---
 libmultipath/structs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/structs.h b/libmultipath/structs.h
index a3adf906..4bb567d3 100644
--- a/libmultipath/structs.h
+++ b/libmultipath/structs.h
@@ -106,7 +106,7 @@ enum yes_no_undef_states {
  * _FIND_MULTIPATHS_F must have the same value as YNU_YES.
  * Generate a compile time error if that isn't the case.
  */
-char ___error1___[-(_FIND_MULTIPATHS_F != YNU_YES)];
+extern char ___error1___[-(_FIND_MULTIPATHS_F != YNU_YES)];
 
 #define find_multipaths_on(conf) \
 	(!!((conf)->find_multipaths & _FIND_MULTIPATHS_F))
-- 
2.24.1


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

