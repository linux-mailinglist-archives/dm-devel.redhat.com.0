Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 3F2DB249F60
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:18:13 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-192-QouzIjeOPNCYo8pOYr0uDw-1; Wed, 19 Aug 2020 09:18:09 -0400
X-MC-Unique: QouzIjeOPNCYo8pOYr0uDw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22D4D1009472;
	Wed, 19 Aug 2020 13:18:04 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F39A10013C2;
	Wed, 19 Aug 2020 13:18:03 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 4D976662AE;
	Wed, 19 Aug 2020 13:17:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDHjvt020799 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:17:45 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9B7712017E80; Wed, 19 Aug 2020 13:17:45 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827ED2022789
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:17:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81174801224
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:17:42 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-551-XyvQngdzNlip5owCyDGw1A-1;
	Wed, 19 Aug 2020 09:17:39 -0400
X-MC-Unique: XyvQngdzNlip5owCyDGw1A-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A041BACC6;
	Wed, 19 Aug 2020 13:18:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:17:20 +0200
Message-Id: <20200819131720.13290-2-mwilck@suse.com>
In-Reply-To: <20200819131720.13290-1-mwilck@suse.com>
References: <20200819131720.13290-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDHjvt020799
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 13/35] libmultipath: constify blacklist code
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Add "const" qualifiers where appropriate.

Reviewed-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/blacklist.c | 34 +++++++++++++++++++---------------
 libmultipath/blacklist.h | 17 +++++++++++------
 2 files changed, 30 insertions(+), 21 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index e39a7f8..6c6a597 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -139,7 +139,7 @@ out:
 }
 
 static int
-match_reglist (vector blist, const char * str)
+match_reglist (const struct _vector *blist, const char *str)
 {
 	int i;
 	struct blentry * ble;
@@ -152,8 +152,8 @@ match_reglist (vector blist, const char * str)
 }
 
 static int
-match_reglist_device (const struct _vector *blist, const char * vendor,
-		    const char * product)
+match_reglist_device (const struct _vector *blist, const char *vendor,
+		      const char * product)
 {
 	int i;
 	struct blentry_device * ble;
@@ -173,8 +173,8 @@ match_reglist_device (const struct _vector *blist, const char * vendor,
 }
 
 static int
-find_blacklist_device (const struct _vector *blist, const char * vendor,
-		       const char * product)
+find_blacklist_device (const struct _vector *blist, const char *vendor,
+		       const char *product)
 {
 	int i;
 	struct blentry_device * ble;
@@ -240,8 +240,9 @@ setup_default_blist (struct config * conf)
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
@@ -286,8 +287,8 @@ log_filter (const char *dev, char *vendor, char *product, char *wwid,
 }
 
 int
-filter_device (vector blist, vector elist, char * vendor, char * product,
-	       char * dev)
+filter_device (const struct _vector *blist, const struct _vector *elist,
+	       const char *vendor, const char * product, const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -303,7 +304,8 @@ filter_device (vector blist, vector elist, char * vendor, char * product,
 }
 
 int
-filter_devnode (vector blist, vector elist, char * dev)
+filter_devnode (const struct _vector *blist, const struct _vector *elist,
+		const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -319,7 +321,8 @@ filter_devnode (vector blist, vector elist, char * dev)
 }
 
 int
-filter_wwid (vector blist, vector elist, char * wwid, char * dev)
+filter_wwid (const struct _vector *blist, const struct _vector *elist,
+	     const char *wwid, const char *dev)
 {
 	int r = MATCH_NOTHING;
 
@@ -335,7 +338,8 @@ filter_wwid (vector blist, vector elist, char * wwid, char * dev)
 }
 
 int
-filter_protocol(vector blist, vector elist, struct path * pp)
+filter_protocol(const struct _vector *blist, const struct _vector *elist,
+		const struct path *pp)
 {
 	char buf[PROTOCOL_BUF_SIZE];
 	int r = MATCH_NOTHING;
@@ -354,7 +358,7 @@ filter_protocol(vector blist, vector elist, struct path * pp)
 }
 
 int
-filter_path (struct config * conf, struct path * pp)
+filter_path (const struct config *conf, const struct path *pp)
 {
 	int r;
 
@@ -376,8 +380,8 @@ filter_path (struct config * conf, struct path * pp)
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
index b08e097..dde5cea 100644
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
 int store_ble (vector, const char *, int);
 int set_ble_device (vector, const char *, const char *, int);
 void free_blacklist (vector);
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

