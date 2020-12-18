Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 97F6F2DEBD9
	for <lists+dm-devel@lfdr.de>; Sat, 19 Dec 2020 00:07:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608332833;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=n2V0OJeE4Q9lzNYvbECYWdZ1JcnC5/NGb18Z7RP2sjE=;
	b=PRcYMS06pgImBXR9ss9pnfO3wqEzzbnZOmtP7OnSiSEprEAibQlUaXrNh4e0vwpkXCqAkK
	q6hjbZ0Xh4jaXyKoNaKzU05cdhXdo954aiudDRJkudyn4cYzWgcwnW58GDr8AxmZ9NkIxD
	u5LTOIqH44mzJt/zWNqi/BIlUUMMgUE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-izPApzD-PTyK4lc7igfupQ-1; Fri, 18 Dec 2020 18:07:11 -0500
X-MC-Unique: izPApzD-PTyK4lc7igfupQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BEAC88049C1;
	Fri, 18 Dec 2020 23:07:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9C63D5D9D7;
	Fri, 18 Dec 2020 23:07:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 52EA31809CA1;
	Fri, 18 Dec 2020 23:07:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BIN6q0I026996 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 18 Dec 2020 18:06:52 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 6D6DF37A0; Fri, 18 Dec 2020 23:06:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 110AF5D769;
	Fri, 18 Dec 2020 23:06:49 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BIN6lMW009778; 
	Fri, 18 Dec 2020 17:06:47 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BIN6lpE009777;
	Fri, 18 Dec 2020 17:06:47 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Fri, 18 Dec 2020 17:06:41 -0600
Message-Id: <1608332802-9720-6-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
References: <1608332802-9720-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 5/6] multipathd: Fix multipathd stopping on
	shutdown
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
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

According to man "systemd.special"

"shutdown.target: ... Services that shall be terminated on system
shutdown shall add Conflicts= and Before= dependencies to this unit for
their service unit, which is implicitly done when
DefaultDependencies=yes is set (the default)."

multipathd.service sets DefaultDependencies=no and includes the
Conflits= dependency, but not the Before= one. This can cause multipathd
to continue running past when it is supposed to during shutdown.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 multipathd/multipathd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multipathd/multipathd.service b/multipathd/multipathd.service
index ba24983e..7d547fa7 100644
--- a/multipathd/multipathd.service
+++ b/multipathd/multipathd.service
@@ -2,7 +2,7 @@
 Description=Device-Mapper Multipath Device Controller
 Wants=systemd-udev-trigger.service systemd-udev-settle.service
 Before=iscsi.service iscsid.service lvm2-activation-early.service
-Before=local-fs-pre.target blk-availability.service
+Before=local-fs-pre.target blk-availability.service shutdown.target
 After=multipathd.socket systemd-udev-trigger.service systemd-udev-settle.service
 DefaultDependencies=no
 Conflicts=shutdown.target
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

