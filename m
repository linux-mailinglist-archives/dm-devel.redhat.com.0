Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 31C7B2A5E69
	for <lists+dm-devel@lfdr.de>; Wed,  4 Nov 2020 07:57:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1604473059;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=/vXYEmAAtAhEWfArK/sz3OdUTJ2mtA/7o5otyyu7sCU=;
	b=bi94Z3Yx33RttuUhmdYFW+QEt5jG57nj2g/NHUPP3b3wybu6wHsJVSAcDdLaqD54qRC20x
	a9Ppkj/rcHm8jCX9yQKbQHoudLbkYUygUYcn2E+vUa/aFPdECeDoSzhAlOcFL/GiHPz/Ma
	fQZSWF78eIesOYk49I5x82VACsVFJMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-ZOt46i7pOLmyp4-IeSEvfw-1; Wed, 04 Nov 2020 01:57:37 -0500
X-MC-Unique: ZOt46i7pOLmyp4-IeSEvfw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CE49804742;
	Wed,  4 Nov 2020 06:57:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1DD5D9D3;
	Wed,  4 Nov 2020 06:57:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 975EE180C5A2;
	Wed,  4 Nov 2020 06:57:25 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0A46sH3N017304 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 4 Nov 2020 01:54:17 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 8E5C85C22E; Wed,  4 Nov 2020 06:54:17 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 778B55C1D0;
	Wed,  4 Nov 2020 06:54:17 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0A46sGTR022476; 
	Wed, 4 Nov 2020 00:54:16 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0A46sFwn022475;
	Wed, 4 Nov 2020 00:54:15 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed,  4 Nov 2020 00:54:07 -0600
Message-Id: <1604472849-22422-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
References: <1604472849-22422-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v2 4/6] libmultipath: factor out code to get vpd
	page data
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
MIME-Version: 1.0
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A future patch will reuse the code to get the vpd page data, so factor
it out from get_vpd_sgio().

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/discovery.c | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index a97d2998..95ddbbbd 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1319,11 +1319,10 @@ get_vpd_sysfs (struct udev_device *parent, int pg, char * str, int maxlen)
 	return len;
 }
 
-int
-get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
+static int
+fetch_vpd_page(int fd, int pg, unsigned char *buff)
 {
-	int len, buff_len;
-	unsigned char buff[4096];
+	int buff_len;
 
 	memset(buff, 0x0, 4096);
 	if (sgio_get_vpd(buff, 4096, fd, pg) < 0) {
@@ -1344,6 +1343,18 @@ get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
 		condlog(3, "vpd pg%02x page truncated", pg);
 		buff_len = 4096;
 	}
+	return buff_len;
+}
+
+int
+get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
+{
+	int len, buff_len;
+	unsigned char buff[4096];
+
+	buff_len = fetch_vpd_page(fd, pg, buff);
+	if (buff_len < 0)
+		return buff_len;
 	if (pg == 0x80)
 		len = parse_vpd_pg80(buff, str, maxlen);
 	else if (pg == 0x83)
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

