Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 59F7224C63B
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 21:21:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-YuXYmVSAMrWf7xWDqL7Phg-1; Thu, 20 Aug 2020 15:21:03 -0400
X-MC-Unique: YuXYmVSAMrWf7xWDqL7Phg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FCE31008309;
	Thu, 20 Aug 2020 19:20:57 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 90F737E311;
	Thu, 20 Aug 2020 19:20:55 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id AC3AD662BB;
	Thu, 20 Aug 2020 19:20:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KJKl3m008301 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 15:20:47 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id EC44A2028DCC; Thu, 20 Aug 2020 19:20:46 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DA20C2022796
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 19:20:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7DFA101A568
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 19:20:43 +0000 (UTC)
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-135-ayrDnrHTP76IRtTvuamY1g-1; Thu, 20 Aug 2020 15:20:41 -0400
X-MC-Unique: ayrDnrHTP76IRtTvuamY1g-1
Received: by mail-wr1-f68.google.com with SMTP id a15so3198125wrh.10
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 12:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7GeZeyhcosLYQx0FswCUb673RcVnaykWQzJsChDrXHc=;
	b=q/SgLuDmltFiaXQ0HO1ht/hn3yzBDuHH17J3UOOHrRgnqcdQt6Ll5ZJ9GiR/7JXElu
	p+9mKaO743Ka+6rznDn8O2dwa5fsM513+OLIQPRs47w9UtyPf3ETEk7rTneo6Pr3DQBg
	1nbVHZW213p50hpRu3rE68GtLSZd5L0GAVJFhph7rnvCP993p9E+966IfZMa3HIZ1e8f
	9Q6TEdyr2SCEa4zjjriTlubqxLdo0Eidev8ZaXDsmOVni3f4B372mXQf2Yvtr+w/1SGs
	KwyOu4ZJ9JvTGH15W8Z197O2wnGgvjRG7AB2x7qPOsz1CtROyJKyD9FIpW3N1YezNOBJ
	xAcQ==
X-Gm-Message-State: AOAM53341zhdL+SXH6p7RSHofLwPklUbhkFx4EH6OqdkTofqV64j6gNx
	b4jRuFWOJ9CDpsDGfPXKCsNavtbirGU=
X-Google-Smtp-Source: ABdhPJzkev80BrBeEw1VUX1l/Xi+1iUnPiet1Oc92G7jl2A2Anaq1bQo9OLx6Lr96mSKz3nhqe97Pw==
X-Received: by 2002:a05:6000:1141:: with SMTP id
	d1mr179354wrx.229.1597951240347; 
	Thu, 20 Aug 2020 12:20:40 -0700 (PDT)
Received: from merlot.mazyland.net
	(dynamic-2a00-1028-8d1c-8c9e-b33d-9d5e-0500-19b7.ipv6.broadband.iol.cz.
	[2a00:1028:8d1c:8c9e:b33d:9d5e:500:19b7])
	by smtp.googlemail.com with ESMTPSA id
	g25sm5644281wmh.35.2020.08.20.12.20.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Aug 2020 12:20:39 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu, 20 Aug 2020 21:20:26 +0200
Message-Id: <20200820192026.34617-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH] dm-crypt: Document encrypted keyring key option.
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 27f5411a718c431c20007e3a2fbba6589942d04f introduced
support for encrypted keyring type.

This patch fixes documentation in admin guide to mention this type.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-crypt.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
index 94466921415d..64d678411cc0 100644
--- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
@@ -67,7 +67,7 @@ Parameters::
     the value passed in <key_size>.
 
 <key_type>
-    Either 'logon' or 'user' kernel key type.
+    Either 'logon', 'user' or 'encrypted' kernel key type.
 
 <key_description>
     The kernel keyring key description crypt target should look for
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

