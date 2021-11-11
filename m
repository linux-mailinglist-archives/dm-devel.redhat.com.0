Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF3D44CE8F
	for <lists+dm-devel@lfdr.de>; Thu, 11 Nov 2021 02:07:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636592827;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=dXJdr6VczUHeMpJ7sp8SLTt4Qzwe0/9v31ZZVl0tkJM=;
	b=BhyOUm5+m2tt1VqBvThU/IcfMwgNMeMCNxDEwtluh62+IPOOulmmGChU1w6LPCF9H0F+K5
	G8TVwprIQ4sUITk7El9RnYMABWBMJUzwdMwRvHcofT3EVKhE4HL6jeiMlp+UX2lZ2LmEYA
	F6WwO2j9afplaj+jfCXpDRrfC3UKUhA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-340-EnA1zfkdO1KpooeLsil5Fg-1; Wed, 10 Nov 2021 20:07:05 -0500
X-MC-Unique: EnA1zfkdO1KpooeLsil5Fg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4D4A871810;
	Thu, 11 Nov 2021 01:06:59 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 63E8417567;
	Thu, 11 Nov 2021 01:06:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id E08294E58E;
	Thu, 11 Nov 2021 01:06:43 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AB16a6h013145 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 10 Nov 2021 20:06:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 5499F60CCC; Thu, 11 Nov 2021 01:06:36 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (unknown [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E56860CC4;
	Thu, 11 Nov 2021 01:06:30 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 1AB16SQe020441; 
	Wed, 10 Nov 2021 19:06:28 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 1AB16REr020440;
	Wed, 10 Nov 2021 19:06:27 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 10 Nov 2021 19:06:14 -0600
Message-Id: <1636592780-20391-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
References: <1636592780-20391-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 3/9] libmultipath: print the correct file when
	parsing fails
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Don't assume that parsing failed on multipath.conf

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
Reviewed-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/parser.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/libmultipath/parser.c b/libmultipath/parser.c
index ebe1cbd9..d5595fb0 100644
--- a/libmultipath/parser.c
+++ b/libmultipath/parser.c
@@ -561,8 +561,8 @@ process_stream(struct config *conf, FILE *stream, vector keywords,
 				    t = keyword->handler(conf, strvec);
 					r += t;
 					if (t)
-						condlog(1, "multipath.conf +%d, parsing failed: %s",
-							line_nr, buf);
+						condlog(1, "%s line %d, parsing failed: %s",
+							file, line_nr, buf);
 				}
 
 				if (keyword->sub) {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

