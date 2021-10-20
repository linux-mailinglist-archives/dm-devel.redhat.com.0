Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F54353B5
	for <lists+dm-devel@lfdr.de>; Wed, 20 Oct 2021 21:19:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1634757562;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Gcz+iC6f2lWNroc3hDN4/KDT8YEQ+/YGo7Pf8ZZtouI=;
	b=fD6l4AOfrQLakuB8yCqhg3WoMRDb/Xk9tuRSi7VdXxuwYq/I9ofIMIvdhZRIYo6ikTfS+s
	LMIW++p1Lj9gjA3Kv9s8rwqssbC98IyI2RYmEz3bEuQH2AkCWBAqiD1OD7BOwFSoTBXwCZ
	ctls6kXTZVHYvJa0+Wt6TytEoKoM5s4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-165-bECh0fw1Ox-Ed1zM0lstMQ-1; Wed, 20 Oct 2021 15:19:20 -0400
X-MC-Unique: bECh0fw1Ox-Ed1zM0lstMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E88F910A8E00;
	Wed, 20 Oct 2021 19:19:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2DA364188;
	Wed, 20 Oct 2021 19:19:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0F58E1818480;
	Wed, 20 Oct 2021 19:19:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19KJFY8i000623 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 20 Oct 2021 15:15:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 7548C10016FC; Wed, 20 Oct 2021 19:15:34 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5F12A10016F5;
	Wed, 20 Oct 2021 19:15:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 19KJFWvd006081; 
	Wed, 20 Oct 2021 14:15:32 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 19KJFWeq006080;
	Wed, 20 Oct 2021 14:15:32 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 20 Oct 2021 14:15:22 -0500
Message-Id: <1634757322-6015-8-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
References: <1634757322-6015-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 7/7] multipathd: Remove dependency on
	systemd-udev-settle.service
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

multipathd can now handle starting up with incompletely initialized
paths, so it no longer needs to wait for the device Coldplug to
complete. However multipathd may need to write to /etc (for the wwids
and bindings files), so in needs to wait for the root filesystem to
be remounted read/write before starting.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/multipathd.service | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
index 0b2ac814..87cb5349 100644
--- a/multipathd/multipathd.service
+++ b/multipathd/multipathd.service
@@ -1,9 +1,8 @@
 [Unit]
 Description=Device-Mapper Multipath Device Controller
-Wants=systemd-udev-trigger.service systemd-udev-settle.service
 Before=iscsi.service iscsid.service lvm2-activation-early.service
 Before=local-fs-pre.target blk-availability.service shutdown.target
-After=multipathd.socket systemd-udev-trigger.service systemd-udev-settle.service
+After=multipathd.socket systemd-remount-fs.service
 DefaultDependencies=no
 Conflicts=shutdown.target
 ConditionKernelCommandLine=!nompath
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

