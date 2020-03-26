Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com [216.205.24.74])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBAC193746
	for <lists+dm-devel@lfdr.de>; Thu, 26 Mar 2020 05:23:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1585196605;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=RxSVfAvrzMY3Yi0U6xas1yS9MIWFn74S5bsqWwbrnG4=;
	b=I3lqI44BdnDsKuZRD87dbhbnmbzmgl8J9CJhDEc4Sm3oGMEwRXDDeZxBrTMFE0nIl1sDHo
	emy1dsTuQYzt0QzjFEYflyrCdbvOphb1hpu8tQllygKwcqtQtyazayJwu8S7GN+m3YdR/L
	Tze3c+Xg7+LPgiUwa3R7sGXrxeUlolU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-27-_49yP_a6NIaHFBK2gKnuSw-1; Thu, 26 Mar 2020 00:23:23 -0400
X-MC-Unique: _49yP_a6NIaHFBK2gKnuSw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E59028017DF;
	Thu, 26 Mar 2020 04:23:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 869015D9CD;
	Thu, 26 Mar 2020 04:23:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6121A1809567;
	Thu, 26 Mar 2020 04:23:06 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 02Q4MsHo003796 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 26 Mar 2020 00:22:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EE05A9B929; Thu, 26 Mar 2020 04:22:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B2F2A0A60;
	Thu, 26 Mar 2020 04:22:52 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 02Q4MpOt023756; 
	Wed, 25 Mar 2020 23:22:51 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 02Q4MoML023755;
	Wed, 25 Mar 2020 23:22:50 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 25 Mar 2020 23:22:47 -0500
Message-Id: <1585196568-23714-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
References: <1585196568-23714-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 2/3] libmutipath: don't close fd on
	dm_lib_release
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If dm_hold_control_open() isn't set, when dm_lib_release() is called, it
will close the control fd. The control fd will get re-opened on the next
dm_task_run() call, but if there is a dm_task_run() call already
in progress in another thread, it can fail. Since many of the
device-mapper callouts happen with the vecs lock held, this wasn't too
noticeable, but there is code that calls dm_task_run() without the
vecs lock held, notably the dmevent waiter code.

Since, as Martin pointed out, dm_hold_control_open() hasn't always
existed in libdevmapper, check if it's supported on compilation,
and update the version requirements if so.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/Makefile    | 4 ++++
 libmultipath/devmapper.c | 7 ++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/libmultipath/Makefile b/libmultipath/Makefile
index e5651e49..ad690a49 100644
--- a/libmultipath/Makefile
+++ b/libmultipath/Makefile
@@ -36,6 +36,10 @@ ifneq ($(call check_func,dm_task_deferred_remove,/usr/include/libdevmapper.h),0)
 	CFLAGS += -DLIBDM_API_DEFERRED
 endif
 
+ifneq ($(call check_func,dm_hold_control_dev,/usr/include/libdevmapper.h),0)
+	CFLAGS += -DLIBDM_API_HOLD_CONTROL
+endif
+
 OBJS = memory.o parser.o vector.o devmapper.o callout.o \
 	hwtable.o blacklist.o util.o dmparser.o config.o \
 	structs.o discovery.o propsel.o dict.o \
diff --git a/libmultipath/devmapper.c b/libmultipath/devmapper.c
index bed8ddc6..13a1cf53 100644
--- a/libmultipath/devmapper.c
+++ b/libmultipath/devmapper.c
@@ -108,7 +108,9 @@ dm_lib_prereq (void)
 {
 	char version[64];
 	int v[3];
-#if defined(LIBDM_API_DEFERRED)
+#if defined(LIBDM_API_HOLD_CONTROL)
+	int minv[3] = {1, 2, 111};
+#elif defined(LIBDM_API_DEFERRED)
 	int minv[3] = {1, 2, 89};
 #elif defined(DM_SUBSYSTEM_UDEV_FLAG0)
 	int minv[3] = {1, 2, 82};
@@ -254,6 +256,9 @@ void libmp_dm_init(void)
 	memcpy(conf->version, version, sizeof(version));
 	put_multipath_config(conf);
 	dm_init(verbosity);
+#ifdef LIBDM_API_HOLD_CONTROL
+	dm_hold_control_dev(1);
+#endif
 	dm_udev_set_sync_support(libmp_dm_udev_sync);
 }
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

