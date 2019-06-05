Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by mail.lfdr.de (Postfix) with ESMTPS id F40F73585F
	for <lists+dm-devel@lfdr.de>; Wed,  5 Jun 2019 10:17:59 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D4D785363;
	Wed,  5 Jun 2019 08:17:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8600D5C22F;
	Wed,  5 Jun 2019 08:17:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id A578A1806B11;
	Wed,  5 Jun 2019 08:17:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x551RbZ3014908 for <dm-devel@listman.util.phx.redhat.com>;
	Tue, 4 Jun 2019 21:27:37 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 65EAB19729; Wed,  5 Jun 2019 01:27:37 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6018C19C6A
	for <dm-devel@redhat.com>; Wed,  5 Jun 2019 01:27:35 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 571BCC18B2D0
	for <dm-devel@redhat.com>; Wed,  5 Jun 2019 01:27:32 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id s11so13794916pfm.12
	for <dm-devel@redhat.com>; Tue, 04 Jun 2019 18:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yJtfhF/jan9MFN0Fy8lkZ8iPN2kyqz+fwLX3VfG1VbE=;
	b=nT9boljzAsdRdb4xVt+qaiSCFkAJL57bnv8hPY2Cyi3A6FO+premfKjakZH3riLP3j
	4DSOMSPLXIWfU0XP0Xtg+mH/nOELRbcfFdLZS2g5KUaqi/qiYoS8aF4ffPs0JCAKsyzk
	fH9nmwUvSnqSYdU9Zy3B8TqAnFtPl2pQ/4AAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yJtfhF/jan9MFN0Fy8lkZ8iPN2kyqz+fwLX3VfG1VbE=;
	b=L3RZJ3c4kxcb+tmg7LVK1GrGQf6ZtQyhqM3qVgNVZaJpiI85sau5LOzB8q5lRN0M+3
	jIVPCJ4LayzITt9eFV1ptDqW0po1bErf7VqmWgllFkz2/+i1+jS1bxuUcJ16TTNE71dE
	ZgY3/9mkV3+50j7rg1KJshzwwkRhtvYfmBqm7bankyvr8UUiGmHXh7Rea1KB5ejNSzb5
	0LFBPRpOsSFnNW9+telZsCBOvm+A/66V9CeaW4ISeI1A63CXu9LBh3O38w1jymWgzYwi
	YJQ+IDgpeUaaU3gxz60wxOApvkblZtm3apBaskIdvyyFVPUfvsYKQAqqC7o3VDJysoWa
	hsDA==
X-Gm-Message-State: APjAAAUTas4yx6bnemnmXQNEDBRaXKwtn3G2KECCD6SsRJpK1MOHjZUv
	DKKdeuAjPQBKU9bI+DaZ48Y6Iw==
X-Google-Smtp-Source: APXvYqymN0aygxYP0wHuBAqqZ1M4aTQmZjzWnNa5+ogxdCIiuIlQn3m8FG8z2ePrhGkSd4ca2YXllQ==
X-Received: by 2002:a63:5014:: with SMTP id e20mr772739pgb.2.1559698051803;
	Tue, 04 Jun 2019 18:27:31 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:fa53:7765:582b:82b9])
	by smtp.gmail.com with ESMTPSA id
	r77sm24391066pgr.93.2019.06.04.18.27.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Jun 2019 18:27:31 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Tue,  4 Jun 2019 18:27:29 -0700
Message-Id: <20190605012729.30770-1-swboyd@chromium.org>
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 05 Jun 2019 01:27:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]);
	Wed, 05 Jun 2019 01:27:32 +0000 (UTC) for IP:'209.85.210.195'
	DOMAIN:'mail-pf1-f195.google.com'
	HELO:'mail-pf1-f195.google.com' FROM:'swboyd@chromium.org' RCPT:''
X-RedHat-Spam-Score: -0.118  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE, SPF_PASS,
	T_DKIMWL_WL_HIGH) 209.85.210.195 mail-pf1-f195.google.com
	209.85.210.195 mail-pf1-f195.google.com <swboyd@chromium.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.31
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Wed, 05 Jun 2019 04:13:38 -0400
Cc: dm-devel@redhat.com, Helen Koike <helen.koike@collabora.com>,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm init: Remove trailing newline from DM*()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.25]); Wed, 05 Jun 2019 08:17:58 +0000 (UTC)

These printing macros already add a trailing newline, so having another
one here just makes for blank lines when these prints are enabled.
Remove them to match style of the rest of the uses of the macros.

Cc: Helen Koike <helen.koike@collabora.com>
Fixes: 6bbc923dfcf5 ("dm: add support to directly boot to a mapped device")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/md/dm-init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-init.c b/drivers/md/dm-init.c
index 352e803f566e..54b78c68bf0b 100644
--- a/drivers/md/dm-init.c
+++ b/drivers/md/dm-init.c
@@ -272,7 +272,7 @@ static int __init dm_init_init(void)
 		return 0;
 
 	if (strlen(create) >= DM_MAX_STR_SIZE) {
-		DMERR("Argument is too big. Limit is %d\n", DM_MAX_STR_SIZE);
+		DMERR("Argument is too big. Limit is %d", DM_MAX_STR_SIZE);
 		return -EINVAL;
 	}
 	str = kstrndup(create, GFP_KERNEL, DM_MAX_STR_SIZE);
@@ -283,7 +283,7 @@ static int __init dm_init_init(void)
 	if (r)
 		goto out;
 
-	DMINFO("waiting for all devices to be available before creating mapped devices\n");
+	DMINFO("waiting for all devices to be available before creating mapped devices");
 	wait_for_device_probe();
 
 	list_for_each_entry(dev, &devices, list) {
-- 
Sent by a computer through tubes

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel
