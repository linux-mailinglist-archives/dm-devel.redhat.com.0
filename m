Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2A92DDB98
	for <lists+dm-devel@lfdr.de>; Thu, 17 Dec 2020 23:51:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1608245499;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=ygXoS82cDFTLYcRqzbvRFikplpv1O3uDDxfNqAH+3sU=;
	b=UNS60w9aWojlIvmDvyDYaboC+h99vbsaGkMKwYkTHDAS5SKcL6GnQk5BhctWrxI7A1goVs
	Cuiz9O3gUDBunABHV03TTG4RpZLmEZgle/1VCbX7Z+PqjFWMc6n1UKTXVdVs6A50GWxdl1
	Jpu5dK99/u4egbi/btiOcTEHKV6getw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-D3mzK6JcMoe7zR5PEmt41Q-1; Thu, 17 Dec 2020 17:51:36 -0500
X-MC-Unique: D3mzK6JcMoe7zR5PEmt41Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 653C81572D;
	Thu, 17 Dec 2020 22:51:30 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B7E6E60C15;
	Thu, 17 Dec 2020 22:51:29 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 0DFEB180954D;
	Thu, 17 Dec 2020 22:51:24 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0BHMp9F2008307 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 17 Dec 2020 17:51:09 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id A82F01ACC7; Thu, 17 Dec 2020 22:51:09 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8EE8A1B5B9;
	Thu, 17 Dec 2020 22:51:09 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
	by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 0BHMp87u001869; 
	Thu, 17 Dec 2020 16:51:08 -0600
Received: (from bmarzins@localhost)
	by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 0BHMp8Xj001868;
	Thu, 17 Dec 2020 16:51:08 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Thu, 17 Dec 2020 16:51:02 -0600
Message-Id: <1608245463-1746-5-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1608245463-1746-1-git-send-email-bmarzins@redhat.com>
References: <1608245463-1746-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
Cc: device-mapper development <dm-devel@redhat.com>,
	Martin Wilck <Martin.Wilck@suse.com>
Subject: [dm-devel] [PATCH v3 4/5] libmultipath: factor out code to get vpd
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
 libmultipath/discovery.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/libmultipath/discovery.c b/libmultipath/discovery.c
index add7bb97..f901e9ff 100644
--- a/libmultipath/discovery.c
+++ b/libmultipath/discovery.c
@@ -1321,14 +1321,13 @@ get_vpd_sysfs (struct udev_device *parent, int pg, char * str, int maxlen)
 	return len;
 }
 
-int
-get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
+static int
+fetch_vpd_page(int fd, int pg, unsigned char *buff, int maxlen)
 {
-	int len, buff_len;
-	unsigned char buff[4096];
+	int buff_len;
 
-	memset(buff, 0x0, 4096);
-	if (sgio_get_vpd(buff, 4096, fd, pg) < 0) {
+	memset(buff, 0x0, maxlen);
+	if (sgio_get_vpd(buff, maxlen, fd, pg) < 0) {
 		int lvl = pg == 0x80 || pg == 0x83 ? 3 : 4;
 
 		condlog(lvl, "failed to issue vpd inquiry for pg%02x",
@@ -1342,10 +1341,22 @@ get_vpd_sgio (int fd, int pg, int vend_id, char * str, int maxlen)
 		return -ENODATA;
 	}
 	buff_len = get_unaligned_be16(&buff[2]) + 4;
-	if (buff_len > 4096) {
+	if (buff_len > maxlen) {
 		condlog(3, "vpd pg%02x page truncated", pg);
-		buff_len = 4096;
+		buff_len = maxlen;
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
+	buff_len = fetch_vpd_page(fd, pg, buff, sizeof(buff));
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

