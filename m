Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 722AD64D1E0
	for <lists+dm-devel@lfdr.de>; Wed, 14 Dec 2022 22:39:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1671053947;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=hK4N2WlO/Bn1RVti9VOOrLioTvvKoPxJtdEsU/HFQ5U=;
	b=h3MDFAn8ebPte/L6eAxGkyW1XU59gyKRgBYGg27ymAO7wLOIQrgouZiVo9vxmc+9uSrHBf
	nVEzYaAEDFx9D0o+2rCizun+9CjXS5pSKZxzu8yPAoVVWtHOAy47VWCluZy14DnGaVN3mI
	UnVXWbK60TCg1aRK28NZU4yIj3X2jlY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-N9m6ecw5PzO8TPvaJn9fEw-1; Wed, 14 Dec 2022 16:39:03 -0500
X-MC-Unique: N9m6ecw5PzO8TPvaJn9fEw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8A29280BCA2;
	Wed, 14 Dec 2022 21:39:00 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6ABD440C200F;
	Wed, 14 Dec 2022 21:38:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 0A5C11946A69;
	Wed, 14 Dec 2022 21:38:47 +0000 (UTC)
X-Original-To: dm-devel@listman.corp.redhat.com
Delivered-To: dm-devel@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 64D9019465B9
 for <dm-devel@listman.corp.redhat.com>; Wed, 14 Dec 2022 21:38:23 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 27D5E400D796; Wed, 14 Dec 2022 21:38:23 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from octiron.msp.redhat.com (octiron.msp.redhat.com [10.15.80.209])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0FF4A40C945A;
 Wed, 14 Dec 2022 21:38:23 +0000 (UTC)
Received: from octiron.msp.redhat.com (localhost.localdomain [127.0.0.1])
 by octiron.msp.redhat.com (8.14.9/8.14.9) with ESMTP id 2BELcLdx014959;
 Wed, 14 Dec 2022 15:38:21 -0600
Received: (from bmarzins@localhost)
 by octiron.msp.redhat.com (8.14.9/8.14.9/Submit) id 2BELcLqR014958;
 Wed, 14 Dec 2022 15:38:21 -0600
From: Benjamin Marzinski <bmarzins@redhat.com>
To: Christophe Varoqui <christophe.varoqui@opensvc.com>
Date: Wed, 14 Dec 2022 15:38:17 -0600
Message-Id: <1671053900-14923-1-git-send-email-bmarzins@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Subject: [dm-devel] [PATCH V2 0/3] multipath config fixes
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
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The first two patches are a cleanup and a fix for a memory leak in the
config code. The third patch improves multipath's validation of the
strings it passes directly into the table, features, path_selector, and
hardware_handler.  These three strings all have argument counts, and
getting them wrong causes the kernel to parse the table incorrectly.
When this happens the table load fails, but the error messages from the
kernel are often completely unhelpful.  A bad argument count will cause
the rest of the table to be parsed incorrectly, and the kernel might not
hit an unworkable token till later in the parsing.  Multipath now makes
sure that the count matches the actual number of arguments that it is
passing.

V2 Changes (based on suggestions from Martin Wilck):
1/3: unrolled loop in validate_config_strvec() to explicitly check the
      possible quote strings
3/3: spaces is now a "const char * const" and doesn't include '\n'


Benjamin Marzinski (3):
  libmpathutil: simplify set_value and validate_config_strvec
  libmultipath: don't leak memory on invalid strings
  libmutipath: validate the argument count of config strings

 libmpathutil/parser.c | 109 +++++++++++++++++++---------------------
 libmultipath/dict.c   | 112 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 154 insertions(+), 67 deletions(-)

-- 
2.17.2

--
dm-devel mailing list
dm-devel@redhat.com
https://listman.redhat.com/mailman/listinfo/dm-devel

