Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id A23D21FDA33
	for <lists+dm-devel@lfdr.de>; Thu, 18 Jun 2020 02:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1592439963;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=FcAXNZqeLDTUeJ6UIiRt9oud5lRwXpa2yRV3ajP0fbM=;
	b=Wsjzo7Fdfo+0mVoN+FGQpWeQIISa5WW0yzzXL3O3cbRb62EnFYj3QQ9x8eRaHCZXu9msqD
	/evLrxV4XKs+tIOPXvnYdN/GC3/CxUc9Oc5upn2XXyEopaM0OcdCzBVo3AAkGuu1Yt2QwM
	BOV/W10Ip12PyQU/6GI2YA8VXcEtZBc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-7LqDvO0kPUOcIA2H7hscDQ-1; Wed, 17 Jun 2020 20:25:08 -0400
X-MC-Unique: 7LqDvO0kPUOcIA2H7hscDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 143B4835B41;
	Thu, 18 Jun 2020 00:25:03 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E67CA7CACF;
	Thu, 18 Jun 2020 00:25:02 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A678B1809554;
	Thu, 18 Jun 2020 00:25:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 05I0OdRm026546 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Jun 2020 20:24:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id AD2F47CAAA; Thu, 18 Jun 2020 00:24:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EA2C4709D7;
	Thu, 18 Jun 2020 00:24:36 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 05I0OZRX018489; 
	Wed, 17 Jun 2020 19:24:35 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 05I0OZo1018488;
	Wed, 17 Jun 2020 19:24:35 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Jun 2020 19:24:26 -0500
Message-Id: <1592439867-18427-7-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
References: <1592439867-18427-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 6/7] multipath: delegate flushing maps to
	multipathd
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

Since there can be problems with removing maps outside of multipathd,
multipath should attempt to delegate this command to multipathd.
However, multipathd doesn't attempt to suspend the device, in order
to avoid potential hangs. If delegating to multipathd fails, multipath
should try the remove itself.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipath/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/multipath/main.c b/multipath/main.c
index 101fd656..6a24e483 100644
--- a/multipath/main.c
+++ b/multipath/main.c
@@ -820,6 +820,20 @@ int delegate_to_multipathd(enum mpath_cmds cmd,
 	if (cmd == CMD_CREATE && conf->force_reload == FORCE_RELOAD_YES) {
 		p += snprintf(p, n, "reconfigure");
 	}
+	else if (cmd == CMD_FLUSH_ONE && dev && dev_type == DEV_DEVMAP) {
+		p += snprintf(p, n, "del map %s", dev);
+		/* multipathd doesn't try as hard, to avoid potentially
+		 * hanging. If it fails, retry with the regular multipath
+		 * command */
+		r = NOT_DELEGATED;
+	}
+	else if (cmd == CMD_FLUSH_ALL) {
+		p += snprintf(p, n, "del maps");
+		/* multipathd doesn't try as hard, to avoid potentially
+		 * hanging. If it fails, retry with the regular multipath
+		 * command */
+		r = NOT_DELEGATED;
+	}
 	/* Add other translations here */
 
 	if (strlen(command) == 0)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

