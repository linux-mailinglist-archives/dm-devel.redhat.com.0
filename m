Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7E2643022FC
	for <lists+dm-devel@lfdr.de>; Mon, 25 Jan 2021 09:49:09 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-JYeWQ0LTOMCtChkMsyucsw-1; Mon, 25 Jan 2021 03:49:06 -0500
X-MC-Unique: JYeWQ0LTOMCtChkMsyucsw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09984107AD25;
	Mon, 25 Jan 2021 08:49:00 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEAC360937;
	Mon, 25 Jan 2021 08:48:58 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C87D3180954D;
	Mon, 25 Jan 2021 08:48:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10MBGOuW000945 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 22 Jan 2021 06:16:24 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 235A510EB2A4; Fri, 22 Jan 2021 11:16:24 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E14310EB29F
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 11:16:21 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E6772801229
	for <dm-devel@redhat.com>; Fri, 22 Jan 2021 11:16:20 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-50-tT2h1ZBcOASMg2eEHVraeQ-1; Fri, 22 Jan 2021 06:16:18 -0500
X-MC-Unique: tT2h1ZBcOASMg2eEHVraeQ-1
Received: by mail-wm1-f42.google.com with SMTP id m187so3959397wme.2;
	Fri, 22 Jan 2021 03:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=VZLx/PblJd6MezWoeQ4GsUV4rI21p1au0Wz2+FJg3/Q=;
	b=kTym81qqO6bVvgtLeirOpdSVpox3iGxRR3z7neV7mRz8pTUofKUXJsAKczou9CBucO
	ia6hOFrFo8bKjukKVqBtUlRj4BX1dGEdEo7oRFkc6d/+aIqfLHi50sefBF0PTiT6SMFN
	HpBqJLGT1xkDsj6VWWRWe+bNcIF25o7GjU3JDLwzy0ltgrmD+P1NIqECjiiVoZcyhLsQ
	6CQI9Pt29PeRnWeawTuuVoSGu0Lwt5IgSXpx4fatwdSTpmy8BdORuFcFX0WUXSR9ycEW
	DGhm6oCujQIFbgaWACPHSIbrxDUCu9YMS5sHT5TPnRadottnZ0NxdHYKF3jLBd9iuW2+
	Kbiw==
X-Gm-Message-State: AOAM531vZcFv0GurU+ldzabVEx/MerLUyXHqkmyR6OmySHr6Iy90dDft
	xYGVOWgZJsvcbnNwFy9jcXNGXq0cxLTct6Nu
X-Google-Smtp-Source: ABdhPJz8/MaE6nni4CXTndtsyWaxV2OGHflQZJxSd+FMQer7kgkXcf9NtRaiKp+CYyEttSwZESC6aA==
X-Received: by 2002:a7b:cbd5:: with SMTP id n21mr3600591wmi.5.1611314176509;
	Fri, 22 Jan 2021 03:16:16 -0800 (PST)
Received: from felia.fritz.box ([2001:16b8:2d97:4900:808e:47fd:6ea4:7fa2])
	by smtp.gmail.com with ESMTPSA id
	x128sm11556111wmb.29.2021.01.22.03.16.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Jan 2021 03:16:15 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Mikulas Patocka <mpatocka@redhat.com>, Mike Snitzer <snitzer@redhat.com>, 
	dm-devel@redhat.com
Date: Fri, 22 Jan 2021 12:16:06 +0100
Message-Id: <20210122111606.24999-1-lukas.bulwahn@gmail.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 25 Jan 2021 03:48:36 -0500
Cc: linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Alasdair Kergon <agk@redhat.com>
Subject: [dm-devel] [PATCH for device-mapper/for-next] dm integrity: follow
	ReST formatting
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 61b8b2a834bf ("dm integrity: introduce the "fix_hmac" argument")
adds some new part to dm-integrity.rst, but this causes make htmldocs warn:

  dm-integrity.rst:192: WARNING: Unexpected indentation.
  dm-integrity.rst:193: WARNING: Block quote ends without a blank line; \
    unexpected unindent.

Make dm-integrity.rst follow ReST formatting.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Mike, please pick this quick documentation fix in your for-next branch.

 Documentation/admin-guide/device-mapper/dm-integrity.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 39a9fdc9f6ab..ef762857da95 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -188,6 +188,7 @@ fix_padding
 
 fix_hmac
 	Improve security of internal_hash and journal_mac:
+
 	- the section number is mixed to the mac, so that an attacker can't
 	  copy sectors from one journal section to another journal section
 	- the superblock is protected by journal_mac
-- 
2.17.1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

