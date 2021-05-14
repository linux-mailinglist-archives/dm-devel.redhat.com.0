Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 2B8FD381189
	for <lists+dm-devel@lfdr.de>; Fri, 14 May 2021 22:12:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1621023129;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=L26z0X7mibby2s+FYZiCHw5sZkbAFMq4ypbAetjD07M=;
	b=irmpwzWqiL0QtcOCWUpV2s7iJYXhiwwhp4FsAjW0VKJTsXeAEHUMvNpDxafgxnrjNJL1x5
	uFS8R+FZFWC7qei5iW5x+2xZJq1OUoTHLdO/UfEW0ujZo3OISMKHNhm2rbSSmv6glu5AOo
	FY4gGIVAr8R2vzLDtsVeQgjcg6PSBac=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-0af07ggdMiaaNVvsh--tWg-1; Fri, 14 May 2021 16:11:29 -0400
X-MC-Unique: 0af07ggdMiaaNVvsh--tWg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93B4AFC9D;
	Fri, 14 May 2021 20:11:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4193FE14C;
	Fri, 14 May 2021 20:11:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D04A21801028;
	Fri, 14 May 2021 20:11:15 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14EKB8W5010836 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 14 May 2021 16:11:08 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3475E6060F; Fri, 14 May 2021 20:11:08 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 23A4760CF0;
	Fri, 14 May 2021 20:11:07 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 14EKB57w020069; 
	Fri, 14 May 2021 15:11:05 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 14EKB5T9020068;
	Fri, 14 May 2021 15:11:05 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 14 May 2021 15:10:59 -0500
Message-Id: <1621023060-20011-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1621023060-20011-1-git-send-email-bmarzins@redhat.com>
References: <1621023060-20011-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 5/6] kpartx: Don't leak memory when getblock
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

