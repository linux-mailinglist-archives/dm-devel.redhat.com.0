Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 581A8219D70
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:37 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-57KEvTEiMCeh1805X-MdlQ-1; Thu, 09 Jul 2020 06:17:34 -0400
X-MC-Unique: 57KEvTEiMCeh1805X-MdlQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 510D8107AFCC;
	Thu,  9 Jul 2020 10:17:26 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 284502B6DE;
	Thu,  9 Jul 2020 10:17:26 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C8A081806B0A;
	Thu,  9 Jul 2020 10:17:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGwiB029373 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 8CA9F100405F; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 88C0F100405E
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7028D858EE4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-487-Bg1701IxNneV3N-rBlzFJQ-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: Bg1701IxNneV3N-rBlzFJQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D1CB6AB89;
	Thu,  9 Jul 2020 10:16:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:58 +0200
Message-Id: <20200709101620.6786-14-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGwiB029373
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 13/35] libmultipath: constify blacklist code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add "const" qualifiers where appropriate.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/blacklist.c | 34 +++++++++++++++++++---------------
 libmultipath/blacklist.h | 17 +++++++++++------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index db58ccc..4964e70 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -121,7 +121,7 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 }
 
 static int
-match_reglist (vector blist, const char * str)
+match_reglist (const struct _vector *blist, const char *str)
 {
 	int i;
 	struct blentry * ble;
@@ -134,8 +134,8 @@ match_reglist (vector blist, const char * str)
 }
 
 static int
-match_reglist_device (const struct _vector *blist, const char * vendor,
-		    const char * product)
+match_reglist_device (const struct _vector *blist, const char *vendor,
+		      const char * product)
 {
 	int i;
 	struct blentry_device * ble;
@@ -155,8 +155,8 @@ match_reglist_device (const struct _vector *blist, const char * vendor,
 }
 
 static int
-find_blacklist_device (const struct _vector *blist, const char * vendor,
-		       const char * product)
+find_blacklist_device (const struct _vector *blist, const char *vendor,
+		       const char *product)
 {
 	int i;
 	struct blentry_device * ble;
@@ -231,8 +231,9 @@ setup_default_blist (struct config * conf)
 		condlog(lvl, "%s: %s %s", dev, (M), (S))
 
 static void
-log_filter (const char *dev, char *vendor, char *product, char *wwid,
-	    const char *env, const char *protocol, int r, int lvl)
+log_filter (const char *dev, const char *vendor, const char *product,
+	    const char *wwid, const char *env, const char *protocol,
+	    int r, int lvl)
 {
 	/*
 	 * Try to sort from most likely to least.
@@ -277,8 +278,8 @@ log_filter (const char *dev, char *vendor, char *product, char *wwid,
 }
 
 int
-filter_device (vector blist, vector elist, char * vendor, char * product,
-	       char * dev)
+filter_device (const struct _vector *blist, const struct _vector *elist,
+	       const char *vendor, const char * product, const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -294,7 +295,8 @@ filter_device (vector blist, vector elist, char * vendor, char * product,
 }
 
 int
-filter_devnode (vector blist, vector elist, char * dev)
+filter_devnode (const struct _vector *blist, const struct _vector *elist,
+		const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -310,7 +312,8 @@ filter_devnode (vector blist, vector elist, char * dev)
 }
 
 int
-filter_wwid (vector blist, vector elist, char * wwid, char * dev)
+filter_wwid (const struct _vector *blist, const struct _vector *elist,
+	     const char *wwid, const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -326,7 +329,8 @@ filter_wwid (vector blist, vector elist, char * wwid, char * dev)
 }
 
 int
-filter_protocol(vector blist, vector elist, struct path * pp)
+filter_protocol(const struct _vector *blist, const struct _vector *elist,
+		const struct path *pp)
 {
 	char buf[PROTOCOL_BUF_SIZE];
 	int r = MATCH_NOTHING;
@@ -345,7 +349,7 @@ filter_protocol(vector blist, vector elist, struct path * pp)
 }
 
 int
-filter_path (struct config * conf, struct path * pp)
+filter_path (const struct config *conf, const struct path *pp)
 {
 	int r;
 
@@ -367,8 +371,8 @@ filter_path (struct config * conf, struct path * pp)
 }
 
 int
-filter_property(struct config *conf, struct udev_device *udev, int lvl,
-		const char *uid_attribute)
+filter_property(const struct config *conf, struct udev_device *udev,
+		int lvl, const char *uid_attribute)
 {
 	const char *devname = udev_device_get_sysname(udev);
 	struct udev_list_entry *list_entry;
diff --git a/libmultipath/blacklist.h b/libmultipath/blacklist.h
index 4305857..ed079f3 100644
--- a/libmultipath/blacklist.h
+++ b/libmultipath/blacklist.h
@@ -36,12 +36,17 @@ struct blentry_device {
 
 int setup_default_blist (struct config *);
 int alloc_ble_device (vector);
-int filter_devnode (vector, vector, char *);
-int filter_wwid (vector, vector, char *, char *);
-int filter_device (vector, vector, char *, char *, char *);
-int filter_path (struct config *, struct path *);
-int filter_property(struct config *, struct udev_device *, int, const char*);
-int filter_protocol(vector, vector, struct path *);
+int filter_devnode (const struct _vector *, const struct _vector *,
+		    const char *);
+int filter_wwid (const struct _vector *, const struct _vector *,
+		 const char *, const char *);
+int filter_device (const struct _vector *, const struct _vector *,
+		   const char *, const char *, const char *);
+int filter_path (const struct config *, const struct path *);
+int filter_property(const struct config *, struct udev_device *,
+		    int, const char*);
+int filter_protocol(const struct _vector *, const struct _vector *,
+		    const struct path *);
 int store_ble (vector, char *, int);
 int set_ble_device (vector, char *, char *, int);
 void free_blacklist (vector);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

