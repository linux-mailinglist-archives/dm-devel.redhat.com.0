Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F00EC276815
	for <lists+dm-devel@lfdr.de>; Thu, 24 Sep 2020 07:01:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600923664;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=6M9wvLANak0uZMqn9+XTa6D9AMy+mzglsTjmkVcYXIY=;
	b=L4o287TjKKwOaxH05DzV/LLzA/3AE1lJBoU58MXzO1j/A50F6XX7Sg8vJ3OMhH5/MVSGm8
	2G33xB9ZilU8uYcvJ9XfUg525+g49KrwBJ3h8gA5mhPWWugpydKOQ6xPPtkn02vLQCRHvV
	Kc+mE1VxHzR0IJDb9yCZMIZEFhkTRKg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-NXlZM_RfMh6mdXu_IsU_2g-1; Thu, 24 Sep 2020 01:00:03 -0400
X-MC-Unique: NXlZM_RfMh6mdXu_IsU_2g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 190E9800FFF;
	Thu, 24 Sep 2020 04:59:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC5F65C1C7;
	Thu, 24 Sep 2020 04:59:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 79B85180B656;
	Thu, 24 Sep 2020 04:59:57 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08O4xcoU024623 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Sep 2020 00:59:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6624A5D990; Thu, 24 Sep 2020 04:59:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B46055D733;
	Thu, 24 Sep 2020 04:59:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08O4xXOV017462; 
	Wed, 23 Sep 2020 23:59:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08O4xXYO017461;
	Wed, 23 Sep 2020 23:59:33 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 23 Sep 2020 23:59:29 -0500
Message-Id: <1600923569-17412-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
References: <1600923569-17412-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [RFC PATCH v2 3/3] libmultipath: change log level for
	null uid_attribute
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If uid_attribute is explicitly set to an empty string, multipath should
log the uid at the default log level, since using the fallback code is
the expected behavior.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index f650534f..435f2639 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2091,7 +2091,8 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 		}
 		if ((!udev_available || (len <= 0 && allow_fallback))
 		    && has_uid_fallback(pp)) {
-			used_fallback = 1;
+			if (udev_available || !(udev && pp->uid_attribute))
+				used_fallback = 1;
 			len = uid_fallback(pp, path_state, &origin);
 		}
 	}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

