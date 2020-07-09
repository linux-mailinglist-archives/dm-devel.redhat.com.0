Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E95CA219E52
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:52:49 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-V2aNW9N9Poma98g7VxqqTw-1; Thu, 09 Jul 2020 06:52:46 -0400
X-MC-Unique: V2aNW9N9Poma98g7VxqqTw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0924386AB00;
	Thu,  9 Jul 2020 10:52:35 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD4BB5C3E7;
	Thu,  9 Jul 2020 10:52:34 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9A91293F90;
	Thu,  9 Jul 2020 10:52:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AqK5A000643 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:52:20 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A7EBC5F24D; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A42685F255
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B643858EE4
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:52:20 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-299-hYrtiBrvM9Shd-LC8eawTA-1;
	Thu, 09 Jul 2020 06:52:17 -0400
X-MC-Unique: hYrtiBrvM9Shd-LC8eawTA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 1123DAF0C;
	Thu,  9 Jul 2020 10:52:16 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:51:45 +0200
Message-Id: <20200709105145.9211-22-mwilck@suse.com>
In-Reply-To: <20200709105145.9211-1-mwilck@suse.com>
References: <20200709105145.9211-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AqK5A000643
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 74/74] libmultipath: dmparser: constify function
	arguments
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

With the previous change that avoids additions to pathvec,
the pathvec argument to disassemble_map() is const now.
Also use const for the string arguments where possible.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dmparser.c | 11 ++++++-----
 libmultipath/dmparser.h |  4 ++--
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/libmultipath/dmparser.c b/libmultipath/dmparser.c
index e629a89..6d9488f 100644
--- a/libmultipath/dmparser.c
+++ b/libmultipath/dmparser.c
@@ -128,10 +128,11 @@ err:
  * Call update_pathvec_from_dm() after this function to make sure
  * all data structures are in a sane state.
  */
-int disassemble_map(vector pathvec, char *params, struct multipath *mpp)
+int disassemble_map(const struct _vector *pathvec,
+		    const char *params, struct multipath *mpp)
 {
 	char * word;
-	char * p;
+	const char *p;
 	int i, j, k;
 	int num_features = 0;
 	int num_hwhandler = 0;
@@ -344,10 +345,10 @@ out:
 	return 1;
 }
 
-int disassemble_status(char *params, struct multipath *mpp)
+int disassemble_status(const char *params, struct multipath *mpp)
 {
-	char * word;
-	char * p;
+	char *word;
+	const char *p;
 	int i, j, k;
 	int num_feature_args;
 	int num_hwhandler_args;
diff --git a/libmultipath/dmparser.h b/libmultipath/dmparser.h
index 1b45df0..212fee5 100644
--- a/libmultipath/dmparser.h
+++ b/libmultipath/dmparser.h
@@ -1,3 +1,3 @@
 int assemble_map (struct multipath *, char *, int);
-int disassemble_map (vector, char *, struct multipath *);
-int disassemble_status (char *, struct multipath *);
+int disassemble_map (const struct _vector *, const char *, struct multipath *);
+int disassemble_status (const char *, struct multipath *);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

