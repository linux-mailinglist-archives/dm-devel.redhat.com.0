Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id EE178219D6F
	for <lists+dm-devel@lfdr.de>; Thu,  9 Jul 2020 12:17:36 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258--OBBDY91PBy3CA260OlrOA-1; Thu, 09 Jul 2020 06:17:33 -0400
X-MC-Unique: -OBBDY91PBy3CA260OlrOA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45FE8800685;
	Thu,  9 Jul 2020 10:17:28 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FCDF6FEE8;
	Thu,  9 Jul 2020 10:17:28 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CFC691806B0B;
	Thu,  9 Jul 2020 10:17:27 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 069AGwd5029377 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 9 Jul 2020 06:16:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 866AA2166BA4; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 827FB2166B28
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 60E8F800A1A
	for <dm-devel@redhat.com>; Thu,  9 Jul 2020 10:16:58 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-340-4brq4UWHNTmkFclurX77XQ-1;
	Thu, 09 Jul 2020 06:16:55 -0400
X-MC-Unique: 4brq4UWHNTmkFclurX77XQ-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A197CB084;
	Thu,  9 Jul 2020 10:16:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Thu,  9 Jul 2020 12:15:57 +0200
Message-Id: <20200709101620.6786-13-mwilck@suse.com>
In-Reply-To: <20200709101620.6786-1-mwilck@suse.com>
References: <20200709101620.6786-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 069AGwd5029377
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 12/35] libmultipath: strlcpy()/strlcat(): use
	restrict qualifier
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

Also remove the redundant local variables. It's not necessary to
make "restrict" work, but it makes the intention more clear.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/util.c | 28 ++++++++++++----------------
 libmultipath/util.h |  4 ++--
 2 files changed, 14 insertions(+), 18 deletions(-)

diff --git a/libmultipath/util.c b/libmultipath/util.c
index 957fb97..f965094 100644
--- a/libmultipath/util.c
+++ b/libmultipath/util.c
@@ -113,46 +113,42 @@ get_word (const char *sentence, char **word)
 	return skip + len;
 }
 
-size_t strlcpy(char *dst, const char *src, size_t size)
+size_t strlcpy(char * restrict dst, const char * restrict src, size_t size)
 {
 	size_t bytes = 0;
-	char *q = dst;
-	const char *p = src;
 	char ch;
 
-	while ((ch = *p++)) {
-		if (bytes+1 < size)
-			*q++ = ch;
+	while ((ch = *src++)) {
+		if (bytes + 1 < size)
+			*dst++ = ch;
 		bytes++;
 	}
 
 	/* If size == 0 there is no space for a final null... */
 	if (size)
-		*q = '\0';
+		*dst = '\0';
 	return bytes;
 }
 
-size_t strlcat(char *dst, const char *src, size_t size)
+size_t strlcat(char * restrict dst, const char * restrict src, size_t size)
 {
 	size_t bytes = 0;
-	char *q = dst;
-	const char *p = src;
 	char ch;
 
-	while (bytes < size && *q) {
-		q++;
+	while (bytes < size && *dst) {
+		dst++;
 		bytes++;
 	}
 	if (bytes == size)
 		return (bytes + strlen(src));
 
-	while ((ch = *p++)) {
-		if (bytes+1 < size)
-		*q++ = ch;
+	while ((ch = *src++)) {
+		if (bytes + 1 < size)
+			*dst++ = ch;
 		bytes++;
 	}
 
-	*q = '\0';
+	*dst = '\0';
 	return bytes;
 }
 
diff --git a/libmultipath/util.h b/libmultipath/util.h
index ae18d8b..7e29b26 100644
--- a/libmultipath/util.h
+++ b/libmultipath/util.h
@@ -15,8 +15,8 @@ int basenamecpy (const char *src, char *dst, size_t size);
 int filepresent (const char *run);
 char *get_next_string(char **temp, const char *split_char);
 int get_word (const char * sentence, char ** word);
-size_t strlcpy(char *dst, const char *src, size_t size);
-size_t strlcat(char *dst, const char *src, size_t size);
+size_t strlcpy(char * restrict dst, const char * restrict src, size_t size);
+size_t strlcat(char * restrict dst, const char * restrict src, size_t size);
 int devt2devname (char *, int, const char *);
 dev_t parse_devt(const char *dev_t);
 char *convert_dev(char *dev, int is_path_device);
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

