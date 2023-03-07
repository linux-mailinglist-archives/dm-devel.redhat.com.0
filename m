Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 666FA6AF98D
	for <lists+dm-devel@lfdr.de>; Tue,  7 Mar 2023 23:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678229407;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=z4OisbwfPJJu2HjFb2W4C9naFkQuBEDzT1gdhAONRdw=;
	b=hxEVFmwAwFcN8fN4II1HDL+ZluLEBnlABextXiaYifpWL0onP3zT+42GqeG7iFAL9lnERp
	9EZY9JhNZJLDGQ6J8cqxbQCTwoejo/SwCciHIUE/meMAIFgIV0avTsY0sAuJeRTaS6yETJ
	opoZRCyeypgd7rTGP+pkToaqreK9BTs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-59afk1qfNH-eQOCP9ifMEg-1; Tue, 07 Mar 2023 17:49:46 -0500
X-MC-Unique: 59afk1qfNH-eQOCP9ifMEg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C096B1C3D386;
	Tue,  7 Mar 2023 22:49:43 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A3602026D4B;
	Tue,  7 Mar 2023 22:49:42 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 3662C19465BD;
	Tue,  7 Mar 2023 22:49:42 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 232611946594
 for <dm-devel@listman.corp.redhat.com>; Tue,  7 Mar 2023 22:49:41 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 0858E35454; Tue,  7 Mar 2023 22:49:41 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E24E618EC6;
 Tue,  7 Mar 2023 22:49:40 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 327MndN4018838;
 Tue, 7 Mar 2023 16:49:39 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 327MncaF018837;
 Tue, 7 Mar 2023 16:49:38 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Tue,  7 Mar 2023 16:49:34 -0600
Message-Id: <1678229374-18788-4-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1678229374-18788-1-git-send-email-bmarzins@redhat.com>
References: <1678229374-18788-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Subject: [dm-devel] [PATCH 3/3] libmultipath: reset nr_timeouts if we freed
 the context
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a the tur checker creates a new context because an old thread is
still running, but the old thread finishes before the checker drops
the old context, the checker should reset nr_timeouts to 0, since
the old thread did complete in time.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/checkers/tur.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/libmultipath/checkers/tur.c b/libmultipath/checkers/tur.c
index a19becf5..fe6a2f14 100644
--- a/libmultipath/checkers/tur.c
+++ b/libmultipath/checkers/tur.c
@@ -406,9 +406,11 @@ int libcheck_check(struct checker * c)
 			}
 			((struct tur_checker_context *)c->context)->nr_timeouts = ct->nr_timeouts;
 
-			if (!uatomic_sub_return(&ct->holders, 1))
+			if (!uatomic_sub_return(&ct->holders, 1)) {
 				/* It did terminate, eventually */
 				cleanup_context(ct);
+				((struct tur_checker_context *)c->context)->nr_timeouts = 0;
+			}
 
 			ct = c->context;
 		} else
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

