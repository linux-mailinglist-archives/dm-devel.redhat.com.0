Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6C8B406AD4
	for <lists+dm-devel@lfdr.de>; Fri, 10 Sep 2021 13:43:30 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-V7Kh2wjxNga5TFE4QKStNg-1; Fri, 10 Sep 2021 07:43:28 -0400
X-MC-Unique: V7Kh2wjxNga5TFE4QKStNg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83113108469A;
	Fri, 10 Sep 2021 11:43:21 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 643835453A;
	Fri, 10 Sep 2021 11:43:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1EA064EA3A;
	Fri, 10 Sep 2021 11:43:21 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 18ABgw0O010175 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 10 Sep 2021 07:42:59 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C47BF10BFD79; Fri, 10 Sep 2021 11:42:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB8CA10BC2B7
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:56 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CBFD187506B
	for <dm-devel@redhat.com>; Fri, 10 Sep 2021 11:42:56 +0000 (UTC)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-56-duFFDYk2O-mkYSgyUEOS9g-1; Fri, 10 Sep 2021 07:42:52 -0400
X-MC-Unique: duFFDYk2O-mkYSgyUEOS9g-1
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A503C20061;
	Fri, 10 Sep 2021 11:42:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature ECDSA (P-521) server-digest
	SHA512) (No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5676013D34;
	Fri, 10 Sep 2021 11:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA id iJf1ErtEO2GPOAAAMHmgww
	(envelope-from <mwilck@suse.com>); Fri, 10 Sep 2021 11:42:51 +0000
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Fri, 10 Sep 2021 13:40:50 +0200
Message-Id: <20210910114120.13665-6-mwilck@suse.com>
In-Reply-To: <20210910114120.13665-1-mwilck@suse.com>
References: <20210910114120.13665-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 18ABgw0O010175
X-loop: dm-devel@redhat.com
Cc: lixiaokeng@huawei.com, Chongyun Wu <wu.chongyun@h3c.com>,
	dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 05/35] libmultipath: improve cleanup of uevent
	queues on exit
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
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

uevents listed on merge_node must be cleaned up, too. uevents
cancelled while being serviced and temporary queues, likewise.
The global uevq must be cleaned out in the uevent listener thread,
because it might have added events after the dispatcher thread
had already finished.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/uevent.c | 49 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 37 insertions(+), 12 deletions(-)

diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index 4265904..082e891 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -91,16 +91,25 @@ struct uevent * alloc_uevent (void)
 	return uev;
 }
 
+static void uevq_cleanup(struct list_head *tmpq);
+
+static void cleanup_uev(void *arg)
+{
+	struct uevent *uev = arg;
+
+	uevq_cleanup(&uev->merge_node);
+	if (uev->udev)
+		udev_device_unref(uev->udev);
+	FREE(uev);
+}
+
 static void uevq_cleanup(struct list_head *tmpq)
 {
 	struct uevent *uev, *tmp;
 
 	list_for_each_entry_safe(uev, tmp, tmpq, node) {
 		list_del_init(&uev->node);
-
-		if (uev->udev)
-			udev_device_unref(uev->udev);
-		FREE(uev);
+		cleanup_uev(uev);
 	}
 }
 
@@ -384,14 +393,10 @@ service_uevq(struct list_head *tmpq)
 	list_for_each_entry_safe(uev, tmp, tmpq, node) {
 		list_del_init(&uev->node);
 
+		pthread_cleanup_push(cleanup_uev, uev);
 		if (my_uev_trigger && my_uev_trigger(uev, my_trigger_data))
 			condlog(0, "uevent trigger error");
-
-		uevq_cleanup(&uev->merge_node);
-
-		if (uev->udev)
-			udev_device_unref(uev->udev);
-		FREE(uev);
+		pthread_cleanup_pop(1);
 	}
 }
 
@@ -411,6 +416,18 @@ static void monitor_cleanup(void *arg)
 	udev_monitor_unref(monitor);
 }
 
+static void cleanup_uevq(void *arg)
+{
+	uevq_cleanup(arg);
+}
+
+static void cleanup_global_uevq(void *arg __attribute__((unused)))
+{
+	pthread_mutex_lock(uevq_lockp);
+	uevq_cleanup(&uevq);
+	pthread_mutex_unlock(uevq_lockp);
+}
+
 /*
  * Service the uevent queue.
  */
@@ -425,6 +442,7 @@ int uevent_dispatch(int (*uev_trigger)(struct uevent *, void * trigger_data),
 	while (1) {
 		LIST_HEAD(uevq_tmp);
 
+		pthread_cleanup_push(cleanup_mutex, uevq_lockp);
 		pthread_mutex_lock(uevq_lockp);
 		servicing_uev = 0;
 		/*
@@ -436,14 +454,17 @@ int uevent_dispatch(int (*uev_trigger)(struct uevent *, void * trigger_data),
 		}
 		servicing_uev = 1;
 		list_splice_init(&uevq, &uevq_tmp);
-		pthread_mutex_unlock(uevq_lockp);
+		pthread_cleanup_pop(1);
+
 		if (!my_uev_trigger)
 			break;
+
+		pthread_cleanup_push(cleanup_uevq, &uevq_tmp);
 		merge_uevq(&uevq_tmp);
 		service_uevq(&uevq_tmp);
+		pthread_cleanup_pop(1);
 	}
 	condlog(3, "Terminating uev service queue");
-	uevq_cleanup(&uevq);
 	return 0;
 }
 
@@ -600,6 +621,8 @@ int uevent_listen(struct udev *udev)
 
 	events = 0;
 	gettimeofday(&start_time, NULL);
+	pthread_cleanup_push(cleanup_global_uevq, NULL);
+	pthread_cleanup_push(cleanup_uevq, &uevlisten_tmp);
 	while (1) {
 		struct uevent *uev;
 		struct udev_device *dev;
@@ -650,6 +673,8 @@ int uevent_listen(struct udev *udev)
 		gettimeofday(&start_time, NULL);
 		timeout = 30;
 	}
+	pthread_cleanup_pop(1);
+	pthread_cleanup_pop(1);
 out:
 	pthread_cleanup_pop(1);
 out_udev:
-- 
2.33.0


--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

