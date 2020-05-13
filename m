Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D75E31D2674
	for <lists+dm-devel@lfdr.de>; Thu, 14 May 2020 07:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589432846;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=9VHxATD350xcKti8ZqTHrIegeS1qhPVSNGh+XE7b6Fc=;
	b=DB2I4cjEyd5p8E54mHZFOWGaAXd8hdeS5tPYKyNZsOl1h6fJmzWWk2h0jIvK/b85JA2h8m
	gtk7COOJLjW8Etv12tckd7g9r2GzQZDnx94S9ntvOhOXgygbGjenS3k5ES56Cn/5RzTYbx
	swmAPyJinIWAAIzm6FIZHGGWllG0d5s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-TgCxmEO2PPOhDkDSwj-swA-1; Thu, 14 May 2020 01:07:22 -0400
X-MC-Unique: TgCxmEO2PPOhDkDSwj-swA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50B6C835B43;
	Thu, 14 May 2020 05:07:16 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E348160FB9;
	Thu, 14 May 2020 05:07:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id DE5A61809543;
	Thu, 14 May 2020 05:07:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04D8jqKd000318 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 13 May 2020 04:45:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 61C1D202683E; Wed, 13 May 2020 08:45:52 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5E1AB2026E1C
	for <dm-devel@redhat.com>; Wed, 13 May 2020 08:45:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 672EF185A78B
	for <dm-devel@redhat.com>; Wed, 13 May 2020 08:45:50 +0000 (UTC)
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-177-A8uTdh20OKGDW1JBvC7PzA-1; Wed, 13 May 2020 04:45:48 -0400
X-MC-Unique: A8uTdh20OKGDW1JBvC7PzA-1
Received: by mail-ot1-f68.google.com with SMTP id t3so12808581otp.3;
	Wed, 13 May 2020 01:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=rjRThKWwLHjSiY1+NCteWSC3vDWu7uuGh+ybOg02DgQ=;
	b=Sqo3i2upY4VFEOr1o8Yhj3kIJwWOS5i2lrcw86xcfFsbMcmKDRsNeWpLiADBCWCK5x
	c1S+0F/iGXAXXRDHYOchcTMUKfhxFHxvlgAm0lU6wsMgdZkiADEtPzjgHaqT03lccKwt
	kACksaj0Gynz7N6gI6iLB64GOGo4Ycc4dvMlvRtwfih7Jju75N/KxZlp+3YSjYQatzAp
	+gpBgBq+rlg41RgI7iVMvzMO41E6n8CJfVE4zpyheHeSzutTbFXmm2FhJIF9mB66pMIN
	kucpAKmVq6rfPD6NqZtp0Hdmvp9B3WfcZbzEa/9WhgiuGem67HNhiA1NZ3Oirm5wFbLP
	Icxw==
X-Gm-Message-State: AGi0PuY1TEzP6Te9+gxXEnnqvUNG4Xv6ftXSxg5aO4M+e+LPC6xFQG+S
	5IjJrsJLXhGvYpUlWFf/P/ksHVgC
X-Google-Smtp-Source: APiQypLanVlEHVKOR3y8IzYoz9O3q9YbxujP4Q41Y5F0JBoksXfgRXBaD+JzplS7hWUmFXTASnlq3g==
X-Received: by 2002:a9d:69c9:: with SMTP id v9mr20565203oto.267.1589359546632; 
	Wed, 13 May 2020 01:45:46 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
	by smtp.gmail.com with ESMTPSA id b19sm6004494oii.1.2020.05.13.01.45.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 13 May 2020 01:45:46 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Wed, 13 May 2020 01:45:22 -0700
Message-Id: <20200513084521.461116-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Thu, 14 May 2020 01:06:59 -0400
Cc: Nathan Chancellor <natechancellor@gmail.com>, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm zoned: Avoid 64-bit division error in
	dmz_fixup_devices
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When building arm32 allyesconfig:

ld.lld: error: undefined symbol: __aeabi_uldivmod
>>> referenced by dm-zoned-target.c
>>>               md/dm-zoned-target.o:(dmz_ctr) in archive drivers/built-in.a

dmz_fixup_devices uses DIV_ROUND_UP with variables of type sector_t. As
such, it should be using DIV_ROUND_UP_SECTOR_T, which handles this
automatically.

Fixes: 70978208ec91 ("dm zoned: metadata version 2")
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/md/dm-zoned-target.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/md/dm-zoned-target.c b/drivers/md/dm-zoned-target.c
index ea43f6892ced..9c4fd4b04878 100644
--- a/drivers/md/dm-zoned-target.c
+++ b/drivers/md/dm-zoned-target.c
@@ -803,8 +803,9 @@ static int dmz_fixup_devices(struct dm_target *ti)
 
 	if (reg_dev) {
 		reg_dev->zone_nr_sectors = zoned_dev->zone_nr_sectors;
-		reg_dev->nr_zones = DIV_ROUND_UP(reg_dev->capacity,
-						 reg_dev->zone_nr_sectors);
+		reg_dev->nr_zones =
+			DIV_ROUND_UP_SECTOR_T(reg_dev->capacity,
+					      reg_dev->zone_nr_sectors);
 		zoned_dev->zone_offset = reg_dev->nr_zones;
 	}
 	return 0;

base-commit: e098d7762d602be640c53565ceca342f81e55ad2
-- 
2.26.2

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

