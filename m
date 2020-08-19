Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id 25A18249F68
	for <lists+dm-devel@lfdr.de>; Wed, 19 Aug 2020 15:19:01 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-191-Dm6MKXN_O1abxhVYfGbilw-1; Wed, 19 Aug 2020 09:18:57 -0400
X-MC-Unique: Dm6MKXN_O1abxhVYfGbilw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A34F9801AFA;
	Wed, 19 Aug 2020 13:18:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7EEBE19C4F;
	Wed, 19 Aug 2020 13:18:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 3DED6662B2;
	Wed, 19 Aug 2020 13:18:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07JDIlgj020952 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 19 Aug 2020 09:18:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2A9CBA9EFC; Wed, 19 Aug 2020 13:18:47 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 24B24CF63C
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:44 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A5739811633
	for <dm-devel@redhat.com>; Wed, 19 Aug 2020 13:18:44 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-568-ZpGrOkkzMey3hnE97_j_ag-1;
	Wed, 19 Aug 2020 09:18:39 -0400
X-MC-Unique: ZpGrOkkzMey3hnE97_j_ag-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 5D87FACCC;
	Wed, 19 Aug 2020 13:19:04 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 19 Aug 2020 15:18:17 +0200
Message-Id: <20200819131819.13493-3-mwilck@suse.com>
In-Reply-To: <20200819131819.13493-1-mwilck@suse.com>
References: <20200819131819.13493-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07JDIlgj020952
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v3 85/87] libmultipath: alias.c: use strtok_r()
	instead of strtok()
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
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

... for thread-safety.

Suggested-by: Benjamin Marzinski <bmarzins@redhat.com>
Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/alias.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/libmultipath/alias.c b/libmultipath/alias.c
index df44bdc..de28f25 100644
--- a/libmultipath/alias.c
+++ b/libmultipath/alias.c
@@ -141,14 +141,14 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 	rewind(f);
 	while (fgets(buf, LINE_MAX, f)) {
 		const char *alias, *wwid;
-		char *c;
+		char *c, *saveptr;
 		int curr_id;
 
 		line_nr++;
 		c = strpbrk(buf, "#\n\r");
 		if (c)
 			*c = '\0';
-		alias = strtok(buf, " \t");
+		alias = strtok_r(buf, " \t", &saveptr);
 		if (!alias) /* blank line */
 			continue;
 		curr_id = scan_devname(alias, prefix);
@@ -164,7 +164,7 @@ lookup_binding(FILE *f, const char *map_wwid, char **map_alias,
 			biggest_id = curr_id;
 		if (curr_id > id && curr_id < smallest_bigger_id)
 			smallest_bigger_id = curr_id;
-		wwid = strtok(NULL, " \t");
+		wwid = strtok_r(NULL, " \t", &saveptr);
 		if (!wwid){
 			condlog(3,
 				"Ignoring malformed line %u in bindings file",
@@ -206,17 +206,17 @@ rlookup_binding(FILE *f, char *buff, const char *map_alias)
 	buff[0] = '\0';
 
 	while (fgets(line, LINE_MAX, f)) {
-		char *c;
+		char *c, *saveptr;
 		const char *alias, *wwid;
 
 		line_nr++;
 		c = strpbrk(line, "#\n\r");
 		if (c)
 			*c = '\0';
-		alias = strtok(line, " \t");
+		alias = strtok_r(line, " \t", &saveptr);
 		if (!alias) /* blank line */
 			continue;
-		wwid = strtok(NULL, " \t");
+		wwid = strtok_r(NULL, " \t", &saveptr);
 		if (!wwid){
 			condlog(3,
 				"Ignoring malformed line %u in bindings file",
@@ -582,23 +582,23 @@ static int _check_bindings_file(const struct config *conf, FILE *file,
 
 	pthread_cleanup_push(free, line);
 	while ((n = getline(&line, &line_len, file)) >= 0) {
-		char *c, *alias, *wwid;
+		char *c, *alias, *wwid, *saveptr;
 		const char *mpe_wwid;
 
 		linenr++;
 		c = strpbrk(line, "#\n\r");
 		if (c)
 			*c = '\0';
-		alias = strtok(line, " \t");
+		alias = strtok_r(line, " \t", &saveptr);
 		if (!alias) /* blank line */
 			continue;
-		wwid = strtok(NULL, " \t");
+		wwid = strtok_r(NULL, " \t", &saveptr);
 		if (!wwid) {
 			condlog(1, "invalid line %d in bindings file, missing WWID",
 				linenr);
 			continue;
 		}
-		c = strtok(NULL, " \t");
+		c = strtok_r(NULL, " \t", &saveptr);
 		if (c)
 			/* This is non-fatal */
 			condlog(1, "invalid line %d in bindings file, extra args \"%s\"",
-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

