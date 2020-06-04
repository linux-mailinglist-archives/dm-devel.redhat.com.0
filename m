Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 007821F03D8
	for <lists+dm-devel@lfdr.de>; Sat,  6 Jun 2020 02:23:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591402982;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=r+/OlT1+MPqaRjq4554+T1Nz/ljWMhd0oMEPC0UrsdM=;
	b=cthriJRWF4ZfuUHrXk8Le/jnGkj9coGL6mK5hhugM9gxq99p2gKP2YIagblidZHPtQlW2y
	zcDMT5kR0AaxPRQHSXviSCuMveoAob2C03BE88BAQtT7W2ePsWiWuaIpyE5MlT8XBOUkvb
	bNUek4DyehjxgYLv6+fDzhErqFcwGus=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-u1A6SS36MoCV-EYCbzkIhw-1; Fri, 05 Jun 2020 20:22:41 -0400
X-MC-Unique: u1A6SS36MoCV-EYCbzkIhw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6FE4F107B7D0;
	Sat,  6 Jun 2020 00:22:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F63E81651;
	Sat,  6 Jun 2020 00:22:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0CA571809557;
	Sat,  6 Jun 2020 00:22:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 054NKB3m026729 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 4 Jun 2020 19:20:11 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BC9AB7A8CD; Thu,  4 Jun 2020 23:20:11 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1292A797F9;
	Thu,  4 Jun 2020 23:20:08 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 054NK7SL025148; 
	Thu, 4 Jun 2020 18:20:07 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 054NK68P025147;
	Thu, 4 Jun 2020 18:20:06 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu,  4 Jun 2020 18:20:06 -0500
Message-Id: <1591312806-25110-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH] libmultipath: fix condlog NULL argument in
	uevent_get_env_var
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

uevent_get_env_var() could call condlog with p == NULL. On gcc 10,
this triggers warnings like:

In file included from uevent.c:47:
In function 'uevent_get_env_var',
    inlined from 'uevent_get_wwid' at uevent.c:170:8:
debug.h:13:2: error: '%s' directive argument is null
[-Werror=format-overflow=]
   13 |  dlog(logsink, prio, fmt "\n", ##args)
      |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
uevent.c:132:2: note: in expansion of macro 'condlog'
  132 |  condlog(4, "%s: %s -> '%s'", __func__, attr, p);
      |  ^~~~~~~
uevent.c: In function 'uevent_get_wwid':
uevent.c:132:25: note: format string is defined here
  132 |  condlog(4, "%s: %s -> '%s'", __func__, attr, p);
      |                         ^~

If p is NULL, use "(null)" instead.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/uevent.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index d38e8a7f..e0d13b11 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -129,7 +129,7 @@ static const char* uevent_get_env_var(const struct uevent *uev,
 		}
 	}
 
-	condlog(4, "%s: %s -> '%s'", __func__, attr, p);
+	condlog(4, "%s: %s -> '%s'", __func__, attr, p ?: "(null)");
 	return p;
 
 invalid:
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

