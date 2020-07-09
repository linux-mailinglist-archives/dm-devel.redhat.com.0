Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 68B92219DFE
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:37:11 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-TDavXgqTMsqv19LLz8uskw-1; Thu, 09 Jul 2020 06:37:07 -0400
X-MC-Unique: TDavXgqTMsqv19LLz8uskw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C94D388C928;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A09EE27CDF;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 594861809557;
	Thu,  9 Jul 2020 10:36:55 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AanCf031628 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:36:49 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 9EBDB5F24D; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AB0D4C821
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82759858EE9
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:36:49 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-263-O_R8K0jINOu_rPfFe8QZiw-1;
	Thu, 09 Jul 2020 06:36:45 -0400
X-MC-Unique: O_R8K0jINOu_rPfFe8QZiw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3CCC8AE65;
	Thu,  9 Jul 2020 10:36:43 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:36:23 +0200
Message-Id: <20200709103623.8302-13-mwilck@suse.com>
In-Reply-To: <20200709103623.8302-1-mwilck@suse.com>
References: <20200709103623.8302-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AanCf031628
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 54/54] libmultipath: get_refwwid(): skip
	strchop(), and constify dev parameter
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

With the previous change, we can safely assume that strchop() has been
called already where appropriate (the only caller is multipath's
configure()). We can now use const char* for the "dev" parameter.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/configure.c | 6 +++---
 libmultipath/configure.h | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/libmultipath/configure.c b/libmultipath/configure.c
index 7461e99..48426cd 100644
--- a/libmultipath/configure.c
+++ b/libmultipath/configure.c
@@ -1344,7 +1344,8 @@ struct udev_device *get_udev_device(const char *dev, enum devtypes dev_type)
 	return ud;
 }
 
-static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
+static int _get_refwwid(enum mpath_cmds cmd, const char *dev,
+			enum devtypes dev_type,
 			vector pathvec, struct config *conf, char **wwid)
 {
 	int ret = 1;
@@ -1379,7 +1380,6 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 		goto common;
 
 	case DEV_DEVT:
-		strchop(dev);
 		pp = find_path_by_devt(pathvec, dev);
 		goto common;
 
@@ -1451,7 +1451,7 @@ static int _get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
 /*
  * Returns: PATHINFO_OK, PATHINFO_FAILED, or PATHINFO_SKIPPED (see pathinfo())
  */
-int get_refwwid(enum mpath_cmds cmd, char *dev, enum devtypes dev_type,
+int get_refwwid(enum mpath_cmds cmd, const char *dev, enum devtypes dev_type,
 		vector pathvec, char **wwid)
 
 {
diff --git a/libmultipath/configure.h b/libmultipath/configure.h
index 0e33bf4..d9a7de6 100644
--- a/libmultipath/configure.h
+++ b/libmultipath/configure.h
@@ -52,7 +52,7 @@ int setup_map (struct multipath * mpp, char * params, int params_size,
 int domap (struct multipath * mpp, char * params, int is_daemon);
 int reinstate_paths (struct multipath *mpp);
 int coalesce_paths (struct vectors *vecs, vector curmp, char * refwwid, int force_reload, enum mpath_cmds cmd);
-int get_refwwid (enum mpath_cmds cmd, char * dev, enum devtypes dev_type,
+int get_refwwid (enum mpath_cmds cmd, const char *dev, enum devtypes dev_type,
 		 vector pathvec, char **wwid);
 int reload_map(struct vectors *vecs, struct multipath *mpp, int refresh, int is_daemon);
 struct udev_device *get_udev_device(const char *dev, enum devtypes dev_type);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

