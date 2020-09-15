Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 0E25826AFD6
	for <lists+dm-devel@lfdr.de>; Tue, 15 Sep 2020 23:45:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1600206339;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ASvanrRUyefm/o2xv5J40lZDZuyZc9S7E19oP4lTHLk=;
	b=Kvw61yiTS/XSHRE9Q/8A3XrInE5th7vhCGOuu7mQP9W8GkMc7aQB9TtwT8AndVcvb/6TUD
	dbSWWZ4khuuFEU+KXUAt7Xo+qU0zdVhE52MgZBju+hehBoidkTSRkBb3wuE0caAC9ndfIV
	2LFjrvCsnAOswtTZR5/QZd2hlOotx5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-z3ptxVBZMX6mSrCPB1iHLg-1; Tue, 15 Sep 2020 17:45:36 -0400
X-MC-Unique: z3ptxVBZMX6mSrCPB1iHLg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A33BE1074655;
	Tue, 15 Sep 2020 21:45:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8455F78801;
	Tue, 15 Sep 2020 21:45:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 41C0918338EF;
	Tue, 15 Sep 2020 21:45:31 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08FLjMQC031427 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 15 Sep 2020 17:45:22 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 675B17839F; Tue, 15 Sep 2020 21:45:22 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 050A078803;
	Tue, 15 Sep 2020 21:45:18 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 08FLjHps006549; 
	Tue, 15 Sep 2020 16:45:17 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 08FLjH6k006548;
	Tue, 15 Sep 2020 16:45:17 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 15 Sep 2020 16:45:12 -0500
Message-Id: <1600206312-6497-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
References: <1600206312-6497-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 3/3] libmultipath: add ignore_udev_uid option
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Setting this option to yes will force multipath to get the uid by using
the fallback sysfs methods, instead of getting it from udev. This will
cause devices that can't get their uid from the standard locations to
not get a uid. It will also disable uevent merging.

It will not stop uevents from being resent for device that failed to
get a WWID, although I'm on the fence about the benefit of this.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/config.h      |  1 +
 libmultipath/dict.c        |  4 ++++
 libmultipath/discovery.c   | 17 +++++++++++------
 libmultipath/discovery.h   |  8 +++++++-
 libmultipath/uevent.c      |  2 +-
 multipath/multipath.conf.5 | 13 +++++++++++++
 multipathd/main.c          |  7 ++++++-
 7 files changed, 43 insertions(+), 9 deletions(-)

