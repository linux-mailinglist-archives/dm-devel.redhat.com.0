Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id E6192E457D
	for <lists+dm-devel@lfdr.de>; Fri, 25 Oct 2019 10:21:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571991673;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=NfRNGQrksQIonmmilyEsLgE1qKj0sPeo2Nf8/41H3H4=;
	b=DGxvw0/lLmTgGh9zNhsuWOObvsyspn42h1WwVL+1ZeMMvKrhg5DpjE1TzI2gWvSOx9i6AT
	fsU+4Pg0O7X2QVvgq1ui+POjKNDFNXMUT9RNK1WfTRY/+kwlbIe5ly6QgVPjHKoII+7CHn
	35uK58clz5dUjiYYhaP2RCW7TeRk/Pc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-jYLUyFwUPneZ5n3HS4PGzQ-1; Fri, 25 Oct 2019 04:21:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C8F7801E5F;
	Fri, 25 Oct 2019 08:21:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 307F75DA8D;
	Fri, 25 Oct 2019 08:20:59 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7022D3FB42;
	Fri, 25 Oct 2019 08:20:44 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9OKSVtr017730 for <dm-devel@listman.util.phx.redhat.com>;
	Thu, 24 Oct 2019 16:28:31 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5AC995C1D4; Thu, 24 Oct 2019 20:28:31 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mx1.redhat.com (ext-mx26.extmail.prod.ext.phx2.redhat.com
	[10.5.110.67])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BA6E05C1B5;
	Thu, 24 Oct 2019 20:28:26 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A23398980E0;
	Thu, 24 Oct 2019 20:28:25 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b16so147779otk.9;
	Thu, 24 Oct 2019 13:28:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KysFzCyCbt68rgdhcTAXFckqnl9oeL9f+lH7yDmTZls=;
	b=CMKCuy3HiGWt6Rc5w9xcvvZKFqYS7Q0vdoL2NCHDGhkOCpPLmUDSoSp/Kznf+C+Ekf
	a/nswk7J1Ck1MWjK6ekmFNWign7Sk3MDHZPQAtGULQ6jFJmWrU1GpuYN7zmqUlQaI/ch
	ao7KeC9yXC71sQGRXZJMNwydpa5L9aG7OWFiQ9GCT+1EJuaYcOHxY9jyAr1Qa00qYJwX
	A8VFzesS78UBTeOyICaDB7fNSt77sHd07ZctGBVKbXajAG2uEfE5Op0fb6zOIRwTkhOL
	Cz5AQs7YdwE5lkREH5kJYdU4Avrvgo19WPIXP3jXl7mLe6++lTDJAjIgWVHgaTXrr8+J
	OeFA==
X-Gm-Message-State: APjAAAXgmE5sEJLBGVYM+68U00XpfK33pj8kfSEBDdF2Po36IBL5gOL4
	yepe8TM6Li+17pM9+ycxAu+qN5yx
X-Google-Smtp-Source: APXvYqxd/Sg0RqJm/x1OkLzHXUE9zdsuT53cXiG9gAPHJRKTgzfFCRu6o9SPuvDT7vUXP3nmSOdwOw==
X-Received: by 2002:a9d:3dca:: with SMTP id l68mr9689115otc.269.1571948904809; 
	Thu, 24 Oct 2019 13:28:24 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::1])
	by smtp.gmail.com with ESMTPSA id
	p184sm1101963oia.11.2019.10.24.13.28.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 24 Oct 2019 13:28:23 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@redhat.com>
Date: Thu, 24 Oct 2019 13:28:03 -0700
Message-Id: <20191024202803.47613-1-natechancellor@gmail.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
	(mx1.redhat.com [10.5.110.67]);
	Thu, 24 Oct 2019 20:28:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.67]);
	Thu, 24 Oct 2019 20:28:25 +0000 (UTC) for IP:'209.85.210.65'
	DOMAIN:'mail-ot1-f65.google.com' HELO:'mail-ot1-f65.google.com'
	FROM:'natechancellor@gmail.com' RCPT:''
X-RedHat-Spam-Score: -0.097  (DKIM_SIGNED, DKIM_VALID, DKIM_VALID_AU,
	FREEMAIL_FROM, RCVD_IN_DNSWL_NONE, RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
	SPF_PASS) 209.85.210.65 mail-ot1-f65.google.com 209.85.210.65
	mail-ot1-f65.google.com <natechancellor@gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.67
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 04:20:32 -0400
Cc: Nathan Chancellor <natechancellor@gmail.com>,
	clang-built-linux@googlegroups.com, dm-devel@redhat.com,
	linux-kernel@vger.kernel.org
Subject: [dm-devel] [PATCH] dm raid: Remove unnecessary negation of a shift
	in raid10_format_to_md_layout
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: jYLUyFwUPneZ5n3HS4PGzQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When building with Clang + -Wtautological-constant-compare:

 drivers/md/dm-raid.c:619:8: warning: converting the result of '<<' to a
 boolean always evaluates to true [-Wtautological-constant-compare]
                 r = !RAID10_OFFSET;
                      ^
 drivers/md/dm-raid.c:517:28: note: expanded from macro 'RAID10_OFFSET'
 #define RAID10_OFFSET                   (1 << 16) /* stripes with data
 copies area adjacent on devices */
                                           ^
 1 warning generated.

Negating a non-zero number will always make it zero, which is the
default value of r in this function so this statement is unnecessary;
remove it so that clang no longer warns.

Link: https://github.com/ClangBuiltLinux/linux/issues/753
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---
 drivers/md/dm-raid.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/md/dm-raid.c b/drivers/md/dm-raid.c
index b0aa595e4375..13fabc6779e5 100644
--- a/drivers/md/dm-raid.c
+++ b/drivers/md/dm-raid.c
@@ -616,7 +616,6 @@ static int raid10_format_to_md_layout(struct raid_set *rs,
 
 	} else if (algorithm == ALGORITHM_RAID10_FAR) {
 		f = copies;
-		r = !RAID10_OFFSET;
 		if (!test_bit(__CTR_FLAG_RAID10_USE_NEAR_SETS, &rs->ctr_flags))
 			r |= RAID10_USE_FAR_SETS;
 
-- 
2.24.0.rc1

--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

