Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 5B1B5219E08
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:38:04 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-6thWmsvZMZWbCIcNEEZgVQ-1; Thu, 09 Jul 2020 06:37:04 -0400
X-MC-Unique: 6thWmsvZMZWbCIcNEEZgVQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13576107BF00;
	Thu,  9 Jul 2020 10:36:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E68156FEDB;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6BA1F93F85;
	Thu,  9 Jul 2020 10:36:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AalgU031570 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 740462157F24; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6BE632166BA4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 47CE2100E7C2
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:47 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-485-_e_uyArVNDKecv7fXY3PPQ-1;
	Thu, 09 Jul 2020 06:36:44 -0400
X-MC-Unique: _e_uyArVNDKecv7fXY3PPQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id F3ED8AE84;
	Thu,  9 Jul 2020 10:36:41 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:18 +0200
Message-Id: <20200709103623.8302-8-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AalgU031570
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 49/54] libmultipath: get_refwwid(): get rid of
	"check" label
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This was necessary with with the interspersed pthread_cleanup_push()/pop()
statements, now we can write the code more cleanly.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index c4712d7..defc54b 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1449,32 +1449,23 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 	if (dev_type == DEV_DEVMAP) {
 
 		if (((dm_get_uuid(dev, tmpwwid, WWID_SIZE)) == 0)
-		    && (strlen(tmpwwid))) {
+		    && (strlen(tmpwwid)))
 			refwwid = tmpwwid;
-			goto check;
-		}
 
-		/*
-		 * may be a binding
-		 */
-		if (get_user_friendly_wwid(dev, tmpwwid,
-					   conf->bindings_file) == 0) {
+		/* or may be a binding */
+		else if (get_user_friendly_wwid(dev, tmpwwid,
+						conf->bindings_file) == 0)
 			refwwid = tmpwwid;
-			goto check;
-		}
 
-		/*
-		 * or may be an alias
-		 */
-		refwwid = get_mpe_wwid(conf->mptable, dev);
+		/* or may be an alias */
+		else {
+			refwwid = get_mpe_wwid(conf->mptable, dev);
 
-		/*
-		 * or directly a wwid
-		 */
-		if (!refwwid)
-			refwwid = dev;
+			/* or directly a wwid */
+			if (!refwwid)
+				refwwid = dev;
+		}
 
-check:
 		if (refwwid && strlen(refwwid) &&
 		    filter_wwid(conf->blist_wwid, conf->elist_wwid, refwwid,
 				NULL) > 0)
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

