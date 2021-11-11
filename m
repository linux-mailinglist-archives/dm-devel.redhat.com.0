Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EE1D44CEA1
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 02:08:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636592903;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ix60BVVOFmm1mE4367DDlz9kaSOG4URjHyJZMTvssew=;
	b=XWnwQsQK5dnNN+sFIURL2s/QQunsVfbaoA+iDKGF0DlbNWM78bI3m09wtUH+QlA5Tcp+4y
	kuSNhY+qjiWtrvAWySdAw2sFATewkuYlC+/ejawUoUmqd/QkxtwKbUXw6cMCKVXiOt0A+M
	yBj5F99G4wFG+rp3jvV6WUc2U2ZbkJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-MaEi5XMGNMymbxJ1rZpNFg-1; Wed, 10 Nov 2021 20:07:11 -0500
X-MC-Unique: MaEi5XMGNMymbxJ1rZpNFg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1DCA41006AA3;
	Thu, 11 Nov 2021 01:07:06 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E982C908A;
	Thu, 11 Nov 2021 01:07:05 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA1BB18199EE;
	Thu, 11 Nov 2021 01:07:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AB16Vld013107 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 20:06:31 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 59E02908A; Thu, 11 Nov 2021 01:06:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 681461973B;
	Thu, 11 Nov 2021 01:06:26 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AB16OFU020433; 
	Wed, 10 Nov 2021 19:06:24 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AB16N5V020432;
	Wed, 10 Nov 2021 19:06:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 10 Nov 2021 19:06:12 -0600
Message-Id: <1636592780-20391-2-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
References: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 1/9] libmultipath: add section name to invalid
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
this easier to understand, when multipath prints an invalid keyword
message, it now also prints the current section name, which can give
users a hint that they didn't end the previous section.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
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

