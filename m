Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0C279153887
	for <lists+dm-devel@lfdr.de>; Wed,  5 Feb 2020 19:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1580929130;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ZtG+nzWRjjK9Xu/9zJyFaoapcUj9NPi+ooEoWrB6vYw=;
	b=gsE/sGo6aex4kUTsBXD2YlklqXEb6C81cUo8Q2Xl0uKEZQyMS+ua5j4Eb/LHwlmjQZzcYt
	iEF3ace2HSw2rNHLqKtAy8c2DqoLSqVrSv3x6wxBNE0btMMe9s7nFtGEycgyQcdkGaJf/d
	sG4F/MCnfmIH0V7WB9GC/1rY3PVpEnA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-leaLrIj1PiyukAw3aoz-2A-1; Wed, 05 Feb 2020 13:58:45 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 599AEDB9C;
	Wed,  5 Feb 2020 18:58:38 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2FBE319756;
	Wed,  5 Feb 2020 18:58:38 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AD47C85CE7;
	Wed,  5 Feb 2020 18:58:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 015IwTES019405 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 5 Feb 2020 13:58:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CF75A60C81; Wed,  5 Feb 2020 18:58:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B862E60C63;
	Wed,  5 Feb 2020 18:58:29 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 015IwSFT032670; 
	Wed, 5 Feb 2020 12:58:28 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 015IwSmk032668;
	Wed, 5 Feb 2020 12:58:28 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  5 Feb 2020 12:58:09 -0600
Message-Id: <1580929100-32572-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
References: <1580929100-32572-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 06/17] libmultipath: constify get_unaligned_be*
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: leaLrIj1PiyukAw3aoz-2A-1
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

