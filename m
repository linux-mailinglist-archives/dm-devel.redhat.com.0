Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4BE812428D4
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:36:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-458-dCr5MbhIPiSDTFGuRT542A-1; Wed, 12 Aug 2020 07:36:32 -0400
X-MC-Unique: dCr5MbhIPiSDTFGuRT542A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 845E1102C854;
	Wed, 12 Aug 2020 11:36:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 629A75D6BD;
	Wed, 12 Aug 2020 11:36:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 1C0F2181A270;
	Wed, 12 Aug 2020 11:36:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBaImC029011 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:36:18 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id E04B72166BA4; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DBFB22166BA3
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C446280015B
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:36:17 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-102-vDBQTHFnOnmNcPHmnfK2DA-1;
	Wed, 12 Aug 2020 07:36:13 -0400
X-MC-Unique: vDBQTHFnOnmNcPHmnfK2DA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4613BB711;
	Wed, 12 Aug 2020 11:36:33 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:36:00 +0200
Message-Id: <20200812113601.26658-4-mwilck@suse.com>
In-Reply-To: <20200812113601.26658-1-mwilck@suse.com>
References: <20200812113601.26658-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBaImC029011
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 83/84] libmultipath: alias: static const
	variable for BINDINGS_FILE_HEADER
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

... and fixup the header file.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 17 ++++++++++++++---
 libmultipath/alias.h | 12 ++++--------
 2 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index 35f1beb..0759c4e 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -37,6 +37,17 @@
  * See the file COPYING included with this distribution for more details.
  */
 
+#define BINDINGS_FILE_HEADER		\
+"# Multipath bindings, Version : 1.0\n" \
+"# NOTE: this file is automatically maintained by the multipath program.\n" \
+"# You should not need to edit this file in normal circumstances.\n" \
+"#\n" \
+"# Format:\n" \
+"# alias wwid\n" \
+"#\n"
+
+static const char bindings_file_header[] = BINDINGS_FILE_HEADER;
+
 int
 valid_alias(const char *alias)
 {
@@ -287,7 +298,7 @@ use_existing_alias (const char *wwid, const char *file, const char *alias_old,
 	char buff[WWID_SIZE];
 	FILE *f;
 
-	fd = open_file(file, &can_write, BINDINGS_FILE_HEADER);
+	fd = open_file(file, &can_write, bindings_file_header);
 	if (fd < 0)
 		return NULL;
 
@@ -361,7 +372,7 @@ get_user_friendly_alias(const char *wwid, const char *file, const char *prefix,
 		return NULL;
 	}
 
-	fd = open_file(file, &can_write, BINDINGS_FILE_HEADER);
+	fd = open_file(file, &can_write, bindings_file_header);
 	if (fd < 0)
 		return NULL;
 
@@ -406,7 +417,7 @@ get_user_friendly_wwid(const char *alias, char *buff, const char *file)
 		return -1;
 	}
 
-	fd = open_file(file, &unused, BINDINGS_FILE_HEADER);
+	fd = open_file(file, &unused, bindings_file_header);
 	if (fd < 0)
 		return -1;
 
diff --git a/libmultipath/alias.h b/libmultipath/alias.h
index 7c4b302..236b3ba 100644
--- a/libmultipath/alias.h
+++ b/libmultipath/alias.h
@@ -1,11 +1,5 @@
-#define BINDINGS_FILE_HEADER \
-"# Multipath bindings, Version : 1.0\n" \
-"# NOTE: this file is automatically maintained by the multipath program.\n" \
-"# You should not need to edit this file in normal circumstances.\n" \
-"#\n" \
-"# Format:\n" \
-"# alias wwid\n" \
-"#\n"
+#ifndef _ALIAS_H
+#define _ALIAS_H
 
 int valid_alias(const char *alias);
 char *get_user_friendly_alias(const char *wwid, const char *file,
@@ -15,3 +9,5 @@ int get_user_friendly_wwid(const char *alias, char *buff, const char *file);
 char *use_existing_alias (const char *wwid, const char *file,
 			  const char *alias_old,
 			  const char *prefix, int bindings_read_only);
+
+#endif /* _ALIAS_H */
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

