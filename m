Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 81A1D219D7A
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-SURMyfQhOb2y6XNjeiG4rw-1; Thu, 09 Jul 2020 06:17:44 -0400
X-MC-Unique: SURMyfQhOb2y6XNjeiG4rw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 41F8B88C7A3;
	Thu,  9 Jul 2020 10:17:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 224A65C3E7;
	Thu,  9 Jul 2020 10:17:36 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D43C593F90;
	Thu,  9 Jul 2020 10:17:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AH2JM029499 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:17:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 475FE1000DAA; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 436D5114B2F6
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B1B7858EE9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:17:02 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-450-4ROECJhPPcaurSSZfuyk2Q-1;
	Thu, 09 Jul 2020 06:16:57 -0400
X-MC-Unique: 4ROECJhPPcaurSSZfuyk2Q-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D1E16B087;
	Thu,  9 Jul 2020 10:16:54 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:16:03 +0200
Message-Id: <20200709101620.6786-19-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AH2JM029499
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 18/35] libmultipath: uevent: use static linkage
	where possible
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Most of the symbols in uevent.c can be converted to static linkage.
alloc_uevent() and uevent_get_wwid() are called in the unit test
and added to the header file.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/uevent.c | 45 ++++++++++++++++++++-----------------------
 libmultipath/uevent.h |  2 ++
 tests/uevent.c        |  4 ----
 3 files changed, 23 insertions(+), 28 deletions(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index 6a3f8bd..d74389e 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -60,14 +60,14 @@
 
 typedef int (uev_trigger)(struct uevent *, void * trigger_data);
 
-LIST_HEAD(uevq);
-pthread_mutex_t uevq_lock = PTHREAD_MUTEX_INITIALIZER;
-pthread_mutex_t *uevq_lockp = &uevq_lock;
-pthread_cond_t uev_cond = PTHREAD_COND_INITIALIZER;
-pthread_cond_t *uev_condp = &uev_cond;
-uev_trigger *my_uev_trigger;
-void * my_trigger_data;
-int servicing_uev;
+static LIST_HEAD(uevq);
+static pthread_mutex_t uevq_lock = PTHREAD_MUTEX_INITIALIZER;
+static pthread_mutex_t *uevq_lockp = &uevq_lock;
+static pthread_cond_t uev_cond = PTHREAD_COND_INITIALIZER;
+static pthread_cond_t *uev_condp = &uev_cond;
+static uev_trigger *my_uev_trigger;
+static void *my_trigger_data;
+static int servicing_uev;
 
 int is_uevent_busy(void)
 {
@@ -91,8 +91,7 @@ struct uevent * alloc_uevent (void)
 	return uev;
 }
 
-void
-uevq_cleanup(struct list_head *tmpq)
+static void uevq_cleanup(struct list_head *tmpq)
 {
 	struct uevent *uev, *tmp;
 
@@ -172,8 +171,7 @@ uevent_get_wwid(struct uevent *uev)
 		uev->wwid = val;
 }
 
-bool
-uevent_need_merge(void)
+static bool uevent_need_merge(void)
 {
 	struct config * conf;
 	bool need_merge = false;
@@ -186,8 +184,7 @@ uevent_need_merge(void)
 	return need_merge;
 }
 
-bool
-uevent_can_discard(struct uevent *uev)
+static bool uevent_can_discard(struct uevent *uev)
 {
 	int invalid = 0;
 	struct config * conf;
@@ -212,7 +209,7 @@ uevent_can_discard(struct uevent *uev)
 	return false;
 }
 
-bool
+static bool
 uevent_can_filter(struct uevent *earlier, struct uevent *later)
 {
 
@@ -246,7 +243,7 @@ uevent_can_filter(struct uevent *earlier, struct uevent *later)
 	return false;
 }
 
-bool
+static bool
 merge_need_stop(struct uevent *earlier, struct uevent *later)
 {
 	/*
@@ -283,7 +280,7 @@ merge_need_stop(struct uevent *earlier, struct uevent *later)
 	return false;
 }
 
-bool
+static bool
 uevent_can_merge(struct uevent *earlier, struct uevent *later)
 {
 	/* merge paths uevents
@@ -302,7 +299,7 @@ uevent_can_merge(struct uevent *earlier, struct uevent *later)
 	return false;
 }
 
-void
+static void
 uevent_prepare(struct list_head *tmpq)
 {
 	struct uevent *uev, *tmp;
@@ -322,7 +319,7 @@ uevent_prepare(struct list_head *tmpq)
 	}
 }
 
-void
+static void
 uevent_filter(struct uevent *later, struct list_head *tmpq)
 {
 	struct uevent *earlier, *tmp;
@@ -345,7 +342,7 @@ uevent_filter(struct uevent *later, struct list_head *tmpq)
 	}
 }
 
-void
+static void
 uevent_merge(struct uevent *later, struct list_head *tmpq)
 {
 	struct uevent *earlier, *tmp;
@@ -366,7 +363,7 @@ uevent_merge(struct uevent *later, struct list_head *tmpq)
 	}
 }
 
-void
+static void
 merge_uevq(struct list_head *tmpq)
 {
 	struct uevent *later;
@@ -379,7 +376,7 @@ merge_uevq(struct list_head *tmpq)
 	}
 }
 
-void
+static void
 service_uevq(struct list_head *tmpq)
 {
 	struct uevent *uev, *tmp;
@@ -450,7 +447,7 @@ int uevent_dispatch(int (*uev_trigger)(struct uevent *, void * trigger_data),
 	return 0;
 }
 
-struct uevent *uevent_from_udev_device(struct udev_device *dev)
+static struct uevent *uevent_from_udev_device(struct udev_device *dev)
 {
 	struct uevent *uev;
 	int i = 0;
@@ -512,7 +509,7 @@ struct uevent *uevent_from_udev_device(struct udev_device *dev)
 	return uev;
 }
 
-bool uevent_burst(struct timeval *start_time, int events)
+static bool uevent_burst(struct timeval *start_time, int events)
 {
 	struct timeval diff_time, end_time;
 	unsigned long speed;
diff --git a/libmultipath/uevent.h b/libmultipath/uevent.h
index 4956bfc..9a5b213 100644
--- a/libmultipath/uevent.h
+++ b/libmultipath/uevent.h
@@ -24,6 +24,7 @@ struct uevent {
 	char *envp[HOTPLUG_NUM_ENVP];
 };
 
+struct uevent *alloc_uevent(void);
 int is_uevent_busy(void);
 
 int uevent_listen(struct udev *udev);
@@ -36,5 +37,6 @@ char *uevent_get_dm_name(const struct uevent *uev);
 char *uevent_get_dm_path(const struct uevent *uev);
 char *uevent_get_dm_action(const struct uevent *uev);
 bool uevent_is_mpath(const struct uevent *uev);
+void uevent_get_wwid(struct uevent *uev);
 
 #endif /* _UEVENT_H */
diff --git a/tests/uevent.c b/tests/uevent.c
index f4afd9b..9ffcd2d 100644
--- a/tests/uevent.c
+++ b/tests/uevent.c
@@ -27,10 +27,6 @@
 
 #include "globals.c"
 
-/* Private prototypes missing in uevent.h */
-struct uevent * alloc_uevent(void);
-void uevent_get_wwid(struct uevent *uev);
-
 /* Stringify helpers */
 #define _str_(x) #x
 #define str(x) _str_(x)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

