Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 488654247A6
	for <lists+dm-devel@lfdr.de>; Wed,  6 Oct 2021 22:04:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1633550697;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=fdEeSjjsY8K+OlLKe1bREr7ZIvrhXwGIjbtTaDAJQSs=;
	b=bJNBbalAgCBieVvUf7PolT8kGpRpj59zMrBj1bVK5gFAnBfYTMPgQtRtdMTn5zk9gX/fT+
	kDp1nCRqhVyrfSFfaqaJWotPlJs3GIk4qUVDlcUonvfz0OIz1GWS3UG/IBWvoyrtIJ/Dpm
	XNGN1+PXL1cFdJcR2yYerRpf3w+VtIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-WEU2kbQiOuyrbsFz8QLPQw-1; Wed, 06 Oct 2021 16:04:55 -0400
X-MC-Unique: WEU2kbQiOuyrbsFz8QLPQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99AB8108468B;
	Wed,  6 Oct 2021 20:04:49 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 73F2960BD8;
	Wed,  6 Oct 2021 20:04:49 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 531CA4EA2A;
	Wed,  6 Oct 2021 20:04:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 196K4TuO020041 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 6 Oct 2021 16:04:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 740BC1F42A; Wed,  6 Oct 2021 20:04:29 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF7D219D9F;
	Wed,  6 Oct 2021 20:04:27 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 196K4QcY025613; 
	Wed, 6 Oct 2021 15:04:26 -0500
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 196K4PWC025612;
	Wed, 6 Oct 2021 15:04:25 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  6 Oct 2021 15:04:16 -0500
Message-Id: <1633550663-25571-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1633550663-25571-1-git-send-email-bmarzins@redhat.com>
References: <1633550663-25571-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH 1/8] libmulitpath: add section name to invalid
	keyword output
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If users forget the closing brace for a section in multipath.conf,
multipath has no way to detect that. When it sees the keyword at the
start of the next section, it will complain that there is an invalid
keyword, because that keyword doesn't belong in previous section (which
was never ended with a closing brace). This can confuse users. To make
this easier to understand, when multipath prints and invalid keyword
message, it now also prints the current section name, which can give
users a hint that they didn't end the previous section.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/parser.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/libmultipath/parser.c b/libmultipath/parser.c
index 8ca91bf2..611054f7 100644
--- a/libmultipath/parser.c
+++ b/libmultipath/parser.c
@@ -504,7 +504,7 @@ validate_config_strvec(vector strvec, const char *file)
 
 static int
 process_stream(struct config *conf, FILE *stream, vector keywords,
-	       const char *file)
+	       const char *section, const char *file)
 {
 	int i;
 	int r = 0, t;
@@ -568,16 +568,22 @@ process_stream(struct config *conf, FILE *stream, vector keywords,
 				if (keyword->sub) {
 					kw_level++;
 					r += process_stream(conf, stream,
-							    keyword->sub, file);
+							    keyword->sub,
+							    keyword->string,
+							    file);
 					kw_level--;
 				}
 				break;
 			}
 		}
-		if (i >= VECTOR_SIZE(keywords))
-			condlog(1, "%s line %d, invalid keyword: %s",
-				file, line_nr, str);
-
+		if (i >= VECTOR_SIZE(keywords)) {
+			if (section)
+				condlog(1, "%s line %d, invalid keyword in the %s section: %s",
+					file, line_nr, section, str);
+			else
+				condlog(1, "%s line %d, invalid keyword: %s",
+					file, line_nr, str);
+		}
 		free_strvec(strvec);
 	}
 	if (kw_level == 1)
@@ -608,7 +614,7 @@ process_file(struct config *conf, const char *file)
 
 	/* Stream handling */
 	line_nr = 0;
-	r = process_stream(conf, stream, conf->keywords, file);
+	r = process_stream(conf, stream, conf->keywords, NULL, file);
 	fclose(stream);
 	//free_keywords(keywords);
 
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

