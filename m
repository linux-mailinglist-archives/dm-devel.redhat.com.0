Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5D7163D41
	for <lists+dm-devel@lfdr.de>; Wed, 19 Feb 2020 07:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1582095023;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZtG+nzWRjjK9Xu/9zJyFaoapcUj9NPi+ooEoWrB6vYw=;
	b=OZ6AispNnjbSkkakA6PPrjy6pjHi6dOVkgJhOid4WJpJWFEWrz52I3XrvxexvyGl67W4xB
	Ij+nGg8kZNIFzeILaO9cHSLmQrk4ni/6tMJtQ5TpSnJLSEqX3o+bXqTDQ3LzgLTtg8/+Fl
	rr2YOHYh4d2xGmpKtgbqKrJzxToXUKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-MDaKrghaMRGaVbtFtRzCqA-1; Wed, 19 Feb 2020 01:49:26 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24D858018AB;
	Wed, 19 Feb 2020 06:49:18 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF3085D9E2;
	Wed, 19 Feb 2020 06:49:17 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 876CD35B13;
	Wed, 19 Feb 2020 06:49:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 01J6moQb015855 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Feb 2020 01:48:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id D1E6A5DA60; Wed, 19 Feb 2020 06:48:50 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1955D9E2;
	Wed, 19 Feb 2020 06:48:50 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 01J6mndl009941; 
	Wed, 19 Feb 2020 00:48:49 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 01J6mn5N009940;
	Wed, 19 Feb 2020 00:48:49 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 19 Feb 2020 00:48:27 -0600
Message-Id: <1582094920-9883-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
References: <1582094920-9883-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 05/18] libmultipath: constify get_unaligned_be*
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: MDaKrghaMRGaVbtFtRzCqA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/unaligned.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/unaligned.h b/libmultipath/unaligned.h
index 68c07742..b9eaa7cb 100644
--- a/libmultipath/unaligned.h
+++ b/libmultipath/unaligned.h
@@ -10,14 +10,14 @@ static inline uint16_t get_unaligned_be16(const void *ptr)
 	return p[0] << 8 | p[1];
 }
 
-static inline uint32_t get_unaligned_be32(void *ptr)
+static inline uint32_t get_unaligned_be32(const void *ptr)
 {
 	const uint8_t *p = ptr;
 
 	return p[0] << 24 | p[1] << 16 | p[2] << 8 | p[3];
 }
 
-static inline uint64_t get_unaligned_be64(void *ptr)
+static inline uint64_t get_unaligned_be64(const void *ptr)
 {
 	uint32_t low = get_unaligned_be32(ptr + 4);
 	uint64_t high = get_unaligned_be32(ptr);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

