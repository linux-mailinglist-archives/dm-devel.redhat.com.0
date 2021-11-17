Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D41454F3D
	for <lists+dm-devel@lfdr.de>; Wed, 17 Nov 2021 22:22:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1637184123;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=lkuqnqEIlm5vMkNLAmZC+My27Luftfsvn6pADc9LFAc=;
	b=eh6Zmp+g2iN2Pzktt26k5qf0ebVmK0kQpEkT8jX+Qe4kz3FWJxbSmv2YbQyZjVYXul2jOM
	JgCS3ZRTi2B39o3ReoQY7Vjnb63QRUubD8Y0XdLLMkbszCWgE6jdpQ8F63HDblI+3cTaPq
	sWK2hfFPmUmIbLEJhgv0J2WyBwblvFw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-_Q-FpHU-MMCQ04NVDUMAXQ-1; Wed, 17 Nov 2021 16:22:01 -0500
X-MC-Unique: _Q-FpHU-MMCQ04NVDUMAXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BAC441808304;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9EF8B10023B8;
	Wed, 17 Nov 2021 21:21:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 77B134E58E;
	Wed, 17 Nov 2021 21:21:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AHLLbRK025287 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 17 Nov 2021 16:21:37 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id DEE0960C4A; Wed, 17 Nov 2021 21:21:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AC24F60CC3;
	Wed, 17 Nov 2021 21:21:37 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AHLLZhl004951; 
	Wed, 17 Nov 2021 15:21:36 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AHLLZg2004950;
	Wed, 17 Nov 2021 15:21:35 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 17 Nov 2021 15:21:23 -0600
Message-Id: <1637184084-4882-9-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
References: <1637184084-4882-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 8/9] multipathd: Remove dependency on
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Reviewed-by: Martin Wilck <mwilck@suse.com>
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

