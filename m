Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FED724DCE
	for <lists+dm-devel@lfdr.de>; Tue,  6 Jun 2023 22:14:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1686082443;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=KjIpSWzxYUHaiH5jTySsUo05l4UBiMex/ZVt38mIkGQ=;
	b=FA7MnBn+5wWRfhNgqGHBrqSZWUbVKfRaEacT9TBdq8XfzJHRoh6kZS9fhcMdiOmcNfqKmw
	HhtzlObiC26RX33m5KI4F4P5eKsvcuNlT9nI4hOoDRY1zqrUSGrbGDqLA+sjhL2/GDGuxn
	/5ri3eekHKfgspM2TD60LGDjUgky77k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-607-_KS6Vn2EPUa0tPOinkMkyQ-1; Tue, 06 Jun 2023 16:13:25 -0400
X-MC-Unique: _KS6Vn2EPUa0tPOinkMkyQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 639C78028B1;
	Tue,  6 Jun 2023 20:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4CD5C14171BC;
	Tue,  6 Jun 2023 20:13:23 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 1DF3A19451C5;
	Tue,  6 Jun 2023 20:13:20 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id C1BAE1946A47
 for <dm-devel@listman.corp.redhat.com>; Tue,  6 Jun 2023 20:13:19 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 9FD952026E03; Tue,  6 Jun 2023 20:13:19 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85F052026D6A;
 Tue,  6 Jun 2023 20:13:19 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 356KDHeu029260;
 Tue, 6 Jun 2023 15:13:17 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 356KDGRI029259;
 Tue, 6 Jun 2023 15:13:16 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  6 Jun 2023 15:13:03 -0500
Message-Id: <1686082391-29210-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1686082391-29210-1-git-send-email-bmarzins@redhat.com>
References: <1686082391-29210-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Subject: [dm-devel] [PATCH V2 03/11] libmultipath: add ALUA tpg path wildcard
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/dm-devel/>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
 <mailto:dm-devel-request@redhat.com?subject=subscribe>
Cc: device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make it possible to easily check a path's target port group.

Reviewed-by: Martin Wilck <mwilck@suse.com>
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/print.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/libmultipath/print.c b/libmultipath/print.c
index 3193dbe0..360308d2 100644
--- a/libmultipath/print.c
+++ b/libmultipath/print.c
@@ -782,6 +782,14 @@ snprint_path_vpd_data(struct strbuf *buff, const struct path * pp)
 	return append_strbuf_str(buff, "[undef]");
 }
 
+static int
+snprint_alua_tpg(struct strbuf *buff, const struct path * pp)
+{
+	if (pp->tpg_id < 0)
+		return append_strbuf_str(buff, "[undef]");
+	return print_strbuf(buff, "0x%04x", pp->tpg_id);
+}
+
 static const struct multipath_data mpd[] = {
 	{'n', "name",          snprint_name},
 	{'w', "uuid",          snprint_multipath_uuid},
@@ -836,6 +844,7 @@ static const struct path_data pd[] = {
 	{'P', "protocol",      snprint_path_protocol},
 	{'I', "init_st",       snprint_initialized},
 	{'L', "LUN hex",       snprint_path_lunhex},
+	{'A', "TPG",           snprint_alua_tpg},
 };
 
 static const struct pathgroup_data pgd[] = {
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

