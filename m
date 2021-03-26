Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 48A1D349E45
	for <lists+dm-devel@lfdr.de>; Fri, 26 Mar 2021 01:57:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616720224;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eS4YzlZJy9ZxJP+WqqM6qQULe+yOaJFgFMeJoEeuCMM=;
	b=EArOVdvi8a26FRb9ixu54k7nIxgt1gL1fnNiUGgi1N1Kwf9jHVerjDXoIuuaf9s61hhvqq
	tVP7nxAgK8NUsAorbKw7JT3B/+xJkIoBqyVZyx2W8bxv21IQUwkH3a2qFZKG6zBLPGCQRC
	2yk9ClswuRwezUvTZcwiXGdz6RYUAlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-9Nt8k9fKO7Wna87AS3xFcQ-1; Thu, 25 Mar 2021 20:57:01 -0400
X-MC-Unique: 9Nt8k9fKO7Wna87AS3xFcQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 875E7107B7CF;
	Fri, 26 Mar 2021 00:56:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 601956E407;
	Fri, 26 Mar 2021 00:56:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E25484BB7C;
	Fri, 26 Mar 2021 00:56:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 12Q0qrM5019152 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 25 Mar 2021 20:52:53 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DFAEE5D9E3; Fri, 26 Mar 2021 00:52:53 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EAD15D9D0;
	Fri, 26 Mar 2021 00:52:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 12Q0qmQK010263; 
	Thu, 25 Mar 2021 19:52:48 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 12Q0qlXT010262;
	Thu, 25 Mar 2021 19:52:47 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 25 Mar 2021 19:52:43 -0500
Message-Id: <1616719966-10221-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
References: <1616719966-10221-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/4] libmultipath: avoid infinite loop with bad
	vpd page 83 identifier
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

If a device with a scsi name identifier has an unknown prefix,
parse_vpd_pg83() needs to advance to the next identifier, instead of
simply trying the same one again in an infinite loop.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index f216a724..5727f7a6 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1157,7 +1157,7 @@ parse_vpd_pg83(const unsigned char *in, size_t in_len,
 			if (memcmp(d + 4, "eui.", 4) &&
 			    memcmp(d + 4, "naa.", 4) &&
 			    memcmp(d + 4, "iqn.", 4))
-				continue;
+				break;
 			if (prio < 4) {
 				prio = 4;
 				vpd = d;
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

