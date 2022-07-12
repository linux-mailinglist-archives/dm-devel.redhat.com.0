Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F65728EF
	for <lists+dm-devel@lfdr.de>; Wed, 13 Jul 2022 00:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1657663387;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=Ds81yRXYGWGHPQMI1clwAmJj7ca8zsUDlQoRpyVphJY=;
	b=jRtHVEfG/8wKhy3td2zIX40K0lqFFWjwqAy4twEtzwtLtVBgYgIS40TsQ6s4S3DSQtU569
	4xHVIuY/d+ru7VE00IrTjIkRzskZgkWgLdN4KOSb6kh8sPYAJZAfCJmlAqb7JMmHvlSwHx
	mKqlAbmVRzJafQB7caxIt3D88VhhAc8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-UKjario0PEWqjIlaY3TlVw-1; Tue, 12 Jul 2022 18:03:06 -0400
X-MC-Unique: UKjario0PEWqjIlaY3TlVw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 032A885A581;
	Tue, 12 Jul 2022 22:03:04 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 8331A2026D64;
	Tue, 12 Jul 2022 22:02:57 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 077491947066;
	Tue, 12 Jul 2022 22:02:56 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id BBD31194705F
 for <dm-devel@listman.corp.redhat.com>; Tue, 12 Jul 2022 22:02:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A73AB40CF8E4; Tue, 12 Jul 2022 22:02:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 95E0A400DFA6;
 Tue, 12 Jul 2022 22:02:54 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 26CM2qk4011120;
 Tue, 12 Jul 2022 17:02:53 -0500
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 26CM2q1g011119;
 Tue, 12 Jul 2022 17:02:52 -0500
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue, 12 Jul 2022 17:02:51 -0500
Message-Id: <1657663371-11080-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [dm-devel] [PATCH] libmultipath: fix find_multipaths_timeout for
 unknown hardware
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

pp->hwe is now a vector that will always be allocated for all path
devices. Instead of checking if it is NULL, check if it is empty.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/propsel.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmultipath/propsel.c b/libmultipath/propsel.c
index 50d0b5c8..f782f251 100644
--- a/libmultipath/propsel.c
+++ b/libmultipath/propsel.c
@@ -1293,7 +1293,7 @@ out:
 	 */
 	if (pp->find_multipaths_timeout < 0) {
 		pp->find_multipaths_timeout = -pp->find_multipaths_timeout;
-		if (!pp->hwe) {
+		if (VECTOR_SIZE(pp->hwe) == 0) {
 			pp->find_multipaths_timeout =
 				DEFAULT_UNKNOWN_FIND_MULTIPATHS_TIMEOUT;
 			origin = "(default for unknown hardware)";
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

