Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E0AA53DAE7D
	for <lists+dm-devel@lfdr.de>; Thu, 29 Jul 2021 23:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1627595247;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=pwRrMoIma3w6Au/xQ2WAQxCKDZx77jPk0JEzDc1TRdE=;
	b=MUWh4Qusgj5MuN2D5U4T+G9J4wzDVuzTswgx+6oygQo60zOsdf2xVw/oUxvJygw+OO5S3H
	PsYn9pW6xI8DN5r+h0kPpqa0oKGMdEpksjAoPcgYBtmWOw5vEwRaKJs9A0F0pnm7p66z11
	LKmBQajYaWy8Ej7ob5WAux27YifD6sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-T9nA8S63PaKUSW3jGAFGsA-1; Thu, 29 Jul 2021 17:47:25 -0400
X-MC-Unique: T9nA8S63PaKUSW3jGAFGsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D190D100CA94;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B5149710C4;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 441334A7CA;
	Thu, 29 Jul 2021 21:47:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 16TLkEgW030909 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 29 Jul 2021 17:46:15 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EDD164A66; Thu, 29 Jul 2021 21:46:14 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 742431A26A;
	Thu, 29 Jul 2021 21:46:10 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 16TLk8Ye020022; 
	Thu, 29 Jul 2021 16:46:09 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 16TLk8NM020021;
	Thu, 29 Jul 2021 16:46:08 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 29 Jul 2021 16:46:01 -0500
Message-Id: <1627595165-19980-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
References: <1627595165-19980-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/5] multipath.conf: fix typo in ghost_delay
	description
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/multipath.conf.5 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 064e4826..d6b8c7f6 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -1251,7 +1251,7 @@ The default is: in \fB/sys/block/<dev>/queue/max_sectors_kb\fR
 Sets the number of seconds that multipath will wait after creating a device
 with only ghost paths before marking it ready for use in systemd. This gives
 the active paths time to appear before the multipath runs the hardware handler
-to switch the ghost paths to active ones. Setting this to \fI0\fR or \fIon\fR
+to switch the ghost paths to active ones. Setting this to \fI0\fR or \fIno\fR
 makes multipath immediately mark a device with only ghost paths as ready.
 .RS
 .TP
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

