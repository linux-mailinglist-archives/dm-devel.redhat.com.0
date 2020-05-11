Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id D16B81CE841
	for <lists+dm-devel@lfdr.de>; Tue, 12 May 2020 00:40:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236830;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=k+4KAA3085hiC1zmvCCAxTMk59r4M+zNyAk0oBp7gqg=;
	b=Bw2fe1YVlDNNLfCFjIM9xPtTD0S7PgXdfRPTW7GSkKI8To+2SCnUs6jUTKykRPnSXoS4us
	YM/9rm3PgkGpC/4UZHGreq5/ImBz8wS5NZq63dVvz42PTuAKeSpREka9987Yt2Gsvh7oGf
	xP+9dAYuv8wfpdtgx1AmLfeYrNrc3gw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-5RaSW-0TPL-3nojJSG-cSQ-1; Mon, 11 May 2020 18:40:28 -0400
X-MC-Unique: 5RaSW-0TPL-3nojJSG-cSQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D8C53107ACCA;
	Mon, 11 May 2020 22:40:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D761600EF;
	Mon, 11 May 2020 22:40:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 623B31809543;
	Mon, 11 May 2020 22:40:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMdxKO016067 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:40:00 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id BDE452156A3B; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA3B12156A22
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6098101A525
	for <dm-devel@redhat.com>; Mon, 11 May 2020 22:39:59 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-484-XA8GjVRwME6np9o4up2sgg-1;
	Mon, 11 May 2020 18:39:56 -0400
X-MC-Unique: XA8GjVRwME6np9o4up2sgg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 78D61AE4B;
	Mon, 11 May 2020 22:39:56 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Tue, 12 May 2020 00:39:27 +0200
Message-Id: <20200511223931.18261-8-mwilck@suse.com>
In-Reply-To: <20200511223931.18261-1-mwilck@suse.com>
References: <20200511223931.18261-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 04BMdxKO016067
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 07/11] libmultipath: set_uint: fix parsing for
	32bit
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
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

On architectures where sizeof(long) == sizeof(int), the code wouldn't
work as intended. Use strtoul instead. As strtoul happily parses
negative numbers as input, require the number to begin with a digit.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 libmultipath/dict.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 3e25e74f..0e9ea387 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -60,19 +60,22 @@ static int
 set_uint(vector strvec, void *ptr)
 {
 	unsigned int *uint_ptr = (unsigned int *)ptr;
-	char *buff, *eptr;
-	long res;
+	char *buff, *eptr, *p;
+	unsigned long res;
 	int rc;
 
 	buff = set_value(strvec);
 	if (!buff)
 		return 1;
 
-	res = strtol(buff, &eptr, 10);
+	p = buff;
+	while (isspace(*p))
+		p++;
+	res = strtoul(p, &eptr, 10);
 	if (eptr > buff)
 		while (isspace(*eptr))
 			eptr++;
-	if (*buff == '\0' || *eptr != '\0' || res < 0 || res > UINT_MAX) {
+	if (*buff == '\0' || *eptr != '\0' || !isdigit(*p) || res > UINT_MAX) {
 		condlog(1, "%s: invalid value for %s: \"%s\"",
 			__func__, (char*)VECTOR_SLOT(strvec, 0), buff);
 		rc = 1;
-- 
2.26.2


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

