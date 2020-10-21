Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F3D6929545E
	for <lists+dm-devel@lfdr.de>; Wed, 21 Oct 2020 23:42:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1603316522;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=J+kMJPn7mZ7B8dwe0hCwammhCgnLAZMnU+9zCmoKb0Y=;
	b=A0pbM4BktHvUf8BkW0tcjZEfScaKy/nJjzvPVydNez/quLJkf1iGJys5uLo+epD6H0dieV
	ssx5ciBhs5XuCbPEvqTDfyJWLu89wG7A3PegObhZ3T4NKkHEsFlUni4fjfROQl8/9hCfqN
	jIa/7P/e1Z92Nzeaw0uM0go/yPwxZ1Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-B9L_vdBKOGCzFDBmR4nfGQ-1; Wed, 21 Oct 2020 17:41:59 -0400
X-MC-Unique: B9L_vdBKOGCzFDBmR4nfGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C7507427EA;
	Wed, 21 Oct 2020 21:41:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 819F36EF44;
	Wed, 21 Oct 2020 21:41:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A6ABE181A050;
	Wed, 21 Oct 2020 21:41:50 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09LLdXSR008760 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 21 Oct 2020 17:39:33 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 05A4B5B4C0; Wed, 21 Oct 2020 21:39:33 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E62E5B4BE;
	Wed, 21 Oct 2020 21:39:32 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 09LLdU9p028791; 
	Wed, 21 Oct 2020 16:39:30 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 09LLdUmR028790;
	Wed, 21 Oct 2020 16:39:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 21 Oct 2020 16:39:26 -0500
Message-Id: <1603316366-28735-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
References: <1603316366-28735-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 4/4] libmultipath: change log level for null
	uid_attribute
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 libmultipath/discovery.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index d7e8577f..950b1586 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2084,8 +2084,11 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 			len = strlen(pp->wwid);
 		origin = "callout";
 	} else {
-		bool udev_available = udev && pp->uid_attribute
+		bool valid_uid_attr = pp->uid_attribute
 			&& *pp->uid_attribute;
+		bool empty_uid_attr = pp->uid_attribute
+			&& !*pp->uid_attribute;
+		bool udev_available = udev && valid_uid_attr;
 
 		if (udev_available) {
 			len = get_udev_uid(pp, pp->uid_attribute, udev);
@@ -2095,7 +2098,8 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 		}
 		if ((!udev_available || (len <= 0 && allow_fallback))
 		    && has_uid_fallback(pp)) {
-			used_fallback = 1;
+			if (!udev || !empty_uid_attr)
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

