Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EB541F2E
	for <lists+dm-devel@lfdr.de>; Wed,  8 Jun 2022 00:45:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654641915;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=x17gOEJzbanJ+pnkDYY5bcL4Df0L1pBps7b+zULDct0=;
	b=e8mW+6LPSsv7waHmMvUeCgYudRwuECkWrzJeG1MURdiEZMuXEI6JqVanXXM7IZU5yMgpx6
	uYWT5oJLHh9dVxeDu5JZlWzQNir/40Vk7JqOPQcuAtEA2JDkXiCbeq//AaZ/KhSAqSUT2A
	w/thmubTjPU/vtN9OCwF0akqOPI5bRk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-IZE1w1lJOgOX8DiW3AYC8g-1; Tue, 07 Jun 2022 18:45:11 -0400
X-MC-Unique: IZE1w1lJOgOX8DiW3AYC8g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C21D80A0AD;
	Tue,  7 Jun 2022 22:45:09 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 073C32026D64;
	Tue,  7 Jun 2022 22:45:07 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DA2E519466DF;
	Tue,  7 Jun 2022 22:45:06 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BD15B1947042
 for <dm-devel@listman.corp.redhat.com>; Tue,  7 Jun 2022 22:45:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id ADE2AC28117; Tue,  7 Jun 2022 22:45:04 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B74FC28115;
 Tue,  7 Jun 2022 22:45:04 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 257Mj3Cg012364;
 Tue, 7 Jun 2022 17:45:03 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 257Mj2bp012361;
 Tue, 7 Jun 2022 17:45:02 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  7 Jun 2022 17:45:01 -0500
Message-Id: <1654641901-12324-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [dm-devel] [PATCH] libmultipath: unset detect_checker for clariion
 / Unity arrays
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
Cc: vincent.chen1@dell.com, device-mapper development <dm-devel@redhat.com>,
 Martin Wilck <Martin.Wilck@suse.com>
MIME-Version: 1.0
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dell EMC would like to always use the emc_clariion checker. Currently
detect_checker will switch the checker to TUR for Unity arrays.
This can cause problems on some setups with replicated Unity LUNs,
which are handled correctly the the emc_checker, but not the TUR
checker.

Cc: vincent.chen1@dell.com
Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/hwtable.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/libmultipath/hwtable.c b/libmultipath/hwtable.c
index 39daadc2..415bf683 100644
--- a/libmultipath/hwtable.c
+++ b/libmultipath/hwtable.c
@@ -350,6 +350,7 @@ static struct hwentry default_hw[] = {
 		.no_path_retry = (300 / DEFAULT_CHECKINT),
 		.checker_name  = EMC_CLARIION,
 		.prio_name     = PRIO_EMC,
+		.detect_checker = DETECT_CHECKER_OFF,
 	},
 	{
 		/* Invista / VPLEX */
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

