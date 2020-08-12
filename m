Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7E62428B8
	for <lists+dm-devel@lfdr.de>; Wed, 12 Aug 2020 13:33:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-9q3plI4VMHut05R0MZB4WQ-1; Wed, 12 Aug 2020 07:33:28 -0400
X-MC-Unique: 9q3plI4VMHut05R0MZB4WQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E55178017F4;
	Wed, 12 Aug 2020 11:33:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75A8E60E1C;
	Wed, 12 Aug 2020 11:33:22 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 88CFD97529;
	Wed, 12 Aug 2020 11:33:16 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07CBX6rl028412 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 12 Aug 2020 07:33:06 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 6261510EE781; Wed, 12 Aug 2020 11:33:06 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D8F510EE783
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:33:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EBDDD1033644
	for <dm-devel@redhat.com>; Wed, 12 Aug 2020 11:33:03 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-208-HMmEDAlGMX-Jw6TOjRgCxw-1;
	Wed, 12 Aug 2020 07:33:01 -0400
X-MC-Unique: HMmEDAlGMX-Jw6TOjRgCxw-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id C6AA8AE18;
	Wed, 12 Aug 2020 11:33:21 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 12 Aug 2020 13:32:32 +0200
Message-Id: <20200812113232.25962-3-mwilck@suse.com>
In-Reply-To: <20200812113232.25962-1-mwilck@suse.com>
References: <20200812113232.25962-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07CBX6rl028412
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 12/35] libmultipath: strlcpy()/strlcat(): use
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
index 526869e..207e63c 100644
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
index a4f7c0a..52aa559 100644
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
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

