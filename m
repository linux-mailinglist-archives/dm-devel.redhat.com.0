Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 724B037FC71
	for <lists+dm-devel@lfdr.de>; Thu, 13 May 2021 19:24:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1620926644;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L26z0X7mibby2s+FYZiCHw5sZkbAFMq4ypbAetjD07M=;
	b=g2OtoJibw4etRIb8KbLYvr7BAUrURTo8biGKNLLuLV0RVmd9p6N7YHCFpfg5MjiRz8pZoS
	vkgCW0cAOq7oapiZoKdswt0f6hoXTqLQoSenl7a9lz0hf6PawjCaQcXV6CHn4dM/OthU/b
	xfR+CFi885SNlQeIOeVaaGd4ExAf12E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-vL8_FY2zNaarCAqg_EA3ig-1; Thu, 13 May 2021 13:23:58 -0400
X-MC-Unique: vL8_FY2zNaarCAqg_EA3ig-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04B87801B1A;
	Thu, 13 May 2021 17:23:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C80FF1971B;
	Thu, 13 May 2021 17:23:41 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3329318005B6;
	Thu, 13 May 2021 17:23:41 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14DHNOs6005663 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 13 May 2021 13:23:24 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id ABC035D9FC; Thu, 13 May 2021 17:23:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 93F945D9DC;
	Thu, 13 May 2021 17:23:24 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14DHNNSH012087; 
	Thu, 13 May 2021 12:23:23 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14DHNMB3012086;
	Thu, 13 May 2021 12:23:22 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 13 May 2021 12:23:14 -0500
Message-Id: <1620926595-12029-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
References: <1620926595-12029-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 5/6] kpartx: Don't leak memory when getblock
	returns NULL
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a new block was allocated, but couldn't be filled, getblock will
discard it. When it does so, it needs to free the block to avoid leaking
memory. Found by coverity.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
---
 kpartx/kpartx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kpartx/kpartx.c b/kpartx/kpartx.c
index 8ff116b8..7bc64543 100644
--- a/kpartx/kpartx.c
+++ b/kpartx/kpartx.c
@@ -766,6 +766,8 @@ getblock (int fd, unsigned int blknr) {
 	if (read(fd, bp->block, secsz) != secsz) {
 		fprintf(stderr, "read error, sector %d\n", secnr);
 		blockhead = bp->next;
+		free(bp->block);
+		free(bp);
 		return NULL;
 	}
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

