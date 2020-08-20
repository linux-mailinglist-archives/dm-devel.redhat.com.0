Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA0324C4C8
	for <lists+dm-devel@lfdr.de>; Thu, 20 Aug 2020 19:46:31 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-346-3y4vM44AMq6RnlcuqjQ_DA-1; Thu, 20 Aug 2020 13:46:28 -0400
X-MC-Unique: 3y4vM44AMq6RnlcuqjQ_DA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48A0B873112;
	Thu, 20 Aug 2020 17:46:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A83AA1972B;
	Thu, 20 Aug 2020 17:46:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 78860183D020;
	Thu, 20 Aug 2020 17:46:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07KHjs8Y030687 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 20 Aug 2020 13:45:54 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 54FB410087EA; Thu, 20 Aug 2020 17:45:54 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0E441008B6D
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 17:45:51 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 99260901845
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 17:45:51 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-238-wZlxDPlXN0iuvG0LXu87Uw-1; Thu, 20 Aug 2020 13:45:48 -0400
X-MC-Unique: wZlxDPlXN0iuvG0LXu87Uw-1
Received: by mail-wm1-f66.google.com with SMTP id g75so2424611wme.4
	for <dm-devel@redhat.com>; Thu, 20 Aug 2020 10:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=QYfWiDtlQpuaTBhVUp+bGzfucr1lMylEyu4XPHgHPM4=;
	b=ZZZlT8/EO0SLR1p9HVtUmKCE4Fr2bN+nDHzF8UgwtCFd0NICHxmtsVJ/8L6cdOhASu
	kP08LIAIV+orSBk450HPbd1vnVxQ/WURZq2A2fKZVDPiHbcif8odttk0zObn1GUVoCsg
	nvwVRAwMetE3v6IaRin8dC2C0g7xVXTgmNXcgK6aoTKXz5qIsCwqr2L59SYG4EugewSF
	nkpZzzPQRlJrDbBy/uJJFQmgJmJo4VybtNQTKIhBCla2n+hyjeDmuE9e2bgWVCca4xkc
	jQA/xPoh+njcGh5OTILDFdhlFQQ+smdgVWqOUIFocglzDAoaSllPsgUn32BrJJiTL5zG
	PQdQ==
X-Gm-Message-State: AOAM53136BStt1PPTKD7qHBQUMcCHwkiMOJAbdZbTMLti94ziUs5aHCd
	tuc9XEfl1lavlySyBq9oDGhvw+G1RCA=
X-Google-Smtp-Source: ABdhPJwltq63cY+Gdc6LZgwAaDgpGFJIsJ+hvra/GpUxLbbLOJQe/SvnUd9GeUWS+UVtMZcB961maA==
X-Received: by 2002:a1c:9942:: with SMTP id b63mr4255268wme.12.1597945546810; 
	Thu, 20 Aug 2020 10:45:46 -0700 (PDT)
Received: from merlot.mazyland.net
	(dynamic-2a00-1028-8d1c-8c9e-b33d-9d5e-0500-19b7.ipv6.broadband.iol.cz.
	[2a00:1028:8d1c:8c9e:b33d:9d5e:500:19b7])
	by smtp.googlemail.com with ESMTPSA id
	a3sm5469245wme.34.2020.08.20.10.45.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 20 Aug 2020 10:45:45 -0700 (PDT)
From: Milan Broz <gmazyland@gmail.com>
To: dm-devel@redhat.com
Date: Thu, 20 Aug 2020 19:45:38 +0200
Message-Id: <20200820174538.20837-1-gmazyland@gmail.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
Cc: Milan Broz <gmazyland@gmail.com>
Subject: [dm-devel] [PATCH] dm-crypt: Document new no_workqueue flags.
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Patch 39d42fa96ba1b7d2544db3f8ed5da8fb0d5cb877 introduced new
dm-crypt no_read_workqueue and no_write_workqueue flags.

This patch adds documentation to admin guide for them.

Signed-off-by: Milan Broz <gmazyland@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-crypt.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-crypt.rst b/Documentation/admin-guide/device-mapper/dm-crypt.rst
index 8f4a3f889d43..94466921415d 100644
--- a/Documentation/admin-guide/device-mapper/dm-crypt.rst
+++ b/Documentation/admin-guide/device-mapper/dm-crypt.rst
@@ -121,6 +121,12 @@ submit_from_crypt_cpus
     thread because it benefits CFQ to have writes submitted using the
     same context.
 
+no_read_workqueue
+    Bypass dm-crypt internal workqueue and process read requests synchronously.
+
+no_write_workqueue
+    Bypass dm-crypt internal workqueue and process write requests synchronously.
+
 integrity:<bytes>:<type>
     The device requires additional <bytes> metadata per-sector stored
     in per-bio integrity structure. This metadata must by provided
-- 
2.28.0

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