diff --git a/libmultipath/config.h b/libmultipath/config.h
index 2bb7153b..4ad905f5 100644
--- a/libmultipath/config.h
+++ b/libmultipath/config.h
@@ -191,6 +191,7 @@ struct config {
 	int find_multipaths_timeout;
 	int marginal_pathgroups;
 	int skip_delegate;
+	int ignore_udev_uid;
 	unsigned int version[3];
 	unsigned int sequence_nr;
 
diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index feabae56..79de5d3b 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -1391,6 +1391,9 @@ declare_hw_snprint(all_tg_pt, print_yes_no_undef)
 declare_def_handler(marginal_pathgroups, set_yes_no)
 declare_def_snprint(marginal_pathgroups, print_yes_no)
 
+declare_def_handler(ignore_udev_uid, set_yes_no)
+declare_def_snprint(ignore_udev_uid, print_yes_no)
+
 static int
 def_uxsock_timeout_handler(struct config *conf, vector strvec)
 {
@@ -1807,6 +1810,7 @@ init_keywords(vector keywords)
 	install_keyword("enable_foreign", &def_enable_foreign_handler,
 			&snprint_def_enable_foreign);
 	install_keyword("marginal_pathgroups", &def_marginal_pathgroups_handler, &snprint_def_marginal_pathgroups);
+	install_keyword("ignore_udev_uid", &def_ignore_udev_uid_handler, &snprint_def_ignore_udev_uid);
 	__deprecated install_keyword("default_selector", &def_selector_handler, NULL);
 	__deprecated install_keyword("default_path_grouping_policy", &def_pgpolicy_handler, NULL);
 	__deprecated install_keyword("default_uid_attribute", &def_uid_attribute_handler, NULL);
diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index 2096fb48..5c0188ba 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -2043,7 +2043,7 @@ static bool has_uid_fallback(struct path *pp)
 
 int
 get_uid (struct path * pp, int path_state, struct udev_device *udev,
-	 int allow_fallback)
+	 int fallback)
 {
 	char *c;
 	const char *origin = "unknown";
@@ -2076,7 +2076,9 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 		} else
 			len = strlen(pp->wwid);
 		origin = "callout";
-	} else {
+	} else if (fallback == UID_FALLBACK_FORCE)
+		len = uid_fallback(pp, path_state, &origin);
+	else {
 		bool udev_available = udev && pp->uid_attribute
 			&& *pp->uid_attribute;
 
@@ -2086,8 +2088,9 @@ get_uid (struct path * pp, int path_state, struct udev_device *udev,
 			if (len == 0)
 				condlog(1, "%s: empty udev uid", pp->dev);
 		}
-		if ((!udev_available || (len <= 0 && allow_fallback))
-		    && has_uid_fallback(pp)) {
+		if ((!udev_available ||
+		     (len <= 0 && fallback == UID_FALLBACK_ALLOW)) &&
+		    has_uid_fallback(pp)) {
 			used_fallback = 1;
 			len = uid_fallback(pp, path_state, &origin);
 		}
@@ -2231,8 +2234,10 @@ int pathinfo(struct path *pp, struct config *conf, int mask)
 	}
 
 	if ((mask & DI_WWID) && !strlen(pp->wwid)) {
-		get_uid(pp, path_state, pp->udev,
-			(pp->retriggers >= conf->retrigger_tries));
+		int fallback = conf->ignore_udev_uid? UID_FALLBACK_FORCE :
+			       (pp->retriggers >= conf->retrigger_tries)?
+			       UID_FALLBACK_ALLOW : UID_FALLBACK_NONE;
+		get_uid(pp, path_state, pp->udev, fallback);
 		if (!strlen(pp->wwid)) {
 			if (pp->bus == SYSFS_BUS_UNDEF)
 				return PATHINFO_SKIPPED;
diff --git a/libmultipath/discovery.h b/libmultipath/discovery.h
index 6444887d..ca8542d6 100644
--- a/libmultipath/discovery.h
+++ b/libmultipath/discovery.h
@@ -54,8 +54,14 @@ ssize_t sysfs_get_inquiry(struct udev_device *udev,
 			  unsigned char *buff, size_t len);
 int sysfs_get_asymmetric_access_state(struct path *pp,
 				      char *buff, int buflen);
+
+enum {
+	UID_FALLBACK_NONE,
+	UID_FALLBACK_ALLOW,
+	UID_FALLBACK_FORCE,
+};
 int get_uid(struct path * pp, int path_state, struct udev_device *udev,
-	    int allow_fallback);
+	    int fallback);
 
 /*
  * discovery bitmask
diff --git a/libmultipath/uevent.c b/libmultipath/uevent.c
index d3061bf8..05c8543b 100644
--- a/libmultipath/uevent.c
+++ b/libmultipath/uevent.c
@@ -177,7 +177,7 @@ static bool uevent_need_merge(void)
 	bool need_merge = false;
 
 	conf = get_multipath_config();
-	if (VECTOR_SIZE(&conf->uid_attrs) > 0)
+	if (!conf->ignore_udev_uid && VECTOR_SIZE(&conf->uid_attrs) > 0)
 		need_merge = true;
 	put_multipath_config(conf);
 
diff --git a/multipath/multipath.conf.5 b/multipath/multipath.conf.5
index 5adaced6..b2920df5 100644
--- a/multipath/multipath.conf.5
+++ b/multipath/multipath.conf.5
@@ -286,6 +286,19 @@ The default is: \fB<unset>\fR
 .
 .
 .TP
+.B ignore_udev_uid
+Setting this option to yes will force multipath to ignore the the uid_attrs
+and uid_attribute settings, and generate the WWID by the \fIsysfs\fR
+method. This will cause devices that cannot get their WWID from the standard
+locations for their device type to not get a WWID; see \fBWWID generation\fR
+below.
+.RS
+.TP
+The default is: \fBno\fR
+.RE
+.
+.
+.TP
 .B prio
 The name of the path priority routine. The specified routine
 should return a numeric value specifying the relative priority
diff --git a/multipathd/main.c b/multipathd/main.c
index f7229a7d..c522b045 100644
--- a/multipathd/main.c
+++ b/multipathd/main.c
@@ -1279,6 +1279,7 @@ uev_update_path (struct uevent *uev, struct vectors * vecs)
 	if (pp) {
 		struct multipath *mpp = pp->mpp;
 		char wwid[WWID_SIZE];
+		int fallback;
 
 		if (pp->initialized == INIT_REQUESTED_UDEV) {
 			needs_reinit = 1;
@@ -1290,7 +1291,11 @@ uev_update_path (struct uevent *uev, struct vectors * vecs)
 			goto out;
 
 		strcpy(wwid, pp->wwid);
-		rc = get_uid(pp, pp->state, uev->udev, 0);
+		conf = get_multipath_config();
+		fallback = conf->ignore_udev_uid? UID_FALLBACK_FORCE:
+			   UID_FALLBACK_NONE;
+		put_multipath_config(conf);
+		rc = get_uid(pp, pp->state, uev->udev, fallback);
 
 		if (rc != 0)
 			strcpy(pp->wwid, wwid);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

