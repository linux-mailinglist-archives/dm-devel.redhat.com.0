Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 03207588F30
	for <lists+dm-devel@lfdr.de>; Wed,  3 Aug 2022 17:15:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659539735;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=D8smgrkQ2S1Hbpf2DY2QHpznjxFXmkRQsaarlYCwrmA=;
	b=Dp1iB3GjKgdcG5z5hi3CCi2Y0/xQmxrUEqUgL4Z1KY9hLZ0JFHctTQuI3Lt0J5HUwa2SY7
	uDkfihjgD5A5rrrc9dvn7zc8wRuF8qFBomrtGOa3h+2eYZzCE5x1c/vSqtzMJeTb/Kfb62
	EgFI2Kvr0/QM0ZEM9Q0mK2QpKbeWUA8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-527-BOHjLoPjNGqnfVrii7qRzA-1; Wed, 03 Aug 2022 11:15:32 -0400
X-MC-Unique: BOHjLoPjNGqnfVrii7qRzA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0109580418F;
	Wed,  3 Aug 2022 15:15:29 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 510A9141510F;
	Wed,  3 Aug 2022 15:15:24 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 455261946A5F;
	Wed,  3 Aug 2022 15:15:23 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id B52001946A4E
 for <dm-devel@listman.corp.redhat.com>; Wed,  3 Aug 2022 15:04:26 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A66DF40CFD0A; Wed,  3 Aug 2022 15:04:26 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A27FF40CF8F0
 for <dm-devel@redhat.com>; Wed,  3 Aug 2022 15:04:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 813E4801231
 for <dm-devel@redhat.com>; Wed,  3 Aug 2022 15:04:26 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-625-oIz3cVqnN_-nb-brXuuWbg-1; Wed, 03 Aug 2022 11:04:22 -0400
X-MC-Unique: oIz3cVqnN_-nb-brXuuWbg-1
Received: by mail-wr1-f51.google.com with SMTP id q30so17496304wra.11;
 Wed, 03 Aug 2022 08:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1E3hDnZ6TmAG1OWHas2GrrE4griFeEmYFKgwzEfilBQ=;
 b=O6+sRmCjjOegNufBb5Q2POZ8rJj1S7vpZz6+iVO5A0Z9SNycL3Bxvb5mI+CV6qv197
 16R6OgzNuCYWuE6+bHdpNMEFmZPYRtpUzRVfEN6P0LWg/HbZXbJ50lXExG4eR4TZZaA9
 pADu+YveS8OU6D8MRXc5tnbReZw8+Ql/dwAmoKs7jUxETQIfZRwLIiH5yp+f3ZCfOvF1
 Q9apiXnFZwl7zFRAbDrgfb157Du6yZnPGrpBnE8BxCVJH0PpoBcqfKYtu35BtQOo7hBw
 KaUKecxtBC+Euar6KbOqAiAW65f2+pr3I6v/EWDJ5cxZyF/xGcxhH4rRALfL23bM5XXg
 4NSA==
X-Gm-Message-State: ACgBeo3I6SyldhtRE+bcFTdAOi9sWabKjq5vaD2nMy3xXi+MiNSYCKmo
 PisqxJ2scSWX+Ya/v0rO8pECEoeS1Q==
X-Google-Smtp-Source: AA6agR5nKOlOBuhb5CBhbaqmqyhDHbCqoguirrH59LMN4qTboQBpJWLqyczLfYi8HArvyAWN/DnIeg==
X-Received: by 2002:a5d:4352:0:b0:21e:4984:e607 with SMTP id
 u18-20020a5d4352000000b0021e4984e607mr16327799wrr.66.1659539060928; 
 Wed, 03 Aug 2022 08:04:20 -0700 (PDT)
Received: from localhost (51.red-81-44-172.dynamicip.rima-tde.net.
 [81.44.172.51]) by smtp.gmail.com with ESMTPSA id
 w10-20020adfd4ca000000b002205cbc1c74sm12785883wrk.101.2022.08.03.08.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 08:04:20 -0700 (PDT)
From: Xose Vazquez Perez <xose.vazquez@gmail.com>
To: 
Date: Wed,  3 Aug 2022 17:04:19 +0200
Message-Id: <20220803150419.139067-1-xose.vazquez@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Subject: [dm-devel] [PATCH] spelling: cplusplus
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
Cc: Xose Vazquez Perez <xose.vazquez@gmail.com>,
 Josh Soref <2119212+jsoref@users.noreply.github.com>,
 DM-DEVEL ML <dm-devel@redhat.com>,
 Christophe Varoqui <christophe.varoqui@opensvc.com>,
 Martin Wilck <mwilck@suse.com>
Errors-To: dm-devel-bounces@redhat.com
Sender: "dm-devel" <dm-devel-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Josh Soref <2119212+jsoref@users.noreply.github.com>

From: Josh Soref <2119212+jsoref@users.noreply.github.com>

Cc: Martin Wilck <mwilck@suse.com>
Cc: Benjamin Marzinski <bmarzins@redhat.com>
Cc: Christophe Varoqui <christophe.varoqui@opensvc.com>
Cc: DM-DEVEL ML <dm-devel@redhat.com>
Reviewed-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
Signed-off-by: Josh Soref <2119212+jsoref@users.noreply.github.com>
---
It was 12/44
---
 libmpathvalid/mpath_valid.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libmpathvalid/mpath_valid.h b/libmpathvalid/mpath_valid.h
index ed06196e..ec2f9392 100644
--- a/libmpathvalid/mpath_valid.h
+++ b/libmpathvalid/mpath_valid.h
@@ -20,7 +20,7 @@
 #ifndef LIB_MPATH_VALID_H
 #define LIB_MPATH_VALID_H
 
-#ifdef __cpluscplus
+#ifdef __cplusplus
 extern "C" {
 #endif
 
-- 
2.37.1

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

