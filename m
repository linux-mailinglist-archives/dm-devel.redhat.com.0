Return-Path: <dm-devel-bounces@redhat.com>
X-Original-To: lists+dm-devel@lfdr.de
Delivered-To: lists+dm-devel@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 42D30252AF8
	for <lists+dm-devel@lfdr.de>; Wed, 26 Aug 2020 12:00:32 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-542-HR7Vvd6kPFKqLjYxXg6gsA-1; Wed, 26 Aug 2020 06:00:28 -0400
X-MC-Unique: HR7Vvd6kPFKqLjYxXg6gsA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4BFD7640C2;
	Wed, 26 Aug 2020 10:00:23 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2AEA27C644;
	Wed, 26 Aug 2020 10:00:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D1E71668F5;
	Wed, 26 Aug 2020 10:00:22 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 07QA00m8032466 for <dm-devel@listman.util.phx.redhat.com>;
	Wed, 26 Aug 2020 06:00:01 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 2D9E62142F4F; Wed, 26 Aug 2020 09:59:59 +0000 (UTC)
Delivered-To: dm-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 218662157F25
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B56480D658
	for <dm-devel@redhat.com>; Wed, 26 Aug 2020 09:59:53 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-450-9hW22KSEMLGpx514NsRwvg-1;
	Wed, 26 Aug 2020 05:59:48 -0400
X-MC-Unique: 9hW22KSEMLGpx514NsRwvg-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 92BDDABEA;
	Wed, 26 Aug 2020 10:00:18 +0000 (UTC)
From: mwilck@suse.com
To: Christophe Varoqui <christophe.varoqui@opensvc.com>,
	Benjamin Marzinski <bmarzins@redhat.com>
Date: Wed, 26 Aug 2020 11:58:57 +0200
Message-Id: <20200826095907.5576-1-mwilck@suse.com>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false;
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 07QA00m8032466
X-loop: dm-devel@redhat.com
Cc: dm-devel@redhat.com, Martin Wilck <mwilck@suse.com>
Subject: [dm-devel] [PATCH v2 00/10] multipath-tools: valgrind tests & fixes
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dm-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Martin Wilck <mwilck@suse.com>

Hi Christophe and Ben,

this series  adds a make target to run unit tests under valgrind, and fixes
the issues I found using this test target.

It contains the patches I sent yesterday ([PATCH 1/5] multipath-tools tests:
fix memory leak in alias test), but in a different order / numbering,
which seems more appropriate now.

Regards,
Martin

Martin Wilck (10):
  multipath-tools: Makefile.inc: fix compilation with gcc 4.x
  multipath-tools: Makefile: add "valgrind-test" target
  multipath-tools tests: fix memory leak in alias test
  multipath-tools tests: fix memory leak in hwtable test
  multipath-tools tests: fix memory leak in vpd test
  libmultipath: fix memory leak in ble handlers
  libmultipath: fix enable_foreign memory leak
  libmultipath: fix invalid memory access in is_token()
  libmultipath: alloc_strvec: NULL-initialize strvec elements
  libmultipath: validate_config_strvec(): avoid out-of-bounds access

 Makefile              |  3 +++
 Makefile.inc          |  2 +-
 libmultipath/config.c |  2 ++
 libmultipath/dict.c   | 12 +++++++++---
 libmultipath/parser.c | 17 +++++++++++------
 multipath/main.c      |  2 +-
 tests/Makefile        | 13 +++++++++++--
 tests/README.md       |  8 ++++++++
 tests/alias.c         |  2 ++
 tests/hwtable.c       |  4 ++++
 tests/vpd.c           | 18 ++++++++----------
 11 files changed, 60 insertions(+), 23 deletions(-)

-- 
2.28.0


--
dm-devel mailing list
dm-devel@redhat.com
https://www.redhat.com/mailman/listinfo/dm-devel

