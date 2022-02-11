Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 162954B44C7
	for <lists+dm-devel@lfdr.de>; Mon, 14 Feb 2022 09:48:26 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-134-uV31chPCPZ-uV7vfngH8eA-1; Mon, 14 Feb 2022 03:48:21 -0500
X-MC-Unique: uV31chPCPZ-uV7vfngH8eA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3856189DF42;
	Mon, 14 Feb 2022 08:48:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 00A1655F5C;
	Mon, 14 Feb 2022 08:48:15 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 555171809CB8;
	Mon, 14 Feb 2022 08:48:03 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
	[10.11.54.8])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 21BCFnZp008089 for <dm-devel@listman.util.phx.redhat.com>;
	Fri, 11 Feb 2022 07:15:49 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 78445C202C6; Fri, 11 Feb 2022 12:15:49 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 748D5C19149
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 12:15:49 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BF42811E7A
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 12:15:49 +0000 (UTC)
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com
	[209.85.216.73]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-456-yBKMsS3jOtWMBAGYd-XBug-1; Fri, 11 Feb 2022 07:15:45 -0500
X-MC-Unique: yBKMsS3jOtWMBAGYd-XBug-1
Received: by mail-pj1-f73.google.com with SMTP id
	ay10-20020a17090b030a00b001b8a4029ba0so8135523pjb.5
	for <dm-devel@redhat.com>; Fri, 11 Feb 2022 04:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
	bh=dHcRBMyYOzUwhslp5JRE655B9xCzIebKFjgXEXXATO4=;
	b=lmTF8XLwl4jbODrIwctyX+TWPg+IqHjWas9pNdAHGJMuv1clKOexDnFlb2ptEKSDha
	lwlmOLlEBkIWIwOqvN8ZyVJw0/dQjGQb95OJtaw28kONbbTa9A2J2uXoK5avqIHHVyaC
	uL7Ukm/fuK1DUH7aQZjHHKKaRqOi4IidwKA5AWHV6Bcw5MA7WbSToy1MW5Y/rMTwFsf9
	OIV1yoamZTwkJ7iNXv/n83FsZ0x57CZ8pAj5wA/MfTymRMfKkQ1yBmK9X3FU/SvR/i+i
	IGoqEZxNJECM3TFnfC6l7qaHRbTj9Cmj3jgx4N4+rojAU33M81GrKQPabaSnXynK6Mxk
	kliQ==
X-Gm-Message-State: AOAM533B+xQ9jS6lbiA724x2EfK3E/hYJYHKsIIV1BVNMMhUNaZO1i6r
	1nPrRxLO8p3rsEx4/Ncgg+oAygrfW2UE
X-Google-Smtp-Source: ABdhPJy7sBPtRxK0skNt82llh8Dm6SEUyT6OPVuRpGC7qERJhH/4cznimN+5yN/os6Q6UDXSavGQkZ2g6g+7
X-Received: from ezekiel.c.googlers.com
	([fda3:e722:ac3:cc00:4f:4b78:c0a8:108e])
	(user=shraash job=sendgmr) by 2002:a17:90a:e7ce:: with SMTP id
	kb14mr75272pjb.202.1644581744235; Fri, 11 Feb 2022 04:15:44 -0800 (PST)
Date: Fri, 11 Feb 2022 12:15:38 +0000
Message-Id: <20220211121538.1636240-1-shraash@google.com>
Mime-Version: 1.0
From: Aashish Sharma <shraash@google.com>
To: Alasdair Kergon <agk@redhat.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-loop: dm-devel@redhat.com
X-Mailman-Approved-At: Mon, 14 Feb 2022 03:47:51 -0500
Cc: groeck@chromium.org, Aashish Sharma <shraash@google.com>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	Mike Snitzer <snitzer@redhat.com>
Subject: [dm-devel] [PATCH] dm crypt: fixed compiler warning in conditional
	expression
X-BeenThere: dm-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: device-mapper development <dm-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/dm-devel>
List-Post: <mailto:dm-devel@redhat.com>
List-Help: <mailto:dm-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/dm-devel>,
	<mailto:dm-devel-request@redhat.com?subject=subscribe>
Sender: dm-devel-bounces@redhat.com
Errors-To: dm-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Explicitly converting unsigned int in the right of the
conditional expression to int to match the left side operand
and the return type, fixing the following compiler warning:

drivers/md/dm-crypt.c:2593:43: warning: signed and unsigned
type in conditional expression [-Wsign-compare]

Signed-off-by: Aashish Sharma <shraash@google.com>
---
 drivers/md/dm-crypt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
index d4ae31558826..489b23cb37c3 100644
--- a/drivers/md/dm-crypt.c
+++ b/drivers/md/dm-crypt.c
@@ -2590,7 +2590,8 @@ static int crypt_set_keyring_key(struct crypt_config *cc, const char *key_string
 
 static int get_key_size(char **key_string)
 {
-	return (*key_string[0] == ':') ? -EINVAL : strlen(*key_string) >> 1;
+	return (*key_string[0] == ':') ? -EINVAL
+				: (int)(strlen(*key_string) >> 1);
 }
 
 #endif /* CONFIG_KEYS */
-- 
2.35.1.265.g69c8d7142f-goog

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

