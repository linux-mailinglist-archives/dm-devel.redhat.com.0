Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ADA6AF98B
	for <lists+dm-devel@lfdr.de>; Tue,  7 Mar 2023 23:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678229403;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=icYVLZY00tw/gRmmpd9kj1j0n8B0DxUEnIw5g2yFDHk=;
	b=hQMhPZhtFBC+6Z/GTxRyuf42/QiccLTzbyZrv4QWBsPIE573hHurhzdpycCIl6GyjHlFlm
	Kc5PmJQ61VkT6mqcZ9d14mGj3Na9dzLXwSxw03Ys+c2izte3i/fgHceR8ExIpxR2AhChOs
	PBrJc+fmXh30K+3bG9JXSbQb3u1rU9A=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-m-7IpNzPOxSibeDKTk965A-1; Tue, 07 Mar 2023 17:49:48 -0500
X-MC-Unique: m-7IpNzPOxSibeDKTk965A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 506CA3C58C40;
	Tue,  7 Mar 2023 22:49:44 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 496362166B2E;
	Tue,  7 Mar 2023 22:49:41 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id E97ED19465BA;
	Tue,  7 Mar 2023 22:49:40 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 926B31946594
 for <dm-devel@listman.corp.redhat.com>; Tue,  7 Mar 2023 22:49:39 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 77262112132D; Tue,  7 Mar 2023 22:49:39 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D7641121314;
 Tue,  7 Mar 2023 22:49:39 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 327Mnc6R018834;
 Tue, 7 Mar 2023 16:49:38 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 327Mnb8r018833;
 Tue, 7 Mar 2023 16:49:37 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  7 Mar 2023 16:49:33 -0600
Message-Id: <1678229374-18788-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1678229374-18788-1-git-send-email-bmarzins@redhat.com>
References: <1678229374-18788-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Subject: [dm-devel] [PATCH 2/3] libmultipath: set init failure message when
 init fails
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
 Brian Bunker <brian@purestorage.com>, Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The tur checker has a message for initialization failure. We might as
well use it.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/tur.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
index a5045f10..a19becf5 100644
--- a/libmultipath/checkers/tur.c
+++ b/libmultipath/checkers/tur.c
@@ -400,8 +400,10 @@ int libcheck_check(struct checker * c)
 			 * It fails only in OOM situations. In this case, return
 			 * PATH_UNCHECKED to avoid prematurely failing the path.
 			 */
-			if (libcheck_init(c) != 0)
+			if (libcheck_init(c) != 0) {
+				c->msgid = MSG_TUR_FAILED;
 				return PATH_UNCHECKED;
+			}
 			((struct tur_checker_context *)c->context)->nr_timeouts = ct->nr_timeouts;
 
 			if (!uatomic_sub_return(&ct->holders, 1))
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

