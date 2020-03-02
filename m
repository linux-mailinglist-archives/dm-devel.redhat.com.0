Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id 234D31766C6
	for <lists+dm-devel@lfdr.de>; Mon,  2 Mar 2020 23:21:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1583187683;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=G+xpqQIBG6qevDRttp+DKb6H1JOq7m5udln0Zasy5i4=;
	b=YZNgWi1jKOvZhXB/ahh5q4xuIds3FWnlplS/SbIW3zrkvIpu1IAS0enlWtTNL/5jwuIS3w
	0xIEPmKQ+YvZ8MZg7rXMY31I9hnY/9NiO9oFwrzPdzBDrRKeR+VOkRQvuWmS1TFXDRmUcA
	LJZ8qV1lAFRGXU7+zm1u2y+N4Vxlfbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-435-SUfVnX5nNF2fqygQn6OK1g-1; Mon, 02 Mar 2020 17:21:20 -0500
X-MC-Unique: SUfVnX5nNF2fqygQn6OK1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 63376107ACCA;
	Mon,  2 Mar 2020 22:21:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 351BB5C21A;
	Mon,  2 Mar 2020 22:21:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id C32F318089CD;
	Mon,  2 Mar 2020 22:21:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 022MKxvq003583 for <dm-devel@listman.util.phx.redhat.com>;
	Mon, 2 Mar 2020 17:20:59 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 608542026D68; Mon,  2 Mar 2020 22:20:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 59D082026D67
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DCC4D80066D
	for <dm-devel@redhat.com>; Mon,  2 Mar 2020 22:20:56 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-413-_VGXpaRaMBOY-XDjdfX1Ug-1;
	Mon, 02 Mar 2020 17:20:55 -0500
X-MC-Unique: _VGXpaRaMBOY-XDjdfX1Ug-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 829C8B337;
	Mon,  2 Mar 2020 22:20:53 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Mon,  2 Mar 2020 23:20:23 +0100
Message-Id: <20200302222025.21022-3-mwilck@suse.com>
In-Reply-To: <20200302222025.21022-1-mwilck@suse.com>
References: <20200302222025.21022-1-mwilck@suse.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 022MKxvq003583
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH 2/4] tests/Makefile: allow setting DIO_TEST_DEV
	in the environment
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

This change has two effects: 1. no error message is printed if
the directio_test_dev file doesn't exist, and 2. DIO_TEST_DEV
can be set in the environment, or on the "make" command line.
It's still possible to set DIO_TEST_DEV via the directio_test_dev
file if preferred.

Signed-off-by: Martin Wilck <mwilck@suse.com>
---
 tests/Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/Makefile b/tests/Makefile
index 6e3e9ca2..5f6583a0 100644
--- a/tests/Makefile
+++ b/tests/Makefile
@@ -18,12 +18,14 @@ TESTS := uevent parser util dmevents hwtable blacklist unaligned vpd pgpolicy \
 .SILENT: $(TESTS:%=%.o)
 .PRECIOUS: $(TESTS:%=%-test)
 
-DIO_TEST_DEV = $(shell sed -n -e 's/^[[:space:]]*DIO_TEST_DEV[[:space:]]*=[[:space:]]*\([^[:space:]\#]\+\).*/\1/p' < directio_test_dev)
-
 all:	$(TESTS:%=%.out)
 
 # test-specific compiler flags
 # XYZ-test_FLAGS: Additional compiler flags for this test
+
+ifneq ($(wildcard directio_test_dev),)
+DIO_TEST_DEV = $(shell sed -n -e 's/^[[:space:]]*DIO_TEST_DEV[[:space:]]*=[[:space:]]*\([^[:space:]\#]\+\).*/\1/p' < directio_test_dev)
+endif
 ifneq ($(DIO_TEST_DEV),)
 directio-test_FLAGS := -DDIO_TEST_DEV=\"$(DIO_TEST_DEV)\"
 endif
-- 
2.25.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

