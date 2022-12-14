Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8D964D1E1
	for <lists+dm-devel@lfdr.de>; Wed, 14 Dec 2022 22:39:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671053956;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=1pb4XUOvGcJEQZJtD8r27eonamHwE5o5zAVYvs1g0Es=;
	b=dab7E9h4whaKQRS4yc7LkQx7PIVZ2heR6NnoFus7DY8O0u2fiqlItd4ucIszeMEbKcyG1D
	gvWxSpGHVV20G0Qzuj9FscBaoGnv+mgKFekwXwVbBljv9wTe2EHQuLKNPHEewsKvE9bVdp
	vPb1WdUF6MbWGt0v9+gnTXQLKteDKzc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-306-UECFdc6NPmKoXt8PkSZUTw-1; Wed, 14 Dec 2022 16:39:03 -0500
X-MC-Unique: UECFdc6NPmKoXt8PkSZUTw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D74C0858F0E;
	Wed, 14 Dec 2022 21:39:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 262C41121314;
	Wed, 14 Dec 2022 21:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id BE9791946A61;
	Wed, 14 Dec 2022 21:38:46 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 694BB1946A42
 for <dm-devel@listman.corp.redhat.com>; Wed, 14 Dec 2022 21:38:25 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id A32A1400D79C; Wed, 14 Dec 2022 21:38:25 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8E29C40BC781;
 Wed, 14 Dec 2022 21:38:25 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2BELcORk014967;
 Wed, 14 Dec 2022 15:38:24 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2BELcNHp014966;
 Wed, 14 Dec 2022 15:38:23 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 14 Dec 2022 15:38:19 -0600
Message-Id: <1671053900-14923-3-git-send-email-bmarzins@redhat.com>
In-Reply-To: <1671053900-14923-1-git-send-email-bmarzins@redhat.com>
References: <1671053900-14923-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH V2 2/3] libmultipath: don't leak memory on
 invalid strings
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If set_path() or set_str_noslash() are called with a bad value, they
ignore it and continue to use the old value. But they weren't freeing
the bad value, causing a memory leak.

Signed-off-by: Benjamin Marzinski <bmarzins@redhat.com>
---
 libmultipath/dict.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/libmultipath/dict.c b/libmultipath/dict.c
index 97f43387..f4233882 100644
--- a/libmultipath/dict.c
+++ b/libmultipath/dict.c
@@ -130,6 +130,7 @@ set_path(vector strvec, void *ptr, const char *file, int line_nr)
 	if ((*str_ptr)[0] != '/'){
 		condlog(1, "%s line %d, %s is not an absolute path. Ignoring",
 			file, line_nr, *str_ptr);
+		free(*str_ptr);
 		*str_ptr = old_str;
 	} else
 		free(old_str);
@@ -150,6 +151,7 @@ set_str_noslash(vector strvec, void *ptr, const char *file, int line_nr)
 	if (strchr(*str_ptr, '/')) {
 		condlog(1, "%s line %d, %s cannot contain a slash. Ignoring",
 			file, line_nr, *str_ptr);
+		free(*str_ptr);
 		*str_ptr = old_str;
 	} else
 		free(old_str);
-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

