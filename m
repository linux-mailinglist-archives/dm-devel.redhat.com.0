Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 734461F48ED
	for <lists+dm-devel@lfdr.de>; Tue,  9 Jun 2020 23:36:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1591738617;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=QQrjoXp906mde0fVnmbxAIfF3dq12mUzRubFwLKhvsM=;
	b=GxYBlg6EaQlX0cFlL1pqq5BEXncwlhoha2WJoi+c4vo6KQMvXsIpHRKrvWivGNIetddOTA
	3uTTrdIGVIVdo1bbGsCKuOK2h5O86e11XNLByLTweAE3RMT50gJlrnXTizT+vahxGr37es
	s0yXj88HUSgCfMXAiJmQxraTXT4FKgQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-460-cDtGki8kOw608tzta-AyFg-1; Tue, 09 Jun 2020 17:36:54 -0400
X-MC-Unique: cDtGki8kOw608tzta-AyFg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 844928015CE;
	Tue,  9 Jun 2020 21:36:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1765E7BFE3;
	Tue,  9 Jun 2020 21:36:47 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 943C41809547;
	Tue,  9 Jun 2020 21:36:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 059LZcr4029291 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 9 Jun 2020 17:35:38 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 276835D9F1; Tue,  9 Jun 2020 21:35:38 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 016FE5D9E5;
	Tue,  9 Jun 2020 21:35:34 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 059LZXZg026850; 
	Tue, 9 Jun 2020 16:35:33 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 059LZU0b026849;
	Tue, 9 Jun 2020 16:35:30 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  9 Jun 2020 16:35:27 -0500
Message-Id: <1591738529-26810-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
References: <1591738529-26810-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Nikhil Kshirsagar <nkshirsa@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/3] libmultipath: remove
	_blacklist_exceptions functions
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

_blacklist_exceptions() and _blacklist_exceptions_device() are exactly
the same as _blacklist() and _blacklist_device(), so remove them, and
give the remaining functions to a more general name.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/blacklist.c | 62 ++++++++++------------------------------
 1 file changed, 15 insertions(+), 47 deletions(-)

diff --git a/libmultipath/blacklist.c b/libmultipath/blacklist.c
index 00e8dbdb..c21a0e27 100644
--- a/libmultipath/blacklist.c
+++ b/libmultipath/blacklist.c
@@ -101,21 +101,8 @@ int set_ble_device(vector blist, char * vendor, char * product, int origin)
 	return 0;
 }
 
-int
-_blacklist_exceptions (vector elist, const char * str)
-{
-	int i;
-	struct blentry * ele;
-
-	vector_foreach_slot (elist, ele, i) {
-		if (!regexec(&ele->regex, str, 0, NULL, 0))
-			return 1;
-	}
-	return 0;
-}
-
-int
-_blacklist (vector blist, const char * str)
+static int
+match_reglist (vector blist, const char * str)
 {
 	int i;
 	struct blentry * ble;
@@ -127,28 +114,9 @@ _blacklist (vector blist, const char * str)
 	return 0;
 }
 
-int
-_blacklist_exceptions_device(const struct _vector *elist, const char * vendor,
-			     const char * product)
-{
-	int i;
-	struct blentry_device * ble;
-
-	vector_foreach_slot (elist, ble, i) {
-		if (!ble->vendor && !ble->product)
-			continue;
-		if ((!ble->vendor ||
-		     !regexec(&ble->vendor_reg, vendor, 0, NULL, 0)) &&
-		    (!ble->product ||
-		     !regexec(&ble->product_reg, product, 0, NULL, 0)))
-			return 1;
-	}
-	return 0;
-}
-
-int
-_blacklist_device (const struct _vector *blist, const char * vendor,
-		   const char * product)
+static int
+match_reglist_device (const struct _vector *blist, const char * vendor,
+		    const char * product)
 {
 	int i;
 	struct blentry_device * ble;
@@ -300,9 +268,9 @@ filter_device (vector blist, vector elist, char * vendor, char * product,
 	int r = MATCH_NOTHING;
 
 	if (vendor && product) {
-		if (_blacklist_exceptions_device(elist, vendor, product))
+		if (match_reglist_device(elist, vendor, product))
 			r = MATCH_DEVICE_BLIST_EXCEPT;
-		else if (_blacklist_device(blist, vendor, product))
+		else if (match_reglist_device(blist, vendor, product))
 			r = MATCH_DEVICE_BLIST;
 	}
 
@@ -316,9 +284,9 @@ filter_devnode (vector blist, vector elist, char * dev)
 	int r = MATCH_NOTHING;
 
 	if (dev) {
-		if (_blacklist_exceptions(elist, dev))
+		if (match_reglist(elist, dev))
 			r = MATCH_DEVNODE_BLIST_EXCEPT;
-		else if (_blacklist(blist, dev))
+		else if (match_reglist(blist, dev))
 			r = MATCH_DEVNODE_BLIST;
 	}
 
@@ -332,9 +300,9 @@ filter_wwid (vector blist, vector elist, char * wwid, char * dev)
 	int r = MATCH_NOTHING;
 
 	if (wwid) {
-		if (_blacklist_exceptions(elist, wwid))
+		if (match_reglist(elist, wwid))
 			r = MATCH_WWID_BLIST_EXCEPT;
-		else if (_blacklist(blist, wwid))
+		else if (match_reglist(blist, wwid))
 			r = MATCH_WWID_BLIST;
 	}
 
@@ -351,9 +319,9 @@ filter_protocol(vector blist, vector elist, struct path * pp)
 	if (pp) {
 		snprint_path_protocol(buf, sizeof(buf), pp);
 
-		if (_blacklist_exceptions(elist, buf))
+		if (match_reglist(elist, buf))
 			r = MATCH_PROTOCOL_BLIST_EXCEPT;
-		else if (_blacklist(blist, buf))
+		else if (match_reglist(blist, buf))
 			r = MATCH_PROTOCOL_BLIST;
 	}
 
@@ -422,11 +390,11 @@ filter_property(struct config *conf, struct udev_device *udev, int lvl,
 			if (check_missing_prop && !strcmp(env, uid_attribute))
 				uid_attr_seen = true;
 
-			if (_blacklist_exceptions(conf->elist_property, env)) {
+			if (match_reglist(conf->elist_property, env)) {
 				r = MATCH_PROPERTY_BLIST_EXCEPT;
 				break;
 			}
-			if (_blacklist(conf->blist_property, env)) {
+			if (match_reglist(conf->blist_property, env)) {
 				r = MATCH_PROPERTY_BLIST;
 				break;
 			}
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

